`ifndef _SECURITY_UVC_TOP_SVH_
`define _SECURITY_UVC_TOP_SVH_

`include "uvm_macros.svh"

package security_UvcTop;

	import uvm_pkg::*;

	typedef   class security_config;
	typedef   class security_trans;
	typedef   class security_driver;
	typedef   class security_monitor;
	typedef   class security_sequencer;
	typedef   class security_agent;
	typedef   class security_sequence_lib;

	`include "security_config.sv"
	`include "security_trans.sv"
	`include "security_driver.sv"
	`include "security_monitor.sv"
	`include "security_sequencer.sv"
	`include "security_agent.sv"
	`include "security_sequence_lib.sv"

endpackage

`endif
