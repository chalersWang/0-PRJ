`ifndef _UC_UVC_TOP_SVH_
`define _UC_UVC_TOP_SVH_

`include "uvm_macros.svh"

package uc_UvcTop;

	import uvm_pkg::*;

	typedef   class uc_config;
	typedef   class uc_trans;
	typedef   class uc_driver;
	typedef   class uc_monitor;
	typedef   class uc_sequencer;
	typedef   class uc_agent;
	typedef   class uc_sequence_lib;

	`include "uc_config.sv"
	`include "uc_trans.sv"
	`include "uc_driver.sv"
	`include "uc_monitor.sv"
	`include "uc_sequencer.sv"
	`include "uc_agent.sv"
	`include "uc_sequence_lib.sv"

endpackage

`endif
