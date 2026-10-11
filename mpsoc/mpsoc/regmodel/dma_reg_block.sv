`ifndef _DMA_REG_BLOCK_SV_
`define _DMA_REG_BLOCK_SV_

//=========================================================================
// dma_reg_block: DMACx8 (DW_ahb_dmac v2.24a), 0x42000000
//   自动生成, 共 127 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class dma_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // SAR0  (0x0, 64-bit, RW) Channel 0 Source Address
    //---------------------------------------------------------------------
    class SAR0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SAR0_reg)

        function new(string name="SAR0_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : SAR0_reg

    //---------------------------------------------------------------------
    // DAR0  (0x8, 64-bit, RW) Channel 0 Destination Address
    //---------------------------------------------------------------------
    class DAR0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DAR0_reg)

        function new(string name="DAR0_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : DAR0_reg

    //---------------------------------------------------------------------
    // LLP0  (0x10, 64-bit, RW) Channel 0 Linked List Pointer
    //---------------------------------------------------------------------
    class LLP0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LLP0_reg)

        function new(string name="LLP0_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : LLP0_reg

    //---------------------------------------------------------------------
    // CTL0  (0x18, 64-bit, RW) Channel 0 Control Register
    //---------------------------------------------------------------------
    class CTL0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTL0_reg)

        function new(string name="CTL0_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : CTL0_reg

    //---------------------------------------------------------------------
    // SSTAT0  (0x20, 32-bit, RO) Channel 0 Source Status
    //---------------------------------------------------------------------
    class SSTAT0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTAT0_reg)

        function new(string name="SSTAT0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTAT0_reg

    //---------------------------------------------------------------------
    // DSTAT0  (0x28, 32-bit, RO) Channel 0 Destination Status
    //---------------------------------------------------------------------
    class DSTAT0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTAT0_reg)

        function new(string name="DSTAT0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTAT0_reg

    //---------------------------------------------------------------------
    // SSTATAR0  (0x30, 32-bit, RO) Channel 0 Source Status Address
    //---------------------------------------------------------------------
    class SSTATAR0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTATAR0_reg)

        function new(string name="SSTATAR0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTATAR0_reg

    //---------------------------------------------------------------------
    // DSTATAR0  (0x38, 32-bit, RO) Channel 0 Destination Status Address
    //---------------------------------------------------------------------
    class DSTATAR0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTATAR0_reg)

        function new(string name="DSTATAR0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTATAR0_reg

    //---------------------------------------------------------------------
    // CFG0  (0x40, 32-bit, RW) Channel 0 Configuration
    //---------------------------------------------------------------------
    class CFG0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CFG0_reg)

        function new(string name="CFG0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CFG0_reg

    //---------------------------------------------------------------------
    // SGR0  (0x48, 32-bit, RW) Channel 0 Source Gather
    //---------------------------------------------------------------------
    class SGR0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SGR0_reg)

        function new(string name="SGR0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SGR0_reg

    //---------------------------------------------------------------------
    // DSR0  (0x50, 32-bit, RW) Channel 0 Destination Scatter
    //---------------------------------------------------------------------
    class DSR0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSR0_reg)

        function new(string name="DSR0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSR0_reg

    //---------------------------------------------------------------------
    // SAR1  (0x58, 64-bit, RW) Channel 1 Source Address
    //---------------------------------------------------------------------
    class SAR1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SAR1_reg)

        function new(string name="SAR1_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : SAR1_reg

    //---------------------------------------------------------------------
    // DAR1  (0x60, 64-bit, RW) Channel 1 Destination Address
    //---------------------------------------------------------------------
    class DAR1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DAR1_reg)

        function new(string name="DAR1_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : DAR1_reg

    //---------------------------------------------------------------------
    // LLP1  (0x68, 64-bit, RW) Channel 1 Linked List Pointer
    //---------------------------------------------------------------------
    class LLP1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LLP1_reg)

        function new(string name="LLP1_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : LLP1_reg

    //---------------------------------------------------------------------
    // CTL1  (0x70, 64-bit, RW) Channel 1 Control Register
    //---------------------------------------------------------------------
    class CTL1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTL1_reg)

        function new(string name="CTL1_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : CTL1_reg

    //---------------------------------------------------------------------
    // SSTAT1  (0x78, 32-bit, RO) Channel 1 Source Status
    //---------------------------------------------------------------------
    class SSTAT1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTAT1_reg)

        function new(string name="SSTAT1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTAT1_reg

    //---------------------------------------------------------------------
    // DSTAT1  (0x80, 32-bit, RO) Channel 1 Destination Status
    //---------------------------------------------------------------------
    class DSTAT1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTAT1_reg)

        function new(string name="DSTAT1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTAT1_reg

    //---------------------------------------------------------------------
    // SSTATAR1  (0x88, 32-bit, RO) Channel 1 Source Status Address
    //---------------------------------------------------------------------
    class SSTATAR1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTATAR1_reg)

        function new(string name="SSTATAR1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTATAR1_reg

    //---------------------------------------------------------------------
    // DSTATAR1  (0x90, 32-bit, RO) Channel 1 Destination Status Address
    //---------------------------------------------------------------------
    class DSTATAR1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTATAR1_reg)

        function new(string name="DSTATAR1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTATAR1_reg

    //---------------------------------------------------------------------
    // CFG1  (0x98, 32-bit, RW) Channel 1 Configuration
    //---------------------------------------------------------------------
    class CFG1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CFG1_reg)

        function new(string name="CFG1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CFG1_reg

    //---------------------------------------------------------------------
    // SGR1  (0xA0, 32-bit, RW) Channel 1 Source Gather
    //---------------------------------------------------------------------
    class SGR1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SGR1_reg)

        function new(string name="SGR1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SGR1_reg

    //---------------------------------------------------------------------
    // DSR1  (0xA8, 32-bit, RW) Channel 1 Destination Scatter
    //---------------------------------------------------------------------
    class DSR1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSR1_reg)

        function new(string name="DSR1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSR1_reg

    //---------------------------------------------------------------------
    // SAR2  (0xB0, 64-bit, RW) Channel 2 Source Address
    //---------------------------------------------------------------------
    class SAR2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SAR2_reg)

        function new(string name="SAR2_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : SAR2_reg

    //---------------------------------------------------------------------
    // DAR2  (0xB8, 64-bit, RW) Channel 2 Destination Address
    //---------------------------------------------------------------------
    class DAR2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DAR2_reg)

        function new(string name="DAR2_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : DAR2_reg

    //---------------------------------------------------------------------
    // LLP2  (0xC0, 64-bit, RW) Channel 2 Linked List Pointer
    //---------------------------------------------------------------------
    class LLP2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LLP2_reg)

        function new(string name="LLP2_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : LLP2_reg

    //---------------------------------------------------------------------
    // CTL2  (0xC8, 64-bit, RW) Channel 2 Control Register
    //---------------------------------------------------------------------
    class CTL2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTL2_reg)

        function new(string name="CTL2_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : CTL2_reg

    //---------------------------------------------------------------------
    // SSTAT2  (0xD0, 32-bit, RO) Channel 2 Source Status
    //---------------------------------------------------------------------
    class SSTAT2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTAT2_reg)

        function new(string name="SSTAT2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTAT2_reg

    //---------------------------------------------------------------------
    // DSTAT2  (0xD8, 32-bit, RO) Channel 2 Destination Status
    //---------------------------------------------------------------------
    class DSTAT2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTAT2_reg)

        function new(string name="DSTAT2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTAT2_reg

    //---------------------------------------------------------------------
    // SSTATAR2  (0xE0, 32-bit, RO) Channel 2 Source Status Address
    //---------------------------------------------------------------------
    class SSTATAR2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTATAR2_reg)

        function new(string name="SSTATAR2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTATAR2_reg

    //---------------------------------------------------------------------
    // DSTATAR2  (0xE8, 32-bit, RO) Channel 2 Destination Status Address
    //---------------------------------------------------------------------
    class DSTATAR2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTATAR2_reg)

        function new(string name="DSTATAR2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTATAR2_reg

    //---------------------------------------------------------------------
    // CFG2  (0xF0, 32-bit, RW) Channel 2 Configuration
    //---------------------------------------------------------------------
    class CFG2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CFG2_reg)

        function new(string name="CFG2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CFG2_reg

    //---------------------------------------------------------------------
    // SGR2  (0xF8, 32-bit, RW) Channel 2 Source Gather
    //---------------------------------------------------------------------
    class SGR2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SGR2_reg)

        function new(string name="SGR2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SGR2_reg

    //---------------------------------------------------------------------
    // DSR2  (0x100, 32-bit, RW) Channel 2 Destination Scatter
    //---------------------------------------------------------------------
    class DSR2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSR2_reg)

        function new(string name="DSR2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSR2_reg

    //---------------------------------------------------------------------
    // SAR3  (0x108, 64-bit, RW) Channel 3 Source Address
    //---------------------------------------------------------------------
    class SAR3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SAR3_reg)

        function new(string name="SAR3_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : SAR3_reg

    //---------------------------------------------------------------------
    // DAR3  (0x110, 64-bit, RW) Channel 3 Destination Address
    //---------------------------------------------------------------------
    class DAR3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DAR3_reg)

        function new(string name="DAR3_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : DAR3_reg

    //---------------------------------------------------------------------
    // LLP3  (0x118, 64-bit, RW) Channel 3 Linked List Pointer
    //---------------------------------------------------------------------
    class LLP3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LLP3_reg)

        function new(string name="LLP3_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : LLP3_reg

    //---------------------------------------------------------------------
    // CTL3  (0x120, 64-bit, RW) Channel 3 Control Register
    //---------------------------------------------------------------------
    class CTL3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTL3_reg)

        function new(string name="CTL3_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : CTL3_reg

    //---------------------------------------------------------------------
    // SSTAT3  (0x128, 32-bit, RO) Channel 3 Source Status
    //---------------------------------------------------------------------
    class SSTAT3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTAT3_reg)

        function new(string name="SSTAT3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTAT3_reg

    //---------------------------------------------------------------------
    // DSTAT3  (0x130, 32-bit, RO) Channel 3 Destination Status
    //---------------------------------------------------------------------
    class DSTAT3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTAT3_reg)

        function new(string name="DSTAT3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTAT3_reg

    //---------------------------------------------------------------------
    // SSTATAR3  (0x138, 32-bit, RO) Channel 3 Source Status Address
    //---------------------------------------------------------------------
    class SSTATAR3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTATAR3_reg)

        function new(string name="SSTATAR3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTATAR3_reg

    //---------------------------------------------------------------------
    // DSTATAR3  (0x140, 32-bit, RO) Channel 3 Destination Status Address
    //---------------------------------------------------------------------
    class DSTATAR3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTATAR3_reg)

        function new(string name="DSTATAR3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTATAR3_reg

    //---------------------------------------------------------------------
    // CFG3  (0x148, 32-bit, RW) Channel 3 Configuration
    //---------------------------------------------------------------------
    class CFG3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CFG3_reg)

        function new(string name="CFG3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CFG3_reg

    //---------------------------------------------------------------------
    // SGR3  (0x150, 32-bit, RW) Channel 3 Source Gather
    //---------------------------------------------------------------------
    class SGR3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SGR3_reg)

        function new(string name="SGR3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SGR3_reg

    //---------------------------------------------------------------------
    // DSR3  (0x158, 32-bit, RW) Channel 3 Destination Scatter
    //---------------------------------------------------------------------
    class DSR3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSR3_reg)

        function new(string name="DSR3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSR3_reg

    //---------------------------------------------------------------------
    // SAR4  (0x160, 64-bit, RW) Channel 4 Source Address
    //---------------------------------------------------------------------
    class SAR4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SAR4_reg)

        function new(string name="SAR4_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : SAR4_reg

    //---------------------------------------------------------------------
    // DAR4  (0x168, 64-bit, RW) Channel 4 Destination Address
    //---------------------------------------------------------------------
    class DAR4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DAR4_reg)

        function new(string name="DAR4_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : DAR4_reg

    //---------------------------------------------------------------------
    // LLP4  (0x170, 64-bit, RW) Channel 4 Linked List Pointer
    //---------------------------------------------------------------------
    class LLP4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LLP4_reg)

        function new(string name="LLP4_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : LLP4_reg

    //---------------------------------------------------------------------
    // CTL4  (0x178, 64-bit, RW) Channel 4 Control Register
    //---------------------------------------------------------------------
    class CTL4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTL4_reg)

        function new(string name="CTL4_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : CTL4_reg

    //---------------------------------------------------------------------
    // SSTAT4  (0x180, 32-bit, RO) Channel 4 Source Status
    //---------------------------------------------------------------------
    class SSTAT4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTAT4_reg)

        function new(string name="SSTAT4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTAT4_reg

    //---------------------------------------------------------------------
    // DSTAT4  (0x188, 32-bit, RO) Channel 4 Destination Status
    //---------------------------------------------------------------------
    class DSTAT4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTAT4_reg)

        function new(string name="DSTAT4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTAT4_reg

    //---------------------------------------------------------------------
    // SSTATAR4  (0x190, 32-bit, RO) Channel 4 Source Status Address
    //---------------------------------------------------------------------
    class SSTATAR4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTATAR4_reg)

        function new(string name="SSTATAR4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTATAR4_reg

    //---------------------------------------------------------------------
    // DSTATAR4  (0x198, 32-bit, RO) Channel 4 Destination Status Address
    //---------------------------------------------------------------------
    class DSTATAR4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTATAR4_reg)

        function new(string name="DSTATAR4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTATAR4_reg

    //---------------------------------------------------------------------
    // CFG4  (0x1A0, 32-bit, RW) Channel 4 Configuration
    //---------------------------------------------------------------------
    class CFG4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CFG4_reg)

        function new(string name="CFG4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CFG4_reg

    //---------------------------------------------------------------------
    // SGR4  (0x1A8, 32-bit, RW) Channel 4 Source Gather
    //---------------------------------------------------------------------
    class SGR4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SGR4_reg)

        function new(string name="SGR4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SGR4_reg

    //---------------------------------------------------------------------
    // DSR4  (0x1B0, 32-bit, RW) Channel 4 Destination Scatter
    //---------------------------------------------------------------------
    class DSR4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSR4_reg)

        function new(string name="DSR4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSR4_reg

    //---------------------------------------------------------------------
    // SAR5  (0x1B8, 64-bit, RW) Channel 5 Source Address
    //---------------------------------------------------------------------
    class SAR5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SAR5_reg)

        function new(string name="SAR5_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : SAR5_reg

    //---------------------------------------------------------------------
    // DAR5  (0x1C0, 64-bit, RW) Channel 5 Destination Address
    //---------------------------------------------------------------------
    class DAR5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DAR5_reg)

        function new(string name="DAR5_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : DAR5_reg

    //---------------------------------------------------------------------
    // LLP5  (0x1C8, 64-bit, RW) Channel 5 Linked List Pointer
    //---------------------------------------------------------------------
    class LLP5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LLP5_reg)

        function new(string name="LLP5_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : LLP5_reg

    //---------------------------------------------------------------------
    // CTL5  (0x1D0, 64-bit, RW) Channel 5 Control Register
    //---------------------------------------------------------------------
    class CTL5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTL5_reg)

        function new(string name="CTL5_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : CTL5_reg

    //---------------------------------------------------------------------
    // SSTAT5  (0x1D8, 32-bit, RO) Channel 5 Source Status
    //---------------------------------------------------------------------
    class SSTAT5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTAT5_reg)

        function new(string name="SSTAT5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTAT5_reg

    //---------------------------------------------------------------------
    // DSTAT5  (0x1E0, 32-bit, RO) Channel 5 Destination Status
    //---------------------------------------------------------------------
    class DSTAT5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTAT5_reg)

        function new(string name="DSTAT5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTAT5_reg

    //---------------------------------------------------------------------
    // SSTATAR5  (0x1E8, 32-bit, RO) Channel 5 Source Status Address
    //---------------------------------------------------------------------
    class SSTATAR5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTATAR5_reg)

        function new(string name="SSTATAR5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTATAR5_reg

    //---------------------------------------------------------------------
    // DSTATAR5  (0x1F0, 32-bit, RO) Channel 5 Destination Status Address
    //---------------------------------------------------------------------
    class DSTATAR5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTATAR5_reg)

        function new(string name="DSTATAR5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTATAR5_reg

    //---------------------------------------------------------------------
    // CFG5  (0x1F8, 32-bit, RW) Channel 5 Configuration
    //---------------------------------------------------------------------
    class CFG5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CFG5_reg)

        function new(string name="CFG5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CFG5_reg

    //---------------------------------------------------------------------
    // SGR5  (0x200, 32-bit, RW) Channel 5 Source Gather
    //---------------------------------------------------------------------
    class SGR5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SGR5_reg)

        function new(string name="SGR5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SGR5_reg

    //---------------------------------------------------------------------
    // DSR5  (0x208, 32-bit, RW) Channel 5 Destination Scatter
    //---------------------------------------------------------------------
    class DSR5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSR5_reg)

        function new(string name="DSR5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSR5_reg

    //---------------------------------------------------------------------
    // SAR6  (0x210, 64-bit, RW) Channel 6 Source Address
    //---------------------------------------------------------------------
    class SAR6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SAR6_reg)

        function new(string name="SAR6_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : SAR6_reg

    //---------------------------------------------------------------------
    // DAR6  (0x218, 64-bit, RW) Channel 6 Destination Address
    //---------------------------------------------------------------------
    class DAR6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DAR6_reg)

        function new(string name="DAR6_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : DAR6_reg

    //---------------------------------------------------------------------
    // LLP6  (0x220, 64-bit, RW) Channel 6 Linked List Pointer
    //---------------------------------------------------------------------
    class LLP6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LLP6_reg)

        function new(string name="LLP6_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : LLP6_reg

    //---------------------------------------------------------------------
    // CTL6  (0x228, 64-bit, RW) Channel 6 Control Register
    //---------------------------------------------------------------------
    class CTL6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTL6_reg)

        function new(string name="CTL6_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : CTL6_reg

    //---------------------------------------------------------------------
    // SSTAT6  (0x230, 32-bit, RO) Channel 6 Source Status
    //---------------------------------------------------------------------
    class SSTAT6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTAT6_reg)

        function new(string name="SSTAT6_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTAT6_reg

    //---------------------------------------------------------------------
    // DSTAT6  (0x238, 32-bit, RO) Channel 6 Destination Status
    //---------------------------------------------------------------------
    class DSTAT6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTAT6_reg)

        function new(string name="DSTAT6_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTAT6_reg

    //---------------------------------------------------------------------
    // SSTATAR6  (0x240, 32-bit, RO) Channel 6 Source Status Address
    //---------------------------------------------------------------------
    class SSTATAR6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTATAR6_reg)

        function new(string name="SSTATAR6_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTATAR6_reg

    //---------------------------------------------------------------------
    // DSTATAR6  (0x248, 32-bit, RO) Channel 6 Destination Status Address
    //---------------------------------------------------------------------
    class DSTATAR6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTATAR6_reg)

        function new(string name="DSTATAR6_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTATAR6_reg

    //---------------------------------------------------------------------
    // CFG6  (0x250, 32-bit, RW) Channel 6 Configuration
    //---------------------------------------------------------------------
    class CFG6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CFG6_reg)

        function new(string name="CFG6_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CFG6_reg

    //---------------------------------------------------------------------
    // SGR6  (0x258, 32-bit, RW) Channel 6 Source Gather
    //---------------------------------------------------------------------
    class SGR6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SGR6_reg)

        function new(string name="SGR6_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SGR6_reg

    //---------------------------------------------------------------------
    // DSR6  (0x260, 32-bit, RW) Channel 6 Destination Scatter
    //---------------------------------------------------------------------
    class DSR6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSR6_reg)

        function new(string name="DSR6_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSR6_reg

    //---------------------------------------------------------------------
    // SAR7  (0x268, 64-bit, RW) Channel 7 Source Address
    //---------------------------------------------------------------------
    class SAR7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SAR7_reg)

        function new(string name="SAR7_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : SAR7_reg

    //---------------------------------------------------------------------
    // DAR7  (0x270, 64-bit, RW) Channel 7 Destination Address
    //---------------------------------------------------------------------
    class DAR7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DAR7_reg)

        function new(string name="DAR7_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : DAR7_reg

    //---------------------------------------------------------------------
    // LLP7  (0x278, 64-bit, RW) Channel 7 Linked List Pointer
    //---------------------------------------------------------------------
    class LLP7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LLP7_reg)

        function new(string name="LLP7_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : LLP7_reg

    //---------------------------------------------------------------------
    // CTL7  (0x280, 64-bit, RW) Channel 7 Control Register
    //---------------------------------------------------------------------
    class CTL7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTL7_reg)

        function new(string name="CTL7_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : CTL7_reg

    //---------------------------------------------------------------------
    // SSTAT7  (0x288, 32-bit, RO) Channel 7 Source Status
    //---------------------------------------------------------------------
    class SSTAT7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTAT7_reg)

        function new(string name="SSTAT7_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTAT7_reg

    //---------------------------------------------------------------------
    // DSTAT7  (0x290, 32-bit, RO) Channel 7 Destination Status
    //---------------------------------------------------------------------
    class DSTAT7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTAT7_reg)

        function new(string name="DSTAT7_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTAT7_reg

    //---------------------------------------------------------------------
    // SSTATAR7  (0x298, 32-bit, RO) Channel 7 Source Status Address
    //---------------------------------------------------------------------
    class SSTATAR7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSTATAR7_reg)

        function new(string name="SSTATAR7_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSTATAR7_reg

    //---------------------------------------------------------------------
    // DSTATAR7  (0x2A0, 32-bit, RO) Channel 7 Destination Status Address
    //---------------------------------------------------------------------
    class DSTATAR7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSTATAR7_reg)

        function new(string name="DSTATAR7_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSTATAR7_reg

    //---------------------------------------------------------------------
    // CFG7  (0x2A8, 32-bit, RW) Channel 7 Configuration
    //---------------------------------------------------------------------
    class CFG7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CFG7_reg)

        function new(string name="CFG7_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CFG7_reg

    //---------------------------------------------------------------------
    // SGR7  (0x2B0, 32-bit, RW) Channel 7 Source Gather
    //---------------------------------------------------------------------
    class SGR7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SGR7_reg)

        function new(string name="SGR7_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SGR7_reg

    //---------------------------------------------------------------------
    // DSR7  (0x2B8, 32-bit, RW) Channel 7 Destination Scatter
    //---------------------------------------------------------------------
    class DSR7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DSR7_reg)

        function new(string name="DSR7_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DSR7_reg

    //---------------------------------------------------------------------
    // RawTfr  (0x2C0, 32-bit, RW) Raw Status for IntTfr Interrupt
    //---------------------------------------------------------------------
    class RawTfr_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RawTfr_reg)

        function new(string name="RawTfr_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RawTfr_reg

    //---------------------------------------------------------------------
    // RawBlock  (0x2C8, 32-bit, RW) Raw Status for IntBlock Interrupt
    //---------------------------------------------------------------------
    class RawBlock_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RawBlock_reg)

        function new(string name="RawBlock_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RawBlock_reg

    //---------------------------------------------------------------------
    // RawSrcTran  (0x2D0, 32-bit, RW) Raw Status for IntSrcTran Interrupt
    //---------------------------------------------------------------------
    class RawSrcTran_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RawSrcTran_reg)

        function new(string name="RawSrcTran_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RawSrcTran_reg

    //---------------------------------------------------------------------
    // RawDstTran  (0x2D8, 32-bit, RW) Raw Status for IntDstTran Interrupt
    //---------------------------------------------------------------------
    class RawDstTran_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RawDstTran_reg)

        function new(string name="RawDstTran_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RawDstTran_reg

    //---------------------------------------------------------------------
    // RawErr  (0x2E0, 32-bit, RW) Raw Status for IntErr Interrupt
    //---------------------------------------------------------------------
    class RawErr_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RawErr_reg)

        function new(string name="RawErr_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RawErr_reg

    //---------------------------------------------------------------------
    // StatusTfr  (0x2E8, 32-bit, RO) Status for IntTfr Interrupt
    //---------------------------------------------------------------------
    class StatusTfr_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(StatusTfr_reg)

        function new(string name="StatusTfr_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : StatusTfr_reg

    //---------------------------------------------------------------------
    // StatusBlock  (0x2F0, 32-bit, RO) Status for IntBlock Interrupt
    //---------------------------------------------------------------------
    class StatusBlock_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(StatusBlock_reg)

        function new(string name="StatusBlock_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : StatusBlock_reg

    //---------------------------------------------------------------------
    // StatusSrcTran  (0x2F8, 32-bit, RO) Status for IntSrcTran Interrupt
    //---------------------------------------------------------------------
    class StatusSrcTran_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(StatusSrcTran_reg)

        function new(string name="StatusSrcTran_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : StatusSrcTran_reg

    //---------------------------------------------------------------------
    // StatusDstTran  (0x300, 32-bit, RO) Status for IntDstTran Interrupt
    //---------------------------------------------------------------------
    class StatusDstTran_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(StatusDstTran_reg)

        function new(string name="StatusDstTran_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : StatusDstTran_reg

    //---------------------------------------------------------------------
    // StatusErr  (0x308, 32-bit, RO) Status for IntErr Interrupt
    //---------------------------------------------------------------------
    class StatusErr_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(StatusErr_reg)

        function new(string name="StatusErr_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : StatusErr_reg

    //---------------------------------------------------------------------
    // MaskTfr  (0x310, 32-bit, RW) Mask for IntTfr Interrupt
    //---------------------------------------------------------------------
    class MaskTfr_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MaskTfr_reg)

        function new(string name="MaskTfr_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MaskTfr_reg

    //---------------------------------------------------------------------
    // MaskBlock  (0x318, 32-bit, RW) Mask for IntBlock Interrupt
    //---------------------------------------------------------------------
    class MaskBlock_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MaskBlock_reg)

        function new(string name="MaskBlock_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MaskBlock_reg

    //---------------------------------------------------------------------
    // MaskSrcTran  (0x320, 32-bit, RW) Mask for IntSrcTran Interrupt
    //---------------------------------------------------------------------
    class MaskSrcTran_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MaskSrcTran_reg)

        function new(string name="MaskSrcTran_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MaskSrcTran_reg

    //---------------------------------------------------------------------
    // MaskDstTran  (0x328, 32-bit, RW) Mask for IntDstTran Interrupt
    //---------------------------------------------------------------------
    class MaskDstTran_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MaskDstTran_reg)

        function new(string name="MaskDstTran_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MaskDstTran_reg

    //---------------------------------------------------------------------
    // MaskErr  (0x330, 32-bit, RW) Mask for IntErr Interrupt
    //---------------------------------------------------------------------
    class MaskErr_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MaskErr_reg)

        function new(string name="MaskErr_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MaskErr_reg

    //---------------------------------------------------------------------
    // ClearTfr  (0x338, 32-bit, RW) Clear for IntTfr Interrupt
    //---------------------------------------------------------------------
    class ClearTfr_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ClearTfr_reg)

        function new(string name="ClearTfr_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ClearTfr_reg

    //---------------------------------------------------------------------
    // ClearBlock  (0x340, 32-bit, RW) Clear for IntBlock Interrupt
    //---------------------------------------------------------------------
    class ClearBlock_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ClearBlock_reg)

        function new(string name="ClearBlock_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ClearBlock_reg

    //---------------------------------------------------------------------
    // ClearSrcTran  (0x348, 32-bit, RW) Clear for IntSrcTran Interrupt
    //---------------------------------------------------------------------
    class ClearSrcTran_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ClearSrcTran_reg)

        function new(string name="ClearSrcTran_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ClearSrcTran_reg

    //---------------------------------------------------------------------
    // ClearDstTran  (0x350, 32-bit, RW) Clear for IntDstTran Interrupt
    //---------------------------------------------------------------------
    class ClearDstTran_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ClearDstTran_reg)

        function new(string name="ClearDstTran_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ClearDstTran_reg

    //---------------------------------------------------------------------
    // ClearErr  (0x358, 32-bit, RW) Clear for IntErr Interrupt
    //---------------------------------------------------------------------
    class ClearErr_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ClearErr_reg)

        function new(string name="ClearErr_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ClearErr_reg

    //---------------------------------------------------------------------
    // StatusInt  (0x360, 32-bit, RO) Status for each Interrupt type
    //---------------------------------------------------------------------
    class StatusInt_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(StatusInt_reg)

        function new(string name="StatusInt_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : StatusInt_reg

    //---------------------------------------------------------------------
    // ReqSrcReg  (0x368, 32-bit, RW) Source Software Transaction Request
    //---------------------------------------------------------------------
    class ReqSrcReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ReqSrcReg_reg)

        function new(string name="ReqSrcReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ReqSrcReg_reg

    //---------------------------------------------------------------------
    // ReqDstReg  (0x370, 32-bit, RW) Destination Software Transaction Request
    //---------------------------------------------------------------------
    class ReqDstReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ReqDstReg_reg)

        function new(string name="ReqDstReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ReqDstReg_reg

    //---------------------------------------------------------------------
    // SglRqSrcReg  (0x378, 32-bit, RW) Source Single Transaction Request
    //---------------------------------------------------------------------
    class SglRqSrcReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SglRqSrcReg_reg)

        function new(string name="SglRqSrcReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SglRqSrcReg_reg

    //---------------------------------------------------------------------
    // SglRqDstReg  (0x380, 32-bit, RW) Destination Single Transaction Request
    //---------------------------------------------------------------------
    class SglRqDstReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SglRqDstReg_reg)

        function new(string name="SglRqDstReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SglRqDstReg_reg

    //---------------------------------------------------------------------
    // LstSrcReg  (0x388, 32-bit, RW) Source Last Transaction Request
    //---------------------------------------------------------------------
    class LstSrcReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LstSrcReg_reg)

        function new(string name="LstSrcReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : LstSrcReg_reg

    //---------------------------------------------------------------------
    // LstDstReg  (0x390, 32-bit, RW) Destination Last Transaction Request
    //---------------------------------------------------------------------
    class LstDstReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LstDstReg_reg)

        function new(string name="LstDstReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : LstDstReg_reg

    //---------------------------------------------------------------------
    // DmaCfgReg  (0x398, 64-bit, RW) DW_ahb_dmac Configuration Register
    //---------------------------------------------------------------------
    class DmaCfgReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DmaCfgReg_reg)

        function new(string name="DmaCfgReg_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : DmaCfgReg_reg

    //---------------------------------------------------------------------
    // ChEnReg  (0x3A0, 64-bit, RW) DW_ahb_dmac Channel Enable Register
    //---------------------------------------------------------------------
    class ChEnReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ChEnReg_reg)

        function new(string name="ChEnReg_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : ChEnReg_reg

    //---------------------------------------------------------------------
    // DmaIdReg  (0x3A8, 32-bit, RO) DW_ahb_dmac ID register
    //---------------------------------------------------------------------
    class DmaIdReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DmaIdReg_reg)

        function new(string name="DmaIdReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DmaIdReg_reg

    //---------------------------------------------------------------------
    // DmaTestReg  (0x3B0, 32-bit, RW) DMA Test register
    //---------------------------------------------------------------------
    class DmaTestReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DmaTestReg_reg)

        function new(string name="DmaTestReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DmaTestReg_reg

    //---------------------------------------------------------------------
    // DmaLpTimeoutReg  (0x3B8, 32-bit, RW) DMAC Low Power Timeout Register
    //---------------------------------------------------------------------
    class DmaLpTimeoutReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DmaLpTimeoutReg_reg)

        function new(string name="DmaLpTimeoutReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DmaLpTimeoutReg_reg

    //---------------------------------------------------------------------
    // DMA_COMP_PARAMS_6  (0x3C8, 32-bit, RO) Component Parameters Register 6
    //---------------------------------------------------------------------
    class DMA_COMP_PARAMS_6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMA_COMP_PARAMS_6_reg)

        function new(string name="DMA_COMP_PARAMS_6_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMA_COMP_PARAMS_6_reg

    //---------------------------------------------------------------------
    // DMA_COMP_PARAMS_5  (0x3D0, 32-bit, RO) Component Parameters Register 5
    //---------------------------------------------------------------------
    class DMA_COMP_PARAMS_5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMA_COMP_PARAMS_5_reg)

        function new(string name="DMA_COMP_PARAMS_5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMA_COMP_PARAMS_5_reg

    //---------------------------------------------------------------------
    // DMA_COMP_PARAMS_4  (0x3D8, 32-bit, RO) Component Parameters Register 4
    //---------------------------------------------------------------------
    class DMA_COMP_PARAMS_4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMA_COMP_PARAMS_4_reg)

        function new(string name="DMA_COMP_PARAMS_4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMA_COMP_PARAMS_4_reg

    //---------------------------------------------------------------------
    // DMA_COMP_PARAMS_3  (0x3E0, 32-bit, RO) Component Parameters Register 3
    //---------------------------------------------------------------------
    class DMA_COMP_PARAMS_3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMA_COMP_PARAMS_3_reg)

        function new(string name="DMA_COMP_PARAMS_3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMA_COMP_PARAMS_3_reg

    //---------------------------------------------------------------------
    // DMA_COMP_PARAMS_2  (0x3E8, 32-bit, RO) Component Parameters Register 2
    //---------------------------------------------------------------------
    class DMA_COMP_PARAMS_2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMA_COMP_PARAMS_2_reg)

        function new(string name="DMA_COMP_PARAMS_2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMA_COMP_PARAMS_2_reg

    //---------------------------------------------------------------------
    // DMA_COMP_PARAMS_1  (0x3F0, 32-bit, RO) Component Parameters Register 1
    //---------------------------------------------------------------------
    class DMA_COMP_PARAMS_1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMA_COMP_PARAMS_1_reg)

        function new(string name="DMA_COMP_PARAMS_1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMA_COMP_PARAMS_1_reg

    //---------------------------------------------------------------------
    // DmaCompsID  (0x3F8, 32-bit, RO) DMA Component ID register
    //---------------------------------------------------------------------
    class DmaCompsID_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DmaCompsID_reg)

        function new(string name="DmaCompsID_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DmaCompsID_reg

    rand SAR0_reg SAR0;
    rand DAR0_reg DAR0;
    rand LLP0_reg LLP0;
    rand CTL0_reg CTL0;
    rand SSTAT0_reg SSTAT0;
    rand DSTAT0_reg DSTAT0;
    rand SSTATAR0_reg SSTATAR0;
    rand DSTATAR0_reg DSTATAR0;
    rand CFG0_reg CFG0;
    rand SGR0_reg SGR0;
    rand DSR0_reg DSR0;
    rand SAR1_reg SAR1;
    rand DAR1_reg DAR1;
    rand LLP1_reg LLP1;
    rand CTL1_reg CTL1;
    rand SSTAT1_reg SSTAT1;
    rand DSTAT1_reg DSTAT1;
    rand SSTATAR1_reg SSTATAR1;
    rand DSTATAR1_reg DSTATAR1;
    rand CFG1_reg CFG1;
    rand SGR1_reg SGR1;
    rand DSR1_reg DSR1;
    rand SAR2_reg SAR2;
    rand DAR2_reg DAR2;
    rand LLP2_reg LLP2;
    rand CTL2_reg CTL2;
    rand SSTAT2_reg SSTAT2;
    rand DSTAT2_reg DSTAT2;
    rand SSTATAR2_reg SSTATAR2;
    rand DSTATAR2_reg DSTATAR2;
    rand CFG2_reg CFG2;
    rand SGR2_reg SGR2;
    rand DSR2_reg DSR2;
    rand SAR3_reg SAR3;
    rand DAR3_reg DAR3;
    rand LLP3_reg LLP3;
    rand CTL3_reg CTL3;
    rand SSTAT3_reg SSTAT3;
    rand DSTAT3_reg DSTAT3;
    rand SSTATAR3_reg SSTATAR3;
    rand DSTATAR3_reg DSTATAR3;
    rand CFG3_reg CFG3;
    rand SGR3_reg SGR3;
    rand DSR3_reg DSR3;
    rand SAR4_reg SAR4;
    rand DAR4_reg DAR4;
    rand LLP4_reg LLP4;
    rand CTL4_reg CTL4;
    rand SSTAT4_reg SSTAT4;
    rand DSTAT4_reg DSTAT4;
    rand SSTATAR4_reg SSTATAR4;
    rand DSTATAR4_reg DSTATAR4;
    rand CFG4_reg CFG4;
    rand SGR4_reg SGR4;
    rand DSR4_reg DSR4;
    rand SAR5_reg SAR5;
    rand DAR5_reg DAR5;
    rand LLP5_reg LLP5;
    rand CTL5_reg CTL5;
    rand SSTAT5_reg SSTAT5;
    rand DSTAT5_reg DSTAT5;
    rand SSTATAR5_reg SSTATAR5;
    rand DSTATAR5_reg DSTATAR5;
    rand CFG5_reg CFG5;
    rand SGR5_reg SGR5;
    rand DSR5_reg DSR5;
    rand SAR6_reg SAR6;
    rand DAR6_reg DAR6;
    rand LLP6_reg LLP6;
    rand CTL6_reg CTL6;
    rand SSTAT6_reg SSTAT6;
    rand DSTAT6_reg DSTAT6;
    rand SSTATAR6_reg SSTATAR6;
    rand DSTATAR6_reg DSTATAR6;
    rand CFG6_reg CFG6;
    rand SGR6_reg SGR6;
    rand DSR6_reg DSR6;
    rand SAR7_reg SAR7;
    rand DAR7_reg DAR7;
    rand LLP7_reg LLP7;
    rand CTL7_reg CTL7;
    rand SSTAT7_reg SSTAT7;
    rand DSTAT7_reg DSTAT7;
    rand SSTATAR7_reg SSTATAR7;
    rand DSTATAR7_reg DSTATAR7;
    rand CFG7_reg CFG7;
    rand SGR7_reg SGR7;
    rand DSR7_reg DSR7;
    rand RawTfr_reg RawTfr;
    rand RawBlock_reg RawBlock;
    rand RawSrcTran_reg RawSrcTran;
    rand RawDstTran_reg RawDstTran;
    rand RawErr_reg RawErr;
    rand StatusTfr_reg StatusTfr;
    rand StatusBlock_reg StatusBlock;
    rand StatusSrcTran_reg StatusSrcTran;
    rand StatusDstTran_reg StatusDstTran;
    rand StatusErr_reg StatusErr;
    rand MaskTfr_reg MaskTfr;
    rand MaskBlock_reg MaskBlock;
    rand MaskSrcTran_reg MaskSrcTran;
    rand MaskDstTran_reg MaskDstTran;
    rand MaskErr_reg MaskErr;
    rand ClearTfr_reg ClearTfr;
    rand ClearBlock_reg ClearBlock;
    rand ClearSrcTran_reg ClearSrcTran;
    rand ClearDstTran_reg ClearDstTran;
    rand ClearErr_reg ClearErr;
    rand StatusInt_reg StatusInt;
    rand ReqSrcReg_reg ReqSrcReg;
    rand ReqDstReg_reg ReqDstReg;
    rand SglRqSrcReg_reg SglRqSrcReg;
    rand SglRqDstReg_reg SglRqDstReg;
    rand LstSrcReg_reg LstSrcReg;
    rand LstDstReg_reg LstDstReg;
    rand DmaCfgReg_reg DmaCfgReg;
    rand ChEnReg_reg ChEnReg;
    rand DmaIdReg_reg DmaIdReg;
    rand DmaTestReg_reg DmaTestReg;
    rand DmaLpTimeoutReg_reg DmaLpTimeoutReg;
    rand DMA_COMP_PARAMS_6_reg DMA_COMP_PARAMS_6;
    rand DMA_COMP_PARAMS_5_reg DMA_COMP_PARAMS_5;
    rand DMA_COMP_PARAMS_4_reg DMA_COMP_PARAMS_4;
    rand DMA_COMP_PARAMS_3_reg DMA_COMP_PARAMS_3;
    rand DMA_COMP_PARAMS_2_reg DMA_COMP_PARAMS_2;
    rand DMA_COMP_PARAMS_1_reg DMA_COMP_PARAMS_1;
    rand DmaCompsID_reg DmaCompsID;

    `uvm_object_utils(dma_reg_block)

    function new(string name="dma_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        SAR0 = SAR0_reg::type_id::create("SAR0");
        SAR0.configure(this, null, "");
        SAR0.build();
        default_map.add_reg(SAR0, 'h0, "RW");
        SAR0.add_hdl_path_slice("SAR0", 0, 64, 0);

        DAR0 = DAR0_reg::type_id::create("DAR0");
        DAR0.configure(this, null, "");
        DAR0.build();
        default_map.add_reg(DAR0, 'h8, "RW");
        DAR0.add_hdl_path_slice("DAR0", 0, 64, 0);

        LLP0 = LLP0_reg::type_id::create("LLP0");
        LLP0.configure(this, null, "");
        LLP0.build();
        default_map.add_reg(LLP0, 'h10, "RW");
        LLP0.add_hdl_path_slice("LLP0", 0, 64, 0);

        CTL0 = CTL0_reg::type_id::create("CTL0");
        CTL0.configure(this, null, "");
        CTL0.build();
        default_map.add_reg(CTL0, 'h18, "RW");
        CTL0.add_hdl_path_slice("CTL0", 0, 64, 0);

        SSTAT0 = SSTAT0_reg::type_id::create("SSTAT0");
        SSTAT0.configure(this, null, "");
        SSTAT0.build();
        default_map.add_reg(SSTAT0, 'h20, "RO");
        SSTAT0.add_hdl_path_slice("SSTAT0", 0, 32, 0);

        DSTAT0 = DSTAT0_reg::type_id::create("DSTAT0");
        DSTAT0.configure(this, null, "");
        DSTAT0.build();
        default_map.add_reg(DSTAT0, 'h28, "RO");
        DSTAT0.add_hdl_path_slice("DSTAT0", 0, 32, 0);

        SSTATAR0 = SSTATAR0_reg::type_id::create("SSTATAR0");
        SSTATAR0.configure(this, null, "");
        SSTATAR0.build();
        default_map.add_reg(SSTATAR0, 'h30, "RO");
        SSTATAR0.add_hdl_path_slice("SSTATAR0", 0, 32, 0);

        DSTATAR0 = DSTATAR0_reg::type_id::create("DSTATAR0");
        DSTATAR0.configure(this, null, "");
        DSTATAR0.build();
        default_map.add_reg(DSTATAR0, 'h38, "RO");
        DSTATAR0.add_hdl_path_slice("DSTATAR0", 0, 32, 0);

        CFG0 = CFG0_reg::type_id::create("CFG0");
        CFG0.configure(this, null, "");
        CFG0.build();
        default_map.add_reg(CFG0, 'h40, "RW");
        CFG0.add_hdl_path_slice("CFG0", 0, 32, 0);

        SGR0 = SGR0_reg::type_id::create("SGR0");
        SGR0.configure(this, null, "");
        SGR0.build();
        default_map.add_reg(SGR0, 'h48, "RW");
        SGR0.add_hdl_path_slice("SGR0", 0, 32, 0);

        DSR0 = DSR0_reg::type_id::create("DSR0");
        DSR0.configure(this, null, "");
        DSR0.build();
        default_map.add_reg(DSR0, 'h50, "RW");
        DSR0.add_hdl_path_slice("DSR0", 0, 32, 0);

        SAR1 = SAR1_reg::type_id::create("SAR1");
        SAR1.configure(this, null, "");
        SAR1.build();
        default_map.add_reg(SAR1, 'h58, "RW");
        SAR1.add_hdl_path_slice("SAR1", 0, 64, 0);

        DAR1 = DAR1_reg::type_id::create("DAR1");
        DAR1.configure(this, null, "");
        DAR1.build();
        default_map.add_reg(DAR1, 'h60, "RW");
        DAR1.add_hdl_path_slice("DAR1", 0, 64, 0);

        LLP1 = LLP1_reg::type_id::create("LLP1");
        LLP1.configure(this, null, "");
        LLP1.build();
        default_map.add_reg(LLP1, 'h68, "RW");
        LLP1.add_hdl_path_slice("LLP1", 0, 64, 0);

        CTL1 = CTL1_reg::type_id::create("CTL1");
        CTL1.configure(this, null, "");
        CTL1.build();
        default_map.add_reg(CTL1, 'h70, "RW");
        CTL1.add_hdl_path_slice("CTL1", 0, 64, 0);

        SSTAT1 = SSTAT1_reg::type_id::create("SSTAT1");
        SSTAT1.configure(this, null, "");
        SSTAT1.build();
        default_map.add_reg(SSTAT1, 'h78, "RO");
        SSTAT1.add_hdl_path_slice("SSTAT1", 0, 32, 0);

        DSTAT1 = DSTAT1_reg::type_id::create("DSTAT1");
        DSTAT1.configure(this, null, "");
        DSTAT1.build();
        default_map.add_reg(DSTAT1, 'h80, "RO");
        DSTAT1.add_hdl_path_slice("DSTAT1", 0, 32, 0);

        SSTATAR1 = SSTATAR1_reg::type_id::create("SSTATAR1");
        SSTATAR1.configure(this, null, "");
        SSTATAR1.build();
        default_map.add_reg(SSTATAR1, 'h88, "RO");
        SSTATAR1.add_hdl_path_slice("SSTATAR1", 0, 32, 0);

        DSTATAR1 = DSTATAR1_reg::type_id::create("DSTATAR1");
        DSTATAR1.configure(this, null, "");
        DSTATAR1.build();
        default_map.add_reg(DSTATAR1, 'h90, "RO");
        DSTATAR1.add_hdl_path_slice("DSTATAR1", 0, 32, 0);

        CFG1 = CFG1_reg::type_id::create("CFG1");
        CFG1.configure(this, null, "");
        CFG1.build();
        default_map.add_reg(CFG1, 'h98, "RW");
        CFG1.add_hdl_path_slice("CFG1", 0, 32, 0);

        SGR1 = SGR1_reg::type_id::create("SGR1");
        SGR1.configure(this, null, "");
        SGR1.build();
        default_map.add_reg(SGR1, 'hA0, "RW");
        SGR1.add_hdl_path_slice("SGR1", 0, 32, 0);

        DSR1 = DSR1_reg::type_id::create("DSR1");
        DSR1.configure(this, null, "");
        DSR1.build();
        default_map.add_reg(DSR1, 'hA8, "RW");
        DSR1.add_hdl_path_slice("DSR1", 0, 32, 0);

        SAR2 = SAR2_reg::type_id::create("SAR2");
        SAR2.configure(this, null, "");
        SAR2.build();
        default_map.add_reg(SAR2, 'hB0, "RW");
        SAR2.add_hdl_path_slice("SAR2", 0, 64, 0);

        DAR2 = DAR2_reg::type_id::create("DAR2");
        DAR2.configure(this, null, "");
        DAR2.build();
        default_map.add_reg(DAR2, 'hB8, "RW");
        DAR2.add_hdl_path_slice("DAR2", 0, 64, 0);

        LLP2 = LLP2_reg::type_id::create("LLP2");
        LLP2.configure(this, null, "");
        LLP2.build();
        default_map.add_reg(LLP2, 'hC0, "RW");
        LLP2.add_hdl_path_slice("LLP2", 0, 64, 0);

        CTL2 = CTL2_reg::type_id::create("CTL2");
        CTL2.configure(this, null, "");
        CTL2.build();
        default_map.add_reg(CTL2, 'hC8, "RW");
        CTL2.add_hdl_path_slice("CTL2", 0, 64, 0);

        SSTAT2 = SSTAT2_reg::type_id::create("SSTAT2");
        SSTAT2.configure(this, null, "");
        SSTAT2.build();
        default_map.add_reg(SSTAT2, 'hD0, "RO");
        SSTAT2.add_hdl_path_slice("SSTAT2", 0, 32, 0);

        DSTAT2 = DSTAT2_reg::type_id::create("DSTAT2");
        DSTAT2.configure(this, null, "");
        DSTAT2.build();
        default_map.add_reg(DSTAT2, 'hD8, "RO");
        DSTAT2.add_hdl_path_slice("DSTAT2", 0, 32, 0);

        SSTATAR2 = SSTATAR2_reg::type_id::create("SSTATAR2");
        SSTATAR2.configure(this, null, "");
        SSTATAR2.build();
        default_map.add_reg(SSTATAR2, 'hE0, "RO");
        SSTATAR2.add_hdl_path_slice("SSTATAR2", 0, 32, 0);

        DSTATAR2 = DSTATAR2_reg::type_id::create("DSTATAR2");
        DSTATAR2.configure(this, null, "");
        DSTATAR2.build();
        default_map.add_reg(DSTATAR2, 'hE8, "RO");
        DSTATAR2.add_hdl_path_slice("DSTATAR2", 0, 32, 0);

        CFG2 = CFG2_reg::type_id::create("CFG2");
        CFG2.configure(this, null, "");
        CFG2.build();
        default_map.add_reg(CFG2, 'hF0, "RW");
        CFG2.add_hdl_path_slice("CFG2", 0, 32, 0);

        SGR2 = SGR2_reg::type_id::create("SGR2");
        SGR2.configure(this, null, "");
        SGR2.build();
        default_map.add_reg(SGR2, 'hF8, "RW");
        SGR2.add_hdl_path_slice("SGR2", 0, 32, 0);

        DSR2 = DSR2_reg::type_id::create("DSR2");
        DSR2.configure(this, null, "");
        DSR2.build();
        default_map.add_reg(DSR2, 'h100, "RW");
        DSR2.add_hdl_path_slice("DSR2", 0, 32, 0);

        SAR3 = SAR3_reg::type_id::create("SAR3");
        SAR3.configure(this, null, "");
        SAR3.build();
        default_map.add_reg(SAR3, 'h108, "RW");
        SAR3.add_hdl_path_slice("SAR3", 0, 64, 0);

        DAR3 = DAR3_reg::type_id::create("DAR3");
        DAR3.configure(this, null, "");
        DAR3.build();
        default_map.add_reg(DAR3, 'h110, "RW");
        DAR3.add_hdl_path_slice("DAR3", 0, 64, 0);

        LLP3 = LLP3_reg::type_id::create("LLP3");
        LLP3.configure(this, null, "");
        LLP3.build();
        default_map.add_reg(LLP3, 'h118, "RW");
        LLP3.add_hdl_path_slice("LLP3", 0, 64, 0);

        CTL3 = CTL3_reg::type_id::create("CTL3");
        CTL3.configure(this, null, "");
        CTL3.build();
        default_map.add_reg(CTL3, 'h120, "RW");
        CTL3.add_hdl_path_slice("CTL3", 0, 64, 0);

        SSTAT3 = SSTAT3_reg::type_id::create("SSTAT3");
        SSTAT3.configure(this, null, "");
        SSTAT3.build();
        default_map.add_reg(SSTAT3, 'h128, "RO");
        SSTAT3.add_hdl_path_slice("SSTAT3", 0, 32, 0);

        DSTAT3 = DSTAT3_reg::type_id::create("DSTAT3");
        DSTAT3.configure(this, null, "");
        DSTAT3.build();
        default_map.add_reg(DSTAT3, 'h130, "RO");
        DSTAT3.add_hdl_path_slice("DSTAT3", 0, 32, 0);

        SSTATAR3 = SSTATAR3_reg::type_id::create("SSTATAR3");
        SSTATAR3.configure(this, null, "");
        SSTATAR3.build();
        default_map.add_reg(SSTATAR3, 'h138, "RO");
        SSTATAR3.add_hdl_path_slice("SSTATAR3", 0, 32, 0);

        DSTATAR3 = DSTATAR3_reg::type_id::create("DSTATAR3");
        DSTATAR3.configure(this, null, "");
        DSTATAR3.build();
        default_map.add_reg(DSTATAR3, 'h140, "RO");
        DSTATAR3.add_hdl_path_slice("DSTATAR3", 0, 32, 0);

        CFG3 = CFG3_reg::type_id::create("CFG3");
        CFG3.configure(this, null, "");
        CFG3.build();
        default_map.add_reg(CFG3, 'h148, "RW");
        CFG3.add_hdl_path_slice("CFG3", 0, 32, 0);

        SGR3 = SGR3_reg::type_id::create("SGR3");
        SGR3.configure(this, null, "");
        SGR3.build();
        default_map.add_reg(SGR3, 'h150, "RW");
        SGR3.add_hdl_path_slice("SGR3", 0, 32, 0);

        DSR3 = DSR3_reg::type_id::create("DSR3");
        DSR3.configure(this, null, "");
        DSR3.build();
        default_map.add_reg(DSR3, 'h158, "RW");
        DSR3.add_hdl_path_slice("DSR3", 0, 32, 0);

        SAR4 = SAR4_reg::type_id::create("SAR4");
        SAR4.configure(this, null, "");
        SAR4.build();
        default_map.add_reg(SAR4, 'h160, "RW");
        SAR4.add_hdl_path_slice("SAR4", 0, 64, 0);

        DAR4 = DAR4_reg::type_id::create("DAR4");
        DAR4.configure(this, null, "");
        DAR4.build();
        default_map.add_reg(DAR4, 'h168, "RW");
        DAR4.add_hdl_path_slice("DAR4", 0, 64, 0);

        LLP4 = LLP4_reg::type_id::create("LLP4");
        LLP4.configure(this, null, "");
        LLP4.build();
        default_map.add_reg(LLP4, 'h170, "RW");
        LLP4.add_hdl_path_slice("LLP4", 0, 64, 0);

        CTL4 = CTL4_reg::type_id::create("CTL4");
        CTL4.configure(this, null, "");
        CTL4.build();
        default_map.add_reg(CTL4, 'h178, "RW");
        CTL4.add_hdl_path_slice("CTL4", 0, 64, 0);

        SSTAT4 = SSTAT4_reg::type_id::create("SSTAT4");
        SSTAT4.configure(this, null, "");
        SSTAT4.build();
        default_map.add_reg(SSTAT4, 'h180, "RO");
        SSTAT4.add_hdl_path_slice("SSTAT4", 0, 32, 0);

        DSTAT4 = DSTAT4_reg::type_id::create("DSTAT4");
        DSTAT4.configure(this, null, "");
        DSTAT4.build();
        default_map.add_reg(DSTAT4, 'h188, "RO");
        DSTAT4.add_hdl_path_slice("DSTAT4", 0, 32, 0);

        SSTATAR4 = SSTATAR4_reg::type_id::create("SSTATAR4");
        SSTATAR4.configure(this, null, "");
        SSTATAR4.build();
        default_map.add_reg(SSTATAR4, 'h190, "RO");
        SSTATAR4.add_hdl_path_slice("SSTATAR4", 0, 32, 0);

        DSTATAR4 = DSTATAR4_reg::type_id::create("DSTATAR4");
        DSTATAR4.configure(this, null, "");
        DSTATAR4.build();
        default_map.add_reg(DSTATAR4, 'h198, "RO");
        DSTATAR4.add_hdl_path_slice("DSTATAR4", 0, 32, 0);

        CFG4 = CFG4_reg::type_id::create("CFG4");
        CFG4.configure(this, null, "");
        CFG4.build();
        default_map.add_reg(CFG4, 'h1A0, "RW");
        CFG4.add_hdl_path_slice("CFG4", 0, 32, 0);

        SGR4 = SGR4_reg::type_id::create("SGR4");
        SGR4.configure(this, null, "");
        SGR4.build();
        default_map.add_reg(SGR4, 'h1A8, "RW");
        SGR4.add_hdl_path_slice("SGR4", 0, 32, 0);

        DSR4 = DSR4_reg::type_id::create("DSR4");
        DSR4.configure(this, null, "");
        DSR4.build();
        default_map.add_reg(DSR4, 'h1B0, "RW");
        DSR4.add_hdl_path_slice("DSR4", 0, 32, 0);

        SAR5 = SAR5_reg::type_id::create("SAR5");
        SAR5.configure(this, null, "");
        SAR5.build();
        default_map.add_reg(SAR5, 'h1B8, "RW");
        SAR5.add_hdl_path_slice("SAR5", 0, 64, 0);

        DAR5 = DAR5_reg::type_id::create("DAR5");
        DAR5.configure(this, null, "");
        DAR5.build();
        default_map.add_reg(DAR5, 'h1C0, "RW");
        DAR5.add_hdl_path_slice("DAR5", 0, 64, 0);

        LLP5 = LLP5_reg::type_id::create("LLP5");
        LLP5.configure(this, null, "");
        LLP5.build();
        default_map.add_reg(LLP5, 'h1C8, "RW");
        LLP5.add_hdl_path_slice("LLP5", 0, 64, 0);

        CTL5 = CTL5_reg::type_id::create("CTL5");
        CTL5.configure(this, null, "");
        CTL5.build();
        default_map.add_reg(CTL5, 'h1D0, "RW");
        CTL5.add_hdl_path_slice("CTL5", 0, 64, 0);

        SSTAT5 = SSTAT5_reg::type_id::create("SSTAT5");
        SSTAT5.configure(this, null, "");
        SSTAT5.build();
        default_map.add_reg(SSTAT5, 'h1D8, "RO");
        SSTAT5.add_hdl_path_slice("SSTAT5", 0, 32, 0);

        DSTAT5 = DSTAT5_reg::type_id::create("DSTAT5");
        DSTAT5.configure(this, null, "");
        DSTAT5.build();
        default_map.add_reg(DSTAT5, 'h1E0, "RO");
        DSTAT5.add_hdl_path_slice("DSTAT5", 0, 32, 0);

        SSTATAR5 = SSTATAR5_reg::type_id::create("SSTATAR5");
        SSTATAR5.configure(this, null, "");
        SSTATAR5.build();
        default_map.add_reg(SSTATAR5, 'h1E8, "RO");
        SSTATAR5.add_hdl_path_slice("SSTATAR5", 0, 32, 0);

        DSTATAR5 = DSTATAR5_reg::type_id::create("DSTATAR5");
        DSTATAR5.configure(this, null, "");
        DSTATAR5.build();
        default_map.add_reg(DSTATAR5, 'h1F0, "RO");
        DSTATAR5.add_hdl_path_slice("DSTATAR5", 0, 32, 0);

        CFG5 = CFG5_reg::type_id::create("CFG5");
        CFG5.configure(this, null, "");
        CFG5.build();
        default_map.add_reg(CFG5, 'h1F8, "RW");
        CFG5.add_hdl_path_slice("CFG5", 0, 32, 0);

        SGR5 = SGR5_reg::type_id::create("SGR5");
        SGR5.configure(this, null, "");
        SGR5.build();
        default_map.add_reg(SGR5, 'h200, "RW");
        SGR5.add_hdl_path_slice("SGR5", 0, 32, 0);

        DSR5 = DSR5_reg::type_id::create("DSR5");
        DSR5.configure(this, null, "");
        DSR5.build();
        default_map.add_reg(DSR5, 'h208, "RW");
        DSR5.add_hdl_path_slice("DSR5", 0, 32, 0);

        SAR6 = SAR6_reg::type_id::create("SAR6");
        SAR6.configure(this, null, "");
        SAR6.build();
        default_map.add_reg(SAR6, 'h210, "RW");
        SAR6.add_hdl_path_slice("SAR6", 0, 64, 0);

        DAR6 = DAR6_reg::type_id::create("DAR6");
        DAR6.configure(this, null, "");
        DAR6.build();
        default_map.add_reg(DAR6, 'h218, "RW");
        DAR6.add_hdl_path_slice("DAR6", 0, 64, 0);

        LLP6 = LLP6_reg::type_id::create("LLP6");
        LLP6.configure(this, null, "");
        LLP6.build();
        default_map.add_reg(LLP6, 'h220, "RW");
        LLP6.add_hdl_path_slice("LLP6", 0, 64, 0);

        CTL6 = CTL6_reg::type_id::create("CTL6");
        CTL6.configure(this, null, "");
        CTL6.build();
        default_map.add_reg(CTL6, 'h228, "RW");
        CTL6.add_hdl_path_slice("CTL6", 0, 64, 0);

        SSTAT6 = SSTAT6_reg::type_id::create("SSTAT6");
        SSTAT6.configure(this, null, "");
        SSTAT6.build();
        default_map.add_reg(SSTAT6, 'h230, "RO");
        SSTAT6.add_hdl_path_slice("SSTAT6", 0, 32, 0);

        DSTAT6 = DSTAT6_reg::type_id::create("DSTAT6");
        DSTAT6.configure(this, null, "");
        DSTAT6.build();
        default_map.add_reg(DSTAT6, 'h238, "RO");
        DSTAT6.add_hdl_path_slice("DSTAT6", 0, 32, 0);

        SSTATAR6 = SSTATAR6_reg::type_id::create("SSTATAR6");
        SSTATAR6.configure(this, null, "");
        SSTATAR6.build();
        default_map.add_reg(SSTATAR6, 'h240, "RO");
        SSTATAR6.add_hdl_path_slice("SSTATAR6", 0, 32, 0);

        DSTATAR6 = DSTATAR6_reg::type_id::create("DSTATAR6");
        DSTATAR6.configure(this, null, "");
        DSTATAR6.build();
        default_map.add_reg(DSTATAR6, 'h248, "RO");
        DSTATAR6.add_hdl_path_slice("DSTATAR6", 0, 32, 0);

        CFG6 = CFG6_reg::type_id::create("CFG6");
        CFG6.configure(this, null, "");
        CFG6.build();
        default_map.add_reg(CFG6, 'h250, "RW");
        CFG6.add_hdl_path_slice("CFG6", 0, 32, 0);

        SGR6 = SGR6_reg::type_id::create("SGR6");
        SGR6.configure(this, null, "");
        SGR6.build();
        default_map.add_reg(SGR6, 'h258, "RW");
        SGR6.add_hdl_path_slice("SGR6", 0, 32, 0);

        DSR6 = DSR6_reg::type_id::create("DSR6");
        DSR6.configure(this, null, "");
        DSR6.build();
        default_map.add_reg(DSR6, 'h260, "RW");
        DSR6.add_hdl_path_slice("DSR6", 0, 32, 0);

        SAR7 = SAR7_reg::type_id::create("SAR7");
        SAR7.configure(this, null, "");
        SAR7.build();
        default_map.add_reg(SAR7, 'h268, "RW");
        SAR7.add_hdl_path_slice("SAR7", 0, 64, 0);

        DAR7 = DAR7_reg::type_id::create("DAR7");
        DAR7.configure(this, null, "");
        DAR7.build();
        default_map.add_reg(DAR7, 'h270, "RW");
        DAR7.add_hdl_path_slice("DAR7", 0, 64, 0);

        LLP7 = LLP7_reg::type_id::create("LLP7");
        LLP7.configure(this, null, "");
        LLP7.build();
        default_map.add_reg(LLP7, 'h278, "RW");
        LLP7.add_hdl_path_slice("LLP7", 0, 64, 0);

        CTL7 = CTL7_reg::type_id::create("CTL7");
        CTL7.configure(this, null, "");
        CTL7.build();
        default_map.add_reg(CTL7, 'h280, "RW");
        CTL7.add_hdl_path_slice("CTL7", 0, 64, 0);

        SSTAT7 = SSTAT7_reg::type_id::create("SSTAT7");
        SSTAT7.configure(this, null, "");
        SSTAT7.build();
        default_map.add_reg(SSTAT7, 'h288, "RO");
        SSTAT7.add_hdl_path_slice("SSTAT7", 0, 32, 0);

        DSTAT7 = DSTAT7_reg::type_id::create("DSTAT7");
        DSTAT7.configure(this, null, "");
        DSTAT7.build();
        default_map.add_reg(DSTAT7, 'h290, "RO");
        DSTAT7.add_hdl_path_slice("DSTAT7", 0, 32, 0);

        SSTATAR7 = SSTATAR7_reg::type_id::create("SSTATAR7");
        SSTATAR7.configure(this, null, "");
        SSTATAR7.build();
        default_map.add_reg(SSTATAR7, 'h298, "RO");
        SSTATAR7.add_hdl_path_slice("SSTATAR7", 0, 32, 0);

        DSTATAR7 = DSTATAR7_reg::type_id::create("DSTATAR7");
        DSTATAR7.configure(this, null, "");
        DSTATAR7.build();
        default_map.add_reg(DSTATAR7, 'h2A0, "RO");
        DSTATAR7.add_hdl_path_slice("DSTATAR7", 0, 32, 0);

        CFG7 = CFG7_reg::type_id::create("CFG7");
        CFG7.configure(this, null, "");
        CFG7.build();
        default_map.add_reg(CFG7, 'h2A8, "RW");
        CFG7.add_hdl_path_slice("CFG7", 0, 32, 0);

        SGR7 = SGR7_reg::type_id::create("SGR7");
        SGR7.configure(this, null, "");
        SGR7.build();
        default_map.add_reg(SGR7, 'h2B0, "RW");
        SGR7.add_hdl_path_slice("SGR7", 0, 32, 0);

        DSR7 = DSR7_reg::type_id::create("DSR7");
        DSR7.configure(this, null, "");
        DSR7.build();
        default_map.add_reg(DSR7, 'h2B8, "RW");
        DSR7.add_hdl_path_slice("DSR7", 0, 32, 0);

        RawTfr = RawTfr_reg::type_id::create("RawTfr");
        RawTfr.configure(this, null, "");
        RawTfr.build();
        default_map.add_reg(RawTfr, 'h2C0, "RW");
        RawTfr.add_hdl_path_slice("RawTfr", 0, 32, 0);

        RawBlock = RawBlock_reg::type_id::create("RawBlock");
        RawBlock.configure(this, null, "");
        RawBlock.build();
        default_map.add_reg(RawBlock, 'h2C8, "RW");
        RawBlock.add_hdl_path_slice("RawBlock", 0, 32, 0);

        RawSrcTran = RawSrcTran_reg::type_id::create("RawSrcTran");
        RawSrcTran.configure(this, null, "");
        RawSrcTran.build();
        default_map.add_reg(RawSrcTran, 'h2D0, "RW");
        RawSrcTran.add_hdl_path_slice("RawSrcTran", 0, 32, 0);

        RawDstTran = RawDstTran_reg::type_id::create("RawDstTran");
        RawDstTran.configure(this, null, "");
        RawDstTran.build();
        default_map.add_reg(RawDstTran, 'h2D8, "RW");
        RawDstTran.add_hdl_path_slice("RawDstTran", 0, 32, 0);

        RawErr = RawErr_reg::type_id::create("RawErr");
        RawErr.configure(this, null, "");
        RawErr.build();
        default_map.add_reg(RawErr, 'h2E0, "RW");
        RawErr.add_hdl_path_slice("RawErr", 0, 32, 0);

        StatusTfr = StatusTfr_reg::type_id::create("StatusTfr");
        StatusTfr.configure(this, null, "");
        StatusTfr.build();
        default_map.add_reg(StatusTfr, 'h2E8, "RO");
        StatusTfr.add_hdl_path_slice("StatusTfr", 0, 32, 0);

        StatusBlock = StatusBlock_reg::type_id::create("StatusBlock");
        StatusBlock.configure(this, null, "");
        StatusBlock.build();
        default_map.add_reg(StatusBlock, 'h2F0, "RO");
        StatusBlock.add_hdl_path_slice("StatusBlock", 0, 32, 0);

        StatusSrcTran = StatusSrcTran_reg::type_id::create("StatusSrcTran");
        StatusSrcTran.configure(this, null, "");
        StatusSrcTran.build();
        default_map.add_reg(StatusSrcTran, 'h2F8, "RO");
        StatusSrcTran.add_hdl_path_slice("StatusSrcTran", 0, 32, 0);

        StatusDstTran = StatusDstTran_reg::type_id::create("StatusDstTran");
        StatusDstTran.configure(this, null, "");
        StatusDstTran.build();
        default_map.add_reg(StatusDstTran, 'h300, "RO");
        StatusDstTran.add_hdl_path_slice("StatusDstTran", 0, 32, 0);

        StatusErr = StatusErr_reg::type_id::create("StatusErr");
        StatusErr.configure(this, null, "");
        StatusErr.build();
        default_map.add_reg(StatusErr, 'h308, "RO");
        StatusErr.add_hdl_path_slice("StatusErr", 0, 32, 0);

        MaskTfr = MaskTfr_reg::type_id::create("MaskTfr");
        MaskTfr.configure(this, null, "");
        MaskTfr.build();
        default_map.add_reg(MaskTfr, 'h310, "RW");
        MaskTfr.add_hdl_path_slice("MaskTfr", 0, 32, 0);

        MaskBlock = MaskBlock_reg::type_id::create("MaskBlock");
        MaskBlock.configure(this, null, "");
        MaskBlock.build();
        default_map.add_reg(MaskBlock, 'h318, "RW");
        MaskBlock.add_hdl_path_slice("MaskBlock", 0, 32, 0);

        MaskSrcTran = MaskSrcTran_reg::type_id::create("MaskSrcTran");
        MaskSrcTran.configure(this, null, "");
        MaskSrcTran.build();
        default_map.add_reg(MaskSrcTran, 'h320, "RW");
        MaskSrcTran.add_hdl_path_slice("MaskSrcTran", 0, 32, 0);

        MaskDstTran = MaskDstTran_reg::type_id::create("MaskDstTran");
        MaskDstTran.configure(this, null, "");
        MaskDstTran.build();
        default_map.add_reg(MaskDstTran, 'h328, "RW");
        MaskDstTran.add_hdl_path_slice("MaskDstTran", 0, 32, 0);

        MaskErr = MaskErr_reg::type_id::create("MaskErr");
        MaskErr.configure(this, null, "");
        MaskErr.build();
        default_map.add_reg(MaskErr, 'h330, "RW");
        MaskErr.add_hdl_path_slice("MaskErr", 0, 32, 0);

        ClearTfr = ClearTfr_reg::type_id::create("ClearTfr");
        ClearTfr.configure(this, null, "");
        ClearTfr.build();
        default_map.add_reg(ClearTfr, 'h338, "RW");
        ClearTfr.add_hdl_path_slice("ClearTfr", 0, 32, 0);

        ClearBlock = ClearBlock_reg::type_id::create("ClearBlock");
        ClearBlock.configure(this, null, "");
        ClearBlock.build();
        default_map.add_reg(ClearBlock, 'h340, "RW");
        ClearBlock.add_hdl_path_slice("ClearBlock", 0, 32, 0);

        ClearSrcTran = ClearSrcTran_reg::type_id::create("ClearSrcTran");
        ClearSrcTran.configure(this, null, "");
        ClearSrcTran.build();
        default_map.add_reg(ClearSrcTran, 'h348, "RW");
        ClearSrcTran.add_hdl_path_slice("ClearSrcTran", 0, 32, 0);

        ClearDstTran = ClearDstTran_reg::type_id::create("ClearDstTran");
        ClearDstTran.configure(this, null, "");
        ClearDstTran.build();
        default_map.add_reg(ClearDstTran, 'h350, "RW");
        ClearDstTran.add_hdl_path_slice("ClearDstTran", 0, 32, 0);

        ClearErr = ClearErr_reg::type_id::create("ClearErr");
        ClearErr.configure(this, null, "");
        ClearErr.build();
        default_map.add_reg(ClearErr, 'h358, "RW");
        ClearErr.add_hdl_path_slice("ClearErr", 0, 32, 0);

        StatusInt = StatusInt_reg::type_id::create("StatusInt");
        StatusInt.configure(this, null, "");
        StatusInt.build();
        default_map.add_reg(StatusInt, 'h360, "RO");
        StatusInt.add_hdl_path_slice("StatusInt", 0, 32, 0);

        ReqSrcReg = ReqSrcReg_reg::type_id::create("ReqSrcReg");
        ReqSrcReg.configure(this, null, "");
        ReqSrcReg.build();
        default_map.add_reg(ReqSrcReg, 'h368, "RW");
        ReqSrcReg.add_hdl_path_slice("ReqSrcReg", 0, 32, 0);

        ReqDstReg = ReqDstReg_reg::type_id::create("ReqDstReg");
        ReqDstReg.configure(this, null, "");
        ReqDstReg.build();
        default_map.add_reg(ReqDstReg, 'h370, "RW");
        ReqDstReg.add_hdl_path_slice("ReqDstReg", 0, 32, 0);

        SglRqSrcReg = SglRqSrcReg_reg::type_id::create("SglRqSrcReg");
        SglRqSrcReg.configure(this, null, "");
        SglRqSrcReg.build();
        default_map.add_reg(SglRqSrcReg, 'h378, "RW");
        SglRqSrcReg.add_hdl_path_slice("SglRqSrcReg", 0, 32, 0);

        SglRqDstReg = SglRqDstReg_reg::type_id::create("SglRqDstReg");
        SglRqDstReg.configure(this, null, "");
        SglRqDstReg.build();
        default_map.add_reg(SglRqDstReg, 'h380, "RW");
        SglRqDstReg.add_hdl_path_slice("SglRqDstReg", 0, 32, 0);

        LstSrcReg = LstSrcReg_reg::type_id::create("LstSrcReg");
        LstSrcReg.configure(this, null, "");
        LstSrcReg.build();
        default_map.add_reg(LstSrcReg, 'h388, "RW");
        LstSrcReg.add_hdl_path_slice("LstSrcReg", 0, 32, 0);

        LstDstReg = LstDstReg_reg::type_id::create("LstDstReg");
        LstDstReg.configure(this, null, "");
        LstDstReg.build();
        default_map.add_reg(LstDstReg, 'h390, "RW");
        LstDstReg.add_hdl_path_slice("LstDstReg", 0, 32, 0);

        DmaCfgReg = DmaCfgReg_reg::type_id::create("DmaCfgReg");
        DmaCfgReg.configure(this, null, "");
        DmaCfgReg.build();
        default_map.add_reg(DmaCfgReg, 'h398, "RW");
        DmaCfgReg.add_hdl_path_slice("DmaCfgReg", 0, 64, 0);

        ChEnReg = ChEnReg_reg::type_id::create("ChEnReg");
        ChEnReg.configure(this, null, "");
        ChEnReg.build();
        default_map.add_reg(ChEnReg, 'h3A0, "RW");
        ChEnReg.add_hdl_path_slice("ChEnReg", 0, 64, 0);

        DmaIdReg = DmaIdReg_reg::type_id::create("DmaIdReg");
        DmaIdReg.configure(this, null, "");
        DmaIdReg.build();
        default_map.add_reg(DmaIdReg, 'h3A8, "RO");
        DmaIdReg.add_hdl_path_slice("DmaIdReg", 0, 32, 0);

        DmaTestReg = DmaTestReg_reg::type_id::create("DmaTestReg");
        DmaTestReg.configure(this, null, "");
        DmaTestReg.build();
        default_map.add_reg(DmaTestReg, 'h3B0, "RW");
        DmaTestReg.add_hdl_path_slice("DmaTestReg", 0, 32, 0);

        DmaLpTimeoutReg = DmaLpTimeoutReg_reg::type_id::create("DmaLpTimeoutReg");
        DmaLpTimeoutReg.configure(this, null, "");
        DmaLpTimeoutReg.build();
        default_map.add_reg(DmaLpTimeoutReg, 'h3B8, "RW");
        DmaLpTimeoutReg.add_hdl_path_slice("DmaLpTimeoutReg", 0, 32, 0);

        DMA_COMP_PARAMS_6 = DMA_COMP_PARAMS_6_reg::type_id::create("DMA_COMP_PARAMS_6");
        DMA_COMP_PARAMS_6.configure(this, null, "");
        DMA_COMP_PARAMS_6.build();
        default_map.add_reg(DMA_COMP_PARAMS_6, 'h3C8, "RO");
        DMA_COMP_PARAMS_6.add_hdl_path_slice("DMA_COMP_PARAMS_6", 0, 32, 0);

        DMA_COMP_PARAMS_5 = DMA_COMP_PARAMS_5_reg::type_id::create("DMA_COMP_PARAMS_5");
        DMA_COMP_PARAMS_5.configure(this, null, "");
        DMA_COMP_PARAMS_5.build();
        default_map.add_reg(DMA_COMP_PARAMS_5, 'h3D0, "RO");
        DMA_COMP_PARAMS_5.add_hdl_path_slice("DMA_COMP_PARAMS_5", 0, 32, 0);

        DMA_COMP_PARAMS_4 = DMA_COMP_PARAMS_4_reg::type_id::create("DMA_COMP_PARAMS_4");
        DMA_COMP_PARAMS_4.configure(this, null, "");
        DMA_COMP_PARAMS_4.build();
        default_map.add_reg(DMA_COMP_PARAMS_4, 'h3D8, "RO");
        DMA_COMP_PARAMS_4.add_hdl_path_slice("DMA_COMP_PARAMS_4", 0, 32, 0);

        DMA_COMP_PARAMS_3 = DMA_COMP_PARAMS_3_reg::type_id::create("DMA_COMP_PARAMS_3");
        DMA_COMP_PARAMS_3.configure(this, null, "");
        DMA_COMP_PARAMS_3.build();
        default_map.add_reg(DMA_COMP_PARAMS_3, 'h3E0, "RO");
        DMA_COMP_PARAMS_3.add_hdl_path_slice("DMA_COMP_PARAMS_3", 0, 32, 0);

        DMA_COMP_PARAMS_2 = DMA_COMP_PARAMS_2_reg::type_id::create("DMA_COMP_PARAMS_2");
        DMA_COMP_PARAMS_2.configure(this, null, "");
        DMA_COMP_PARAMS_2.build();
        default_map.add_reg(DMA_COMP_PARAMS_2, 'h3E8, "RO");
        DMA_COMP_PARAMS_2.add_hdl_path_slice("DMA_COMP_PARAMS_2", 0, 32, 0);

        DMA_COMP_PARAMS_1 = DMA_COMP_PARAMS_1_reg::type_id::create("DMA_COMP_PARAMS_1");
        DMA_COMP_PARAMS_1.configure(this, null, "");
        DMA_COMP_PARAMS_1.build();
        default_map.add_reg(DMA_COMP_PARAMS_1, 'h3F0, "RO");
        DMA_COMP_PARAMS_1.add_hdl_path_slice("DMA_COMP_PARAMS_1", 0, 32, 0);

        DmaCompsID = DmaCompsID_reg::type_id::create("DmaCompsID");
        DmaCompsID.configure(this, null, "");
        DmaCompsID.build();
        default_map.add_reg(DmaCompsID, 'h3F8, "RO");
        DmaCompsID.add_hdl_path_slice("DmaCompsID", 0, 32, 0);

        lock_model();
    endfunction

endclass : dma_reg_block

`endif // _DMA_REG_BLOCK_SV_
