//--------------------------------------------------------------------
// dma_005_llp_test : DMAC 链表(LLP)传输
//
// TST 编号 : TST-DMA-005
// 测试项   : DMAC 链表(LLP)传输
// 优先级   : 中
// UVC 映射 : dma_base_sequence -> env.mpsoc_vseqr.dma_seqr
//
// 飞书描述 : 配置 LLP 多块链表描述符,验证连续多块自动搬运与链路跳转
// 预期结果 : 链表各块按序搬运,末块停止/回绕正确
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/dma
//             2) testcase/mpsoc_TestTop.svh 追加 `include "dma_005_llp_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _DMA_005_LLP_TEST_
`define _DMA_005_LLP_TEST_

class dma_005_llp_sequence extends dma_base_sequence;

    `uvm_object_utils(dma_005_llp_sequence)

    function new(string name = "dma_005_llp_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // DMAC 链表(LLP)传输
        `uvm_do_with(req, { req.channel == 0;
        req.handshake_delay == 64; })
        // TODO: 结果检查 —— RTL 就绪后依据 dma_monitor / scoreboard 比对
    endtask : body

endclass : dma_005_llp_sequence

class dma_005_llp_test extends mpsoc_base_test;

    dma_005_llp_sequence seq;

    `uvm_component_utils(dma_005_llp_test)

    function new(string name = "dma_005_llp_test", uvm_component parent = null);
        super.new(name, parent);
        seq = dma_005_llp_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.dma_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : dma_005_llp_test

`endif
