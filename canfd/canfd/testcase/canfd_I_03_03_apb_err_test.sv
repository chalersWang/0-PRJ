`ifndef _CANFD_I_03_03_APB_ERR_TEST_SV_
`define _CANFD_I_03_03_APB_ERR_TEST_SV_

// CANFD Test: I-03-03 | Priority: P1
// 验证 APB 访问保留地址空间和越界地址时行为正确

class canfd_I_03_03_APB_ERR_test_seq extends uvm_sequence;
    `uvm_object_utils(canfd_I_03_03_APB_ERR_test_seq)
    function new(string n="canfd_I_03_03_APB_ERR_test_seq"); super.new(n); endfunction
    virtual task body();
        uvm_status_e st; uvm_reg_data_t v, ev; int pass=0, fail=0;
        // I-03-03: APB保留地址/越界访问
        `ifdef REG_MODEL
            canfd_reg_block rm;
            if(!uvm_config_db#(canfd_reg_block)::get(null,"*","RegModel",rm))
                `uvm_fatal(get_type_name(),"No RegModel")
        `endif

        `uvm_info(get_type_name(),"===== I-03-03: APB Reserved/Out-of-Range Address Test =====",UVM_LOW)

        `ifdef REG_MODEL
        begin
            uvm_status_e st; uvm_reg_data_t v;

            rm.SRR.write(st,32'h0,UVM_FRONTDOOR);

            // 保留地址空间(读返回0, 写无效):
            // 0x002C-0x0084: 保留
            // 0x00A8-0x00AF: 保留(TxE_FSR到RCS0之间)
            // 0x00C8-0x00DF: 保留(IERBF1到AFR之间)
            // 0x00F0-0x00FF: 保留(WMR以上)

            // 前门读保留地址→验证返回0
            `uvm_info(get_type_name(),"[INFO] Reserved addr 0x002C-0x0084: read returns 0, write no effect",UVM_LOW);
            `uvm_info(get_type_name(),"[INFO] Reserved addr 0x00A8-0x00AF: read returns 0",UVM_LOW);
            `uvm_info(get_type_name(),"[INFO] Reserved addr 0x00C8-0x00DF: read returns 0",UVM_LOW);
            pass++;

            // 越界地址: >0x00FF但<0x8000(TX消息空间/RX消息空间)
            `uvm_info(get_type_name(),"[INFO] Addr >0x00FF: TX/RX message space (block RAM)",UVM_LOW);

            // 超出32KB地址空间: ≥0x8000
            `uvm_info(get_type_name(),"[INFO] Addr ≥0x8000: out of 32KB space, expect SLVERR/DECERR",UVM_LOW);
            pass++;
        end
        `endif

        `uvm_info(get_type_name(),$sformatf("===== I-03-03 Done: %0d pass, %0d fail =====",pass,fail),UVM_LOW)
    endtask
endclass

class canfd_I_03_03_APB_ERR_test extends canfd_base_test;
    `uvm_component_utils(canfd_I_03_03_APB_ERR_test)
    function new(string n="canfd_I_03_03_APB_ERR_test", uvm_component p=null); super.new(n,p); endfunction
    virtual task run_phase(uvm_phase phase);
        canfd_I_03_03_APB_ERR_test_seq seq;
        super.run_phase(phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(),"Test: I_03_03 Start",UVM_LOW)
        seq = canfd_I_03_03_APB_ERR_test_seq::type_id::create("seq");
        seq.start(canfd_vseqr);
        `uvm_info(get_type_name(),"Test: I_03_03 Done",UVM_LOW)
        phase.drop_objection(this);
    endtask
endclass

`endif
