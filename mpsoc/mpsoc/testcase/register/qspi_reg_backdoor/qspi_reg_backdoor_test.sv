`ifndef _QSPI_REG_BACKDOOR_TEST_SV_
`define _QSPI_REG_BACKDOOR_TEST_SV_

// ============================================================================
// qspi_reg_backdoor_test: QSPI 后门读写示例
//   选取寄存器 qspi.QSPI_Configuration 做后门 写 → 读回 → 比对 示例。
//   后门 hierarchical path 根默认 "tb_top.DUT.qspi_regs", 可用 +UVM_HDL_ROOT=<path> 覆盖;
//   RTL 就绪后须按实际 DUT 层级修改该占位路径。
// ============================================================================
class qspi_reg_backdoor_test extends mpsoc_base_test;

    `uvm_component_utils(qspi_reg_backdoor_test)

    function new(string name="qspi_reg_backdoor_test", uvm_component parent=null);
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
                hdl_root = "tb_top.DUT.qspi_regs";
            RegModel.qspi.set_hdl_path_root(hdl_root);

            wdata = 32'h0078_0081;
            RegModel.qspi.QSPI_Configuration.write(status, wdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR write qspi.QSPI_Configuration = 0x%0h (status=%s)",
                                wdata, status.name()), UVM_LOW)

            RegModel.qspi.QSPI_Configuration.read(status, rdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR read  qspi.QSPI_Configuration = 0x%0h (status=%s)",
                                rdata, status.name()), UVM_LOW)

            if (rdata === wdata)
                `uvm_info(get_type_name(), "PASS: qspi 后门读写一致", UVM_LOW)
            else
                `uvm_error(get_type_name(),
                           $sformatf("FAIL: 写入 0x%0h, 读回 0x%0h", wdata, rdata))
        `else
            `uvm_warning(get_type_name(), "REG_MODEL 未定义, 跳过 qspi 寄存器后门测试")
        `endif

        phase.drop_objection(this);
    endtask

endclass

`endif
