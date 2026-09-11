`ifndef _SDRAM_DRIVER_SV_
`define _SDRAM_DRIVER_SV_

//=========================================================================
// sdram_driver: 将 transaction 驱动到 DUT 接口（时序级）
//   继承自 uvm_driver，通过 seq_item_port 从 sequencer 获取 transaction
//   main_phase 中运行驱动循环，reset_phase 中复位所有信号
//=========================================================================
class sdram_driver extends uvm_driver#(sdram_trans);

	virtual sdram_vif    vif;
	// driver callback 池，允许用户注册回调扩展 driver 行为
//	`uvm_register_cb(sdram_driver, sdram_driver_callback)

	`uvm_component_utils(sdram_driver)

	function new(string name="sdram_driver",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	//build_phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(),"build_phase begin ...",UVM_LOW)
		// 从 config_db 获取 virtual interface，若未设置则 fatal
		if(!uvm_config_db#(virtual sdram_vif)::get(this,"","sdram_vif",vif))
		    `uvm_fatal("sdram_driver","virtual interface must be set for it!!!")
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
		// 复位：数据总线释放为高阻（其余控制信号由 DUT 控制器驱动）
		vif.sdram_dq = 'z;
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
//				`uvm_do_callbacks(sdram_driver, sdram_driver_callback, pre_driver(this, req))
				// --- 驱动 transaction ---
				driver_one_pkt(req);
				// --- 驱动完成 ---
				// 调用回调：post_driver
//				`uvm_do_callbacks(sdram_driver, sdram_driver_callback, post_driver(this, req))
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

	// 简化的 SDRAM 存储器模型（功能级，非完整 JEDEC 时序）
	//   DUT 为内存控制器（驱动控制信号 + sdram_clk）；本 driver 扮演 SDRAM 器件，
	//   在 READ 命令后于 dq 输出数据、在 WRITE 命令时采样 dq。
	//   说明：时序以系统时钟 vif.clk 对齐（真实模型应使用 sdram_clk）；
	//   CAS 延迟简化为 2 个周期，未建模刷新/突发长度/行激活状态机。
	// SDRAM 命令编码 {cs_n,ras_n,cas_n,we_n}
	localparam bit [3:0] CMD_ACT  = 4'b0011; // ACTIVE
	localparam bit [3:0] CMD_READ = 4'b0101; // READ
	localparam bit [3:0] CMD_WRITE= 4'b0100; // WRITE
	localparam bit [3:0] CMD_PRE  = 4'b0010; // PRECHARGE
	localparam bit [3:0] CMD_REF  = 4'b0001; // REFRESH
	localparam bit [3:0] CMD_LMR  = 4'b0000; // LOAD MODE REGISTER
	localparam int TIMEOUT_CYCLES = 10000;

	bit [15:0] mem [bit [14:0]];   // key = {bank, addr}

	function bit [15:0] mem_read(input bit [1:0] bank, input bit [12:0] addr);
		return mem[{bank, addr}];
	endfunction

	function void mem_write(input bit [1:0] bank, input bit [12:0] addr, input bit [15:0] d);
		mem[{bank, addr}] = d;
	endfunction


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
			virtual task driver_one_pkt(sdram_trans tr);
		bit [3:0] c;
		`uvm_info(get_type_name(), $sformatf("sdram: 期望命令 0x%0h", tr.cmd), UVM_HIGH)
		// 等待命令有效（cs_n 拉低）；带超时，浮空 vif 下放弃本次传输
		fork
			begin : wait_cmd
				do @(posedge vif.clk); while (vif.sdram_cs_n !== 1'b0);
			end
			begin : timeout
				repeat(TIMEOUT_CYCLES) @(posedge vif.clk);
			end
		join_any
		disable fork;
		if (vif.sdram_cs_n !== 1'b0) begin
			`uvm_warning(get_type_name(), "sdram: 等待命令超时，放弃本次传输")
			return;
		end
		c = {vif.sdram_cs_n, vif.sdram_ras_n, vif.sdram_cas_n, vif.sdram_we_n};
		tr.cmd  = c;
		tr.bank = vif.sdram_ba;
		tr.addr = vif.sdram_addr;
		case (c)
			CMD_READ: begin
				repeat(2) @(posedge vif.clk);   // 简化 CAS=2
				vif.sdram_dq = mem_read(tr.bank, tr.addr);
				tr.rdata = vif.sdram_dq;
				@(posedge vif.clk);
				vif.sdram_dq = 'z;
			end
			CMD_WRITE: begin
				tr.wdata = vif.sdram_dq;
				mem_write(tr.bank, tr.addr, tr.wdata);
			end
			CMD_ACT, CMD_PRE, CMD_REF, CMD_LMR: begin
				// 无数据相位
			end
			default: ;
		endcase
		`uvm_info(get_type_name(), $sformatf("sdram: cmd=0x%0h bank=%0d addr=0x%0h rdata=0x%0h",
			tr.cmd, tr.bank, tr.addr, tr.rdata), UVM_HIGH)
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

endclass : sdram_driver

	//=========================================================================
	// sdram_driver_callback: Driver 回调基类
	//   用户可继承此类扩展 driver 行为（如错误注入、协议检查等）
	//   使用方式：
	//     class my_driver_cb extends sdram_driver_callback;
	//       function void pre_driver(...); ... endfunction
	//     endclass
	//     sdram_driver_callback::add(drv, my_cb);
	//=========================================================================
/*
	class sdram_driver_callback extends uvm_callback;
		`uvm_object_utils(sdram_driver_callback)
		function new(string name="sdram_driver_callback");
			super.new(name);
		endfunction

		// 在 driver 驱动前调用，可修改 transaction 内容
		virtual function void pre_driver(sdram_driver drv, sdram_trans tr);
		endfunction

		// 在 driver 驱动后调用，可检查驱动结果
		virtual function void post_driver(sdram_driver drv, sdram_trans tr);
		endfunction
	endclass : sdram_driver_callback
*/

`endif
