`ifndef _MPSOC_FUNCTION_COVERAGE_SV_
`define _MPSOC_FUNCTION_COVERAGE_SV_

//Add a specific function coverage code

	//Examples are as follows
	`ifdef COVERAGE_SYSCTRL
		`include"sysctrl_function_coverage.sv"
	`endif
	`ifdef COVERAGE_JTAG
		`include"jtag_function_coverage.sv"
	`endif
	`ifdef COVERAGE_UART
		`include"uart_function_coverage.sv"
	`endif
	`ifdef COVERAGE_GPIO
		`include"gpio_function_coverage.sv"
	`endif
	`ifdef COVERAGE_QSPI
		`include"qspi_function_coverage.sv"
	`endif
	`ifdef COVERAGE_SWITCH
		`include"switch_function_coverage.sv"
	`endif
	`ifdef COVERAGE_MIIPHY
		`include"miiphy_function_coverage.sv"
	`endif
	`ifdef COVERAGE_EFUSE
		`include"efuse_function_coverage.sv"
	`endif

`endif

