`ifndef _ESC_MONITOR_SV_
`define _ESC_MONITOR_SV_

//=========================================================================
// esc_monitor: 从接口采集 transaction，通过 analysis_port 广播
//   使用 run_phase 持续监控（监控类组件适合 run_phase，因其需全仿真期间运行）
//   内建 monitor_callback 支持用户扩展
//=========================================================================
class esc_monitor extends uvm_monitor;

	virtual esc_vif       vif;
	esc_trans             esc_tr;

	uvm_analysis_port #(esc_trans)    mon_analysis_port;
//	`uvm_register_cb(esc_monitor, esc_monitor_callback)

	`uvm_component_utils(esc_monitor)

	function new(string name="esc_monitor",uvm_component parent=null);
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
		if(!uvm_config_db#(virtual esc_vif)::get(this,"","esc_vif",vif))
		    `uvm_fatal("esc_monitor","virtual interface must be set for it!!!")
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
	//   X/Z 检查：通过 `ifdef CHECK_SIGNAL_XZ_ESC 宏控制
	//   覆盖率采集：通过 `ifdef COVERAGE_ESC 宏控制
	//   注意：原来使用 forever fork join，会导致每个时钟周期创建一个
	//   永不释放的线程，内存持续增长。已修复为串行 @(posedge vif.clk) 模式。
	//=========================================================================
	virtual task run_phase(uvm_phase phase);
		`uvm_info(get_type_name(), "run_phase begin", UVM_MEDIUM)

		forever begin

			// --- 1. 等待时钟边沿（不再用 fork，避免线程泄漏） ---
			@(posedge vif.clk);

			// --- 2. X/Z 检查（通过宏控制，不影响正常采集） ---
			`ifdef CHECK_SIGNAL_XZ_ESC
				if($isunknown(vif.NRESET)==1)
					`uvm_error(get_type_name(), $sformatf("signal:NRESET is X/Z at %0t", $time))
				if($isunknown(vif.NRESET_DELAY7)==1)
					`uvm_error(get_type_name(), $sformatf("signal:NRESET_DELAY7 is X/Z at %0t", $time))
				if($isunknown(vif.CLK2S)==1)
					`uvm_error(get_type_name(), $sformatf("signal:CLK2S is X/Z at %0t", $time))
				if($isunknown(vif.CLK25_2NS)==1)
					`uvm_error(get_type_name(), $sformatf("signal:CLK25_2NS is X/Z at %0t", $time))
				if($isunknown(vif.CLK50)==1)
					`uvm_error(get_type_name(), $sformatf("signal:CLK50 is X/Z at %0t", $time))
				if($isunknown(vif.CLK100)==1)
					`uvm_error(get_type_name(), $sformatf("signal:CLK100 is X/Z at %0t", $time))
				if($isunknown(vif.CLK125)==1)
					`uvm_error(get_type_name(), $sformatf("signal:CLK125 is X/Z at %0t", $time))
				if($isunknown(vif.CLK125_90)==1)
					`uvm_error(get_type_name(), $sformatf("signal:CLK125_90 is X/Z at %0t", $time))
				if($isunknown(vif.CLK_PDI_EXT)==1)
					`uvm_error(get_type_name(), $sformatf("signal:CLK_PDI_EXT is X/Z at %0t", $time))
				if($isunknown(vif.SEC_DEV_CLK)==1)
					`uvm_error(get_type_name(), $sformatf("signal:SEC_DEV_CLK is X/Z at %0t", $time))
				if($isunknown(vif.SEC_DEV_CHAL_VALID)==1)
					`uvm_error(get_type_name(), $sformatf("signal:SEC_DEV_CHAL_VALID is X/Z at %0t", $time))
				if($isunknown(vif.SEC_DEV_CHAL_DATA)==1)
					`uvm_error(get_type_name(), $sformatf("signal:SEC_DEV_CHAL_DATA is X/Z at %0t", $time))
				if($isunknown(vif.SEC_DEV_RESP_VALID)==1)
					`uvm_error(get_type_name(), $sformatf("signal:SEC_DEV_RESP_VALID is X/Z at %0t", $time))
				if($isunknown(vif.SEC_DEV_RESP_DATA)==1)
					`uvm_error(get_type_name(), $sformatf("signal:SEC_DEV_RESP_DATA is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_LINK0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_LINK0 is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_RX_CLK0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_RX_CLK0 is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_RX_CTL0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_RX_CTL0 is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_RX_DATA0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_RX_DATA0 is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_TX_CLK0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_TX_CLK0 is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_TX_CTL0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_TX_CTL0 is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_TX_DATA0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_TX_DATA0 is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_RX_CTL_DATA_DDR_CLK0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_RX_CTL_DATA_DDR_CLK0 is X/Z at %0t", $time))
				if($isunknown(vif.RGMII_TX_CTL_DATA_DDR_CLK0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RGMII_TX_CTL_DATA_DDR_CLK0 is X/Z at %0t", $time))
				if($isunknown(vif.NMII_LINK0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:NMII_LINK0 is X/Z at %0t", $time))
				if($isunknown(vif.MII_RX_CLK0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MII_RX_CLK0 is X/Z at %0t", $time))
				if($isunknown(vif.MII_RX_DV0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MII_RX_DV0 is X/Z at %0t", $time))
				if($isunknown(vif.MII_RX_DATA0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MII_RX_DATA0 is X/Z at %0t", $time))
				if($isunknown(vif.MII_RX_ERR0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MII_RX_ERR0 is X/Z at %0t", $time))
				if($isunknown(vif.MII_TX_CLK0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MII_TX_CLK0 is X/Z at %0t", $time))
				if($isunknown(vif.MII_TX_ENA0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MII_TX_ENA0 is X/Z at %0t", $time))
				if($isunknown(vif.MII_TX_DATA0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MII_TX_DATA0 is X/Z at %0t", $time))
				if($isunknown(vif.MII_TX_SHIFT0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MII_TX_SHIFT0 is X/Z at %0t", $time))
				if($isunknown(vif.NRMII_LINK0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:NRMII_LINK0 is X/Z at %0t", $time))
				if($isunknown(vif.RMII_RX_DV0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RMII_RX_DV0 is X/Z at %0t", $time))
				if($isunknown(vif.RMII_RX_DATA0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RMII_RX_DATA0 is X/Z at %0t", $time))
				if($isunknown(vif.RMII_RX_ER0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RMII_RX_ER0 is X/Z at %0t", $time))
				if($isunknown(vif.RMII_TX_ENA0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RMII_TX_ENA0 is X/Z at %0t", $time))
				if($isunknown(vif.RMII_TX_DATA0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:RMII_TX_DATA0 is X/Z at %0t", $time))
				if($isunknown(vif.MDIO)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MDIO is X/Z at %0t", $time))
				if($isunknown(vif.MDIO_DATA_IN)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MDIO_DATA_IN is X/Z at %0t", $time))
				if($isunknown(vif.MDIO_DATA_OUT)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MDIO_DATA_OUT is X/Z at %0t", $time))
				if($isunknown(vif.MDIO_DATA_ENA)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MDIO_DATA_ENA is X/Z at %0t", $time))
				if($isunknown(vif.MCLK)==1)
					`uvm_error(get_type_name(), $sformatf("signal:MCLK is X/Z at %0t", $time))
				if($isunknown(vif.LED_LINK_ACT)==1)
					`uvm_error(get_type_name(), $sformatf("signal:LED_LINK_ACT is X/Z at %0t", $time))
				if($isunknown(vif.LED_RX_ERROR)==1)
					`uvm_error(get_type_name(), $sformatf("signal:LED_RX_ERROR is X/Z at %0t", $time))
				if($isunknown(vif.LED_RUN)==1)
					`uvm_error(get_type_name(), $sformatf("signal:LED_RUN is X/Z at %0t", $time))
				if($isunknown(vif.LED_ERR)==1)
					`uvm_error(get_type_name(), $sformatf("signal:LED_ERR is X/Z at %0t", $time))
				if($isunknown(vif.PROM_CLK_IN)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PROM_CLK_IN is X/Z at %0t", $time))
				if($isunknown(vif.PROM_CLK_OUT)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PROM_CLK_OUT is X/Z at %0t", $time))
				if($isunknown(vif.PROM_DATA_IN)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PROM_DATA_IN is X/Z at %0t", $time))
				if($isunknown(vif.PROM_DATA_OUT)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PROM_DATA_OUT is X/Z at %0t", $time))
				if($isunknown(vif.PROM_SIZE)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PROM_SIZE is X/Z at %0t", $time))
				if($isunknown(vif.PDI_SPI_SEL)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_SPI_SEL is X/Z at %0t", $time))
				if($isunknown(vif.PDI_SPI_DO)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_SPI_DO is X/Z at %0t", $time))
				if($isunknown(vif.PDI_SPI_DI)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_SPI_DI is X/Z at %0t", $time))
				if($isunknown(vif.PDI_SPI_IRQ)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_SPI_IRQ is X/Z at %0t", $time))
				if($isunknown(vif.PDI_DIGI_DATA_IN0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_DIGI_DATA_IN0 is X/Z at %0t", $time))
				if($isunknown(vif.PDI_DIGI_DATA_IN1)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_DIGI_DATA_IN1 is X/Z at %0t", $time))
				if($isunknown(vif.PDI_DIGI_DATA_IN2)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_DIGI_DATA_IN2 is X/Z at %0t", $time))
				if($isunknown(vif.PDI_DIGI_DATA_IN3)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_DIGI_DATA_IN3 is X/Z at %0t", $time))
				if($isunknown(vif.PDI_DIGI_DATA_OUT0)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_DIGI_DATA_OUT0 is X/Z at %0t", $time))
				if($isunknown(vif.PDI_DIGI_DATA_OUT1)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_DIGI_DATA_OUT1 is X/Z at %0t", $time))
				if($isunknown(vif.PDI_DIGI_DATA_OUT2)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_DIGI_DATA_OUT2 is X/Z at %0t", $time))
				if($isunknown(vif.PDI_DIGI_DATA_OUT3)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_DIGI_DATA_OUT3 is X/Z at %0t", $time))
				if($isunknown(vif.PDI_GPI)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_GPI is X/Z at %0t", $time))
				if($isunknown(vif.PDI_GPO)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_GPO is X/Z at %0t", $time))
				if($isunknown(vif.PROM_LOADED)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PROM_LOADED is X/Z at %0t", $time))
				if($isunknown(vif.PDI_SOF)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_SOF is X/Z at %0t", $time))
				if($isunknown(vif.PDI_EOF)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_EOF is X/Z at %0t", $time))
				if($isunknown(vif.PDI_WD_TRIGGER)==1)
					`uvm_error(get_type_name(), $sformatf("signal:PDI_WD_TRIGGER is X/Z at %0t", $time))
				if($isunknown(vif.P_MODE)==1)
					`uvm_error(get_type_name(), $sformatf("signal:P_MODE is X/Z at %0t", $time))
				if($isunknown(vif.P_CONF)==1)
					`uvm_error(get_type_name(), $sformatf("signal:P_CONF is X/Z at %0t", $time))
				if($isunknown(vif.LINKPOL)==1)
					`uvm_error(get_type_name(), $sformatf("signal:LINKPOL is X/Z at %0t", $time))
				if($isunknown(vif.Trans_Mode_Ena)==1)
					`uvm_error(get_type_name(), $sformatf("signal:Trans_Mode_Ena is X/Z at %0t", $time))
			`endif

			// --- 3. 创建 transaction 并采样接口信号 ---
			esc_tr = esc_trans::type_id::create("esc_tr");
			esc_tr.NRESET = vif.NRESET;
			esc_tr.NRESET_DELAY7 = vif.NRESET_DELAY7;
			esc_tr.CLK2S = vif.CLK2S;
			esc_tr.CLK25_2NS = vif.CLK25_2NS;
			esc_tr.CLK50 = vif.CLK50;
			esc_tr.CLK100 = vif.CLK100;
			esc_tr.CLK125 = vif.CLK125;
			esc_tr.CLK125_90 = vif.CLK125_90;
			esc_tr.CLK_PDI_EXT = vif.CLK_PDI_EXT;
			esc_tr.SEC_DEV_CLK = vif.SEC_DEV_CLK;
			esc_tr.SEC_DEV_CHAL_VALID = vif.SEC_DEV_CHAL_VALID;
			esc_tr.SEC_DEV_CHAL_DATA = vif.SEC_DEV_CHAL_DATA;
			esc_tr.SEC_DEV_RESP_VALID = vif.SEC_DEV_RESP_VALID;
			esc_tr.SEC_DEV_RESP_DATA = vif.SEC_DEV_RESP_DATA;
			esc_tr.RGMII_LINK0 = vif.RGMII_LINK0;
			esc_tr.RGMII_RX_CLK0 = vif.RGMII_RX_CLK0;
			esc_tr.RGMII_RX_CTL0 = vif.RGMII_RX_CTL0;
			esc_tr.RGMII_RX_DATA0 = vif.RGMII_RX_DATA0;
			esc_tr.RGMII_TX_CLK0 = vif.RGMII_TX_CLK0;
			esc_tr.RGMII_TX_CTL0 = vif.RGMII_TX_CTL0;
			esc_tr.RGMII_TX_DATA0 = vif.RGMII_TX_DATA0;
			esc_tr.RGMII_RX_CTL_DATA_DDR_CLK0 = vif.RGMII_RX_CTL_DATA_DDR_CLK0;
			esc_tr.RGMII_TX_CTL_DATA_DDR_CLK0 = vif.RGMII_TX_CTL_DATA_DDR_CLK0;
			esc_tr.NMII_LINK0 = vif.NMII_LINK0;
			esc_tr.MII_RX_CLK0 = vif.MII_RX_CLK0;
			esc_tr.MII_RX_DV0 = vif.MII_RX_DV0;
			esc_tr.MII_RX_DATA0 = vif.MII_RX_DATA0;
			esc_tr.MII_RX_ERR0 = vif.MII_RX_ERR0;
			esc_tr.MII_TX_CLK0 = vif.MII_TX_CLK0;
			esc_tr.MII_TX_ENA0 = vif.MII_TX_ENA0;
			esc_tr.MII_TX_DATA0 = vif.MII_TX_DATA0;
			esc_tr.MII_TX_SHIFT0 = vif.MII_TX_SHIFT0;
			esc_tr.NRMII_LINK0 = vif.NRMII_LINK0;
			esc_tr.RMII_RX_DV0 = vif.RMII_RX_DV0;
			esc_tr.RMII_RX_DATA0 = vif.RMII_RX_DATA0;
			esc_tr.RMII_RX_ER0 = vif.RMII_RX_ER0;
			esc_tr.RMII_TX_ENA0 = vif.RMII_TX_ENA0;
			esc_tr.RMII_TX_DATA0 = vif.RMII_TX_DATA0;
			esc_tr.MDIO = vif.MDIO;
			esc_tr.MDIO_DATA_IN = vif.MDIO_DATA_IN;
			esc_tr.MDIO_DATA_OUT = vif.MDIO_DATA_OUT;
			esc_tr.MDIO_DATA_ENA = vif.MDIO_DATA_ENA;
			esc_tr.MCLK = vif.MCLK;
			esc_tr.LED_LINK_ACT = vif.LED_LINK_ACT;
			esc_tr.LED_RX_ERROR = vif.LED_RX_ERROR;
			esc_tr.LED_RUN = vif.LED_RUN;
			esc_tr.LED_ERR = vif.LED_ERR;
			esc_tr.PROM_CLK_IN = vif.PROM_CLK_IN;
			esc_tr.PROM_CLK_OUT = vif.PROM_CLK_OUT;
			esc_tr.PROM_DATA_IN = vif.PROM_DATA_IN;
			esc_tr.PROM_DATA_OUT = vif.PROM_DATA_OUT;
			esc_tr.PROM_SIZE = vif.PROM_SIZE;
			esc_tr.PDI_SPI_SEL = vif.PDI_SPI_SEL;
			esc_tr.PDI_SPI_DO = vif.PDI_SPI_DO;
			esc_tr.PDI_SPI_DI = vif.PDI_SPI_DI;
			esc_tr.PDI_SPI_IRQ = vif.PDI_SPI_IRQ;
			esc_tr.PDI_DIGI_DATA_IN0 = vif.PDI_DIGI_DATA_IN0;
			esc_tr.PDI_DIGI_DATA_IN1 = vif.PDI_DIGI_DATA_IN1;
			esc_tr.PDI_DIGI_DATA_IN2 = vif.PDI_DIGI_DATA_IN2;
			esc_tr.PDI_DIGI_DATA_IN3 = vif.PDI_DIGI_DATA_IN3;
			esc_tr.PDI_DIGI_DATA_OUT0 = vif.PDI_DIGI_DATA_OUT0;
			esc_tr.PDI_DIGI_DATA_OUT1 = vif.PDI_DIGI_DATA_OUT1;
			esc_tr.PDI_DIGI_DATA_OUT2 = vif.PDI_DIGI_DATA_OUT2;
			esc_tr.PDI_DIGI_DATA_OUT3 = vif.PDI_DIGI_DATA_OUT3;
			esc_tr.PDI_GPI = vif.PDI_GPI;
			esc_tr.PDI_GPO = vif.PDI_GPO;
			esc_tr.PROM_LOADED = vif.PROM_LOADED;
			esc_tr.PDI_SOF = vif.PDI_SOF;
			esc_tr.PDI_EOF = vif.PDI_EOF;
			esc_tr.PDI_WD_TRIGGER = vif.PDI_WD_TRIGGER;
			esc_tr.P_MODE = vif.P_MODE;
			esc_tr.P_CONF = vif.P_CONF;
			esc_tr.LINKPOL = vif.LINKPOL;
			esc_tr.Trans_Mode_Ena = vif.Trans_Mode_Ena;

			// --- 4. 调用回调：pre_collect ---
//			`uvm_do_callbacks(esc_monitor, esc_monitor_callback, pre_collect(this, esc_tr))

			// --- 5. 广播 transaction（始终执行，不依赖宏） ---
			mon_analysis_port.write(esc_tr);

			// --- 6. 调用回调：post_collect ---
//			`uvm_do_callbacks(esc_monitor, esc_monitor_callback, post_collect(this, esc_tr))
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

endclass : esc_monitor

	//=========================================================================
	// esc_monitor_callback: Monitor 回调基类
	//   用户可继承此类扩展 monitor 行为（如注入错误、修改采集数据等）
	//=========================================================================
/*
	class esc_monitor_callback extends uvm_callback;
		`uvm_object_utils(esc_monitor_callback)
		function new(string name="esc_monitor_callback");
			super.new(name);
		endfunction

		// 在 monitor 采样后、write 前调用，可修改 transaction
		virtual function void pre_collect(esc_monitor mon, esc_trans tr);
		endfunction

		// 在 monitor write 后调用
		virtual function void post_collect(esc_monitor mon, esc_trans tr);
		endfunction
	endclass : esc_monitor_callback
*/

`endif
