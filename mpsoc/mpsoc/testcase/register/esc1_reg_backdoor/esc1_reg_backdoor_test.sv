`ifndef _ESC1_REG_BACKDOOR_TEST_SV_
`define _ESC1_REG_BACKDOOR_TEST_SV_

// ============================================================================
// esc1_reg_backdoor_test: ESC1 寄存器后门读写示例 (demo)
//   - 从 RegModel.esc1 选取一个寄存器: Watchdog Divider (0x0400, 16-bit RW)
//   - 用 UVM_BACKDOOR 直接 写 → 读回 → 比对, 不经过总线/sequencer(前门)
//   - 后门 hierarchical path 根默认 "tb_top.DUT.esc1_regs",
//     可用 +UVM_HDL_ROOT=<path> 覆盖; RTL 就绪后须按实际 DUT 层级修改该占位路径
//     (各寄存器已在 esc_reg_block 中 add_hdl_path_slice("<寄存器名>", 0, <width>))
// ============================================================================
class esc1_reg_backdoor_test extends mpsoc_base_test;

    `uvm_component_utils(esc1_reg_backdoor_test)

    function new(string name="esc1_reg_backdoor_test", uvm_component parent=null);
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
                hdl_root = "tb_top.DUT.esc1_regs";
            RegModel.esc1.set_hdl_path_root(hdl_root);

            // 2) 选取一个寄存器做后门读写示例: esc1.Watchdog_Divider
            wdata = 16'h1234;
            RegModel.esc1.Watchdog_Divider.write(status, wdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR write esc1.Watchdog_Divider = 0x%0h (status=%s)",
                                wdata, status.name()), UVM_LOW)

            RegModel.esc1.Watchdog_Divider.read(status, rdata, UVM_BACKDOOR);
            `uvm_info(get_type_name(),
                      $sformatf("BACKDOOR read  esc1.Watchdog_Divider = 0x%0h (status=%s)",
                                rdata, status.name()), UVM_LOW)

            // 3) 比对
            if (rdata === wdata)
                `uvm_info(get_type_name(), "PASS: esc1 后门读写一致", UVM_LOW)
            else
                `uvm_error(get_type_name(),
                           $sformatf("FAIL: 写入 0x%0h, 读回 0x%0h", wdata, rdata))
        `else
            `uvm_warning(get_type_name(), "REG_MODEL 未定义, 跳过 ESC1 寄存器后门测试")
        `endif

        phase.drop_objection(this);
    endtask

endclass

`endif
