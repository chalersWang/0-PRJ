//--------------------------------------------------------------------
// dma_004_dma_cpu_race_test : DMA 与 CPU 竞争
//
// TST 编号 : TST-DMA-004
// 测试项   : DMA 与 CPU 竞争
// 优先级   : 中
// UVC 映射 : 软件 C 程序(dma_cpu_race.c) + E906 运行;配套 inst.pat/data.pat 同目录生成
//
// 飞书描述 : DMA 搬运同时 CPU 读写同一区域,验证总线仲裁
// 预期结果 : 仲裁正确,无数据覆盖错乱
//
// 结果检查 : 本 case 加载同目录 inst.pat/data.pat 进 CPU 指令/数据 memory,
//            释放复位启动 E906,轮询 C 程序写回的 PASS/FAIL 标记。
//            当前 DUT 为 pad 级黑盒(RTL 缺失),暂未接入 UVM 编译,
//            待 RTL 就绪后按 cpu/hello_world 模式接入。
//--------------------------------------------------------------------
`ifndef _DMA_004_DMA_CPU_RACE_TEST_
`define _DMA_004_DMA_CPU_RACE_TEST_

class dma_004_dma_cpu_race_test extends mpsoc_base_test;

    string inst_pat = "dma_004_dma_cpu_race/inst.pat";
    string data_pat = "dma_004_dma_cpu_race/data.pat";

    `uvm_component_utils(dma_004_dma_cpu_race_test)

    function new(string name = "dma_004_dma_cpu_race_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(), "TST-DMA-004 DMA 与 CPU 竞争 run_phase begin", UVM_LOW)
        // TODO: RTL 就绪后在此 $readmemh 加载 inst_pat/data_pat 进 CPU
        //       指令/数据 memory,释放复位启动 E906,轮询 PASS/FAIL 结果。
        `uvm_info(get_type_name(), "load inst.pat/data.pat and run E906 (TODO)", UVM_LOW)
        `uvm_info(get_type_name(), "TST-DMA-004 DMA 与 CPU 竞争 run_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : run_phase

endclass : dma_004_dma_cpu_race_test

`endif
