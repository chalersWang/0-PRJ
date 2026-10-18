//--------------------------------------------------------------------
// per_003_uart_loopback_test : UART0/1/2 收发
//
// TST 编号 : TST-PER-003
// 测试项   : UART0/1/2 收发
// 优先级   : 高
// UVC 映射 : uart_base_sequence -> env.mpsoc_vseqr.uart_seqr
//
// 飞书描述 : 三路串口自环收发不同波特率/数据位/校验配置
// 预期结果 : 数据一致,无误码,无溢出
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_003_uart_loopback_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_003_UART_LOOPBACK_TEST_
`define _PER_003_UART_LOOPBACK_TEST_

class per_003_uart_loopback_sequence extends uart_base_sequence;

    `uvm_object_utils(per_003_uart_loopback_sequence)

    function new(string name = "per_003_uart_loopback_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // UART0/1/2 收发
        `uvm_do_with(req, { req.i_pad_uart0_sin == 1'b0;
        req.o_pad_uart0_sout == 1'b1; })
        // TODO: 结果检查 —— RTL 就绪后依据 uart_monitor / scoreboard 比对
    endtask : body

endclass : per_003_uart_loopback_sequence

class per_003_uart_loopback_test extends mpsoc_base_test;

    per_003_uart_loopback_sequence seq;

    `uvm_component_utils(per_003_uart_loopback_test)

    function new(string name = "per_003_uart_loopback_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_003_uart_loopback_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.uart_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_003_uart_loopback_test

`endif
