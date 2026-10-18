//--------------------------------------------------------------------
// mem_006_qspi_indirect_dma_test : QSPI 间接传输与 DMA
//
// TST 编号 : TST-MEM-006
// 测试项   : QSPI 间接传输与 DMA
// 优先级   : 中
// UVC 映射 : mpsoc_virtual_seq_lib 协同: qspi_base_sequence, dma_base_sequence
//
// 飞书描述 : 配置间接读/写传输(indirect),验证与 DMA 外设接口联动搬移 FLASH 数据
// 预期结果 : 间接传输数据正确,DMA 状态握手无误
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/mem
//             2) testcase/mpsoc_TestTop.svh 追加 `include "mem_006_qspi_indirect_dma_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _MEM_006_QSPI_INDIRECT_DMA_TEST_
`define _MEM_006_QSPI_INDIRECT_DMA_TEST_

class mem_006_qspi_indirect_dma_qspi_sub_seq extends qspi_base_sequence;

    `uvm_object_utils(mem_006_qspi_indirect_dma_qspi_sub_seq)

    function new(string name = "mem_006_qspi_indirect_dma_qspi_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // QSPI 间接传输与 DMA(qspi)
        `uvm_do_with(req, { req.QSPI_CS0N_o == 1'b0; })
    endtask : body

endclass : mem_006_qspi_indirect_dma_qspi_sub_seq

class mem_006_qspi_indirect_dma_dma_sub_seq extends dma_base_sequence;

    `uvm_object_utils(mem_006_qspi_indirect_dma_dma_sub_seq)

    function new(string name = "mem_006_qspi_indirect_dma_dma_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // QSPI 间接传输与 DMA(dma)
        `uvm_do_with(req, { req.channel == 0;
        req.handshake_delay == 64; })
    endtask : body

endclass : mem_006_qspi_indirect_dma_dma_sub_seq

class mem_006_qspi_indirect_dma_sequence extends mpsoc_virtual_seq_lib;

    mem_006_qspi_indirect_dma_qspi_sub_seq  qspi_0_seq;
    mem_006_qspi_indirect_dma_dma_sub_seq  dma_1_seq;

    `uvm_object_utils(mem_006_qspi_indirect_dma_sequence)

    function new(string name = "mem_006_qspi_indirect_dma_sequence");
        super.new(name);
        qspi_0_seq = mem_006_qspi_indirect_dma_qspi_sub_seq::type_id::create("qspi_0_seq");
        dma_1_seq = mem_006_qspi_indirect_dma_dma_sub_seq::type_id::create("dma_1_seq");
    endfunction : new

    virtual task body();
        // QSPI 间接传输与 DMA
        fork
            begin
                qspi_0_seq.start(p_sequencer.qspi_seqr);
            end
            begin
                dma_1_seq.start(p_sequencer.dma_seqr);
            end
        join
        // TODO: 结果检查 —— RTL 就绪后依据各 monitor / scoreboard 比对
    endtask : body

endclass : mem_006_qspi_indirect_dma_sequence

class mem_006_qspi_indirect_dma_test extends mpsoc_base_test;

    mem_006_qspi_indirect_dma_sequence seq;

    `uvm_component_utils(mem_006_qspi_indirect_dma_test)

    function new(string name = "mem_006_qspi_indirect_dma_test", uvm_component parent = null);
        super.new(name, parent);
        seq = mem_006_qspi_indirect_dma_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : mem_006_qspi_indirect_dma_test

`endif
