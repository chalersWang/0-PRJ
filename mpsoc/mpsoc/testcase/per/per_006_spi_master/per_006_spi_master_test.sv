//--------------------------------------------------------------------
// per_006_spi_master_test : SPI Master 通信
//
// TST 编号 : TST-PER-006
// 测试项   : SPI Master 通信
// 优先级   : 高
// UVC 映射 : spi_base_sequence -> env.mpsoc_vseqr.spi_seqr
//
// 飞书描述 : SPI 主模式在 4 种 CPOL/CPHA 下驱动从器件读写
// 预期结果 : 各模式数据正确,速率符合配置
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_006_spi_master_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_006_SPI_MASTER_TEST_
`define _PER_006_SPI_MASTER_TEST_

class per_006_spi_master_sequence extends spi_base_sequence;

    `uvm_object_utils(per_006_spi_master_sequence)

    function new(string name = "per_006_spi_master_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // SPI Master 通信
        `uvm_do_with(req, { req.channel == 0;
        req.frame_size == 8;
        req.tx_data == 32'h5A; })
        // TODO: 结果检查 —— RTL 就绪后依据 spi_monitor / scoreboard 比对
    endtask : body

endclass : per_006_spi_master_sequence

class per_006_spi_master_test extends mpsoc_base_test;

    per_006_spi_master_sequence seq;

    `uvm_component_utils(per_006_spi_master_test)

    function new(string name = "per_006_spi_master_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_006_spi_master_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.spi_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_006_spi_master_test

`endif
