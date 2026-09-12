//--------------------------------------------------------------------
// sys_006_stability_test : 长期稳定性
//
// TST 编号 : TST-SYS-006
// 测试项   : 长期稳定性
// 优先级   : 高
// UVC 映射 : mpsoc_virtual_seq_lib 协同: sysctrl_base_sequence, gpio_base_sequence, uart_base_sequence, dma_base_sequence
//
// 飞书描述 : 全功能混合压力运行 24~72h,监控死机/数据损坏
// 预期结果 : 长时间稳定运行,无内存泄漏、无数据损坏
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/sys
//             2) testcase/mpsoc_TestTop.svh 追加 `include "sys_006_stability_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _SYS_006_STABILITY_TEST_
`define _SYS_006_STABILITY_TEST_

class sys_006_stability_sysctrl_sub_seq extends sysctrl_base_sequence;

    `uvm_object_utils(sys_006_stability_sysctrl_sub_seq)

    function new(string name = "sys_006_stability_sysctrl_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 长期稳定性(sysctrl)
        `uvm_do_with(req, { req.CFG == WRITE;
        req.ADDR == 32'h40017000; })
    endtask : body

endclass : sys_006_stability_sysctrl_sub_seq

class sys_006_stability_gpio_sub_seq extends gpio_base_sequence;

    `uvm_object_utils(sys_006_stability_gpio_sub_seq)

    function new(string name = "sys_006_stability_gpio_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 长期稳定性(gpio)
        `uvm_do_with(req, { req.b_pad_gpio_porta == 32'h0; })
    endtask : body

endclass : sys_006_stability_gpio_sub_seq

class sys_006_stability_uart_sub_seq extends uart_base_sequence;

    `uvm_object_utils(sys_006_stability_uart_sub_seq)

    function new(string name = "sys_006_stability_uart_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 长期稳定性(uart)
        `uvm_do_with(req, { req.i_pad_uart0_sin == 1'b0; })
    endtask : body

endclass : sys_006_stability_uart_sub_seq

class sys_006_stability_dma_sub_seq extends dma_base_sequence;

    `uvm_object_utils(sys_006_stability_dma_sub_seq)

    function new(string name = "sys_006_stability_dma_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 长期稳定性(dma)
        `uvm_do_with(req, { req.channel == 0; })
    endtask : body

endclass : sys_006_stability_dma_sub_seq

class sys_006_stability_sequence extends mpsoc_virtual_seq_lib;

    sys_006_stability_sysctrl_sub_seq  sysctrl_0_seq;
    sys_006_stability_gpio_sub_seq  gpio_1_seq;
    sys_006_stability_uart_sub_seq  uart_2_seq;
    sys_006_stability_dma_sub_seq  dma_3_seq;

    `uvm_object_utils(sys_006_stability_sequence)

    function new(string name = "sys_006_stability_sequence");
        super.new(name);
        sysctrl_0_seq = sys_006_stability_sysctrl_sub_seq::type_id::create("sysctrl_0_seq");
        gpio_1_seq = sys_006_stability_gpio_sub_seq::type_id::create("gpio_1_seq");
        uart_2_seq = sys_006_stability_uart_sub_seq::type_id::create("uart_2_seq");
        dma_3_seq = sys_006_stability_dma_sub_seq::type_id::create("dma_3_seq");
    endfunction : new

    virtual task body();
        // 长期稳定性
        fork
            begin
                sysctrl_0_seq.start(p_sequencer.sysctrl_seqr);
            end
            begin
                gpio_1_seq.start(p_sequencer.gpio_seqr);
            end
            begin
                uart_2_seq.start(p_sequencer.uart_seqr);
            end
            begin
                dma_3_seq.start(p_sequencer.dma_seqr);
            end
        join
        // TODO: 结果检查 —— RTL 就绪后依据各 monitor / scoreboard 比对
    endtask : body

endclass : sys_006_stability_sequence

class sys_006_stability_test extends mpsoc_base_test;

    sys_006_stability_sequence seq;

    `uvm_component_utils(sys_006_stability_test)

    function new(string name = "sys_006_stability_test", uvm_component parent = null);
        super.new(name, parent);
        seq = sys_006_stability_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : sys_006_stability_test

`endif
