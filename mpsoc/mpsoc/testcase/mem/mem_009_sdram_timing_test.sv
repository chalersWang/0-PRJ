//--------------------------------------------------------------------
// mem_009_sdram_timing_test : SDRAM 时序配置与静态存储
//
// TST 编号 : TST-MEM-009
// 测试项   : SDRAM 时序配置与静态存储
// 优先级   : 中
// UVC 映射 : sdram_base_sequence -> env.mpsoc_vseqr.sdram_seqr
//
// 飞书描述 : 配置 SCONR/STMG0R/STMG1R 时序参数(tRC/tRP/tRCD/CAS),验证 NOR/SRAM 静态存储访问
// 预期结果 : 时序参数生效,SDRAM/静态存储读写正确
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/mem
//             2) testcase/mpsoc_TestTop.svh 追加 `include "mem_009_sdram_timing_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _MEM_009_SDRAM_TIMING_TEST_
`define _MEM_009_SDRAM_TIMING_TEST_

class mem_009_sdram_timing_sequence extends sdram_base_sequence;

    `uvm_object_utils(mem_009_sdram_timing_sequence)

    function new(string name = "mem_009_sdram_timing_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // SDRAM 时序配置与静态存储
        `uvm_do_with(req, { req.cmd == 4'b0101;
        req.bank == 2'b00;
        req.addr == 13'h0100; })
        // TODO: 结果检查 —— RTL 就绪后依据 sdram_monitor / scoreboard 比对
    endtask : body

endclass : mem_009_sdram_timing_sequence

class mem_009_sdram_timing_test extends mpsoc_base_test;

    mem_009_sdram_timing_sequence seq;

    `uvm_component_utils(mem_009_sdram_timing_test)

    function new(string name = "mem_009_sdram_timing_test", uvm_component parent = null);
        super.new(name, parent);
        seq = mem_009_sdram_timing_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.sdram_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : mem_009_sdram_timing_test

`endif
