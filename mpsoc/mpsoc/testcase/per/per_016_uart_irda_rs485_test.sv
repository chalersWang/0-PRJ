//--------------------------------------------------------------------
// per_016_uart_irda_rs485_test : UART IrDA/RS485/自动流控
//
// TST 编号 : TST-PER-016
// 测试项   : UART IrDA/RS485/自动流控
// 优先级   : 中
// UVC 映射 : uart_base_sequence -> env.mpsoc_vseqr.uart_seqr
//
// 飞书描述 : 分别配置 IrDA SIR、RS485 多从、Auto Flow Control(RTS/CTS)模式收发
// 预期结果 : 各模式数据正确,流控无溢出,IrDA 脉宽符合 3/16 位周期
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_016_uart_irda_rs485_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_016_UART_IRDA_RS485_TEST_
`define _PER_016_UART_IRDA_RS485_TEST_

class per_016_uart_irda_rs485_sequence extends uart_base_sequence;

    `uvm_object_utils(per_016_uart_irda_rs485_sequence)

    function new(string name = "per_016_uart_irda_rs485_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // UART IrDA/RS485/自动流控
        `uvm_do_with(req, { req.i_pad_uart0_sin == 1'b1;
        req.o_pad_uart0_sout == 1'b0; })
        // TODO: 结果检查 —— RTL 就绪后依据 uart_monitor / scoreboard 比对
    endtask : body

endclass : per_016_uart_irda_rs485_sequence

class per_016_uart_irda_rs485_test extends mpsoc_base_test;

    per_016_uart_irda_rs485_sequence seq;

    `uvm_component_utils(per_016_uart_irda_rs485_test)

    function new(string name = "per_016_uart_irda_rs485_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_016_uart_irda_rs485_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.uart_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_016_uart_irda_rs485_test

`endif
