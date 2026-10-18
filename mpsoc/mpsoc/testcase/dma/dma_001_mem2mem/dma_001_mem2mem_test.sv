//--------------------------------------------------------------------
// dma_001_mem2mem_test : 内存到内存搬运
//
// TST 编号 : TST-DMA-001
// 测试项   : 内存到内存搬运
// 优先级   : 高
// UVC 映射 : dma_base_sequence -> env.mpsoc_vseqr.dma_seqr
//
// 飞书描述 : 8 通道并行 mem-to-mem 搬移不同大小数据块
// 预期结果 : 数据一致,8 通道互不干扰、无竞争错乱
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/dma
//             2) testcase/mpsoc_TestTop.svh 追加 `include "dma_001_mem2mem_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _DMA_001_MEM2MEM_TEST_
`define _DMA_001_MEM2MEM_TEST_

class dma_001_mem2mem_sequence extends dma_base_sequence;

    `uvm_object_utils(dma_001_mem2mem_sequence)

    function new(string name = "dma_001_mem2mem_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 内存到内存搬运
        `uvm_do_with(req, { req.channel inside {{[0:7]}};
        req.handshake_delay inside {{[1:256]}}; })
        // TODO: 结果检查 —— RTL 就绪后依据 dma_monitor / scoreboard 比对
    endtask : body

endclass : dma_001_mem2mem_sequence

class dma_001_mem2mem_test extends mpsoc_base_test;

    dma_001_mem2mem_sequence seq;

    `uvm_component_utils(dma_001_mem2mem_test)

    function new(string name = "dma_001_mem2mem_test", uvm_component parent = null);
        super.new(name, parent);
        seq = dma_001_mem2mem_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.dma_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : dma_001_mem2mem_test

`endif
