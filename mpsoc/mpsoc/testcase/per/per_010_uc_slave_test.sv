//--------------------------------------------------------------------
// per_010_uc_slave_test : HOST 接口通信
//
// TST 编号 : TST-PER-010
// 测试项   : HOST 接口通信
// 优先级   : 中
// UVC 映射 : uc_base_sequence -> env.mpsoc_vseqr.uc_seqr
//
// 飞书描述 : 外部主控经 uC Slave 接口与本芯片交换数据
// 预期结果 : 寄存器/数据交互正确,无锁死
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_010_uc_slave_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_010_UC_SLAVE_TEST_
`define _PER_010_UC_SLAVE_TEST_

class per_010_uc_slave_sequence extends uc_base_sequence;

    `uvm_object_utils(per_010_uc_slave_sequence)

    function new(string name = "per_010_uc_slave_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // HOST 接口通信
        `uvm_do_with(req, { req.uc_cs == 1'b1;
        req.uc_wr == 1'b1;
        req.uc_addr == 14'h0000;
        req.uc_data == 12'h000; })
        // TODO: 结果检查 —— RTL 就绪后依据 uc_monitor / scoreboard 比对
    endtask : body

endclass : per_010_uc_slave_sequence

class per_010_uc_slave_test extends mpsoc_base_test;

    per_010_uc_slave_sequence seq;

    `uvm_component_utils(per_010_uc_slave_test)

    function new(string name = "per_010_uc_slave_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_010_uc_slave_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.uc_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_010_uc_slave_test

`endif
