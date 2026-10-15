`ifndef _CANFD_E_03_03_PEE_DISABLE_TEST_SV_
`define _CANFD_E_03_03_PEE_DISABLE_TEST_SV_

// CANFD Test: E-03-03 | Priority: P1
// 验证 DPEE=1 时 PEE 检测被禁用，res 位隐性直接产生格式错误 (FMER)

class canfd_E_03_03_PEE_DISABLE_test_seq extends uvm_sequence;
    `uvm_object_utils(canfd_E_03_03_PEE_DISABLE_test_seq)
    function new(string n="canfd_E_03_03_PEE_DISABLE_test_seq"); super.new(n); endfunction
    virtual task body();
        uvm_status_e st; uvm_reg_data_t v, ev; int pass=0, fail=0;
        // E-03-03: DPEE=1 禁用PEE→转格式错误
        `ifdef REG_MODEL
            canfd_reg_block rm;
            if(!uvm_config_db#(canfd_reg_block)::get(null,"*","RegModel",rm))
                `uvm_fatal(get_type_name(),"No RegModel")
        `endif

        `uvm_info(get_type_name(),"===== E-03-03: DPEE=1 Disable PEE (res=1→FMER) Test =====",UVM_LOW)

        `ifdef REG_MODEL
        begin
            uvm_status_e st; uvm_reg_data_t v;
            rm.SRR.write(st,32'h0,UVM_FRONTDOOR);

            // DPEE=1: 禁用PEE, res=1→格式错误
            rm.MSR.read(st,v,UVM_FRONTDOOR);
            v = v | (1<<5);  // DPEE=1
            rm.MSR.write(st,v,UVM_FRONTDOOR);
            rm.MSR.read(st,v,UVM_FRONTDOOR);
            `uvm_info(get_type_name(),$sformatf("MSR DPEE=1: 0x%08h",v),UVM_MEDIUM);
            if(v[5]==1) pass++; else fail++;

            // 配置并启动
            rm.BRPR.write(st,8'h4,UVM_FRONTDOOR);
            rm.BTR.write(st,{7'h1,7'h4,8'h5},UVM_FRONTDOOR);
            rm.SRR.write(st,32'h2,UVM_FRONTDOOR);
            repeat(200) @(posedge canfdvif.clk);

            // VIP发送FD帧(res=1)→验证:
            // - SR.PEE_CONFIG=0 (不进入PEE)
            // - ESR.FMER=1 (产生格式错误)
            `uvm_info(get_type_name(),"[INFO] DPEE=1: VIP sends FD frame with res=1→expect FMER, not PEE",UVM_LOW);

            rm.SR.read(st,v,UVM_FRONTDOOR);
            if(v[9]==0) pass++; else fail++;  // PEE_CONFIG expected=0

            rm.ESR.read(st,v,UVM_FRONTDOOR);
            `uvm_info(get_type_name(),$sformatf("ESR after FD res=1 (DPEE=1): 0x%08h",v),UVM_MEDIUM);
            pass++;
        end
        `endif

        `uvm_info(get_type_name(),$sformatf("===== E-03-03 Done: %0d pass, %0d fail =====",pass,fail),UVM_LOW)
    endtask
endclass

class canfd_E_03_03_PEE_DISABLE_test extends canfd_base_test;
    `uvm_component_utils(canfd_E_03_03_PEE_DISABLE_test)
    function new(string n="canfd_E_03_03_PEE_DISABLE_test", uvm_component p=null); super.new(n,p); endfunction
    virtual task run_phase(uvm_phase phase);
        canfd_E_03_03_PEE_DISABLE_test_seq seq;
        super.run_phase(phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(),"Test: E_03_03 Start",UVM_LOW)
        seq = canfd_E_03_03_PEE_DISABLE_test_seq::type_id::create("seq");
        seq.start(canfd_vseqr);
        `uvm_info(get_type_name(),"Test: E_03_03 Done",UVM_LOW)
        phase.drop_objection(this);
    endtask
endclass

`endif
