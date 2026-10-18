//--------------------------------------------------------------------
// per_023_spi_microwire_test : SPI Microwire 与 RX 采样延迟
//
// TST 编号 : TST-PER-023
// 测试项   : SPI Microwire 与 RX 采样延迟
// 优先级   : 中
// UVC 映射 : spi_base_sequence -> env.mpsoc_vseqr.spi_seqr
//
// 飞书描述 : 配置 MWCR Microwire 模式;调 RX_SAMPLE_DLY 验证采样延迟
// 预期结果 : Microwire 时序正确,采样延迟改善高速读数据
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_023_spi_microwire_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_023_SPI_MICROWIRE_TEST_
`define _PER_023_SPI_MICROWIRE_TEST_

class per_023_spi_microwire_sequence extends spi_base_sequence;

    `uvm_object_utils(per_023_spi_microwire_sequence)

    function new(string name = "per_023_spi_microwire_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // SPI Microwire 与 RX 采样延迟
        `uvm_do_with(req, { req.channel == 2;
        req.frame_size == 8;
        req.tx_data == 32'h5A5A_5A5A; })
        // TODO: 结果检查 —— RTL 就绪后依据 spi_monitor / scoreboard 比对
    endtask : body

endclass : per_023_spi_microwire_sequence

class per_023_spi_microwire_test extends mpsoc_base_test;

    per_023_spi_microwire_sequence seq;

    `uvm_component_utils(per_023_spi_microwire_test)

    function new(string name = "per_023_spi_microwire_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_023_spi_microwire_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.spi_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_023_spi_microwire_test

`endif
