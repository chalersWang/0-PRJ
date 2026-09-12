//--------------------------------------------------------------------
// per_001_gpio_io_test : GPIO 输入输出
//
// TST 编号 : TST-PER-001
// 测试项   : GPIO 输入输出
// 优先级   : 高
// UVC 映射 : gpio_base_sequence -> env.mpsoc_vseqr.gpio_seqr
//
// 飞书描述 : 48 路 GPIO 配置推挽/开漏/上下拉并做电平回读
// 预期结果 : 各模式功能正确,电平一致
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_001_gpio_io_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_001_GPIO_IO_TEST_
`define _PER_001_GPIO_IO_TEST_

class per_001_gpio_io_sequence extends gpio_base_sequence;

    `uvm_object_utils(per_001_gpio_io_sequence)

    function new(string name = "per_001_gpio_io_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // GPIO 输入输出
        `uvm_do_with(req, { req.b_pad_gpio_porta == 32'hFFFF_FFFF;
        req.b_pad_gpio_portb == 16'hFFFF; })
        // TODO: 结果检查 —— RTL 就绪后依据 gpio_monitor / scoreboard 比对
    endtask : body

endclass : per_001_gpio_io_sequence

class per_001_gpio_io_test extends mpsoc_base_test;

    per_001_gpio_io_sequence seq;

    `uvm_component_utils(per_001_gpio_io_test)

    function new(string name = "per_001_gpio_io_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_001_gpio_io_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.gpio_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_001_gpio_io_test

`endif
