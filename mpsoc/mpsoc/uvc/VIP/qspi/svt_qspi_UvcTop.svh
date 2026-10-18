`ifndef _SVT_QSPI_UVCTOP_SVH_
`define _SVT_QSPI_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_qspi_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_qspi_config;
	typedef class svt_qspi_agent_wrap;
	typedef class svt_qspi_base_sequence;
	typedef class svt_qspi_demo_sequence;

	`include "svt_qspi_config.sv"
	`include "svt_qspi_agent.sv"
	`include "svt_qspi_sequence_lib.sv"

endpackage

`endif
