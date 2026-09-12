//--------------------------------------------------------------------
// per_008_tim_pwm_test : 定时器 TIM0/TIM1
//
// TST 编号 : TST-PER-008
// 测试项   : 定时器 TIM0/TIM1
// 优先级   : 高
// UVC 映射 : tim_base_sequence -> env.mpsoc_vseqr.tim_seqr
//
// 飞书描述 : 定时中断、自由计数、PWM 输出功能验证
// 预期结果 : 定时精度/频率符合配置,PWM 占空比正确
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_008_tim_pwm_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_008_TIM_PWM_TEST_
`define _PER_008_TIM_PWM_TEST_

class per_008_tim_pwm_sequence extends tim_base_sequence;

    `uvm_object_utils(per_008_tim_pwm_sequence)

    function new(string name = "per_008_tim_pwm_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 定时器 TIM0/TIM1
        `uvm_do_with(req, { req.channel == 0;
        req.pulse_count == 4;
        req.pulse_period == 10; })
        // TODO: 结果检查 —— RTL 就绪后依据 tim_monitor / scoreboard 比对
    endtask : body

endclass : per_008_tim_pwm_sequence

class per_008_tim_pwm_test extends mpsoc_base_test;

    per_008_tim_pwm_sequence seq;

    `uvm_component_utils(per_008_tim_pwm_test)

    function new(string name = "per_008_tim_pwm_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_008_tim_pwm_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.tim_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_008_tim_pwm_test

`endif
