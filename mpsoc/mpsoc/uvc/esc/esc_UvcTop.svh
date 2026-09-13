`ifndef _ESC_UVC_TOP_SVH_
`define _ESC_UVC_TOP_SVH_

`include "uvm_macros.svh"

package esc_UvcTop;

	import uvm_pkg::*;

	typedef   class esc_config;
	typedef   class esc_trans;
	typedef   class esc_driver;
	typedef   class esc_monitor;
	typedef   class esc_sequencer;
	typedef   class esc_agent;
	// typedef   class esc_sequence_lib;

	`include "esc_config.sv"
	`include "esc_trans.sv"
	`include "esc_driver.sv"
	`include "esc_monitor.sv"
	`include "esc_sequencer.sv"
	`include "esc_agent.sv"
	`include "esc_sequence_lib.sv"

endpackage

`endif
