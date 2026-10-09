`ifndef _SVT_GPIO_UVCTOP_SVH_
`define _SVT_GPIO_UVCTOP_SVH_

`include "uvm_macros.svh"

package svt_gpio_UvcTop;

	import uvm_pkg::*;
	// Synopsys VIP UVM 包(依赖 VIP 库)
	import svt_uvm_pkg::*;

	typedef class svt_gpio_config;
	typedef class svt_gpio_agent_wrap;
	typedef class svt_gpio_base_sequence;
	typedef class svt_gpio_demo_sequence;

	`include "svt_gpio_config.sv"
	`include "svt_gpio_agent.sv"
	`include "svt_gpio_sequence_lib.sv"

endpackage

`endif
