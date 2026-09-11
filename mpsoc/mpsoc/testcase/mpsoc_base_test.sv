`ifndef _MPSOC_BASE_TEST_SV_
`define _MPSOC_BASE_TEST_SV_

//uvm hdl task,获取后门的访问rtl的办法
//1.int uvm_hdl_check_path(string path)   path指定的信号，是否存在 返回值
//2.int uvm_hdl_deposit(string path, uvm_hdl_data_t value) 将path指定的信号，设置为value值  返回值
//3.int uvm_hdl_force(string path, uvm_hdl_data_t value) 将path指定的信号，force成value值 返回值
//4.int uvm_hdl_release(string path) 将path指定的信号，release 返回值
//5.int uvm_hdl_read(string path,  output uvm_hdl_data_t value) 读取path指定的信号值，保存在value中 返回值
//6.int uvm_hdl_release_and_read(string path, inout uvm_hdl_data_t value)

class mpsoc_base_test extends uvm_test;

	/*Import the output information into a file*/
	// UVM_FILE    info_log;
	// UVM_FILE    warning_log;
	// UVM_FILE    error_log;
	// UVM_FILE    fatal_log;

	//uvm_cmdline_process UCP
	virtual mpsoc_vif    mpsocvif;

	mpsoc_env            env;

	mpsoc_config         mpsoc_cfg;
	mpsoc_event          mpsoc_evt;

	sysctrl_config            sysctrl_cfg;
	jtag_config            jtag_cfg;
	uart_config            uart_cfg;
	gpio_config            gpio_cfg;
	qspi_config            qspi_cfg;
	switch_config            switch_cfg;
	miiphy_config            miiphy_cfg;
	efuse_config            efuse_cfg;
	i2c_config            i2c_cfg;
	spi_config            spi_cfg;
	wdt_config            wdt_cfg;
	tim_config            tim_cfg;
	uc_config            uc_cfg;
	sdram_config            sdram_cfg;
	security_config            security_cfg;
	dma_config            dma_cfg;
	pn_irt_config            pn_irt_cfg;
	esc_config            esc_cfg;
	gmac_config            gmac_cfg;

	`ifdef REG_MODEL;
		mpsoc_reg_top  RegModel;
	`endif


	`uvm_component_utils(mpsoc_base_test)

	function new(string name="mpsoc_base_test",uvm_component parent=null);
		super.new(name,parent);
		`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		mpsoc_cfg=mpsoc_config::type_id::create("mpsoc_cfg");
		mpsoc_evt=mpsoc_event::type_id::create("mpsoc_evt");
		sysctrl_cfg=sysctrl_config::type_id::create("sysctrl_cfg");
		jtag_cfg=jtag_config::type_id::create("jtag_cfg");
		uart_cfg=uart_config::type_id::create("uart_cfg");
		gpio_cfg=gpio_config::type_id::create("gpio_cfg");
		qspi_cfg=qspi_config::type_id::create("qspi_cfg");
		switch_cfg=switch_config::type_id::create("switch_cfg");
		miiphy_cfg=miiphy_config::type_id::create("miiphy_cfg");
		efuse_cfg=efuse_config::type_id::create("efuse_cfg");
		i2c_cfg=i2c_config::type_id::create("i2c_cfg");
		spi_cfg=spi_config::type_id::create("spi_cfg");
		wdt_cfg=wdt_config::type_id::create("wdt_cfg");
		tim_cfg=tim_config::type_id::create("tim_cfg");
		uc_cfg=uc_config::type_id::create("uc_cfg");
		sdram_cfg=sdram_config::type_id::create("sdram_cfg");
		security_cfg=security_config::type_id::create("security_cfg");
		dma_cfg=dma_config::type_id::create("dma_cfg");
		pn_irt_cfg=pn_irt_config::type_id::create("pn_irt_cfg");
		esc_cfg=esc_config::type_id::create("esc_cfg");
		gmac_cfg=gmac_config::type_id::create("gmac_cfg");
		
		env=mpsoc_env::type_id::create("env",this);
		`ifdef REG_MODEL;
			RegModel=env.RegModel;
		`endif
		//UCP=uvm_cmdline_processor::get_inst();
		//UCP.get_arg_value("+UVM_TESTNAME",mpsocvif.TestCaseName);
		`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	//build_phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(),"build_phase begin ...",UVM_LOW)
		uvm_config_db#(mpsoc_config)::set(this,"*","mpsoc_config",mpsoc_cfg);
		uvm_config_db#(sysctrl_config)::set(this,"*","sysctrl_config",sysctrl_cfg);
		uvm_config_db#(jtag_config)::set(this,"*","jtag_config",jtag_cfg);
		uvm_config_db#(uart_config)::set(this,"*","uart_config",uart_cfg);
		uvm_config_db#(gpio_config)::set(this,"*","gpio_config",gpio_cfg);
		uvm_config_db#(qspi_config)::set(this,"*","qspi_config",qspi_cfg);
		uvm_config_db#(switch_config)::set(this,"*","switch_config",switch_cfg);
		uvm_config_db#(miiphy_config)::set(this,"*","miiphy_config",miiphy_cfg);
		uvm_config_db#(efuse_config)::set(this,"*","efuse_config",efuse_cfg);
		uvm_config_db#(i2c_config)::set(this,"*","i2c_config",i2c_cfg);
		uvm_config_db#(spi_config)::set(this,"*","spi_config",spi_cfg);
		uvm_config_db#(wdt_config)::set(this,"*","wdt_config",wdt_cfg);
		uvm_config_db#(tim_config)::set(this,"*","tim_config",tim_cfg);
		uvm_config_db#(uc_config)::set(this,"*","uc_config",uc_cfg);
		uvm_config_db#(sdram_config)::set(this,"*","sdram_config",sdram_cfg);
		uvm_config_db#(security_config)::set(this,"*","security_config",security_cfg);
		uvm_config_db#(dma_config)::set(this,"*","dma_config",dma_cfg);
		uvm_config_db#(pn_irt_config)::set(this,"*","pn_irt_config",pn_irt_cfg);
		uvm_config_db#(esc_config)::set(this,"*","esc_config",esc_cfg);
		uvm_config_db#(gmac_config)::set(this,"*","gmac_config",gmac_cfg);
		
		if(!uvm_config_db#(virtual mpsoc_vif)::get(this,"","mpsoc_vif",mpsocvif))
			`uvm_fatal("mpsoc_vif","virtual interface must be set for it!!!");
		`uvm_info(get_full_name(),"build_phase end ...",UVM_LOW)
	endfunction

	//connect_phase
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(get_full_name(),"connect_phase begin ...",UVM_LOW)
		uvm_config_db#(mpsoc_config)::set(this,"*","mpsoc_config",mpsoc_cfg);
		uvm_config_db#(sysctrl_config)::set(this,"*","sysctrl_config",sysctrl_cfg);
		uvm_config_db#(jtag_config)::set(this,"*","jtag_config",jtag_cfg);
		uvm_config_db#(uart_config)::set(this,"*","uart_config",uart_cfg);
		uvm_config_db#(gpio_config)::set(this,"*","gpio_config",gpio_cfg);
		uvm_config_db#(qspi_config)::set(this,"*","qspi_config",qspi_cfg);
		uvm_config_db#(switch_config)::set(this,"*","switch_config",switch_cfg);
		uvm_config_db#(miiphy_config)::set(this,"*","miiphy_config",miiphy_cfg);
		uvm_config_db#(efuse_config)::set(this,"*","efuse_config",efuse_cfg);
		uvm_config_db#(i2c_config)::set(this,"*","i2c_config",i2c_cfg);
		uvm_config_db#(spi_config)::set(this,"*","spi_config",spi_cfg);
		uvm_config_db#(wdt_config)::set(this,"*","wdt_config",wdt_cfg);
		uvm_config_db#(tim_config)::set(this,"*","tim_config",tim_cfg);
		uvm_config_db#(uc_config)::set(this,"*","uc_config",uc_cfg);
		uvm_config_db#(sdram_config)::set(this,"*","sdram_config",sdram_cfg);
		uvm_config_db#(security_config)::set(this,"*","security_config",security_cfg);
		uvm_config_db#(dma_config)::set(this,"*","dma_config",dma_cfg);
		uvm_config_db#(pn_irt_config)::set(this,"*","pn_irt_config",pn_irt_cfg);
		uvm_config_db#(esc_config)::set(this,"*","esc_config",esc_cfg);
		uvm_config_db#(gmac_config)::set(this,"*","gmac_config",gmac_cfg);
		
		if(!uvm_config_db#(virtual mpsoc_vif)::get(this,"","mpsoc_vif",mpsocvif))
			`uvm_fatal("mpsoc_vif","virtual interface must be set for it!!!");
		
		/*Set the print redundancy threshold*/
		/*typedef enum{UVM_NONE=0,UVM_LOW=100,UVM_MEDIUM=200,UVM_HIGH=300,UVM_FULL=400,UVM_DEBUG=500} uvm_verbosity;*/
		//   $display("env.i_agt.drv.get_report_verbosity_level=%0d",env.i_agt.drv.get_report_verbosity_level());
		//   env.i_agt.drv.set_report_verbosity_level(UVM_HIGH);
		//   env.i_agt.set_report_verbosity_level_hier(UVM_HIGH);
		//   env.i_agt.drv.set_report_id_verbosity("ID",UVM_HIGH);
		//   env.i_agt.set_report_id_verbosity_hier("ID",UVM_HIGH);
		/*The command line implements Set the print redundancy threshold*/
		//   +UVM_VERBOSITY=UVM_HIGH
		
		/*Overload the severity of the printed information(WARNING->ERROR)*/
		//   env.i_agt.drv.set_report_severity_override(UVM_WARNING,UVM_ERROR);
		//   env.i_agt.drv.set_report_severity_override(UVM_WARNING,"ID",UVM_ERROR);
		/*The command line implements the severity of overloading print information*/
		/*Command line format: +uvm_set_severity=<component>,<id>,<old severity>,<new severity>*/
		//   +uvm_set_severity="uvm_test_top.env.i_agt.drv,ID,UVM_WARNING,UVM_ERROR"
		//   +uvm_set_severity="uvm_test_top.env.i_agt.drv,_ALL_,UVM_WARNING,UVM_ERROR"
		
		/*The simulation ends when the number of UVM_ERROR reaches a certain threshold*/
		//   set_report_max_quit_count(5);
		/*The command line implements The simulation ends when the number of UVM_ERROR reaches a certain threshold*/
		//   +UVM_MAX_QUIT_COUNT=6,NO/YES
		
		/*Control the behavior of printing information*/
		/*typedef enum{UVM_NO_ACTION=0,UVM_DISPLAY=1,UVM_LOG=2,UVM_COUNT=4,UVM_EXIT=8,UVM_CALL_HOOK=16,UVM_STOP=32} uvm_action_type;*/
		
		/*Import the output information into a file*/
		//   info/waning/error/fatal_log=$fopen("info/waning/error/fatal.log","w")
		//   env.i_agt.drv.set_report_severity_file(UVM_INFO/WARNING/ERROR/FATAL,info/waning/error/fatal_log);
		//   env.i_agt.set_report_severity_file_hier(UVM_INFO/WARNING/ERROR/FATAL,info/waning/error/fatal_log);
		//   env.i_agt.drv.set_report_severity_action(UVM_INFO       ,UVM_DISPLAY | UVM_LOG);
		//   env.i_agt.drv.set_report_severity_action(UVM_WARNING    ,UVM_DISPLAY | UVM_LOG);
		//   env.i_agt.drv.set_report_severity_action(UVM_ERROR      ,UVM_DISPLAY | UVM_COUNT | UVM_LOG);
		//   env.i_agt.drv.set_report_severity_action(UVM_FATAL      ,UVM_DISPLAY | UVM_EXIT  | UVM_LOG);
		
		
		`uvm_info(get_full_name(),"connect_phase end ...",UVM_LOW)
	endfunction

	//end_of_elaboration_phase
	virtual function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		`uvm_info(get_full_name(),"end_of_elaboration_phase begin ...",UVM_LOW)
		//uvm_top.print_topology();
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

	//run_phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(),"run_phase begin ...",UVM_LOW)
		phase.raise_objection(this);
		//@(posedge mpsocvif.rstn);
		//#1us;
		phase.drop_objection(this);
		`uvm_info(get_full_name(),"run_phase end ...",UVM_LOW)
	endtask


	//main_phase
	virtual task main_phase(uvm_phase phase);
		super.main_phase(phase);
		`uvm_info(get_full_name(),"main_phase begin ...",UVM_LOW)
		//phase.phase_done.set_drain_time(this,4000);
		`uvm_info(get_full_name(),"main_phase end ...",UVM_LOW)
	endtask


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


    //report_phase
    virtual function void report_phase(uvm_phase phase);
        //super.report_phase(phase);
        uvm_report_server    server;
        int                  err_num;

        server   =get_report_server();
        err_num  =server.get_severity_count(UVM_ERROR);

        if(err_num==0)
            if(get_report_verbosity_level()==0)
                $display("===UVM TEST PASSED===");
            else
                `uvm_info(get_type_name(),"===UVM TEST PASSED===",UVM_LOW)
        else
            if(get_report_verbosity_level()==0)
                $display("===UVM TEST FAILED===");
            else
                `uvm_info(get_type_name(),"===UVM TEST FAILED===",UVM_LOW)
    endfunction

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
