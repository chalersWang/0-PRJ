`ifndef _SWITCH_MONITOR_SV_
`define _SWITCH_MONITOR_SV_

//=========================================================================
// switch_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class switch_monitor extends uvm_monitor;

	virtual switch_vif       vif;
	switch_trans             switch_tr;

	uvm_analysis_port #(switch_trans)    mon_analysis_port;
	`uvm_register_cb(switch_monitor, switch_monitor_callback)

	`uvm_component_utils(switch_monitor)

	function new(string name="switch_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual switch_vif)::get(this,"","switch_vif",vif))
		    `uvm_fatal("switch_monitor","virtual interface must be set for it!!!")
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
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_SWITCH 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_SWITCH 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
	virtual task run_phase(uvm_phase phase);
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)

		forever begin

			// --- 1. 等待时钟边沿（不再用 fork，避免线程泄漏） ---
			@(posedge vif.clk);

			// --- 2. X/Z 检查（通过宏控制，不影响正常采集） ---
			`ifdef CHECK_SIGNAL_XZ_SWITCH
				// 检查所有信号是否存在 X 或 Z 状态
				if($isunknown(vif.switch_mii_p0_rxclock)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p0_rxclock is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p0_rxerror)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p0_rxerror is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p0_rxenable)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p0_rxenable is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p0_rx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p0_rx is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p0_txclock)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p0_txclock is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p0_txenable)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p0_txenable is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p0_tx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p0_tx is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p0_link)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p0_link is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p1_rxclock)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p1_rxclock is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p1_rxerror)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p1_rxerror is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p1_rxenable)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p1_rxenable is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p1_rx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p1_rx is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p1_txclock)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p1_txclock is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p1_txenable)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p1_txenable is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p1_tx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p1_tx is X/Z at %0t", $time))
				if($isunknown(vif.switch_mii_p1_link)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mii_p1_link is X/Z at %0t", $time))
				if($isunknown(vif.switch_mdio_clock)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mdio_clock is X/Z at %0t", $time))
				if($isunknown(vif.switch_mdio_data)==1)
					`uvm_error(get_type_name(), $sformatf("signal:switch_mdio_data is X/Z at %0t", $time))
			`endif

			// --- 3. 创建 transaction 并采样接口信号 ---
			switch_tr = switch_trans::type_id::create("switch_tr");
			switch_tr.switch_mii_p0_rxclock = vif.switch_mii_p0_rxclock;
			switch_tr.switch_mii_p0_rxerror = vif.switch_mii_p0_rxerror;
			switch_tr.switch_mii_p0_rxenable = vif.switch_mii_p0_rxenable;
			switch_tr.switch_mii_p0_rx = vif.switch_mii_p0_rx;
			switch_tr.switch_mii_p0_txclock = vif.switch_mii_p0_txclock;
			switch_tr.switch_mii_p0_txenable = vif.switch_mii_p0_txenable;
			switch_tr.switch_mii_p0_tx = vif.switch_mii_p0_tx;
			switch_tr.switch_mii_p0_link = vif.switch_mii_p0_link;
			switch_tr.switch_mii_p1_rxclock = vif.switch_mii_p1_rxclock;
			switch_tr.switch_mii_p1_rxerror = vif.switch_mii_p1_rxerror;
			switch_tr.switch_mii_p1_rxenable = vif.switch_mii_p1_rxenable;
			switch_tr.switch_mii_p1_rx = vif.switch_mii_p1_rx;
			switch_tr.switch_mii_p1_txclock = vif.switch_mii_p1_txclock;
			switch_tr.switch_mii_p1_txenable = vif.switch_mii_p1_txenable;
			switch_tr.switch_mii_p1_tx = vif.switch_mii_p1_tx;
			switch_tr.switch_mii_p1_link = vif.switch_mii_p1_link;
			switch_tr.switch_mdio_clock = vif.switch_mdio_clock;
			switch_tr.switch_mdio_data = vif.switch_mdio_data;

			// --- 4. 调用回调：pre_collect ---
			`uvm_do_callbacks(switch_monitor, switch_monitor_callback, pre_collect(this, switch_tr))

			// --- 5. 广播 transaction（始终执行，不依赖宏） ---
			mon_analysis_port.write(switch_tr);

			// --- 6. 调用回调：post_collect ---
			`uvm_do_callbacks(switch_monitor, switch_monitor_callback, post_collect(this, switch_tr))
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

endclass : switch_monitor

	//=========================================================================
	// switch_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
	class switch_monitor_callback extends uvm_callback;
		`uvm_object_utils(switch_monitor_callback)
		function new(string name="switch_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(switch_monitor mon, switch_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(switch_monitor mon, switch_trans tr);
		endfunction
	endclass : switch_monitor_callback

`endif
