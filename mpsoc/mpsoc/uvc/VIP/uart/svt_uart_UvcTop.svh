`ifndef _SVT_UART_UVCTOP_SVH_
`define _SVT_UART_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_uart_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_uart_config;
	typedef class svt_uart_agent_wrap;
	typedef class svt_uart_base_sequence;
	typedef class svt_uart_demo_sequence;

	`include "svt_uart_config.sv"
	`include "svt_uart_agent.sv"
	`include "svt_uart_sequence_lib.sv"

endpackage

`endif
