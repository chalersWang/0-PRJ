`ifndef _TIM_REG_BLOCK_SV_
`define _TIM_REG_BLOCK_SV_

//=========================================================================
// tim_reg_block: Timer (DW_apb_timers v2.14a), 2 实例
//   自动生成, 共 11 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class tim_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // Timer1LoadCount  (0x0, 32-bit, RW) Timer 1 Load Count Register
    //---------------------------------------------------------------------
    class Timer1LoadCount_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Timer1LoadCount_reg)

        function new(string name="Timer1LoadCount_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Timer1LoadCount_reg

    //---------------------------------------------------------------------
    // Timer1CurrentValue  (0x4, 32-bit, RO) Timer 1 Current Value Register
    //---------------------------------------------------------------------
    class Timer1CurrentValue_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Timer1CurrentValue_reg)

        function new(string name="Timer1CurrentValue_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Timer1CurrentValue_reg

    //---------------------------------------------------------------------
    // Timer1ControlReg  (0x8, 32-bit, RW) Timer 1 Control Register
    //---------------------------------------------------------------------
    class Timer1ControlReg_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Timer1ControlReg_reg)

        function new(string name="Timer1ControlReg_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Timer1ControlReg_reg

    //---------------------------------------------------------------------
    // Timer1EOI  (0xC, 32-bit, RW) Timer 1 End-of-Interrupt Register
    //---------------------------------------------------------------------
    class Timer1EOI_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Timer1EOI_reg)

        function new(string name="Timer1EOI_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Timer1EOI_reg

    //---------------------------------------------------------------------
    // Timer1IntStatus  (0x10, 32-bit, RO) Timer 1 Interrupt Status Register
    //---------------------------------------------------------------------
    class Timer1IntStatus_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Timer1IntStatus_reg)

        function new(string name="Timer1IntStatus_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Timer1IntStatus_reg

    //---------------------------------------------------------------------
    // TimersIntStatus  (0xA0, 32-bit, RO) Timers Interrupt Status Register
    //---------------------------------------------------------------------
    class TimersIntStatus_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TimersIntStatus_reg)

        function new(string name="TimersIntStatus_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TimersIntStatus_reg

    //---------------------------------------------------------------------
    // TimersEOI  (0xA4, 32-bit, RW) Timers End-of-Interrupt Register
    //---------------------------------------------------------------------
    class TimersEOI_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TimersEOI_reg)

        function new(string name="TimersEOI_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TimersEOI_reg

    //---------------------------------------------------------------------
    // TimersRawIntStatus  (0xA8, 32-bit, RO) Timers Raw Interrupt Status Register
    //---------------------------------------------------------------------
    class TimersRawIntStatus_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TimersRawIntStatus_reg)

        function new(string name="TimersRawIntStatus_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TimersRawIntStatus_reg

    //---------------------------------------------------------------------
    // TIMERS_COMP_VERSION  (0xAC, 32-bit, RO) Timers Component Version
    //---------------------------------------------------------------------
    class TIMERS_COMP_VERSION_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TIMERS_COMP_VERSION_reg)

        function new(string name="TIMERS_COMP_VERSION_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TIMERS_COMP_VERSION_reg

    //---------------------------------------------------------------------
    // Timer1LoadCount2  (0xB0, 32-bit, RW) Timer 1 Load Count2 Register
    //---------------------------------------------------------------------
    class Timer1LoadCount2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Timer1LoadCount2_reg)

        function new(string name="Timer1LoadCount2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Timer1LoadCount2_reg

    //---------------------------------------------------------------------
    // Timer1ProtLevel  (0xD0, 32-bit, RW) Timer 1 Protection level
    //---------------------------------------------------------------------
    class Timer1ProtLevel_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Timer1ProtLevel_reg)

        function new(string name="Timer1ProtLevel_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Timer1ProtLevel_reg

    rand Timer1LoadCount_reg Timer1LoadCount;
    rand Timer1CurrentValue_reg Timer1CurrentValue;
    rand Timer1ControlReg_reg Timer1ControlReg;
    rand Timer1EOI_reg Timer1EOI;
    rand Timer1IntStatus_reg Timer1IntStatus;
    rand TimersIntStatus_reg TimersIntStatus;
    rand TimersEOI_reg TimersEOI;
    rand TimersRawIntStatus_reg TimersRawIntStatus;
    rand TIMERS_COMP_VERSION_reg TIMERS_COMP_VERSION;
    rand Timer1LoadCount2_reg Timer1LoadCount2;
    rand Timer1ProtLevel_reg Timer1ProtLevel;

    `uvm_object_utils(tim_reg_block)

    function new(string name="tim_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        Timer1LoadCount = Timer1LoadCount_reg::type_id::create("Timer1LoadCount");
        Timer1LoadCount.configure(this, null, "");
        Timer1LoadCount.build();
        default_map.add_reg(Timer1LoadCount, 'h0, "RW");
        Timer1LoadCount.add_hdl_path_slice("Timer1LoadCount", 0, 32, 0);

        Timer1CurrentValue = Timer1CurrentValue_reg::type_id::create("Timer1CurrentValue");
        Timer1CurrentValue.configure(this, null, "");
        Timer1CurrentValue.build();
        default_map.add_reg(Timer1CurrentValue, 'h4, "RO");
        Timer1CurrentValue.add_hdl_path_slice("Timer1CurrentValue", 0, 32, 0);

        Timer1ControlReg = Timer1ControlReg_reg::type_id::create("Timer1ControlReg");
        Timer1ControlReg.configure(this, null, "");
        Timer1ControlReg.build();
        default_map.add_reg(Timer1ControlReg, 'h8, "RW");
        Timer1ControlReg.add_hdl_path_slice("Timer1ControlReg", 0, 32, 0);

        Timer1EOI = Timer1EOI_reg::type_id::create("Timer1EOI");
        Timer1EOI.configure(this, null, "");
        Timer1EOI.build();
        default_map.add_reg(Timer1EOI, 'hC, "RW");
        Timer1EOI.add_hdl_path_slice("Timer1EOI", 0, 32, 0);

        Timer1IntStatus = Timer1IntStatus_reg::type_id::create("Timer1IntStatus");
        Timer1IntStatus.configure(this, null, "");
        Timer1IntStatus.build();
        default_map.add_reg(Timer1IntStatus, 'h10, "RO");
        Timer1IntStatus.add_hdl_path_slice("Timer1IntStatus", 0, 32, 0);

        TimersIntStatus = TimersIntStatus_reg::type_id::create("TimersIntStatus");
        TimersIntStatus.configure(this, null, "");
        TimersIntStatus.build();
        default_map.add_reg(TimersIntStatus, 'hA0, "RO");
        TimersIntStatus.add_hdl_path_slice("TimersIntStatus", 0, 32, 0);

        TimersEOI = TimersEOI_reg::type_id::create("TimersEOI");
        TimersEOI.configure(this, null, "");
        TimersEOI.build();
        default_map.add_reg(TimersEOI, 'hA4, "RW");
        TimersEOI.add_hdl_path_slice("TimersEOI", 0, 32, 0);

        TimersRawIntStatus = TimersRawIntStatus_reg::type_id::create("TimersRawIntStatus");
        TimersRawIntStatus.configure(this, null, "");
        TimersRawIntStatus.build();
        default_map.add_reg(TimersRawIntStatus, 'hA8, "RO");
        TimersRawIntStatus.add_hdl_path_slice("TimersRawIntStatus", 0, 32, 0);

        TIMERS_COMP_VERSION = TIMERS_COMP_VERSION_reg::type_id::create("TIMERS_COMP_VERSION");
        TIMERS_COMP_VERSION.configure(this, null, "");
        TIMERS_COMP_VERSION.build();
        default_map.add_reg(TIMERS_COMP_VERSION, 'hAC, "RO");
        TIMERS_COMP_VERSION.add_hdl_path_slice("TIMERS_COMP_VERSION", 0, 32, 0);

        Timer1LoadCount2 = Timer1LoadCount2_reg::type_id::create("Timer1LoadCount2");
        Timer1LoadCount2.configure(this, null, "");
        Timer1LoadCount2.build();
        default_map.add_reg(Timer1LoadCount2, 'hB0, "RW");
        Timer1LoadCount2.add_hdl_path_slice("Timer1LoadCount2", 0, 32, 0);

        Timer1ProtLevel = Timer1ProtLevel_reg::type_id::create("Timer1ProtLevel");
        Timer1ProtLevel.configure(this, null, "");
        Timer1ProtLevel.build();
        default_map.add_reg(Timer1ProtLevel, 'hD0, "RW");
        Timer1ProtLevel.add_hdl_path_slice("Timer1ProtLevel", 0, 32, 0);

        lock_model();
    endfunction

endclass : tim_reg_block

`endif // _TIM_REG_BLOCK_SV_
