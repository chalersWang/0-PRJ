`ifndef _SYSCTRL_UVC_TOP_SVH_
`define _SYSCTRL_UVC_TOP_SVH_

`include "uvm_macros.svh"

package sysctrl_UvcTop;

	import uvm_pkg::*;

	typedef   class sysctrl_config;
	typedef   class sysctrl_trans;
	typedef   class sysctrl_driver;
	typedef   class sysctrl_monitor;
	typedef   class sysctrl_sequencer;
	typedef   class sysctrl_agent;
	typedef   class sysctrl_sequence_lib;

	`include "sysctrl_config.sv"
	`include "sysctrl_trans.sv"
	`include "sysctrl_driver.sv"
	`include "sysctrl_monitor.sv"
	`include "sysctrl_sequencer.sv"
	`include "sysctrl_agent.sv"
	`include "sysctrl_sequence_lib.sv"

endpackage

`endif
