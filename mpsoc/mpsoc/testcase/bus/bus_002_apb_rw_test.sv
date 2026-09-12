//--------------------------------------------------------------------
// bus_002_apb_rw_test : APB 桥接读写
//
// TST 编号 : TST-BUS-002
// 测试项   : APB 桥接读写
// 优先级   : 高
// UVC 映射 : sysctrl_base_sequence -> env.mpsoc_vseqr.sysctrl_seqr
//
// 飞书描述 : 对全部 APB 外设寄存器执行写-读回环测试
// 预期结果 : 寄存器读写正确,总线无挂死
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/bus
//             2) testcase/mpsoc_TestTop.svh 追加 `include "bus_002_apb_rw_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _BUS_002_APB_RW_TEST_
`define _BUS_002_APB_RW_TEST_

class bus_002_apb_rw_sequence extends sysctrl_base_sequence;

    `uvm_object_utils(bus_002_apb_rw_sequence)

    function new(string name = "bus_002_apb_rw_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // APB 桥接读写
        `uvm_do_with(req, { req.CFG == WRITE;
        req.ADDR inside {{[32'h40000000:32'h4001FFFF]}}; })
        // TODO: 结果检查 —— RTL 就绪后依据 sysctrl_monitor / scoreboard 比对
    endtask : body

endclass : bus_002_apb_rw_sequence

class bus_002_apb_rw_test extends mpsoc_base_test;

    bus_002_apb_rw_sequence seq;

    `uvm_component_utils(bus_002_apb_rw_test)

    function new(string name = "bus_002_apb_rw_test", uvm_component parent = null);
        super.new(name, parent);
        seq = bus_002_apb_rw_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.sysctrl_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : bus_002_apb_rw_test

`endif
