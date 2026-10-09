`ifndef _SVT_JTAG_DEMO_TEST_SV_
`define _SVT_JTAG_DEMO_TEST_SV_

//=========================================================================
// svt_jtag_demo_test: Synopsys JTAG VIP 的 demo 测试用例
//   依赖:需在 mpsoc_TestTop 中 import svt_jtag_UvcTop 与 svt_uvm_pkg,
//        并将本文件 include 进 mpsoc_TestTop package(见接入预留注释)。
//   注:sequencer 获取路径以实际 VIP 集成后的 env 层次为准。
//=========================================================================
class svt_jtag_demo_test extends mpsoc_base_test;

	svt_jtag_config        svt_jtag_cfg;
	svt_jtag_demo_sequence svt_jtag_demo_seq;

	`uvm_component_utils(svt_jtag_demo_test)

	function new(string name="svt_jtag_demo_test", uvm_component parent=null);
		super.new(name, parent);
		svt_jtag_cfg      = svt_jtag_config::type_id::create("svt_jtag_cfg");
		svt_jtag_demo_seq = svt_jtag_demo_sequence::type_id::create("svt_jtag_demo_seq");
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(svt_jtag_config)::set(this, "*", "svt_jtag_config", svt_jtag_cfg);
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		phase.raise_objection(this);
		@(posedge mpsocvif.rstn);
		// TODO: 从 env 获取 svt_jtag_agent_wrap 的 sequencer 后启动
		//   svt_jtag_demo_seq.start(<sequencer 句柄>);
		#1us;
		phase.drop_objection(this);
	endtask

endclass : svt_jtag_demo_test

`endif
