`ifndef _DMA_UVC_TOP_SVH_
`define _DMA_UVC_TOP_SVH_

`include "uvm_macros.svh"

package dma_UvcTop;

	import uvm_pkg::*;

	typedef   class dma_config;
	typedef   class dma_trans;
	typedef   class dma_driver;
	typedef   class dma_monitor;
	typedef   class dma_sequencer;
	typedef   class dma_agent;
	typedef   class dma_sequence_lib;

	`include "dma_config.sv"
	`include "dma_trans.sv"
	`include "dma_driver.sv"
	`include "dma_monitor.sv"
	`include "dma_sequencer.sv"
	`include "dma_agent.sv"
	`include "dma_sequence_lib.sv"

endpackage

`endif
