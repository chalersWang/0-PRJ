`ifndef _MPSOC_REG_BLOCK_SV_
`define _MPSOC_REG_BLOCK_SV_

//=========================================================================
// mpsoc_reg_block: 自动生成的 UVM Register Block (MyUvmGen_v2.0)
//   包含: 每个寄存器的 uvm_reg 派生类 + 顶层 mpsoc_reg_block
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

//-------------------------------------------------------------------------
// 寄存器: BASE_ADDR
//   addr=0x00, width=0, access=RW
//   Fields:
//     ATTRIBUTE[-1:0]  RW  reset=0'h0
//-------------------------------------------------------------------------
class BASE_ADDR_reg extends uvm_reg;

    rand uvm_reg_field ATTRIBUTE;

    `uvm_object_utils(BASE_ADDR_reg)

    function new(string name="BASE_ADDR_reg");
        super.new(name, 0, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        ATTRIBUTE = uvm_reg_field::type_id::create("ATTRIBUTE");
        ATTRIBUTE.configure(this, 0, 0, "RW", 0, 0'h0, 1, 1, 1);
    endfunction

endclass : BASE_ADDR_reg

//-------------------------------------------------------------------------
// 寄存器: Offset
//   addr=0x04, width=32, access=RW
//   Fields:
//     RO[31:0]  RW  reset=32'h0
//-------------------------------------------------------------------------
class Offset_reg extends uvm_reg;

    rand uvm_reg_field RO;

    `uvm_object_utils(Offset_reg)

    function new(string name="Offset_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        RO = uvm_reg_field::type_id::create("RO");
        RO.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    endfunction

endclass : Offset_reg

//-------------------------------------------------------------------------
// 寄存器: Generic Registers
//   addr=0x08, width=1, access=RW
//   Fields:
//     WO[0:0]  RW  reset=1'h0
//-------------------------------------------------------------------------
class Generic Registers_reg extends uvm_reg;

    rand uvm_reg_field WO;

    `uvm_object_utils(Generic Registers_reg)

    function new(string name="Generic Registers_reg");
        super.new(name, 1, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        WO = uvm_reg_field::type_id::create("WO");
        WO.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    endfunction

endclass : Generic Registers_reg

//-------------------------------------------------------------------------
// 寄存器: 0x0000
//   addr=0x0C, width=2, access=RW
//   Fields:
//     RW[1:0]  RW  reset=2'h0
//-------------------------------------------------------------------------
class 0x0000_reg extends uvm_reg;

    rand uvm_reg_field RW;

    `uvm_object_utils(0x0000_reg)

    function new(string name="0x0000_reg");
        super.new(name, 2, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        RW = uvm_reg_field::type_id::create("RW");
        RW.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 1);
    endfunction

endclass : 0x0000_reg

//-------------------------------------------------------------------------
// 寄存器: 0x0040
//   addr=0x10, width=3, access=RW
//   Fields:
//     WC[2:0]  RW  reset=3'h0
//-------------------------------------------------------------------------
class 0x0040_reg extends uvm_reg;

    rand uvm_reg_field WC;

    `uvm_object_utils(0x0040_reg)

    function new(string name="0x0040_reg");
        super.new(name, 3, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        WC = uvm_reg_field::type_id::create("WC");
        WC.configure(this, 3, 0, "RW", 0, 3'h0, 1, 1, 1);
    endfunction

endclass : 0x0040_reg

//-------------------------------------------------------------------------
// 寄存器: 0x0080
//   addr=0x14, width=32, access=RW
//   Fields:
//     RO[31:0]  RW  reset=32'h0
//-------------------------------------------------------------------------
class 0x0080_reg extends uvm_reg;

    rand uvm_reg_field RO;

    `uvm_object_utils(0x0080_reg)

    function new(string name="0x0080_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        RO = uvm_reg_field::type_id::create("RO");
        RO.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    endfunction

endclass : 0x0080_reg

//-------------------------------------------------------------------------
// 寄存器: Memory Info
//   addr=0x18, width=0, access=RW
//   Fields:
//     WO[-1:0]  RW  reset=0'h0
//-------------------------------------------------------------------------
class Memory Info_reg extends uvm_reg;

    rand uvm_reg_field WO;

    `uvm_object_utils(Memory Info_reg)

    function new(string name="Memory Info_reg");
        super.new(name, 0, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        WO = uvm_reg_field::type_id::create("WO");
        WO.configure(this, 0, 0, "RW", 0, 0'h0, 1, 1, 1);
    endfunction

endclass : Memory Info_reg

//-------------------------------------------------------------------------
// 寄存器: name
//   addr=0x1C, width=0, access=RW
//   Fields:
//     RW[-1:0]  RW  reset=0'h0
//-------------------------------------------------------------------------
class name_reg extends uvm_reg;

    rand uvm_reg_field RW;

    `uvm_object_utils(name_reg)

    function new(string name="name_reg");
        super.new(name, 0, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        RW = uvm_reg_field::type_id::create("RW");
        RW.configure(this, 0, 0, "RW", 0, 0'h0, 1, 1, 1);
    endfunction

endclass : name_reg

//-------------------------------------------------------------------------
// 寄存器: crg_mem
//   addr=0x20, width=32, access=RW
//   Fields:
//     WC[31:0]  RW  reset=32'h0
//-------------------------------------------------------------------------
class crg_mem_reg extends uvm_reg;

    rand uvm_reg_field WC;

    `uvm_object_utils(crg_mem_reg)

    function new(string name="crg_mem_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        WC = uvm_reg_field::type_id::create("WC");
        WC.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    endfunction

endclass : crg_mem_reg

//-------------------------------------------------------------------------
// 寄存器: dma_mem
//   addr=0x24, width=32, access=RW
//   Fields:
//     RW[31:0]  RW  reset=32'h0
//-------------------------------------------------------------------------
class dma_mem_reg extends uvm_reg;

    rand uvm_reg_field RW;

    `uvm_object_utils(dma_mem_reg)

    function new(string name="dma_mem_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        RW = uvm_reg_field::type_id::create("RW");
        RW.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    endfunction

endclass : dma_mem_reg

//=========================================================================
// mpsoc_reg_block: 顶层寄存器块
//   - default_map 管理所有寄存器的地址映射
//=========================================================================
class mpsoc_reg_block extends uvm_reg_block;

    rand BASE_ADDR_reg BASE_ADDR;
    rand Offset_reg Offset;
    rand Generic Registers_reg Generic Registers;
    rand 0x0000_reg 0x0000;
    rand 0x0040_reg 0x0040;
    rand 0x0080_reg 0x0080;
    rand Memory Info_reg Memory Info;
    rand name_reg name;
    rand crg_mem_reg crg_mem;
    rand dma_mem_reg dma_mem;

    `uvm_object_utils(mpsoc_reg_block)

    function new(string name="mpsoc_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 0);

        BASE_ADDR = BASE_ADDR_reg::type_id::create("BASE_ADDR");
        BASE_ADDR.configure(this, null, "");
        BASE_ADDR.build();
        default_map.add_reg(BASE_ADDR, 'h0, "RW");

        Offset = Offset_reg::type_id::create("Offset");
        Offset.configure(this, null, "");
        Offset.build();
        default_map.add_reg(Offset, 'h4, "RW");

        Generic Registers = Generic Registers_reg::type_id::create("Generic Registers");
        Generic Registers.configure(this, null, "");
        Generic Registers.build();
        default_map.add_reg(Generic Registers, 'h8, "RW");

        0x0000 = 0x0000_reg::type_id::create("0x0000");
        0x0000.configure(this, null, "");
        0x0000.build();
        default_map.add_reg(0x0000, 'hC, "RW");

        0x0040 = 0x0040_reg::type_id::create("0x0040");
        0x0040.configure(this, null, "");
        0x0040.build();
        default_map.add_reg(0x0040, 'h10, "RW");

        0x0080 = 0x0080_reg::type_id::create("0x0080");
        0x0080.configure(this, null, "");
        0x0080.build();
        default_map.add_reg(0x0080, 'h14, "RW");

        Memory Info = Memory Info_reg::type_id::create("Memory Info");
        Memory Info.configure(this, null, "");
        Memory Info.build();
        default_map.add_reg(Memory Info, 'h18, "RW");

        name = name_reg::type_id::create("name");
        name.configure(this, null, "");
        name.build();
        default_map.add_reg(name, 'h1C, "RW");

        crg_mem = crg_mem_reg::type_id::create("crg_mem");
        crg_mem.configure(this, null, "");
        crg_mem.build();
        default_map.add_reg(crg_mem, 'h20, "RW");

        dma_mem = dma_mem_reg::type_id::create("dma_mem");
        dma_mem.configure(this, null, "");
        dma_mem.build();
        default_map.add_reg(dma_mem, 'h24, "RW");

        lock_model();
    endfunction

endclass : mpsoc_reg_block

`endif // _MPSOC_REG_BLOCK_SV_

