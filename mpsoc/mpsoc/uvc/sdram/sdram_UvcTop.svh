`ifndef _SDRAM_UVC_TOP_SVH_
`define _SDRAM_UVC_TOP_SVH_

`include "uvm_macros.svh"

package sdram_UvcTop;

	import uvm_pkg::*;

	typedef   class sdram_config;
	typedef   class sdram_trans;
	typedef   class sdram_driver;
	typedef   class sdram_monitor;
	typedef   class sdram_sequencer;
	typedef   class sdram_agent;
	// typedef   class sdram_sequence_lib;

	`include "sdram_config.sv"
	`include "sdram_trans.sv"
	`include "sdram_driver.sv"
	`include "sdram_monitor.sv"
	`include "sdram_sequencer.sv"
	`include "sdram_agent.sv"
	`include "sdram_sequence_lib.sv"

endpackage

`endif
