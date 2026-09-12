//--------------------------------------------------------------------
// sys_004_exception_test : 异常与恢复
//
// TST 编号 : TST-SYS-004
// 测试项   : 异常与恢复
// 优先级   : 中
// UVC 映射 : sysctrl_base_sequence -> env.mpsoc_vseqr.sysctrl_seqr
//
// 飞书描述 : 注入总线错误/非法指令/栈溢出,验证错误捕获与恢复
// 预期结果 : 错误被捕获,看门狗可恢复,系统不永久挂死
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/sys
//             2) testcase/mpsoc_TestTop.svh 追加 `include "sys_004_exception_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _SYS_004_EXCEPTION_TEST_
`define _SYS_004_EXCEPTION_TEST_

class sys_004_exception_sequence extends sysctrl_base_sequence;

    `uvm_object_utils(sys_004_exception_sequence)

    function new(string name = "sys_004_exception_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 异常与恢复
        `uvm_do_with(req, { req.CFG == READ;
        req.ADDR == 32'hFFFF_FFFF; })
        // TODO: 结果检查 —— RTL 就绪后依据 sysctrl_monitor / scoreboard 比对
    endtask : body

endclass : sys_004_exception_sequence

class sys_004_exception_test extends mpsoc_base_test;

    sys_004_exception_sequence seq;

    `uvm_component_utils(sys_004_exception_test)

    function new(string name = "sys_004_exception_test", uvm_component parent = null);
        super.new(name, parent);
        seq = sys_004_exception_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.sysctrl_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : sys_004_exception_test

`endif
