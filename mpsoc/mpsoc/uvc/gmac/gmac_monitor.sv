`ifndef _GMAC_MONITOR_SV_
`define _GMAC_MONITOR_SV_

//=========================================================================
// gmac_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class gmac_monitor extends uvm_monitor;

	virtual gmac_vif       vif;
	gmac_trans             gmac_tr;

	uvm_analysis_port #(gmac_trans)    mon_analysis_port;
//	`uvm_register_cb(gmac_monitor, gmac_monitor_callback)

	`uvm_component_utils(gmac_monitor)

	function new(string name="gmac_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual gmac_vif)::get(this,"","gmac_vif",vif))
		    `uvm_fatal("gmac_monitor","virtual interface must be set for it!!!")
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
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_GMAC 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_GMAC 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
	virtual task run_phase(uvm_phase phase);
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)

		forever begin

			// --- 1. 等待时钟边沿（不再用 fork，避免线程泄漏） ---
			@(posedge vif.clk);

			// --- 2. X/Z 检查（通过宏控制，不影响正常采集） ---
			`ifdef CHECK_SIGNAL_XZ_GMAC
				if($isunknown(vif.RGMII_RXC_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_RXC_i is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_TXC_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_TXC_i is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_TXC_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_TXC_o is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_TXC_oen)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_TXC_oen is X/Z at %0t", $time))
				if($isunknown(vif.gephy_ifsel)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gephy_ifsel is X/Z at %0t", $time))
				if($isunknown(vif.gmac_ack)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_ack is X/Z at %0t", $time))
				if($isunknown(vif.gmac_areset_n)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_areset_n is X/Z at %0t", $time))
				if($isunknown(vif.gmac_clk)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_clk is X/Z at %0t", $time))
				if($isunknown(vif.gmac_pclk)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_pclk is X/Z at %0t", $time))
				if($isunknown(vif.gmac_preset_n)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_preset_n is X/Z at %0t", $time))
				if($isunknown(vif.gmac_reset_n)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmac_reset_n is X/Z at %0t", $time))
				if($isunknown(vif.gmii_mdc_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmii_mdc_o is X/Z at %0t", $time))
				if($isunknown(vif.gmii_mdc_oen)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmii_mdc_oen is X/Z at %0t", $time))
				if($isunknown(vif.gmii_mdi_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmii_mdi_i is X/Z at %0t", $time))
				if($isunknown(vif.gmii_mdio_oen)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmii_mdio_oen is X/Z at %0t", $time))
				if($isunknown(vif.gmii_mdo_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:gmii_mdo_o is X/Z at %0t", $time))
				if($isunknown(vif.lpi_intr_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:lpi_intr_o is X/Z at %0t", $time))
				if($isunknown(vif.pcs_acquired_sync_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pcs_acquired_sync_o is X/Z at %0t", $time))
				if($isunknown(vif.pcs_en_cdet_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pcs_en_cdet_o is X/Z at %0t", $time))
				if($isunknown(vif.pcs_ewrap_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pcs_ewrap_o is X/Z at %0t", $time))
				if($isunknown(vif.pcs_lck_ref_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pcs_lck_ref_o is X/Z at %0t", $time))
				if($isunknown(vif.phy_col_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_col_i is X/Z at %0t", $time))
				if($isunknown(vif.phy_crs_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_crs_i is X/Z at %0t", $time))
				if($isunknown(vif.phy_intr_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_intr_i is X/Z at %0t", $time))
				if($isunknown(vif.phy_rxd_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_rxd_i is X/Z at %0t", $time))
				if($isunknown(vif.phy_rxdv_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_rxdv_i is X/Z at %0t", $time))
				if($isunknown(vif.phy_rxer_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_rxer_i is X/Z at %0t", $time))
				if($isunknown(vif.phy_txd_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_txd_o is X/Z at %0t", $time))
				if($isunknown(vif.phy_txd_oen)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_txd_oen is X/Z at %0t", $time))
				if($isunknown(vif.phy_txen_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_txen_o is X/Z at %0t", $time))
				if($isunknown(vif.phy_txen_oen)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_txen_oen is X/Z at %0t", $time))
				if($isunknown(vif.phy_txer_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_txer_o is X/Z at %0t", $time))
				if($isunknown(vif.phy_txerr_oen)==1)
					`uvm_error(get_type_name(), $sformatf("signal:phy_txerr_oen is X/Z at %0t", $time))
				if($isunknown(vif.pmt_intr_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pmt_intr_o is X/Z at %0t", $time))
				if($isunknown(vif.ptp_aux_ts_trig_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:ptp_aux_ts_trig_i is X/Z at %0t", $time))
				if($isunknown(vif.ptp_pps_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:ptp_pps_o is X/Z at %0t", $time))
				if($isunknown(vif.ptp_timestamp_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:ptp_timestamp_i is X/Z at %0t", $time))
				if($isunknown(vif.pwr_clamp_ctrl_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pwr_clamp_ctrl_i is X/Z at %0t", $time))
				if($isunknown(vif.pwr_down_ctrl_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pwr_down_ctrl_i is X/Z at %0t", $time))
				if($isunknown(vif.pwr_isolate_i)==1)
					`uvm_error(get_type_name(), $sformatf("signal:pwr_isolate_i is X/Z at %0t", $time))
				if($isunknown(vif.sbd_intr_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:sbd_intr_o is X/Z at %0t", $time))
				if($isunknown(vif.sbd_pwr_down_ack_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:sbd_pwr_down_ack_o is X/Z at %0t", $time))
				if($isunknown(vif.sbd_tx_clk_gating_ctrl_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:sbd_tx_clk_gating_ctrl_o is X/Z at %0t", $time))
				if($isunknown(vif.sgmii_link_speed_o)==1)
					`uvm_error(get_type_name(), $sformatf("signal:sgmii_link_speed_o is X/Z at %0t", $time))
			`endif

			// --- 3. 创建 transaction 并采样接口信号 ---
			gmac_tr = gmac_trans::type_id::create("gmac_tr");
			gmac_tr.RGMII_RXC_i = vif.RGMII_RXC_i;
			gmac_tr.RGMII_TXC_i = vif.RGMII_TXC_i;
			gmac_tr.RGMII_TXC_o = vif.RGMII_TXC_o;
			gmac_tr.RGMII_TXC_oen = vif.RGMII_TXC_oen;
			gmac_tr.gephy_ifsel = vif.gephy_ifsel;
			gmac_tr.gmac_ack = vif.gmac_ack;
			gmac_tr.gmac_areset_n = vif.gmac_areset_n;
			gmac_tr.gmac_clk = vif.gmac_clk;
			gmac_tr.gmac_pclk = vif.gmac_pclk;
			gmac_tr.gmac_preset_n = vif.gmac_preset_n;
			gmac_tr.gmac_reset_n = vif.gmac_reset_n;
			gmac_tr.gmii_mdc_o = vif.gmii_mdc_o;
			gmac_tr.gmii_mdc_oen = vif.gmii_mdc_oen;
			gmac_tr.gmii_mdi_i = vif.gmii_mdi_i;
			gmac_tr.gmii_mdio_oen = vif.gmii_mdio_oen;
			gmac_tr.gmii_mdo_o = vif.gmii_mdo_o;
			gmac_tr.lpi_intr_o = vif.lpi_intr_o;
			gmac_tr.pcs_acquired_sync_o = vif.pcs_acquired_sync_o;
			gmac_tr.pcs_en_cdet_o = vif.pcs_en_cdet_o;
			gmac_tr.pcs_ewrap_o = vif.pcs_ewrap_o;
			gmac_tr.pcs_lck_ref_o = vif.pcs_lck_ref_o;
			gmac_tr.phy_col_i = vif.phy_col_i;
			gmac_tr.phy_crs_i = vif.phy_crs_i;
			gmac_tr.phy_intr_i = vif.phy_intr_i;
			gmac_tr.phy_rxd_i = vif.phy_rxd_i;
			gmac_tr.phy_rxdv_i = vif.phy_rxdv_i;
			gmac_tr.phy_rxer_i = vif.phy_rxer_i;
			gmac_tr.phy_txd_o = vif.phy_txd_o;
			gmac_tr.phy_txd_oen = vif.phy_txd_oen;
			gmac_tr.phy_txen_o = vif.phy_txen_o;
			gmac_tr.phy_txen_oen = vif.phy_txen_oen;
			gmac_tr.phy_txer_o = vif.phy_txer_o;
			gmac_tr.phy_txerr_oen = vif.phy_txerr_oen;
			gmac_tr.pmt_intr_o = vif.pmt_intr_o;
			gmac_tr.ptp_aux_ts_trig_i = vif.ptp_aux_ts_trig_i;
			gmac_tr.ptp_pps_o = vif.ptp_pps_o;
			gmac_tr.ptp_timestamp_i = vif.ptp_timestamp_i;
			gmac_tr.pwr_clamp_ctrl_i = vif.pwr_clamp_ctrl_i;
			gmac_tr.pwr_down_ctrl_i = vif.pwr_down_ctrl_i;
			gmac_tr.pwr_isolate_i = vif.pwr_isolate_i;
			gmac_tr.sbd_intr_o = vif.sbd_intr_o;
			gmac_tr.sbd_pwr_down_ack_o = vif.sbd_pwr_down_ack_o;
			gmac_tr.sbd_tx_clk_gating_ctrl_o = vif.sbd_tx_clk_gating_ctrl_o;
			gmac_tr.sgmii_link_speed_o = vif.sgmii_link_speed_o;

			// --- 4. 调用回调：pre_collect ---
//			`uvm_do_callbacks(gmac_monitor, gmac_monitor_callback, pre_collect(this, gmac_tr))

			// --- 5. 广播 transaction（始终执行，不依赖宏） ---
			mon_analysis_port.write(gmac_tr);

			// --- 6. 调用回调：post_collect ---
//			`uvm_do_callbacks(gmac_monitor, gmac_monitor_callback, post_collect(this, gmac_tr))
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

endclass : gmac_monitor

	//=========================================================================
	// gmac_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class gmac_monitor_callback extends uvm_callback;
		`uvm_object_utils(gmac_monitor_callback)
		function new(string name="gmac_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(gmac_monitor mon, gmac_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(gmac_monitor mon, gmac_trans tr);
		endfunction
	endclass : gmac_monitor_callback
*/

`endif
