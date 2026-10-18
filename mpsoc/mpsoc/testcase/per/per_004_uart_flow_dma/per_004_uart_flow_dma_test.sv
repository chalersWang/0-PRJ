//--------------------------------------------------------------------
// per_004_uart_flow_dma_test : UART 流控与 DMA
//
// TST 编号 : TST-PER-004
// 测试项   : UART 流控与 DMA
// 优先级   : 中
// UVC 映射 : mpsoc_virtual_seq_lib 协同: uart_base_sequence, dma_base_sequence
//
// 飞书描述 : RTS/CTS 流控下大数据收发,并验证 DMA 模式
// 预期结果 : 流控正确,DMA 模式无数据丢失
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_004_uart_flow_dma_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_004_UART_FLOW_DMA_TEST_
`define _PER_004_UART_FLOW_DMA_TEST_

class per_004_uart_flow_dma_uart_sub_seq extends uart_base_sequence;

    `uvm_object_utils(per_004_uart_flow_dma_uart_sub_seq)

    function new(string name = "per_004_uart_flow_dma_uart_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // UART 流控与 DMA(uart)
        `uvm_do_with(req, { req.i_pad_uart0_sin == 1'b0;
        req.o_pad_uart0_sout == 1'b1; })
    endtask : body

endclass : per_004_uart_flow_dma_uart_sub_seq

class per_004_uart_flow_dma_dma_sub_seq extends dma_base_sequence;

    `uvm_object_utils(per_004_uart_flow_dma_dma_sub_seq)

    function new(string name = "per_004_uart_flow_dma_dma_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // UART 流控与 DMA(dma)
        `uvm_do_with(req, { req.channel == 1; })
    endtask : body

endclass : per_004_uart_flow_dma_dma_sub_seq

class per_004_uart_flow_dma_sequence extends mpsoc_virtual_seq_lib;

    per_004_uart_flow_dma_uart_sub_seq  uart_0_seq;
    per_004_uart_flow_dma_dma_sub_seq  dma_1_seq;

    `uvm_object_utils(per_004_uart_flow_dma_sequence)

    function new(string name = "per_004_uart_flow_dma_sequence");
        super.new(name);
        uart_0_seq = per_004_uart_flow_dma_uart_sub_seq::type_id::create("uart_0_seq");
        dma_1_seq = per_004_uart_flow_dma_dma_sub_seq::type_id::create("dma_1_seq");
    endfunction : new

    virtual task body();
        // UART 流控与 DMA
        fork
            begin
                uart_0_seq.start(p_sequencer.uart_seqr);
            end
            begin
                dma_1_seq.start(p_sequencer.dma_seqr);
            end
        join
        // TODO: 结果检查 —— RTL 就绪后依据各 monitor / scoreboard 比对
    endtask : body

endclass : per_004_uart_flow_dma_sequence

class per_004_uart_flow_dma_test extends mpsoc_base_test;

    per_004_uart_flow_dma_sequence seq;

    `uvm_component_utils(per_004_uart_flow_dma_test)

    function new(string name = "per_004_uart_flow_dma_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_004_uart_flow_dma_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_004_uart_flow_dma_test

`endif
