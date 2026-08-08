`ifndef _GPIO_UVC_TOP_SVH_
`define _GPIO_UVC_TOP_SVH_

`include "uvm_macros.svh"

package gpio_UvcTop;

	import uvm_pkg::*;

	typedef   class gpio_config;
	typedef   class gpio_trans;
	typedef   class gpio_driver;
	typedef   class gpio_monitor;
	typedef   class gpio_sequencer;
	typedef   class gpio_agent;
	typedef   class gpio_sequence_lib;

	`include "gpio_config.sv"
	`include "gpio_trans.sv"
	`include "gpio_driver.sv"
	`include "gpio_monitor.sv"
	`include "gpio_sequencer.sv"
	`include "gpio_agent.sv"
	`include "gpio_sequence_lib.sv"

endpackage

`endif
