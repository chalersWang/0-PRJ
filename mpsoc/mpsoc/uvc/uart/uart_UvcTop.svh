`ifndef _UART_UVC_TOP_SVH_
`define _UART_UVC_TOP_SVH_

`include "uvm_macros.svh"

package uart_UvcTop;

	import uvm_pkg::*;

	typedef   class uart_config;
	typedef   class uart_trans;
	typedef   class uart_driver;
	typedef   class uart_monitor;
	typedef   class uart_sequencer;
	typedef   class uart_agent;
	typedef   class uart_sequence_lib;

	`include "uart_config.sv"
	`include "uart_trans.sv"
	`include "uart_driver.sv"
	`include "uart_monitor.sv"
	`include "uart_sequencer.sv"
	`include "uart_agent.sv"
	`include "uart_sequence_lib.sv"

endpackage

`endif
