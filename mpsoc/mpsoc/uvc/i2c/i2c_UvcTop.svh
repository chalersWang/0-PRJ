`ifndef _I2C_UVC_TOP_SVH_
`define _I2C_UVC_TOP_SVH_

`include "uvm_macros.svh"

package i2c_UvcTop;

	import uvm_pkg::*;

	typedef   class i2c_config;
	typedef   class i2c_trans;
	typedef   class i2c_driver;
	typedef   class i2c_monitor;
	typedef   class i2c_sequencer;
	typedef   class i2c_agent;
	typedef   class i2c_sequence_lib;

	`include "i2c_config.sv"
	`include "i2c_trans.sv"
	`include "i2c_driver.sv"
	`include "i2c_monitor.sv"
	`include "i2c_sequencer.sv"
	`include "i2c_agent.sv"
	`include "i2c_sequence_lib.sv"

endpackage

`endif
