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
		mpsoc_cfg    =mpsoc_config::type_id::create("mpsoc_cfg",this);
		mpsoc_evt    =mpsoc_event::type_id::create("mpsoc_evt",this);
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
		
		uvm_config_db#(mpsoc_config)::set(null,"","mpsoc_config",mpsoc_cfg);
		uvm_config_db#(mpsoc_event)::set(null,"","mpsoc_event",mpsoc_evt);
		`uvm_info(get_full_name(),"build_phase end ...",UVM_LOW)
	endfunction

	//connect_phase
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(get_full_name(),"connect_phase begin ...",UVM_LOW)
		sysctrl_agt.sysctrl_mon.mon_analysis_port.connect(mpsoc_scb.sysctrl_analysis_fifo.analysis_export);
		jtag_agt.jtag_mon.mon_analysis_port.connect(mpsoc_scb.jtag_analysis_fifo.analysis_export);
		uart_agt.uart_mon.mon_analysis_port.connect(mpsoc_scb.uart_analysis_fifo.analysis_export);
		gpio_agt.gpio_mon.mon_analysis_port.connect(mpsoc_scb.gpio_analysis_fifo.analysis_export);
		qspi_agt.qspi_mon.mon_analysis_port.connect(mpsoc_scb.qspi_analysis_fifo.analysis_export);
		switch_agt.switch_mon.mon_analysis_port.connect(mpsoc_scb.switch_analysis_fifo.analysis_export);
		miiphy_agt.miiphy_mon.mon_analysis_port.connect(mpsoc_scb.miiphy_analysis_fifo.analysis_export);
		efuse_agt.efuse_mon.mon_analysis_port.connect(mpsoc_scb.efuse_analysis_fifo.analysis_export);
		
		mpsoc_vseqr.sysctrl_seqr=sysctrl_agt.sysctrl_seqr;
		mpsoc_vseqr.jtag_seqr=jtag_agt.jtag_seqr;
		mpsoc_vseqr.uart_seqr=uart_agt.uart_seqr;
		mpsoc_vseqr.gpio_seqr=gpio_agt.gpio_seqr;
		mpsoc_vseqr.qspi_seqr=qspi_agt.qspi_seqr;
		mpsoc_vseqr.switch_seqr=switch_agt.switch_seqr;
		mpsoc_vseqr.miiphy_seqr=miiphy_agt.miiphy_seqr;
		mpsoc_vseqr.efuse_seqr=efuse_agt.efuse_seqr;
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
