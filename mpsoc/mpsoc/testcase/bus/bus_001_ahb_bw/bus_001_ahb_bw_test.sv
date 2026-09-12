//--------------------------------------------------------------------
// bus_001_ahb_bw_test : AHB 总线带宽
//
// TST 编号 : TST-BUS-001
// 测试项   : AHB 总线带宽
// 优先级   : 中
// UVC 映射 : 软件 C 程序(ahb_bw.c) + E906 运行;配套 inst.pat/data.pat 同目录生成
//
// 飞书描述 : CPU/DMA 对 SRAM 大块数据搬移,统计吞吐带宽
// 预期结果 : 实测带宽达到设计规格
//
// 结果检查 : 本 case 加载同目录 inst.pat/data.pat 进 CPU 指令/数据 memory,
//            释放复位启动 E906,轮询 C 程序写回的 PASS/FAIL 标记。
//            当前 DUT 为 pad 级黑盒(RTL 缺失),暂未接入 UVM 编译,
//            待 RTL 就绪后按 cpu/hello_world 模式接入。
//--------------------------------------------------------------------
`ifndef _BUS_001_AHB_BW_TEST_
`define _BUS_001_AHB_BW_TEST_

class bus_001_ahb_bw_test extends mpsoc_base_test;

    string inst_pat = "bus_001_ahb_bw/inst.pat";
    string data_pat = "bus_001_ahb_bw/data.pat";

    `uvm_component_utils(bus_001_ahb_bw_test)

    function new(string name = "bus_001_ahb_bw_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(), "TST-BUS-001 AHB 总线带宽 run_phase begin", UVM_LOW)
        // TODO: RTL 就绪后在此 $readmemh 加载 inst_pat/data_pat 进 CPU
        //       指令/数据 memory,释放复位启动 E906,轮询 PASS/FAIL 结果。
        `uvm_info(get_type_name(), "load inst.pat/data.pat and run E906 (TODO)", UVM_LOW)
        `uvm_info(get_type_name(), "TST-BUS-001 AHB 总线带宽 run_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : run_phase

endclass : bus_001_ahb_bw_test

`endif
