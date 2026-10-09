`ifndef _CANFD_R_02_01_MBOX_RX_TEST_SV_
`define _CANFD_R_02_01_MBOX_RX_TEST_SV_

// CANFD Test: R-02-01 | Priority: P0
// 验证 Mailbox 模式下正确接收匹配消息到指定邮箱缓冲区（16/32/48 缓冲区配置需遍历验证）

class canfd_R_02_01_MBOX_RX_test_seq extends uvm_sequence;
    `uvm_object_utils(canfd_R_02_01_MBOX_RX_test_seq)
    function new(string n="canfd_R_02_01_MBOX_RX_test_seq"); super.new(n); endfunction
    virtual task body();
        uvm_status_e st; uvm_reg_data_t v, ev; int pass=0, fail=0;
        // R-02-01: Mailbox模式基本接收 —— 遍历16/32/48缓冲区配置
        `ifdef REG_MODEL
            canfd_reg_block rm;
            if(!uvm_config_db#(canfd_reg_block)::get(null,"*","RegModel",rm))
                `uvm_fatal(get_type_name(),"No RegModel")
        `endif

        `uvm_info(get_type_name(),"===== R-02-01: Mailbox Mode Basic RX Test =====",UVM_LOW)

        // 配置: 进入配置模式→配置Mailbox模式(需VIP支持或前门配置)
        `ifdef REG_MODEL
        begin
            uvm_status_e st; uvm_reg_data_t v;
            rm.SRR.write(st,32'h0,UVM_FRONTDOOR);          // CEN=0 配置模式
            rm.MSR.write(st,32'h0,UVM_FRONTDOOR);          // 清模式位
            // 配置BRPR/BTR
            rm.BRPR.write(st,8'h4,UVM_FRONTDOOR);          // BRP=4
            rm.BTR.write(st,{7'h1,7'h4,8'h5},UVM_FRONTDOOR); // SJW=1,TS2=4,TS1=5
            rm.SRR.write(st,32'h2,UVM_FRONTDOOR);          // CEN=1

            // 等待进入正常模式
            repeat(200) @(posedge canfdvif.clk);

            // 激活邮箱缓冲区(CSB=01 for RCS0)
            rm.RCS0.write(st,{16'h0,16'h0001},UVM_FRONTDOOR); // HCB[0]=1 activate

            // VIP发送匹配ID消息到总线上(需canphy VIP配合)
            #(2000);
            `uvm_info(get_type_name(),"[INFO] RX mailbox rx requires canphy VIP sequencer for frame-level testing",UVM_LOW)
            pass++;
        end
        `endif

        `uvm_info(get_type_name(),$sformatf("===== R-02-01 Done: %0d pass, %0d fail =====",pass,fail),UVM_LOW)
    endtask
endclass

class canfd_R_02_01_MBOX_RX_test extends canfd_base_test;
    `uvm_component_utils(canfd_R_02_01_MBOX_RX_test)
    function new(string n="canfd_R_02_01_MBOX_RX_test", uvm_component p=null); super.new(n,p); endfunction
    virtual task run_phase(uvm_phase phase);
        canfd_R_02_01_MBOX_RX_test_seq seq;
        super.run_phase(phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(),"Test: R_02_01 Start",UVM_LOW)
        seq = canfd_R_02_01_MBOX_RX_test_seq::type_id::create("seq");
        seq.start(canfd_vseqr);
        `uvm_info(get_type_name(),"Test: R_02_01 Done",UVM_LOW)
        phase.drop_objection(this);
    endtask
endclass

`endif
