//--------------------------------------------------------------------
// hello_world_test : CPU 软件测试用例（配套 hello_world_main.c）
//
// 与同目录 hello_world_main.c 配对；编译产物（hello_world.elf/.bin/
// inst.pat/data.pat）也生成在同目录。
//
// 当前 DUT 为 pad 级黑盒（E906 双核在 DUT 内部，RTL 尚未提供），本 case
// 暂未接入 UVM 编译（未 include 进 mpsoc_TestTop.svh）。待 RTL 就绪后接入：
//   1) filelist/tb.f 追加  +incdir+${VERIFY_HOME}/testcase/cpu/hello_world
//   2) testcase/mpsoc_TestTop.svh 追加  `include "hello_world_test.sv"
//   3) run_phase 中：加载 inst.pat/data.pat 进 CPU 指令/数据 memory，
//      释放复位、启动 E906，轮询结果并判断 PASS/FAIL
//--------------------------------------------------------------------
`ifndef _HELLO_WORLD_TEST_SV_
`define _HELLO_WORLD_TEST_SV_

class hello_world_test extends mpsoc_base_test;

    `uvm_component_utils(hello_world_test)

    // 同目录生成的 memory 初始化文件（供加载）
    string inst_pat = "hello_world/inst.pat";
    string data_pat = "hello_world/data.pat";

    function new(string name = "hello_world_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(), "hello_world run_phase begin", UVM_LOW)
        // TODO: RTL 就绪后在此加载 inst.pat/data.pat 到 CPU memory，
        //       释放复位并启动 E906，轮询 PASS/FAIL 结果。
        `uvm_info(get_type_name(), "load inst.pat/data.pat and run E906 (TODO)", UVM_LOW)
        `uvm_info(get_type_name(), "hello_world run_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : run_phase

endclass : hello_world_test

`endif
