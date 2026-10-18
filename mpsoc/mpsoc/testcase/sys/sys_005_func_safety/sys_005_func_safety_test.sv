//--------------------------------------------------------------------
// sys_005_func_safety_test : 功能安全联动
//
// TST 编号 : TST-SYS-005
// 测试项   : 功能安全联动
// 优先级   : 中
// UVC 映射 : mpsoc_virtual_seq_lib 协同: wdt_base_sequence, sysctrl_base_sequence
//
// 飞书描述 : WDT 与双核对耦/自检联动,注入异常观察安全动作
// 预期结果 : 检测到异常时执行安全复位/进入安全态
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/sys
//             2) testcase/mpsoc_TestTop.svh 追加 `include "sys_005_func_safety_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _SYS_005_FUNC_SAFETY_TEST_
`define _SYS_005_FUNC_SAFETY_TEST_

class sys_005_func_safety_wdt_sub_seq extends wdt_base_sequence;

    `uvm_object_utils(sys_005_func_safety_wdt_sub_seq)

    function new(string name = "sys_005_func_safety_wdt_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 功能安全联动(wdt)
        `uvm_do_with(req, { req.timeout_cycles == 100; })
    endtask : body

endclass : sys_005_func_safety_wdt_sub_seq

class sys_005_func_safety_sysctrl_sub_seq extends sysctrl_base_sequence;

    `uvm_object_utils(sys_005_func_safety_sysctrl_sub_seq)

    function new(string name = "sys_005_func_safety_sysctrl_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 功能安全联动(sysctrl)
        `uvm_do_with(req, { req.i_pad_rst_b == 1'b1; })
    endtask : body

endclass : sys_005_func_safety_sysctrl_sub_seq

class sys_005_func_safety_sequence extends mpsoc_virtual_seq_lib;

    sys_005_func_safety_wdt_sub_seq  wdt_0_seq;
    sys_005_func_safety_sysctrl_sub_seq  sysctrl_1_seq;

    `uvm_object_utils(sys_005_func_safety_sequence)

    function new(string name = "sys_005_func_safety_sequence");
        super.new(name);
        wdt_0_seq = sys_005_func_safety_wdt_sub_seq::type_id::create("wdt_0_seq");
        sysctrl_1_seq = sys_005_func_safety_sysctrl_sub_seq::type_id::create("sysctrl_1_seq");
    endfunction : new

    virtual task body();
        // 功能安全联动
        fork
            begin
                wdt_0_seq.start(p_sequencer.wdt_seqr);
            end
            begin
                sysctrl_1_seq.start(p_sequencer.sysctrl_seqr);
            end
        join
        // TODO: 结果检查 —— RTL 就绪后依据各 monitor / scoreboard 比对
    endtask : body

endclass : sys_005_func_safety_sequence

class sys_005_func_safety_test extends mpsoc_base_test;

    sys_005_func_safety_sequence seq;

    `uvm_component_utils(sys_005_func_safety_test)

    function new(string name = "sys_005_func_safety_test", uvm_component parent = null);
        super.new(name, parent);
        seq = sys_005_func_safety_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : sys_005_func_safety_test

`endif
