`ifndef _SPI_REG_BACKDOOR_TEST_SV_
`define _SPI_REG_BACKDOOR_TEST_SV_

// ============================================================================
// spi_reg_backdoor_test: SPI Master 后门读写示例
//   选取寄存器 spi.CTRLR0 做后门 写 → 读回 → 比对 示例。
//   后门 hierarchical path 根默认 "tb_top.DUT.spi_regs", 可用 +UVM_HDL_ROOT=<path> 覆盖;
//   RTL 就绪后须按实际 DUT 层级修改该占位路径。
// ============================================================================
class spi_reg_backdoor_test extends mpsoc_base_test;

    `uvm_component_utils(spi_reg_backdoor_test)

    function new(string name="spi_reg_backdoor_test", uvm_component parent=null);
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
                hdl_root = "tb_top.DUT.spi_regs";
            RegModel.spi.set_hdl_path_root(hdl_root);

            wdata = 32'h0000_0F03;
            RegModel.spi.CTRLR0.write(status, wdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR write spi.CTRLR0 = 0x%0h (status=%s)",
                                wdata, status.name()), UVM_LOW)

            RegModel.spi.CTRLR0.read(status, rdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR read  spi.CTRLR0 = 0x%0h (status=%s)",
                                rdata, status.name()), UVM_LOW)

            if (rdata === wdata)
                `uvm_info(get_type_name(), "PASS: spi 后门读写一致", UVM_LOW)
            else
                `uvm_error(get_type_name(),
                           $sformatf("FAIL: 写入 0x%0h, 读回 0x%0h", wdata, rdata))
        `else
            `uvm_warning(get_type_name(), "REG_MODEL 未定义, 跳过 spi 寄存器后门测试")
        `endif

        phase.drop_objection(this);
    endtask

endclass

`endif
