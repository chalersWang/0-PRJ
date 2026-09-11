`ifndef _MPSOC_ENV_SV_
`define _MPSOC_ENV_SV_

class mpsoc_env extends uvm_env;

	mpsoc_config             mpsoc_cfg;
	mpsoc_event              mpsoc_evt;
	mpsoc_virtual_sequencer  mpsoc_vseqr;
	mpsoc_scoreboard         mpsoc_scb;

	sysctrl_agent    sysctrl_agt;
	jtag_agent    jtag_agt;
	uart_agent    uart_agt;
	gpio_agent    gpio_agt;
	qspi_agent    qspi_agt;
	switch_agent    switch_agt;
	miiphy_agent    miiphy_agt;
	efuse_agent    efuse_agt;
	i2c_agent    i2c_agt;
	spi_agent    spi_agt;
	wdt_agent    wdt_agt;
	tim_agent    tim_agt;
	uc_agent    uc_agt;
	sdram_agent    sdram_agt;
	security_agent    security_agt;
	dma_agent    dma_agt;
	pn_irt_agent    pn_irt_agt;
	esc_agent    esc_agt;
	gmac_agent    gmac_agt;

	`ifdef REG_MODEL
		string      hdl_path;
		mpsoc_reg_top  RegModel;
	`endif

	`uvm_component_utils(mpsoc_env);

	function new(string name="mpsoc_env",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	//build_phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(),"build_phase begin ...",UVM_LOW)
		mpsoc_cfg    =mpsoc_config::type_id::create("mpsoc_cfg");
		mpsoc_evt    =mpsoc_event::type_id::create("mpsoc_evt");
		mpsoc_vseqr  =mpsoc_virtual_sequencer::type_id::create("mpsoc_vseqr",this);
		mpsoc_scb    =mpsoc_scoreboard::type_id::create("mpsoc_scb",this);
		
		sysctrl_agt =sysctrl_agent::type_id::create("sysctrl_agt",this);
		jtag_agt =jtag_agent::type_id::create("jtag_agt",this);
		uart_agt =uart_agent::type_id::create("uart_agt",this);
		gpio_agt =gpio_agent::type_id::create("gpio_agt",this);
		qspi_agt =qspi_agent::type_id::create("qspi_agt",this);
		switch_agt =switch_agent::type_id::create("switch_agt",this);
		miiphy_agt =miiphy_agent::type_id::create("miiphy_agt",this);
		efuse_agt =efuse_agent::type_id::create("efuse_agt",this);
		i2c_agt =i2c_agent::type_id::create("i2c_agt",this);
		spi_agt =spi_agent::type_id::create("spi_agt",this);
		wdt_agt =wdt_agent::type_id::create("wdt_agt",this);
		tim_agt =tim_agent::type_id::create("tim_agt",this);
		uc_agt =uc_agent::type_id::create("uc_agt",this);
		sdram_agt =sdram_agent::type_id::create("sdram_agt",this);
		security_agt =security_agent::type_id::create("security_agt",this);
		dma_agt =dma_agent::type_id::create("dma_agt",this);
		pn_irt_agt =pn_irt_agent::type_id::create("pn_irt_agt",this);
		esc_agt =esc_agent::type_id::create("esc_agt",this);
		gmac_agt =gmac_agent::type_id::create("gmac_agt",this);
		
		uvm_config_db#(mpsoc_config)::set(null,"","mpsoc_config",mpsoc_cfg);
		uvm_config_db#(mpsoc_event)::set(null,"","mpsoc_event",mpsoc_evt);
		`uvm_info(get_full_name(),"build_phase end ...",UVM_LOW)
	endfunction

	//connect_phase
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(get_full_name(),"connect_phase begin ...",UVM_LOW)
		sysctrl_agt.sysctrl_mon.mon_analysis_port.connect(mpsoc_scb.sysctrl_scb_imp);
		jtag_agt.jtag_mon.mon_analysis_port.connect(mpsoc_scb.jtag_scb_imp);
		uart_agt.uart_mon.mon_analysis_port.connect(mpsoc_scb.uart_scb_imp);
		gpio_agt.gpio_mon.mon_analysis_port.connect(mpsoc_scb.gpio_scb_imp);
		qspi_agt.qspi_mon.mon_analysis_port.connect(mpsoc_scb.qspi_scb_imp);
		switch_agt.switch_mon.mon_analysis_port.connect(mpsoc_scb.switch_scb_imp);
		miiphy_agt.miiphy_mon.mon_analysis_port.connect(mpsoc_scb.miiphy_scb_imp);
		efuse_agt.efuse_mon.mon_analysis_port.connect(mpsoc_scb.efuse_scb_imp);
		i2c_agt.i2c_mon.mon_analysis_port.connect(mpsoc_scb.i2c_scb_imp);
		spi_agt.spi_mon.mon_analysis_port.connect(mpsoc_scb.spi_scb_imp);
		wdt_agt.wdt_mon.mon_analysis_port.connect(mpsoc_scb.wdt_scb_imp);
		tim_agt.tim_mon.mon_analysis_port.connect(mpsoc_scb.tim_scb_imp);
		uc_agt.uc_mon.mon_analysis_port.connect(mpsoc_scb.uc_scb_imp);
		sdram_agt.sdram_mon.mon_analysis_port.connect(mpsoc_scb.sdram_scb_imp);
		security_agt.security_mon.mon_analysis_port.connect(mpsoc_scb.security_scb_imp);
		dma_agt.dma_mon.mon_analysis_port.connect(mpsoc_scb.dma_scb_imp);
		pn_irt_agt.pn_irt_mon.mon_analysis_port.connect(mpsoc_scb.pn_irt_scb_imp);
		esc_agt.esc_mon.mon_analysis_port.connect(mpsoc_scb.esc_scb_imp);
		gmac_agt.gmac_mon.mon_analysis_port.connect(mpsoc_scb.gmac_scb_imp);
		
		mpsoc_vseqr.sysctrl_seqr=sysctrl_agt.sysctrl_seqr;
		mpsoc_vseqr.jtag_seqr=jtag_agt.jtag_seqr;
		mpsoc_vseqr.uart_seqr=uart_agt.uart_seqr;
		mpsoc_vseqr.gpio_seqr=gpio_agt.gpio_seqr;
		mpsoc_vseqr.qspi_seqr=qspi_agt.qspi_seqr;
		mpsoc_vseqr.switch_seqr=switch_agt.switch_seqr;
		mpsoc_vseqr.miiphy_seqr=miiphy_agt.miiphy_seqr;
		mpsoc_vseqr.efuse_seqr=efuse_agt.efuse_seqr;
		mpsoc_vseqr.i2c_seqr=i2c_agt.i2c_seqr;
		mpsoc_vseqr.spi_seqr=spi_agt.spi_seqr;
		mpsoc_vseqr.wdt_seqr=wdt_agt.wdt_seqr;
		mpsoc_vseqr.tim_seqr=tim_agt.tim_seqr;
		mpsoc_vseqr.uc_seqr=uc_agt.uc_seqr;
		mpsoc_vseqr.sdram_seqr=sdram_agt.sdram_seqr;
		mpsoc_vseqr.security_seqr=security_agt.security_seqr;
		mpsoc_vseqr.dma_seqr=dma_agt.dma_seqr;
		mpsoc_vseqr.pn_irt_seqr=pn_irt_agt.pn_irt_seqr;
		mpsoc_vseqr.esc_seqr=esc_agt.esc_seqr;
		mpsoc_vseqr.gmac_seqr=gmac_agt.gmac_seqr;
		`uvm_info(get_full_name(),"connect_phase end ...",UVM_LOW)
	endfunction

	//end_of_elaboration_phase
	virtual function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		`uvm_info(get_full_name(),"end_of_elaboration_phase begin ...",UVM_LOW)
		// 在此 phase 中推荐：1) 降低 VIP 日志级别  2) lock register model  3) factory override
		`uvm_info(get_full_name(),"end_of_elaboration_phase end ...",UVM_LOW)
	endfunction

	/*
	//start_of_simulation_phase
	virtual function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		//`uvm_info(get_full_name(),"start_of_simulation_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"start_of_simulation_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//run_phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		//`uvm_info(get_full_name(),"run_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"run_phase end ...",UVM_LOW)
	endtask

	*/

	/*
	//extract_phase
	virtual function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		//`uvm_info(get_full_name(),"extract_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"extract_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//check_phase
	virtual function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		//`uvm_info(get_full_name(),"check_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"check_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//report_phase
	virtual function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		//`uvm_info(get_full_name(),"report_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"report_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//final_phase
	virtual function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		//`uvm_info(get_full_name(),"final_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"final_phase end ...",UVM_LOW)
	endfunction
	*/


endclass

`endif
