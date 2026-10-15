`ifndef _SECURITY_MONITOR_SV_
`define _SECURITY_MONITOR_SV_

//=========================================================================
// security_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class security_monitor extends uvm_monitor;

	virtual security_vif       vif;
	security_trans             security_tr;

	uvm_analysis_port #(security_trans)    mon_analysis_port;
//	`uvm_register_cb(security_monitor, security_monitor_callback)

	`uvm_component_utils(security_monitor)

	function new(string name="security_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual security_vif)::get(this,"","security_vif",vif))
		    `uvm_fatal("security_monitor","virtual interface must be set for it!!!")
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
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_SECURITY 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_SECURITY 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
	virtual task run_phase(uvm_phase phase);
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)

		forever begin

			// --- 1. 等待时钟边沿（不再用 fork，避免线程泄漏） ---
			@(posedge vif.clk);

			// --- 2. X/Z 检查（通过宏控制，不影响正常采集） ---
			`ifdef CHECK_SIGNAL_XZ_SECURITY
				if($isunknown(vif.i_clk)==1)
					`uvm_error(get_type_name(), $sformatf("signal:i_clk is X/Z at %0t", $time))
				if($isunknown(vif.i_rst_n)==1)
					`uvm_error(get_type_name(), $sformatf("signal:i_rst_n is X/Z at %0t", $time))
				if($isunknown(vif.o_irq)==1)
					`uvm_error(get_type_name(), $sformatf("signal:o_irq is X/Z at %0t", $time))
				if($isunknown(vif.i_scan_mode)==1)
					`uvm_error(get_type_name(), $sformatf("signal:i_scan_mode is X/Z at %0t", $time))
				if($isunknown(vif.i_skip_startup)==1)
					`uvm_error(get_type_name(), $sformatf("signal:i_skip_startup is X/Z at %0t", $time))
				if($isunknown(vif.o_verify_vld)==1)
					`uvm_error(get_type_name(), $sformatf("signal:o_verify_vld is X/Z at %0t", $time))
				if($isunknown(vif.o_verify_ok)==1)
					`uvm_error(get_type_name(), $sformatf("signal:o_verify_ok is X/Z at %0t", $time))
				if($isunknown(vif.i_verify_ack)==1)
					`uvm_error(get_type_name(), $sformatf("signal:i_verify_ack is X/Z at %0t", $time))
				if($isunknown(vif.o_ro_clk)==1)
					`uvm_error(get_type_name(), $sformatf("signal:o_ro_clk is X/Z at %0t", $time))
				if($isunknown(vif.o_ro_out)==1)
					`uvm_error(get_type_name(), $sformatf("signal:o_ro_out is X/Z at %0t", $time))
				if($isunknown(vif.o_chip_id)==1)
					`uvm_error(get_type_name(), $sformatf("signal:o_chip_id is X/Z at %0t", $time))
				if($isunknown(vif.o_uid)==1)
					`uvm_error(get_type_name(), $sformatf("signal:o_uid is X/Z at %0t", $time))
				if($isunknown(vif.o_efuse_dout)==1)
					`uvm_error(get_type_name(), $sformatf("signal:o_efuse_dout is X/Z at %0t", $time))
				if($isunknown(vif.i_efuse_pgm)==1)
					`uvm_error(get_type_name(), $sformatf("signal:i_efuse_pgm is X/Z at %0t", $time))
				if($isunknown(vif.i_efuse_sclk)==1)
					`uvm_error(get_type_name(), $sformatf("signal:i_efuse_sclk is X/Z at %0t", $time))
				if($isunknown(vif.i_efuse_cs)==1)
					`uvm_error(get_type_name(), $sformatf("signal:i_efuse_cs is X/Z at %0t", $time))
				if($isunknown(vif.i_efuse_wr)==1)
					`uvm_error(get_type_name(), $sformatf("signal:i_efuse_wr is X/Z at %0t", $time))
			`endif

			// --- 3. 创建 transaction 并采样接口信号 ---
			security_tr = security_trans::type_id::create("security_tr");
			security_tr.i_clk = vif.i_clk;
			security_tr.i_rst_n = vif.i_rst_n;
			security_tr.o_irq = vif.o_irq;
			security_tr.i_scan_mode = vif.i_scan_mode;
			security_tr.i_skip_startup = vif.i_skip_startup;
			security_tr.o_verify_vld = vif.o_verify_vld;
			security_tr.o_verify_ok = vif.o_verify_ok;
			security_tr.i_verify_ack = vif.i_verify_ack;
			security_tr.o_ro_clk = vif.o_ro_clk;
			security_tr.o_ro_out = vif.o_ro_out;
			security_tr.o_chip_id = vif.o_chip_id;
			security_tr.o_uid = vif.o_uid;
			security_tr.o_efuse_dout = vif.o_efuse_dout;
			security_tr.i_efuse_pgm = vif.i_efuse_pgm;
			security_tr.i_efuse_sclk = vif.i_efuse_sclk;
			security_tr.i_efuse_cs = vif.i_efuse_cs;
			security_tr.i_efuse_wr = vif.i_efuse_wr;

			// --- 4. 调用回调：pre_collect ---
//			`uvm_do_callbacks(security_monitor, security_monitor_callback, pre_collect(this, security_tr))

			// --- 5. 广播 transaction（始终执行，不依赖宏） ---
			mon_analysis_port.write(security_tr);

			// --- 6. 调用回调：post_collect ---
//			`uvm_do_callbacks(security_monitor, security_monitor_callback, post_collect(this, security_tr))
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

endclass : security_monitor

	//=========================================================================
	// security_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class security_monitor_callback extends uvm_callback;
		`uvm_object_utils(security_monitor_callback)
		function new(string name="security_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(security_monitor mon, security_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(security_monitor mon, security_trans tr);
		endfunction
	endclass : security_monitor_callback
*/

`endif
