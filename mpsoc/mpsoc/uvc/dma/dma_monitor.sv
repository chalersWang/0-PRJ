`ifndef _DMA_MONITOR_SV_
`define _DMA_MONITOR_SV_

//=========================================================================
// dma_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class dma_monitor extends uvm_monitor;

	virtual dma_vif       vif;
	dma_trans             dma_tr;

	uvm_analysis_port #(dma_trans)    mon_analysis_port;
//	`uvm_register_cb(dma_monitor, dma_monitor_callback)

	`uvm_component_utils(dma_monitor)

	function new(string name="dma_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual dma_vif)::get(this,"","dma_vif",vif))
		    `uvm_fatal("dma_monitor","virtual interface must be set for it!!!")
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
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_DMA 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_DMA 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
		virtual task run_phase(uvm_phase phase);
		dma_trans tr;
		logic [7:0] prev_req, prev_ack, prev_int;
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)
		prev_req = vif.dma_req;
		prev_ack = vif.dma_ack;
		prev_int = vif.dma_int;
		forever begin
			@(posedge vif.clk);
			for (int c = 0; c < 8; c++) begin
				if (vif.dma_req[c] && !prev_req[c]) begin
					tr = dma_trans::type_id::create("dma_tr");
					tr.channel = c; tr.ack_seen = 0;
					tr.dma_req = vif.dma_req; tr.dma_ack = vif.dma_ack; tr.dma_int = vif.dma_int;
					mon_analysis_port.write(tr);
				end
				if (vif.dma_ack[c] && !prev_ack[c]) begin
					tr = dma_trans::type_id::create("dma_tr");
					tr.channel = c; tr.ack_seen = 1;
					tr.dma_req = vif.dma_req; tr.dma_ack = vif.dma_ack; tr.dma_int = vif.dma_int;
					mon_analysis_port.write(tr);
				end
				if (vif.dma_int[c] && !prev_int[c]) begin
					tr = dma_trans::type_id::create("dma_tr");
					tr.channel = c; tr.ack_seen = 0;
					tr.dma_req = vif.dma_req; tr.dma_ack = vif.dma_ack; tr.dma_int = vif.dma_int;
					mon_analysis_port.write(tr);
				end
			end
			prev_req = vif.dma_req;
			prev_ack = vif.dma_ack;
			prev_int = vif.dma_int;
		end
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

endclass : dma_monitor

	//=========================================================================
	// dma_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class dma_monitor_callback extends uvm_callback;
		`uvm_object_utils(dma_monitor_callback)
		function new(string name="dma_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(dma_monitor mon, dma_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(dma_monitor mon, dma_trans tr);
		endfunction
	endclass : dma_monitor_callback
*/

`endif
