`ifndef _SVT_TIMER_UVCTOP_SVH_
`define _SVT_TIMER_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_timer_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_timer_config;
	typedef class svt_timer_agent_wrap;
	typedef class svt_timer_base_sequence;
	typedef class svt_timer_demo_sequence;

	`include "svt_timer_config.sv"
	`include "svt_timer_agent.sv"
	`include "svt_timer_sequence_lib.sv"

endpackage

`endif
