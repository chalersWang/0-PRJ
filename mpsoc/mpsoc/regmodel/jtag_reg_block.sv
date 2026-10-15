`ifndef _JTAG_REG_BLOCK_SV_
`define _JTAG_REG_BLOCK_SV_

//=========================================================================
// jtag_reg_block: JTAG (IEEE 1149.1) —— 无内存映射寄存器数据, 占位
//   占位空 block: 当前设计文档/数据手册中无该模块的寄存器定义,
//   待寄存器表补齐后在此 build() 中 add_reg 即可。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class jtag_reg_block extends uvm_reg_block;

    `uvm_object_utils(jtag_reg_block)

    function new(string name="jtag_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);
        // TODO: 补齐寄存器定义后在此 add_reg
        lock_model();
    endfunction

endclass : jtag_reg_block

`endif // _JTAG_REG_BLOCK_SV_
