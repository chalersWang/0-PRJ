`ifndef _GMAC_REG_BACKDOOR_TEST_SV_
`define _GMAC_REG_BACKDOOR_TEST_SV_

// ============================================================================
// gmac_reg_backdoor_test: GMAC 后门读写示例
//   选取寄存器 gmac.MAC_Configuration 做后门 写 → 读回 → 比对 示例。
//   后门 hierarchical path 根默认 "tb_top.DUT.gmac_regs", 可用 +UVM_HDL_ROOT=<path> 覆盖;
//   RTL 就绪后须按实际 DUT 层级修改该占位路径。
// ============================================================================
class gmac_reg_backdoor_test extends mpsoc_base_test;

    `uvm_component_utils(gmac_reg_backdoor_test)

    function new(string name="gmac_reg_backdoor_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        uvm_status_e   status;
        uvm_reg_data_t wdata, rdata;
        string         hdl_root;

        super.run_phase(phase);
        phase.raise_objection(this);

        `ifdef REG_MODEL
            if (!$value$plusargs("UVM_HDL_ROOT=%s", hdl_root))
                hdl_root = "tb_top.DUT.gmac_regs";
            RegModel.gmac.set_hdl_path_root(hdl_root);

            wdata = 32'h0000_8000;
            RegModel.gmac.MAC_Configuration.write(status, wdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR write gmac.MAC_Configuration = 0x%0h (status=%s)",
                                wdata, status.name()), UVM_LOW)

            RegModel.gmac.MAC_Configuration.read(status, rdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR read  gmac.MAC_Configuration = 0x%0h (status=%s)",
                                rdata, status.name()), UVM_LOW)

            if (rdata === wdata)
                `uvm_info(get_type_name(), "PASS: gmac 后门读写一致", UVM_LOW)
            else
                `uvm_error(get_type_name(),
                           $sformatf("FAIL: 写入 0x%0h, 读回 0x%0h", wdata, rdata))
        `else
            `uvm_warning(get_type_name(), "REG_MODEL 未定义, 跳过 gmac 寄存器后门测试")
        `endif

        phase.drop_objection(this);
    endtask

endclass

`endif
