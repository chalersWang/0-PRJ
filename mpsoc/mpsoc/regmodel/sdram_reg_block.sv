`ifndef _SDRAM_REG_BLOCK_SV_
`define _SDRAM_REG_BLOCK_SV_

//=========================================================================
// sdram_reg_block: SDRAM cfg (DW_memctl v2.79c), 0x54000000
//   自动生成, 共 32 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class sdram_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // SCONR  (0x0, 32-bit, RW) SDRAM configuration register
    //---------------------------------------------------------------------
    class SCONR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCONR_reg)

        function new(string name="SCONR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCONR_reg

    //---------------------------------------------------------------------
    // STMG0R  (0x4, 32-bit, RW) SDRAM timing register 0
    //---------------------------------------------------------------------
    class STMG0R_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(STMG0R_reg)

        function new(string name="STMG0R_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : STMG0R_reg

    //---------------------------------------------------------------------
    // STMG1R  (0x8, 32-bit, RW) SDRAM timing register 1
    //---------------------------------------------------------------------
    class STMG1R_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(STMG1R_reg)

        function new(string name="STMG1R_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : STMG1R_reg

    //---------------------------------------------------------------------
    // SCTLR  (0xC, 32-bit, RW) SDRAM control register
    //---------------------------------------------------------------------
    class SCTLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCTLR_reg)

        function new(string name="SCTLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCTLR_reg

    //---------------------------------------------------------------------
    // SREFR  (0x10, 32-bit, RW) SDRAM refresh register
    //---------------------------------------------------------------------
    class SREFR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SREFR_reg)

        function new(string name="SREFR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SREFR_reg

    //---------------------------------------------------------------------
    // SCSLR0_LOW  (0x14, 32-bit, RW) Chip select register 0 (lower 32 bits)
    //---------------------------------------------------------------------
    class SCSLR0_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCSLR0_LOW_reg)

        function new(string name="SCSLR0_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCSLR0_LOW_reg

    //---------------------------------------------------------------------
    // SCSLR1_LOW  (0x18, 32-bit, RW) Chip select register 1 (lower 32 bits)
    //---------------------------------------------------------------------
    class SCSLR1_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCSLR1_LOW_reg)

        function new(string name="SCSLR1_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCSLR1_LOW_reg

    //---------------------------------------------------------------------
    // SCSLR2_LOW  (0x1C, 32-bit, RW) Chip select register 2 (lower 32 bits)
    //---------------------------------------------------------------------
    class SCSLR2_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCSLR2_LOW_reg)

        function new(string name="SCSLR2_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCSLR2_LOW_reg

    //---------------------------------------------------------------------
    // SCSLR3_LOW  (0x20, 32-bit, RW) Chip select register 3 (lower 32 bits)
    //---------------------------------------------------------------------
    class SCSLR3_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCSLR3_LOW_reg)

        function new(string name="SCSLR3_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCSLR3_LOW_reg

    //---------------------------------------------------------------------
    // SCSLR4_LOW  (0x24, 32-bit, RW) Chip select register 4 (lower 32 bits)
    //---------------------------------------------------------------------
    class SCSLR4_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCSLR4_LOW_reg)

        function new(string name="SCSLR4_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCSLR4_LOW_reg

    //---------------------------------------------------------------------
    // SCSLR5_LOW  (0x28, 32-bit, RW) Chip select register 5 (lower 32 bits)
    //---------------------------------------------------------------------
    class SCSLR5_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCSLR5_LOW_reg)

        function new(string name="SCSLR5_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCSLR5_LOW_reg

    //---------------------------------------------------------------------
    // SCSLR6_LOW  (0x2C, 32-bit, RW) Chip select register 6 (lower 32 bits)
    //---------------------------------------------------------------------
    class SCSLR6_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCSLR6_LOW_reg)

        function new(string name="SCSLR6_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCSLR6_LOW_reg

    //---------------------------------------------------------------------
    // SCSLR7_LOW  (0x30, 32-bit, RW) Chip select register 7 (lower 32 bits)
    //---------------------------------------------------------------------
    class SCSLR7_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCSLR7_LOW_reg)

        function new(string name="SCSLR7_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCSLR7_LOW_reg

    //---------------------------------------------------------------------
    // SMSKR0  (0x54, 32-bit, RW) Mask register 0
    //---------------------------------------------------------------------
    class SMSKR0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMSKR0_reg)

        function new(string name="SMSKR0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMSKR0_reg

    //---------------------------------------------------------------------
    // SMSKR1  (0x58, 32-bit, RW) Mask register 1
    //---------------------------------------------------------------------
    class SMSKR1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMSKR1_reg)

        function new(string name="SMSKR1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMSKR1_reg

    //---------------------------------------------------------------------
    // SMSKR2  (0x5C, 32-bit, RW) Mask register 2
    //---------------------------------------------------------------------
    class SMSKR2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMSKR2_reg)

        function new(string name="SMSKR2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMSKR2_reg

    //---------------------------------------------------------------------
    // SMSKR3  (0x60, 32-bit, RW) Mask register 3
    //---------------------------------------------------------------------
    class SMSKR3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMSKR3_reg)

        function new(string name="SMSKR3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMSKR3_reg

    //---------------------------------------------------------------------
    // SMSKR4  (0x64, 32-bit, RW) Mask register 4
    //---------------------------------------------------------------------
    class SMSKR4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMSKR4_reg)

        function new(string name="SMSKR4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMSKR4_reg

    //---------------------------------------------------------------------
    // SMSKR5  (0x68, 32-bit, RW) Mask register 5
    //---------------------------------------------------------------------
    class SMSKR5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMSKR5_reg)

        function new(string name="SMSKR5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMSKR5_reg

    //---------------------------------------------------------------------
    // SMSKR6  (0x6C, 32-bit, RW) Mask register 6
    //---------------------------------------------------------------------
    class SMSKR6_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMSKR6_reg)

        function new(string name="SMSKR6_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMSKR6_reg

    //---------------------------------------------------------------------
    // SMSKR7  (0x70, 32-bit, RW) Mask register 7
    //---------------------------------------------------------------------
    class SMSKR7_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMSKR7_reg)

        function new(string name="SMSKR7_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMSKR7_reg

    //---------------------------------------------------------------------
    // CSALIAS0_LOW  (0x74, 32-bit, RW) Alias register for chip select 0 (lower)
    //---------------------------------------------------------------------
    class CSALIAS0_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CSALIAS0_LOW_reg)

        function new(string name="CSALIAS0_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CSALIAS0_LOW_reg

    //---------------------------------------------------------------------
    // CSALIAS1_LOW  (0x78, 32-bit, RW) Alias register for chip select 1 (lower)
    //---------------------------------------------------------------------
    class CSALIAS1_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CSALIAS1_LOW_reg)

        function new(string name="CSALIAS1_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CSALIAS1_LOW_reg

    //---------------------------------------------------------------------
    // CSREMAP0_LOW  (0x84, 32-bit, RW) Remap register for chip select 0 (lower)
    //---------------------------------------------------------------------
    class CSREMAP0_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CSREMAP0_LOW_reg)

        function new(string name="CSREMAP0_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CSREMAP0_LOW_reg

    //---------------------------------------------------------------------
    // CSREMAP1_LOW  (0x88, 32-bit, RW) Remap register for chip select 1 (lower)
    //---------------------------------------------------------------------
    class CSREMAP1_LOW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CSREMAP1_LOW_reg)

        function new(string name="CSREMAP1_LOW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CSREMAP1_LOW_reg

    //---------------------------------------------------------------------
    // SMTMGR_SET0  (0x94, 32-bit, RW) Static memory timing register Set0
    //---------------------------------------------------------------------
    class SMTMGR_SET0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMTMGR_SET0_reg)

        function new(string name="SMTMGR_SET0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMTMGR_SET0_reg

    //---------------------------------------------------------------------
    // SMTMGR_SET1  (0x98, 32-bit, RW) Static memory timing register Set1
    //---------------------------------------------------------------------
    class SMTMGR_SET1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMTMGR_SET1_reg)

        function new(string name="SMTMGR_SET1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMTMGR_SET1_reg

    //---------------------------------------------------------------------
    // SMTMGR_SET2  (0x9C, 32-bit, RW) Static memory timing register Set2
    //---------------------------------------------------------------------
    class SMTMGR_SET2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMTMGR_SET2_reg)

        function new(string name="SMTMGR_SET2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMTMGR_SET2_reg

    //---------------------------------------------------------------------
    // FLASH_TRPDR  (0xA0, 32-bit, RW) FLASH memory tRPD timing register
    //---------------------------------------------------------------------
    class FLASH_TRPDR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(FLASH_TRPDR_reg)

        function new(string name="FLASH_TRPDR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : FLASH_TRPDR_reg

    //---------------------------------------------------------------------
    // SMCTLR  (0xA4, 32-bit, RW) Static memory control register
    //---------------------------------------------------------------------
    class SMCTLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SMCTLR_reg)

        function new(string name="SMCTLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SMCTLR_reg

    //---------------------------------------------------------------------
    // EXN_MODE_REG  (0xAC, 32-bit, RW) DDR/Mobile-SDR extension mode register
    //---------------------------------------------------------------------
    class EXN_MODE_REG_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(EXN_MODE_REG_reg)

        function new(string name="EXN_MODE_REG_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : EXN_MODE_REG_reg

    //---------------------------------------------------------------------
    // COMP_TYPE  (0xFC, 32-bit, RO) Component Type Register
    //---------------------------------------------------------------------
    class COMP_TYPE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(COMP_TYPE_reg)

        function new(string name="COMP_TYPE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : COMP_TYPE_reg

    rand SCONR_reg SCONR;
    rand STMG0R_reg STMG0R;
    rand STMG1R_reg STMG1R;
    rand SCTLR_reg SCTLR;
    rand SREFR_reg SREFR;
    rand SCSLR0_LOW_reg SCSLR0_LOW;
    rand SCSLR1_LOW_reg SCSLR1_LOW;
    rand SCSLR2_LOW_reg SCSLR2_LOW;
    rand SCSLR3_LOW_reg SCSLR3_LOW;
    rand SCSLR4_LOW_reg SCSLR4_LOW;
    rand SCSLR5_LOW_reg SCSLR5_LOW;
    rand SCSLR6_LOW_reg SCSLR6_LOW;
    rand SCSLR7_LOW_reg SCSLR7_LOW;
    rand SMSKR0_reg SMSKR0;
    rand SMSKR1_reg SMSKR1;
    rand SMSKR2_reg SMSKR2;
    rand SMSKR3_reg SMSKR3;
    rand SMSKR4_reg SMSKR4;
    rand SMSKR5_reg SMSKR5;
    rand SMSKR6_reg SMSKR6;
    rand SMSKR7_reg SMSKR7;
    rand CSALIAS0_LOW_reg CSALIAS0_LOW;
    rand CSALIAS1_LOW_reg CSALIAS1_LOW;
    rand CSREMAP0_LOW_reg CSREMAP0_LOW;
    rand CSREMAP1_LOW_reg CSREMAP1_LOW;
    rand SMTMGR_SET0_reg SMTMGR_SET0;
    rand SMTMGR_SET1_reg SMTMGR_SET1;
    rand SMTMGR_SET2_reg SMTMGR_SET2;
    rand FLASH_TRPDR_reg FLASH_TRPDR;
    rand SMCTLR_reg SMCTLR;
    rand EXN_MODE_REG_reg EXN_MODE_REG;
    rand COMP_TYPE_reg COMP_TYPE;

    `uvm_object_utils(sdram_reg_block)

    function new(string name="sdram_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        SCONR = SCONR_reg::type_id::create("SCONR");
        SCONR.configure(this, null, "");
        SCONR.build();
        default_map.add_reg(SCONR, 'h0, "RW");
        SCONR.add_hdl_path_slice("SCONR", 0, 32, 0);

        STMG0R = STMG0R_reg::type_id::create("STMG0R");
        STMG0R.configure(this, null, "");
        STMG0R.build();
        default_map.add_reg(STMG0R, 'h4, "RW");
        STMG0R.add_hdl_path_slice("STMG0R", 0, 32, 0);

        STMG1R = STMG1R_reg::type_id::create("STMG1R");
        STMG1R.configure(this, null, "");
        STMG1R.build();
        default_map.add_reg(STMG1R, 'h8, "RW");
        STMG1R.add_hdl_path_slice("STMG1R", 0, 32, 0);

        SCTLR = SCTLR_reg::type_id::create("SCTLR");
        SCTLR.configure(this, null, "");
        SCTLR.build();
        default_map.add_reg(SCTLR, 'hC, "RW");
        SCTLR.add_hdl_path_slice("SCTLR", 0, 32, 0);

        SREFR = SREFR_reg::type_id::create("SREFR");
        SREFR.configure(this, null, "");
        SREFR.build();
        default_map.add_reg(SREFR, 'h10, "RW");
        SREFR.add_hdl_path_slice("SREFR", 0, 32, 0);

        SCSLR0_LOW = SCSLR0_LOW_reg::type_id::create("SCSLR0_LOW");
        SCSLR0_LOW.configure(this, null, "");
        SCSLR0_LOW.build();
        default_map.add_reg(SCSLR0_LOW, 'h14, "RW");
        SCSLR0_LOW.add_hdl_path_slice("SCSLR0_LOW", 0, 32, 0);

        SCSLR1_LOW = SCSLR1_LOW_reg::type_id::create("SCSLR1_LOW");
        SCSLR1_LOW.configure(this, null, "");
        SCSLR1_LOW.build();
        default_map.add_reg(SCSLR1_LOW, 'h18, "RW");
        SCSLR1_LOW.add_hdl_path_slice("SCSLR1_LOW", 0, 32, 0);

        SCSLR2_LOW = SCSLR2_LOW_reg::type_id::create("SCSLR2_LOW");
        SCSLR2_LOW.configure(this, null, "");
        SCSLR2_LOW.build();
        default_map.add_reg(SCSLR2_LOW, 'h1C, "RW");
        SCSLR2_LOW.add_hdl_path_slice("SCSLR2_LOW", 0, 32, 0);

        SCSLR3_LOW = SCSLR3_LOW_reg::type_id::create("SCSLR3_LOW");
        SCSLR3_LOW.configure(this, null, "");
        SCSLR3_LOW.build();
        default_map.add_reg(SCSLR3_LOW, 'h20, "RW");
        SCSLR3_LOW.add_hdl_path_slice("SCSLR3_LOW", 0, 32, 0);

        SCSLR4_LOW = SCSLR4_LOW_reg::type_id::create("SCSLR4_LOW");
        SCSLR4_LOW.configure(this, null, "");
        SCSLR4_LOW.build();
        default_map.add_reg(SCSLR4_LOW, 'h24, "RW");
        SCSLR4_LOW.add_hdl_path_slice("SCSLR4_LOW", 0, 32, 0);

        SCSLR5_LOW = SCSLR5_LOW_reg::type_id::create("SCSLR5_LOW");
        SCSLR5_LOW.configure(this, null, "");
        SCSLR5_LOW.build();
        default_map.add_reg(SCSLR5_LOW, 'h28, "RW");
        SCSLR5_LOW.add_hdl_path_slice("SCSLR5_LOW", 0, 32, 0);

        SCSLR6_LOW = SCSLR6_LOW_reg::type_id::create("SCSLR6_LOW");
        SCSLR6_LOW.configure(this, null, "");
        SCSLR6_LOW.build();
        default_map.add_reg(SCSLR6_LOW, 'h2C, "RW");
        SCSLR6_LOW.add_hdl_path_slice("SCSLR6_LOW", 0, 32, 0);

        SCSLR7_LOW = SCSLR7_LOW_reg::type_id::create("SCSLR7_LOW");
        SCSLR7_LOW.configure(this, null, "");
        SCSLR7_LOW.build();
        default_map.add_reg(SCSLR7_LOW, 'h30, "RW");
        SCSLR7_LOW.add_hdl_path_slice("SCSLR7_LOW", 0, 32, 0);

        SMSKR0 = SMSKR0_reg::type_id::create("SMSKR0");
        SMSKR0.configure(this, null, "");
        SMSKR0.build();
        default_map.add_reg(SMSKR0, 'h54, "RW");
        SMSKR0.add_hdl_path_slice("SMSKR0", 0, 32, 0);

        SMSKR1 = SMSKR1_reg::type_id::create("SMSKR1");
        SMSKR1.configure(this, null, "");
        SMSKR1.build();
        default_map.add_reg(SMSKR1, 'h58, "RW");
        SMSKR1.add_hdl_path_slice("SMSKR1", 0, 32, 0);

        SMSKR2 = SMSKR2_reg::type_id::create("SMSKR2");
        SMSKR2.configure(this, null, "");
        SMSKR2.build();
        default_map.add_reg(SMSKR2, 'h5C, "RW");
        SMSKR2.add_hdl_path_slice("SMSKR2", 0, 32, 0);

        SMSKR3 = SMSKR3_reg::type_id::create("SMSKR3");
        SMSKR3.configure(this, null, "");
        SMSKR3.build();
        default_map.add_reg(SMSKR3, 'h60, "RW");
        SMSKR3.add_hdl_path_slice("SMSKR3", 0, 32, 0);

        SMSKR4 = SMSKR4_reg::type_id::create("SMSKR4");
        SMSKR4.configure(this, null, "");
        SMSKR4.build();
        default_map.add_reg(SMSKR4, 'h64, "RW");
        SMSKR4.add_hdl_path_slice("SMSKR4", 0, 32, 0);

        SMSKR5 = SMSKR5_reg::type_id::create("SMSKR5");
        SMSKR5.configure(this, null, "");
        SMSKR5.build();
        default_map.add_reg(SMSKR5, 'h68, "RW");
        SMSKR5.add_hdl_path_slice("SMSKR5", 0, 32, 0);

        SMSKR6 = SMSKR6_reg::type_id::create("SMSKR6");
        SMSKR6.configure(this, null, "");
        SMSKR6.build();
        default_map.add_reg(SMSKR6, 'h6C, "RW");
        SMSKR6.add_hdl_path_slice("SMSKR6", 0, 32, 0);

        SMSKR7 = SMSKR7_reg::type_id::create("SMSKR7");
        SMSKR7.configure(this, null, "");
        SMSKR7.build();
        default_map.add_reg(SMSKR7, 'h70, "RW");
        SMSKR7.add_hdl_path_slice("SMSKR7", 0, 32, 0);

        CSALIAS0_LOW = CSALIAS0_LOW_reg::type_id::create("CSALIAS0_LOW");
        CSALIAS0_LOW.configure(this, null, "");
        CSALIAS0_LOW.build();
        default_map.add_reg(CSALIAS0_LOW, 'h74, "RW");
        CSALIAS0_LOW.add_hdl_path_slice("CSALIAS0_LOW", 0, 32, 0);

        CSALIAS1_LOW = CSALIAS1_LOW_reg::type_id::create("CSALIAS1_LOW");
        CSALIAS1_LOW.configure(this, null, "");
        CSALIAS1_LOW.build();
        default_map.add_reg(CSALIAS1_LOW, 'h78, "RW");
        CSALIAS1_LOW.add_hdl_path_slice("CSALIAS1_LOW", 0, 32, 0);

        CSREMAP0_LOW = CSREMAP0_LOW_reg::type_id::create("CSREMAP0_LOW");
        CSREMAP0_LOW.configure(this, null, "");
        CSREMAP0_LOW.build();
        default_map.add_reg(CSREMAP0_LOW, 'h84, "RW");
        CSREMAP0_LOW.add_hdl_path_slice("CSREMAP0_LOW", 0, 32, 0);

        CSREMAP1_LOW = CSREMAP1_LOW_reg::type_id::create("CSREMAP1_LOW");
        CSREMAP1_LOW.configure(this, null, "");
        CSREMAP1_LOW.build();
        default_map.add_reg(CSREMAP1_LOW, 'h88, "RW");
        CSREMAP1_LOW.add_hdl_path_slice("CSREMAP1_LOW", 0, 32, 0);

        SMTMGR_SET0 = SMTMGR_SET0_reg::type_id::create("SMTMGR_SET0");
        SMTMGR_SET0.configure(this, null, "");
        SMTMGR_SET0.build();
        default_map.add_reg(SMTMGR_SET0, 'h94, "RW");
        SMTMGR_SET0.add_hdl_path_slice("SMTMGR_SET0", 0, 32, 0);

        SMTMGR_SET1 = SMTMGR_SET1_reg::type_id::create("SMTMGR_SET1");
        SMTMGR_SET1.configure(this, null, "");
        SMTMGR_SET1.build();
        default_map.add_reg(SMTMGR_SET1, 'h98, "RW");
        SMTMGR_SET1.add_hdl_path_slice("SMTMGR_SET1", 0, 32, 0);

        SMTMGR_SET2 = SMTMGR_SET2_reg::type_id::create("SMTMGR_SET2");
        SMTMGR_SET2.configure(this, null, "");
        SMTMGR_SET2.build();
        default_map.add_reg(SMTMGR_SET2, 'h9C, "RW");
        SMTMGR_SET2.add_hdl_path_slice("SMTMGR_SET2", 0, 32, 0);

        FLASH_TRPDR = FLASH_TRPDR_reg::type_id::create("FLASH_TRPDR");
        FLASH_TRPDR.configure(this, null, "");
        FLASH_TRPDR.build();
        default_map.add_reg(FLASH_TRPDR, 'hA0, "RW");
        FLASH_TRPDR.add_hdl_path_slice("FLASH_TRPDR", 0, 32, 0);

        SMCTLR = SMCTLR_reg::type_id::create("SMCTLR");
        SMCTLR.configure(this, null, "");
        SMCTLR.build();
        default_map.add_reg(SMCTLR, 'hA4, "RW");
        SMCTLR.add_hdl_path_slice("SMCTLR", 0, 32, 0);

        EXN_MODE_REG = EXN_MODE_REG_reg::type_id::create("EXN_MODE_REG");
        EXN_MODE_REG.configure(this, null, "");
        EXN_MODE_REG.build();
        default_map.add_reg(EXN_MODE_REG, 'hAC, "RW");
        EXN_MODE_REG.add_hdl_path_slice("EXN_MODE_REG", 0, 32, 0);

        COMP_TYPE = COMP_TYPE_reg::type_id::create("COMP_TYPE");
        COMP_TYPE.configure(this, null, "");
        COMP_TYPE.build();
        default_map.add_reg(COMP_TYPE, 'hFC, "RO");
        COMP_TYPE.add_hdl_path_slice("COMP_TYPE", 0, 32, 0);

        lock_model();
    endfunction

endclass : sdram_reg_block

`endif // _SDRAM_REG_BLOCK_SV_
