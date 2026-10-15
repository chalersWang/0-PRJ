// ============================================================================
// 文件    : sdram_base_seq.svh
// 功能    : SDRAM 基础序列
//           sdram_init_seq         上电初始化（NOP×tINIT → PRE all →
//                                   AREF×n → MRS）
//           sdram_act_read_seq     ACT + tRCD → READ（支持自动预充电）
//           sdram_act_write_seq    ACT + tRCD → WRITE（支持自动预充电）
//           sdram_refresh_seq      周期自动刷新
//           sdram_sr_seq           自刷新进入/退出
// ============================================================================

// ---------------------------------------------------------------------------
// 上电初始化序列
// ---------------------------------------------------------------------------
class sdram_init_seq extends uvm_sequence #(sdram_seq_item);

  `uvm_object_utils(sdram_init_seq)

  rand int tinit;   // tINIT 稳定周期（NOP）
  rand int nref;    // 上电自动刷新次数
  rand bit [13:0] mode_reg_val;

  constraint c_tinit { tinit inside {[1:32]}; }
  constraint c_nref  { nref  inside {[1:16]}; }

  function new(string name = "sdram_init_seq");
    super.new(name);
    tinit        = 8;              // 手册默认 T_INIT=8
    nref         = 8;              // 手册默认 NUM_INIT_REF
    mode_reg_val = 14'h0032;       // BL=4(010) BT=0 CL=3(011)
  endfunction

  task body();
    sdram_seq_item it;

    // 1) NOP × tinit（CKE 在第一条 NOP 时由 driver 拉高）
    it = sdram_seq_item::type_id::create("init_nop");
    start_item(it);
    it.cmd   = SDRAM_NOP;
    it.delay = tinit - 1;
    finish_item(it);

    // 2) PRECHARGE ALL（A10=1），随后满足 tRP
    it = sdram_seq_item::type_id::create("init_pre");
    start_item(it);
    it.cmd            = SDRAM_PRECHARGE;
    it.auto_precharge = 1'b1;
    it.delay          = 2;               // 预留 tRP 余量
    finish_item(it);

    // 3) AUTO REFRESH × nref，间隔满足 tRC（模型默认 T_RC=7）
    repeat (nref) begin
      it = sdram_seq_item::type_id::create("init_aref");
      start_item(it);
      it.cmd   = SDRAM_AUTO_REFRESH;
      it.delay = 6;                      // NOP×6 + 命令拍 = 7 拍（>= tRC）
      finish_item(it);
    end

    // 4) LOAD MODE REGISTER（BL=4 顺序突发、CL=3）
    it = sdram_seq_item::type_id::create("init_mrs");
    start_item(it);
    it.cmd          = SDRAM_MRS;
    it.mode_reg_val = mode_reg_val;
    it.delay        = 1;
    finish_item(it);

    `uvm_info(get_type_name(), "SDRAM initialization sequence completed", UVM_LOW)
  endtask

endclass

// ---------------------------------------------------------------------------
// ACT + READ（自动预充电可选）
// ---------------------------------------------------------------------------
class sdram_act_read_seq extends uvm_sequence #(sdram_seq_item);

  `uvm_object_utils(sdram_act_read_seq)

  rand bit [BANK_ADDR_WIDTH-1:0] bank;
  rand bit [ROW_ADDR_WIDTH-1:0]  row;
  rand bit [COL_ADDR_WIDTH-1:0]  col;
  rand int  act_delay;    // ACT 前的 NOP 拍数（PRE 后 tRP 余量）
  rand int  rcd_nops;     // READ 前的 NOP 拍数（>= tRCD-1）
  rand bit  precharge_after;

  // 最近一次 READ 事务（含 driver 回填的读数据），供测试/记分板读取
  sdram_seq_item last_rd;

  constraint c_delay { act_delay inside {[0:8]}; rcd_nops inside {[2:8]}; }
  constraint c_ap    { precharge_after == 1'b1; }   // 默认读后自动预充电

  task body();
    sdram_seq_item it;

    it = sdram_seq_item::type_id::create("act");
    start_item(it);
    it.cmd   = SDRAM_ACT;
    it.bank  = bank;
    it.row   = row;
    it.delay = act_delay;
    finish_item(it);

    it = sdram_seq_item::type_id::create("rcd_nop");
    start_item(it);
    it.cmd   = SDRAM_NOP;
    it.delay = rcd_nops;          // 满足 tRCD
    finish_item(it);

    it = sdram_seq_item::type_id::create("rd");
    start_item(it);
    it.cmd            = SDRAM_READ;
    it.bank           = bank;
    it.col            = col;
    it.auto_precharge = precharge_after;
    it.delay          = 0;
    finish_item(it);
    last_rd = it;
  endtask

endclass

// ---------------------------------------------------------------------------
// ACT + WRITE（自动预充电可选）
// ---------------------------------------------------------------------------
class sdram_act_write_seq extends uvm_sequence #(sdram_seq_item);

  `uvm_object_utils(sdram_act_write_seq)

  rand bit [BANK_ADDR_WIDTH-1:0] bank;
  rand bit [ROW_ADDR_WIDTH-1:0]  row;
  rand bit [COL_ADDR_WIDTH-1:0]  col;
  rand logic [DATA_WIDTH-1:0]    wdata[];
  rand int  act_delay;
  rand int  rcd_nops;
  rand bit  precharge_after;

  constraint c_wdata { wdata.size() inside {[1:8]}; }
  constraint c_delay { act_delay inside {[0:8]}; rcd_nops inside {[2:8]}; }
  constraint c_ap    { precharge_after == 1'b1; }

  task body();
    sdram_seq_item it;

    it = sdram_seq_item::type_id::create("act");
    start_item(it);
    it.cmd   = SDRAM_ACT;
    it.bank  = bank;
    it.row   = row;
    it.delay = act_delay;
    finish_item(it);

    it = sdram_seq_item::type_id::create("rcd_nop");
    start_item(it);
    it.cmd   = SDRAM_NOP;
    it.delay = rcd_nops;
    finish_item(it);

    it = sdram_seq_item::type_id::create("wr");
    start_item(it);
    it.cmd            = SDRAM_WRITE;
    it.bank           = bank;
    it.col            = col;
    it.auto_precharge = precharge_after;
    it.wdata          = wdata;
    it.dqm            = new[wdata.size()];
    foreach (it.dqm[i]) it.dqm[i] = '0;   // 不掩码
    it.delay          = 0;
    finish_item(it);
  endtask

endclass

// ---------------------------------------------------------------------------
// 周期自动刷新
// ---------------------------------------------------------------------------
class sdram_refresh_seq extends uvm_sequence #(sdram_seq_item);

  `uvm_object_utils(sdram_refresh_seq)

  rand int n;
  rand int gap;
  constraint c_n    { n inside {[1:16]}; }
  constraint c_gap  { gap inside {[1:16]}; }

  task body();
    sdram_seq_item it;
    repeat (n) begin
      it = sdram_seq_item::type_id::create("aref");
      start_item(it);
      it.cmd   = SDRAM_AUTO_REFRESH;
      it.delay = gap;
      finish_item(it);
    end
  endtask

endclass

// ---------------------------------------------------------------------------
// 自刷新进入/退出
// ---------------------------------------------------------------------------
class sdram_sr_seq extends uvm_sequence #(sdram_seq_item);

  `uvm_object_utils(sdram_sr_seq)

  rand int hold;   // 自刷新保持的 NOP 拍数
  constraint c_hold { hold inside {[1:64]}; }

  task body();
    sdram_seq_item it;

    it = sdram_seq_item::type_id::create("sr_enter");
    start_item(it);
    it.cmd   = SDRAM_SELF_REFRESH_ENTER;
    it.delay = 0;
    finish_item(it);

    repeat (hold) begin
      it = sdram_seq_item::type_id::create("sr_hold_nop");
      start_item(it);
      it.cmd   = SDRAM_NOP;     // CKE=0 期间的 NOP（driver 保持 CKE=0）
      it.delay = 0;
      finish_item(it);
    end

    it = sdram_seq_item::type_id::create("sr_exit");
    start_item(it);
    it.cmd   = SDRAM_SELF_REFRESH_EXIT;
    it.delay = 0;
    finish_item(it);
  endtask

endclass
