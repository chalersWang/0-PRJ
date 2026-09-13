`ifndef _TIM_UVC_TOP_SVH_
`define _TIM_UVC_TOP_SVH_

`include "uvm_macros.svh"

package tim_UvcTop;

	import uvm_pkg::*;

	typedef   class tim_config;
	typedef   class tim_trans;
	typedef   class tim_driver;
	typedef   class tim_monitor;
	typedef   class tim_sequencer;
	typedef   class tim_agent;
	// typedef   class tim_sequence_lib;

	`include "tim_config.sv"
	`include "tim_trans.sv"
	`include "tim_driver.sv"
	`include "tim_monitor.sv"
	`include "tim_sequencer.sv"
	`include "tim_agent.sv"
	`include "tim_sequence_lib.sv"

endpackage

`endif
