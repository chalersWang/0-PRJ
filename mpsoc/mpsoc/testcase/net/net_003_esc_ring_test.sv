//--------------------------------------------------------------------
// net_003_esc_ring_test : EtherCAT 双口环网
//
// TST 编号 : TST-NET-003
// 测试项   : EtherCAT 双口环网
// 优先级   : 高
// UVC 映射 : esc_base_sequence -> env.mpsoc_vseqr.esc_seqr
//
// 飞书描述 : ESC0(IN)+ESC1(OUT) 级联构成 EtherCAT 环网拓扑
// 预期结果 : 环网拓扑扫描正确,两端口数据均正常
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/net
//             2) testcase/mpsoc_TestTop.svh 追加 `include "net_003_esc_ring_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _NET_003_ESC_RING_TEST_
`define _NET_003_ESC_RING_TEST_

class net_003_esc_ring_sequence extends esc_base_sequence;

    `uvm_object_utils(net_003_esc_ring_sequence)

    function new(string name = "net_003_esc_ring_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // EtherCAT 双口环网
        `uvm_do_with(req, { req.ecat_sync0 == 1'b1;
        req.ecat_sync1 == 1'b0; })
        // TODO: 结果检查 —— RTL 就绪后依据 esc_monitor / scoreboard 比对
    endtask : body

endclass : net_003_esc_ring_sequence

class net_003_esc_ring_test extends mpsoc_base_test;

    net_003_esc_ring_sequence seq;

    `uvm_component_utils(net_003_esc_ring_test)

    function new(string name = "net_003_esc_ring_test", uvm_component parent = null);
        super.new(name, parent);
        seq = net_003_esc_ring_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.esc_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : net_003_esc_ring_test

`endif
