`ifndef _SVT_WDT_UVCTOP_SVH_
`define _SVT_WDT_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_wdt_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_wdt_config;
	typedef class svt_wdt_agent_wrap;
	typedef class svt_wdt_base_sequence;
	typedef class svt_wdt_demo_sequence;

	`include "svt_wdt_config.sv"
	`include "svt_wdt_agent.sv"
	`include "svt_wdt_sequence_lib.sv"

endpackage

`endif
