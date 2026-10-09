module tb_top;                          

import uvm_pkg::*;

//import svt_uvm_pkg::*;

import mpsoc_TestTop::*;                   


`include "crg_gen.sv"


`include "uvmconfigdb.sv"   


`include "dutinst.sv"  


`include "dumpctrl.sv"


//============================================================================
// Synopsys DesignWare VIP interface 例化预留(接入时取消注释)
//   例:Synopsys I2C VIP 的 interface 例化与 config_db 下发示例
//   svt_i2c_if i2c_if();
//   initial begin
//       uvm_config_db#(virtual svt_i2c_if)::set(null, "uvm_test_top.*", "svt_i2c_if", i2c_if);
//   end
//   其余 VIP(uart/gpio/... )同理,interface 例化与 key 名以 VIP databook 为准。
//============================================================================


endmodule
