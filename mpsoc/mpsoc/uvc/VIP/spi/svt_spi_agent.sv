`ifndef _SVT_SPI_AGENT_SV_
`define _SVT_SPI_AGENT_SV_

//=========================================================================
// svt_spi_agent_wrap: Synopsys DesignWare SPI VIP 的 agent 封装
//   内部例化 svt_spi_master_agent(master) + svt_spi_slave_agent(slave),
//   并把 svt_spi_config 与 svt_spi_if 通过 uvm_config_db 下发给子 agent。
//
//   命名说明:类名统一加 _wrap 后缀,避免与 Synopsys 库中同名 agent 冲突。
//   依赖:svt_uvm_pkg、Synopsys SPI VIP 库。
//   注:config_db 的 key 名(下方 "cfg"/"vif")以 VIP databook 为准。
//=========================================================================
class svt_spi_agent_wrap extends uvm_agent;

	uvm_active_passive_enum is_active = UVM_ACTIVE;

	svt_spi_config  svt_spi_cfg;
	virtual svt_spi_if       vif;

	// Synopsys SPI VIP 子 agent
	svt_spi_master_agent  m_agent;
	svt_spi_slave_agent  s_agent;

	`uvm_component_utils_begin(svt_spi_agent_wrap)
		`uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)
	`uvm_component_utils_end

	function new(string name="svt_spi_agent_wrap", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(), "build_phase begin ...", UVM_LOW)
		uvm_config_db#(uvm_active_passive_enum)::get(this, "", "is_active", is_active);

		if (!uvm_config_db#(svt_spi_config)::get(this, "", "svt_spi_config", svt_spi_cfg))
			`uvm_fatal(get_type_name(), "can not get svt_spi_config !!!")
		if (!uvm_config_db#(virtual svt_spi_if)::get(this, "", "svt_spi_if", vif))
			`uvm_fatal(get_type_name(), "can not get svt_spi_if !!!")

		// 下发 config/interface 给 Synopsys master agent
		uvm_config_db#(svt_spi_configuration)::set(this, "m_agent", "cfg", svt_spi_cfg);
		uvm_config_db#(virtual svt_spi_if)::set(this, "m_agent", "vif", vif);
		if (is_active == UVM_ACTIVE)
			m_agent = svt_spi_master_agent::type_id::create("m_agent", this);

		// 下发 config/interface 给 Synopsys slave agent
		uvm_config_db#(svt_spi_configuration)::set(this, "s_agent", "cfg", svt_spi_cfg);
		uvm_config_db#(virtual svt_spi_if)::set(this, "s_agent", "vif", vif);
		s_agent = svt_spi_slave_agent::type_id::create("s_agent", this);
		`uvm_info(get_full_name(), "build_phase end ...", UVM_LOW)
	endfunction

endclass : svt_spi_agent_wrap

`endif
