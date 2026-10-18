`ifndef _MPSOC_CONFIG_SV_
`define _MPSOC_CONFIG_SV_

//=========================================================================
// mpsoc_config: 全局验证环境配置类
//   集中管理所有子组件的配置参数
//   通过 uvm_config_db#(mpsoc_config)::set/get 在层次间传递
//   同时统一创建并持有各 UVC 的 config 对象
//=========================================================================
class mpsoc_config extends uvm_object;

	// ===== 全局仿真控制参数 =====
	int        drain_time       = 100;  // main_phase 结束前的 drain 时钟数
	int        max_quit_count   = 0;    // 最大允许 UVM_ERROR 数（0=不限）
	int        verbosity        = UVM_MEDIUM;  // 全局日志级别
	bit        coverage_enable  = 1;    // 是否启用覆盖率收集
	bit        check_enable     = 1;    // 是否启用 scoreboard 比对
	bit        xz_check_enable  = 1;    // 是否启用 X/Z 检查

	// ===== 各 UVC config（由 mpsoc_config 统一创建管理） =====
	sysctrl_config   sysctrl_cfg;
	jtag_config      jtag_cfg;
	uart_config      uart_cfg;
	gpio_config      gpio_cfg;
	qspi_config      qspi_cfg;
	switch_config    switch_cfg;
	miiphy_config    miiphy_cfg;
	efuse_config     efuse_cfg;
	i2c_config       i2c_cfg;
	spi_config       spi_cfg;
	wdt_config       wdt_cfg;
	tim_config       tim_cfg;
	uc_config        uc_cfg;
	sdram_config     sdram_cfg;
	security_config  security_cfg;
	dma_config       dma_cfg;
	pn_irt_config    pn_irt_cfg;
	esc_config       esc_cfg;
	gmac_config      gmac_cfg;

	// ===== UVM Event Pool（跨组件同步，替代独立 event 类） =====
	// 使用方式: uvm_event_pool::get_global("clk_ready").trigger();
	// 不再使用独立的 xx_event 类，减少对象传递开销

	`uvm_object_utils_begin(mpsoc_config)
		`uvm_field_int(drain_time,       UVM_ALL_ON)
		`uvm_field_int(max_quit_count,   UVM_ALL_ON)
		`uvm_field_int(verbosity,        UVM_ALL_ON)
		`uvm_field_int(coverage_enable,  UVM_ALL_ON)
		`uvm_field_int(check_enable,     UVM_ALL_ON)
		`uvm_field_int(xz_check_enable,  UVM_ALL_ON)
		`uvm_field_object(sysctrl_cfg,   UVM_ALL_ON)
		`uvm_field_object(jtag_cfg,      UVM_ALL_ON)
		`uvm_field_object(uart_cfg,      UVM_ALL_ON)
		`uvm_field_object(gpio_cfg,      UVM_ALL_ON)
		`uvm_field_object(qspi_cfg,      UVM_ALL_ON)
		`uvm_field_object(switch_cfg,    UVM_ALL_ON)
		`uvm_field_object(miiphy_cfg,    UVM_ALL_ON)
		`uvm_field_object(efuse_cfg,     UVM_ALL_ON)
		`uvm_field_object(i2c_cfg,       UVM_ALL_ON)
		`uvm_field_object(spi_cfg,       UVM_ALL_ON)
		`uvm_field_object(wdt_cfg,       UVM_ALL_ON)
		`uvm_field_object(tim_cfg,       UVM_ALL_ON)
		`uvm_field_object(uc_cfg,        UVM_ALL_ON)
		`uvm_field_object(sdram_cfg,     UVM_ALL_ON)
		`uvm_field_object(security_cfg,  UVM_ALL_ON)
		`uvm_field_object(dma_cfg,       UVM_ALL_ON)
		`uvm_field_object(pn_irt_cfg,    UVM_ALL_ON)
		`uvm_field_object(esc_cfg,       UVM_ALL_ON)
		`uvm_field_object(gmac_cfg,      UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="mpsoc_config");
		super.new(name);
		// 创建各 UVC config
		sysctrl_cfg  = sysctrl_config::type_id::create("sysctrl_cfg");
		jtag_cfg     = jtag_config::type_id::create("jtag_cfg");
		uart_cfg     = uart_config::type_id::create("uart_cfg");
		gpio_cfg     = gpio_config::type_id::create("gpio_cfg");
		qspi_cfg     = qspi_config::type_id::create("qspi_cfg");
		switch_cfg   = switch_config::type_id::create("switch_cfg");
		miiphy_cfg   = miiphy_config::type_id::create("miiphy_cfg");
		efuse_cfg    = efuse_config::type_id::create("efuse_cfg");
		i2c_cfg      = i2c_config::type_id::create("i2c_cfg");
		spi_cfg      = spi_config::type_id::create("spi_cfg");
		wdt_cfg      = wdt_config::type_id::create("wdt_cfg");
		tim_cfg      = tim_config::type_id::create("tim_cfg");
		uc_cfg       = uc_config::type_id::create("uc_cfg");
		sdram_cfg    = sdram_config::type_id::create("sdram_cfg");
		security_cfg = security_config::type_id::create("security_cfg");
		dma_cfg      = dma_config::type_id::create("dma_cfg");
		pn_irt_cfg   = pn_irt_config::type_id::create("pn_irt_cfg");
		esc_cfg      = esc_config::type_id::create("esc_cfg");
		gmac_cfg     = gmac_config::type_id::create("gmac_cfg");
	endfunction : new

endclass : mpsoc_config

`endif
