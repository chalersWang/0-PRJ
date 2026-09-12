//--------------------------------------------------------------------
// cpu_004_tcm_rw_test : 私有 TCM 读写
//
// TST 编号 : TST-CPU-004
// 测试项   : 私有 TCM 读写
// 优先级   : 高
// UVC 映射 : 软件 C 程序(tcm_march.c) + E906 运行;配套 inst.pat/data.pat 同目录生成
//
// 飞书描述 : CPU0/CPU1 各自对 IRAM(16K)/DRAM(16K) 全地址执行棋盘/March 模式读写
// 预期结果 : 读写数据一致,边界地址无越界,无总线错误
//
// 结果检查 : 本 case 加载同目录 inst.pat/data.pat 进 CPU 指令/数据 memory,
//            释放复位启动 E906,轮询 C 程序写回的 PASS/FAIL 标记。
//            当前 DUT 为 pad 级黑盒(RTL 缺失),暂未接入 UVM 编译,
//            待 RTL 就绪后按 cpu/hello_world 模式接入。
//--------------------------------------------------------------------
`ifndef _CPU_004_TCM_RW_TEST_
`define _CPU_004_TCM_RW_TEST_

class cpu_004_tcm_rw_test extends mpsoc_base_test;

    string inst_pat = "cpu_004_tcm_rw/inst.pat";
    string data_pat = "cpu_004_tcm_rw/data.pat";

    `uvm_component_utils(cpu_004_tcm_rw_test)

    function new(string name = "cpu_004_tcm_rw_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(), "TST-CPU-004 私有 TCM 读写 run_phase begin", UVM_LOW)
        // TODO: RTL 就绪后在此 $readmemh 加载 inst_pat/data_pat 进 CPU
        //       指令/数据 memory,释放复位启动 E906,轮询 PASS/FAIL 结果。
        `uvm_info(get_type_name(), "load inst.pat/data.pat and run E906 (TODO)", UVM_LOW)
        `uvm_info(get_type_name(), "TST-CPU-004 私有 TCM 读写 run_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : run_phase

endclass : cpu_004_tcm_rw_test

`endif
