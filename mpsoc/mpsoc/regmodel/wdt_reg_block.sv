`ifndef _WDT_REG_BLOCK_SV_
`define _WDT_REG_BLOCK_SV_

//=========================================================================
// wdt_reg_block: WDT (DW_apb_wdt v1.13a), 0x4001A000
//   自动生成, 共 16 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class wdt_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // WDT_CR  (0x0, 32-bit, RW) Control Register
    //---------------------------------------------------------------------
    class WDT_CR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_CR_reg)

        function new(string name="WDT_CR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_CR_reg

    //---------------------------------------------------------------------
    // WDT_TORR  (0x4, 32-bit, RW) Timeout Range Register
    //---------------------------------------------------------------------
    class WDT_TORR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_TORR_reg)

        function new(string name="WDT_TORR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_TORR_reg

    //---------------------------------------------------------------------
    // WDT_CCVR  (0x8, 32-bit, RO) Current Counter Value Register
    //---------------------------------------------------------------------
    class WDT_CCVR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_CCVR_reg)

        function new(string name="WDT_CCVR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_CCVR_reg

    //---------------------------------------------------------------------
    // WDT_CRR  (0xC, 32-bit, RW) Counter Restart Register
    //---------------------------------------------------------------------
    class WDT_CRR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_CRR_reg)

        function new(string name="WDT_CRR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_CRR_reg

    //---------------------------------------------------------------------
    // WDT_STAT  (0x10, 32-bit, RO) Interrupt Status Register
    //---------------------------------------------------------------------
    class WDT_STAT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_STAT_reg)

        function new(string name="WDT_STAT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_STAT_reg

    //---------------------------------------------------------------------
    // WDT_EOI  (0x14, 32-bit, RW) Interrupt Clear Register
    //---------------------------------------------------------------------
    class WDT_EOI_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_EOI_reg)

        function new(string name="WDT_EOI_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_EOI_reg

    //---------------------------------------------------------------------
    // WDT_PROT_LEVEL  (0x1C, 32-bit, RW) WDT Protection level
    //---------------------------------------------------------------------
    class WDT_PROT_LEVEL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_PROT_LEVEL_reg)

        function new(string name="WDT_PROT_LEVEL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_PROT_LEVEL_reg

    //---------------------------------------------------------------------
    // WDT_SFTY_INTR_STAT  (0x20, 32-bit, RO) Safety Interrupt Status Register
    //---------------------------------------------------------------------
    class WDT_SFTY_INTR_STAT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_SFTY_INTR_STAT_reg)

        function new(string name="WDT_SFTY_INTR_STAT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_SFTY_INTR_STAT_reg

    //---------------------------------------------------------------------
    // WDT_SFTY_INTR_CLR  (0x24, 32-bit, RW) Safety Interrupt Clear Register
    //---------------------------------------------------------------------
    class WDT_SFTY_INTR_CLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_SFTY_INTR_CLR_reg)

        function new(string name="WDT_SFTY_INTR_CLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_SFTY_INTR_CLR_reg

    //---------------------------------------------------------------------
    // WDT_COMP_PARAM_5  (0xE4, 32-bit, RO) Component Parameters Register 5
    //---------------------------------------------------------------------
    class WDT_COMP_PARAM_5_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_COMP_PARAM_5_reg)

        function new(string name="WDT_COMP_PARAM_5_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_COMP_PARAM_5_reg

    //---------------------------------------------------------------------
    // WDT_COMP_PARAM_4  (0xE8, 32-bit, RO) Component Parameters Register 4
    //---------------------------------------------------------------------
    class WDT_COMP_PARAM_4_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_COMP_PARAM_4_reg)

        function new(string name="WDT_COMP_PARAM_4_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_COMP_PARAM_4_reg

    //---------------------------------------------------------------------
    // WDT_COMP_PARAM_3  (0xEC, 32-bit, RO) Component Parameters Register 3
    //---------------------------------------------------------------------
    class WDT_COMP_PARAM_3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_COMP_PARAM_3_reg)

        function new(string name="WDT_COMP_PARAM_3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_COMP_PARAM_3_reg

    //---------------------------------------------------------------------
    // WDT_COMP_PARAM_2  (0xF0, 32-bit, RO) Component Parameters Register 2
    //---------------------------------------------------------------------
    class WDT_COMP_PARAM_2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_COMP_PARAM_2_reg)

        function new(string name="WDT_COMP_PARAM_2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_COMP_PARAM_2_reg

    //---------------------------------------------------------------------
    // WDT_COMP_PARAM_1  (0xF4, 32-bit, RO) Component Parameters Register 1
    //---------------------------------------------------------------------
    class WDT_COMP_PARAM_1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_COMP_PARAM_1_reg)

        function new(string name="WDT_COMP_PARAM_1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_COMP_PARAM_1_reg

    //---------------------------------------------------------------------
    // WDT_COMP_VERSION  (0xF8, 32-bit, RO) Component Version Register
    //---------------------------------------------------------------------
    class WDT_COMP_VERSION_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_COMP_VERSION_reg)

        function new(string name="WDT_COMP_VERSION_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_COMP_VERSION_reg

    //---------------------------------------------------------------------
    // WDT_COMP_TYPE  (0xFC, 32-bit, RO) Component Type Register
    //---------------------------------------------------------------------
    class WDT_COMP_TYPE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(WDT_COMP_TYPE_reg)

        function new(string name="WDT_COMP_TYPE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : WDT_COMP_TYPE_reg

    rand WDT_CR_reg WDT_CR;
    rand WDT_TORR_reg WDT_TORR;
    rand WDT_CCVR_reg WDT_CCVR;
    rand WDT_CRR_reg WDT_CRR;
    rand WDT_STAT_reg WDT_STAT;
    rand WDT_EOI_reg WDT_EOI;
    rand WDT_PROT_LEVEL_reg WDT_PROT_LEVEL;
    rand WDT_SFTY_INTR_STAT_reg WDT_SFTY_INTR_STAT;
    rand WDT_SFTY_INTR_CLR_reg WDT_SFTY_INTR_CLR;
    rand WDT_COMP_PARAM_5_reg WDT_COMP_PARAM_5;
    rand WDT_COMP_PARAM_4_reg WDT_COMP_PARAM_4;
    rand WDT_COMP_PARAM_3_reg WDT_COMP_PARAM_3;
    rand WDT_COMP_PARAM_2_reg WDT_COMP_PARAM_2;
    rand WDT_COMP_PARAM_1_reg WDT_COMP_PARAM_1;
    rand WDT_COMP_VERSION_reg WDT_COMP_VERSION;
    rand WDT_COMP_TYPE_reg WDT_COMP_TYPE;

    `uvm_object_utils(wdt_reg_block)

    function new(string name="wdt_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        WDT_CR = WDT_CR_reg::type_id::create("WDT_CR");
        WDT_CR.configure(this, null, "");
        WDT_CR.build();
        default_map.add_reg(WDT_CR, 'h0, "RW");
        WDT_CR.add_hdl_path_slice("WDT_CR", 0, 32, 0);

        WDT_TORR = WDT_TORR_reg::type_id::create("WDT_TORR");
        WDT_TORR.configure(this, null, "");
        WDT_TORR.build();
        default_map.add_reg(WDT_TORR, 'h4, "RW");
        WDT_TORR.add_hdl_path_slice("WDT_TORR", 0, 32, 0);

        WDT_CCVR = WDT_CCVR_reg::type_id::create("WDT_CCVR");
        WDT_CCVR.configure(this, null, "");
        WDT_CCVR.build();
        default_map.add_reg(WDT_CCVR, 'h8, "RO");
        WDT_CCVR.add_hdl_path_slice("WDT_CCVR", 0, 32, 0);

        WDT_CRR = WDT_CRR_reg::type_id::create("WDT_CRR");
        WDT_CRR.configure(this, null, "");
        WDT_CRR.build();
        default_map.add_reg(WDT_CRR, 'hC, "RW");
        WDT_CRR.add_hdl_path_slice("WDT_CRR", 0, 32, 0);

        WDT_STAT = WDT_STAT_reg::type_id::create("WDT_STAT");
        WDT_STAT.configure(this, null, "");
        WDT_STAT.build();
        default_map.add_reg(WDT_STAT, 'h10, "RO");
        WDT_STAT.add_hdl_path_slice("WDT_STAT", 0, 32, 0);

        WDT_EOI = WDT_EOI_reg::type_id::create("WDT_EOI");
        WDT_EOI.configure(this, null, "");
        WDT_EOI.build();
        default_map.add_reg(WDT_EOI, 'h14, "RW");
        WDT_EOI.add_hdl_path_slice("WDT_EOI", 0, 32, 0);

        WDT_PROT_LEVEL = WDT_PROT_LEVEL_reg::type_id::create("WDT_PROT_LEVEL");
        WDT_PROT_LEVEL.configure(this, null, "");
        WDT_PROT_LEVEL.build();
        default_map.add_reg(WDT_PROT_LEVEL, 'h1C, "RW");
        WDT_PROT_LEVEL.add_hdl_path_slice("WDT_PROT_LEVEL", 0, 32, 0);

        WDT_SFTY_INTR_STAT = WDT_SFTY_INTR_STAT_reg::type_id::create("WDT_SFTY_INTR_STAT");
        WDT_SFTY_INTR_STAT.configure(this, null, "");
        WDT_SFTY_INTR_STAT.build();
        default_map.add_reg(WDT_SFTY_INTR_STAT, 'h20, "RO");
        WDT_SFTY_INTR_STAT.add_hdl_path_slice("WDT_SFTY_INTR_STAT", 0, 32, 0);

        WDT_SFTY_INTR_CLR = WDT_SFTY_INTR_CLR_reg::type_id::create("WDT_SFTY_INTR_CLR");
        WDT_SFTY_INTR_CLR.configure(this, null, "");
        WDT_SFTY_INTR_CLR.build();
        default_map.add_reg(WDT_SFTY_INTR_CLR, 'h24, "RW");
        WDT_SFTY_INTR_CLR.add_hdl_path_slice("WDT_SFTY_INTR_CLR", 0, 32, 0);

        WDT_COMP_PARAM_5 = WDT_COMP_PARAM_5_reg::type_id::create("WDT_COMP_PARAM_5");
        WDT_COMP_PARAM_5.configure(this, null, "");
        WDT_COMP_PARAM_5.build();
        default_map.add_reg(WDT_COMP_PARAM_5, 'hE4, "RO");
        WDT_COMP_PARAM_5.add_hdl_path_slice("WDT_COMP_PARAM_5", 0, 32, 0);

        WDT_COMP_PARAM_4 = WDT_COMP_PARAM_4_reg::type_id::create("WDT_COMP_PARAM_4");
        WDT_COMP_PARAM_4.configure(this, null, "");
        WDT_COMP_PARAM_4.build();
        default_map.add_reg(WDT_COMP_PARAM_4, 'hE8, "RO");
        WDT_COMP_PARAM_4.add_hdl_path_slice("WDT_COMP_PARAM_4", 0, 32, 0);

        WDT_COMP_PARAM_3 = WDT_COMP_PARAM_3_reg::type_id::create("WDT_COMP_PARAM_3");
        WDT_COMP_PARAM_3.configure(this, null, "");
        WDT_COMP_PARAM_3.build();
        default_map.add_reg(WDT_COMP_PARAM_3, 'hEC, "RO");
        WDT_COMP_PARAM_3.add_hdl_path_slice("WDT_COMP_PARAM_3", 0, 32, 0);

        WDT_COMP_PARAM_2 = WDT_COMP_PARAM_2_reg::type_id::create("WDT_COMP_PARAM_2");
        WDT_COMP_PARAM_2.configure(this, null, "");
        WDT_COMP_PARAM_2.build();
        default_map.add_reg(WDT_COMP_PARAM_2, 'hF0, "RO");
        WDT_COMP_PARAM_2.add_hdl_path_slice("WDT_COMP_PARAM_2", 0, 32, 0);

        WDT_COMP_PARAM_1 = WDT_COMP_PARAM_1_reg::type_id::create("WDT_COMP_PARAM_1");
        WDT_COMP_PARAM_1.configure(this, null, "");
        WDT_COMP_PARAM_1.build();
        default_map.add_reg(WDT_COMP_PARAM_1, 'hF4, "RO");
        WDT_COMP_PARAM_1.add_hdl_path_slice("WDT_COMP_PARAM_1", 0, 32, 0);

        WDT_COMP_VERSION = WDT_COMP_VERSION_reg::type_id::create("WDT_COMP_VERSION");
        WDT_COMP_VERSION.configure(this, null, "");
        WDT_COMP_VERSION.build();
        default_map.add_reg(WDT_COMP_VERSION, 'hF8, "RO");
        WDT_COMP_VERSION.add_hdl_path_slice("WDT_COMP_VERSION", 0, 32, 0);

        WDT_COMP_TYPE = WDT_COMP_TYPE_reg::type_id::create("WDT_COMP_TYPE");
        WDT_COMP_TYPE.configure(this, null, "");
        WDT_COMP_TYPE.build();
        default_map.add_reg(WDT_COMP_TYPE, 'hFC, "RO");
        WDT_COMP_TYPE.add_hdl_path_slice("WDT_COMP_TYPE", 0, 32, 0);

        lock_model();
    endfunction

endclass : wdt_reg_block

`endif // _WDT_REG_BLOCK_SV_
