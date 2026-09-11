

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
	uvm_config_db#(virtual i2c_vif)::set(null,"*","i2c_vif",TopVif.i2cvif);
	uvm_config_db#(virtual spi_vif)::set(null,"*","spi_vif",TopVif.spivif);
	uvm_config_db#(virtual wdt_vif)::set(null,"*","wdt_vif",TopVif.wdtvif);
	uvm_config_db#(virtual tim_vif)::set(null,"*","tim_vif",TopVif.timvif);
	uvm_config_db#(virtual uc_vif)::set(null,"*","uc_vif",TopVif.ucvif);
	uvm_config_db#(virtual sdram_vif)::set(null,"*","sdram_vif",TopVif.sdramvif);
	uvm_config_db#(virtual security_vif)::set(null,"*","security_vif",TopVif.securityvif);
	uvm_config_db#(virtual dma_vif)::set(null,"*","dma_vif",TopVif.dmavif);
	uvm_config_db#(virtual pn_irt_vif)::set(null,"*","pn_irt_vif",TopVif.pn_irtvif);
	uvm_config_db#(virtual esc_vif)::set(null,"*","esc_vif",TopVif.escvif);
	uvm_config_db#(virtual gmac_vif)::set(null,"*","gmac_vif",TopVif.gmacvif);


	run_test();

end

//Write the assertions of the tb_top layer in the following file and open the corresponding macro definition
`ifdef SVA_TB_TOP
	`include"./../sva/code/sva_tb_top.sv"
`endif
