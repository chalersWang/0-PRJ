//--------------------------------------------------------------------
// mem_008_qspi_stig_test : QSPI STIG 命令与器件枚举
//
// TST 编号 : TST-MEM-008
// 测试项   : QSPI STIG 命令与器件枚举
// 优先级   : 中
// UVC 映射 : qspi_base_sequence -> env.mpsoc_vseqr.qspi_seqr
//
// 飞书描述 : 通过 Flash Command 控制寄存器(STIG)发送读 ID/擦除/状态命令,验证器件大小与重映射
// 预期结果 : STIG 命令正确,器件枚举与重映射生效
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/mem
//             2) testcase/mpsoc_TestTop.svh 追加 `include "mem_008_qspi_stig_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _MEM_008_QSPI_STIG_TEST_
`define _MEM_008_QSPI_STIG_TEST_

class mem_008_qspi_stig_sequence extends qspi_base_sequence;

    `uvm_object_utils(mem_008_qspi_stig_sequence)

    function new(string name = "mem_008_qspi_stig_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // QSPI STIG 命令与器件枚举
        `uvm_do_with(req, { req.QSPI_CS0N_o == 1'b0;
        req.QSPI_SCLK_o == 1'b0;
        req.QSPI_DAT0 == 1'b0; })
        // TODO: 结果检查 —— RTL 就绪后依据 qspi_monitor / scoreboard 比对
    endtask : body

endclass : mem_008_qspi_stig_sequence

class mem_008_qspi_stig_test extends mpsoc_base_test;

    mem_008_qspi_stig_sequence seq;

    `uvm_component_utils(mem_008_qspi_stig_test)

    function new(string name = "mem_008_qspi_stig_test", uvm_component parent = null);
        super.new(name, parent);
        seq = mem_008_qspi_stig_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.qspi_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : mem_008_qspi_stig_test

`endif
