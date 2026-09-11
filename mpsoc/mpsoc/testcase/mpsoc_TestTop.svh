`ifndef _MPSOC_TEST_TOP_SV_
`define _MPSOC_TEST_TOP_SV_

package mpsoc_TestTop;

	import uvm_pkg::*;
	`include "uvm_macros.svh"

	//import the SVT UVM PKG
	//import svt_uvm_pkg::*;


	import sysctrl_UvcTop::*;
	import jtag_UvcTop::*;
	import uart_UvcTop::*;
	import gpio_UvcTop::*;
	import qspi_UvcTop::*;
	import switch_UvcTop::*;
	import miiphy_UvcTop::*;
	import efuse_UvcTop::*;
import i2c_UvcTop::*;
import spi_UvcTop::*;
import wdt_UvcTop::*;
import tim_UvcTop::*;
import uc_UvcTop::*;
import sdram_UvcTop::*;
import security_UvcTop::*;
import dma_UvcTop::*;
import pn_irt_UvcTop::*;
import esc_UvcTop::*;
import gmac_UvcTop::*;


	import mpsoc_EnvTop::*;

	`include "mpsoc_sequence_lib.sv"
	`include "mpsoc_base_test.sv"

	`include "mpsoc_demo_test.sv"

endpackage
`endif
