`ifndef _SVT_AXI_UVCTOP_SVH_
`define _SVT_AXI_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_axi_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_axi_config;
	typedef class svt_axi_agent_wrap;
	typedef class svt_axi_base_sequence;
	typedef class svt_axi_demo_sequence;

	`include "svt_axi_config.sv"
	`include "svt_axi_agent.sv"
	`include "svt_axi_sequence_lib.sv"

endpackage

`endif
