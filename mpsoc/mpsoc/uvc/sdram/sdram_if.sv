// ============================================================================
// 文件    : sdram_if.sv
// 功能    : SDRAM 接口（UVM virtual interface）
//           提供 driver / monitor 两个 clocking 域，接口信号与 DW_memctl
//           SDRAM 端口（s_*）及 sdram_model.sv 对齐。
// 使用    : 在 tb 顶层例化并连接 SDRAM 总线；通过 config_db 下发到
//           agent/driver/monitor。
// ============================================================================
interface sdram_if #(
  parameter int DATA_WIDTH      = 32,
  parameter int ROW_ADDR_WIDTH  = 13,
  parameter int COL_ADDR_WIDTH  = 9,
  parameter int BANK_ADDR_WIDTH = 2,
  parameter int ADDR_WIDTH      = 13
) (
  input logic clk
);

  // ---- 信号声明（与 DW_memctl s_* 对齐）-----------------------------------
  logic                                s_cke;
  logic                                s_sel_n;
  logic                                s_ras_n;
  logic                                s_cas_n;
  logic                                s_we_n;
  logic [BANK_ADDR_WIDTH-1:0]          s_bank_addr;
  logic [ADDR_WIDTH-1:0]               s_addr;
  logic [DATA_WIDTH/8-1:0]             s_dqm;
  logic [DATA_WIDTH-1:0]               s_wr_data;
  logic [DATA_WIDTH-1:0]               s_rd_data;
  logic                                s_dout_valid;   // 单 bit 数据有效指示

  // ---- driver clocking（命令发起侧，模拟控制器）----------------------------
  // output #1step：时钟沿前 1 step 驱动命令，与从设备（模型）沿采样对齐
  clocking drv_cb @(posedge clk);
    default input #1step output #1step;
    output s_cke, s_sel_n, s_ras_n, s_cas_n, s_we_n,
           s_bank_addr, s_addr, s_dqm, s_wr_data, s_dout_valid;
    input  s_rd_data;
  endclocking

  // ---- monitor clocking（总线观察侧）--------------------------------------
  clocking mon_cb @(posedge clk);
    default input #1step;
    input s_cke, s_sel_n, s_ras_n, s_cas_n, s_we_n,
          s_bank_addr, s_addr, s_dqm, s_wr_data, s_rd_data, s_dout_valid;
  endclocking

  modport driver_mp  (clocking drv_cb);
  modport monitor_mp (clocking mon_cb);

  // 用于直接信号赋值（如 tb 顶层手工驱动/采样）
  modport dut_mp (
    output s_cke, s_sel_n, s_ras_n, s_cas_n, s_we_n, s_bank_addr,
           s_addr, s_dqm, s_wr_data, s_dout_valid,
    input  s_rd_data
  );

endinterface
