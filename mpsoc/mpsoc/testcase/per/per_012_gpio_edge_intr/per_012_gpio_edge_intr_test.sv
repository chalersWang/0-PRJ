//--------------------------------------------------------------------
// per_012_gpio_edge_intr_test : GPIO 双边沿/电平中断类型
//
// TST 编号 : TST-PER-012
// 测试项   : GPIO 双边沿/电平中断类型
// 优先级   : 中
// UVC 映射 : gpio_base_sequence -> env.mpsoc_vseqr.gpio_seqr
//
// 飞书描述 : 配置 INT_TYPE_LEVEL/INT_POLARITY/INT_BOTHEDGE 各触发类型,注入对应边沿并清除
// 预期结果 : 各类型中断按配置触发,EOI 可正确清除,无漏报误报
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_012_gpio_edge_intr_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_012_GPIO_EDGE_INTR_TEST_
`define _PER_012_GPIO_EDGE_INTR_TEST_

class per_012_gpio_edge_intr_sequence extends gpio_base_sequence;

    `uvm_object_utils(per_012_gpio_edge_intr_sequence)

    function new(string name = "per_012_gpio_edge_intr_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // GPIO 双边沿/电平中断类型
        `uvm_do_with(req, { req.b_pad_gpio_porta == 32'h0000_0001; })
        // TODO: 结果检查 —— RTL 就绪后依据 gpio_monitor / scoreboard 比对
    endtask : body

endclass : per_012_gpio_edge_intr_sequence

class per_012_gpio_edge_intr_test extends mpsoc_base_test;

    per_012_gpio_edge_intr_sequence seq;

    `uvm_component_utils(per_012_gpio_edge_intr_test)

    function new(string name = "per_012_gpio_edge_intr_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_012_gpio_edge_intr_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.gpio_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_012_gpio_edge_intr_test

`endif
