`ifndef _ESC0_REG_BACKDOOR_TEST_SV_
`define _ESC0_REG_BACKDOOR_TEST_SV_

// ============================================================================
// esc0_reg_backdoor_test: ESC0 寄存器后门读写示例 (demo)
//   - 从 RegModel.esc0 选取一个寄存器: Configured Station Address (0x0010, 16-bit RW)
//   - 用 UVM_BACKDOOR 直接 写 → 读回 → 比对, 不经过总线/sequencer(前门)
//   - 后门 hierarchical path 根默认 "tb_top.DUT.esc0_regs",
//     可用 +UVM_HDL_ROOT=<path> 覆盖; RTL 就绪后须按实际 DUT 层级修改该占位路径
//     (各寄存器已在 esc_reg_block 中 add_hdl_path_slice("<寄存器名>", 0, <width>))
// ============================================================================
class esc0_reg_backdoor_test extends mpsoc_base_test;

    `uvm_component_utils(esc0_reg_backdoor_test)

    function new(string name="esc0_reg_backdoor_test", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        uvm_status_e   status;
        uvm_reg_data_t wdata, rdata;
        string         hdl_root;

        super.run_phase(phase);
        phase.raise_objection(this);

        `ifdef REG_MODEL
            // 1) 配置后门访问根路径(占位, 可用 +UVM_HDL_ROOT=... 覆盖)
            if (!$value$plusargs("UVM_HDL_ROOT=%s", hdl_root))
                hdl_root = "tb_top.DUT.esc0_regs";
            RegModel.esc0.set_hdl_path_root(hdl_root);

            // 2) 选取一个寄存器做后门读写示例: esc0.Configured_Station_Address
            wdata = 16'h5A5A;
            RegModel.esc0.Configured_Station_Address.write(status, wdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR write esc0.Configured_Station_Address = 0x%0h (status=%s)",
                                wdata, status.name()), UVM_LOW)

            RegModel.esc0.Configured_Station_Address.read(status, rdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR read  esc0.Configured_Station_Address = 0x%0h (status=%s)",
                                rdata, status.name()), UVM_LOW)

            // 3) 比对
            if (rdata === wdata)
                `uvm_info(get_type_name(), "PASS: esc0 后门读写一致", UVM_LOW)
            else
                `uvm_error(get_type_name(),
                           $sformatf("FAIL: 写入 0x%0h, 读回 0x%0h", wdata, rdata))
        `else
            `uvm_warning(get_type_name(), "REG_MODEL 未定义, 跳过 ESC0 寄存器后门测试")
        `endif

        phase.drop_objection(this);
    endtask

endclass

`endif
