//--------------------------------------------------------------------
// sec_003_secure_boot_test : 安全启动链
//
// TST 编号 : TST-SEC-003
// 测试项   : 安全启动链
// 优先级   : 高
// UVC 映射 : security_base_sequence -> env.mpsoc_vseqr.security_seqr
//
// 飞书描述 : BOOT ROM 校验 OTP 密钥并验签加载固件
// 预期结果 : 合法固件启动成功,非法/未签固件被拒绝
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/sec
//             2) testcase/mpsoc_TestTop.svh 追加 `include "sec_003_secure_boot_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _SEC_003_SECURE_BOOT_TEST_
`define _SEC_003_SECURE_BOOT_TEST_

class sec_003_secure_boot_sequence extends security_base_sequence;

    `uvm_object_utils(sec_003_secure_boot_sequence)

    function new(string name = "sec_003_secure_boot_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 安全启动链
        `uvm_do_with(req, { req.sec_boot_ok == 1'b1; })
        // TODO: 结果检查 —— RTL 就绪后依据 security_monitor / scoreboard 比对
    endtask : body

endclass : sec_003_secure_boot_sequence

class sec_003_secure_boot_test extends mpsoc_base_test;

    sec_003_secure_boot_sequence seq;

    `uvm_component_utils(sec_003_secure_boot_test)

    function new(string name = "sec_003_secure_boot_test", uvm_component parent = null);
        super.new(name, parent);
        seq = sec_003_secure_boot_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.security_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : sec_003_secure_boot_test

`endif
