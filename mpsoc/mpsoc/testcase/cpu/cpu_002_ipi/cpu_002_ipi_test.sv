//--------------------------------------------------------------------
// cpu_002_ipi_test : 核间中断通信
//
// TST 编号 : TST-CPU-002
// 测试项   : 核间中断通信
// 优先级   : 高
// UVC 映射 : 软件 C 程序(core_ipi.c) + E906 运行;配套 inst.pat/data.pat 同目录生成
//
// 飞书描述 : CPU0 触发核间中断,CPU1 响应处理并回执,统计往返延迟
// 预期结果 : CPU1 在设定延迟内响应,1000 次往返无丢失
//
// 结果检查 : 本 case 加载同目录 inst.pat/data.pat 进 CPU 指令/数据 memory,
//            释放复位启动 E906,轮询 C 程序写回的 PASS/FAIL 标记。
//            当前 DUT 为 pad 级黑盒(RTL 缺失),暂未接入 UVM 编译,
//            待 RTL 就绪后按 cpu/hello_world 模式接入。
//--------------------------------------------------------------------
`ifndef _CPU_002_IPI_TEST_
`define _CPU_002_IPI_TEST_

class cpu_002_ipi_test extends mpsoc_base_test;

    string inst_pat = "cpu_002_ipi/inst.pat";
    string data_pat = "cpu_002_ipi/data.pat";

    `uvm_component_utils(cpu_002_ipi_test)

    function new(string name = "cpu_002_ipi_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(), "TST-CPU-002 核间中断通信 run_phase begin", UVM_LOW)
        // TODO: RTL 就绪后在此 $readmemh 加载 inst_pat/data_pat 进 CPU
        //       指令/数据 memory,释放复位启动 E906,轮询 PASS/FAIL 结果。
        `uvm_info(get_type_name(), "load inst.pat/data.pat and run E906 (TODO)", UVM_LOW)
        `uvm_info(get_type_name(), "TST-CPU-002 核间中断通信 run_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : run_phase

endclass : cpu_002_ipi_test

`endif
