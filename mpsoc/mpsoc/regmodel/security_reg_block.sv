`ifndef _SECURITY_REG_BLOCK_SV_
`define _SECURITY_REG_BLOCK_SV_

//=========================================================================
// security_reg_block: Security/OTP (0x40012000) —— 无寄存器数据, 占位
//   占位空 block: 当前设计文档/数据手册中无该模块的寄存器定义,
//   待寄存器表补齐后在此 build() 中 add_reg 即可。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class security_reg_block extends uvm_reg_block;

    `uvm_object_utils(security_reg_block)

    function new(string name="security_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);
        // TODO: 补齐寄存器定义后在此 add_reg
        lock_model();
    endfunction

endclass : security_reg_block

`endif // _SECURITY_REG_BLOCK_SV_
