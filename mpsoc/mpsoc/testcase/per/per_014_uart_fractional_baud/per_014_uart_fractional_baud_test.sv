//--------------------------------------------------------------------
// per_014_uart_fractional_baud_test : UART 分数波特率
//
// TST 编号 : TST-PER-014
// 测试项   : UART 分数波特率
// 优先级   : 中
// UVC 映射 : uart_base_sequence -> env.mpsoc_vseqr.uart_seqr
//
// 飞书描述 : 配置 DLF 分数分频与 DLH/DLL,遍历典型波特率(9600/115200 等)收发
// 预期结果 : 各波特率误码率满足要求,分数分频精确
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_014_uart_fractional_baud_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_014_UART_FRACTIONAL_BAUD_TEST_
`define _PER_014_UART_FRACTIONAL_BAUD_TEST_

class per_014_uart_fractional_baud_sequence extends uart_base_sequence;

    `uvm_object_utils(per_014_uart_fractional_baud_sequence)

    function new(string name = "per_014_uart_fractional_baud_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // UART 分数波特率
        `uvm_do_with(req, { req.i_pad_uart0_sin == 1'b0; })
        // TODO: 结果检查 —— RTL 就绪后依据 uart_monitor / scoreboard 比对
    endtask : body

endclass : per_014_uart_fractional_baud_sequence

class per_014_uart_fractional_baud_test extends mpsoc_base_test;

    per_014_uart_fractional_baud_sequence seq;

    `uvm_component_utils(per_014_uart_fractional_baud_test)

    function new(string name = "per_014_uart_fractional_baud_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_014_uart_fractional_baud_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.uart_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_014_uart_fractional_baud_test

`endif
