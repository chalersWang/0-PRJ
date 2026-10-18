//--------------------------------------------------------------------
// net_002_esc0_pdo_sdo_test : EtherCAT 从站通信
//
// TST 编号 : TST-NET-002
// 测试项   : EtherCAT 从站通信
// 优先级   : 高
// UVC 映射 : esc_base_sequence -> env.mpsoc_vseqr.esc_seqr
//
// 飞书描述 : ESC0 接入 EtherCAT 主站,执行 PDO/SDO 周期通信
// 预期结果 : 从站状态机进入 OP,周期数据收发正确
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/net
//             2) testcase/mpsoc_TestTop.svh 追加 `include "net_002_esc0_pdo_sdo_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _NET_002_ESC0_PDO_SDO_TEST_
`define _NET_002_ESC0_PDO_SDO_TEST_

class net_002_esc0_pdo_sdo_sequence extends esc_base_sequence;

    `uvm_object_utils(net_002_esc0_pdo_sdo_sequence)

    function new(string name = "net_002_esc0_pdo_sdo_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // EtherCAT 从站通信
        `uvm_do_with(req, { req.ecat_mii_rx_dv == 1'b1;
        req.ecat_mii_rxd == 4'b1010; })
        // TODO: 结果检查 —— RTL 就绪后依据 esc_monitor / scoreboard 比对
    endtask : body

endclass : net_002_esc0_pdo_sdo_sequence

class net_002_esc0_pdo_sdo_test extends mpsoc_base_test;

    net_002_esc0_pdo_sdo_sequence seq;

    `uvm_component_utils(net_002_esc0_pdo_sdo_test)

    function new(string name = "net_002_esc0_pdo_sdo_test", uvm_component parent = null);
        super.new(name, parent);
        seq = net_002_esc0_pdo_sdo_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.esc_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : net_002_esc0_pdo_sdo_test

`endif
