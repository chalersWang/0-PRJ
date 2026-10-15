// ============================================================================
// 文件    : sdram_driver.svh
// 功能    : SDRAM 命令驱动器（UVM driver）
//           位于控制器一侧，按 sdram_seq_item 在接口上产生 JEDEC 命令时序，
//           可用于：
//           1) 独立验证 sdram_model 行为模型；
//           2) 验证环境下替代/驱动 SDRAM 总线（配合模型或外部从设备）。
// 时序    : 命令在时钟沿前 1step 输出（clocking output #1step），与模型
//           沿采样对齐；读数据在 CL 拍后采样（写延迟 0、读延迟 CL）。
// ============================================================================

class sdram_driver extends uvm_driver #(sdram_seq_item);

  `uvm_component_utils(sdram_driver)

  virtual sdram_if vif;
  sdram_config     cfg;
  bit              sr_mode;   // 自刷新模式：期间 NOP 保持 CKE=0

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual sdram_if)::get(this, "", "sdram_vif", vif))
      `uvm_fatal(get_type_name(), "virtual interface (sdram_vif) not found in config_db")
    if (!uvm_config_db#(sdram_config)::get(this, "", "sdram_config", cfg))
      `uvm_fatal(get_type_name(), "sdram_config (sdram_config) not found in config_db")
  endfunction

  task run_phase(uvm_phase phase);
    reset_signals();
    forever begin
      seq_item_port.get_next_item(req);
      drive_item(req);
      seq_item_port.item_done();
    end
  endtask

  // ---- 复位接口为 NOP 空闲状态 --------------------------------------------
  task reset_signals();
    @(posedge vif.clk);            // 先同步到时钟沿，再驱动默认值
    vif.drv_cb.s_cke       <= 1'b0;   // 上电：CKE 低（由 init_seq 拉高）
    vif.drv_cb.s_sel_n     <= 1'b1;   // 片选无效
    vif.drv_cb.s_ras_n     <= 1'b1;
    vif.drv_cb.s_cas_n     <= 1'b1;
    vif.drv_cb.s_we_n      <= 1'b1;
    vif.drv_cb.s_bank_addr <= '0;
    vif.drv_cb.s_addr      <= '0;
    vif.drv_cb.s_dqm       <= '0;
    vif.drv_cb.s_wr_data   <= '0;
    vif.drv_cb.s_dout_valid<= 1'b0;
  endtask

  // ---- 主驱动函数 ------------------------------------------------------------
  task drive_item(sdram_seq_item item);
    repeat (item.delay) drive_nop();   // 前导 NOP

    case (item.cmd)
      SDRAM_NOP:                drive_nop();
      SDRAM_ACT:                drive_act(item);
      SDRAM_READ:               drive_read(item);
      SDRAM_WRITE:              drive_write(item);
      SDRAM_PRECHARGE:          drive_precharge(item);
      SDRAM_AUTO_REFRESH:       drive_aref(item);
      SDRAM_MRS:                drive_mrs(item);
      SDRAM_BURST_TERMINATE:    drive_bst();
      SDRAM_SELF_REFRESH_ENTER: drive_sr_enter();
      SDRAM_SELF_REFRESH_EXIT:  drive_sr_exit();
      default: `uvm_error(get_type_name(), $sformatf("unsupported cmd %0s",
                                                     item.cmd2str(item.cmd)))
    endcase
  endtask

  // ---- 一拍 NOP --------------------------------------------------------------
  task drive_nop();
    @(posedge vif.clk);
    vif.drv_cb.s_cke       <= (sr_mode ? 1'b0 : 1'b1);
    vif.drv_cb.s_sel_n     <= 1'b1;
    vif.drv_cb.s_ras_n     <= 1'b1;
    vif.drv_cb.s_cas_n     <= 1'b1;
    vif.drv_cb.s_we_n      <= 1'b1;
    vif.drv_cb.s_dout_valid<= 1'b0;
  endtask

  // ---- ACT ----------------------------------------------------------------
  task drive_act(sdram_seq_item item);
    @(posedge vif.clk);
    vif.drv_cb.s_cke       <= 1'b1;
    vif.drv_cb.s_sel_n     <= 1'b0;
    vif.drv_cb.s_ras_n     <= 1'b0;   // ACT: RAS=0 CAS=1 WE=1
    vif.drv_cb.s_cas_n     <= 1'b1;
    vif.drv_cb.s_we_n      <= 1'b1;
    vif.drv_cb.s_bank_addr <= item.bank;
    vif.drv_cb.s_addr      <= item.row;   // ACT 时地址为行地址（低有效位）
    vif.drv_cb.s_dout_valid<= 1'b0;
    if (cfg.print_cmd)
      `uvm_info(get_type_name(), $sformatf("drive %0s", item.convert2string()), UVM_MEDIUM)
  endtask

  // ---- READ（命令一拍后回 NOP；CL 拍后采样读数据）-------------------------
  task drive_read(sdram_seq_item item);
    int n = cfg.bl;                       // 突发长度固定为 cfg.bl
    @(posedge vif.clk);
    vif.drv_cb.s_cke       <= 1'b1;
    vif.drv_cb.s_sel_n     <= 1'b0;
    vif.drv_cb.s_ras_n     <= 1'b1;
    vif.drv_cb.s_cas_n     <= 1'b0;   // READ: RAS=1 CAS=0 WE=1
    vif.drv_cb.s_we_n      <= 1'b1;
    vif.drv_cb.s_bank_addr <= item.bank;
    // A10(bit10)=auto_precharge，col 位于 A[8:0]（bit9 保留为 0）
    vif.drv_cb.s_addr      <= {{(ADDR_WIDTH-COL_ADDR_WIDTH-2){1'b0}},
                                item.auto_precharge, 1'b0, item.col};
    vif.drv_cb.s_dout_valid<= 1'b0;
    if (cfg.print_cmd)
      `uvm_info(get_type_name(), $sformatf("drive %0s", item.convert2string()), UVM_MEDIUM)

    // 命令拍后立刻回 NOP，避免命令保持被重复解码
    @(posedge vif.clk);
    vif.drv_cb.s_sel_n <= 1'b1;
    vif.drv_cb.s_ras_n <= 1'b1;
    vif.drv_cb.s_cas_n <= 1'b1;
    vif.drv_cb.s_we_n  <= 1'b1;

    // 等 CL 拍后采样第一个读数据（命令拍 + CL 拍）
    repeat (cfg.cl - 1) @(posedge vif.clk);
    item.rdata = new[n];
    for (int i = 0; i < n; i++) begin
      item.rdata[i] = vif.s_rd_data;   // posedge 后直读（NBA 更新后的值）
      @(posedge vif.clk);
    end
    item.rdata_count = n;
  endtask

  // ---- WRITE（写延迟 0：命令拍输出第一笔数据；后续拍保持 NOP + 数据）--------
  task drive_write(sdram_seq_item item);
    int n = cfg.bl;                     // 突发长度固定为 cfg.bl
    logic [DATA_WIDTH-1:0]   wq[];
    logic [DATA_WIDTH/8-1:0] dq[];

    wq = new[n];
    dq = new[n];
    // 以 cfg.bl 为准：不足补 0，多余截断
    for (int i = 0; i < n; i++) begin
      wq[i] = (i < item.wdata.size()) ? item.wdata[i] : '0;
      dq[i] = (i < item.dqm.size())   ? item.dqm[i]   : '0;
    end

    @(posedge vif.clk);
    vif.drv_cb.s_cke       <= 1'b1;
    vif.drv_cb.s_sel_n     <= 1'b0;
    vif.drv_cb.s_ras_n     <= 1'b1;
    vif.drv_cb.s_cas_n     <= 1'b0;
    vif.drv_cb.s_we_n      <= 1'b0;   // WRITE: RAS=1 CAS=0 WE=0
    vif.drv_cb.s_bank_addr <= item.bank;
    // A10(bit10)=auto_precharge，col 位于 A[8:0]
    vif.drv_cb.s_addr      <= {{(ADDR_WIDTH-COL_ADDR_WIDTH-2){1'b0}},
                                item.auto_precharge, 1'b0, item.col};
    vif.drv_cb.s_dqm       <= dq[0];
    vif.drv_cb.s_wr_data   <= wq[0];
    vif.drv_cb.s_dout_valid<= 1'b1;
    if (cfg.print_cmd)
      `uvm_info(get_type_name(), $sformatf("drive %0s", item.convert2string()), UVM_MEDIUM)

    for (int i = 1; i < n; i++) begin
      @(posedge vif.clk);
      // 保持 NOP（CS 无效），仅数据变化
      vif.drv_cb.s_sel_n     <= 1'b1;
      vif.drv_cb.s_ras_n     <= 1'b1;
      vif.drv_cb.s_cas_n     <= 1'b1;
      vif.drv_cb.s_we_n      <= 1'b1;
      vif.drv_cb.s_dqm       <= dq[i];
      vif.drv_cb.s_wr_data   <= wq[i];
      vif.drv_cb.s_dout_valid<= 1'b1;
    end
    @(posedge vif.clk);
    vif.drv_cb.s_dout_valid <= 1'b0;
  endtask

  // ---- PRECHARGE -----------------------------------------------------------
  task drive_precharge(sdram_seq_item item);
    @(posedge vif.clk);
    vif.drv_cb.s_cke       <= 1'b1;
    vif.drv_cb.s_sel_n     <= 1'b0;
    vif.drv_cb.s_ras_n     <= 1'b0;   // PRE: RAS=0 CAS=1 WE=0
    vif.drv_cb.s_cas_n     <= 1'b1;
    vif.drv_cb.s_we_n      <= 1'b0;
    vif.drv_cb.s_bank_addr <= item.bank;
    vif.drv_cb.s_addr      <= {{(ADDR_WIDTH-11){1'b0}}, item.auto_precharge, {10{1'b0}}};
    vif.drv_cb.s_dout_valid<= 1'b0;
    if (cfg.print_cmd)
      `uvm_info(get_type_name(), $sformatf("drive %0s", item.convert2string()), UVM_MEDIUM)
    @(posedge vif.clk);
    vif.drv_cb.s_sel_n <= 1'b1;
    vif.drv_cb.s_ras_n <= 1'b1;
    vif.drv_cb.s_cas_n <= 1'b1;
    vif.drv_cb.s_we_n  <= 1'b1;
  endtask

  // ---- AUTO REFRESH --------------------------------------------------------
  task drive_aref(sdram_seq_item item);
    @(posedge vif.clk);
    vif.drv_cb.s_cke       <= 1'b1;
    vif.drv_cb.s_sel_n     <= 1'b0;
    vif.drv_cb.s_ras_n     <= 1'b0;   // AREF: RAS=0 CAS=0 WE=1
    vif.drv_cb.s_cas_n     <= 1'b0;
    vif.drv_cb.s_we_n      <= 1'b1;
    vif.drv_cb.s_addr      <= '0;
    vif.drv_cb.s_dout_valid<= 1'b0;
    if (cfg.print_cmd)
      `uvm_info(get_type_name(), $sformatf("drive %0s", item.cmd2str(item.cmd)), UVM_MEDIUM)
    @(posedge vif.clk);
    vif.drv_cb.s_sel_n <= 1'b1;
    vif.drv_cb.s_ras_n <= 1'b1;
    vif.drv_cb.s_cas_n <= 1'b1;
    vif.drv_cb.s_we_n  <= 1'b1;
  endtask

  // ---- LOAD MODE REGISTER --------------------------------------------------
  task drive_mrs(sdram_seq_item item);
    @(posedge vif.clk);
    vif.drv_cb.s_cke       <= 1'b1;
    vif.drv_cb.s_sel_n     <= 1'b0;
    vif.drv_cb.s_ras_n     <= 1'b0;   // MRS: RAS=0 CAS=0 WE=0
    vif.drv_cb.s_cas_n     <= 1'b0;
    vif.drv_cb.s_we_n      <= 1'b0;
    vif.drv_cb.s_bank_addr <= '0;
    vif.drv_cb.s_addr      <= item.mode_reg_val[12:0];
    vif.drv_cb.s_dout_valid<= 1'b0;
    if (cfg.print_cmd)
      `uvm_info(get_type_name(), $sformatf("drive %0s", item.convert2string()), UVM_MEDIUM)
    @(posedge vif.clk);
    vif.drv_cb.s_sel_n <= 1'b1;
    vif.drv_cb.s_ras_n <= 1'b1;
    vif.drv_cb.s_cas_n <= 1'b1;
    vif.drv_cb.s_we_n  <= 1'b1;
  endtask

  // ---- BURST TERMINATE -----------------------------------------------------
  task drive_bst();
    @(posedge vif.clk);
    vif.drv_cb.s_cke       <= 1'b1;
    vif.drv_cb.s_sel_n     <= 1'b0;
    vif.drv_cb.s_ras_n     <= 1'b1;   // BST: RAS=1 CAS=1 WE=0
    vif.drv_cb.s_cas_n     <= 1'b1;
    vif.drv_cb.s_we_n      <= 1'b0;
    vif.drv_cb.s_dout_valid<= 1'b0;
    @(posedge vif.clk);
    vif.drv_cb.s_sel_n <= 1'b1;
    vif.drv_cb.s_we_n  <= 1'b1;
  endtask

  // ---- 自刷新进入（CKE 拉低 + AREF 命令）-----------------------------------
  task drive_sr_enter();
    @(posedge vif.clk);
    sr_mode        = 1'b1;
    vif.drv_cb.s_cke       <= 1'b0;   // CKE 拉低
    vif.drv_cb.s_sel_n     <= 1'b0;
    vif.drv_cb.s_ras_n     <= 1'b0;   // AREF 命令
    vif.drv_cb.s_cas_n     <= 1'b0;
    vif.drv_cb.s_we_n      <= 1'b1;
    vif.drv_cb.s_addr      <= '0;
    vif.drv_cb.s_dout_valid<= 1'b0;
    if (cfg.print_cmd)
      `uvm_info(get_type_name(), "drive SELF_REFRESH_ENTER", UVM_MEDIUM)
    @(posedge vif.clk);
    vif.drv_cb.s_sel_n <= 1'b1;
    vif.drv_cb.s_ras_n <= 1'b1;
    vif.drv_cb.s_cas_n <= 1'b1;
    vif.drv_cb.s_we_n  <= 1'b1;
  endtask

  // ---- 自刷新退出（CKE 拉高）------------------------------------------------
  task drive_sr_exit();
    @(posedge vif.clk);
    sr_mode        = 1'b0;
    vif.drv_cb.s_cke       <= 1'b1;
    vif.drv_cb.s_sel_n     <= 1'b1;   // NOP
    vif.drv_cb.s_dout_valid<= 1'b0;
    if (cfg.print_cmd)
      `uvm_info(get_type_name(), "drive SELF_REFRESH_EXIT", UVM_MEDIUM)
  endtask

endclass
