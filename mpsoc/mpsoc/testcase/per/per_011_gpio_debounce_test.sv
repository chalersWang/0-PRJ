//--------------------------------------------------------------------
// per_011_gpio_debounce_test : GPIO 去抖(debounce)
//
// TST 编号 : TST-PER-011
// 测试项   : GPIO 去抖(debounce)
// 优先级   : 中
// UVC 映射 : gpio_base_sequence -> env.mpsoc_vseqr.gpio_seqr
//
// 飞书描述 : 使能 GPIO_DEBOUNCE,向输入引脚注入窄毛刺/抖动,回读 GPIO_EXT 与中断状态
// 预期结果 : 毛刺被滤除,去抖窗口内无中断误触发
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_011_gpio_debounce_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_011_GPIO_DEBOUNCE_TEST_
`define _PER_011_GPIO_DEBOUNCE_TEST_

class per_011_gpio_debounce_sequence extends gpio_base_sequence;

    `uvm_object_utils(per_011_gpio_debounce_sequence)

    function new(string name = "per_011_gpio_debounce_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // GPIO 去抖(debounce)
        `uvm_do_with(req, { req.b_pad_gpio_porta == 32'hAAAA_AAAA; })
        // TODO: 结果检查 —— RTL 就绪后依据 gpio_monitor / scoreboard 比对
    endtask : body

endclass : per_011_gpio_debounce_sequence

class per_011_gpio_debounce_test extends mpsoc_base_test;

    per_011_gpio_debounce_sequence seq;

    `uvm_component_utils(per_011_gpio_debounce_test)

    function new(string name = "per_011_gpio_debounce_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_011_gpio_debounce_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.gpio_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_011_gpio_debounce_test

`endif
