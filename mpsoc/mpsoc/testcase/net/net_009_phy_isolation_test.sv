//--------------------------------------------------------------------
// net_009_phy_isolation_test : 四路 PHY 独立隔离
//
// TST 编号 : TST-NET-009
// 测试项   : 四路 PHY 独立隔离
// 优先级   : 中
// UVC 映射 : miiphy_base_sequence -> env.mpsoc_vseqr.miiphy_seqr
//
// 飞书描述 : 4 组 MII 各自独立接 PHY,验证独立通信与故障隔离
// 预期结果 : 每路独立收发正确,单路故障不影响其余通道
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/net
//             2) testcase/mpsoc_TestTop.svh 追加 `include "net_009_phy_isolation_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _NET_009_PHY_ISOLATION_TEST_
`define _NET_009_PHY_ISOLATION_TEST_

class net_009_phy_isolation_sequence extends miiphy_base_sequence;

    `uvm_object_utils(net_009_phy_isolation_sequence)

    function new(string name = "net_009_phy_isolation_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 四路 PHY 独立隔离
        `uvm_do_with(req, { req.phy_rxd_i == 4'b1010;
        req.phy_rxdv_i == 1'b1;
        req.phy_link_i == 1'b1; })
        // TODO: 结果检查 —— RTL 就绪后依据 miiphy_monitor / scoreboard 比对
    endtask : body

endclass : net_009_phy_isolation_sequence

class net_009_phy_isolation_test extends mpsoc_base_test;

    net_009_phy_isolation_sequence seq;

    `uvm_component_utils(net_009_phy_isolation_test)

    function new(string name = "net_009_phy_isolation_test", uvm_component parent = null);
        super.new(name, parent);
        seq = net_009_phy_isolation_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.miiphy_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : net_009_phy_isolation_test

`endif
