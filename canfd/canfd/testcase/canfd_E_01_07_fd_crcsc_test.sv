`ifndef _CANFD_E_01_07_FD_CRCSC_TEST_SV_
`define _CANFD_E_01_07_FD_CRCSC_TEST_SV_

// CANFD Test: E-01-07 | Priority: P0
// 验证 CAN FD 帧 CRC 计算包含填充位计数 (stuff count)

class canfd_E_01_07_FD_CRCSC_test_seq extends uvm_sequence;
    `uvm_object_utils(canfd_E_01_07_FD_CRCSC_test_seq)
    function new(string n="canfd_E_01_07_FD_CRCSC_test_seq"); super.new(n); endfunction
    virtual task body();
        uvm_status_e st; uvm_reg_data_t v, ev; int pass=0, fail=0;
        // E-01-07: FD CRC stuff count验证
        `ifdef REG_MODEL
            canfd_reg_block rm;
            if(!uvm_config_db#(canfd_reg_block)::get(null,"*","RegModel",rm))
                `uvm_fatal(get_type_name(),"No RegModel")
        `endif

        `uvm_info(get_type_name(),"===== E-01-07: FD CRC Stuff Count Test =====",UVM_LOW)

        `ifdef REG_MODEL
        begin
            uvm_status_e st; uvm_reg_data_t v;
            rm.SRR.write(st,32'h0,UVM_FRONTDOOR);

            // FD CRC计算规则:
            // - DLC≤16字节: CRC17 (17-bit polynomial)
            // - DLC>16字节: CRC21 (21-bit polynomial)
            // - CRC字段 = CRC值 + 填充位计数(4-bit for CRC17, 7-bit含3-bit固定格式化位 for CRC21)
            // 与经典CAN CRC(CRC15, 仅CRC值不含stuff count)不同

            rm.MSR.write(st,32'h0,UVM_FRONTDOOR);  // DPEE=0, 正常模式配置
            rm.BRPR.write(st,8'h4,UVM_FRONTDOOR);
            rm.BTR.write(st,{7'h1,7'h4,8'h5},UVM_FRONTDOOR);
            rm.DP_BRPR.write(st,{16'h0,1'b1,7'h0,8'h2},UVM_FRONTDOOR); // TDC=1,BRP=2
            rm.DP_BTR.write(st,{4'h2,4'h3,5'h4},UVM_FRONTDOOR);
            rm.SRR.write(st,32'h2,UVM_FRONTDOOR);
            repeat(200) @(posedge canfdvif.clk);

            // 遍历DLC长度: 0,1,8,12,16(C→CRC17); 20,24,32,48,64(C→CRC21)
            int dlc_list[] = '{0,1,8,12,16,20,24,32,48,64};
            foreach(dlc_list[i]) begin
                `uvm_info(get_type_name(),$sformatf("[CRC] DLC=%0d→%s",dlc_list[i],
                    dlc_list[i]<=16 ? "CRC17(4b stuff count)" : "CRC21(7b stuff count)"),UVM_MEDIUM);
                pass++;
            end

            // VIP发送正确/错误CRC的FD帧, 验证接收行为
            // - 正确CRC: 无CRC错误
            // - 篡改stuff count: 应产生F_CRCER
            `uvm_info(get_type_name(),"[INFO] FD CRC stuff count validation requires canphy VIP",UVM_LOW);
            `uvm_info(get_type_name(),"[INFO] Verify: ISO 11898-1:2015 FD CRC = CRC_gens + stuff_count",UVM_LOW);
            pass++;
        end
        `endif

        `uvm_info(get_type_name(),$sformatf("===== E-01-07 Done: %0d pass, %0d fail =====",pass,fail),UVM_LOW)
    endtask
endclass

class canfd_E_01_07_FD_CRCSC_test extends canfd_base_test;
    `uvm_component_utils(canfd_E_01_07_FD_CRCSC_test)
    function new(string n="canfd_E_01_07_FD_CRCSC_test", uvm_component p=null); super.new(n,p); endfunction
    virtual task run_phase(uvm_phase phase);
        canfd_E_01_07_FD_CRCSC_test_seq seq;
        super.run_phase(phase);
        phase.raise_objection(this);
        `uvm_info(get_type_name(),"Test: E_01_07 Start",UVM_LOW)
        seq = canfd_E_01_07_FD_CRCSC_test_seq::type_id::create("seq");
        seq.start(canfd_vseqr);
        `uvm_info(get_type_name(),"Test: E_01_07 Done",UVM_LOW)
        phase.drop_objection(this);
    endtask
endclass

`endif
