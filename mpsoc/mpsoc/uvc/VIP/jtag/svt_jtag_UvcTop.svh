`ifndef _SVT_JTAG_UVCTOP_SVH_
`define _SVT_JTAG_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_jtag_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_jtag_config;
	typedef class svt_jtag_agent_wrap;
	typedef class svt_jtag_base_sequence;
	typedef class svt_jtag_demo_sequence;

	`include "svt_jtag_config.sv"
	`include "svt_jtag_agent.sv"
	`include "svt_jtag_sequence_lib.sv"

endpackage

`endif
