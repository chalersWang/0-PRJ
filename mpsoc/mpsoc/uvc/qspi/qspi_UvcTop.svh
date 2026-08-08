`ifndef _QSPI_UVC_TOP_SVH_
`define _QSPI_UVC_TOP_SVH_

`include "uvm_macros.svh"

package qspi_UvcTop;

	import uvm_pkg::*;

	typedef   class qspi_config;
	typedef   class qspi_trans;
	typedef   class qspi_driver;
	typedef   class qspi_monitor;
	typedef   class qspi_sequencer;
	typedef   class qspi_agent;
	typedef   class qspi_sequence_lib;

	`include "qspi_config.sv"
	`include "qspi_trans.sv"
	`include "qspi_driver.sv"
	`include "qspi_monitor.sv"
	`include "qspi_sequencer.sv"
	`include "qspi_agent.sv"
	`include "qspi_sequence_lib.sv"

endpackage

`endif
