// ============================================================================
// 文件    : sdram_pkg.sv
// 功能    : SDRAM UVM UVC 包
//           集中定义位宽参数并包含全部组件：
//           seq_item / config / driver / monitor / agent / base_seq / env
// 编译    : 仿真器编译顺序：
//           1) sdram_if.sv        （interface 不可放入 package，先编译）
//           2) sdram_pkg.sv
//           3) rtl/sdram_model.sv （可选，独立测试模型时）
//           4) tb/*.sv            （测试台/测试）
// ============================================================================

`include "uvm_macros.svh"

package sdram_pkg;

  import uvm_pkg::*;

  // ---- 位宽参数（与 sdram_if / sdram_model 默认值一致）-----------------------
  localparam int DATA_WIDTH      = 32;
  localparam int ROW_ADDR_WIDTH  = 13;
  localparam int COL_ADDR_WIDTH  = 9;
  localparam int BANK_ADDR_WIDTH = 2;
  localparam int ADDR_WIDTH      = 13;

  `include "sdram_seq_item.svh"
  `include "sdram_config.svh"
  `include "sdram_driver.svh"
  `include "sdram_monitor.svh"
  `include "sdram_agent.svh"
  `include "sdram_base_seq.svh"
  `include "sdram_env.svh"

endpackage
