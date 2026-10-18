//--------------------------------------------------------------------
// per_022_spi_dual_quad_ddr_test : SPI Dual/Quad/Octal 与 DDR
//
// TST 编号 : TST-PER-022
// 测试项   : SPI Dual/Quad/Octal 与 DDR
// 优先级   : 中
// UVC 映射 : spi_base_sequence -> env.mpsoc_vseqr.spi_seqr
//
// 飞书描述 : 配置 2/4/8 线数据宽度与 DDR 模式,读写从器件并校验速率
// 预期结果 : 多线模式数据正确,DDR 双沿采样无误码
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_022_spi_dual_quad_ddr_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_022_SPI_DUAL_QUAD_DDR_TEST_
`define _PER_022_SPI_DUAL_QUAD_DDR_TEST_

class per_022_spi_dual_quad_ddr_sequence extends spi_base_sequence;

    `uvm_object_utils(per_022_spi_dual_quad_ddr_sequence)

    function new(string name = "per_022_spi_dual_quad_ddr_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // SPI Dual/Quad/Octal 与 DDR
        `uvm_do_with(req, { req.channel == 0;
        req.frame_size == 32;
        req.tx_data == 32'hAAAA_5555; })
        // TODO: 结果检查 —— RTL 就绪后依据 spi_monitor / scoreboard 比对
    endtask : body

endclass : per_022_spi_dual_quad_ddr_sequence

class per_022_spi_dual_quad_ddr_test extends mpsoc_base_test;

    per_022_spi_dual_quad_ddr_sequence seq;

    `uvm_component_utils(per_022_spi_dual_quad_ddr_test)

    function new(string name = "per_022_spi_dual_quad_ddr_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_022_spi_dual_quad_ddr_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.spi_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_022_spi_dual_quad_ddr_test

`endif
