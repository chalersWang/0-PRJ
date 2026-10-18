//--------------------------------------------------------------------
// net_007_route_switch_test : ROUTE 路由切换
//
// TST 编号 : TST-NET-007
// 测试项   : ROUTE 路由切换
// 优先级   : 中
// UVC 映射 : switch_base_sequence -> env.mpsoc_vseqr.switch_seqr
//
// 飞书描述 : 配置 ROUTE 切换 GMAC/ESC1 的 MII 通道
// 预期结果 : 路由切换后各控制器与对应 PHY 连通正确,无串扰
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/net
//             2) testcase/mpsoc_TestTop.svh 追加 `include "net_007_route_switch_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _NET_007_ROUTE_SWITCH_TEST_
`define _NET_007_ROUTE_SWITCH_TEST_

class net_007_route_switch_sequence extends switch_base_sequence;

    `uvm_object_utils(net_007_route_switch_sequence)

    function new(string name = "net_007_route_switch_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // ROUTE 路由切换
        `uvm_do_with(req, { req.switch_mii_p1_txenable == 1'b1;
        req.switch_mii_p1_tx == 4'b0000; })
        // TODO: 结果检查 —— RTL 就绪后依据 switch_monitor / scoreboard 比对
    endtask : body

endclass : net_007_route_switch_sequence

class net_007_route_switch_test extends mpsoc_base_test;

    net_007_route_switch_sequence seq;

    `uvm_component_utils(net_007_route_switch_test)

    function new(string name = "net_007_route_switch_test", uvm_component parent = null);
        super.new(name, parent);
        seq = net_007_route_switch_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.switch_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : net_007_route_switch_test

`endif
