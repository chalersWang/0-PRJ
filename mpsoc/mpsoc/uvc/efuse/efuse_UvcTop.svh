`ifndef _EFUSE_UVC_TOP_SVH_
`define _EFUSE_UVC_TOP_SVH_

`include "uvm_macros.svh"

package efuse_UvcTop;

	import uvm_pkg::*;

	typedef   class efuse_config;
	typedef   class efuse_trans;
	typedef   class efuse_driver;
	typedef   class efuse_monitor;
	typedef   class efuse_sequencer;
	typedef   class efuse_agent;
	typedef   class efuse_sequence_lib;

	`include "efuse_config.sv"
	`include "efuse_trans.sv"
	`include "efuse_driver.sv"
	`include "efuse_monitor.sv"
	`include "efuse_sequencer.sv"
	`include "efuse_agent.sv"
	`include "efuse_sequence_lib.sv"

endpackage

`endif
