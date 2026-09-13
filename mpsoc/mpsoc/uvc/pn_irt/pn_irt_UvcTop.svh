`ifndef _PN_IRT_UVC_TOP_SVH_
`define _PN_IRT_UVC_TOP_SVH_

`include "uvm_macros.svh"

package pn_irt_UvcTop;

	import uvm_pkg::*;

	typedef   class pn_irt_config;
	typedef   class pn_irt_trans;
	typedef   class pn_irt_driver;
	typedef   class pn_irt_monitor;
	typedef   class pn_irt_sequencer;
	typedef   class pn_irt_agent;
	// typedef   class pn_irt_sequence_lib;

	`include "pn_irt_config.sv"
	`include "pn_irt_trans.sv"
	`include "pn_irt_driver.sv"
	`include "pn_irt_monitor.sv"
	`include "pn_irt_sequencer.sv"
	`include "pn_irt_agent.sv"
	`include "pn_irt_sequence_lib.sv"

endpackage

`endif
