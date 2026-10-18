`ifndef _SVT_AHB_UVCTOP_SVH_
`define _SVT_AHB_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_ahb_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_ahb_config;
	typedef class svt_ahb_agent_wrap;
	typedef class svt_ahb_base_sequence;
	typedef class svt_ahb_demo_sequence;

	`include "svt_ahb_config.sv"
	`include "svt_ahb_agent.sv"
	`include "svt_ahb_sequence_lib.sv"

endpackage

`endif
