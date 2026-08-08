`ifndef _MPSOC_SCOREBOARD_SV_
`define _MPSOC_SCOREBOARD_SV_

//=========================================================================
// mpsoc_scoreboard: 验证环境计分板
//   职责：接收 monitor 的 transaction，比对期望值与实际值
//   覆盖率收集已独立为 coverage_subscriber（见 mpsoc_function_coverage.sv）
//=========================================================================
`include "mpsoc_function_coverage.sv"

class mpsoc_scoreboard extends uvm_scoreboard;

	// 配置和事件
	mpsoc_config   mpsoc_cfg;

	// ===== UVC Subscriber 声明 =====
	// 每个 UVC 一个 subscriber，接收其 monitor 的 transaction
	uvm_analysis_imp_sysctrl #(sysctrl_trans, mpsoc_scoreboard) sysctrl_scb_imp;
	uvm_analysis_imp_jtag #(jtag_trans, mpsoc_scoreboard) jtag_scb_imp;
	uvm_analysis_imp_uart #(uart_trans, mpsoc_scoreboard) uart_scb_imp;
	uvm_analysis_imp_gpio #(gpio_trans, mpsoc_scoreboard) gpio_scb_imp;
	uvm_analysis_imp_qspi #(qspi_trans, mpsoc_scoreboard) qspi_scb_imp;
	uvm_analysis_imp_switch #(switch_trans, mpsoc_scoreboard) switch_scb_imp;
	uvm_analysis_imp_miiphy #(miiphy_trans, mpsoc_scoreboard) miiphy_scb_imp;
	uvm_analysis_imp_efuse #(efuse_trans, mpsoc_scoreboard) efuse_scb_imp;

	`uvm_component_utils(mpsoc_scoreboard)

	function new(string name="mpsoc_scoreboard",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	//build_phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(),"build_phase begin ...",UVM_LOW)
		sysctrl_scb_imp = new("sysctrl_scb_imp", this);
		jtag_scb_imp = new("jtag_scb_imp", this);
		uart_scb_imp = new("uart_scb_imp", this);
		gpio_scb_imp = new("gpio_scb_imp", this);
		qspi_scb_imp = new("qspi_scb_imp", this);
		switch_scb_imp = new("switch_scb_imp", this);
		miiphy_scb_imp = new("miiphy_scb_imp", this);
		efuse_scb_imp = new("efuse_scb_imp", this);
		`uvm_info(get_full_name(),"build_phase end ...",UVM_LOW)
	endfunction

	/*
	//connect_phase
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//`uvm_info(get_full_name(),"connect_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"connect_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//end_of_elaboration_phase
	virtual function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		//`uvm_info(get_full_name(),"end_of_elaboration_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"end_of_elaboration_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//start_of_simulation_phase
	virtual function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		//`uvm_info(get_full_name(),"start_of_simulation_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"start_of_simulation_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//reset_phase
	virtual task reset_phase(uvm_phase phase);
		super.reset_phase(phase);
		//`uvm_info(get_full_name(),"reset_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"reset_phase end ...",UVM_LOW)
	endtask

	*/

	//run_phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(),"run_phase begin ...",UVM_LOW)
		// 等待复位释放
		@(posedge mpsoc_vif.rstn);
		
		// 获取 config
		if(!uvm_config_db#(mpsoc_config)::get(this, "", "mpsoc_config", mpsoc_cfg))
		    `uvm_error(get_type_name(), "failed to get config")
		`uvm_info(get_full_name(),"run_phase end ...",UVM_LOW)
	endtask



	// sysctrl 数据比对（由 sysctrl_scb_imp 回调）
	function void write_sysctrl(sysctrl_trans tr);
		`uvm_info(get_type_name(), $sformatf("sysctrl rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 sysctrl 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_sysctrl

	// jtag 数据比对（由 jtag_scb_imp 回调）
	function void write_jtag(jtag_trans tr);
		`uvm_info(get_type_name(), $sformatf("jtag rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 jtag 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_jtag

	// uart 数据比对（由 uart_scb_imp 回调）
	function void write_uart(uart_trans tr);
		`uvm_info(get_type_name(), $sformatf("uart rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 uart 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_uart

	// gpio 数据比对（由 gpio_scb_imp 回调）
	function void write_gpio(gpio_trans tr);
		`uvm_info(get_type_name(), $sformatf("gpio rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 gpio 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_gpio

	// qspi 数据比对（由 qspi_scb_imp 回调）
	function void write_qspi(qspi_trans tr);
		`uvm_info(get_type_name(), $sformatf("qspi rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 qspi 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_qspi

	// switch 数据比对（由 switch_scb_imp 回调）
	function void write_switch(switch_trans tr);
		`uvm_info(get_type_name(), $sformatf("switch rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 switch 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_switch

	// miiphy 数据比对（由 miiphy_scb_imp 回调）
	function void write_miiphy(miiphy_trans tr);
		`uvm_info(get_type_name(), $sformatf("miiphy rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 miiphy 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_miiphy

	// efuse 数据比对（由 efuse_scb_imp 回调）
	function void write_efuse(efuse_trans tr);
		`uvm_info(get_type_name(), $sformatf("efuse rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 efuse 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_efuse
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
		super.report_phase(phase);
		`uvm_info(get_full_name(),"report_phase begin ...",UVM_LOW)
		`uvm_info(get_type_name(), $sformatf("scoreboard report:"), UVM_LOW)
		// TODO: 打印比对统计（pass/fail 计数）
		`uvm_info(get_full_name(),"report_phase end ...",UVM_LOW)
	endfunction

	/*
	//final_phase
	virtual function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		//`uvm_info(get_full_name(),"final_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"final_phase end ...",UVM_LOW)
	endfunction
	*/

endclass : mpsoc_scoreboard

`endif
