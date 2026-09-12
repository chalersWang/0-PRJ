//--------------------------------------------------------------------
// sys_001_power_reset_test : 上电/复位流程
//
// TST 编号 : TST-SYS-001
// 测试项   : 上电/复位流程
// 优先级   : 高
// UVC 映射 : sysctrl_base_sequence -> env.mpsoc_vseqr.sysctrl_seqr
//
// 飞书描述 : 验证上电、软件复位、外部复位各复位源
// 预期结果 : 各复位源生效,系统正常引导
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/sys
//             2) testcase/mpsoc_TestTop.svh 追加 `include "sys_001_power_reset_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _SYS_001_POWER_RESET_TEST_
`define _SYS_001_POWER_RESET_TEST_

class sys_001_power_reset_sequence extends sysctrl_base_sequence;

    `uvm_object_utils(sys_001_power_reset_sequence)

    function new(string name = "sys_001_power_reset_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 上电/复位流程
        `uvm_do_with(req, { req.i_pad_rst_b == 1'b1;
        req.i_pad_boot_mode == 2'b00; })
        // TODO: 结果检查 —— RTL 就绪后依据 sysctrl_monitor / scoreboard 比对
    endtask : body

endclass : sys_001_power_reset_sequence

class sys_001_power_reset_test extends mpsoc_base_test;

    sys_001_power_reset_sequence seq;

    `uvm_component_utils(sys_001_power_reset_test)

    function new(string name = "sys_001_power_reset_test", uvm_component parent = null);
        super.new(name, parent);
        seq = sys_001_power_reset_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.sysctrl_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : sys_001_power_reset_test

`endif
