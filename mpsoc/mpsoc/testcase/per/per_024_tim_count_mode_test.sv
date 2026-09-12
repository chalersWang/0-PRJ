//--------------------------------------------------------------------
// per_024_tim_count_mode_test : TIM 计数模式与多定时器
//
// TST 编号 : TST-PER-024
// 测试项   : TIM 计数模式与多定时器
// 优先级   : 中
// UVC 映射 : tim_base_sequence -> env.mpsoc_vseqr.tim_seqr
//
// 飞书描述 : 验证自由运行与用户定义计数模式,遍历 NUM_TIMERS 各定时器
// 预期结果 : 计数/装载正确,多定时器独立工作互不干扰
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_024_tim_count_mode_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_024_TIM_COUNT_MODE_TEST_
`define _PER_024_TIM_COUNT_MODE_TEST_

class per_024_tim_count_mode_sequence extends tim_base_sequence;

    `uvm_object_utils(per_024_tim_count_mode_sequence)

    function new(string name = "per_024_tim_count_mode_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // TIM 计数模式与多定时器
        `uvm_do_with(req, { req.channel inside {{[0:2]}};
        req.pulse_count == 8;
        req.pulse_period == 20; })
        // TODO: 结果检查 —— RTL 就绪后依据 tim_monitor / scoreboard 比对
    endtask : body

endclass : per_024_tim_count_mode_sequence

class per_024_tim_count_mode_test extends mpsoc_base_test;

    per_024_tim_count_mode_sequence seq;

    `uvm_component_utils(per_024_tim_count_mode_test)

    function new(string name = "per_024_tim_count_mode_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_024_tim_count_mode_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.tim_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_024_tim_count_mode_test

`endif
