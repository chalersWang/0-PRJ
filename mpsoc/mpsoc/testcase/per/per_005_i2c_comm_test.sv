//--------------------------------------------------------------------
// per_005_i2c_comm_test : I2C 通信
//
// TST 编号 : TST-PER-005
// 测试项   : I2C 通信
// 优先级   : 中
// UVC 映射 : i2c_base_sequence -> env.mpsoc_vseqr.i2c_seqr
//
// 飞书描述 : I2C 主/从模式读写外部从器件,含 ACK/NACK 场景
// 预期结果 : 地址与数据正确,时序满足标准
//
// 结果检查 : TODO —— DUT 为 pad 级黑盒(RTL 缺失)、driver/scoreboard 为桩,
//            本 case 暂未接入 UVM 编译(未 include 进 mpsoc_TestTop.svh)。
//            待 RTL 就绪后接入:
//             1) filelist/tb.f 追加 +incdir+${VERIFY_HOME}/testcase/per
//             2) testcase/mpsoc_TestTop.svh 追加 `include "per_005_i2c_comm_test.sv"
//             3) run_phase 中依据 monitor/scoreboard 对结果做 PASS/FAIL 比对
//--------------------------------------------------------------------
`ifndef _PER_005_I2C_COMM_TEST_
`define _PER_005_I2C_COMM_TEST_

class per_005_i2c_comm_sequence extends i2c_base_sequence;

    `uvm_object_utils(per_005_i2c_comm_sequence)

    function new(string name = "per_005_i2c_comm_sequence");
        super.new(name);
    endfunction : new

    virtual task body();
        // I2C 通信
        `uvm_do_with(req, { req.addr == 7'h50;
        req.rnw == 1'b0;
        req.data.size() == 4; })
        // TODO: 结果检查 —— RTL 就绪后依据 i2c_monitor / scoreboard 比对
    endtask : body

endclass : per_005_i2c_comm_sequence

class per_005_i2c_comm_test extends mpsoc_base_test;

    per_005_i2c_comm_sequence seq;

    `uvm_component_utils(per_005_i2c_comm_test)

    function new(string name = "per_005_i2c_comm_test", uvm_component parent = null);
        super.new(name, parent);
        seq = per_005_i2c_comm_sequence::type_id::create("seq");
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        @(posedge mpsocvif.rstn);
        seq.start(env.mpsoc_vseqr.i2c_seqr);
        #1us;
        phase.drop_objection(this);
    endtask : run_phase

endclass : per_005_i2c_comm_test

`endif
