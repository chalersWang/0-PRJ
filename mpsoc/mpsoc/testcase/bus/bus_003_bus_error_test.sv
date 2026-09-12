//--------------------------------------------------------------------
// bus_003_bus_error_test : 总线错误处理
//
// TST 编号 : TST-BUS-003
// 测试项   : 总线错误处理
// 优先级   : 中
// UVC 映射 : sysctrl_base_sequence -> env.mpsoc_vseqr.sysctrl_seqr
//
// 飞书描述 : 访问非法地址/未映射区域,注入总线错误并观察响应
// 预期结果 : 触发总线错误中断,错误被捕获,系统可恢复
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/bus
//             2) testcase/mpsoc_TestTop.svh 追加 `include "bus_003_bus_error_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _BUS_003_BUS_ERROR_TEST_
`define _BUS_003_BUS_ERROR_TEST_

class bus_003_bus_error_sequence extends sysctrl_base_sequence;

    `uvm_object_utils(bus_003_bus_error_sequence)

    function new(string name = "bus_003_bus_error_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // 总线错误处理
        `uvm_do_with(req, { req.CFG == READ;
        req.ADDR == 32'hDEAD_BEEF; })
        // TODO: 结果检查 —— RTL 就绪后依据 sysctrl_monitor / scoreboard 比对
    endtask : body

endclass : bus_003_bus_error_sequence

class bus_003_bus_error_test extends mpsoc_base_test;

    bus_003_bus_error_sequence seq;

    `uvm_component_utils(bus_003_bus_error_test)

    function new(string name = "bus_003_bus_error_test", uvm_component parent = null);
        super.new(name, parent);
        seq = bus_003_bus_error_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.sysctrl_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : bus_003_bus_error_test

`endif
