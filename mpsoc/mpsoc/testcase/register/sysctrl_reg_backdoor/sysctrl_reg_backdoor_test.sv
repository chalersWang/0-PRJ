`ifndef _SYSCTRL_REG_BACKDOOR_TEST_SV_
`define _SYSCTRL_REG_BACKDOOR_TEST_SV_

// ============================================================================
// sysctrl_reg_backdoor_test: SYS_CTRL 后门读写示例
//   选取寄存器 sysctrl.System_Config 做后门 写 → 读回 → 比对 示例。
//   后门 hierarchical path 根默认 "tb_top.DUT.sysctrl_regs", 可用 +UVM_HDL_ROOT=<path> 覆盖;
//   RTL 就绪后须按实际 DUT 层级修改该占位路径。
// ============================================================================
class sysctrl_reg_backdoor_test extends mpsoc_base_test;

    `uvm_component_utils(sysctrl_reg_backdoor_test)

    function new(string name="sysctrl_reg_backdoor_test", uvm_component parent=null);
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
                hdl_root = "tb_top.DUT.sysctrl_regs";
            RegModel.sysctrl.set_hdl_path_root(hdl_root);

            wdata = 32'h0000_0001;
            RegModel.sysctrl.System_Config.write(status, wdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR write sysctrl.System_Config = 0x%0h (status=%s)",
                                wdata, status.name()), UVM_LOW)

            RegModel.sysctrl.System_Config.read(status, rdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR read  sysctrl.System_Config = 0x%0h (status=%s)",
                                rdata, status.name()), UVM_LOW)

            if (rdata === wdata)
                `uvm_info(get_type_name(), "PASS: sysctrl 后门读写一致", UVM_LOW)
            else
                `uvm_error(get_type_name(),
                           $sformatf("FAIL: 写入 0x%0h, 读回 0x%0h", wdata, rdata))
        `else
            `uvm_warning(get_type_name(), "REG_MODEL 未定义, 跳过 sysctrl 寄存器后门测试")
        `endif

        phase.drop_objection(this);
    endtask

endclass

`endif
