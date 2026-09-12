//--------------------------------------------------------------------
// per_007_spi_slave_test : SPI Slave 通信
//
// TST 编号 : TST-PER-007
// 测试项   : SPI Slave 通信
// 优先级   : 中
// UVC 映射 : spi_base_sequence -> env.mpsoc_vseqr.spi_seqr
//
// 飞书描述 : 外部主控通过 SPI 从口写本芯片并回读
// 预期结果 : 数据正确接收/应答,CS 片选逻辑正确
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_007_spi_slave_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_007_SPI_SLAVE_TEST_
`define _PER_007_SPI_SLAVE_TEST_

class per_007_spi_slave_sequence extends spi_base_sequence;

    `uvm_object_utils(per_007_spi_slave_sequence)

    function new(string name = "per_007_spi_slave_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // SPI Slave 通信
        `uvm_do_with(req, { req.channel == 1;
        req.frame_size == 16;
        req.tx_data == 32'hA5A5; })
        // TODO: 结果检查 —— RTL 就绪后依据 spi_monitor / scoreboard 比对
    endtask : body

endclass : per_007_spi_slave_sequence

class per_007_spi_slave_test extends mpsoc_base_test;

    per_007_spi_slave_sequence seq;

    `uvm_component_utils(per_007_spi_slave_test)

    function new(string name = "per_007_spi_slave_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_007_spi_slave_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.spi_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_007_spi_slave_test

`endif
