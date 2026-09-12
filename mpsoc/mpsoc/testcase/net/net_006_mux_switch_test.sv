//--------------------------------------------------------------------
// net_006_mux_switch_test : MUX 协议切换
//
// TST 编号 : TST-NET-006
// 测试项   : MUX 协议切换
// 优先级   : 中
// UVC 映射 : switch_base_sequence -> env.mpsoc_vseqr.switch_seqr
//
// 飞书描述 : 配置 MUX 将 MII 通道在 ESC0 与 PN-IRT 间切换
// 预期结果 : 切换后对应协议工作正常,另一协议停用,可回切
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/net
//             2) testcase/mpsoc_TestTop.svh 追加 `include "net_006_mux_switch_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _NET_006_MUX_SWITCH_TEST_
`define _NET_006_MUX_SWITCH_TEST_

class net_006_mux_switch_sequence extends switch_base_sequence;

    `uvm_object_utils(net_006_mux_switch_sequence)

    function new(string name = "net_006_mux_switch_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // MUX 协议切换
        `uvm_do_with(req, { req.switch_mii_p0_txenable == 1'b1;
        req.switch_mii_p0_tx == 4'b0000; })
        // TODO: 结果检查 —— RTL 就绪后依据 switch_monitor / scoreboard 比对
    endtask : body

endclass : net_006_mux_switch_sequence

class net_006_mux_switch_test extends mpsoc_base_test;

    net_006_mux_switch_sequence seq;

    `uvm_component_utils(net_006_mux_switch_test)

    function new(string name = "net_006_mux_switch_test", uvm_component parent = null);
        super.new(name, parent);
        seq = net_006_mux_switch_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.switch_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : net_006_mux_switch_test

`endif
