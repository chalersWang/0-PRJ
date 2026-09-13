`ifndef _WDT_UVC_TOP_SVH_
`define _WDT_UVC_TOP_SVH_

`include "uvm_macros.svh"

package wdt_UvcTop;

	import uvm_pkg::*;

	typedef   class wdt_config;
	typedef   class wdt_trans;
	typedef   class wdt_driver;
	typedef   class wdt_monitor;
	typedef   class wdt_sequencer;
	typedef   class wdt_agent;
	// typedef   class wdt_sequence_lib;

	`include "wdt_config.sv"
	`include "wdt_trans.sv"
	`include "wdt_driver.sv"
	`include "wdt_monitor.sv"
	`include "wdt_sequencer.sv"
	`include "wdt_agent.sv"
	`include "wdt_sequence_lib.sv"

endpackage

`endif
