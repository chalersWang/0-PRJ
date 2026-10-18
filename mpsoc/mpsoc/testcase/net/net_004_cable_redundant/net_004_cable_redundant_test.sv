//--------------------------------------------------------------------
// net_004_cable_redundant_test : 线缆冗余切换
//
// TST 编号 : TST-NET-004
// 测试项   : 线缆冗余切换
// 优先级   : 高
// UVC 映射 : esc_base_sequence -> env.mpsoc_vseqr.esc_seqr
//
// 飞书描述 : 运行中断开环网单边线缆,验证断线自动重连
// 预期结果 : 在规格时间内(如 <100μs)恢复通信,无数据丢失
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/net
//             2) testcase/mpsoc_TestTop.svh 追加 `include "net_004_cable_redundant_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _NET_004_CABLE_REDUNDANT_TEST_
`define _NET_004_CABLE_REDUNDANT_TEST_

class net_004_cable_redundant_sequence extends esc_base_sequence;

    `uvm_object_utils(net_004_cable_redundant_sequence)

    function new(string name = "net_004_cable_redundant_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 线缆冗余切换
        `uvm_do_with(req, { req.ecat_mii_rx_dv == 1'b0;
        req.ecat_mii_rxd == 4'b0000; })
        // TODO: 结果检查 —— RTL 就绪后依据 esc_monitor / scoreboard 比对
    endtask : body

endclass : net_004_cable_redundant_sequence

class net_004_cable_redundant_test extends mpsoc_base_test;

    net_004_cable_redundant_sequence seq;

    `uvm_component_utils(net_004_cable_redundant_test)

    function new(string name = "net_004_cable_redundant_test", uvm_component parent = null);
        super.new(name, parent);
        seq = net_004_cable_redundant_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.esc_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : net_004_cable_redundant_test

`endif
