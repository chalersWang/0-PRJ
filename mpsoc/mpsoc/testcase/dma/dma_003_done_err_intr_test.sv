//--------------------------------------------------------------------
// dma_003_done_err_intr_test : DMA 完成/错误中断
//
// TST 编号 : TST-DMA-003
// 测试项   : DMA 完成/错误中断
// 优先级   : 中
// UVC 映射 : dma_base_sequence -> env.mpsoc_vseqr.dma_seqr
//
// 飞书描述 : 验证传输完成中断,并注入超长/对齐错误观察错误中断
// 预期结果 : 完成/错误中断标志与状态寄存器正确
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/dma
//             2) testcase/mpsoc_TestTop.svh 追加 `include "dma_003_done_err_intr_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _DMA_003_DONE_ERR_INTR_TEST_
`define _DMA_003_DONE_ERR_INTR_TEST_

class dma_003_done_err_intr_sequence extends dma_base_sequence;

    `uvm_object_utils(dma_003_done_err_intr_sequence)

    function new(string name = "dma_003_done_err_intr_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // DMA 完成/错误中断
        `uvm_do_with(req, { req.channel == 0;
        req.dma_int == 8'h01; })
        // TODO: 结果检查 —— RTL 就绪后依据 dma_monitor / scoreboard 比对
    endtask : body

endclass : dma_003_done_err_intr_sequence

class dma_003_done_err_intr_test extends mpsoc_base_test;

    dma_003_done_err_intr_sequence seq;

    `uvm_component_utils(dma_003_done_err_intr_test)

    function new(string name = "dma_003_done_err_intr_test", uvm_component parent = null);
        super.new(name, parent);
        seq = dma_003_done_err_intr_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.dma_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : dma_003_done_err_intr_test

`endif
