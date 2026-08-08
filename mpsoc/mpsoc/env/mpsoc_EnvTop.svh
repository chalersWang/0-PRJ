`ifndef _MPSOC_EnvTop_SV_
`define _MPSOC_EnvTop_SV_

`include "uvm_macros.svh"

package mpsoc_EnvTop;

	import uvm_pkg::*;
	/** Import SVT UVM Package **/
	//import svt_uvm_pkg::*;

	/** Import the custom config UVC Package **/

	import sysctrl_UvcTop::*;
	import jtag_UvcTop::*;
	import uart_UvcTop::*;
	import gpio_UvcTop::*;
	import qspi_UvcTop::*;
	import switch_UvcTop::*;
	import miiphy_UvcTop::*;
	import efuse_UvcTop::*;

	typedef class mpsoc_config;
	typedef class mpsoc_event;
	typedef class mpsoc_scoreboard;
	typedef class mpsoc_virtual_sequencer;
	typedef class mpsoc_env;

	`include "mpsoc_config.sv"
	`include "mpsoc_event.sv"
	`include "mpsoc_scoreboard.sv"
	`include "mpsoc_virtual_sequencer.sv"
	`include "mpsoc_env.sv"
	`include "mpsoc_reg_adapter.sv"
	`include "mpsoc_reg_block.sv"

endpackage
`endif
