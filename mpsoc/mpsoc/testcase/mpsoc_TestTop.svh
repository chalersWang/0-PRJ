`ifndef _MPSOC_TEST_TOP_SV_
`define _MPSOC_TEST_TOP_SV_

package mpsoc_TestTop;

	import uvm_pkg::*;
	`include "uvm_macros.svh"

	//import the SVT UVM PKG
	//import svt_uvm_pkg::*;
	// ===== Synopsys DesignWare VIP 封装 package(接入时取消注释) =====
	//import svt_i2c_UvcTop::*;
	//import svt_spi_UvcTop::*;
	//import svt_uart_UvcTop::*;
	//import svt_axi_UvcTop::*;
	//import svt_ahb_UvcTop::*;
	//import svt_apb_UvcTop::*;
	//import svt_gpio_UvcTop::*;
	//import svt_wdt_UvcTop::*;
	//import svt_timer_UvcTop::*;
	//import svt_qspi_UvcTop::*;
	//import svt_jtag_UvcTop::*;


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
import sdram_pkg::*;
import security_UvcTop::*;
import dma_UvcTop::*;
import pn_irt_UvcTop::*;
import esc_UvcTop::*;
import gmac_UvcTop::*;


	import mpsoc_EnvTop::*;

	`include "mpsoc_sequence_lib.sv"
	`include "mpsoc_base_test.sv"

	`include "mpsoc_demo_test.sv"

	// ===== 各子系统 case list（TestTop_*.svh）=====
	`include "TestTop_bus.svh"
	`include "TestTop_cpu.svh"
	`include "TestTop_dma.svh"
	`include "TestTop_mem.svh"
	`include "TestTop_net.svh"
	`include "TestTop_per.svh"
	`include "TestTop_register.svh"
	`include "TestTop_sec.svh"
	`include "TestTop_sys.svh"
	`include "TestTop_vip.svh"

endpackage
`endif
