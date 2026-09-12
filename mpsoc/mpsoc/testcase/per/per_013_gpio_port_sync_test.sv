//--------------------------------------------------------------------
// per_013_gpio_port_sync_test : GPIO 外部端口与同步电平
//
// TST 编号 : TST-PER-013
// 测试项   : GPIO 外部端口与同步电平
// 优先级   : 中
// UVC 映射 : gpio_base_sequence -> env.mpsoc_vseqr.gpio_seqr
//
// 飞书描述 : 读写 EXT_PORTA/B/C/D 与 LS_SYNC,验证外部输入采样与同步选择
// 预期结果 : EXT 端口读写一致,LS_SYNC 电平选择生效
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_013_gpio_port_sync_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_013_GPIO_PORT_SYNC_TEST_
`define _PER_013_GPIO_PORT_SYNC_TEST_

class per_013_gpio_port_sync_sequence extends gpio_base_sequence;

    `uvm_object_utils(per_013_gpio_port_sync_sequence)

    function new(string name = "per_013_gpio_port_sync_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // GPIO 外部端口与同步电平
        `uvm_do_with(req, { req.b_pad_gpio_portb == 16'h00FF; })
        // TODO: 结果检查 —— RTL 就绪后依据 gpio_monitor / scoreboard 比对
    endtask : body

endclass : per_013_gpio_port_sync_sequence

class per_013_gpio_port_sync_test extends mpsoc_base_test;

    per_013_gpio_port_sync_sequence seq;

    `uvm_component_utils(per_013_gpio_port_sync_test)

    function new(string name = "per_013_gpio_port_sync_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_013_gpio_port_sync_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.gpio_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_013_gpio_port_sync_test

`endif
