`ifndef _DMA_DRIVER_SV_
`define _DMA_DRIVER_SV_

//=========================================================================
// dma_driver: 将 transaction 驱动到 DUT 接口（时序级）
//   继承自 uvm_driver，通过 seq_item_port 从 sequencer 获取 transaction
//   main_phase 中运行驱动循环，reset_phase 中复位所有信号
//=========================================================================
class dma_driver extends uvm_driver#(dma_trans);

	virtual dma_vif    vif;
	// driver callback 池，允许用户注册回调扩展 driver 行为
//	`uvm_register_cb(dma_driver, dma_driver_callback)

	`uvm_component_utils(dma_driver)

	function new(string name="dma_driver",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	//build_phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(),"build_phase begin ...",UVM_LOW)
		// 从 config_db 获取 virtual interface，若未设置则 fatal
		if(!uvm_config_db#(virtual dma_vif)::get(this,"","dma_vif",vif))
		    `uvm_fatal("dma_driver","virtual interface must be set for it!!!")
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
		vif.dma_req = 'd0;
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
//				`uvm_do_callbacks(dma_driver, dma_driver_callback, pre_driver(this, req))
				// --- 驱动 transaction ---
				driver_one_pkt(req);
				// --- 驱动完成 ---
				// 调用回调：post_driver
//				`uvm_do_callbacks(dma_driver, dma_driver_callback, post_driver(this, req))
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

	// DMA 单次传输 req/ack 握手：req 拉高 -> 等 ack -> 撤 req -> 等 ack 拉低

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
		virtual task driver_one_pkt(dma_trans tr);
		`uvm_info(get_type_name(), $sformatf("dma: ch=%0d 发起传输请求", tr.channel), UVM_HIGH)
		tr.ack_seen = 0;
		vif.dma_req[tr.channel] = 1'b1;
		fork
			begin
				wait(vif.dma_ack[tr.channel] === 1'b1);
				tr.ack_seen = 1;
			end
			begin
				repeat(tr.handshake_delay) @(posedge vif.clk);
			end
		join_any
		disable fork;
		vif.dma_req[tr.channel] = 1'b0;          // 撤销请求
		// 等待握手完成（ack 拉低）；带超时，浮空 vif 下也能退出
		fork
			begin
				wait(vif.dma_ack[tr.channel] === 1'b0);
			end
			begin
				repeat(tr.handshake_delay) @(posedge vif.clk);
			end
		join_any
		disable fork;
		`uvm_info(get_type_name(), $sformatf("dma: ch=%0d ack_seen=%0b", tr.channel, tr.ack_seen), UVM_HIGH)
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

endclass : dma_driver

	//=========================================================================
	// dma_driver_callback: Driver 回调基类
	//   用户可继承此类扩展 driver 行为（如错误注入、协议检查等）
	//   使用方式：
	//     class my_driver_cb extends dma_driver_callback;
	//       function void pre_driver(...); ... endfunction
	//     endclass
	//     dma_driver_callback::add(drv, my_cb);
	//=========================================================================
/*
	class dma_driver_callback extends uvm_callback;
		`uvm_object_utils(dma_driver_callback)
		function new(string name="dma_driver_callback");
			super.new(name);
		endfunction

		// 在 driver 驱动前调用，可修改 transaction 内容
		virtual function void pre_driver(dma_driver drv, dma_trans tr);
		endfunction

		// 在 driver 驱动后调用，可检查驱动结果
		virtual function void post_driver(dma_driver drv, dma_trans tr);
		endfunction
	endclass : dma_driver_callback
*/

`endif
