//--------------------------------------------------------------------
// sec_005_jtag_secure_test : 调试口安全
//
// TST 编号 : TST-SEC-005
// 测试项   : 调试口安全
// 优先级   : 中
// UVC 映射 : security_base_sequence -> env.mpsoc_vseqr.security_seqr
//
// 飞书描述 : 配置 JTAG 安全级别(关闭/受限)后尝试访问
// 预期结果 : 安全配置后未授权 JTAG 访问被拒绝
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/sec
//             2) testcase/mpsoc_TestTop.svh 追加 `include "sec_005_jtag_secure_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _SEC_005_JTAG_SECURE_TEST_
`define _SEC_005_JTAG_SECURE_TEST_

class sec_005_jtag_secure_sequence extends security_base_sequence;

    `uvm_object_utils(sec_005_jtag_secure_sequence)

    function new(string name = "sec_005_jtag_secure_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 调试口安全
        `uvm_do_with(req, { req.sec_boot_ok == 1'b1;
        req.sec_int == 1'b0; })
        // TODO: 结果检查 —— RTL 就绪后依据 security_monitor / scoreboard 比对
    endtask : body

endclass : sec_005_jtag_secure_sequence

class sec_005_jtag_secure_test extends mpsoc_base_test;

    sec_005_jtag_secure_sequence seq;

    `uvm_component_utils(sec_005_jtag_secure_test)

    function new(string name = "sec_005_jtag_secure_test", uvm_component parent = null);
        super.new(name, parent);
        seq = sec_005_jtag_secure_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.security_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : sec_005_jtag_secure_test

`endif
