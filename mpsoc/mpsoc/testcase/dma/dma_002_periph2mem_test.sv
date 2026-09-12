//--------------------------------------------------------------------
// dma_002_periph2mem_test : 外设到内存搬运
//
// TST 编号 : TST-DMA-002
// 测试项   : 外设到内存搬运
// 优先级   : 高
// UVC 映射 : mpsoc_virtual_seq_lib 协同: dma_base_sequence, uart_base_sequence
//
// 飞书描述 : UART/SPI/网络数据经 DMA 搬运至 SRAM 缓冲区
// 预期结果 : 数据无丢失、无误码
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/dma
//             2) testcase/mpsoc_TestTop.svh 追加 `include "dma_002_periph2mem_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _DMA_002_PERIPH2MEM_TEST_
`define _DMA_002_PERIPH2MEM_TEST_

class dma_002_periph2mem_dma_sub_seq extends dma_base_sequence;

    `uvm_object_utils(dma_002_periph2mem_dma_sub_seq)

    function new(string name = "dma_002_periph2mem_dma_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 外设到内存搬运(dma)
        `uvm_do_with(req, { req.channel == 0;
        req.handshake_delay == 32; })
    endtask : body

endclass : dma_002_periph2mem_dma_sub_seq

class dma_002_periph2mem_uart_sub_seq extends uart_base_sequence;

    `uvm_object_utils(dma_002_periph2mem_uart_sub_seq)

    function new(string name = "dma_002_periph2mem_uart_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 外设到内存搬运(uart)
        `uvm_do_with(req, { req.i_pad_uart0_sin == 1'b0; })
    endtask : body

endclass : dma_002_periph2mem_uart_sub_seq

class dma_002_periph2mem_sequence extends mpsoc_virtual_seq_lib;

    dma_002_periph2mem_dma_sub_seq  dma_0_seq;
    dma_002_periph2mem_uart_sub_seq  uart_1_seq;

    `uvm_object_utils(dma_002_periph2mem_sequence)

    function new(string name = "dma_002_periph2mem_sequence");
        super.new(name);
        dma_0_seq = dma_002_periph2mem_dma_sub_seq::type_id::create("dma_0_seq");
        uart_1_seq = dma_002_periph2mem_uart_sub_seq::type_id::create("uart_1_seq");
    endfunction : new

    virtual task body();
        // 外设到内存搬运
        fork
            begin
                dma_0_seq.start(p_sequencer.dma_seqr);
            end
            begin
                uart_1_seq.start(p_sequencer.uart_seqr);
            end
        join
        // TODO: 结果检查 —— RTL 就绪后依据各 monitor / scoreboard 比对
    endtask : body

endclass : dma_002_periph2mem_sequence

class dma_002_periph2mem_test extends mpsoc_base_test;

    dma_002_periph2mem_sequence seq;

    `uvm_component_utils(dma_002_periph2mem_test)

    function new(string name = "dma_002_periph2mem_test", uvm_component parent = null);
        super.new(name, parent);
        seq = dma_002_periph2mem_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : dma_002_periph2mem_test

`endif
