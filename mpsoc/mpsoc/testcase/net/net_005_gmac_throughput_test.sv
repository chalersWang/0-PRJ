//--------------------------------------------------------------------
// net_005_gmac_throughput_test : 千兆以太网吞吐
//
// TST 编号 : TST-NET-005
// 测试项   : 千兆以太网吞吐
// 优先级   : 高
// UVC 映射 : gmac_base_sequence -> env.mpsoc_vseqr.gmac_seqr
//
// 飞书描述 : GMAC 与对端千兆以太网双向收发大数据流
// 预期结果 : 吞吐量达千兆线速,无丢包
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/net
//             2) testcase/mpsoc_TestTop.svh 追加 `include "net_005_gmac_throughput_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _NET_005_GMAC_THROUGHPUT_TEST_
`define _NET_005_GMAC_THROUGHPUT_TEST_

class net_005_gmac_throughput_sequence extends gmac_base_sequence;

    `uvm_object_utils(net_005_gmac_throughput_sequence)

    function new(string name = "net_005_gmac_throughput_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 千兆以太网吞吐
        `uvm_do_with(req, { req.gmac_rgmii_tx_ctl == 1'b1;
        req.gmac_rgmii_txd == 4'b1111; })
        // TODO: 结果检查 —— RTL 就绪后依据 gmac_monitor / scoreboard 比对
    endtask : body

endclass : net_005_gmac_throughput_sequence

class net_005_gmac_throughput_test extends mpsoc_base_test;

    net_005_gmac_throughput_sequence seq;

    `uvm_component_utils(net_005_gmac_throughput_test)

    function new(string name = "net_005_gmac_throughput_test", uvm_component parent = null);
        super.new(name, parent);
        seq = net_005_gmac_throughput_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.gmac_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : net_005_gmac_throughput_test

`endif
