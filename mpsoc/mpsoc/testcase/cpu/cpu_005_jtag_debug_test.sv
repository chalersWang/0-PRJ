//--------------------------------------------------------------------
// cpu_005_jtag_debug_test : JTAG 调试
//
// TST 编号 : TST-CPU-005
// 测试项   : JTAG 调试
// 优先级   : 中
// UVC 映射 : jtag_base_sequence -> env.mpsoc_vseqr.jtag_seqr
//
// 飞书描述 : 通过 JTAG 连接调试器,执行断点、单步、寄存器/内存读写、下载
// 预期结果 : 调试器正常连接,断点触发,寄存器可读写,可在线下载
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/cpu
//             2) testcase/mpsoc_TestTop.svh 追加 `include "cpu_005_jtag_debug_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _CPU_005_JTAG_DEBUG_TEST_
`define _CPU_005_JTAG_DEBUG_TEST_

class cpu_005_jtag_debug_sequence extends jtag_base_sequence;

    `uvm_object_utils(cpu_005_jtag_debug_sequence)

    function new(string name = "cpu_005_jtag_debug_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // JTAG 调试
        `uvm_do_with(req, { req.i_pad_jtg_nrst_b == 1'b1;
        req.i_pad_jtg_tclk == 1'b1;
        req.i_pad_jtg_tms == 1'b0; })
        // TODO: 结果检查 —— RTL 就绪后依据 jtag_monitor / scoreboard 比对
    endtask : body

endclass : cpu_005_jtag_debug_sequence

class cpu_005_jtag_debug_test extends mpsoc_base_test;

    cpu_005_jtag_debug_sequence seq;

    `uvm_component_utils(cpu_005_jtag_debug_test)

    function new(string name = "cpu_005_jtag_debug_test", uvm_component parent = null);
        super.new(name, parent);
        seq = cpu_005_jtag_debug_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.jtag_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : cpu_005_jtag_debug_test

`endif
