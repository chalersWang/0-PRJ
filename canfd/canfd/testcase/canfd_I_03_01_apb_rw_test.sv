`ifndef _CANFD_I_03_01_APB_RW_TEST_SV_
`define _CANFD_I_03_01_APB_RW_TEST_SV_

// CANFD Test: I-03-01 | Priority: P0
// 验证 APB 接口基本读写传输正确

class canfd_I_03_01_APB_RW_test_seq extends uvm_sequence;
    `uvm_object_utils(canfd_I_03_01_APB_RW_test_seq)
    function new(string n="canfd_I_03_01_APB_RW_test_seq"); super.new(n); endfunction
    virtual task body();
        uvm_status_e st; uvm_reg_data_t v, ev; int pass=0, fail=0;
        // I-03-01: APB接口基本读写
        `ifdef REG_MODEL
            canfd_reg_block rm;
            if(!uvm_config_db#(canfd_reg_block)::get(null,"*","RegModel",rm))
                `uvm_fatal(get_type_name(),"No RegModel")
        `endif

        `uvm_info(get_type_name(),"===== I-03-01: APB Basic R/W Test =====",UVM_LOW)

        `ifdef REG_MODEL
        begin
            uvm_status_e st; uvm_reg_data_t v;

            // APB接口信号: paddr,pwdata,pwrite,psel,penable,prdata,pready,perror
            // APB写: psel=1→pwrite=1→penable=1→等pready=1
            // APB读: psel=1→pwrite=0→penable=1→等pready=1→采样prdata

            rm.SRR.write(st,32'h0,UVM_FRONTDOOR);  // 配置模式
            repeat(100) @(posedge canfdvif.clk);

            // 遍历所有核心寄存器: APB读
            uvm_reg rgs[$]; rm.get_registers(rgs);
            foreach(rgs[i]) begin
                rgs[i].read(st,v,UVM_FRONTDOOR);
                if(st==UVM_IS_OK) pass++; else begin
                    `uvm_error(get_type_name(),$sformatf("APB read fail: %s",rgs[i].get_name()));
                    fail++;
                end
            end

            // APB写: 只写RW寄存器
            foreach(rgs[i]) begin
                if(rgs[i].get_access()=="RW") begin
                    uvm_reg_data_t wv = {$urandom} & ((1<<rgs[i].get_n_bits())-1);
                    rgs[i].write(st,wv,UVM_FRONTDOOR);
                    rgs[i].read(st,v,UVM_FRONTDOOR);
                    if(st==UVM_IS_OK) pass++; else fail++;
                end
            end
        end
        `endif

        `uvm_info(get_type_name(),$sformatf("===== I-03-01 Done: %0d pass, %0d fail =====",pass,fail),UVM_LOW)
    endtask
endclass

class canfd_I_03_01_APB_RW_test extends canfd_base_test;
    `uvm_component_utils(canfd_I_03_01_APB_RW_test)
    function new(string n="canfd_I_03_01_APB_RW_test", uvm_component p=null); super.new(n,p); endfunction
    virtual task run_phase(uvm_phase phase);
        canfd_I_03_01_APB_RW_test_seq seq;
        super.run_phase(phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(),"Test: I_03_01 Start",UVM_LOW)
        seq = canfd_I_03_01_APB_RW_test_seq::type_id::create("seq");
        seq.start(canfd_vseqr);
        `uvm_info(get_type_name(),"Test: I_03_01 Done",UVM_LOW)
        phase.drop_objection(this);
    endtask
endclass

`endif
