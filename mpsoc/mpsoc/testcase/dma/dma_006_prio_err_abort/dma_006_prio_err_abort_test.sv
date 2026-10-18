//--------------------------------------------------------------------
// dma_006_prio_err_abort_test : DMAC 通道优先级与错误中止
//
// TST 编号 : TST-DMA-006
// 测试项   : DMAC 通道优先级与错误中止
// 优先级   : 中
// UVC 映射 : dma_base_sequence -> env.mpsoc_vseqr.dma_seqr
//
// 飞书描述 : 配置通道优先级并发搬运;注入非法地址/对齐错误验证错误中止与状态中断
// 预期结果 : 优先级仲裁正确,错误被捕获并触发状态中断
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/dma
//             2) testcase/mpsoc_TestTop.svh 追加 `include "dma_006_prio_err_abort_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _DMA_006_PRIO_ERR_ABORT_TEST_
`define _DMA_006_PRIO_ERR_ABORT_TEST_

class dma_006_prio_err_abort_sequence extends dma_base_sequence;

    `uvm_object_utils(dma_006_prio_err_abort_sequence)

    function new(string name = "dma_006_prio_err_abort_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // DMAC 通道优先级与错误中止
        `uvm_do_with(req, { req.channel inside {{[0:7]}};
        req.dma_int == 8'hFF; })
        // TODO: 结果检查 —— RTL 就绪后依据 dma_monitor / scoreboard 比对
    endtask : body

endclass : dma_006_prio_err_abort_sequence

class dma_006_prio_err_abort_test extends mpsoc_base_test;

    dma_006_prio_err_abort_sequence seq;

    `uvm_component_utils(dma_006_prio_err_abort_test)

    function new(string name = "dma_006_prio_err_abort_test", uvm_component parent = null);
        super.new(name, parent);
        seq = dma_006_prio_err_abort_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.dma_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : dma_006_prio_err_abort_test

`endif
