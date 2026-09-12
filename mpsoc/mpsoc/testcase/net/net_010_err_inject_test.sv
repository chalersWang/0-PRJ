//--------------------------------------------------------------------
// net_010_err_inject_test : 网络错误注入
//
// TST 编号 : TST-NET-010
// 测试项   : 网络错误注入
// 优先级   : 中
// UVC 映射 : esc_base_sequence -> env.mpsoc_vseqr.esc_seqr
//
// 飞书描述 : 注入 CRC 错误/丢帧/超时等异常帧
// 预期结果 : 错误帧被丢弃并报告,状态机保持正确
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/net
//             2) testcase/mpsoc_TestTop.svh 追加 `include "net_010_err_inject_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _NET_010_ERR_INJECT_TEST_
`define _NET_010_ERR_INJECT_TEST_

class net_010_err_inject_sequence extends esc_base_sequence;

    `uvm_object_utils(net_010_err_inject_sequence)

    function new(string name = "net_010_err_inject_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 网络错误注入
        `uvm_do_with(req, { req.ecat_mii_rx_dv == 1'b1;
        req.ecat_mii_rxd == 4'b1111; })
        // TODO: 结果检查 —— RTL 就绪后依据 esc_monitor / scoreboard 比对
    endtask : body

endclass : net_010_err_inject_sequence

class net_010_err_inject_test extends mpsoc_base_test;

    net_010_err_inject_sequence seq;

    `uvm_component_utils(net_010_err_inject_test)

    function new(string name = "net_010_err_inject_test", uvm_component parent = null);
        super.new(name, parent);
        seq = net_010_err_inject_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.esc_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : net_010_err_inject_test

`endif
