//--------------------------------------------------------------------
// bus_004_speed_concurrent_test : 高低速通路并发
//
// TST 编号 : TST-BUS-004
// 测试项   : 高低速通路并发
// 优先级   : 中
// UVC 映射 : mpsoc_virtual_seq_lib 协同: sysctrl_base_sequence, esc_base_sequence
//
// 飞书描述 : 高速网络收发与 APB 外设中断并发运行
// 预期结果 : 高低速通路互不阻塞,功能正确
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/bus
//             2) testcase/mpsoc_TestTop.svh 追加 `include "bus_004_speed_concurrent_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _BUS_004_SPEED_CONCURRENT_TEST_
`define _BUS_004_SPEED_CONCURRENT_TEST_

class bus_004_speed_concurrent_sysctrl_sub_seq extends sysctrl_base_sequence;

    `uvm_object_utils(bus_004_speed_concurrent_sysctrl_sub_seq)

    function new(string name = "bus_004_speed_concurrent_sysctrl_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 高低速通路并发(sysctrl)
        `uvm_do_with(req, { req.CFG == WRITE;
        req.ADDR == 32'h40017000; })
    endtask : body

endclass : bus_004_speed_concurrent_sysctrl_sub_seq

class bus_004_speed_concurrent_esc_sub_seq extends esc_base_sequence;

    `uvm_object_utils(bus_004_speed_concurrent_esc_sub_seq)

    function new(string name = "bus_004_speed_concurrent_esc_sub_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        // 高低速通路并发(esc)
        `uvm_do_with(req, { req.ecat_mii_rx_dv == 1'b1; })
    endtask : body

endclass : bus_004_speed_concurrent_esc_sub_seq

class bus_004_speed_concurrent_sequence extends mpsoc_virtual_seq_lib;

    bus_004_speed_concurrent_sysctrl_sub_seq  sysctrl_0_seq;
    bus_004_speed_concurrent_esc_sub_seq  esc_1_seq;

    `uvm_object_utils(bus_004_speed_concurrent_sequence)

    function new(string name = "bus_004_speed_concurrent_sequence");
        super.new(name);
        sysctrl_0_seq = bus_004_speed_concurrent_sysctrl_sub_seq::type_id::create("sysctrl_0_seq");
        esc_1_seq = bus_004_speed_concurrent_esc_sub_seq::type_id::create("esc_1_seq");
    endfunction : new

    virtual task body();
        // 高低速通路并发
        fork
            begin
                sysctrl_0_seq.start(p_sequencer.sysctrl_seqr);
            end
            begin
                esc_1_seq.start(p_sequencer.esc_seqr);
            end
        join
        // TODO: 结果检查 —— RTL 就绪后依据各 monitor / scoreboard 比对
    endtask : body

endclass : bus_004_speed_concurrent_sequence

class bus_004_speed_concurrent_test extends mpsoc_base_test;

    bus_004_speed_concurrent_sequence seq;

    `uvm_component_utils(bus_004_speed_concurrent_test)

    function new(string name = "bus_004_speed_concurrent_test", uvm_component parent = null);
        super.new(name, parent);
        seq = bus_004_speed_concurrent_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : bus_004_speed_concurrent_test

`endif
