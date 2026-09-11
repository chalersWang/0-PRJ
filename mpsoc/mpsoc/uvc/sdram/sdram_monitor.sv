`ifndef _SDRAM_MONITOR_SV_
`define _SDRAM_MONITOR_SV_

//=========================================================================
// sdram_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class sdram_monitor extends uvm_monitor;

	virtual sdram_vif       vif;
	sdram_trans             sdram_tr;

	uvm_analysis_port #(sdram_trans)    mon_analysis_port;
//	`uvm_register_cb(sdram_monitor, sdram_monitor_callback)

	`uvm_component_utils(sdram_monitor)

	function new(string name="sdram_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual sdram_vif)::get(this,"","sdram_vif",vif))
		    `uvm_fatal("sdram_monitor","virtual interface must be set for it!!!")
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

	// SDRAM 命令解码（在 cs_n 下降沿采样一次，避免重复）
	// SDRAM 命令编码 {cs_n,ras_n,cas_n,we_n}
	localparam bit [3:0] CMD_ACT  = 4'b0011; // ACTIVE
	localparam bit [3:0] CMD_READ = 4'b0101; // READ
	localparam bit [3:0] CMD_WRITE= 4'b0100; // WRITE
	localparam bit [3:0] CMD_PRE  = 4'b0010; // PRECHARGE
	localparam bit [3:0] CMD_REF  = 4'b0001; // REFRESH
	localparam bit [3:0] CMD_LMR  = 4'b0000; // LOAD MODE REGISTER

	//=========================================================================
	// run_phase: 持续监控 DUT 信号，每个时钟周期采集一次 transaction
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_SDRAM 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_SDRAM 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
		virtual task run_phase(uvm_phase phase);
		sdram_trans tr;
		logic prev_cs_n;
		bit [3:0] c;
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)
		prev_cs_n = 1'b1;
		forever begin
			@(posedge vif.clk);
			if (vif.sdram_cs_n === 1'b0 && prev_cs_n === 1'b1) begin
				c = {vif.sdram_cs_n, vif.sdram_ras_n, vif.sdram_cas_n, vif.sdram_we_n};
				tr = sdram_trans::type_id::create("sdram_tr");
				tr.cmd  = c;
				tr.bank = vif.sdram_ba;
				tr.addr = vif.sdram_addr;
				tr.wdata = vif.sdram_dq;
				tr.rdata = vif.sdram_dq;
				tr.sdram_clk = vif.sdram_clk; tr.sdram_cke = vif.sdram_cke;
				tr.sdram_cs_n = vif.sdram_cs_n; tr.sdram_ras_n = vif.sdram_ras_n;
				tr.sdram_cas_n = vif.sdram_cas_n; tr.sdram_we_n = vif.sdram_we_n;
				tr.sdram_ba = vif.sdram_ba; tr.sdram_addr = vif.sdram_addr;
				tr.sdram_dq = vif.sdram_dq; tr.sdram_dqm = vif.sdram_dqm;
				mon_analysis_port.write(tr);
			end
			prev_cs_n = vif.sdram_cs_n;
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

endclass : sdram_monitor

	//=========================================================================
	// sdram_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class sdram_monitor_callback extends uvm_callback;
		`uvm_object_utils(sdram_monitor_callback)
		function new(string name="sdram_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(sdram_monitor mon, sdram_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(sdram_monitor mon, sdram_trans tr);
		endfunction
	endclass : sdram_monitor_callback
*/

`endif
