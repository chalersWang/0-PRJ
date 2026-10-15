// ============================================================================
// 文件    : sdram_seq_item.svh
// 功能    : SDRAM 命令/数据事务（UVM sequence item）
//           命令编码与 JEDEC SDR SDRAM / DW_memctl 一致：
//           NOP / ACT / READ / WRITE / PRECHARGE / AUTO_REFRESH /
//           MRS / BURST_TERMINATE / 自刷新进入与退出
// ============================================================================

typedef enum logic [3:0] {
  SDRAM_NOP,
  SDRAM_ACT,
  SDRAM_READ,
  SDRAM_WRITE,
  SDRAM_PRECHARGE,
  SDRAM_AUTO_REFRESH,
  SDRAM_MRS,
  SDRAM_BURST_TERMINATE,
  SDRAM_SELF_REFRESH_ENTER,
  SDRAM_SELF_REFRESH_EXIT
} sdram_cmd_e;

class sdram_seq_item extends uvm_sequence_item;

  `uvm_object_utils(sdram_seq_item)

  // ---- 命令字段 ------------------------------------------------------------
  rand sdram_cmd_e                  cmd;
  rand bit [BANK_ADDR_WIDTH-1:0]    bank;            // Bank 地址
  rand bit [ROW_ADDR_WIDTH-1:0]     row;             // 行地址（ACT）
  rand bit [COL_ADDR_WIDTH-1:0]     col;             // 列地址（RD/WR）
  rand bit                          auto_precharge;  // A10：自动预充电
  rand bit [13:0]                   mode_reg_val;    // MRS 数据（含保留位）
  rand logic [DATA_WIDTH-1:0]       wdata[];         // 写数据（WRITE 突发）
  rand logic [DATA_WIDTH/8-1:0]     dqm[];           // 写掩码（与 wdata 等长）
  rand int                          delay;           // 命令前插入的 NOP 拍数

  // 读返回数据（monitor 收集 / driver 应答）
  logic [DATA_WIDTH-1:0]            rdata[];
  int                               rdata_count;

  // ---- 约束 ----------------------------------------------------------------
  constraint c_cmd {
    cmd inside {SDRAM_READ, SDRAM_WRITE, SDRAM_ACT, SDRAM_PRECHARGE,
                SDRAM_AUTO_REFRESH, SDRAM_MRS, SDRAM_NOP};
  }
  constraint c_delay {
    delay inside {[0:4]};
  }
  constraint c_wdata_size {
    wdata.size() inside {[1:8]};
    dqm.size()  == wdata.size();
  }
  constraint c_default_ap {
    auto_precharge == 1'b0;
  }

  // ---- 函数 ----------------------------------------------------------------

  function new(string name = "sdram_seq_item");
    super.new(name);
    rdata_count = 0;
  endfunction

  function string cmd2str(sdram_cmd_e c);
    case (c)
      SDRAM_NOP:               return "NOP";
      SDRAM_ACT:               return "ACT";
      SDRAM_READ:              return "READ";
      SDRAM_WRITE:             return "WRITE";
      SDRAM_PRECHARGE:         return "PRECHARGE";
      SDRAM_AUTO_REFRESH:      return "AUTO_REFRESH";
      SDRAM_MRS:               return "MRS";
      SDRAM_BURST_TERMINATE:   return "BURST_TERMINATE";
      SDRAM_SELF_REFRESH_ENTER: return "SELF_REFRESH_ENTER";
      SDRAM_SELF_REFRESH_EXIT:  return "SELF_REFRESH_EXIT";
      default:                 return "UNKNOWN";
    endcase
  endfunction

  function string convert2string();
    string s;
    s = $sformatf("cmd=%s bank=%0d", cmd2str(cmd), bank);
    case (cmd)
      SDRAM_ACT:  s = {s, $sformatf(" row=%0d", row)};
      SDRAM_READ,
      SDRAM_WRITE: s = {s, $sformatf(" col=%0d ap=%0b n=%0d", col, auto_precharge, wdata.size())};
      SDRAM_MRS:  s = {s, $sformatf(" mode_reg=0x%0h", mode_reg_val)};
      default: ;
    endcase
    return s;
  endfunction

  function void do_copy(uvm_object rhs);
    sdram_seq_item r;
    super.do_copy(rhs);
    if (!$cast(r, rhs)) return;
    cmd            = r.cmd;
    bank           = r.bank;
    row            = r.row;
    col            = r.col;
    auto_precharge = r.auto_precharge;
    mode_reg_val   = r.mode_reg_val;
    wdata          = r.wdata;
    dqm            = r.dqm;
    delay          = r.delay;
    rdata          = r.rdata;
    rdata_count    = r.rdata_count;
  endfunction

  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    sdram_seq_item r;
    if (!$cast(r, rhs)) return 0;
    if (!super.do_compare(rhs, comparer)) return 0;
    if (!(cmd == r.cmd && bank == r.bank && row == r.row && col == r.col &&
          auto_precharge == r.auto_precharge && mode_reg_val == r.mode_reg_val))
      return 0;
    // 动态数组不可直接 ==，逐元素比较
    if (wdata.size() != r.wdata.size()) return 0;
    if (dqm.size()   != r.dqm.size())   return 0;
    if (rdata.size() != r.rdata.size()) return 0;
    foreach (wdata[i]) if (wdata[i] !== r.wdata[i]) return 0;
    foreach (dqm[i])   if (dqm[i]   !== r.dqm[i])   return 0;
    foreach (rdata[i]) if (rdata[i] !== r.rdata[i]) return 0;
    if (rdata_count != r.rdata_count) return 0;
    return 1;
  endfunction

  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_string("cmd", cmd2str(cmd));
    printer.print_field("bank", bank, $bits(bank), UVM_HEX);
    if (cmd == SDRAM_ACT)
      printer.print_field("row", row, $bits(row), UVM_HEX);
    if (cmd == SDRAM_READ || cmd == SDRAM_WRITE) begin
      printer.print_field("col", col, $bits(col), UVM_HEX);
      printer.print_field("auto_precharge", auto_precharge, 1, UVM_BIN);
      printer.print_field("n_data", wdata.size(), 8, UVM_DEC);
    end
    if (cmd == SDRAM_MRS)
      printer.print_field("mode_reg_val", mode_reg_val, 14, UVM_HEX);
  endfunction

endclass
