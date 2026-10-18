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
    string inst_pat0 = "hello_world/kcore0/inst.pat";
    string data_pat0 = "hello_world/kcore0/data.pat";
    string inst_pat1 = "hello_world/kcore1/inst.pat";
    string data_pat1 = "hello_world/kcore1/data.pat";

    function new(string name = "hello_world_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(), "hello_world run_phase begin", UVM_LOW)

        // ===== 1. 后门读写示例 =====
        // 写 kcore0 IRAM word 0, 再读回验证后门访问正确性
        begin
            bit [31:0] wdata = 32'hDEADBEEF;
            bit [31:0] rdata;
            backdoor_write_mem(kcore0_iram_hier, 0, wdata);   // 后门写 kcore0 iram[0]
            backdoor_read_mem (kcore0_iram_hier, 0, rdata);   // 后门读 kcore0 iram[0]
            if (rdata === wdata)
                `uvm_info(get_type_name(), $sformatf("backdoor rw PASS: kcore0 iram[0] = 0x%08h", rdata), UVM_LOW)
            else
                `uvm_error(get_type_name(), $sformatf("backdoor rw FAIL: exp=0x%08h got=0x%08h", wdata, rdata))
        end

        // ===== 2. 后门加载两个 kcore 的 inst.pat/data.pat =====
        // kcore0: inst.pat → IRAM(0x00000000), data.pat → DRAM(0x10000000)
        load_kcore_pat(0, inst_pat0, data_pat0);
        // kcore1: inst.pat → IRAM(0x20000000), data.pat → DRAM(0x30000000)
        load_kcore_pat(1, inst_pat1, data_pat1);

        // TODO: RTL 就绪后在此释放复位、启动 E906，轮询 PASS/FAIL 结果。

        `uvm_info(get_type_name(), "hello_world run_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : run_phase

endclass : hello_world_test

`endif
