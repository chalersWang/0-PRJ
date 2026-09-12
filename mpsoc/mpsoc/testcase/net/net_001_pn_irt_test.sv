//--------------------------------------------------------------------
// net_001_pn_irt_test : PROFINET IRT 实时通信
//
// TST 编号 : TST-NET-001
// 测试项   : PROFINET IRT 实时通信
// 优先级   : 高
// UVC 映射 : pn_irt_base_sequence -> env.mpsoc_vseqr.pn_irt_seqr
//
// 飞书描述 : PN-IRT 口接入 PROFINET 主站,IRT 通道循环收发实时数据
// 预期结果 : 连接建立,IRT 循环刷新周期达到规格
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/net
//             2) testcase/mpsoc_TestTop.svh 追加 `include "net_001_pn_irt_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _NET_001_PN_IRT_TEST_
`define _NET_001_PN_IRT_TEST_

class net_001_pn_irt_sequence extends pn_irt_base_sequence;

    `uvm_object_utils(net_001_pn_irt_sequence)

    function new(string name = "net_001_pn_irt_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // PROFINET IRT 实时通信
        `uvm_do_with(req, { req.pn_sync == 4'b0001;
        req.pn_irq == 4'b0000; })
        // TODO: 结果检查 —— RTL 就绪后依据 pn_irt_monitor / scoreboard 比对
    endtask : body

endclass : net_001_pn_irt_sequence

class net_001_pn_irt_test extends mpsoc_base_test;

    net_001_pn_irt_sequence seq;

    `uvm_component_utils(net_001_pn_irt_test)

    function new(string name = "net_001_pn_irt_test", uvm_component parent = null);
        super.new(name, parent);
        seq = net_001_pn_irt_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.pn_irt_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : net_001_pn_irt_test

`endif
