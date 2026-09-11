`ifndef _I2C_MONITOR_SV_
`define _I2C_MONITOR_SV_

//=========================================================================
// i2c_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class i2c_monitor extends uvm_monitor;

	virtual i2c_vif       vif;
	i2c_trans             i2c_tr;

	uvm_analysis_port #(i2c_trans)    mon_analysis_port;
//	`uvm_register_cb(i2c_monitor, i2c_monitor_callback)

	`uvm_component_utils(i2c_monitor)

	function new(string name="i2c_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual i2c_vif)::get(this,"","i2c_vif",vif))
		    `uvm_fatal("i2c_monitor","virtual interface must be set for it!!!")
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

	// I2C 协议级采集辅助任务
	task mon_wait_start();
		forever begin
			@(negedge vif.sda);
			if (vif.scl === 1'b1) return;
		end
	endtask : mon_wait_start

	task mon_sample_byte(output bit [7:0] b);
		for (int i = 7; i >= 0; i--) begin
			@(posedge vif.scl);
			b[i] = vif.sda;
		end
	endtask : mon_sample_byte

	task mon_sample_ack(output bit a);
		@(negedge vif.scl);
		@(posedge vif.scl);
		a = vif.sda;
	endtask : mon_sample_ack

	task mon_wait_stop();
		forever begin
			@(posedge vif.sda);
			if (vif.scl === 1'b1) return;
		end
	endtask : mon_wait_stop


	//=========================================================================
	// run_phase: 持续监控 DUT 信号，每个时钟周期采集一次 transaction
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_I2C 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_I2C 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
		virtual task run_phase(uvm_phase phase);
		i2c_trans tr;
		bit [7:0] byte;
		bit ack;
		bit stop_detected;
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)
		forever begin
			// 1. 等待 START
			mon_wait_start();
			tr = i2c_trans::type_id::create("i2c_tr");
			// 2. 地址字节（7-bit addr + R/W）
			mon_sample_byte(byte);
			tr.addr = byte[7:1];
			tr.rnw  = byte[0];
			mon_sample_ack(ack);
			// 3. 数据字节，直到 STOP（简化：不支持 repeated-START / 时钟拉伸）
			tr.data = new[0];
			stop_detected = 0;
			while (!stop_detected) begin
				fork
					begin
						mon_sample_byte(byte);
						mon_sample_ack(ack);
						tr.data = new[tr.data.size()+1](tr.data);
						tr.data[tr.data.size()-1] = byte;
					end
					begin
						mon_wait_stop();
						stop_detected = 1;
					end
				join_any
				disable fork;
			end
			// 4. 快照原始信号并广播
			tr.scl = vif.scl;
			tr.sda = vif.sda;
			tr.ic_intr = vif.ic_intr;
			mon_analysis_port.write(tr);
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

endclass : i2c_monitor

	//=========================================================================
	// i2c_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class i2c_monitor_callback extends uvm_callback;
		`uvm_object_utils(i2c_monitor_callback)
		function new(string name="i2c_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(i2c_monitor mon, i2c_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(i2c_monitor mon, i2c_trans tr);
		endfunction
	endclass : i2c_monitor_callback
*/

`endif
