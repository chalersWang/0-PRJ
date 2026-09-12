//--------------------------------------------------------------------
// mem_002_sdram_rw_refresh_test : SDRAM 读写与刷新
//
// TST 编号 : TST-MEM-002
// 测试项   : SDRAM 读写与刷新
// 优先级   : 高
// UVC 映射 : sdram_base_sequence -> env.mpsoc_vseqr.sdram_seqr
//
// 飞书描述 : 外接 SDRAM 全容量读写,跨页/刷新长时间压力
// 预期结果 : 长时间运行数据保持正确,无刷新丢失
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/mem
//             2) testcase/mpsoc_TestTop.svh 追加 `include "mem_002_sdram_rw_refresh_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _MEM_002_SDRAM_RW_REFRESH_TEST_
`define _MEM_002_SDRAM_RW_REFRESH_TEST_

class mem_002_sdram_rw_refresh_sequence extends sdram_base_sequence;

    `uvm_object_utils(mem_002_sdram_rw_refresh_sequence)

    function new(string name = "mem_002_sdram_rw_refresh_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // SDRAM 读写与刷新
        `uvm_do_with(req, { req.cmd == 4'b0011;
        req.bank == 2'b00;
        req.addr == 13'h0000;
        req.wdata == 16'h5A5A; })
        // TODO: 结果检查 —— RTL 就绪后依据 sdram_monitor / scoreboard 比对
    endtask : body

endclass : mem_002_sdram_rw_refresh_sequence

class mem_002_sdram_rw_refresh_test extends mpsoc_base_test;

    mem_002_sdram_rw_refresh_sequence seq;

    `uvm_component_utils(mem_002_sdram_rw_refresh_test)

    function new(string name = "mem_002_sdram_rw_refresh_test", uvm_component parent = null);
        super.new(name, parent);
        seq = mem_002_sdram_rw_refresh_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.sdram_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : mem_002_sdram_rw_refresh_test

`endif
