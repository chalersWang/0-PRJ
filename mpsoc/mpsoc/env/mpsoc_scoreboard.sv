`ifndef _MPSOC_SCOREBOARD_SV_
`define _MPSOC_SCOREBOARD_SV_

//=========================================================================
// mpsoc_scoreboard: 验证环境计分板
//   职责：接收 monitor 的 transaction，比对期望值与实际值
//   覆盖率收集已独立为 coverage_subscriber（见 mpsoc_function_coverage.sv）
//=========================================================================
`include "mpsoc_function_coverage.sv"
// 每个 UVC 一个 analysis_imp 后缀化类，避免 write() 命名冲突（uvm_analysis_imp_<suffix> 需先 decl 生成）
`uvm_analysis_imp_decl(_sysctrl)
`uvm_analysis_imp_decl(_jtag)
`uvm_analysis_imp_decl(_uart)
`uvm_analysis_imp_decl(_gpio)
`uvm_analysis_imp_decl(_qspi)
`uvm_analysis_imp_decl(_switch)
`uvm_analysis_imp_decl(_miiphy)
`uvm_analysis_imp_decl(_efuse)
`uvm_analysis_imp_decl(_i2c)
`uvm_analysis_imp_decl(_spi)
`uvm_analysis_imp_decl(_wdt)
`uvm_analysis_imp_decl(_tim)
`uvm_analysis_imp_decl(_uc)
`uvm_analysis_imp_decl(_sdram)
`uvm_analysis_imp_decl(_security)
`uvm_analysis_imp_decl(_dma)
`uvm_analysis_imp_decl(_pn_irt)
`uvm_analysis_imp_decl(_esc)
`uvm_analysis_imp_decl(_gmac)


class mpsoc_scoreboard extends uvm_scoreboard;

	// 配置和事件
	mpsoc_config   mpsoc_cfg;
	virtual mpsoc_vif mpsoc_vif;


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
	uvm_analysis_imp_i2c #(i2c_trans, mpsoc_scoreboard) i2c_scb_imp;
	uvm_analysis_imp_spi #(spi_trans, mpsoc_scoreboard) spi_scb_imp;
	uvm_analysis_imp_wdt #(wdt_trans, mpsoc_scoreboard) wdt_scb_imp;
	uvm_analysis_imp_tim #(tim_trans, mpsoc_scoreboard) tim_scb_imp;
	uvm_analysis_imp_uc #(uc_trans, mpsoc_scoreboard) uc_scb_imp;
	uvm_analysis_imp_sdram #(sdram_trans, mpsoc_scoreboard) sdram_scb_imp;
	uvm_analysis_imp_security #(security_trans, mpsoc_scoreboard) security_scb_imp;
	uvm_analysis_imp_dma #(dma_trans, mpsoc_scoreboard) dma_scb_imp;
	uvm_analysis_imp_pn_irt #(pn_irt_trans, mpsoc_scoreboard) pn_irt_scb_imp;
	uvm_analysis_imp_esc #(esc_trans, mpsoc_scoreboard) esc_scb_imp;
	uvm_analysis_imp_gmac #(gmac_trans, mpsoc_scoreboard) gmac_scb_imp;

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
		i2c_scb_imp = new("i2c_scb_imp", this);
		spi_scb_imp = new("spi_scb_imp", this);
		wdt_scb_imp = new("wdt_scb_imp", this);
		tim_scb_imp = new("tim_scb_imp", this);
		uc_scb_imp = new("uc_scb_imp", this);
		sdram_scb_imp = new("sdram_scb_imp", this);
		security_scb_imp = new("security_scb_imp", this);
		dma_scb_imp = new("dma_scb_imp", this);
		pn_irt_scb_imp = new("pn_irt_scb_imp", this);
		esc_scb_imp = new("esc_scb_imp", this);
		gmac_scb_imp = new("gmac_scb_imp", this);
			if(!uvm_config_db#(virtual mpsoc_vif)::get(this, "", "mpsoc_vif", mpsoc_vif))
			    `uvm_fatal(get_type_name(), "failed to get mpsoc_vif from config_db")

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

	// i2c 数据比对（由 i2c_scb_imp 回调）
	function void write_i2c(i2c_trans tr);
		`uvm_info(get_type_name(), $sformatf("i2c rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 i2c 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_i2c

	// spi 数据比对（由 spi_scb_imp 回调）
	function void write_spi(spi_trans tr);
		`uvm_info(get_type_name(), $sformatf("spi rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 spi 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_spi

	// wdt 数据比对（由 wdt_scb_imp 回调）
	function void write_wdt(wdt_trans tr);
		`uvm_info(get_type_name(), $sformatf("wdt rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 wdt 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_wdt

	// tim 数据比对（由 tim_scb_imp 回调）
	function void write_tim(tim_trans tr);
		`uvm_info(get_type_name(), $sformatf("tim rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 tim 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_tim

	// uc 数据比对（由 uc_scb_imp 回调）
	function void write_uc(uc_trans tr);
		`uvm_info(get_type_name(), $sformatf("uc rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 uc 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_uc

	// sdram 数据比对（由 sdram_scb_imp 回调）
	function void write_sdram(sdram_trans tr);
		`uvm_info(get_type_name(), $sformatf("sdram rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 sdram 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_sdram

	// security 数据比对（由 security_scb_imp 回调）
	function void write_security(security_trans tr);
		`uvm_info(get_type_name(), $sformatf("security rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 security 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_security

	// dma 数据比对（由 dma_scb_imp 回调）
	function void write_dma(dma_trans tr);
		`uvm_info(get_type_name(), $sformatf("dma rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 dma 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_dma

	// pn_irt 数据比对（由 pn_irt_scb_imp 回调）
	function void write_pn_irt(pn_irt_trans tr);
		`uvm_info(get_type_name(), $sformatf("pn_irt rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 pn_irt 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_pn_irt

	// esc 数据比对（由 esc_scb_imp 回调）
	function void write_esc(esc_trans tr);
		`uvm_info(get_type_name(), $sformatf("esc rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 esc 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_esc

	// gmac 数据比对（由 gmac_scb_imp 回调）
	function void write_gmac(gmac_trans tr);
		`uvm_info(get_type_name(), $sformatf("gmac rcv trans: %s", tr.convert2string()), UVM_HIGH)
		// TODO: 用户在此实现 gmac 的比对逻辑
		// 典型比对流程：
		//   1. 从 reference model 获取期望值
		//   2. 与 monitor 采集的实际值比对
		//   3. 不匹配时报告 `uvm_error
	endfunction : write_gmac
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
