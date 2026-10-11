`ifndef _GPIO_REG_BLOCK_SV_
`define _GPIO_REG_BLOCK_SV_

//=========================================================================
// gpio_reg_block: GPIO (DW_apb_gpio v2.15a), 0x40019000
//   自动生成, 共 33 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class gpio_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // GPIO_SWPORTA_DR  (0x0, 32-bit, RW) Port A data register
    //---------------------------------------------------------------------
    class GPIO_SWPORTA_DR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTA_DR_reg)

        function new(string name="GPIO_SWPORTA_DR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTA_DR_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTA_DDR  (0x4, 32-bit, RW) Port A Data Direction Register
    //---------------------------------------------------------------------
    class GPIO_SWPORTA_DDR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTA_DDR_reg)

        function new(string name="GPIO_SWPORTA_DDR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTA_DDR_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTA_CTL  (0x8, 32-bit, RW) Port A data source register
    //---------------------------------------------------------------------
    class GPIO_SWPORTA_CTL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTA_CTL_reg)

        function new(string name="GPIO_SWPORTA_CTL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTA_CTL_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTB_DR  (0xC, 32-bit, RW) Port B data register
    //---------------------------------------------------------------------
    class GPIO_SWPORTB_DR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTB_DR_reg)

        function new(string name="GPIO_SWPORTB_DR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTB_DR_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTB_DDR  (0x10, 32-bit, RW) Port B Data Direction Register
    //---------------------------------------------------------------------
    class GPIO_SWPORTB_DDR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTB_DDR_reg)

        function new(string name="GPIO_SWPORTB_DDR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTB_DDR_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTB_CTL  (0x14, 32-bit, RW) Port B data source register
    //---------------------------------------------------------------------
    class GPIO_SWPORTB_CTL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTB_CTL_reg)

        function new(string name="GPIO_SWPORTB_CTL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTB_CTL_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTC_DR  (0x18, 32-bit, RW) Port C data register
    //---------------------------------------------------------------------
    class GPIO_SWPORTC_DR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTC_DR_reg)

        function new(string name="GPIO_SWPORTC_DR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTC_DR_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTC_DDR  (0x1C, 32-bit, RW) Port C Data Direction Register
    //---------------------------------------------------------------------
    class GPIO_SWPORTC_DDR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTC_DDR_reg)

        function new(string name="GPIO_SWPORTC_DDR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTC_DDR_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTC_CTL  (0x20, 32-bit, RW) Port C data source register
    //---------------------------------------------------------------------
    class GPIO_SWPORTC_CTL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTC_CTL_reg)

        function new(string name="GPIO_SWPORTC_CTL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTC_CTL_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTD_DR  (0x24, 32-bit, RW) Port D data register
    //---------------------------------------------------------------------
    class GPIO_SWPORTD_DR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTD_DR_reg)

        function new(string name="GPIO_SWPORTD_DR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTD_DR_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTD_DDR  (0x28, 32-bit, RW) Port D Data Direction Register
    //---------------------------------------------------------------------
    class GPIO_SWPORTD_DDR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTD_DDR_reg)

        function new(string name="GPIO_SWPORTD_DDR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTD_DDR_reg

    //---------------------------------------------------------------------
    // GPIO_SWPORTD_CTL  (0x2C, 32-bit, RW) Port D data source register
    //---------------------------------------------------------------------
    class GPIO_SWPORTD_CTL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SWPORTD_CTL_reg)

        function new(string name="GPIO_SWPORTD_CTL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SWPORTD_CTL_reg

    //---------------------------------------------------------------------
    // GPIO_INTEN  (0x30, 32-bit, RW) Interrupt enable register
    //---------------------------------------------------------------------
    class GPIO_INTEN_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_INTEN_reg)

        function new(string name="GPIO_INTEN_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_INTEN_reg

    //---------------------------------------------------------------------
    // GPIO_INTMASK  (0x34, 32-bit, RW) Interrupt mask register
    //---------------------------------------------------------------------
    class GPIO_INTMASK_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_INTMASK_reg)

        function new(string name="GPIO_INTMASK_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_INTMASK_reg

    //---------------------------------------------------------------------
    // GPIO_INTTYPE_LEVEL  (0x38, 32-bit, RW) Interrupt level
    //---------------------------------------------------------------------
    class GPIO_INTTYPE_LEVEL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_INTTYPE_LEVEL_reg)

        function new(string name="GPIO_INTTYPE_LEVEL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_INTTYPE_LEVEL_reg

    //---------------------------------------------------------------------
    // GPIO_INT_POLARITY  (0x3C, 32-bit, RW) Interrupt polarity
    //---------------------------------------------------------------------
    class GPIO_INT_POLARITY_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_INT_POLARITY_reg)

        function new(string name="GPIO_INT_POLARITY_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_INT_POLARITY_reg

    //---------------------------------------------------------------------
    // GPIO_INTSTATUS  (0x40, 32-bit, RO) Interrupt status
    //---------------------------------------------------------------------
    class GPIO_INTSTATUS_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_INTSTATUS_reg)

        function new(string name="GPIO_INTSTATUS_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_INTSTATUS_reg

    //---------------------------------------------------------------------
    // GPIO_RAW_INTSTATUS  (0x44, 32-bit, RO) Raw interrupt status
    //---------------------------------------------------------------------
    class GPIO_RAW_INTSTATUS_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_RAW_INTSTATUS_reg)

        function new(string name="GPIO_RAW_INTSTATUS_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_RAW_INTSTATUS_reg

    //---------------------------------------------------------------------
    // GPIO_DEBOUNCE  (0x48, 32-bit, RW) Debounce enable register
    //---------------------------------------------------------------------
    class GPIO_DEBOUNCE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_DEBOUNCE_reg)

        function new(string name="GPIO_DEBOUNCE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_DEBOUNCE_reg

    //---------------------------------------------------------------------
    // GPIO_PORTA_EOI  (0x4C, 32-bit, RW) Port A clear interrupt register
    //---------------------------------------------------------------------
    class GPIO_PORTA_EOI_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_PORTA_EOI_reg)

        function new(string name="GPIO_PORTA_EOI_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_PORTA_EOI_reg

    //---------------------------------------------------------------------
    // GPIO_EXT_PORTA  (0x50, 32-bit, RW) External port A register
    //---------------------------------------------------------------------
    class GPIO_EXT_PORTA_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_EXT_PORTA_reg)

        function new(string name="GPIO_EXT_PORTA_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_EXT_PORTA_reg

    //---------------------------------------------------------------------
    // GPIO_EXT_PORTB  (0x54, 32-bit, RW) Port B external port register
    //---------------------------------------------------------------------
    class GPIO_EXT_PORTB_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_EXT_PORTB_reg)

        function new(string name="GPIO_EXT_PORTB_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_EXT_PORTB_reg

    //---------------------------------------------------------------------
    // GPIO_EXT_PORTC  (0x58, 32-bit, RW) External port C register
    //---------------------------------------------------------------------
    class GPIO_EXT_PORTC_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_EXT_PORTC_reg)

        function new(string name="GPIO_EXT_PORTC_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_EXT_PORTC_reg

    //---------------------------------------------------------------------
    // GPIO_EXT_PORTD  (0x5C, 32-bit, RW) Port D external port register
    //---------------------------------------------------------------------
    class GPIO_EXT_PORTD_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_EXT_PORTD_reg)

        function new(string name="GPIO_EXT_PORTD_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_EXT_PORTD_reg

    //---------------------------------------------------------------------
    // GPIO_LS_SYNC  (0x60, 32-bit, RW) Synchronization level
    //---------------------------------------------------------------------
    class GPIO_LS_SYNC_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_LS_SYNC_reg)

        function new(string name="GPIO_LS_SYNC_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_LS_SYNC_reg

    //---------------------------------------------------------------------
    // GPIO_ID_CODE  (0x64, 32-bit, RO) GPIO ID code
    //---------------------------------------------------------------------
    class GPIO_ID_CODE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_ID_CODE_reg)

        function new(string name="GPIO_ID_CODE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_ID_CODE_reg

    //---------------------------------------------------------------------
    // GPIO_INT_BOTHEDGE  (0x68, 32-bit, RW) Interrupt Both Edge type
    //---------------------------------------------------------------------
    class GPIO_INT_BOTHEDGE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_INT_BOTHEDGE_reg)

        function new(string name="GPIO_INT_BOTHEDGE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_INT_BOTHEDGE_reg

    //---------------------------------------------------------------------
    // GPIO_VER_ID_CODE  (0x6C, 32-bit, RO) GPIO Component Version
    //---------------------------------------------------------------------
    class GPIO_VER_ID_CODE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_VER_ID_CODE_reg)

        function new(string name="GPIO_VER_ID_CODE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_VER_ID_CODE_reg

    //---------------------------------------------------------------------
    // GPIO_CONFIG_REG2  (0x70, 32-bit, RW) GPIO Configuration Register 2
    //---------------------------------------------------------------------
    class GPIO_CONFIG_REG2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_CONFIG_REG2_reg)

        function new(string name="GPIO_CONFIG_REG2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_CONFIG_REG2_reg

    //---------------------------------------------------------------------
    // GPIO_CONFIG_REG1  (0x74, 32-bit, RW) GPIO Configuration Register 1
    //---------------------------------------------------------------------
    class GPIO_CONFIG_REG1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_CONFIG_REG1_reg)

        function new(string name="GPIO_CONFIG_REG1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_CONFIG_REG1_reg

    //---------------------------------------------------------------------
    // GPIO_SFTY_INTR_STAT_REG  (0x90, 32-bit, RO) GPIO Safety Interrupt Status Register
    //---------------------------------------------------------------------
    class GPIO_SFTY_INTR_STAT_REG_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SFTY_INTR_STAT_REG_reg)

        function new(string name="GPIO_SFTY_INTR_STAT_REG_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SFTY_INTR_STAT_REG_reg

    //---------------------------------------------------------------------
    // GPIO_SFTY_INTR_CLR_REG  (0x94, 32-bit, RW) GPIO Safety Interrupt Clear Register
    //---------------------------------------------------------------------
    class GPIO_SFTY_INTR_CLR_REG_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SFTY_INTR_CLR_REG_reg)

        function new(string name="GPIO_SFTY_INTR_CLR_REG_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SFTY_INTR_CLR_REG_reg

    //---------------------------------------------------------------------
    // GPIO_SFTY_CTRL_REG  (0x98, 32-bit, RW) GPIO Safety Control Register
    //---------------------------------------------------------------------
    class GPIO_SFTY_CTRL_REG_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(GPIO_SFTY_CTRL_REG_reg)

        function new(string name="GPIO_SFTY_CTRL_REG_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : GPIO_SFTY_CTRL_REG_reg

    rand GPIO_SWPORTA_DR_reg GPIO_SWPORTA_DR;
    rand GPIO_SWPORTA_DDR_reg GPIO_SWPORTA_DDR;
    rand GPIO_SWPORTA_CTL_reg GPIO_SWPORTA_CTL;
    rand GPIO_SWPORTB_DR_reg GPIO_SWPORTB_DR;
    rand GPIO_SWPORTB_DDR_reg GPIO_SWPORTB_DDR;
    rand GPIO_SWPORTB_CTL_reg GPIO_SWPORTB_CTL;
    rand GPIO_SWPORTC_DR_reg GPIO_SWPORTC_DR;
    rand GPIO_SWPORTC_DDR_reg GPIO_SWPORTC_DDR;
    rand GPIO_SWPORTC_CTL_reg GPIO_SWPORTC_CTL;
    rand GPIO_SWPORTD_DR_reg GPIO_SWPORTD_DR;
    rand GPIO_SWPORTD_DDR_reg GPIO_SWPORTD_DDR;
    rand GPIO_SWPORTD_CTL_reg GPIO_SWPORTD_CTL;
    rand GPIO_INTEN_reg GPIO_INTEN;
    rand GPIO_INTMASK_reg GPIO_INTMASK;
    rand GPIO_INTTYPE_LEVEL_reg GPIO_INTTYPE_LEVEL;
    rand GPIO_INT_POLARITY_reg GPIO_INT_POLARITY;
    rand GPIO_INTSTATUS_reg GPIO_INTSTATUS;
    rand GPIO_RAW_INTSTATUS_reg GPIO_RAW_INTSTATUS;
    rand GPIO_DEBOUNCE_reg GPIO_DEBOUNCE;
    rand GPIO_PORTA_EOI_reg GPIO_PORTA_EOI;
    rand GPIO_EXT_PORTA_reg GPIO_EXT_PORTA;
    rand GPIO_EXT_PORTB_reg GPIO_EXT_PORTB;
    rand GPIO_EXT_PORTC_reg GPIO_EXT_PORTC;
    rand GPIO_EXT_PORTD_reg GPIO_EXT_PORTD;
    rand GPIO_LS_SYNC_reg GPIO_LS_SYNC;
    rand GPIO_ID_CODE_reg GPIO_ID_CODE;
    rand GPIO_INT_BOTHEDGE_reg GPIO_INT_BOTHEDGE;
    rand GPIO_VER_ID_CODE_reg GPIO_VER_ID_CODE;
    rand GPIO_CONFIG_REG2_reg GPIO_CONFIG_REG2;
    rand GPIO_CONFIG_REG1_reg GPIO_CONFIG_REG1;
    rand GPIO_SFTY_INTR_STAT_REG_reg GPIO_SFTY_INTR_STAT_REG;
    rand GPIO_SFTY_INTR_CLR_REG_reg GPIO_SFTY_INTR_CLR_REG;
    rand GPIO_SFTY_CTRL_REG_reg GPIO_SFTY_CTRL_REG;

    `uvm_object_utils(gpio_reg_block)

    function new(string name="gpio_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        GPIO_SWPORTA_DR = GPIO_SWPORTA_DR_reg::type_id::create("GPIO_SWPORTA_DR");
        GPIO_SWPORTA_DR.configure(this, null, "");
        GPIO_SWPORTA_DR.build();
        default_map.add_reg(GPIO_SWPORTA_DR, 'h0, "RW");
        GPIO_SWPORTA_DR.add_hdl_path_slice("GPIO_SWPORTA_DR", 0, 32, 0);

        GPIO_SWPORTA_DDR = GPIO_SWPORTA_DDR_reg::type_id::create("GPIO_SWPORTA_DDR");
        GPIO_SWPORTA_DDR.configure(this, null, "");
        GPIO_SWPORTA_DDR.build();
        default_map.add_reg(GPIO_SWPORTA_DDR, 'h4, "RW");
        GPIO_SWPORTA_DDR.add_hdl_path_slice("GPIO_SWPORTA_DDR", 0, 32, 0);

        GPIO_SWPORTA_CTL = GPIO_SWPORTA_CTL_reg::type_id::create("GPIO_SWPORTA_CTL");
        GPIO_SWPORTA_CTL.configure(this, null, "");
        GPIO_SWPORTA_CTL.build();
        default_map.add_reg(GPIO_SWPORTA_CTL, 'h8, "RW");
        GPIO_SWPORTA_CTL.add_hdl_path_slice("GPIO_SWPORTA_CTL", 0, 32, 0);

        GPIO_SWPORTB_DR = GPIO_SWPORTB_DR_reg::type_id::create("GPIO_SWPORTB_DR");
        GPIO_SWPORTB_DR.configure(this, null, "");
        GPIO_SWPORTB_DR.build();
        default_map.add_reg(GPIO_SWPORTB_DR, 'hC, "RW");
        GPIO_SWPORTB_DR.add_hdl_path_slice("GPIO_SWPORTB_DR", 0, 32, 0);

        GPIO_SWPORTB_DDR = GPIO_SWPORTB_DDR_reg::type_id::create("GPIO_SWPORTB_DDR");
        GPIO_SWPORTB_DDR.configure(this, null, "");
        GPIO_SWPORTB_DDR.build();
        default_map.add_reg(GPIO_SWPORTB_DDR, 'h10, "RW");
        GPIO_SWPORTB_DDR.add_hdl_path_slice("GPIO_SWPORTB_DDR", 0, 32, 0);

        GPIO_SWPORTB_CTL = GPIO_SWPORTB_CTL_reg::type_id::create("GPIO_SWPORTB_CTL");
        GPIO_SWPORTB_CTL.configure(this, null, "");
        GPIO_SWPORTB_CTL.build();
        default_map.add_reg(GPIO_SWPORTB_CTL, 'h14, "RW");
        GPIO_SWPORTB_CTL.add_hdl_path_slice("GPIO_SWPORTB_CTL", 0, 32, 0);

        GPIO_SWPORTC_DR = GPIO_SWPORTC_DR_reg::type_id::create("GPIO_SWPORTC_DR");
        GPIO_SWPORTC_DR.configure(this, null, "");
        GPIO_SWPORTC_DR.build();
        default_map.add_reg(GPIO_SWPORTC_DR, 'h18, "RW");
        GPIO_SWPORTC_DR.add_hdl_path_slice("GPIO_SWPORTC_DR", 0, 32, 0);

        GPIO_SWPORTC_DDR = GPIO_SWPORTC_DDR_reg::type_id::create("GPIO_SWPORTC_DDR");
        GPIO_SWPORTC_DDR.configure(this, null, "");
        GPIO_SWPORTC_DDR.build();
        default_map.add_reg(GPIO_SWPORTC_DDR, 'h1C, "RW");
        GPIO_SWPORTC_DDR.add_hdl_path_slice("GPIO_SWPORTC_DDR", 0, 32, 0);

        GPIO_SWPORTC_CTL = GPIO_SWPORTC_CTL_reg::type_id::create("GPIO_SWPORTC_CTL");
        GPIO_SWPORTC_CTL.configure(this, null, "");
        GPIO_SWPORTC_CTL.build();
        default_map.add_reg(GPIO_SWPORTC_CTL, 'h20, "RW");
        GPIO_SWPORTC_CTL.add_hdl_path_slice("GPIO_SWPORTC_CTL", 0, 32, 0);

        GPIO_SWPORTD_DR = GPIO_SWPORTD_DR_reg::type_id::create("GPIO_SWPORTD_DR");
        GPIO_SWPORTD_DR.configure(this, null, "");
        GPIO_SWPORTD_DR.build();
        default_map.add_reg(GPIO_SWPORTD_DR, 'h24, "RW");
        GPIO_SWPORTD_DR.add_hdl_path_slice("GPIO_SWPORTD_DR", 0, 32, 0);

        GPIO_SWPORTD_DDR = GPIO_SWPORTD_DDR_reg::type_id::create("GPIO_SWPORTD_DDR");
        GPIO_SWPORTD_DDR.configure(this, null, "");
        GPIO_SWPORTD_DDR.build();
        default_map.add_reg(GPIO_SWPORTD_DDR, 'h28, "RW");
        GPIO_SWPORTD_DDR.add_hdl_path_slice("GPIO_SWPORTD_DDR", 0, 32, 0);

        GPIO_SWPORTD_CTL = GPIO_SWPORTD_CTL_reg::type_id::create("GPIO_SWPORTD_CTL");
        GPIO_SWPORTD_CTL.configure(this, null, "");
        GPIO_SWPORTD_CTL.build();
        default_map.add_reg(GPIO_SWPORTD_CTL, 'h2C, "RW");
        GPIO_SWPORTD_CTL.add_hdl_path_slice("GPIO_SWPORTD_CTL", 0, 32, 0);

        GPIO_INTEN = GPIO_INTEN_reg::type_id::create("GPIO_INTEN");
        GPIO_INTEN.configure(this, null, "");
        GPIO_INTEN.build();
        default_map.add_reg(GPIO_INTEN, 'h30, "RW");
        GPIO_INTEN.add_hdl_path_slice("GPIO_INTEN", 0, 32, 0);

        GPIO_INTMASK = GPIO_INTMASK_reg::type_id::create("GPIO_INTMASK");
        GPIO_INTMASK.configure(this, null, "");
        GPIO_INTMASK.build();
        default_map.add_reg(GPIO_INTMASK, 'h34, "RW");
        GPIO_INTMASK.add_hdl_path_slice("GPIO_INTMASK", 0, 32, 0);

        GPIO_INTTYPE_LEVEL = GPIO_INTTYPE_LEVEL_reg::type_id::create("GPIO_INTTYPE_LEVEL");
        GPIO_INTTYPE_LEVEL.configure(this, null, "");
        GPIO_INTTYPE_LEVEL.build();
        default_map.add_reg(GPIO_INTTYPE_LEVEL, 'h38, "RW");
        GPIO_INTTYPE_LEVEL.add_hdl_path_slice("GPIO_INTTYPE_LEVEL", 0, 32, 0);

        GPIO_INT_POLARITY = GPIO_INT_POLARITY_reg::type_id::create("GPIO_INT_POLARITY");
        GPIO_INT_POLARITY.configure(this, null, "");
        GPIO_INT_POLARITY.build();
        default_map.add_reg(GPIO_INT_POLARITY, 'h3C, "RW");
        GPIO_INT_POLARITY.add_hdl_path_slice("GPIO_INT_POLARITY", 0, 32, 0);

        GPIO_INTSTATUS = GPIO_INTSTATUS_reg::type_id::create("GPIO_INTSTATUS");
        GPIO_INTSTATUS.configure(this, null, "");
        GPIO_INTSTATUS.build();
        default_map.add_reg(GPIO_INTSTATUS, 'h40, "RO");
        GPIO_INTSTATUS.add_hdl_path_slice("GPIO_INTSTATUS", 0, 32, 0);

        GPIO_RAW_INTSTATUS = GPIO_RAW_INTSTATUS_reg::type_id::create("GPIO_RAW_INTSTATUS");
        GPIO_RAW_INTSTATUS.configure(this, null, "");
        GPIO_RAW_INTSTATUS.build();
        default_map.add_reg(GPIO_RAW_INTSTATUS, 'h44, "RO");
        GPIO_RAW_INTSTATUS.add_hdl_path_slice("GPIO_RAW_INTSTATUS", 0, 32, 0);

        GPIO_DEBOUNCE = GPIO_DEBOUNCE_reg::type_id::create("GPIO_DEBOUNCE");
        GPIO_DEBOUNCE.configure(this, null, "");
        GPIO_DEBOUNCE.build();
        default_map.add_reg(GPIO_DEBOUNCE, 'h48, "RW");
        GPIO_DEBOUNCE.add_hdl_path_slice("GPIO_DEBOUNCE", 0, 32, 0);

        GPIO_PORTA_EOI = GPIO_PORTA_EOI_reg::type_id::create("GPIO_PORTA_EOI");
        GPIO_PORTA_EOI.configure(this, null, "");
        GPIO_PORTA_EOI.build();
        default_map.add_reg(GPIO_PORTA_EOI, 'h4C, "RW");
        GPIO_PORTA_EOI.add_hdl_path_slice("GPIO_PORTA_EOI", 0, 32, 0);

        GPIO_EXT_PORTA = GPIO_EXT_PORTA_reg::type_id::create("GPIO_EXT_PORTA");
        GPIO_EXT_PORTA.configure(this, null, "");
        GPIO_EXT_PORTA.build();
        default_map.add_reg(GPIO_EXT_PORTA, 'h50, "RW");
        GPIO_EXT_PORTA.add_hdl_path_slice("GPIO_EXT_PORTA", 0, 32, 0);

        GPIO_EXT_PORTB = GPIO_EXT_PORTB_reg::type_id::create("GPIO_EXT_PORTB");
        GPIO_EXT_PORTB.configure(this, null, "");
        GPIO_EXT_PORTB.build();
        default_map.add_reg(GPIO_EXT_PORTB, 'h54, "RW");
        GPIO_EXT_PORTB.add_hdl_path_slice("GPIO_EXT_PORTB", 0, 32, 0);

        GPIO_EXT_PORTC = GPIO_EXT_PORTC_reg::type_id::create("GPIO_EXT_PORTC");
        GPIO_EXT_PORTC.configure(this, null, "");
        GPIO_EXT_PORTC.build();
        default_map.add_reg(GPIO_EXT_PORTC, 'h58, "RW");
        GPIO_EXT_PORTC.add_hdl_path_slice("GPIO_EXT_PORTC", 0, 32, 0);

        GPIO_EXT_PORTD = GPIO_EXT_PORTD_reg::type_id::create("GPIO_EXT_PORTD");
        GPIO_EXT_PORTD.configure(this, null, "");
        GPIO_EXT_PORTD.build();
        default_map.add_reg(GPIO_EXT_PORTD, 'h5C, "RW");
        GPIO_EXT_PORTD.add_hdl_path_slice("GPIO_EXT_PORTD", 0, 32, 0);

        GPIO_LS_SYNC = GPIO_LS_SYNC_reg::type_id::create("GPIO_LS_SYNC");
        GPIO_LS_SYNC.configure(this, null, "");
        GPIO_LS_SYNC.build();
        default_map.add_reg(GPIO_LS_SYNC, 'h60, "RW");
        GPIO_LS_SYNC.add_hdl_path_slice("GPIO_LS_SYNC", 0, 32, 0);

        GPIO_ID_CODE = GPIO_ID_CODE_reg::type_id::create("GPIO_ID_CODE");
        GPIO_ID_CODE.configure(this, null, "");
        GPIO_ID_CODE.build();
        default_map.add_reg(GPIO_ID_CODE, 'h64, "RO");
        GPIO_ID_CODE.add_hdl_path_slice("GPIO_ID_CODE", 0, 32, 0);

        GPIO_INT_BOTHEDGE = GPIO_INT_BOTHEDGE_reg::type_id::create("GPIO_INT_BOTHEDGE");
        GPIO_INT_BOTHEDGE.configure(this, null, "");
        GPIO_INT_BOTHEDGE.build();
        default_map.add_reg(GPIO_INT_BOTHEDGE, 'h68, "RW");
        GPIO_INT_BOTHEDGE.add_hdl_path_slice("GPIO_INT_BOTHEDGE", 0, 32, 0);

        GPIO_VER_ID_CODE = GPIO_VER_ID_CODE_reg::type_id::create("GPIO_VER_ID_CODE");
        GPIO_VER_ID_CODE.configure(this, null, "");
        GPIO_VER_ID_CODE.build();
        default_map.add_reg(GPIO_VER_ID_CODE, 'h6C, "RO");
        GPIO_VER_ID_CODE.add_hdl_path_slice("GPIO_VER_ID_CODE", 0, 32, 0);

        GPIO_CONFIG_REG2 = GPIO_CONFIG_REG2_reg::type_id::create("GPIO_CONFIG_REG2");
        GPIO_CONFIG_REG2.configure(this, null, "");
        GPIO_CONFIG_REG2.build();
        default_map.add_reg(GPIO_CONFIG_REG2, 'h70, "RW");
        GPIO_CONFIG_REG2.add_hdl_path_slice("GPIO_CONFIG_REG2", 0, 32, 0);

        GPIO_CONFIG_REG1 = GPIO_CONFIG_REG1_reg::type_id::create("GPIO_CONFIG_REG1");
        GPIO_CONFIG_REG1.configure(this, null, "");
        GPIO_CONFIG_REG1.build();
        default_map.add_reg(GPIO_CONFIG_REG1, 'h74, "RW");
        GPIO_CONFIG_REG1.add_hdl_path_slice("GPIO_CONFIG_REG1", 0, 32, 0);

        GPIO_SFTY_INTR_STAT_REG = GPIO_SFTY_INTR_STAT_REG_reg::type_id::create("GPIO_SFTY_INTR_STAT_REG");
        GPIO_SFTY_INTR_STAT_REG.configure(this, null, "");
        GPIO_SFTY_INTR_STAT_REG.build();
        default_map.add_reg(GPIO_SFTY_INTR_STAT_REG, 'h90, "RO");
        GPIO_SFTY_INTR_STAT_REG.add_hdl_path_slice("GPIO_SFTY_INTR_STAT_REG", 0, 32, 0);

        GPIO_SFTY_INTR_CLR_REG = GPIO_SFTY_INTR_CLR_REG_reg::type_id::create("GPIO_SFTY_INTR_CLR_REG");
        GPIO_SFTY_INTR_CLR_REG.configure(this, null, "");
        GPIO_SFTY_INTR_CLR_REG.build();
        default_map.add_reg(GPIO_SFTY_INTR_CLR_REG, 'h94, "RW");
        GPIO_SFTY_INTR_CLR_REG.add_hdl_path_slice("GPIO_SFTY_INTR_CLR_REG", 0, 32, 0);

        GPIO_SFTY_CTRL_REG = GPIO_SFTY_CTRL_REG_reg::type_id::create("GPIO_SFTY_CTRL_REG");
        GPIO_SFTY_CTRL_REG.configure(this, null, "");
        GPIO_SFTY_CTRL_REG.build();
        default_map.add_reg(GPIO_SFTY_CTRL_REG, 'h98, "RW");
        GPIO_SFTY_CTRL_REG.add_hdl_path_slice("GPIO_SFTY_CTRL_REG", 0, 32, 0);

        lock_model();
    endfunction

endclass : gpio_reg_block

`endif // _GPIO_REG_BLOCK_SV_
