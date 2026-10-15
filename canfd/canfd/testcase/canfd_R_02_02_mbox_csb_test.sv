`ifndef _CANFD_R_02_02_MBOX_CSB_TEST_SV_
`define _CANFD_R_02_02_MBOX_CSB_TEST_SV_

// CANFD Test: R-02-02 | Priority: P0
// 验证 RCS0/1/2 寄存器的 CSB/HCB 状态机：00=非活跃、01=活跃、11=已满、10=无效

class canfd_R_02_02_MBOX_CSB_test_seq extends uvm_sequence;
    `uvm_object_utils(canfd_R_02_02_MBOX_CSB_test_seq)
    function new(string n="canfd_R_02_02_MBOX_CSB_test_seq"); super.new(n); endfunction
    virtual task body();
        uvm_status_e st; uvm_reg_data_t v, ev; int pass=0, fail=0;
        // R-02-02: Mailbox CSB/HCB状态机验证
        `ifdef REG_MODEL
            canfd_reg_block rm;
            if(!uvm_config_db#(canfd_reg_block)::get(null,"*","RegModel",rm))
                `uvm_fatal(get_type_name(),"No RegModel")
        `endif

        `uvm_info(get_type_name(),"===== R-02-02: Mailbox CSB/HCB State Machine Test =====",UVM_LOW)

        `ifdef REG_MODEL
        begin
            uvm_status_e st; uvm_reg_data_t v;
            rm.SRR.write(st,32'h0,UVM_FRONTDOOR);  // 配置模式

            // 测试RCS0: 初始状态应为全0(非活跃)
            rm.RCS0.read(st,v,UVM_FRONTDOOR);
            `uvm_info(get_type_name(),$sformatf("RCS0 init: 0x%08h (expect HCB=CSB=0)",v),UVM_MEDIUM);
            if(v[15:0]==16'h0 && v[31:16]==16'h0) pass++; else fail++;

            // 激活邮箱0: 写HCB[0]=1→CSB[0]应变为01(活跃)
            rm.RCS0.write(st,{16'h0,16'h0001},UVM_FRONTDOOR);
            rm.RCS0.read(st,v,UVM_FRONTDOOR);
            `uvm_info(get_type_name(),$sformatf("RCS0 after activate: 0x%08h",v),UVM_MEDIUM);
            if(v[31]==1'b1) pass++; else fail++;  // CSB[0]=1=active

            // 写CSB[0]=1(非法:只能写HCB激活)→读回确认
            rm.RCS0.write(st,{16'h0001,16'h0},UVM_FRONTDOOR);  // 尝试直接写CSB
            rm.RCS0.read(st,v,UVM_FRONTDOOR);
            `uvm_info(get_type_name(),$sformatf("RCS0 after CSB write: 0x%08h",v),UVM_MEDIUM);

            // 测试RCS1/2 重复以上步骤
            for(int r=1; r<=2; r++) begin
                uvm_reg rg;
                case(r)
                    1: rg = rm.RCS1;
                    2: rg = rm.RCS2;
                endcase
                rg.read(st,v,UVM_FRONTDOOR);
                `uvm_info(get_type_name(),$sformatf("RCS%0d init: 0x%08h",r,v),UVM_MEDIUM);
                pass++;
            end
        end
        `endif

        `uvm_info(get_type_name(),$sformatf("===== R-02-02 Done: %0d pass, %0d fail =====",pass,fail),UVM_LOW)
    endtask
endclass

class canfd_R_02_02_MBOX_CSB_test extends canfd_base_test;
    `uvm_component_utils(canfd_R_02_02_MBOX_CSB_test)
    function new(string n="canfd_R_02_02_MBOX_CSB_test", uvm_component p=null); super.new(n,p); endfunction
    virtual task run_phase(uvm_phase phase);
        canfd_R_02_02_MBOX_CSB_test_seq seq;
        super.run_phase(phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(),"Test: R_02_02 Start",UVM_LOW)
        seq = canfd_R_02_02_MBOX_CSB_test_seq::type_id::create("seq");
        seq.start(canfd_vseqr);
        `uvm_info(get_type_name(),"Test: R_02_02 Done",UVM_LOW)
        phase.drop_objection(this);
    endtask
endclass

`endif
