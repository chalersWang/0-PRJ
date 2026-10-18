//--------------------------------------------------------------------
// mem_007_qspi_ddr_dtr_wp_test : QSPI DDR/DTR 与写保护
//
// TST 编号 : TST-MEM-007
// 测试项   : QSPI DDR/DTR 与写保护
// 优先级   : 中
// UVC 映射 : qspi_base_sequence -> env.mpsoc_vseqr.qspi_seqr
//
// 飞书描述 : 使能 DDR/DTR 协议读写;配置写保护区域并尝试越界写
// 预期结果 : DDR/DTR 读写正确,写保护区域写被阻止
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/mem
//             2) testcase/mpsoc_TestTop.svh 追加 `include "mem_007_qspi_ddr_dtr_wp_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _MEM_007_QSPI_DDR_DTR_WP_TEST_
`define _MEM_007_QSPI_DDR_DTR_WP_TEST_

class mem_007_qspi_ddr_dtr_wp_sequence extends qspi_base_sequence;

    `uvm_object_utils(mem_007_qspi_ddr_dtr_wp_sequence)

    function new(string name = "mem_007_qspi_ddr_dtr_wp_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // QSPI DDR/DTR 与写保护
        `uvm_do_with(req, { req.QSPI_CS0N_o == 1'b0;
        req.QSPI_DAT0 == 1'b1;
        req.QSPI_DAT1 == 1'b1; })
        // TODO: 结果检查 —— RTL 就绪后依据 qspi_monitor / scoreboard 比对
    endtask : body

endclass : mem_007_qspi_ddr_dtr_wp_sequence

class mem_007_qspi_ddr_dtr_wp_test extends mpsoc_base_test;

    mem_007_qspi_ddr_dtr_wp_sequence seq;

    `uvm_component_utils(mem_007_qspi_ddr_dtr_wp_test)

    function new(string name = "mem_007_qspi_ddr_dtr_wp_test", uvm_component parent = null);
        super.new(name, parent);
        seq = mem_007_qspi_ddr_dtr_wp_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.qspi_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : mem_007_qspi_ddr_dtr_wp_test

`endif
