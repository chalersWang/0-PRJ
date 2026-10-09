`ifndef _SVT_APB_UVCTOP_SVH_
`define _SVT_APB_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_apb_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_apb_config;
	typedef class svt_apb_agent_wrap;
	typedef class svt_apb_base_sequence;
	typedef class svt_apb_demo_sequence;

	`include "svt_apb_config.sv"
	`include "svt_apb_agent.sv"
	`include "svt_apb_sequence_lib.sv"

endpackage

`endif
