

typedef virtual mpsoc_vif  mpsocvif;
mpsoc_vif   TopVif(tb_top.i_pad_clk,tb_top.i_pad_rst_b);



//You must check whether the virtual interface is declared and its correctness!!!
initial begin
	uvm_config_db#(virtual mpsoc_vif)::set(null,"*","mpsoc_vif",TopVif);

	uvm_config_db#(virtual sysctrl_vif)::set(null,"*","sysctrl_vif",TopVif.sysctrlvif);
	uvm_config_db#(virtual jtag_vif)::set(null,"*","jtag_vif",TopVif.jtagvif);
	uvm_config_db#(virtual uart_vif)::set(null,"*","uart_vif",TopVif.uartvif);
	uvm_config_db#(virtual gpio_vif)::set(null,"*","gpio_vif",TopVif.gpiovif);
	uvm_config_db#(virtual qspi_vif)::set(null,"*","qspi_vif",TopVif.qspivif);
	uvm_config_db#(virtual switch_vif)::set(null,"*","switch_vif",TopVif.switchvif);
	uvm_config_db#(virtual miiphy_vif)::set(null,"*","miiphy_vif",TopVif.miiphyvif);
	uvm_config_db#(virtual efuse_vif)::set(null,"*","efuse_vif",TopVif.efusevif);


	run_test();

end

//Write the assertions of the tb_top layer in the following file and open the corresponding macro definition
`ifdef SVA_TB_TOP
	`include"./../sva/code/sva_tb_top.sv"
`endif
