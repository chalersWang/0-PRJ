//--------------------------------------------------------------------
// sys_003_low_power_test : 外设低功耗
//
// TST 编号 : TST-SYS-003
// 测试项   : 外设低功耗
// 优先级   : 中
// UVC 映射 : sysctrl_base_sequence -> env.mpsoc_vseqr.sysctrl_seqr
//
// 飞书描述 : 关闭空闲外设时钟,进入低功耗模式并唤醒
// 预期结果 : 功耗下降,唤醒后外设功能正常
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/sys
//             2) testcase/mpsoc_TestTop.svh 追加 `include "sys_003_low_power_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _SYS_003_LOW_POWER_TEST_
`define _SYS_003_LOW_POWER_TEST_

class sys_003_low_power_sequence extends sysctrl_base_sequence;

    `uvm_object_utils(sys_003_low_power_sequence)

    function new(string name = "sys_003_low_power_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 外设低功耗
        `uvm_do_with(req, { req.CFG == WRITE;
        req.ADDR == 32'h40017000;
        req.WRDATA == 32'h1; })
        // TODO: 结果检查 —— RTL 就绪后依据 sysctrl_monitor / scoreboard 比对
    endtask : body

endclass : sys_003_low_power_sequence

class sys_003_low_power_test extends mpsoc_base_test;

    sys_003_low_power_sequence seq;

    `uvm_component_utils(sys_003_low_power_test)

    function new(string name = "sys_003_low_power_test", uvm_component parent = null);
        super.new(name, parent);
        seq = sys_003_low_power_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.sysctrl_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : sys_003_low_power_test

`endif
