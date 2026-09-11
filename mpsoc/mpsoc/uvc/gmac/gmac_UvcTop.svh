`ifndef _GMAC_UVC_TOP_SVH_
`define _GMAC_UVC_TOP_SVH_

`include "uvm_macros.svh"

package gmac_UvcTop;

	import uvm_pkg::*;

	typedef   class gmac_config;
	typedef   class gmac_trans;
	typedef   class gmac_driver;
	typedef   class gmac_monitor;
	typedef   class gmac_sequencer;
	typedef   class gmac_agent;
	typedef   class gmac_sequence_lib;

	`include "gmac_config.sv"
	`include "gmac_trans.sv"
	`include "gmac_driver.sv"
	`include "gmac_monitor.sv"
	`include "gmac_sequencer.sv"
	`include "gmac_agent.sv"
	`include "gmac_sequence_lib.sv"

endpackage

`endif
