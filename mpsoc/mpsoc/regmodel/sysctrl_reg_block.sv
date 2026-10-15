`ifndef _SYSCTRL_REG_BLOCK_SV_
`define _SYSCTRL_REG_BLOCK_SV_

//=========================================================================
// sysctrl_reg_block: 系统控制(SYS_CTRL)寄存器, 0x40017000
//   自动生成, 共 20 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class sysctrl_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // System_Config  (0x0, 32-bit, RW) 系统配置寄存器(ethercat/profinet 选择、外部基址等)
    //---------------------------------------------------------------------
    class System_Config_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(System_Config_reg)

        function new(string name="System_Config_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : System_Config_reg

    //---------------------------------------------------------------------
    // PDI_Config  (0x4, 32-bit, RW) PDI 配置寄存器
    //---------------------------------------------------------------------
    class PDI_Config_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PDI_Config_reg)

        function new(string name="PDI_Config_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : PDI_Config_reg

    //---------------------------------------------------------------------
    // LVDS_Config  (0x8, 32-bit, RW) LVDS 配置寄存器
    //---------------------------------------------------------------------
    class LVDS_Config_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LVDS_Config_reg)

        function new(string name="LVDS_Config_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : LVDS_Config_reg

    //---------------------------------------------------------------------
    // IRT_Sync_Timestamp  (0xC, 32-bit, RO) IRT 同步时间戳(只读)
    //---------------------------------------------------------------------
    class IRT_Sync_Timestamp_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IRT_Sync_Timestamp_reg)

        function new(string name="IRT_Sync_Timestamp_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IRT_Sync_Timestamp_reg

    //---------------------------------------------------------------------
    // PN_Cycle  (0x10, 32-bit, RW) PN Cycle 计数器/时间戳
    //---------------------------------------------------------------------
    class PN_Cycle_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PN_Cycle_reg)

        function new(string name="PN_Cycle_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : PN_Cycle_reg

    //---------------------------------------------------------------------
    // CPU_PLL_Config  (0x14, 32-bit, RW) CPU/PN PLL 配置
    //---------------------------------------------------------------------
    class CPU_PLL_Config_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CPU_PLL_Config_reg)

        function new(string name="CPU_PLL_Config_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CPU_PLL_Config_reg

    //---------------------------------------------------------------------
    // Core_ID  (0x18, 32-bit, RO) Core ID (Vendor/Device/Version)
    //---------------------------------------------------------------------
    class Core_ID_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Core_ID_reg)

        function new(string name="Core_ID_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Core_ID_reg

    //---------------------------------------------------------------------
    // ECAT_PDI_Clock  (0x1C, 32-bit, RW) ECAT PDI 时钟选择
    //---------------------------------------------------------------------
    class ECAT_PDI_Clock_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ECAT_PDI_Clock_reg)

        function new(string name="ECAT_PDI_Clock_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ECAT_PDI_Clock_reg

    //---------------------------------------------------------------------
    // Security_Control  (0x20, 32-bit, RW) 安全控制(JTAG Enable 等)
    //---------------------------------------------------------------------
    class Security_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Security_Control_reg)

        function new(string name="Security_Control_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Security_Control_reg

    //---------------------------------------------------------------------
    // Boot_Control  (0x24, 32-bit, RW) 启动控制
    //---------------------------------------------------------------------
    class Boot_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Boot_Control_reg)

        function new(string name="Boot_Control_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Boot_Control_reg

    //---------------------------------------------------------------------
    // Reset_Control  (0x28, 32-bit, RW) 复位控制
    //---------------------------------------------------------------------
    class Reset_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Reset_Control_reg)

        function new(string name="Reset_Control_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Reset_Control_reg

    //---------------------------------------------------------------------
    // ECAT1_Config  (0x2C, 32-bit, RW) ECAT1 配置(多芯片内部映射)
    //---------------------------------------------------------------------
    class ECAT1_Config_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ECAT1_Config_reg)

        function new(string name="ECAT1_Config_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ECAT1_Config_reg

    //---------------------------------------------------------------------
    // CORE0_SW_INT  (0x74, 32-bit, RW) Core0 软中断
    //---------------------------------------------------------------------
    class CORE0_SW_INT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CORE0_SW_INT_reg)

        function new(string name="CORE0_SW_INT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CORE0_SW_INT_reg

    //---------------------------------------------------------------------
    // CORE1_SW_INT  (0x78, 32-bit, RW) Core1 软中断
    //---------------------------------------------------------------------
    class CORE1_SW_INT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CORE1_SW_INT_reg)

        function new(string name="CORE1_SW_INT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CORE1_SW_INT_reg

    //---------------------------------------------------------------------
    // Cycle_Count_Mask  (0x7C0, 32-bit, RW) 循环计数掩码
    //---------------------------------------------------------------------
    class Cycle_Count_Mask_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Cycle_Count_Mask_reg)

        function new(string name="Cycle_Count_Mask_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Cycle_Count_Mask_reg

    //---------------------------------------------------------------------
    // COMPA  (0x7C4, 32-bit, RW) 比较器 A
    //---------------------------------------------------------------------
    class COMPA_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(COMPA_reg)

        function new(string name="COMPA_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : COMPA_reg

    //---------------------------------------------------------------------
    // COMPB  (0x7C8, 32-bit, RW) 比较器 B
    //---------------------------------------------------------------------
    class COMPB_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(COMPB_reg)

        function new(string name="COMPB_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : COMPB_reg

    //---------------------------------------------------------------------
    // COMPC  (0x7CC, 32-bit, RW) 比较器 C
    //---------------------------------------------------------------------
    class COMPC_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(COMPC_reg)

        function new(string name="COMPC_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : COMPC_reg

    //---------------------------------------------------------------------
    // COMPD  (0x7D0, 32-bit, RW) 比较器 D
    //---------------------------------------------------------------------
    class COMPD_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(COMPD_reg)

        function new(string name="COMPD_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : COMPD_reg

    //---------------------------------------------------------------------
    // PN_IP_EVENT_CTRL  (0x7D4, 32-bit, RW) PN 事件控制
    //---------------------------------------------------------------------
    class PN_IP_EVENT_CTRL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PN_IP_EVENT_CTRL_reg)

        function new(string name="PN_IP_EVENT_CTRL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : PN_IP_EVENT_CTRL_reg

    rand System_Config_reg System_Config;
    rand PDI_Config_reg PDI_Config;
    rand LVDS_Config_reg LVDS_Config;
    rand IRT_Sync_Timestamp_reg IRT_Sync_Timestamp;
    rand PN_Cycle_reg PN_Cycle;
    rand CPU_PLL_Config_reg CPU_PLL_Config;
    rand Core_ID_reg Core_ID;
    rand ECAT_PDI_Clock_reg ECAT_PDI_Clock;
    rand Security_Control_reg Security_Control;
    rand Boot_Control_reg Boot_Control;
    rand Reset_Control_reg Reset_Control;
    rand ECAT1_Config_reg ECAT1_Config;
    rand CORE0_SW_INT_reg CORE0_SW_INT;
    rand CORE1_SW_INT_reg CORE1_SW_INT;
    rand Cycle_Count_Mask_reg Cycle_Count_Mask;
    rand COMPA_reg COMPA;
    rand COMPB_reg COMPB;
    rand COMPC_reg COMPC;
    rand COMPD_reg COMPD;
    rand PN_IP_EVENT_CTRL_reg PN_IP_EVENT_CTRL;

    `uvm_object_utils(sysctrl_reg_block)

    function new(string name="sysctrl_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        System_Config = System_Config_reg::type_id::create("System_Config");
        System_Config.configure(this, null, "");
        System_Config.build();
        default_map.add_reg(System_Config, 'h0, "RW");
        System_Config.add_hdl_path_slice("System_Config", 0, 32, 0);

        PDI_Config = PDI_Config_reg::type_id::create("PDI_Config");
        PDI_Config.configure(this, null, "");
        PDI_Config.build();
        default_map.add_reg(PDI_Config, 'h4, "RW");
        PDI_Config.add_hdl_path_slice("PDI_Config", 0, 32, 0);

        LVDS_Config = LVDS_Config_reg::type_id::create("LVDS_Config");
        LVDS_Config.configure(this, null, "");
        LVDS_Config.build();
        default_map.add_reg(LVDS_Config, 'h8, "RW");
        LVDS_Config.add_hdl_path_slice("LVDS_Config", 0, 32, 0);

        IRT_Sync_Timestamp = IRT_Sync_Timestamp_reg::type_id::create("IRT_Sync_Timestamp");
        IRT_Sync_Timestamp.configure(this, null, "");
        IRT_Sync_Timestamp.build();
        default_map.add_reg(IRT_Sync_Timestamp, 'hC, "RO");
        IRT_Sync_Timestamp.add_hdl_path_slice("IRT_Sync_Timestamp", 0, 32, 0);

        PN_Cycle = PN_Cycle_reg::type_id::create("PN_Cycle");
        PN_Cycle.configure(this, null, "");
        PN_Cycle.build();
        default_map.add_reg(PN_Cycle, 'h10, "RW");
        PN_Cycle.add_hdl_path_slice("PN_Cycle", 0, 32, 0);

        CPU_PLL_Config = CPU_PLL_Config_reg::type_id::create("CPU_PLL_Config");
        CPU_PLL_Config.configure(this, null, "");
        CPU_PLL_Config.build();
        default_map.add_reg(CPU_PLL_Config, 'h14, "RW");
        CPU_PLL_Config.add_hdl_path_slice("CPU_PLL_Config", 0, 32, 0);

        Core_ID = Core_ID_reg::type_id::create("Core_ID");
        Core_ID.configure(this, null, "");
        Core_ID.build();
        default_map.add_reg(Core_ID, 'h18, "RO");
        Core_ID.add_hdl_path_slice("Core_ID", 0, 32, 0);

        ECAT_PDI_Clock = ECAT_PDI_Clock_reg::type_id::create("ECAT_PDI_Clock");
        ECAT_PDI_Clock.configure(this, null, "");
        ECAT_PDI_Clock.build();
        default_map.add_reg(ECAT_PDI_Clock, 'h1C, "RW");
        ECAT_PDI_Clock.add_hdl_path_slice("ECAT_PDI_Clock", 0, 32, 0);

        Security_Control = Security_Control_reg::type_id::create("Security_Control");
        Security_Control.configure(this, null, "");
        Security_Control.build();
        default_map.add_reg(Security_Control, 'h20, "RW");
        Security_Control.add_hdl_path_slice("Security_Control", 0, 32, 0);

        Boot_Control = Boot_Control_reg::type_id::create("Boot_Control");
        Boot_Control.configure(this, null, "");
        Boot_Control.build();
        default_map.add_reg(Boot_Control, 'h24, "RW");
        Boot_Control.add_hdl_path_slice("Boot_Control", 0, 32, 0);

        Reset_Control = Reset_Control_reg::type_id::create("Reset_Control");
        Reset_Control.configure(this, null, "");
        Reset_Control.build();
        default_map.add_reg(Reset_Control, 'h28, "RW");
        Reset_Control.add_hdl_path_slice("Reset_Control", 0, 32, 0);

        ECAT1_Config = ECAT1_Config_reg::type_id::create("ECAT1_Config");
        ECAT1_Config.configure(this, null, "");
        ECAT1_Config.build();
        default_map.add_reg(ECAT1_Config, 'h2C, "RW");
        ECAT1_Config.add_hdl_path_slice("ECAT1_Config", 0, 32, 0);

        CORE0_SW_INT = CORE0_SW_INT_reg::type_id::create("CORE0_SW_INT");
        CORE0_SW_INT.configure(this, null, "");
        CORE0_SW_INT.build();
        default_map.add_reg(CORE0_SW_INT, 'h74, "RW");
        CORE0_SW_INT.add_hdl_path_slice("CORE0_SW_INT", 0, 32, 0);

        CORE1_SW_INT = CORE1_SW_INT_reg::type_id::create("CORE1_SW_INT");
        CORE1_SW_INT.configure(this, null, "");
        CORE1_SW_INT.build();
        default_map.add_reg(CORE1_SW_INT, 'h78, "RW");
        CORE1_SW_INT.add_hdl_path_slice("CORE1_SW_INT", 0, 32, 0);

        Cycle_Count_Mask = Cycle_Count_Mask_reg::type_id::create("Cycle_Count_Mask");
        Cycle_Count_Mask.configure(this, null, "");
        Cycle_Count_Mask.build();
        default_map.add_reg(Cycle_Count_Mask, 'h7C0, "RW");
        Cycle_Count_Mask.add_hdl_path_slice("Cycle_Count_Mask", 0, 32, 0);

        COMPA = COMPA_reg::type_id::create("COMPA");
        COMPA.configure(this, null, "");
        COMPA.build();
        default_map.add_reg(COMPA, 'h7C4, "RW");
        COMPA.add_hdl_path_slice("COMPA", 0, 32, 0);

        COMPB = COMPB_reg::type_id::create("COMPB");
        COMPB.configure(this, null, "");
        COMPB.build();
        default_map.add_reg(COMPB, 'h7C8, "RW");
        COMPB.add_hdl_path_slice("COMPB", 0, 32, 0);

        COMPC = COMPC_reg::type_id::create("COMPC");
        COMPC.configure(this, null, "");
        COMPC.build();
        default_map.add_reg(COMPC, 'h7CC, "RW");
        COMPC.add_hdl_path_slice("COMPC", 0, 32, 0);

        COMPD = COMPD_reg::type_id::create("COMPD");
        COMPD.configure(this, null, "");
        COMPD.build();
        default_map.add_reg(COMPD, 'h7D0, "RW");
        COMPD.add_hdl_path_slice("COMPD", 0, 32, 0);

        PN_IP_EVENT_CTRL = PN_IP_EVENT_CTRL_reg::type_id::create("PN_IP_EVENT_CTRL");
        PN_IP_EVENT_CTRL.configure(this, null, "");
        PN_IP_EVENT_CTRL.build();
        default_map.add_reg(PN_IP_EVENT_CTRL, 'h7D4, "RW");
        PN_IP_EVENT_CTRL.add_hdl_path_slice("PN_IP_EVENT_CTRL", 0, 32, 0);

        lock_model();
    endfunction

endclass : sysctrl_reg_block

`endif // _SYSCTRL_REG_BLOCK_SV_
