`ifndef _WDT_REG_BACKDOOR_TEST_SV_
`define _WDT_REG_BACKDOOR_TEST_SV_

// ============================================================================
// wdt_reg_backdoor_test: WDT 后门读写示例
//   选取寄存器 wdt.WDT_CR 做后门 写 → 读回 → 比对 示例。
//   后门 hierarchical path 根默认 "tb_top.DUT.wdt_regs", 可用 +UVM_HDL_ROOT=<path> 覆盖;
//   RTL 就绪后须按实际 DUT 层级修改该占位路径。
// ============================================================================
class wdt_reg_backdoor_test extends mpsoc_base_test;

    `uvm_component_utils(wdt_reg_backdoor_test)

    function new(string name="wdt_reg_backdoor_test", uvm_component parent=null);
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
                hdl_root = "tb_top.DUT.wdt_regs";
            RegModel.wdt.set_hdl_path_root(hdl_root);

            wdata = 32'h0000_0001;
            RegModel.wdt.WDT_CR.write(status, wdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR write wdt.WDT_CR = 0x%0h (status=%s)",
                                wdata, status.name()), UVM_LOW)

            RegModel.wdt.WDT_CR.read(status, rdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR read  wdt.WDT_CR = 0x%0h (status=%s)",
                                rdata, status.name()), UVM_LOW)

            if (rdata === wdata)
                `uvm_info(get_type_name(), "PASS: wdt 后门读写一致", UVM_LOW)
            else
                `uvm_error(get_type_name(),
                           $sformatf("FAIL: 写入 0x%0h, 读回 0x%0h", wdata, rdata))
        `else
            `uvm_warning(get_type_name(), "REG_MODEL 未定义, 跳过 wdt 寄存器后门测试")
        `endif

        phase.drop_objection(this);
    endtask

endclass

`endif
