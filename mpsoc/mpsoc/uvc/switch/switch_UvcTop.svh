`ifndef _SWITCH_UVC_TOP_SVH_
`define _SWITCH_UVC_TOP_SVH_

`include "uvm_macros.svh"

package switch_UvcTop;

	import uvm_pkg::*;

	typedef   class switch_config;
	typedef   class switch_trans;
	typedef   class switch_driver;
	typedef   class switch_monitor;
	typedef   class switch_sequencer;
	typedef   class switch_agent;
	typedef   class switch_sequence_lib;

	`include "switch_config.sv"
	`include "switch_trans.sv"
	`include "switch_driver.sv"
	`include "switch_monitor.sv"
	`include "switch_sequencer.sv"
	`include "switch_agent.sv"
	`include "switch_sequence_lib.sv"

endpackage

`endif
