`ifndef _SVT_APB_CONFIG_SV_
`define _SVT_APB_CONFIG_SV_

//=========================================================================
// svt_apb_config: Synopsys DesignWare APB VIP 的配置封装类
//   继承 Synopsys svt_apb_system_configuration(APB VIP 配置基类),
//   在其基础上追加本环境风格的全局控制字段(对齐自研 apb_config)。
//   通过 uvm_config_db#(svt_apb_config)::set/get 在层次间传递。
//
//   依赖:svt_uvm_pkg(Synopsys VIP UVM 包),编译时需 VIP 库 incdir。
//   注:基类类名/构造参数以实际 VIP 版本 API 为准。
//=========================================================================
class svt_apb_config extends svt_apb_system_configuration;

	// ===== 全局仿真控制参数(本环境风格,对齐自研 apb_config) =====
	int        drain_time       = 100;          // main_phase 结束前的 drain 时钟数
	int        max_quit_count   = 0;            // 最大允许 UVM_ERROR 数(0=不限)
	int        verbosity        = UVM_MEDIUM;   // 全局日志级别
	bit        coverage_enable  = 1;            // 是否启用覆盖率收集
	bit        check_enable     = 1;            // 是否启用 scoreboard 比对
	bit        xz_check_enable  = 1;            // 是否启用 X/Z 检查

	`uvm_object_utils_begin(svt_apb_config)
		`uvm_field_int(drain_time,       UVM_ALL_ON)
		`uvm_field_int(max_quit_count,   UVM_ALL_ON)
		`uvm_field_int(verbosity,        UVM_ALL_ON)
		`uvm_field_int(coverage_enable,  UVM_ALL_ON)
		`uvm_field_int(check_enable,     UVM_ALL_ON)
		`uvm_field_int(xz_check_enable,  UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="svt_apb_config");
		super.new(name);
	endfunction : new

endclass : svt_apb_config

`endif
