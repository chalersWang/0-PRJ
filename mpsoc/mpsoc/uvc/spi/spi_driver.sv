`ifndef _SPI_DRIVER_SV_
`define _SPI_DRIVER_SV_

//=========================================================================
// spi_driver: 将 transaction 驱动到 DUT 接口（时序级）
//   继承自 uvm_driver，通过 seq_item_port 从 sequencer 获取 transaction
//   main_phase 中运行驱动循环，reset_phase 中复位所有信号
//=========================================================================
class spi_driver extends uvm_driver#(spi_trans);

	virtual spi_vif    vif;
	// driver callback 池，允许用户注册回调扩展 driver 行为
//	`uvm_register_cb(spi_driver, spi_driver_callback)

	`uvm_component_utils(spi_driver)

	function new(string name="spi_driver",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	//build_phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(),"build_phase begin ...",UVM_LOW)
		// 从 config_db 获取 virtual interface，若未设置则 fatal
		if(!uvm_config_db#(virtual spi_vif)::get(this,"","spi_vif",vif))
		    `uvm_fatal("spi_driver","virtual interface must be set for it!!!")
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

	//reset_phase
	virtual task reset_phase(uvm_phase phase);
		super.reset_phase(phase);
		`uvm_info(get_full_name(),"reset_phase begin ...",UVM_LOW)
		// 复位阶段：将所有 DUT 输入/双向信号驱动为复位值（输出由 DUT 驱动）
		vif.miso = 'd0;
		`uvm_info(get_full_name(),"reset_phase end ...",UVM_LOW)
	endtask


	//=========================================================================
	// main_phase: 主驱动循环
	//   使用 try_next_item（非阻塞）而非 get_next_item（阻塞），
	//   这样当 sequencer 没有更多 transaction 时能优雅退出
	//   配合 phase_ready_to_end 实现 drain time 控制
	//=========================================================================
	virtual task main_phase(uvm_phase phase);
		`uvm_info(get_type_name(), "main_phase begin", UVM_MEDIUM)

		// 等待复位释放后再开始驱动
		@(posedge vif.rstn);
		repeat(5) @(posedge vif.clk);  // 复位后额外等待几个周期稳定

		// 驱动 item 到总线，使用 try_next_item 实现非阻塞退出
		while(1) begin
			seq_item_port.try_next_item(req);
			if (req == null) begin
				// 没有更多 item，退出循环，phase 正常结束
				@(posedge vif.clk);
			end
			else begin
				// 调用回调：pre_driver
//				`uvm_do_callbacks(spi_driver, spi_driver_callback, pre_driver(this, req))
				// --- 驱动 transaction ---
				driver_one_pkt(req);
				// --- 驱动完成 ---
				// 调用回调：post_driver
//				`uvm_do_callbacks(spi_driver, spi_driver_callback, post_driver(this, req))
				seq_item_port.item_done();
			end
		end
		`uvm_info(get_type_name(), "main_phase end", UVM_MEDIUM)
	endtask : main_phase

	//=========================================================================
	// phase_ready_to_end: drain time 管理
	//   当 phase 准备结束时，给 driver 一段 drain time 完成当前事务
	//   避免正在驱动的 transaction 被截断
	//=========================================================================
	function void phase_ready_to_end(uvm_phase phase);
		if (phase.get_name() == "main") begin
			`uvm_info(get_type_name(), $sformatf("phase %s ending, draining...", phase.get_name()), UVM_MEDIUM)
			// 等待当前事务完成（可通过 config 配置 drain_time）
			// repeat (drain_cycles) @(posedge vif.clk);
		end
	endfunction

	// SPI slave 数据相位（模式 0：CPOL=0/CPHA=0，下降沿驱动、上升沿采样）
	//   DUT 主机驱动 sclk/mosi/ss_n；本 driver 仅驱动 miso（slave 数据输出）
	localparam int TIMEOUT_CYCLES = 10000;

	//=========================================================================
	// driver_one_pkt: 驱动单笔 transaction 到接口
	//   【用户需在此实现时序驱动逻辑】
	//   典型流程：
	//     @(posedge vif.clk);
	//     foreach(req.data[i]) vif.data = req.data[i];  // 驱动数据
	//     vif.valid = 1'b1;                             // 拉起 valid
	//     @(posedge vif.clk);
	//     vif.valid = 1'b0;                             // 放下 valid
	//=========================================================================
			virtual task driver_one_pkt(spi_trans tr);
		`uvm_info(get_type_name(), $sformatf("spi slave: ch=%0d frame_size=%0d tx=0x%0h",
			tr.channel, tr.frame_size, tr.tx_data), UVM_HIGH)
		tr.rx_data = '0;
		// 等待主机片选并完成整帧传输；整体带超时，浮空 vif 下也能退出
		fork
			begin : xfer
				wait(vif.ss_n[tr.channel] === 1'b0);
				for (int i = tr.frame_size-1; i >= 0; i--) begin
					@(negedge vif.sclk);
					vif.miso = tr.tx_data[i];
					@(posedge vif.sclk);
					tr.rx_data[i] = vif.mosi;
				end
				wait(vif.ss_n[tr.channel] === 1'b1);
			end
			begin : timeout
				repeat(TIMEOUT_CYCLES) @(posedge vif.clk);
				`uvm_warning(get_type_name(), "spi slave: 等待主机传输超时，放弃本次传输")
			end
		join_any
		disable fork;
		vif.miso = 1'b0;   // 释放 miso（正常完成或超时）
		`uvm_info(get_type_name(), $sformatf("spi slave: rx=0x%0h", tr.rx_data), UVM_HIGH)
		`uvm_info(get_type_name(),"driver_one_pkt end ...",UVM_HIGH)
	endtask : driver_one_pkt

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

endclass : spi_driver

	//=========================================================================
	// spi_driver_callback: Driver 回调基类
	//   用户可继承此类扩展 driver 行为（如错误注入、协议检查等）
	//   使用方式：
	//     class my_driver_cb extends spi_driver_callback;
	//       function void pre_driver(...); ... endfunction
	//     endclass
	//     spi_driver_callback::add(drv, my_cb);
	//=========================================================================
/*
	class spi_driver_callback extends uvm_callback;
		`uvm_object_utils(spi_driver_callback)
		function new(string name="spi_driver_callback");
			super.new(name);
		endfunction

		// 在 driver 驱动前调用，可修改 transaction 内容
		virtual function void pre_driver(spi_driver drv, spi_trans tr);
		endfunction

		// 在 driver 驱动后调用，可检查驱动结果
		virtual function void post_driver(spi_driver drv, spi_trans tr);
		endfunction
	endclass : spi_driver_callback
*/

`endif
