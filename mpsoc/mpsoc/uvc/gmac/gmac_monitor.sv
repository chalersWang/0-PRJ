`ifndef _GMAC_MONITOR_SV_
`define _GMAC_MONITOR_SV_

//=========================================================================
// gmac_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class gmac_monitor extends uvm_monitor;

	virtual gmac_vif       vif;
	gmac_trans             gmac_tr;

	uvm_analysis_port #(gmac_trans)    mon_analysis_port;
//	`uvm_register_cb(gmac_monitor, gmac_monitor_callback)

	`uvm_component_utils(gmac_monitor)

	function new(string name="gmac_monitor",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	//build_phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(),"build_phase begin ...",UVM_LOW)
		mon_analysis_port=new("mon_analysis_port",this);
		`uvm_info(get_full_name(),"build_phase end ...",UVM_LOW)
	endfunction

	//connect_phase
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info(get_full_name(),"connect_phase begin ...",UVM_LOW)
		if(!uvm_config_db#(virtual gmac_vif)::get(this,"","gmac_vif",vif))
		    `uvm_fatal("gmac_monitor","virtual interface must be set for it!!!")
		`uvm_info(get_full_name(),"connect_phase end ...",UVM_LOW)
	endfunction

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

	//=========================================================================
	// run_phase: 持续监控 DUT 信号，每个时钟周期采集一次 transaction
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_GMAC 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_GMAC 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
	virtual task run_phase(uvm_phase phase);
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)

		forever begin

			// --- 1. 等待时钟边沿（不再用 fork，避免线程泄漏） ---
			@(posedge vif.clk);

			// --- 2. X/Z 检查（通过宏控制，不影响正常采集） ---
			`ifdef CHECK_SIGNAL_XZ_GMAC
				if($isunknown(vif.gmac_rgmii_txc)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_rgmii_txc is X/Z at %0t", $time))
				if($isunknown(vif.gmac_rgmii_txd)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_rgmii_txd is X/Z at %0t", $time))
				if($isunknown(vif.gmac_rgmii_tx_ctl)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_rgmii_tx_ctl is X/Z at %0t", $time))
				if($isunknown(vif.gmac_rgmii_rxc)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_rgmii_rxc is X/Z at %0t", $time))
				if($isunknown(vif.gmac_rgmii_rxd)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_rgmii_rxd is X/Z at %0t", $time))
				if($isunknown(vif.gmac_rgmii_rx_ctl)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_rgmii_rx_ctl is X/Z at %0t", $time))
			`endif

			// --- 3. 创建 transaction 并采样接口信号 ---
			gmac_tr = gmac_trans::type_id::create("gmac_tr");
			gmac_tr.gmac_rgmii_txc = vif.gmac_rgmii_txc;
			gmac_tr.gmac_rgmii_txd = vif.gmac_rgmii_txd;
			gmac_tr.gmac_rgmii_tx_ctl = vif.gmac_rgmii_tx_ctl;
			gmac_tr.gmac_rgmii_rxc = vif.gmac_rgmii_rxc;
			gmac_tr.gmac_rgmii_rxd = vif.gmac_rgmii_rxd;
			gmac_tr.gmac_rgmii_rx_ctl = vif.gmac_rgmii_rx_ctl;

			// --- 4. 调用回调：pre_collect ---
//			`uvm_do_callbacks(gmac_monitor, gmac_monitor_callback, pre_collect(this, gmac_tr))

			// --- 5. 广播 transaction（始终执行，不依赖宏） ---
			mon_analysis_port.write(gmac_tr);

			// --- 6. 调用回调：post_collect ---
//			`uvm_do_callbacks(gmac_monitor, gmac_monitor_callback, post_collect(this, gmac_tr))
		end
		`uvm_info(get_type_name(), "run_phase end", UVM_MEDIUM)
	endtask : run_phase

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

endclass : gmac_monitor

	//=========================================================================
	// gmac_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class gmac_monitor_callback extends uvm_callback;
		`uvm_object_utils(gmac_monitor_callback)
		function new(string name="gmac_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(gmac_monitor mon, gmac_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(gmac_monitor mon, gmac_trans tr);
		endfunction
	endclass : gmac_monitor_callback
*/

`endif
