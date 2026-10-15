`ifndef _UC_MONITOR_SV_
`define _UC_MONITOR_SV_

//=========================================================================
// uc_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class uc_monitor extends uvm_monitor;

	virtual uc_vif       vif;
	uc_trans             uc_tr;

	uvm_analysis_port #(uc_trans)    mon_analysis_port;
//	`uvm_register_cb(uc_monitor, uc_monitor_callback)

	`uvm_component_utils(uc_monitor)

	function new(string name="uc_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual uc_vif)::get(this,"","uc_vif",vif))
		    `uvm_fatal("uc_monitor","virtual interface must be set for it!!!")
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
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_UC 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_UC 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
	virtual task run_phase(uvm_phase phase);
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)

		forever begin

			// --- 1. 等待时钟边沿（不再用 fork，避免线程泄漏） ---
			@(posedge vif.clk);

			// --- 2. X/Z 检查（通过宏控制，不影响正常采集） ---
			`ifdef CHECK_SIGNAL_XZ_UC
				if($isunknown(vif.UC_CS)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_CS is X/Z at %0t", $time))
				if($isunknown(vif.UC_RD)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_RD is X/Z at %0t", $time))
				if($isunknown(vif.UC_WR)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_WR is X/Z at %0t", $time))
				if($isunknown(vif.UC_ADDR)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_ADDR is X/Z at %0t", $time))
				if($isunknown(vif.UC_DATA_IN)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_DATA_IN is X/Z at %0t", $time))
				if($isunknown(vif.UC_DATA_OUT)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_DATA_OUT is X/Z at %0t", $time))
				if($isunknown(vif.UC_DATA_ENA)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_DATA_ENA is X/Z at %0t", $time))
				if($isunknown(vif.UC_BUSY)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_BUSY is X/Z at %0t", $time))
				if($isunknown(vif.UC_IRQ_OUT_1)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_IRQ_OUT_1 is X/Z at %0t", $time))
				if($isunknown(vif.UC_IRQ_OUT_2)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_IRQ_OUT_2 is X/Z at %0t", $time))
				if($isunknown(vif.UC_ALE)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_ALE is X/Z at %0t", $time))
				if($isunknown(vif.UC_NBHE)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_NBHE is X/Z at %0t", $time))
				if($isunknown(vif.NRESET)==1)
					`uvm_error(get_type_name(), $sformatf("signal:NRESET is X/Z at %0t", $time))
				if($isunknown(vif.CLK_PDI_EXT)==1)
					`uvm_error(get_type_name(), $sformatf("signal:CLK_PDI_EXT is X/Z at %0t", $time))
				if($isunknown(vif.ADDR_MASK_EN_CFG)==1)
					`uvm_error(get_type_name(), $sformatf("signal:ADDR_MASK_EN_CFG is X/Z at %0t", $time))
				if($isunknown(vif.BUS_WIDTH_CFG)==1)
					`uvm_error(get_type_name(), $sformatf("signal:BUS_WIDTH_CFG is X/Z at %0t", $time))
				if($isunknown(vif.CONFIG_REG)==1)
					`uvm_error(get_type_name(), $sformatf("signal:CONFIG_REG is X/Z at %0t", $time))
				if($isunknown(vif.IRQ_IN)==1)
					`uvm_error(get_type_name(), $sformatf("signal:IRQ_IN is X/Z at %0t", $time))
				if($isunknown(vif.UC_IF_IRR)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_IF_IRR is X/Z at %0t", $time))
				if($isunknown(vif.UC_IF_ACTIVE)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_IF_ACTIVE is X/Z at %0t", $time))
				if($isunknown(vif.UC_IF_IRQ)==1)
					`uvm_error(get_type_name(), $sformatf("signal:UC_IF_IRQ is X/Z at %0t", $time))
				if($isunknown(vif.READ_BYTE_SEL)==1)
					`uvm_error(get_type_name(), $sformatf("signal:READ_BYTE_SEL is X/Z at %0t", $time))
				if($isunknown(vif.BUS_WIDTH_CODE)==1)
					`uvm_error(get_type_name(), $sformatf("signal:BUS_WIDTH_CODE is X/Z at %0t", $time))
				if($isunknown(vif.WRITE_BYTE_ENA)==1)
					`uvm_error(get_type_name(), $sformatf("signal:WRITE_BYTE_ENA is X/Z at %0t", $time))
				if($isunknown(vif.MEM_ADDR_WRITE)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MEM_ADDR_WRITE is X/Z at %0t", $time))
				if($isunknown(vif.MEM_DATA_OUT)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MEM_DATA_OUT is X/Z at %0t", $time))
				if($isunknown(vif.MEM_WRITE_EN)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MEM_WRITE_EN is X/Z at %0t", $time))
				if($isunknown(vif.MEM_WRITE_READY)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MEM_WRITE_READY is X/Z at %0t", $time))
				if($isunknown(vif.MEM_ADDR_READ)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MEM_ADDR_READ is X/Z at %0t", $time))
				if($isunknown(vif.MEM_DATA_IN)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MEM_DATA_IN is X/Z at %0t", $time))
				if($isunknown(vif.MEM_READ_EN)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MEM_READ_EN is X/Z at %0t", $time))
				if($isunknown(vif.MEM_READ_READY)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MEM_READ_READY is X/Z at %0t", $time))
				if($isunknown(vif.MEM_READ_ACK)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MEM_READ_ACK is X/Z at %0t", $time))
			`endif

			// --- 3. 创建 transaction 并采样接口信号 ---
			uc_tr = uc_trans::type_id::create("uc_tr");
			uc_tr.UC_CS = vif.UC_CS;
			uc_tr.UC_RD = vif.UC_RD;
			uc_tr.UC_WR = vif.UC_WR;
			uc_tr.UC_ADDR = vif.UC_ADDR;
			uc_tr.UC_DATA_IN = vif.UC_DATA_IN;
			uc_tr.UC_DATA_OUT = vif.UC_DATA_OUT;
			uc_tr.UC_DATA_ENA = vif.UC_DATA_ENA;
			uc_tr.UC_BUSY = vif.UC_BUSY;
			uc_tr.UC_IRQ_OUT_1 = vif.UC_IRQ_OUT_1;
			uc_tr.UC_IRQ_OUT_2 = vif.UC_IRQ_OUT_2;
			uc_tr.UC_ALE = vif.UC_ALE;
			uc_tr.UC_NBHE = vif.UC_NBHE;
			uc_tr.NRESET = vif.NRESET;
			uc_tr.CLK_PDI_EXT = vif.CLK_PDI_EXT;
			uc_tr.ADDR_MASK_EN_CFG = vif.ADDR_MASK_EN_CFG;
			uc_tr.BUS_WIDTH_CFG = vif.BUS_WIDTH_CFG;
			uc_tr.CONFIG_REG = vif.CONFIG_REG;
			uc_tr.IRQ_IN = vif.IRQ_IN;
			uc_tr.UC_IF_IRR = vif.UC_IF_IRR;
			uc_tr.UC_IF_ACTIVE = vif.UC_IF_ACTIVE;
			uc_tr.UC_IF_IRQ = vif.UC_IF_IRQ;
			uc_tr.READ_BYTE_SEL = vif.READ_BYTE_SEL;
			uc_tr.BUS_WIDTH_CODE = vif.BUS_WIDTH_CODE;
			uc_tr.WRITE_BYTE_ENA = vif.WRITE_BYTE_ENA;
			uc_tr.MEM_ADDR_WRITE = vif.MEM_ADDR_WRITE;
			uc_tr.MEM_DATA_OUT = vif.MEM_DATA_OUT;
			uc_tr.MEM_WRITE_EN = vif.MEM_WRITE_EN;
			uc_tr.MEM_WRITE_READY = vif.MEM_WRITE_READY;
			uc_tr.MEM_ADDR_READ = vif.MEM_ADDR_READ;
			uc_tr.MEM_DATA_IN = vif.MEM_DATA_IN;
			uc_tr.MEM_READ_EN = vif.MEM_READ_EN;
			uc_tr.MEM_READ_READY = vif.MEM_READ_READY;
			uc_tr.MEM_READ_ACK = vif.MEM_READ_ACK;

			// --- 4. 调用回调：pre_collect ---
//			`uvm_do_callbacks(uc_monitor, uc_monitor_callback, pre_collect(this, uc_tr))

			// --- 5. 广播 transaction（始终执行，不依赖宏） ---
			mon_analysis_port.write(uc_tr);

			// --- 6. 调用回调：post_collect ---
//			`uvm_do_callbacks(uc_monitor, uc_monitor_callback, post_collect(this, uc_tr))
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

endclass : uc_monitor

	//=========================================================================
	// uc_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class uc_monitor_callback extends uvm_callback;
		`uvm_object_utils(uc_monitor_callback)
		function new(string name="uc_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(uc_monitor mon, uc_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(uc_monitor mon, uc_trans tr);
		endfunction
	endclass : uc_monitor_callback
*/

`endif
