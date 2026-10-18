//--------------------------------------------------------------------
// sec_004_fw_tamper_test : 固件篡改检测
//
// TST 编号 : TST-SEC-004
// 测试项   : 固件篡改检测
// 优先级   : 高
// UVC 映射 : security_base_sequence -> env.mpsoc_vseqr.security_seqr
//
// 飞书描述 : 篡改固件任意字节后执行升级/启动
// 预期结果 : 校验失败被拦截,系统保持安全状态
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/sec
//             2) testcase/mpsoc_TestTop.svh 追加 `include "sec_004_fw_tamper_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _SEC_004_FW_TAMPER_TEST_
`define _SEC_004_FW_TAMPER_TEST_

class sec_004_fw_tamper_sequence extends security_base_sequence;

    `uvm_object_utils(sec_004_fw_tamper_sequence)

    function new(string name = "sec_004_fw_tamper_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 固件篡改检测
        `uvm_do_with(req, { req.sec_boot_ok == 1'b0;
        req.sec_int == 1'b1; })
        // TODO: 结果检查 —— RTL 就绪后依据 security_monitor / scoreboard 比对
    endtask : body

endclass : sec_004_fw_tamper_sequence

class sec_004_fw_tamper_test extends mpsoc_base_test;

    sec_004_fw_tamper_sequence seq;

    `uvm_component_utils(sec_004_fw_tamper_test)

    function new(string name = "sec_004_fw_tamper_test", uvm_component parent = null);
        super.new(name, parent);
        seq = sec_004_fw_tamper_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.security_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : sec_004_fw_tamper_test

`endif
