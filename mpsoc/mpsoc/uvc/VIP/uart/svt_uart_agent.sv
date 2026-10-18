`ifndef _SVT_UART_AGENT_SV_
`define _SVT_UART_AGENT_SV_

//=========================================================================
// svt_uart_agent_wrap: Synopsys DesignWare UART VIP 的 agent 封装
//   内部例化 svt_uart_agent,
//   并把 svt_uart_config 与 svt_uart_if 通过 uvm_config_db 下发给子 agent。
//
//   命名说明:类名统一加 _wrap 后缀,避免与 Synopsys 库同名 agent
//   (svt_uart_agent)冲突。
//   依赖:svt_uvm_pkg、Synopsys UART VIP 库。
//   注:config_db 的 key 名(下方 "cfg"/"vif")以 VIP databook 为准。
//=========================================================================
class svt_uart_agent_wrap extends uvm_agent;

	uvm_active_passive_enum is_active = UVM_ACTIVE;

	svt_uart_config  svt_uart_cfg;
	virtual svt_uart_if       vif;

	// Synopsys UART VIP 子 agent
	svt_uart_agent  u_agent;

	`uvm_component_utils_begin(svt_uart_agent_wrap)
		`uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)
	`uvm_component_utils_end

	function new(string name="svt_uart_agent_wrap", uvm_component parent=null);
		super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name(), "build_phase begin ...", UVM_LOW)
		uvm_config_db#(uvm_active_passive_enum)::get(this, "", "is_active", is_active);

		if (!uvm_config_db#(svt_uart_config)::get(this, "", "svt_uart_config", svt_uart_cfg))
			`uvm_fatal(get_type_name(), "can not get svt_uart_config !!!")
		if (!uvm_config_db#(virtual svt_uart_if)::get(this, "", "svt_uart_if", vif))
			`uvm_fatal(get_type_name(), "can not get svt_uart_if !!!")

		// 下发 config/interface 给 Synopsys agent
		uvm_config_db#(svt_uart_configuration)::set(this, "u_agent", "cfg", svt_uart_cfg);
		uvm_config_db#(virtual svt_uart_if)::set(this, "u_agent", "vif", vif);
		u_agent = svt_uart_agent::type_id::create("u_agent", this);
		`uvm_info(get_full_name(), "build_phase end ...", UVM_LOW)
	endfunction

endclass : svt_uart_agent_wrap

`endif
