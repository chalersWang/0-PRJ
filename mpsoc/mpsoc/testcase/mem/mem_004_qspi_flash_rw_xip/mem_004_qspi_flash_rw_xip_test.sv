//--------------------------------------------------------------------
// mem_004_qspi_flash_rw_xip_test : QSPI FLASH 读写/XIP
//
// TST 编号 : TST-MEM-004
// 测试项   : QSPI FLASH 读写/XIP
// 优先级   : 高
// UVC 映射 : qspi_base_sequence -> env.mpsoc_vseqr.qspi_seqr
//
// 飞书描述 : QSPI FLASH 擦除/编程/读回,并验证 XIP 模式执行代码
// 预期结果 : 数据正确,XIP 可正常取指执行
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/mem
//             2) testcase/mpsoc_TestTop.svh 追加 `include "mem_004_qspi_flash_rw_xip_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _MEM_004_QSPI_FLASH_RW_XIP_TEST_
`define _MEM_004_QSPI_FLASH_RW_XIP_TEST_

class mem_004_qspi_flash_rw_xip_sequence extends qspi_base_sequence;

    `uvm_object_utils(mem_004_qspi_flash_rw_xip_sequence)

    function new(string name = "mem_004_qspi_flash_rw_xip_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // QSPI FLASH 读写/XIP
        `uvm_do_with(req, { req.QSPI_CS0N_o == 1'b0;
        req.QSPI_SCLK_o == 1'b0;
        req.QSPI_DAT0 == 1'b0; })
        // TODO: 结果检查 —— RTL 就绪后依据 qspi_monitor / scoreboard 比对
    endtask : body

endclass : mem_004_qspi_flash_rw_xip_sequence

class mem_004_qspi_flash_rw_xip_test extends mpsoc_base_test;

    mem_004_qspi_flash_rw_xip_sequence seq;

    `uvm_component_utils(mem_004_qspi_flash_rw_xip_test)

    function new(string name = "mem_004_qspi_flash_rw_xip_test", uvm_component parent = null);
        super.new(name, parent);
        seq = mem_004_qspi_flash_rw_xip_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.qspi_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : mem_004_qspi_flash_rw_xip_test

`endif
