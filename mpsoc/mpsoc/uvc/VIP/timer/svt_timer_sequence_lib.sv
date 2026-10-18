`ifndef _SVT_TIMER_SEQUENCE_LIB_SV_
`define _SVT_TIMER_SEQUENCE_LIB_SV_

//=========================================================================
// svt_timer_base_sequence: Synopsys TIMER VIP 的 sequence 封装基类
//   继承 Synopsys svt_timer_sequence,持有封装配置 svt_timer_config。
//=========================================================================
class svt_timer_base_sequence extends svt_timer_sequence;

	svt_timer_config  svt_timer_cfg;

	`uvm_object_utils(svt_timer_base_sequence)

	function new(string name="svt_timer_base_sequence");
		super.new(name);
	endfunction

	// pre_body: raise objection,确保 sequence 执行期间 phase 不结束
	virtual task pre_body();
		`uvm_info(get_type_name(), "pre_body begin", UVM_HIGH)
		if (starting_phase != null)
			starting_phase.raise_objection(this, get_type_name());
		if (!uvm_config_db#(svt_timer_config)::get(null, get_full_name(), "svt_timer_config", svt_timer_cfg))
			`uvm_fatal(get_type_name(), "can not get svt_timer_config object !!!")
		`uvm_info(get_type_name(), "pre_body end", UVM_HIGH)
	endtask : pre_body

	// post_body: drop objection,允许 phase 正常结束
	virtual task post_body();
		`uvm_info(get_type_name(), "post_body begin", UVM_HIGH)
		if (starting_phase != null)
			starting_phase.drop_objection(this, get_type_name());
		`uvm_info(get_type_name(), "post_body end", UVM_HIGH)
	endtask : post_body

endclass : svt_timer_base_sequence

//=========================================================================
// svt_timer_demo_sequence: 示例 sequence
//   继承 svt_timer_base_sequence,复用 Synopsys 基类默认随机事务。
//=========================================================================
class svt_timer_demo_sequence extends svt_timer_base_sequence;

	`uvm_object_utils(svt_timer_demo_sequence)

	function new(string name="svt_timer_demo_sequence");
		super.new(name);
	endfunction

	virtual task body();
		`uvm_info(get_type_name(), "body begin", UVM_MEDIUM)
		super.body();  // 调用 Synopsys svt_timer_sequence 默认随机事务
		`uvm_info(get_type_name(), "body end", UVM_MEDIUM)
	endtask : body

endclass : svt_timer_demo_sequence

`endif
