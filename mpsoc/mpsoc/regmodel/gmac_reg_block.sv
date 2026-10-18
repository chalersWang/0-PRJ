`ifndef _GMAC_REG_BLOCK_SV_
`define _GMAC_REG_BLOCK_SV_

//=========================================================================
// gmac_reg_block: GMAC (DW Ethernet MAC, MAC1.pdf), 0x40040000
//   自动生成, 共 119 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class gmac_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // MAC_Configuration  (0x0, 32-bit, RW) MAC Configuration
    //---------------------------------------------------------------------
    class MAC_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Configuration_reg)

        function new(string name="MAC_Configuration_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Configuration_reg

    //---------------------------------------------------------------------
    // Frame_Filter  (0x4, 32-bit, RW) Frame Filter
    //---------------------------------------------------------------------
    class Frame_Filter_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Frame_Filter_reg)

        function new(string name="Frame_Filter_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Frame_Filter_reg

    //---------------------------------------------------------------------
    // Hash_Table_High  (0x8, 32-bit, RW) Hash Table High
    //---------------------------------------------------------------------
    class Hash_Table_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Hash_Table_High_reg)

        function new(string name="Hash_Table_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Hash_Table_High_reg

    //---------------------------------------------------------------------
    // Hash_Table_Low  (0xC, 32-bit, RW) Hash Table Low
    //---------------------------------------------------------------------
    class Hash_Table_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Hash_Table_Low_reg)

        function new(string name="Hash_Table_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Hash_Table_Low_reg

    //---------------------------------------------------------------------
    // MII_Address  (0x10, 32-bit, RW) MII Address (管理接口)
    //---------------------------------------------------------------------
    class MII_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MII_Address_reg)

        function new(string name="MII_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MII_Address_reg

    //---------------------------------------------------------------------
    // MII_Data  (0x14, 32-bit, RW) MII Data
    //---------------------------------------------------------------------
    class MII_Data_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MII_Data_reg)

        function new(string name="MII_Data_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MII_Data_reg

    //---------------------------------------------------------------------
    // Flow_Control  (0x18, 32-bit, RW) Flow Control
    //---------------------------------------------------------------------
    class Flow_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Flow_Control_reg)

        function new(string name="Flow_Control_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Flow_Control_reg

    //---------------------------------------------------------------------
    // VLAN_Tag  (0x1C, 32-bit, RW) VLAN Tag
    //---------------------------------------------------------------------
    class VLAN_Tag_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(VLAN_Tag_reg)

        function new(string name="VLAN_Tag_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : VLAN_Tag_reg

    //---------------------------------------------------------------------
    // Version  (0x20, 32-bit, RO) Version
    //---------------------------------------------------------------------
    class Version_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Version_reg)

        function new(string name="Version_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Version_reg

    //---------------------------------------------------------------------
    // Debug  (0x24, 32-bit, RW) Debug
    //---------------------------------------------------------------------
    class Debug_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Debug_reg)

        function new(string name="Debug_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Debug_reg

    //---------------------------------------------------------------------
    // Remote_Wakeup_Frame_Filter  (0x28, 32-bit, RW) Remote Wake-up Frame Filter
    //---------------------------------------------------------------------
    class Remote_Wakeup_Frame_Filter_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Remote_Wakeup_Frame_Filter_reg)

        function new(string name="Remote_Wakeup_Frame_Filter_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Remote_Wakeup_Frame_Filter_reg

    //---------------------------------------------------------------------
    // PMT_Control_Status  (0x2C, 32-bit, RW) PMT Control & Status
    //---------------------------------------------------------------------
    class PMT_Control_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PMT_Control_Status_reg)

        function new(string name="PMT_Control_Status_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : PMT_Control_Status_reg

    //---------------------------------------------------------------------
    // Interrupt_Status  (0x38, 32-bit, RO) Interrupt Status
    //---------------------------------------------------------------------
    class Interrupt_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Interrupt_Status_reg)

        function new(string name="Interrupt_Status_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Interrupt_Status_reg

    //---------------------------------------------------------------------
    // Interrupt_Mask  (0x3C, 32-bit, RW) Interrupt Mask
    //---------------------------------------------------------------------
    class Interrupt_Mask_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Interrupt_Mask_reg)

        function new(string name="Interrupt_Mask_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Interrupt_Mask_reg

    //---------------------------------------------------------------------
    // MAC_Address0_High  (0x40, 32-bit, RW) MAC Address0 High
    //---------------------------------------------------------------------
    class MAC_Address0_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address0_High_reg)

        function new(string name="MAC_Address0_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address0_High_reg

    //---------------------------------------------------------------------
    // MAC_Address0_Low  (0x44, 32-bit, RW) MAC Address0 Low
    //---------------------------------------------------------------------
    class MAC_Address0_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address0_Low_reg)

        function new(string name="MAC_Address0_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address0_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address1_High  (0x48, 32-bit, RW) MAC Address1 High
    //---------------------------------------------------------------------
    class MAC_Address1_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address1_High_reg)

        function new(string name="MAC_Address1_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address1_High_reg

    //---------------------------------------------------------------------
    // MAC_Address1_Low  (0x4C, 32-bit, RW) MAC Address1 Low
    //---------------------------------------------------------------------
    class MAC_Address1_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address1_Low_reg)

        function new(string name="MAC_Address1_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address1_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address2_High  (0x50, 32-bit, RW) MAC Address2 High
    //---------------------------------------------------------------------
    class MAC_Address2_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address2_High_reg)

        function new(string name="MAC_Address2_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address2_High_reg

    //---------------------------------------------------------------------
    // MAC_Address2_Low  (0x54, 32-bit, RW) MAC Address2 Low
    //---------------------------------------------------------------------
    class MAC_Address2_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address2_Low_reg)

        function new(string name="MAC_Address2_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address2_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address3_High  (0x58, 32-bit, RW) MAC Address3 High
    //---------------------------------------------------------------------
    class MAC_Address3_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address3_High_reg)

        function new(string name="MAC_Address3_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address3_High_reg

    //---------------------------------------------------------------------
    // MAC_Address3_Low  (0x5C, 32-bit, RW) MAC Address3 Low
    //---------------------------------------------------------------------
    class MAC_Address3_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address3_Low_reg)

        function new(string name="MAC_Address3_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address3_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address4_High  (0x60, 32-bit, RW) MAC Address4 High
    //---------------------------------------------------------------------
    class MAC_Address4_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address4_High_reg)

        function new(string name="MAC_Address4_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address4_High_reg

    //---------------------------------------------------------------------
    // MAC_Address4_Low  (0x64, 32-bit, RW) MAC Address4 Low
    //---------------------------------------------------------------------
    class MAC_Address4_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address4_Low_reg)

        function new(string name="MAC_Address4_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address4_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address5_High  (0x68, 32-bit, RW) MAC Address5 High
    //---------------------------------------------------------------------
    class MAC_Address5_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address5_High_reg)

        function new(string name="MAC_Address5_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address5_High_reg

    //---------------------------------------------------------------------
    // MAC_Address5_Low  (0x6C, 32-bit, RW) MAC Address5 Low
    //---------------------------------------------------------------------
    class MAC_Address5_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address5_Low_reg)

        function new(string name="MAC_Address5_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address5_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address6_High  (0x70, 32-bit, RW) MAC Address6 High
    //---------------------------------------------------------------------
    class MAC_Address6_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address6_High_reg)

        function new(string name="MAC_Address6_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address6_High_reg

    //---------------------------------------------------------------------
    // MAC_Address6_Low  (0x74, 32-bit, RW) MAC Address6 Low
    //---------------------------------------------------------------------
    class MAC_Address6_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address6_Low_reg)

        function new(string name="MAC_Address6_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address6_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address7_High  (0x78, 32-bit, RW) MAC Address7 High
    //---------------------------------------------------------------------
    class MAC_Address7_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address7_High_reg)

        function new(string name="MAC_Address7_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address7_High_reg

    //---------------------------------------------------------------------
    // MAC_Address7_Low  (0x7C, 32-bit, RW) MAC Address7 Low
    //---------------------------------------------------------------------
    class MAC_Address7_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address7_Low_reg)

        function new(string name="MAC_Address7_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address7_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address8_High  (0x80, 32-bit, RW) MAC Address8 High
    //---------------------------------------------------------------------
    class MAC_Address8_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address8_High_reg)

        function new(string name="MAC_Address8_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address8_High_reg

    //---------------------------------------------------------------------
    // MAC_Address8_Low  (0x84, 32-bit, RW) MAC Address8 Low
    //---------------------------------------------------------------------
    class MAC_Address8_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address8_Low_reg)

        function new(string name="MAC_Address8_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address8_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address9_High  (0x88, 32-bit, RW) MAC Address9 High
    //---------------------------------------------------------------------
    class MAC_Address9_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address9_High_reg)

        function new(string name="MAC_Address9_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address9_High_reg

    //---------------------------------------------------------------------
    // MAC_Address9_Low  (0x8C, 32-bit, RW) MAC Address9 Low
    //---------------------------------------------------------------------
    class MAC_Address9_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address9_Low_reg)

        function new(string name="MAC_Address9_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address9_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address10_High  (0x90, 32-bit, RW) MAC Address10 High
    //---------------------------------------------------------------------
    class MAC_Address10_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address10_High_reg)

        function new(string name="MAC_Address10_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address10_High_reg

    //---------------------------------------------------------------------
    // MAC_Address10_Low  (0x94, 32-bit, RW) MAC Address10 Low
    //---------------------------------------------------------------------
    class MAC_Address10_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address10_Low_reg)

        function new(string name="MAC_Address10_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address10_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address11_High  (0x98, 32-bit, RW) MAC Address11 High
    //---------------------------------------------------------------------
    class MAC_Address11_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address11_High_reg)

        function new(string name="MAC_Address11_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address11_High_reg

    //---------------------------------------------------------------------
    // MAC_Address11_Low  (0x9C, 32-bit, RW) MAC Address11 Low
    //---------------------------------------------------------------------
    class MAC_Address11_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address11_Low_reg)

        function new(string name="MAC_Address11_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address11_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address12_High  (0xA0, 32-bit, RW) MAC Address12 High
    //---------------------------------------------------------------------
    class MAC_Address12_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address12_High_reg)

        function new(string name="MAC_Address12_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address12_High_reg

    //---------------------------------------------------------------------
    // MAC_Address12_Low  (0xA4, 32-bit, RW) MAC Address12 Low
    //---------------------------------------------------------------------
    class MAC_Address12_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address12_Low_reg)

        function new(string name="MAC_Address12_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address12_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address13_High  (0xA8, 32-bit, RW) MAC Address13 High
    //---------------------------------------------------------------------
    class MAC_Address13_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address13_High_reg)

        function new(string name="MAC_Address13_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address13_High_reg

    //---------------------------------------------------------------------
    // MAC_Address13_Low  (0xAC, 32-bit, RW) MAC Address13 Low
    //---------------------------------------------------------------------
    class MAC_Address13_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address13_Low_reg)

        function new(string name="MAC_Address13_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address13_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address14_High  (0xB0, 32-bit, RW) MAC Address14 High
    //---------------------------------------------------------------------
    class MAC_Address14_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address14_High_reg)

        function new(string name="MAC_Address14_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address14_High_reg

    //---------------------------------------------------------------------
    // MAC_Address14_Low  (0xB4, 32-bit, RW) MAC Address14 Low
    //---------------------------------------------------------------------
    class MAC_Address14_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address14_Low_reg)

        function new(string name="MAC_Address14_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address14_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address15_High  (0xB8, 32-bit, RW) MAC Address15 High
    //---------------------------------------------------------------------
    class MAC_Address15_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address15_High_reg)

        function new(string name="MAC_Address15_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address15_High_reg

    //---------------------------------------------------------------------
    // MAC_Address15_Low  (0xBC, 32-bit, RW) MAC Address15 Low
    //---------------------------------------------------------------------
    class MAC_Address15_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address15_Low_reg)

        function new(string name="MAC_Address15_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address15_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address16_High  (0x800, 32-bit, RW) MAC Address16 High
    //---------------------------------------------------------------------
    class MAC_Address16_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address16_High_reg)

        function new(string name="MAC_Address16_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address16_High_reg

    //---------------------------------------------------------------------
    // MAC_Address16_Low  (0x804, 32-bit, RW) MAC Address16 Low
    //---------------------------------------------------------------------
    class MAC_Address16_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address16_Low_reg)

        function new(string name="MAC_Address16_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address16_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address17_High  (0x808, 32-bit, RW) MAC Address17 High
    //---------------------------------------------------------------------
    class MAC_Address17_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address17_High_reg)

        function new(string name="MAC_Address17_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address17_High_reg

    //---------------------------------------------------------------------
    // MAC_Address17_Low  (0x80C, 32-bit, RW) MAC Address17 Low
    //---------------------------------------------------------------------
    class MAC_Address17_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address17_Low_reg)

        function new(string name="MAC_Address17_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address17_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address18_High  (0x810, 32-bit, RW) MAC Address18 High
    //---------------------------------------------------------------------
    class MAC_Address18_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address18_High_reg)

        function new(string name="MAC_Address18_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address18_High_reg

    //---------------------------------------------------------------------
    // MAC_Address18_Low  (0x814, 32-bit, RW) MAC Address18 Low
    //---------------------------------------------------------------------
    class MAC_Address18_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address18_Low_reg)

        function new(string name="MAC_Address18_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address18_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address19_High  (0x818, 32-bit, RW) MAC Address19 High
    //---------------------------------------------------------------------
    class MAC_Address19_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address19_High_reg)

        function new(string name="MAC_Address19_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address19_High_reg

    //---------------------------------------------------------------------
    // MAC_Address19_Low  (0x81C, 32-bit, RW) MAC Address19 Low
    //---------------------------------------------------------------------
    class MAC_Address19_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address19_Low_reg)

        function new(string name="MAC_Address19_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address19_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address20_High  (0x820, 32-bit, RW) MAC Address20 High
    //---------------------------------------------------------------------
    class MAC_Address20_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address20_High_reg)

        function new(string name="MAC_Address20_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address20_High_reg

    //---------------------------------------------------------------------
    // MAC_Address20_Low  (0x824, 32-bit, RW) MAC Address20 Low
    //---------------------------------------------------------------------
    class MAC_Address20_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address20_Low_reg)

        function new(string name="MAC_Address20_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address20_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address21_High  (0x828, 32-bit, RW) MAC Address21 High
    //---------------------------------------------------------------------
    class MAC_Address21_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address21_High_reg)

        function new(string name="MAC_Address21_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address21_High_reg

    //---------------------------------------------------------------------
    // MAC_Address21_Low  (0x82C, 32-bit, RW) MAC Address21 Low
    //---------------------------------------------------------------------
    class MAC_Address21_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address21_Low_reg)

        function new(string name="MAC_Address21_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address21_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address22_High  (0x830, 32-bit, RW) MAC Address22 High
    //---------------------------------------------------------------------
    class MAC_Address22_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address22_High_reg)

        function new(string name="MAC_Address22_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address22_High_reg

    //---------------------------------------------------------------------
    // MAC_Address22_Low  (0x834, 32-bit, RW) MAC Address22 Low
    //---------------------------------------------------------------------
    class MAC_Address22_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address22_Low_reg)

        function new(string name="MAC_Address22_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address22_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address23_High  (0x838, 32-bit, RW) MAC Address23 High
    //---------------------------------------------------------------------
    class MAC_Address23_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address23_High_reg)

        function new(string name="MAC_Address23_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address23_High_reg

    //---------------------------------------------------------------------
    // MAC_Address23_Low  (0x83C, 32-bit, RW) MAC Address23 Low
    //---------------------------------------------------------------------
    class MAC_Address23_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address23_Low_reg)

        function new(string name="MAC_Address23_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address23_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address24_High  (0x840, 32-bit, RW) MAC Address24 High
    //---------------------------------------------------------------------
    class MAC_Address24_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address24_High_reg)

        function new(string name="MAC_Address24_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address24_High_reg

    //---------------------------------------------------------------------
    // MAC_Address24_Low  (0x844, 32-bit, RW) MAC Address24 Low
    //---------------------------------------------------------------------
    class MAC_Address24_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address24_Low_reg)

        function new(string name="MAC_Address24_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address24_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address25_High  (0x848, 32-bit, RW) MAC Address25 High
    //---------------------------------------------------------------------
    class MAC_Address25_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address25_High_reg)

        function new(string name="MAC_Address25_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address25_High_reg

    //---------------------------------------------------------------------
    // MAC_Address25_Low  (0x84C, 32-bit, RW) MAC Address25 Low
    //---------------------------------------------------------------------
    class MAC_Address25_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address25_Low_reg)

        function new(string name="MAC_Address25_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address25_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address26_High  (0x850, 32-bit, RW) MAC Address26 High
    //---------------------------------------------------------------------
    class MAC_Address26_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address26_High_reg)

        function new(string name="MAC_Address26_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address26_High_reg

    //---------------------------------------------------------------------
    // MAC_Address26_Low  (0x854, 32-bit, RW) MAC Address26 Low
    //---------------------------------------------------------------------
    class MAC_Address26_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address26_Low_reg)

        function new(string name="MAC_Address26_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address26_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address27_High  (0x858, 32-bit, RW) MAC Address27 High
    //---------------------------------------------------------------------
    class MAC_Address27_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address27_High_reg)

        function new(string name="MAC_Address27_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address27_High_reg

    //---------------------------------------------------------------------
    // MAC_Address27_Low  (0x85C, 32-bit, RW) MAC Address27 Low
    //---------------------------------------------------------------------
    class MAC_Address27_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address27_Low_reg)

        function new(string name="MAC_Address27_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address27_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address28_High  (0x860, 32-bit, RW) MAC Address28 High
    //---------------------------------------------------------------------
    class MAC_Address28_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address28_High_reg)

        function new(string name="MAC_Address28_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address28_High_reg

    //---------------------------------------------------------------------
    // MAC_Address28_Low  (0x864, 32-bit, RW) MAC Address28 Low
    //---------------------------------------------------------------------
    class MAC_Address28_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address28_Low_reg)

        function new(string name="MAC_Address28_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address28_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address29_High  (0x868, 32-bit, RW) MAC Address29 High
    //---------------------------------------------------------------------
    class MAC_Address29_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address29_High_reg)

        function new(string name="MAC_Address29_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address29_High_reg

    //---------------------------------------------------------------------
    // MAC_Address29_Low  (0x86C, 32-bit, RW) MAC Address29 Low
    //---------------------------------------------------------------------
    class MAC_Address29_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address29_Low_reg)

        function new(string name="MAC_Address29_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address29_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address30_High  (0x870, 32-bit, RW) MAC Address30 High
    //---------------------------------------------------------------------
    class MAC_Address30_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address30_High_reg)

        function new(string name="MAC_Address30_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address30_High_reg

    //---------------------------------------------------------------------
    // MAC_Address30_Low  (0x874, 32-bit, RW) MAC Address30 Low
    //---------------------------------------------------------------------
    class MAC_Address30_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address30_Low_reg)

        function new(string name="MAC_Address30_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address30_Low_reg

    //---------------------------------------------------------------------
    // MAC_Address31_High  (0x878, 32-bit, RW) MAC Address31 High
    //---------------------------------------------------------------------
    class MAC_Address31_High_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address31_High_reg)

        function new(string name="MAC_Address31_High_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address31_High_reg

    //---------------------------------------------------------------------
    // MAC_Address31_Low  (0x87C, 32-bit, RW) MAC Address31 Low
    //---------------------------------------------------------------------
    class MAC_Address31_Low_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MAC_Address31_Low_reg)

        function new(string name="MAC_Address31_Low_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MAC_Address31_Low_reg

    //---------------------------------------------------------------------
    // txbroadcastframes_g  (0x11C, 32-bit, RO) MMC/RMON counter txbroadcastframes_g
    //---------------------------------------------------------------------
    class txbroadcastframes_g_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(txbroadcastframes_g_reg)

        function new(string name="txbroadcastframes_g_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : txbroadcastframes_g_reg

    //---------------------------------------------------------------------
    // txmulticastframes_g  (0x120, 32-bit, RO) MMC/RMON counter txmulticastframes_g
    //---------------------------------------------------------------------
    class txmulticastframes_g_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(txmulticastframes_g_reg)

        function new(string name="txmulticastframes_g_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : txmulticastframes_g_reg

    //---------------------------------------------------------------------
    // txunderflowerror  (0x148, 32-bit, RO) MMC/RMON counter txunderflowerror
    //---------------------------------------------------------------------
    class txunderflowerror_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(txunderflowerror_reg)

        function new(string name="txunderflowerror_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : txunderflowerror_reg

    //---------------------------------------------------------------------
    // txsinglecol_g  (0x14C, 32-bit, RO) MMC/RMON counter txsinglecol_g
    //---------------------------------------------------------------------
    class txsinglecol_g_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(txsinglecol_g_reg)

        function new(string name="txsinglecol_g_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : txsinglecol_g_reg

    //---------------------------------------------------------------------
    // txmulticol_g  (0x150, 32-bit, RO) MMC/RMON counter txmulticol_g
    //---------------------------------------------------------------------
    class txmulticol_g_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(txmulticol_g_reg)

        function new(string name="txmulticol_g_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : txmulticol_g_reg

    //---------------------------------------------------------------------
    // txdeferred  (0x154, 32-bit, RO) MMC/RMON counter txdeferred
    //---------------------------------------------------------------------
    class txdeferred_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(txdeferred_reg)

        function new(string name="txdeferred_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : txdeferred_reg

    //---------------------------------------------------------------------
    // txlatecol  (0x158, 32-bit, RO) MMC/RMON counter txlatecol
    //---------------------------------------------------------------------
    class txlatecol_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(txlatecol_reg)

        function new(string name="txlatecol_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : txlatecol_reg

    //---------------------------------------------------------------------
    // txexesscol  (0x15C, 32-bit, RO) MMC/RMON counter txexesscol
    //---------------------------------------------------------------------
    class txexesscol_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(txexesscol_reg)

        function new(string name="txexesscol_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : txexesscol_reg

    //---------------------------------------------------------------------
    // txpauseframes  (0x170, 32-bit, RO) MMC/RMON counter txpauseframes
    //---------------------------------------------------------------------
    class txpauseframes_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(txpauseframes_reg)

        function new(string name="txpauseframes_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : txpauseframes_reg

    //---------------------------------------------------------------------
    // rxbroadcastframes_g  (0x18C, 32-bit, RO) MMC/RMON counter rxbroadcastframes_g
    //---------------------------------------------------------------------
    class rxbroadcastframes_g_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(rxbroadcastframes_g_reg)

        function new(string name="rxbroadcastframes_g_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : rxbroadcastframes_g_reg

    //---------------------------------------------------------------------
    // rxmulticastframes_g  (0x190, 32-bit, RO) MMC/RMON counter rxmulticastframes_g
    //---------------------------------------------------------------------
    class rxmulticastframes_g_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(rxmulticastframes_g_reg)

        function new(string name="rxmulticastframes_g_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : rxmulticastframes_g_reg

    //---------------------------------------------------------------------
    // rxrunterror  (0x19C, 32-bit, RO) MMC/RMON counter rxrunterror
    //---------------------------------------------------------------------
    class rxrunterror_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(rxrunterror_reg)

        function new(string name="rxrunterror_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : rxrunterror_reg

    //---------------------------------------------------------------------
    // rxjabbererror  (0x1A0, 32-bit, RO) MMC/RMON counter rxjabbererror
    //---------------------------------------------------------------------
    class rxjabbererror_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(rxjabbererror_reg)

        function new(string name="rxjabbererror_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : rxjabbererror_reg

    //---------------------------------------------------------------------
    // rxundersize_g  (0x1A4, 32-bit, RO) MMC/RMON counter rxundersize_g
    //---------------------------------------------------------------------
    class rxundersize_g_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(rxundersize_g_reg)

        function new(string name="rxundersize_g_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : rxundersize_g_reg

    //---------------------------------------------------------------------
    // rxoversize_g  (0x1A8, 32-bit, RO) MMC/RMON counter rxoversize_g
    //---------------------------------------------------------------------
    class rxoversize_g_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(rxoversize_g_reg)

        function new(string name="rxoversize_g_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : rxoversize_g_reg

    //---------------------------------------------------------------------
    // rxunicastframes_g  (0x1C4, 32-bit, RO) MMC/RMON counter rxunicastframes_g
    //---------------------------------------------------------------------
    class rxunicastframes_g_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(rxunicastframes_g_reg)

        function new(string name="rxunicastframes_g_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : rxunicastframes_g_reg

    //---------------------------------------------------------------------
    // rxpauseframes  (0x1D0, 32-bit, RO) MMC/RMON counter rxpauseframes
    //---------------------------------------------------------------------
    class rxpauseframes_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(rxpauseframes_reg)

        function new(string name="rxpauseframes_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : rxpauseframes_reg

    //---------------------------------------------------------------------
    // Bus_Mode  (0x1000, 32-bit, RW) DMA Bus_Mode
    //---------------------------------------------------------------------
    class Bus_Mode_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Bus_Mode_reg)

        function new(string name="Bus_Mode_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Bus_Mode_reg

    //---------------------------------------------------------------------
    // Tx_Poll_Demand  (0x1004, 32-bit, RW) DMA Tx_Poll_Demand
    //---------------------------------------------------------------------
    class Tx_Poll_Demand_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Tx_Poll_Demand_reg)

        function new(string name="Tx_Poll_Demand_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Tx_Poll_Demand_reg

    //---------------------------------------------------------------------
    // Rx_Poll_Demand  (0x1008, 32-bit, RW) DMA Rx_Poll_Demand
    //---------------------------------------------------------------------
    class Rx_Poll_Demand_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Rx_Poll_Demand_reg)

        function new(string name="Rx_Poll_Demand_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Rx_Poll_Demand_reg

    //---------------------------------------------------------------------
    // Rx_Descriptor_List_Address  (0x100C, 32-bit, RW) DMA Rx_Descriptor_List_Address
    //---------------------------------------------------------------------
    class Rx_Descriptor_List_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Rx_Descriptor_List_Address_reg)

        function new(string name="Rx_Descriptor_List_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Rx_Descriptor_List_Address_reg

    //---------------------------------------------------------------------
    // Tx_Descriptor_List_Address  (0x1010, 32-bit, RW) DMA Tx_Descriptor_List_Address
    //---------------------------------------------------------------------
    class Tx_Descriptor_List_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Tx_Descriptor_List_Address_reg)

        function new(string name="Tx_Descriptor_List_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Tx_Descriptor_List_Address_reg

    //---------------------------------------------------------------------
    // Status  (0x1014, 32-bit, RO) DMA Status
    //---------------------------------------------------------------------
    class Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Status_reg)

        function new(string name="Status_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Status_reg

    //---------------------------------------------------------------------
    // Operation_Mode  (0x1018, 32-bit, RW) DMA Operation_Mode
    //---------------------------------------------------------------------
    class Operation_Mode_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Operation_Mode_reg)

        function new(string name="Operation_Mode_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Operation_Mode_reg

    //---------------------------------------------------------------------
    // Interrupt_Enable  (0x101C, 32-bit, RW) DMA Interrupt_Enable
    //---------------------------------------------------------------------
    class Interrupt_Enable_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Interrupt_Enable_reg)

        function new(string name="Interrupt_Enable_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Interrupt_Enable_reg

    //---------------------------------------------------------------------
    // Missed_Frame_Buffer_Overflow_Counter  (0x1020, 32-bit, RO) DMA Missed_Frame_Buffer_Overflow_Counter
    //---------------------------------------------------------------------
    class Missed_Frame_Buffer_Overflow_Counter_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Missed_Frame_Buffer_Overflow_Counter_reg)

        function new(string name="Missed_Frame_Buffer_Overflow_Counter_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Missed_Frame_Buffer_Overflow_Counter_reg

    //---------------------------------------------------------------------
    // RIWT  (0x1024, 32-bit, RW) DMA RIWT
    //---------------------------------------------------------------------
    class RIWT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RIWT_reg)

        function new(string name="RIWT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RIWT_reg

    //---------------------------------------------------------------------
    // Current_Host_Tx_Descriptor  (0x1048, 32-bit, RO) DMA Current_Host_Tx_Descriptor
    //---------------------------------------------------------------------
    class Current_Host_Tx_Descriptor_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Current_Host_Tx_Descriptor_reg)

        function new(string name="Current_Host_Tx_Descriptor_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Current_Host_Tx_Descriptor_reg

    //---------------------------------------------------------------------
    // Current_Host_Rx_Descriptor  (0x104C, 32-bit, RO) DMA Current_Host_Rx_Descriptor
    //---------------------------------------------------------------------
    class Current_Host_Rx_Descriptor_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Current_Host_Rx_Descriptor_reg)

        function new(string name="Current_Host_Rx_Descriptor_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Current_Host_Rx_Descriptor_reg

    //---------------------------------------------------------------------
    // Current_Host_Tx_Buffer_Address  (0x1050, 32-bit, RO) DMA Current_Host_Tx_Buffer_Address
    //---------------------------------------------------------------------
    class Current_Host_Tx_Buffer_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Current_Host_Tx_Buffer_Address_reg)

        function new(string name="Current_Host_Tx_Buffer_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Current_Host_Tx_Buffer_Address_reg

    //---------------------------------------------------------------------
    // Current_Host_Rx_Buffer_Address  (0x1054, 32-bit, RO) DMA Current_Host_Rx_Buffer_Address
    //---------------------------------------------------------------------
    class Current_Host_Rx_Buffer_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Current_Host_Rx_Buffer_Address_reg)

        function new(string name="Current_Host_Rx_Buffer_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Current_Host_Rx_Buffer_Address_reg

    //---------------------------------------------------------------------
    // HW_Feature  (0x1058, 32-bit, RO) DMA HW_Feature
    //---------------------------------------------------------------------
    class HW_Feature_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(HW_Feature_reg)

        function new(string name="HW_Feature_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : HW_Feature_reg

    //---------------------------------------------------------------------
    // CRM_base_address  (0x105C, 32-bit, RW) DMA CRM_base_address
    //---------------------------------------------------------------------
    class CRM_base_address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CRM_base_address_reg)

        function new(string name="CRM_base_address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CRM_base_address_reg

    //---------------------------------------------------------------------
    // CRM_enable  (0x1060, 32-bit, RW) DMA CRM_enable
    //---------------------------------------------------------------------
    class CRM_enable_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CRM_enable_reg)

        function new(string name="CRM_enable_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CRM_enable_reg

    //---------------------------------------------------------------------
    // CRM_current_DMA_write_address  (0x1064, 32-bit, RW) DMA CRM_current_DMA_write_address
    //---------------------------------------------------------------------
    class CRM_current_DMA_write_address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CRM_current_DMA_write_address_reg)

        function new(string name="CRM_current_DMA_write_address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CRM_current_DMA_write_address_reg

    //---------------------------------------------------------------------
    // CRM_buffer_ceil_address  (0x1068, 32-bit, RW) DMA CRM_buffer_ceil_address
    //---------------------------------------------------------------------
    class CRM_buffer_ceil_address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CRM_buffer_ceil_address_reg)

        function new(string name="CRM_buffer_ceil_address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CRM_buffer_ceil_address_reg

    //---------------------------------------------------------------------
    // CRM_buffer_half_size  (0x106C, 32-bit, RW) DMA CRM_buffer_half_size
    //---------------------------------------------------------------------
    class CRM_buffer_half_size_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CRM_buffer_half_size_reg)

        function new(string name="CRM_buffer_half_size_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CRM_buffer_half_size_reg

    //---------------------------------------------------------------------
    // CRM_buffer_A_desc_start  (0x1070, 32-bit, RW) DMA CRM_buffer_A_desc_start
    //---------------------------------------------------------------------
    class CRM_buffer_A_desc_start_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CRM_buffer_A_desc_start_reg)

        function new(string name="CRM_buffer_A_desc_start_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CRM_buffer_A_desc_start_reg

    //---------------------------------------------------------------------
    // CRM_buffer_B_desc_start  (0x1074, 32-bit, RW) DMA CRM_buffer_B_desc_start
    //---------------------------------------------------------------------
    class CRM_buffer_B_desc_start_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CRM_buffer_B_desc_start_reg)

        function new(string name="CRM_buffer_B_desc_start_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CRM_buffer_B_desc_start_reg

    //---------------------------------------------------------------------
    // CRM_buffer_A_desc_end  (0x1078, 32-bit, RW) DMA CRM_buffer_A_desc_end
    //---------------------------------------------------------------------
    class CRM_buffer_A_desc_end_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CRM_buffer_A_desc_end_reg)

        function new(string name="CRM_buffer_A_desc_end_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CRM_buffer_A_desc_end_reg

    //---------------------------------------------------------------------
    // CRM_buffer_B_desc_end  (0x107C, 32-bit, RW) DMA CRM_buffer_B_desc_end
    //---------------------------------------------------------------------
    class CRM_buffer_B_desc_end_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CRM_buffer_B_desc_end_reg)

        function new(string name="CRM_buffer_B_desc_end_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CRM_buffer_B_desc_end_reg

    rand MAC_Configuration_reg MAC_Configuration;
    rand Frame_Filter_reg Frame_Filter;
    rand Hash_Table_High_reg Hash_Table_High;
    rand Hash_Table_Low_reg Hash_Table_Low;
    rand MII_Address_reg MII_Address;
    rand MII_Data_reg MII_Data;
    rand Flow_Control_reg Flow_Control;
    rand VLAN_Tag_reg VLAN_Tag;
    rand Version_reg Version;
    rand Debug_reg Debug;
    rand Remote_Wakeup_Frame_Filter_reg Remote_Wakeup_Frame_Filter;
    rand PMT_Control_Status_reg PMT_Control_Status;
    rand Interrupt_Status_reg Interrupt_Status;
    rand Interrupt_Mask_reg Interrupt_Mask;
    rand MAC_Address0_High_reg MAC_Address0_High;
    rand MAC_Address0_Low_reg MAC_Address0_Low;
    rand MAC_Address1_High_reg MAC_Address1_High;
    rand MAC_Address1_Low_reg MAC_Address1_Low;
    rand MAC_Address2_High_reg MAC_Address2_High;
    rand MAC_Address2_Low_reg MAC_Address2_Low;
    rand MAC_Address3_High_reg MAC_Address3_High;
    rand MAC_Address3_Low_reg MAC_Address3_Low;
    rand MAC_Address4_High_reg MAC_Address4_High;
    rand MAC_Address4_Low_reg MAC_Address4_Low;
    rand MAC_Address5_High_reg MAC_Address5_High;
    rand MAC_Address5_Low_reg MAC_Address5_Low;
    rand MAC_Address6_High_reg MAC_Address6_High;
    rand MAC_Address6_Low_reg MAC_Address6_Low;
    rand MAC_Address7_High_reg MAC_Address7_High;
    rand MAC_Address7_Low_reg MAC_Address7_Low;
    rand MAC_Address8_High_reg MAC_Address8_High;
    rand MAC_Address8_Low_reg MAC_Address8_Low;
    rand MAC_Address9_High_reg MAC_Address9_High;
    rand MAC_Address9_Low_reg MAC_Address9_Low;
    rand MAC_Address10_High_reg MAC_Address10_High;
    rand MAC_Address10_Low_reg MAC_Address10_Low;
    rand MAC_Address11_High_reg MAC_Address11_High;
    rand MAC_Address11_Low_reg MAC_Address11_Low;
    rand MAC_Address12_High_reg MAC_Address12_High;
    rand MAC_Address12_Low_reg MAC_Address12_Low;
    rand MAC_Address13_High_reg MAC_Address13_High;
    rand MAC_Address13_Low_reg MAC_Address13_Low;
    rand MAC_Address14_High_reg MAC_Address14_High;
    rand MAC_Address14_Low_reg MAC_Address14_Low;
    rand MAC_Address15_High_reg MAC_Address15_High;
    rand MAC_Address15_Low_reg MAC_Address15_Low;
    rand MAC_Address16_High_reg MAC_Address16_High;
    rand MAC_Address16_Low_reg MAC_Address16_Low;
    rand MAC_Address17_High_reg MAC_Address17_High;
    rand MAC_Address17_Low_reg MAC_Address17_Low;
    rand MAC_Address18_High_reg MAC_Address18_High;
    rand MAC_Address18_Low_reg MAC_Address18_Low;
    rand MAC_Address19_High_reg MAC_Address19_High;
    rand MAC_Address19_Low_reg MAC_Address19_Low;
    rand MAC_Address20_High_reg MAC_Address20_High;
    rand MAC_Address20_Low_reg MAC_Address20_Low;
    rand MAC_Address21_High_reg MAC_Address21_High;
    rand MAC_Address21_Low_reg MAC_Address21_Low;
    rand MAC_Address22_High_reg MAC_Address22_High;
    rand MAC_Address22_Low_reg MAC_Address22_Low;
    rand MAC_Address23_High_reg MAC_Address23_High;
    rand MAC_Address23_Low_reg MAC_Address23_Low;
    rand MAC_Address24_High_reg MAC_Address24_High;
    rand MAC_Address24_Low_reg MAC_Address24_Low;
    rand MAC_Address25_High_reg MAC_Address25_High;
    rand MAC_Address25_Low_reg MAC_Address25_Low;
    rand MAC_Address26_High_reg MAC_Address26_High;
    rand MAC_Address26_Low_reg MAC_Address26_Low;
    rand MAC_Address27_High_reg MAC_Address27_High;
    rand MAC_Address27_Low_reg MAC_Address27_Low;
    rand MAC_Address28_High_reg MAC_Address28_High;
    rand MAC_Address28_Low_reg MAC_Address28_Low;
    rand MAC_Address29_High_reg MAC_Address29_High;
    rand MAC_Address29_Low_reg MAC_Address29_Low;
    rand MAC_Address30_High_reg MAC_Address30_High;
    rand MAC_Address30_Low_reg MAC_Address30_Low;
    rand MAC_Address31_High_reg MAC_Address31_High;
    rand MAC_Address31_Low_reg MAC_Address31_Low;
    rand txbroadcastframes_g_reg txbroadcastframes_g;
    rand txmulticastframes_g_reg txmulticastframes_g;
    rand txunderflowerror_reg txunderflowerror;
    rand txsinglecol_g_reg txsinglecol_g;
    rand txmulticol_g_reg txmulticol_g;
    rand txdeferred_reg txdeferred;
    rand txlatecol_reg txlatecol;
    rand txexesscol_reg txexesscol;
    rand txpauseframes_reg txpauseframes;
    rand rxbroadcastframes_g_reg rxbroadcastframes_g;
    rand rxmulticastframes_g_reg rxmulticastframes_g;
    rand rxrunterror_reg rxrunterror;
    rand rxjabbererror_reg rxjabbererror;
    rand rxundersize_g_reg rxundersize_g;
    rand rxoversize_g_reg rxoversize_g;
    rand rxunicastframes_g_reg rxunicastframes_g;
    rand rxpauseframes_reg rxpauseframes;
    rand Bus_Mode_reg Bus_Mode;
    rand Tx_Poll_Demand_reg Tx_Poll_Demand;
    rand Rx_Poll_Demand_reg Rx_Poll_Demand;
    rand Rx_Descriptor_List_Address_reg Rx_Descriptor_List_Address;
    rand Tx_Descriptor_List_Address_reg Tx_Descriptor_List_Address;
    rand Status_reg Status;
    rand Operation_Mode_reg Operation_Mode;
    rand Interrupt_Enable_reg Interrupt_Enable;
    rand Missed_Frame_Buffer_Overflow_Counter_reg Missed_Frame_Buffer_Overflow_Counter;
    rand RIWT_reg RIWT;
    rand Current_Host_Tx_Descriptor_reg Current_Host_Tx_Descriptor;
    rand Current_Host_Rx_Descriptor_reg Current_Host_Rx_Descriptor;
    rand Current_Host_Tx_Buffer_Address_reg Current_Host_Tx_Buffer_Address;
    rand Current_Host_Rx_Buffer_Address_reg Current_Host_Rx_Buffer_Address;
    rand HW_Feature_reg HW_Feature;
    rand CRM_base_address_reg CRM_base_address;
    rand CRM_enable_reg CRM_enable;
    rand CRM_current_DMA_write_address_reg CRM_current_DMA_write_address;
    rand CRM_buffer_ceil_address_reg CRM_buffer_ceil_address;
    rand CRM_buffer_half_size_reg CRM_buffer_half_size;
    rand CRM_buffer_A_desc_start_reg CRM_buffer_A_desc_start;
    rand CRM_buffer_B_desc_start_reg CRM_buffer_B_desc_start;
    rand CRM_buffer_A_desc_end_reg CRM_buffer_A_desc_end;
    rand CRM_buffer_B_desc_end_reg CRM_buffer_B_desc_end;

    `uvm_object_utils(gmac_reg_block)

    function new(string name="gmac_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        MAC_Configuration = MAC_Configuration_reg::type_id::create("MAC_Configuration");
        MAC_Configuration.configure(this, null, "");
        MAC_Configuration.build();
        default_map.add_reg(MAC_Configuration, 'h0, "RW");
        MAC_Configuration.add_hdl_path_slice("MAC_Configuration", 0, 32, 0);

        Frame_Filter = Frame_Filter_reg::type_id::create("Frame_Filter");
        Frame_Filter.configure(this, null, "");
        Frame_Filter.build();
        default_map.add_reg(Frame_Filter, 'h4, "RW");
        Frame_Filter.add_hdl_path_slice("Frame_Filter", 0, 32, 0);

        Hash_Table_High = Hash_Table_High_reg::type_id::create("Hash_Table_High");
        Hash_Table_High.configure(this, null, "");
        Hash_Table_High.build();
        default_map.add_reg(Hash_Table_High, 'h8, "RW");
        Hash_Table_High.add_hdl_path_slice("Hash_Table_High", 0, 32, 0);

        Hash_Table_Low = Hash_Table_Low_reg::type_id::create("Hash_Table_Low");
        Hash_Table_Low.configure(this, null, "");
        Hash_Table_Low.build();
        default_map.add_reg(Hash_Table_Low, 'hC, "RW");
        Hash_Table_Low.add_hdl_path_slice("Hash_Table_Low", 0, 32, 0);

        MII_Address = MII_Address_reg::type_id::create("MII_Address");
        MII_Address.configure(this, null, "");
        MII_Address.build();
        default_map.add_reg(MII_Address, 'h10, "RW");
        MII_Address.add_hdl_path_slice("MII_Address", 0, 32, 0);

        MII_Data = MII_Data_reg::type_id::create("MII_Data");
        MII_Data.configure(this, null, "");
        MII_Data.build();
        default_map.add_reg(MII_Data, 'h14, "RW");
        MII_Data.add_hdl_path_slice("MII_Data", 0, 32, 0);

        Flow_Control = Flow_Control_reg::type_id::create("Flow_Control");
        Flow_Control.configure(this, null, "");
        Flow_Control.build();
        default_map.add_reg(Flow_Control, 'h18, "RW");
        Flow_Control.add_hdl_path_slice("Flow_Control", 0, 32, 0);

        VLAN_Tag = VLAN_Tag_reg::type_id::create("VLAN_Tag");
        VLAN_Tag.configure(this, null, "");
        VLAN_Tag.build();
        default_map.add_reg(VLAN_Tag, 'h1C, "RW");
        VLAN_Tag.add_hdl_path_slice("VLAN_Tag", 0, 32, 0);

        Version = Version_reg::type_id::create("Version");
        Version.configure(this, null, "");
        Version.build();
        default_map.add_reg(Version, 'h20, "RO");
        Version.add_hdl_path_slice("Version", 0, 32, 0);

        Debug = Debug_reg::type_id::create("Debug");
        Debug.configure(this, null, "");
        Debug.build();
        default_map.add_reg(Debug, 'h24, "RW");
        Debug.add_hdl_path_slice("Debug", 0, 32, 0);

        Remote_Wakeup_Frame_Filter = Remote_Wakeup_Frame_Filter_reg::type_id::create("Remote_Wakeup_Frame_Filter");
        Remote_Wakeup_Frame_Filter.configure(this, null, "");
        Remote_Wakeup_Frame_Filter.build();
        default_map.add_reg(Remote_Wakeup_Frame_Filter, 'h28, "RW");
        Remote_Wakeup_Frame_Filter.add_hdl_path_slice("Remote_Wakeup_Frame_Filter", 0, 32, 0);

        PMT_Control_Status = PMT_Control_Status_reg::type_id::create("PMT_Control_Status");
        PMT_Control_Status.configure(this, null, "");
        PMT_Control_Status.build();
        default_map.add_reg(PMT_Control_Status, 'h2C, "RW");
        PMT_Control_Status.add_hdl_path_slice("PMT_Control_Status", 0, 32, 0);

        Interrupt_Status = Interrupt_Status_reg::type_id::create("Interrupt_Status");
        Interrupt_Status.configure(this, null, "");
        Interrupt_Status.build();
        default_map.add_reg(Interrupt_Status, 'h38, "RO");
        Interrupt_Status.add_hdl_path_slice("Interrupt_Status", 0, 32, 0);

        Interrupt_Mask = Interrupt_Mask_reg::type_id::create("Interrupt_Mask");
        Interrupt_Mask.configure(this, null, "");
        Interrupt_Mask.build();
        default_map.add_reg(Interrupt_Mask, 'h3C, "RW");
        Interrupt_Mask.add_hdl_path_slice("Interrupt_Mask", 0, 32, 0);

        MAC_Address0_High = MAC_Address0_High_reg::type_id::create("MAC_Address0_High");
        MAC_Address0_High.configure(this, null, "");
        MAC_Address0_High.build();
        default_map.add_reg(MAC_Address0_High, 'h40, "RW");
        MAC_Address0_High.add_hdl_path_slice("MAC_Address0_High", 0, 32, 0);

        MAC_Address0_Low = MAC_Address0_Low_reg::type_id::create("MAC_Address0_Low");
        MAC_Address0_Low.configure(this, null, "");
        MAC_Address0_Low.build();
        default_map.add_reg(MAC_Address0_Low, 'h44, "RW");
        MAC_Address0_Low.add_hdl_path_slice("MAC_Address0_Low", 0, 32, 0);

        MAC_Address1_High = MAC_Address1_High_reg::type_id::create("MAC_Address1_High");
        MAC_Address1_High.configure(this, null, "");
        MAC_Address1_High.build();
        default_map.add_reg(MAC_Address1_High, 'h48, "RW");
        MAC_Address1_High.add_hdl_path_slice("MAC_Address1_High", 0, 32, 0);

        MAC_Address1_Low = MAC_Address1_Low_reg::type_id::create("MAC_Address1_Low");
        MAC_Address1_Low.configure(this, null, "");
        MAC_Address1_Low.build();
        default_map.add_reg(MAC_Address1_Low, 'h4C, "RW");
        MAC_Address1_Low.add_hdl_path_slice("MAC_Address1_Low", 0, 32, 0);

        MAC_Address2_High = MAC_Address2_High_reg::type_id::create("MAC_Address2_High");
        MAC_Address2_High.configure(this, null, "");
        MAC_Address2_High.build();
        default_map.add_reg(MAC_Address2_High, 'h50, "RW");
        MAC_Address2_High.add_hdl_path_slice("MAC_Address2_High", 0, 32, 0);

        MAC_Address2_Low = MAC_Address2_Low_reg::type_id::create("MAC_Address2_Low");
        MAC_Address2_Low.configure(this, null, "");
        MAC_Address2_Low.build();
        default_map.add_reg(MAC_Address2_Low, 'h54, "RW");
        MAC_Address2_Low.add_hdl_path_slice("MAC_Address2_Low", 0, 32, 0);

        MAC_Address3_High = MAC_Address3_High_reg::type_id::create("MAC_Address3_High");
        MAC_Address3_High.configure(this, null, "");
        MAC_Address3_High.build();
        default_map.add_reg(MAC_Address3_High, 'h58, "RW");
        MAC_Address3_High.add_hdl_path_slice("MAC_Address3_High", 0, 32, 0);

        MAC_Address3_Low = MAC_Address3_Low_reg::type_id::create("MAC_Address3_Low");
        MAC_Address3_Low.configure(this, null, "");
        MAC_Address3_Low.build();
        default_map.add_reg(MAC_Address3_Low, 'h5C, "RW");
        MAC_Address3_Low.add_hdl_path_slice("MAC_Address3_Low", 0, 32, 0);

        MAC_Address4_High = MAC_Address4_High_reg::type_id::create("MAC_Address4_High");
        MAC_Address4_High.configure(this, null, "");
        MAC_Address4_High.build();
        default_map.add_reg(MAC_Address4_High, 'h60, "RW");
        MAC_Address4_High.add_hdl_path_slice("MAC_Address4_High", 0, 32, 0);

        MAC_Address4_Low = MAC_Address4_Low_reg::type_id::create("MAC_Address4_Low");
        MAC_Address4_Low.configure(this, null, "");
        MAC_Address4_Low.build();
        default_map.add_reg(MAC_Address4_Low, 'h64, "RW");
        MAC_Address4_Low.add_hdl_path_slice("MAC_Address4_Low", 0, 32, 0);

        MAC_Address5_High = MAC_Address5_High_reg::type_id::create("MAC_Address5_High");
        MAC_Address5_High.configure(this, null, "");
        MAC_Address5_High.build();
        default_map.add_reg(MAC_Address5_High, 'h68, "RW");
        MAC_Address5_High.add_hdl_path_slice("MAC_Address5_High", 0, 32, 0);

        MAC_Address5_Low = MAC_Address5_Low_reg::type_id::create("MAC_Address5_Low");
        MAC_Address5_Low.configure(this, null, "");
        MAC_Address5_Low.build();
        default_map.add_reg(MAC_Address5_Low, 'h6C, "RW");
        MAC_Address5_Low.add_hdl_path_slice("MAC_Address5_Low", 0, 32, 0);

        MAC_Address6_High = MAC_Address6_High_reg::type_id::create("MAC_Address6_High");
        MAC_Address6_High.configure(this, null, "");
        MAC_Address6_High.build();
        default_map.add_reg(MAC_Address6_High, 'h70, "RW");
        MAC_Address6_High.add_hdl_path_slice("MAC_Address6_High", 0, 32, 0);

        MAC_Address6_Low = MAC_Address6_Low_reg::type_id::create("MAC_Address6_Low");
        MAC_Address6_Low.configure(this, null, "");
        MAC_Address6_Low.build();
        default_map.add_reg(MAC_Address6_Low, 'h74, "RW");
        MAC_Address6_Low.add_hdl_path_slice("MAC_Address6_Low", 0, 32, 0);

        MAC_Address7_High = MAC_Address7_High_reg::type_id::create("MAC_Address7_High");
        MAC_Address7_High.configure(this, null, "");
        MAC_Address7_High.build();
        default_map.add_reg(MAC_Address7_High, 'h78, "RW");
        MAC_Address7_High.add_hdl_path_slice("MAC_Address7_High", 0, 32, 0);

        MAC_Address7_Low = MAC_Address7_Low_reg::type_id::create("MAC_Address7_Low");
        MAC_Address7_Low.configure(this, null, "");
        MAC_Address7_Low.build();
        default_map.add_reg(MAC_Address7_Low, 'h7C, "RW");
        MAC_Address7_Low.add_hdl_path_slice("MAC_Address7_Low", 0, 32, 0);

        MAC_Address8_High = MAC_Address8_High_reg::type_id::create("MAC_Address8_High");
        MAC_Address8_High.configure(this, null, "");
        MAC_Address8_High.build();
        default_map.add_reg(MAC_Address8_High, 'h80, "RW");
        MAC_Address8_High.add_hdl_path_slice("MAC_Address8_High", 0, 32, 0);

        MAC_Address8_Low = MAC_Address8_Low_reg::type_id::create("MAC_Address8_Low");
        MAC_Address8_Low.configure(this, null, "");
        MAC_Address8_Low.build();
        default_map.add_reg(MAC_Address8_Low, 'h84, "RW");
        MAC_Address8_Low.add_hdl_path_slice("MAC_Address8_Low", 0, 32, 0);

        MAC_Address9_High = MAC_Address9_High_reg::type_id::create("MAC_Address9_High");
        MAC_Address9_High.configure(this, null, "");
        MAC_Address9_High.build();
        default_map.add_reg(MAC_Address9_High, 'h88, "RW");
        MAC_Address9_High.add_hdl_path_slice("MAC_Address9_High", 0, 32, 0);

        MAC_Address9_Low = MAC_Address9_Low_reg::type_id::create("MAC_Address9_Low");
        MAC_Address9_Low.configure(this, null, "");
        MAC_Address9_Low.build();
        default_map.add_reg(MAC_Address9_Low, 'h8C, "RW");
        MAC_Address9_Low.add_hdl_path_slice("MAC_Address9_Low", 0, 32, 0);

        MAC_Address10_High = MAC_Address10_High_reg::type_id::create("MAC_Address10_High");
        MAC_Address10_High.configure(this, null, "");
        MAC_Address10_High.build();
        default_map.add_reg(MAC_Address10_High, 'h90, "RW");
        MAC_Address10_High.add_hdl_path_slice("MAC_Address10_High", 0, 32, 0);

        MAC_Address10_Low = MAC_Address10_Low_reg::type_id::create("MAC_Address10_Low");
        MAC_Address10_Low.configure(this, null, "");
        MAC_Address10_Low.build();
        default_map.add_reg(MAC_Address10_Low, 'h94, "RW");
        MAC_Address10_Low.add_hdl_path_slice("MAC_Address10_Low", 0, 32, 0);

        MAC_Address11_High = MAC_Address11_High_reg::type_id::create("MAC_Address11_High");
        MAC_Address11_High.configure(this, null, "");
        MAC_Address11_High.build();
        default_map.add_reg(MAC_Address11_High, 'h98, "RW");
        MAC_Address11_High.add_hdl_path_slice("MAC_Address11_High", 0, 32, 0);

        MAC_Address11_Low = MAC_Address11_Low_reg::type_id::create("MAC_Address11_Low");
        MAC_Address11_Low.configure(this, null, "");
        MAC_Address11_Low.build();
        default_map.add_reg(MAC_Address11_Low, 'h9C, "RW");
        MAC_Address11_Low.add_hdl_path_slice("MAC_Address11_Low", 0, 32, 0);

        MAC_Address12_High = MAC_Address12_High_reg::type_id::create("MAC_Address12_High");
        MAC_Address12_High.configure(this, null, "");
        MAC_Address12_High.build();
        default_map.add_reg(MAC_Address12_High, 'hA0, "RW");
        MAC_Address12_High.add_hdl_path_slice("MAC_Address12_High", 0, 32, 0);

        MAC_Address12_Low = MAC_Address12_Low_reg::type_id::create("MAC_Address12_Low");
        MAC_Address12_Low.configure(this, null, "");
        MAC_Address12_Low.build();
        default_map.add_reg(MAC_Address12_Low, 'hA4, "RW");
        MAC_Address12_Low.add_hdl_path_slice("MAC_Address12_Low", 0, 32, 0);

        MAC_Address13_High = MAC_Address13_High_reg::type_id::create("MAC_Address13_High");
        MAC_Address13_High.configure(this, null, "");
        MAC_Address13_High.build();
        default_map.add_reg(MAC_Address13_High, 'hA8, "RW");
        MAC_Address13_High.add_hdl_path_slice("MAC_Address13_High", 0, 32, 0);

        MAC_Address13_Low = MAC_Address13_Low_reg::type_id::create("MAC_Address13_Low");
        MAC_Address13_Low.configure(this, null, "");
        MAC_Address13_Low.build();
        default_map.add_reg(MAC_Address13_Low, 'hAC, "RW");
        MAC_Address13_Low.add_hdl_path_slice("MAC_Address13_Low", 0, 32, 0);

        MAC_Address14_High = MAC_Address14_High_reg::type_id::create("MAC_Address14_High");
        MAC_Address14_High.configure(this, null, "");
        MAC_Address14_High.build();
        default_map.add_reg(MAC_Address14_High, 'hB0, "RW");
        MAC_Address14_High.add_hdl_path_slice("MAC_Address14_High", 0, 32, 0);

        MAC_Address14_Low = MAC_Address14_Low_reg::type_id::create("MAC_Address14_Low");
        MAC_Address14_Low.configure(this, null, "");
        MAC_Address14_Low.build();
        default_map.add_reg(MAC_Address14_Low, 'hB4, "RW");
        MAC_Address14_Low.add_hdl_path_slice("MAC_Address14_Low", 0, 32, 0);

        MAC_Address15_High = MAC_Address15_High_reg::type_id::create("MAC_Address15_High");
        MAC_Address15_High.configure(this, null, "");
        MAC_Address15_High.build();
        default_map.add_reg(MAC_Address15_High, 'hB8, "RW");
        MAC_Address15_High.add_hdl_path_slice("MAC_Address15_High", 0, 32, 0);

        MAC_Address15_Low = MAC_Address15_Low_reg::type_id::create("MAC_Address15_Low");
        MAC_Address15_Low.configure(this, null, "");
        MAC_Address15_Low.build();
        default_map.add_reg(MAC_Address15_Low, 'hBC, "RW");
        MAC_Address15_Low.add_hdl_path_slice("MAC_Address15_Low", 0, 32, 0);

        MAC_Address16_High = MAC_Address16_High_reg::type_id::create("MAC_Address16_High");
        MAC_Address16_High.configure(this, null, "");
        MAC_Address16_High.build();
        default_map.add_reg(MAC_Address16_High, 'h800, "RW");
        MAC_Address16_High.add_hdl_path_slice("MAC_Address16_High", 0, 32, 0);

        MAC_Address16_Low = MAC_Address16_Low_reg::type_id::create("MAC_Address16_Low");
        MAC_Address16_Low.configure(this, null, "");
        MAC_Address16_Low.build();
        default_map.add_reg(MAC_Address16_Low, 'h804, "RW");
        MAC_Address16_Low.add_hdl_path_slice("MAC_Address16_Low", 0, 32, 0);

        MAC_Address17_High = MAC_Address17_High_reg::type_id::create("MAC_Address17_High");
        MAC_Address17_High.configure(this, null, "");
        MAC_Address17_High.build();
        default_map.add_reg(MAC_Address17_High, 'h808, "RW");
        MAC_Address17_High.add_hdl_path_slice("MAC_Address17_High", 0, 32, 0);

        MAC_Address17_Low = MAC_Address17_Low_reg::type_id::create("MAC_Address17_Low");
        MAC_Address17_Low.configure(this, null, "");
        MAC_Address17_Low.build();
        default_map.add_reg(MAC_Address17_Low, 'h80C, "RW");
        MAC_Address17_Low.add_hdl_path_slice("MAC_Address17_Low", 0, 32, 0);

        MAC_Address18_High = MAC_Address18_High_reg::type_id::create("MAC_Address18_High");
        MAC_Address18_High.configure(this, null, "");
        MAC_Address18_High.build();
        default_map.add_reg(MAC_Address18_High, 'h810, "RW");
        MAC_Address18_High.add_hdl_path_slice("MAC_Address18_High", 0, 32, 0);

        MAC_Address18_Low = MAC_Address18_Low_reg::type_id::create("MAC_Address18_Low");
        MAC_Address18_Low.configure(this, null, "");
        MAC_Address18_Low.build();
        default_map.add_reg(MAC_Address18_Low, 'h814, "RW");
        MAC_Address18_Low.add_hdl_path_slice("MAC_Address18_Low", 0, 32, 0);

        MAC_Address19_High = MAC_Address19_High_reg::type_id::create("MAC_Address19_High");
        MAC_Address19_High.configure(this, null, "");
        MAC_Address19_High.build();
        default_map.add_reg(MAC_Address19_High, 'h818, "RW");
        MAC_Address19_High.add_hdl_path_slice("MAC_Address19_High", 0, 32, 0);

        MAC_Address19_Low = MAC_Address19_Low_reg::type_id::create("MAC_Address19_Low");
        MAC_Address19_Low.configure(this, null, "");
        MAC_Address19_Low.build();
        default_map.add_reg(MAC_Address19_Low, 'h81C, "RW");
        MAC_Address19_Low.add_hdl_path_slice("MAC_Address19_Low", 0, 32, 0);

        MAC_Address20_High = MAC_Address20_High_reg::type_id::create("MAC_Address20_High");
        MAC_Address20_High.configure(this, null, "");
        MAC_Address20_High.build();
        default_map.add_reg(MAC_Address20_High, 'h820, "RW");
        MAC_Address20_High.add_hdl_path_slice("MAC_Address20_High", 0, 32, 0);

        MAC_Address20_Low = MAC_Address20_Low_reg::type_id::create("MAC_Address20_Low");
        MAC_Address20_Low.configure(this, null, "");
        MAC_Address20_Low.build();
        default_map.add_reg(MAC_Address20_Low, 'h824, "RW");
        MAC_Address20_Low.add_hdl_path_slice("MAC_Address20_Low", 0, 32, 0);

        MAC_Address21_High = MAC_Address21_High_reg::type_id::create("MAC_Address21_High");
        MAC_Address21_High.configure(this, null, "");
        MAC_Address21_High.build();
        default_map.add_reg(MAC_Address21_High, 'h828, "RW");
        MAC_Address21_High.add_hdl_path_slice("MAC_Address21_High", 0, 32, 0);

        MAC_Address21_Low = MAC_Address21_Low_reg::type_id::create("MAC_Address21_Low");
        MAC_Address21_Low.configure(this, null, "");
        MAC_Address21_Low.build();
        default_map.add_reg(MAC_Address21_Low, 'h82C, "RW");
        MAC_Address21_Low.add_hdl_path_slice("MAC_Address21_Low", 0, 32, 0);

        MAC_Address22_High = MAC_Address22_High_reg::type_id::create("MAC_Address22_High");
        MAC_Address22_High.configure(this, null, "");
        MAC_Address22_High.build();
        default_map.add_reg(MAC_Address22_High, 'h830, "RW");
        MAC_Address22_High.add_hdl_path_slice("MAC_Address22_High", 0, 32, 0);

        MAC_Address22_Low = MAC_Address22_Low_reg::type_id::create("MAC_Address22_Low");
        MAC_Address22_Low.configure(this, null, "");
        MAC_Address22_Low.build();
        default_map.add_reg(MAC_Address22_Low, 'h834, "RW");
        MAC_Address22_Low.add_hdl_path_slice("MAC_Address22_Low", 0, 32, 0);

        MAC_Address23_High = MAC_Address23_High_reg::type_id::create("MAC_Address23_High");
        MAC_Address23_High.configure(this, null, "");
        MAC_Address23_High.build();
        default_map.add_reg(MAC_Address23_High, 'h838, "RW");
        MAC_Address23_High.add_hdl_path_slice("MAC_Address23_High", 0, 32, 0);

        MAC_Address23_Low = MAC_Address23_Low_reg::type_id::create("MAC_Address23_Low");
        MAC_Address23_Low.configure(this, null, "");
        MAC_Address23_Low.build();
        default_map.add_reg(MAC_Address23_Low, 'h83C, "RW");
        MAC_Address23_Low.add_hdl_path_slice("MAC_Address23_Low", 0, 32, 0);

        MAC_Address24_High = MAC_Address24_High_reg::type_id::create("MAC_Address24_High");
        MAC_Address24_High.configure(this, null, "");
        MAC_Address24_High.build();
        default_map.add_reg(MAC_Address24_High, 'h840, "RW");
        MAC_Address24_High.add_hdl_path_slice("MAC_Address24_High", 0, 32, 0);

        MAC_Address24_Low = MAC_Address24_Low_reg::type_id::create("MAC_Address24_Low");
        MAC_Address24_Low.configure(this, null, "");
        MAC_Address24_Low.build();
        default_map.add_reg(MAC_Address24_Low, 'h844, "RW");
        MAC_Address24_Low.add_hdl_path_slice("MAC_Address24_Low", 0, 32, 0);

        MAC_Address25_High = MAC_Address25_High_reg::type_id::create("MAC_Address25_High");
        MAC_Address25_High.configure(this, null, "");
        MAC_Address25_High.build();
        default_map.add_reg(MAC_Address25_High, 'h848, "RW");
        MAC_Address25_High.add_hdl_path_slice("MAC_Address25_High", 0, 32, 0);

        MAC_Address25_Low = MAC_Address25_Low_reg::type_id::create("MAC_Address25_Low");
        MAC_Address25_Low.configure(this, null, "");
        MAC_Address25_Low.build();
        default_map.add_reg(MAC_Address25_Low, 'h84C, "RW");
        MAC_Address25_Low.add_hdl_path_slice("MAC_Address25_Low", 0, 32, 0);

        MAC_Address26_High = MAC_Address26_High_reg::type_id::create("MAC_Address26_High");
        MAC_Address26_High.configure(this, null, "");
        MAC_Address26_High.build();
        default_map.add_reg(MAC_Address26_High, 'h850, "RW");
        MAC_Address26_High.add_hdl_path_slice("MAC_Address26_High", 0, 32, 0);

        MAC_Address26_Low = MAC_Address26_Low_reg::type_id::create("MAC_Address26_Low");
        MAC_Address26_Low.configure(this, null, "");
        MAC_Address26_Low.build();
        default_map.add_reg(MAC_Address26_Low, 'h854, "RW");
        MAC_Address26_Low.add_hdl_path_slice("MAC_Address26_Low", 0, 32, 0);

        MAC_Address27_High = MAC_Address27_High_reg::type_id::create("MAC_Address27_High");
        MAC_Address27_High.configure(this, null, "");
        MAC_Address27_High.build();
        default_map.add_reg(MAC_Address27_High, 'h858, "RW");
        MAC_Address27_High.add_hdl_path_slice("MAC_Address27_High", 0, 32, 0);

        MAC_Address27_Low = MAC_Address27_Low_reg::type_id::create("MAC_Address27_Low");
        MAC_Address27_Low.configure(this, null, "");
        MAC_Address27_Low.build();
        default_map.add_reg(MAC_Address27_Low, 'h85C, "RW");
        MAC_Address27_Low.add_hdl_path_slice("MAC_Address27_Low", 0, 32, 0);

        MAC_Address28_High = MAC_Address28_High_reg::type_id::create("MAC_Address28_High");
        MAC_Address28_High.configure(this, null, "");
        MAC_Address28_High.build();
        default_map.add_reg(MAC_Address28_High, 'h860, "RW");
        MAC_Address28_High.add_hdl_path_slice("MAC_Address28_High", 0, 32, 0);

        MAC_Address28_Low = MAC_Address28_Low_reg::type_id::create("MAC_Address28_Low");
        MAC_Address28_Low.configure(this, null, "");
        MAC_Address28_Low.build();
        default_map.add_reg(MAC_Address28_Low, 'h864, "RW");
        MAC_Address28_Low.add_hdl_path_slice("MAC_Address28_Low", 0, 32, 0);

        MAC_Address29_High = MAC_Address29_High_reg::type_id::create("MAC_Address29_High");
        MAC_Address29_High.configure(this, null, "");
        MAC_Address29_High.build();
        default_map.add_reg(MAC_Address29_High, 'h868, "RW");
        MAC_Address29_High.add_hdl_path_slice("MAC_Address29_High", 0, 32, 0);

        MAC_Address29_Low = MAC_Address29_Low_reg::type_id::create("MAC_Address29_Low");
        MAC_Address29_Low.configure(this, null, "");
        MAC_Address29_Low.build();
        default_map.add_reg(MAC_Address29_Low, 'h86C, "RW");
        MAC_Address29_Low.add_hdl_path_slice("MAC_Address29_Low", 0, 32, 0);

        MAC_Address30_High = MAC_Address30_High_reg::type_id::create("MAC_Address30_High");
        MAC_Address30_High.configure(this, null, "");
        MAC_Address30_High.build();
        default_map.add_reg(MAC_Address30_High, 'h870, "RW");
        MAC_Address30_High.add_hdl_path_slice("MAC_Address30_High", 0, 32, 0);

        MAC_Address30_Low = MAC_Address30_Low_reg::type_id::create("MAC_Address30_Low");
        MAC_Address30_Low.configure(this, null, "");
        MAC_Address30_Low.build();
        default_map.add_reg(MAC_Address30_Low, 'h874, "RW");
        MAC_Address30_Low.add_hdl_path_slice("MAC_Address30_Low", 0, 32, 0);

        MAC_Address31_High = MAC_Address31_High_reg::type_id::create("MAC_Address31_High");
        MAC_Address31_High.configure(this, null, "");
        MAC_Address31_High.build();
        default_map.add_reg(MAC_Address31_High, 'h878, "RW");
        MAC_Address31_High.add_hdl_path_slice("MAC_Address31_High", 0, 32, 0);

        MAC_Address31_Low = MAC_Address31_Low_reg::type_id::create("MAC_Address31_Low");
        MAC_Address31_Low.configure(this, null, "");
        MAC_Address31_Low.build();
        default_map.add_reg(MAC_Address31_Low, 'h87C, "RW");
        MAC_Address31_Low.add_hdl_path_slice("MAC_Address31_Low", 0, 32, 0);

        txbroadcastframes_g = txbroadcastframes_g_reg::type_id::create("txbroadcastframes_g");
        txbroadcastframes_g.configure(this, null, "");
        txbroadcastframes_g.build();
        default_map.add_reg(txbroadcastframes_g, 'h11C, "RO");
        txbroadcastframes_g.add_hdl_path_slice("txbroadcastframes_g", 0, 32, 0);

        txmulticastframes_g = txmulticastframes_g_reg::type_id::create("txmulticastframes_g");
        txmulticastframes_g.configure(this, null, "");
        txmulticastframes_g.build();
        default_map.add_reg(txmulticastframes_g, 'h120, "RO");
        txmulticastframes_g.add_hdl_path_slice("txmulticastframes_g", 0, 32, 0);

        txunderflowerror = txunderflowerror_reg::type_id::create("txunderflowerror");
        txunderflowerror.configure(this, null, "");
        txunderflowerror.build();
        default_map.add_reg(txunderflowerror, 'h148, "RO");
        txunderflowerror.add_hdl_path_slice("txunderflowerror", 0, 32, 0);

        txsinglecol_g = txsinglecol_g_reg::type_id::create("txsinglecol_g");
        txsinglecol_g.configure(this, null, "");
        txsinglecol_g.build();
        default_map.add_reg(txsinglecol_g, 'h14C, "RO");
        txsinglecol_g.add_hdl_path_slice("txsinglecol_g", 0, 32, 0);

        txmulticol_g = txmulticol_g_reg::type_id::create("txmulticol_g");
        txmulticol_g.configure(this, null, "");
        txmulticol_g.build();
        default_map.add_reg(txmulticol_g, 'h150, "RO");
        txmulticol_g.add_hdl_path_slice("txmulticol_g", 0, 32, 0);

        txdeferred = txdeferred_reg::type_id::create("txdeferred");
        txdeferred.configure(this, null, "");
        txdeferred.build();
        default_map.add_reg(txdeferred, 'h154, "RO");
        txdeferred.add_hdl_path_slice("txdeferred", 0, 32, 0);

        txlatecol = txlatecol_reg::type_id::create("txlatecol");
        txlatecol.configure(this, null, "");
        txlatecol.build();
        default_map.add_reg(txlatecol, 'h158, "RO");
        txlatecol.add_hdl_path_slice("txlatecol", 0, 32, 0);

        txexesscol = txexesscol_reg::type_id::create("txexesscol");
        txexesscol.configure(this, null, "");
        txexesscol.build();
        default_map.add_reg(txexesscol, 'h15C, "RO");
        txexesscol.add_hdl_path_slice("txexesscol", 0, 32, 0);

        txpauseframes = txpauseframes_reg::type_id::create("txpauseframes");
        txpauseframes.configure(this, null, "");
        txpauseframes.build();
        default_map.add_reg(txpauseframes, 'h170, "RO");
        txpauseframes.add_hdl_path_slice("txpauseframes", 0, 32, 0);

        rxbroadcastframes_g = rxbroadcastframes_g_reg::type_id::create("rxbroadcastframes_g");
        rxbroadcastframes_g.configure(this, null, "");
        rxbroadcastframes_g.build();
        default_map.add_reg(rxbroadcastframes_g, 'h18C, "RO");
        rxbroadcastframes_g.add_hdl_path_slice("rxbroadcastframes_g", 0, 32, 0);

        rxmulticastframes_g = rxmulticastframes_g_reg::type_id::create("rxmulticastframes_g");
        rxmulticastframes_g.configure(this, null, "");
        rxmulticastframes_g.build();
        default_map.add_reg(rxmulticastframes_g, 'h190, "RO");
        rxmulticastframes_g.add_hdl_path_slice("rxmulticastframes_g", 0, 32, 0);

        rxrunterror = rxrunterror_reg::type_id::create("rxrunterror");
        rxrunterror.configure(this, null, "");
        rxrunterror.build();
        default_map.add_reg(rxrunterror, 'h19C, "RO");
        rxrunterror.add_hdl_path_slice("rxrunterror", 0, 32, 0);

        rxjabbererror = rxjabbererror_reg::type_id::create("rxjabbererror");
        rxjabbererror.configure(this, null, "");
        rxjabbererror.build();
        default_map.add_reg(rxjabbererror, 'h1A0, "RO");
        rxjabbererror.add_hdl_path_slice("rxjabbererror", 0, 32, 0);

        rxundersize_g = rxundersize_g_reg::type_id::create("rxundersize_g");
        rxundersize_g.configure(this, null, "");
        rxundersize_g.build();
        default_map.add_reg(rxundersize_g, 'h1A4, "RO");
        rxundersize_g.add_hdl_path_slice("rxundersize_g", 0, 32, 0);

        rxoversize_g = rxoversize_g_reg::type_id::create("rxoversize_g");
        rxoversize_g.configure(this, null, "");
        rxoversize_g.build();
        default_map.add_reg(rxoversize_g, 'h1A8, "RO");
        rxoversize_g.add_hdl_path_slice("rxoversize_g", 0, 32, 0);

        rxunicastframes_g = rxunicastframes_g_reg::type_id::create("rxunicastframes_g");
        rxunicastframes_g.configure(this, null, "");
        rxunicastframes_g.build();
        default_map.add_reg(rxunicastframes_g, 'h1C4, "RO");
        rxunicastframes_g.add_hdl_path_slice("rxunicastframes_g", 0, 32, 0);

        rxpauseframes = rxpauseframes_reg::type_id::create("rxpauseframes");
        rxpauseframes.configure(this, null, "");
        rxpauseframes.build();
        default_map.add_reg(rxpauseframes, 'h1D0, "RO");
        rxpauseframes.add_hdl_path_slice("rxpauseframes", 0, 32, 0);

        Bus_Mode = Bus_Mode_reg::type_id::create("Bus_Mode");
        Bus_Mode.configure(this, null, "");
        Bus_Mode.build();
        default_map.add_reg(Bus_Mode, 'h1000, "RW");
        Bus_Mode.add_hdl_path_slice("Bus_Mode", 0, 32, 0);

        Tx_Poll_Demand = Tx_Poll_Demand_reg::type_id::create("Tx_Poll_Demand");
        Tx_Poll_Demand.configure(this, null, "");
        Tx_Poll_Demand.build();
        default_map.add_reg(Tx_Poll_Demand, 'h1004, "RW");
        Tx_Poll_Demand.add_hdl_path_slice("Tx_Poll_Demand", 0, 32, 0);

        Rx_Poll_Demand = Rx_Poll_Demand_reg::type_id::create("Rx_Poll_Demand");
        Rx_Poll_Demand.configure(this, null, "");
        Rx_Poll_Demand.build();
        default_map.add_reg(Rx_Poll_Demand, 'h1008, "RW");
        Rx_Poll_Demand.add_hdl_path_slice("Rx_Poll_Demand", 0, 32, 0);

        Rx_Descriptor_List_Address = Rx_Descriptor_List_Address_reg::type_id::create("Rx_Descriptor_List_Address");
        Rx_Descriptor_List_Address.configure(this, null, "");
        Rx_Descriptor_List_Address.build();
        default_map.add_reg(Rx_Descriptor_List_Address, 'h100C, "RW");
        Rx_Descriptor_List_Address.add_hdl_path_slice("Rx_Descriptor_List_Address", 0, 32, 0);

        Tx_Descriptor_List_Address = Tx_Descriptor_List_Address_reg::type_id::create("Tx_Descriptor_List_Address");
        Tx_Descriptor_List_Address.configure(this, null, "");
        Tx_Descriptor_List_Address.build();
        default_map.add_reg(Tx_Descriptor_List_Address, 'h1010, "RW");
        Tx_Descriptor_List_Address.add_hdl_path_slice("Tx_Descriptor_List_Address", 0, 32, 0);

        Status = Status_reg::type_id::create("Status");
        Status.configure(this, null, "");
        Status.build();
        default_map.add_reg(Status, 'h1014, "RO");
        Status.add_hdl_path_slice("Status", 0, 32, 0);

        Operation_Mode = Operation_Mode_reg::type_id::create("Operation_Mode");
        Operation_Mode.configure(this, null, "");
        Operation_Mode.build();
        default_map.add_reg(Operation_Mode, 'h1018, "RW");
        Operation_Mode.add_hdl_path_slice("Operation_Mode", 0, 32, 0);

        Interrupt_Enable = Interrupt_Enable_reg::type_id::create("Interrupt_Enable");
        Interrupt_Enable.configure(this, null, "");
        Interrupt_Enable.build();
        default_map.add_reg(Interrupt_Enable, 'h101C, "RW");
        Interrupt_Enable.add_hdl_path_slice("Interrupt_Enable", 0, 32, 0);

        Missed_Frame_Buffer_Overflow_Counter = Missed_Frame_Buffer_Overflow_Counter_reg::type_id::create("Missed_Frame_Buffer_Overflow_Counter");
        Missed_Frame_Buffer_Overflow_Counter.configure(this, null, "");
        Missed_Frame_Buffer_Overflow_Counter.build();
        default_map.add_reg(Missed_Frame_Buffer_Overflow_Counter, 'h1020, "RO");
        Missed_Frame_Buffer_Overflow_Counter.add_hdl_path_slice("Missed_Frame_Buffer_Overflow_Counter", 0, 32, 0);

        RIWT = RIWT_reg::type_id::create("RIWT");
        RIWT.configure(this, null, "");
        RIWT.build();
        default_map.add_reg(RIWT, 'h1024, "RW");
        RIWT.add_hdl_path_slice("RIWT", 0, 32, 0);

        Current_Host_Tx_Descriptor = Current_Host_Tx_Descriptor_reg::type_id::create("Current_Host_Tx_Descriptor");
        Current_Host_Tx_Descriptor.configure(this, null, "");
        Current_Host_Tx_Descriptor.build();
        default_map.add_reg(Current_Host_Tx_Descriptor, 'h1048, "RO");
        Current_Host_Tx_Descriptor.add_hdl_path_slice("Current_Host_Tx_Descriptor", 0, 32, 0);

        Current_Host_Rx_Descriptor = Current_Host_Rx_Descriptor_reg::type_id::create("Current_Host_Rx_Descriptor");
        Current_Host_Rx_Descriptor.configure(this, null, "");
        Current_Host_Rx_Descriptor.build();
        default_map.add_reg(Current_Host_Rx_Descriptor, 'h104C, "RO");
        Current_Host_Rx_Descriptor.add_hdl_path_slice("Current_Host_Rx_Descriptor", 0, 32, 0);

        Current_Host_Tx_Buffer_Address = Current_Host_Tx_Buffer_Address_reg::type_id::create("Current_Host_Tx_Buffer_Address");
        Current_Host_Tx_Buffer_Address.configure(this, null, "");
        Current_Host_Tx_Buffer_Address.build();
        default_map.add_reg(Current_Host_Tx_Buffer_Address, 'h1050, "RO");
        Current_Host_Tx_Buffer_Address.add_hdl_path_slice("Current_Host_Tx_Buffer_Address", 0, 32, 0);

        Current_Host_Rx_Buffer_Address = Current_Host_Rx_Buffer_Address_reg::type_id::create("Current_Host_Rx_Buffer_Address");
        Current_Host_Rx_Buffer_Address.configure(this, null, "");
        Current_Host_Rx_Buffer_Address.build();
        default_map.add_reg(Current_Host_Rx_Buffer_Address, 'h1054, "RO");
        Current_Host_Rx_Buffer_Address.add_hdl_path_slice("Current_Host_Rx_Buffer_Address", 0, 32, 0);

        HW_Feature = HW_Feature_reg::type_id::create("HW_Feature");
        HW_Feature.configure(this, null, "");
        HW_Feature.build();
        default_map.add_reg(HW_Feature, 'h1058, "RO");
        HW_Feature.add_hdl_path_slice("HW_Feature", 0, 32, 0);

        CRM_base_address = CRM_base_address_reg::type_id::create("CRM_base_address");
        CRM_base_address.configure(this, null, "");
        CRM_base_address.build();
        default_map.add_reg(CRM_base_address, 'h105C, "RW");
        CRM_base_address.add_hdl_path_slice("CRM_base_address", 0, 32, 0);

        CRM_enable = CRM_enable_reg::type_id::create("CRM_enable");
        CRM_enable.configure(this, null, "");
        CRM_enable.build();
        default_map.add_reg(CRM_enable, 'h1060, "RW");
        CRM_enable.add_hdl_path_slice("CRM_enable", 0, 32, 0);

        CRM_current_DMA_write_address = CRM_current_DMA_write_address_reg::type_id::create("CRM_current_DMA_write_address");
        CRM_current_DMA_write_address.configure(this, null, "");
        CRM_current_DMA_write_address.build();
        default_map.add_reg(CRM_current_DMA_write_address, 'h1064, "RW");
        CRM_current_DMA_write_address.add_hdl_path_slice("CRM_current_DMA_write_address", 0, 32, 0);

        CRM_buffer_ceil_address = CRM_buffer_ceil_address_reg::type_id::create("CRM_buffer_ceil_address");
        CRM_buffer_ceil_address.configure(this, null, "");
        CRM_buffer_ceil_address.build();
        default_map.add_reg(CRM_buffer_ceil_address, 'h1068, "RW");
        CRM_buffer_ceil_address.add_hdl_path_slice("CRM_buffer_ceil_address", 0, 32, 0);

        CRM_buffer_half_size = CRM_buffer_half_size_reg::type_id::create("CRM_buffer_half_size");
        CRM_buffer_half_size.configure(this, null, "");
        CRM_buffer_half_size.build();
        default_map.add_reg(CRM_buffer_half_size, 'h106C, "RW");
        CRM_buffer_half_size.add_hdl_path_slice("CRM_buffer_half_size", 0, 32, 0);

        CRM_buffer_A_desc_start = CRM_buffer_A_desc_start_reg::type_id::create("CRM_buffer_A_desc_start");
        CRM_buffer_A_desc_start.configure(this, null, "");
        CRM_buffer_A_desc_start.build();
        default_map.add_reg(CRM_buffer_A_desc_start, 'h1070, "RW");
        CRM_buffer_A_desc_start.add_hdl_path_slice("CRM_buffer_A_desc_start", 0, 32, 0);

        CRM_buffer_B_desc_start = CRM_buffer_B_desc_start_reg::type_id::create("CRM_buffer_B_desc_start");
        CRM_buffer_B_desc_start.configure(this, null, "");
        CRM_buffer_B_desc_start.build();
        default_map.add_reg(CRM_buffer_B_desc_start, 'h1074, "RW");
        CRM_buffer_B_desc_start.add_hdl_path_slice("CRM_buffer_B_desc_start", 0, 32, 0);

        CRM_buffer_A_desc_end = CRM_buffer_A_desc_end_reg::type_id::create("CRM_buffer_A_desc_end");
        CRM_buffer_A_desc_end.configure(this, null, "");
        CRM_buffer_A_desc_end.build();
        default_map.add_reg(CRM_buffer_A_desc_end, 'h1078, "RW");
        CRM_buffer_A_desc_end.add_hdl_path_slice("CRM_buffer_A_desc_end", 0, 32, 0);

        CRM_buffer_B_desc_end = CRM_buffer_B_desc_end_reg::type_id::create("CRM_buffer_B_desc_end");
        CRM_buffer_B_desc_end.configure(this, null, "");
        CRM_buffer_B_desc_end.build();
        default_map.add_reg(CRM_buffer_B_desc_end, 'h107C, "RW");
        CRM_buffer_B_desc_end.add_hdl_path_slice("CRM_buffer_B_desc_end", 0, 32, 0);

        lock_model();
    endfunction

endclass : gmac_reg_block

`endif // _GMAC_REG_BLOCK_SV_
