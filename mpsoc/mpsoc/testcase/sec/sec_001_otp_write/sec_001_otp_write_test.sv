//--------------------------------------------------------------------
// sec_001_otp_write_test : OTP 一次性写入
//
// TST 编号 : TST-SEC-001
// 测试项   : OTP 一次性写入
// 优先级   : 高
// UVC 映射 : security_base_sequence -> env.mpsoc_vseqr.security_seqr
//
// 飞书描述 : 对 OTP 首次编程,再次编程尝试验证一次性
// 预期结果 : 首次写入成功,再次编程被硬件拒绝,内容不可改
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/sec
//             2) testcase/mpsoc_TestTop.svh 追加 `include "sec_001_otp_write_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _SEC_001_OTP_WRITE_TEST_
`define _SEC_001_OTP_WRITE_TEST_

class sec_001_otp_write_sequence extends security_base_sequence;

    `uvm_object_utils(sec_001_otp_write_sequence)

    function new(string name = "sec_001_otp_write_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // OTP 一次性写入
        `uvm_do_with(req, { req.sec_boot_ok == 1'b0;
        req.sec_int == 1'b0; })
        // TODO: 结果检查 —— RTL 就绪后依据 security_monitor / scoreboard 比对
    endtask : body

endclass : sec_001_otp_write_sequence

class sec_001_otp_write_test extends mpsoc_base_test;

    sec_001_otp_write_sequence seq;

    `uvm_component_utils(sec_001_otp_write_test)

    function new(string name = "sec_001_otp_write_test", uvm_component parent = null);
        super.new(name, parent);
        seq = sec_001_otp_write_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.security_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : sec_001_otp_write_test

`endif
