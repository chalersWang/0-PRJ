`ifndef _JTAG_UVC_TOP_SVH_
`define _JTAG_UVC_TOP_SVH_

`include "uvm_macros.svh"

package jtag_UvcTop;

	import uvm_pkg::*;

	typedef   class jtag_config;
	typedef   class jtag_trans;
	typedef   class jtag_driver;
	typedef   class jtag_monitor;
	typedef   class jtag_sequencer;
	typedef   class jtag_agent;
	typedef   class jtag_sequence_lib;

	`include "jtag_config.sv"
	`include "jtag_trans.sv"
	`include "jtag_driver.sv"
	`include "jtag_monitor.sv"
	`include "jtag_sequencer.sv"
	`include "jtag_agent.sv"
	`include "jtag_sequence_lib.sv"

endpackage

`endif
