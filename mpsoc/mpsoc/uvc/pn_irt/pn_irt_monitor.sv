`ifndef _PN_IRT_MONITOR_SV_
`define _PN_IRT_MONITOR_SV_

//=========================================================================
// pn_irt_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class pn_irt_monitor extends uvm_monitor;

	virtual pn_irt_vif       vif;
	pn_irt_trans             pn_irt_tr;

	uvm_analysis_port #(pn_irt_trans)    mon_analysis_port;
//	`uvm_register_cb(pn_irt_monitor, pn_irt_monitor_callback)

	`uvm_component_utils(pn_irt_monitor)

	function new(string name="pn_irt_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual pn_irt_vif)::get(this,"","pn_irt_vif",vif))
		    `uvm_fatal("pn_irt_monitor","virtual interface must be set for it!!!")
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
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_PN_IRT 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_PN_IRT 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
	virtual task run_phase(uvm_phase phase);
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)

		forever begin

			// --- 1. 等待时钟边沿（不再用 fork，避免线程泄漏） ---
			@(posedge vif.clk);

			// --- 2. X/Z 检查（通过宏控制，不影响正常采集） ---
			`ifdef CHECK_SIGNAL_XZ_PN_IRT
				if($isunknown(vif.clock_125m)==1)
					`uvm_error(get_type_name(), $sformatf("signal:clock_125m is X/Z at %0t", $time))
				if($isunknown(vif.reset_n)==1)
					`uvm_error(get_type_name(), $sformatf("signal:reset_n is X/Z at %0t", $time))
				if($isunknown(vif.ins_control_irq)==1)
					`uvm_error(get_type_name(), $sformatf("signal:ins_control_irq is X/Z at %0t", $time))
				if($isunknown(vif.ins_acyclicp0_irq)==1)
					`uvm_error(get_type_name(), $sformatf("signal:ins_acyclicp0_irq is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p0_clock)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p0_clock is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p0_carrier_rxenable)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p0_carrier_rxenable is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p0_rx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p0_rx is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p0_txenable)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p0_txenable is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p0_tx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p0_tx is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p1_clock)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p1_clock is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p1_carrier_rxenable)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p1_carrier_rxenable is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p1_rx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p1_rx is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p1_txenable)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p1_txenable is X/Z at %0t", $time))
				if($isunknown(vif.rmii_p1_tx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:rmii_p1_tx is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_collision)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_collision is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_carrier)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_carrier is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_speed)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_speed is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_rxclk)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_rxclk is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_rxerr)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_rxerr is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_rxd)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_rxd is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_rx_dv)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_rx_dv is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_txclk)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_txclk is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_txerr)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_txerr is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_txd)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_txd is X/Z at %0t", $time))
				if($isunknown(vif.mii_p0_txen)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p0_txen is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_collision)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_collision is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_carrier)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_carrier is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_speed)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_speed is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_rxclk)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_rxclk is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_rxerr)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_rxerr is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_rxd)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_rxd is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_rx_dv)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_rx_dv is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_txclk)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_txclk is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_txerr)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_txerr is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_txd)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_txd is X/Z at %0t", $time))
				if($isunknown(vif.mii_p1_txen)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mii_p1_txen is X/Z at %0t", $time))
				if($isunknown(vif.mdio_clock)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mdio_clock is X/Z at %0t", $time))
				if($isunknown(vif.mdio_in)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mdio_in is X/Z at %0t", $time))
				if($isunknown(vif.mdio_out)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mdio_out is X/Z at %0t", $time))
				if($isunknown(vif.mdio_outenable)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mdio_outenable is X/Z at %0t", $time))
				if($isunknown(vif.mdio_portselect)==1)
					`uvm_error(get_type_name(), $sformatf("signal:mdio_portselect is X/Z at %0t", $time))
				if($isunknown(vif.dma_datain_selector)==1)
					`uvm_error(get_type_name(), $sformatf("signal:dma_datain_selector is X/Z at %0t", $time))
				if($isunknown(vif.dma_datain_allowed)==1)
					`uvm_error(get_type_name(), $sformatf("signal:dma_datain_allowed is X/Z at %0t", $time))
				if($isunknown(vif.dma_dataout_selector)==1)
					`uvm_error(get_type_name(), $sformatf("signal:dma_dataout_selector is X/Z at %0t", $time))
				if($isunknown(vif.dma_dataout_allowed)==1)
					`uvm_error(get_type_name(), $sformatf("signal:dma_dataout_allowed is X/Z at %0t", $time))
				if($isunknown(vif.dma_extin_intreq)==1)
					`uvm_error(get_type_name(), $sformatf("signal:dma_extin_intreq is X/Z at %0t", $time))
				if($isunknown(vif.dma_extin_intclear)==1)
					`uvm_error(get_type_name(), $sformatf("signal:dma_extin_intclear is X/Z at %0t", $time))
				if($isunknown(vif.irt_sync)==1)
					`uvm_error(get_type_name(), $sformatf("signal:irt_sync is X/Z at %0t", $time))
				if($isunknown(vif.irt_sync_timestamp)==1)
					`uvm_error(get_type_name(), $sformatf("signal:irt_sync_timestamp is X/Z at %0t", $time))
				if($isunknown(vif.pn_base_clk_31_25us)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pn_base_clk_31_25us is X/Z at %0t", $time))
				if($isunknown(vif.pn_cycle_counter)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pn_cycle_counter is X/Z at %0t", $time))
				if($isunknown(vif.pn_cycle_timestamp)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pn_cycle_timestamp is X/Z at %0t", $time))
				if($isunknown(vif.pn_consumer_update)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pn_consumer_update is X/Z at %0t", $time))
				if($isunknown(vif.pn_provider_update)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pn_provider_update is X/Z at %0t", $time))
				if($isunknown(vif.cputx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:cputx is X/Z at %0t", $time))
				if($isunknown(vif.cpurx)==1)
					`uvm_error(get_type_name(), $sformatf("signal:cpurx is X/Z at %0t", $time))
				if($isunknown(vif.pn_irq)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pn_irq is X/Z at %0t", $time))
				if($isunknown(vif.pn_sync)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pn_sync is X/Z at %0t", $time))
			`endif

			// --- 3. 创建 transaction 并采样接口信号 ---
			pn_irt_tr = pn_irt_trans::type_id::create("pn_irt_tr");
			pn_irt_tr.clock_125m = vif.clock_125m;
			pn_irt_tr.reset_n = vif.reset_n;
			pn_irt_tr.ins_control_irq = vif.ins_control_irq;
			pn_irt_tr.ins_acyclicp0_irq = vif.ins_acyclicp0_irq;
			pn_irt_tr.rmii_p0_clock = vif.rmii_p0_clock;
			pn_irt_tr.rmii_p0_carrier_rxenable = vif.rmii_p0_carrier_rxenable;
			pn_irt_tr.rmii_p0_rx = vif.rmii_p0_rx;
			pn_irt_tr.rmii_p0_txenable = vif.rmii_p0_txenable;
			pn_irt_tr.rmii_p0_tx = vif.rmii_p0_tx;
			pn_irt_tr.rmii_p1_clock = vif.rmii_p1_clock;
			pn_irt_tr.rmii_p1_carrier_rxenable = vif.rmii_p1_carrier_rxenable;
			pn_irt_tr.rmii_p1_rx = vif.rmii_p1_rx;
			pn_irt_tr.rmii_p1_txenable = vif.rmii_p1_txenable;
			pn_irt_tr.rmii_p1_tx = vif.rmii_p1_tx;
			pn_irt_tr.mii_p0_collision = vif.mii_p0_collision;
			pn_irt_tr.mii_p0_carrier = vif.mii_p0_carrier;
			pn_irt_tr.mii_p0_speed = vif.mii_p0_speed;
			pn_irt_tr.mii_p0_rxclk = vif.mii_p0_rxclk;
			pn_irt_tr.mii_p0_rxerr = vif.mii_p0_rxerr;
			pn_irt_tr.mii_p0_rxd = vif.mii_p0_rxd;
			pn_irt_tr.mii_p0_rx_dv = vif.mii_p0_rx_dv;
			pn_irt_tr.mii_p0_txclk = vif.mii_p0_txclk;
			pn_irt_tr.mii_p0_txerr = vif.mii_p0_txerr;
			pn_irt_tr.mii_p0_txd = vif.mii_p0_txd;
			pn_irt_tr.mii_p0_txen = vif.mii_p0_txen;
			pn_irt_tr.mii_p1_collision = vif.mii_p1_collision;
			pn_irt_tr.mii_p1_carrier = vif.mii_p1_carrier;
			pn_irt_tr.mii_p1_speed = vif.mii_p1_speed;
			pn_irt_tr.mii_p1_rxclk = vif.mii_p1_rxclk;
			pn_irt_tr.mii_p1_rxerr = vif.mii_p1_rxerr;
			pn_irt_tr.mii_p1_rxd = vif.mii_p1_rxd;
			pn_irt_tr.mii_p1_rx_dv = vif.mii_p1_rx_dv;
			pn_irt_tr.mii_p1_txclk = vif.mii_p1_txclk;
			pn_irt_tr.mii_p1_txerr = vif.mii_p1_txerr;
			pn_irt_tr.mii_p1_txd = vif.mii_p1_txd;
			pn_irt_tr.mii_p1_txen = vif.mii_p1_txen;
			pn_irt_tr.mdio_clock = vif.mdio_clock;
			pn_irt_tr.mdio_in = vif.mdio_in;
			pn_irt_tr.mdio_out = vif.mdio_out;
			pn_irt_tr.mdio_outenable = vif.mdio_outenable;
			pn_irt_tr.mdio_portselect = vif.mdio_portselect;
			pn_irt_tr.dma_datain_selector = vif.dma_datain_selector;
			pn_irt_tr.dma_datain_allowed = vif.dma_datain_allowed;
			pn_irt_tr.dma_dataout_selector = vif.dma_dataout_selector;
			pn_irt_tr.dma_dataout_allowed = vif.dma_dataout_allowed;
			pn_irt_tr.dma_extin_intreq = vif.dma_extin_intreq;
			pn_irt_tr.dma_extin_intclear = vif.dma_extin_intclear;
			pn_irt_tr.irt_sync = vif.irt_sync;
			pn_irt_tr.irt_sync_timestamp = vif.irt_sync_timestamp;
			pn_irt_tr.pn_base_clk_31_25us = vif.pn_base_clk_31_25us;
			pn_irt_tr.pn_cycle_counter = vif.pn_cycle_counter;
			pn_irt_tr.pn_cycle_timestamp = vif.pn_cycle_timestamp;
			pn_irt_tr.pn_consumer_update = vif.pn_consumer_update;
			pn_irt_tr.pn_provider_update = vif.pn_provider_update;
			pn_irt_tr.cputx = vif.cputx;
			pn_irt_tr.cpurx = vif.cpurx;
			pn_irt_tr.pn_irq = vif.pn_irq;
			pn_irt_tr.pn_sync = vif.pn_sync;

			// --- 4. 调用回调：pre_collect ---
//			`uvm_do_callbacks(pn_irt_monitor, pn_irt_monitor_callback, pre_collect(this, pn_irt_tr))

			// --- 5. 广播 transaction（始终执行，不依赖宏） ---
			mon_analysis_port.write(pn_irt_tr);

			// --- 6. 调用回调：post_collect ---
//			`uvm_do_callbacks(pn_irt_monitor, pn_irt_monitor_callback, post_collect(this, pn_irt_tr))
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

endclass : pn_irt_monitor

	//=========================================================================
	// pn_irt_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class pn_irt_monitor_callback extends uvm_callback;
		`uvm_object_utils(pn_irt_monitor_callback)
		function new(string name="pn_irt_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(pn_irt_monitor mon, pn_irt_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(pn_irt_monitor mon, pn_irt_trans tr);
		endfunction
	endclass : pn_irt_monitor_callback
*/

`endif
