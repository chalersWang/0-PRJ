//--------------------------------------------------------------------
// per_025_wdt_prot_level_test : WDT 超时动作与保护级别
//
// TST 编号 : TST-PER-025
// 测试项   : WDT 超时动作与保护级别
// 优先级   : 中
// UVC 映射 : wdt_base_sequence -> env.mpsoc_vseqr.wdt_seqr
//
// 飞书描述 : 配置超时后中断或复位两种动作,验证 PROT_LEVEL 写保护
// 预期结果 : 超时动作符合配置,保护级别生效后非法写被拒
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_025_wdt_prot_level_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_025_WDT_PROT_LEVEL_TEST_
`define _PER_025_WDT_PROT_LEVEL_TEST_

class per_025_wdt_prot_level_sequence extends wdt_base_sequence;

    `uvm_object_utils(per_025_wdt_prot_level_sequence)

    function new(string name = "per_025_wdt_prot_level_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // WDT 超时动作与保护级别
        `uvm_do_with(req, { req.timeout_cycles == 200; })
        // TODO: 结果检查 —— RTL 就绪后依据 wdt_monitor / scoreboard 比对
    endtask : body

endclass : per_025_wdt_prot_level_sequence

class per_025_wdt_prot_level_test extends mpsoc_base_test;

    per_025_wdt_prot_level_sequence seq;

    `uvm_component_utils(per_025_wdt_prot_level_test)

    function new(string name = "per_025_wdt_prot_level_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_025_wdt_prot_level_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.wdt_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_025_wdt_prot_level_test

`endif
