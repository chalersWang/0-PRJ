// ============================================================================
// 文件    : sdram_monitor.svh
// 功能    : SDRAM 总线监控器（UVM monitor）
//           在每个时钟沿采样 SDRAM 命令总线，解码为 sdram_seq_item 事务；
//           READ 命令按 CAS 延迟收集读数据、WRITE 命令按突发收集写数据，
//           数据收集完整后经 analysis port 发出。
// 用途    : 被动观察控制器（DUT）与 SDRAM 模型之间的总线流量，
//           供 scoreboard / coverage / reference model 使用。
// ============================================================================

class sdram_monitor extends uvm_monitor;

  `uvm_component_utils(sdram_monitor)

  virtual sdram_if vif;
  sdram_config     cfg;
  uvm_analysis_port #(sdram_seq_item) ap;

  // ---- 数据收集状态 --------------------------------------------------------
  sdram_seq_item pend;        // 正在收集的事务
  int            pend_latency;// READ: CAS 延迟倒计时
  int            pend_remain; // 剩余数据个数
  bit            collecting;  // 正在收集数据

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual sdram_if)::get(this, "", "sdram_vif", vif))
      `uvm_fatal(get_type_name(), "virtual interface (sdram_vif) not found in config_db")
    if (!uvm_config_db#(sdram_config)::get(this, "", "sdram_config", cfg))
      `uvm_fatal(get_type_name(), "sdram_config (sdram_config) not found in config_db")
    ap = new("ap", this);
  endfunction

  task reset_phase(uvm_phase phase);
    super.reset_phase(phase);
    collecting = 0;
    pend = null;
  endtask

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      sample_cmd();
      sample_data();
    end
  endtask

  // ---- 命令采样 --------------------------------------------------------------
  task sample_cmd();
    sdram_cmd_e c;
    // 数据收集期间忽略新命令（SDR 单命令总线；连续突发不在此监控范围）
    if (collecting) return;
    c = decode_cmd(vif.s_sel_n, vif.s_ras_n, vif.s_cas_n, vif.s_we_n);
    if (c == SDRAM_NOP) return;

    pend = sdram_seq_item::type_id::create("pend");
    pend.bank = vif.s_bank_addr;
    pend.cmd  = c;

    case (c)
      SDRAM_ACT: begin
        pend.row = vif.s_addr[ROW_ADDR_WIDTH-1:0];
        ap.write(pend);
        pend = null;
      end
      SDRAM_READ: begin
        pend.col = vif.s_addr[COL_ADDR_WIDTH-1:0];
        pend.auto_precharge = vif.s_addr[10];
        collecting  = 1;
        pend_latency = cfg.cl;
        pend_remain  = cfg.bl;
        pend.rdata   = new[cfg.bl];
        pend.rdata_count = 0;
        if (cfg.print_cmd)
          `uvm_info(get_type_name(), $sformatf("mon READ bank=%0d col=%0d CL=%0d",
                                               pend.bank, pend.col, cfg.cl), UVM_HIGH)
      end
      SDRAM_WRITE: begin
        pend.col = vif.s_addr[COL_ADDR_WIDTH-1:0];
        pend.auto_precharge = vif.s_addr[10];
        pend.wdata = new[cfg.bl];
        pend.dqm   = new[cfg.bl];
        collecting = 1;
        pend_remain = cfg.bl - 1;     // 命令拍已采样第一笔
        pend.wdata[0] = vif.s_wr_data;
        pend.dqm[0]   = vif.s_dqm;
        if (cfg.print_cmd)
          `uvm_info(get_type_name(), $sformatf("mon WRITE bank=%0d col=%0d BL=%0d",
                                               pend.bank, pend.col, cfg.bl), UVM_HIGH)
      end
      SDRAM_PRECHARGE: begin
        pend.auto_precharge = vif.s_addr[10];   // A10=1 表示全 bank
        ap.write(pend);
        pend = null;
      end
      SDRAM_AUTO_REFRESH, SDRAM_MRS, SDRAM_BURST_TERMINATE: begin
        if (c == SDRAM_MRS)
          pend.mode_reg_val = {1'b0, vif.s_addr};
        ap.write(pend);
        pend = null;
      end
      default:
        `uvm_info(get_type_name(), $sformatf("mon cmd %0s", pend.cmd2str(c)), UVM_HIGH)
    endcase
  endtask

  // ---- 数据采样 ---------------------------------------------------------------
  task sample_data();
    if (!collecting || pend == null) return;
    if (pend.cmd == SDRAM_READ) begin
      // CAS 延迟倒计时：命令拍 + CL 拍后出第一个数据
      if (pend_latency > 0) begin
        pend_latency--;
        return;   // 延迟未到，本拍不采样，使首个数据在 CL 拍后出现
      end
      pend.rdata[pend.rdata_count] = vif.s_rd_data;
      pend.rdata_count++;
      pend_remain--;
      if (pend_remain == 0) begin
        collecting = 0;
        ap.write(pend);
        pend = null;
      end
    end else if (pend.cmd == SDRAM_WRITE) begin
      // 写延迟 0：命令拍后每拍一个数据
      int idx = cfg.bl - pend_remain;
      pend.wdata[idx] = vif.s_wr_data;
      pend.dqm[idx]   = vif.s_dqm;
      pend_remain--;
      if (pend_remain == 0) begin
        collecting = 0;
        ap.write(pend);
        pend = null;
      end
    end
  endtask

  // ---- 命令解码（JEDEC；X/Z 按 NOP）---------------------------------------
  function sdram_cmd_e decode_cmd(input logic sel_n, ras_n, cas_n, we_n);
    if (sel_n !== 1'b0) return SDRAM_NOP;
    case ({ras_n, cas_n, we_n})
      3'b111: return SDRAM_NOP;
      3'b011: return SDRAM_ACT;
      3'b101: return SDRAM_READ;
      3'b100: return SDRAM_WRITE;
      3'b010: return SDRAM_PRECHARGE;
      3'b001: return SDRAM_AUTO_REFRESH;
      3'b000: return SDRAM_MRS;
      3'b110: return SDRAM_BURST_TERMINATE;
      default: return SDRAM_NOP;
    endcase
  endfunction

endclass
