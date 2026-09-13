`ifndef _SPI_UVC_TOP_SVH_
`define _SPI_UVC_TOP_SVH_

`include "uvm_macros.svh"

package spi_UvcTop;

	import uvm_pkg::*;

	typedef   class spi_config;
	typedef   class spi_trans;
	typedef   class spi_driver;
	typedef   class spi_monitor;
	typedef   class spi_sequencer;
	typedef   class spi_agent;
	// typedef   class spi_sequence_lib;

	`include "spi_config.sv"
	`include "spi_trans.sv"
	`include "spi_driver.sv"
	`include "spi_monitor.sv"
	`include "spi_sequencer.sv"
	`include "spi_agent.sv"
	`include "spi_sequence_lib.sv"

endpackage

`endif
