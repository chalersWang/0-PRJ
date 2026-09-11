`ifndef _SPI_MONITOR_SV_
`define _SPI_MONITOR_SV_

//=========================================================================
// spi_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class spi_monitor extends uvm_monitor;

	virtual spi_vif       vif;
	spi_trans             spi_tr;

	uvm_analysis_port #(spi_trans)    mon_analysis_port;
//	`uvm_register_cb(spi_monitor, spi_monitor_callback)

	`uvm_component_utils(spi_monitor)

	function new(string name="spi_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual spi_vif)::get(this,"","spi_vif",vif))
		    `uvm_fatal("spi_monitor","virtual interface must be set for it!!!")
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
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_SPI 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_SPI 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
		virtual task run_phase(uvm_phase phase);
		spi_trans tr;
		int i;
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)
		forever begin
			// 等待任一通道片选选中
			@(vif.ss_n);
			if (vif.ss_n === 4'hf) continue;
			tr = spi_trans::type_id::create("spi_tr");
			tr.channel = 0;
			for (int c = 0; c < 4; c++)
				if (vif.ss_n[c] === 1'b0) tr.channel = c;
			tr.rx_data = '0;
			tr.tx_data = '0;
			// 捕获直到片选拉高（帧结束），上限 32 bit
			i = 0;
			while (vif.ss_n[tr.channel] === 1'b0 && i < 32) begin
				@(posedge vif.sclk);
				tr.rx_data[i] = vif.mosi;
				tr.tx_data[i] = vif.miso;
				i++;
			end
			tr.frame_size = i;
			// 快照原始信号并广播
			tr.sclk = vif.sclk; tr.mosi = vif.mosi; tr.miso = vif.miso;
			tr.ss_n = vif.ss_n; tr.ssi_intr = vif.ssi_intr;
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

endclass : spi_monitor

	//=========================================================================
	// spi_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class spi_monitor_callback extends uvm_callback;
		`uvm_object_utils(spi_monitor_callback)
		function new(string name="spi_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(spi_monitor mon, spi_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(spi_monitor mon, spi_trans tr);
		endfunction
	endclass : spi_monitor_callback
*/

`endif
