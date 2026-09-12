//--------------------------------------------------------------------
// per_009_wdt_timeout_test : 看门狗 WDT
//
// TST 编号 : TST-PER-009
// 测试项   : 看门狗 WDT
// 优先级   : 高
// UVC 映射 : wdt_base_sequence -> env.mpsoc_vseqr.wdt_seqr
//
// 飞书描述 : 正常喂狗观察不复位;停止喂狗观察超时复位
// 预期结果 : 喂狗不复位,超时按设定窗口复位
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_009_wdt_timeout_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_009_WDT_TIMEOUT_TEST_
`define _PER_009_WDT_TIMEOUT_TEST_

class per_009_wdt_timeout_sequence extends wdt_base_sequence;

    `uvm_object_utils(per_009_wdt_timeout_sequence)

    function new(string name = "per_009_wdt_timeout_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 看门狗 WDT
        `uvm_do_with(req, { req.timeout_cycles == 100; })
        // TODO: 结果检查 —— RTL 就绪后依据 wdt_monitor / scoreboard 比对
    endtask : body

endclass : per_009_wdt_timeout_sequence

class per_009_wdt_timeout_test extends mpsoc_base_test;

    per_009_wdt_timeout_sequence seq;

    `uvm_component_utils(per_009_wdt_timeout_test)

    function new(string name = "per_009_wdt_timeout_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_009_wdt_timeout_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.wdt_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_009_wdt_timeout_test

`endif
