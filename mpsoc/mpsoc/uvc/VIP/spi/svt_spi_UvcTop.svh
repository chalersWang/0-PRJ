`ifndef _SVT_SPI_UVCTOP_SVH_
`define _SVT_SPI_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_spi_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_spi_config;
	typedef class svt_spi_agent_wrap;
	typedef class svt_spi_base_sequence;
	typedef class svt_spi_demo_sequence;

	`include "svt_spi_config.sv"
	`include "svt_spi_agent.sv"
	`include "svt_spi_sequence_lib.sv"

endpackage

`endif
