`ifndef _SVT_I2C_UVCTOP_SVH_
`define _SVT_I2C_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_i2c_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_i2c_config;
	typedef class svt_i2c_agent_wrap;
	typedef class svt_i2c_base_sequence;
	typedef class svt_i2c_demo_sequence;

	`include "svt_i2c_config.sv"
	`include "svt_i2c_agent.sv"
	`include "svt_i2c_sequence_lib.sv"

endpackage

`endif
