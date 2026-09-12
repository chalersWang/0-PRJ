//--------------------------------------------------------------------
// cpu_006_ahb_concurrent_test : 双核并发访问 AHB
//
// TST 编号 : TST-CPU-006
// 测试项   : 双核并发访问 AHB
// 优先级   : 高
// UVC 映射 : 软件 C 程序(ahb_concurrent.c) + E906 运行;配套 inst.pat/data.pat 同目录生成
//
// 飞书描述 : 双核并发对 SRAM/SDRAM 执行读写压力测试,统计仲裁正确性
// 预期结果 : 总线仲裁正确,无数据损坏、无互锁
//
// 结果检查 : 本 case 加载同目录 inst.pat/data.pat 进 CPU 指令/数据 memory,
//            释放复位启动 E906,轮询 C 程序写回的 PASS/FAIL 标记。
//            当前 DUT 为 pad 级黑盒(RTL 缺失),暂未接入 UVM 编译,
//            待 RTL 就绪后按 cpu/hello_world 模式接入。
//--------------------------------------------------------------------
`ifndef _CPU_006_AHB_CONCURRENT_TEST_
`define _CPU_006_AHB_CONCURRENT_TEST_

class cpu_006_ahb_concurrent_test extends mpsoc_base_test;

    string inst_pat = "cpu_006_ahb_concurrent/inst.pat";
    string data_pat = "cpu_006_ahb_concurrent/data.pat";

    `uvm_component_utils(cpu_006_ahb_concurrent_test)

    function new(string name = "cpu_006_ahb_concurrent_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(), "TST-CPU-006 双核并发访问 AHB run_phase begin", UVM_LOW)
        // TODO: RTL 就绪后在此 $readmemh 加载 inst_pat/data_pat 进 CPU
        //       指令/数据 memory,释放复位启动 E906,轮询 PASS/FAIL 结果。
        `uvm_info(get_type_name(), "load inst.pat/data.pat and run E906 (TODO)", UVM_LOW)
        `uvm_info(get_type_name(), "TST-CPU-006 双核并发访问 AHB run_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : run_phase

endclass : cpu_006_ahb_concurrent_test

`endif
