`ifndef _MIIPHY_UVC_TOP_SVH_
`define _MIIPHY_UVC_TOP_SVH_

`include "uvm_macros.svh"

package miiphy_UvcTop;

	import uvm_pkg::*;

	typedef   class miiphy_config;
	typedef   class miiphy_trans;
	typedef   class miiphy_driver;
	typedef   class miiphy_monitor;
	typedef   class miiphy_sequencer;
	typedef   class miiphy_agent;
	typedef   class miiphy_sequence_lib;

	`include "miiphy_config.sv"
	`include "miiphy_trans.sv"
	`include "miiphy_driver.sv"
	`include "miiphy_monitor.sv"
	`include "miiphy_sequencer.sv"
	`include "miiphy_agent.sv"
	`include "miiphy_sequence_lib.sv"

endpackage

`endif
