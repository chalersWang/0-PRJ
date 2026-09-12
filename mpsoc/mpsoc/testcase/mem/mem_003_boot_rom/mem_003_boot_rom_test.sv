//--------------------------------------------------------------------
// mem_003_boot_rom_test : BOOT ROM 启动流程
//
// TST 编号 : TST-MEM-003
// 测试项   : BOOT ROM 启动流程
// 优先级   : 高
// UVC 映射 : 软件 C 程序(boot_rom_boot.c) + E906 运行;配套 inst.pat/data.pat 同目录生成
//
// 飞书描述 : 断电重启多次,验证启动时序与引导完整性
// 预期结果 : 每次均成功引导,无随机失败
//
// 结果检查 : 本 case 加载同目录 inst.pat/data.pat 进 CPU 指令/数据 memory,
//            释放复位启动 E906,轮询 C 程序写回的 PASS/FAIL 标记。
//            当前 DUT 为 pad 级黑盒(RTL 缺失),暂未接入 UVM 编译,
//            待 RTL 就绪后按 cpu/hello_world 模式接入。
//--------------------------------------------------------------------
`ifndef _MEM_003_BOOT_ROM_TEST_
`define _MEM_003_BOOT_ROM_TEST_

class mem_003_boot_rom_test extends mpsoc_base_test;

    string inst_pat = "mem_003_boot_rom/inst.pat";
    string data_pat = "mem_003_boot_rom/data.pat";

    `uvm_component_utils(mem_003_boot_rom_test)

    function new(string name = "mem_003_boot_rom_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(), "TST-MEM-003 BOOT ROM 启动流程 run_phase begin", UVM_LOW)
        // TODO: RTL 就绪后在此 $readmemh 加载 inst_pat/data_pat 进 CPU
        //       指令/数据 memory,释放复位启动 E906,轮询 PASS/FAIL 结果。
        `uvm_info(get_type_name(), "load inst.pat/data.pat and run E906 (TODO)", UVM_LOW)
        `uvm_info(get_type_name(), "TST-MEM-003 BOOT ROM 启动流程 run_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : run_phase

endclass : mem_003_boot_rom_test

`endif
