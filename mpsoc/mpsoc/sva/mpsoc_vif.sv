`ifndef _MPSOC_VIF_SV_
`define _MPSOC_VIF_SV_

interface mpsoc_vif(input clk,input rstn);

	string   TestCaseName;

	sysctrl_vif sysctrlvif(clk,rstn);
	jtag_vif jtagvif(clk,rstn);
	uart_vif uartvif(clk,rstn);
	gpio_vif gpiovif(clk,rstn);
	qspi_vif qspivif(clk,rstn);
	switch_vif switchvif(clk,rstn);
	miiphy_vif miiphyvif(clk,rstn);
	efuse_vif efusevif(clk,rstn);

//	`ifdef SVA_VIF_TOP
//		`include"./sva_code/sva_vif_top.sv"
//	`endif
//

endinterface

`endif

