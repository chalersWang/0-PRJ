`ifndef _QSPI_REG_BLOCK_SV_
`define _QSPI_REG_BLOCK_SV_

//=========================================================================
// qspi_reg_block: QSPI (Cadence Flash QSPI Controller), 0x48000000
//   自动生成, 共 38 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性: 依据 QSPI_FLASH_CTRL_UserGuide v2.2 (PDF) 寄存器表标注 RW/RO;
//   0x40 Interrupt_Status 为写 1 清零(RWC), 单字段模型按 RW 建模。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class qspi_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // QSPI_Configuration  (0x0, 32-bit, RW) QSPI Configuration Register
    //---------------------------------------------------------------------
    class QSPI_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(QSPI_Configuration_reg)

        function new(string name="QSPI_Configuration_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : QSPI_Configuration_reg

    //---------------------------------------------------------------------
    // Device_Read_Instruction  (0x4, 32-bit, RW) Device Read Instruction Type Register
    //---------------------------------------------------------------------
    class Device_Read_Instruction_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Device_Read_Instruction_reg)

        function new(string name="Device_Read_Instruction_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Device_Read_Instruction_reg

    //---------------------------------------------------------------------
    // Device_Write_Instruction_Configuration  (0x8, 32-bit, RW) Device Write Instruction Type Register
    //---------------------------------------------------------------------
    class Device_Write_Instruction_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Device_Write_Instruction_Configuration_reg)

        function new(string name="Device_Write_Instruction_Configuration_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Device_Write_Instruction_Configuration_reg

    //---------------------------------------------------------------------
    // QSPI_Device_Delay  (0xC, 32-bit, RW) QSPI Device Delay Register
    //---------------------------------------------------------------------
    class QSPI_Device_Delay_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(QSPI_Device_Delay_reg)

        function new(string name="QSPI_Device_Delay_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : QSPI_Device_Delay_reg

    //---------------------------------------------------------------------
    // Read_Data_Capture  (0x10, 32-bit, RW) Read Data Capture Register
    //---------------------------------------------------------------------
    class Read_Data_Capture_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Read_Data_Capture_reg)

        function new(string name="Read_Data_Capture_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Read_Data_Capture_reg

    //---------------------------------------------------------------------
    // Device_Size_Configuration  (0x14, 32-bit, RW) Device Size Configuration Register
    //---------------------------------------------------------------------
    class Device_Size_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Device_Size_Configuration_reg)

        function new(string name="Device_Size_Configuration_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Device_Size_Configuration_reg

    //---------------------------------------------------------------------
    // SRAM_Partition_Configuration  (0x18, 32-bit, RW) SRAM Partition Configuration Register
    //---------------------------------------------------------------------
    class SRAM_Partition_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SRAM_Partition_Configuration_reg)

        function new(string name="SRAM_Partition_Configuration_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SRAM_Partition_Configuration_reg

    //---------------------------------------------------------------------
    // Indirect_AHB_Address_Trigger  (0x1C, 32-bit, RW) Indirect AHB Address Trigger Register
    //---------------------------------------------------------------------
    class Indirect_AHB_Address_Trigger_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_AHB_Address_Trigger_reg)

        function new(string name="Indirect_AHB_Address_Trigger_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_AHB_Address_Trigger_reg

    //---------------------------------------------------------------------
    // DMA_Peripheral_Configuration  (0x20, 32-bit, RW) DMA Peripheral Configuration Register
    //---------------------------------------------------------------------
    class DMA_Peripheral_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMA_Peripheral_Configuration_reg)

        function new(string name="DMA_Peripheral_Configuration_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMA_Peripheral_Configuration_reg

    //---------------------------------------------------------------------
    // Remap_Address  (0x24, 32-bit, RW) Remap Address Register
    //---------------------------------------------------------------------
    class Remap_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Remap_Address_reg)

        function new(string name="Remap_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Remap_Address_reg

    //---------------------------------------------------------------------
    // Mode_Bit_Configuration  (0x28, 32-bit, RW) Mode Bit Configuration Register
    //---------------------------------------------------------------------
    class Mode_Bit_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Mode_Bit_Configuration_reg)

        function new(string name="Mode_Bit_Configuration_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Mode_Bit_Configuration_reg

    //---------------------------------------------------------------------
    // SRAM_Fill_Level  (0x2C, 32-bit, RO) SRAM Fill Level Register
    //---------------------------------------------------------------------
    class SRAM_Fill_Level_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SRAM_Fill_Level_reg)

        function new(string name="SRAM_Fill_Level_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SRAM_Fill_Level_reg

    //---------------------------------------------------------------------
    // TX_Threshold  (0x30, 32-bit, RW) TX Threshold Register
    //---------------------------------------------------------------------
    class TX_Threshold_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TX_Threshold_reg)

        function new(string name="TX_Threshold_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TX_Threshold_reg

    //---------------------------------------------------------------------
    // RX_Threshold  (0x34, 32-bit, RW) RX Threshold Register
    //---------------------------------------------------------------------
    class RX_Threshold_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RX_Threshold_reg)

        function new(string name="RX_Threshold_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RX_Threshold_reg

    //---------------------------------------------------------------------
    // Write_Completion_Control  (0x38, 32-bit, RW) Write Completion Control Register
    //---------------------------------------------------------------------
    class Write_Completion_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Write_Completion_Control_reg)

        function new(string name="Write_Completion_Control_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Write_Completion_Control_reg

    //---------------------------------------------------------------------
    // Polling_Expiration  (0x3C, 32-bit, RW) Polling Expiration Register
    //---------------------------------------------------------------------
    class Polling_Expiration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Polling_Expiration_reg)

        function new(string name="Polling_Expiration_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Polling_Expiration_reg

    //---------------------------------------------------------------------
    // Interrupt_Status  (0x40, 32-bit, RW) Interrupt Status Register (write 1 clear)
    //---------------------------------------------------------------------
    class Interrupt_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Interrupt_Status_reg)

        function new(string name="Interrupt_Status_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Interrupt_Status_reg

    //---------------------------------------------------------------------
    // Interrupt_Mask  (0x44, 32-bit, RW) Interrupt Mask Register
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
    // Lower_Write_Protection  (0x50, 32-bit, RW) Lower Write Protection Register
    //---------------------------------------------------------------------
    class Lower_Write_Protection_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Lower_Write_Protection_reg)

        function new(string name="Lower_Write_Protection_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Lower_Write_Protection_reg

    //---------------------------------------------------------------------
    // Upper_Write_Protection  (0x54, 32-bit, RW) Upper Write Protection Register
    //---------------------------------------------------------------------
    class Upper_Write_Protection_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Upper_Write_Protection_reg)

        function new(string name="Upper_Write_Protection_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Upper_Write_Protection_reg

    //---------------------------------------------------------------------
    // Write_Protection  (0x58, 32-bit, RW) Write Protection Register
    //---------------------------------------------------------------------
    class Write_Protection_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Write_Protection_reg)

        function new(string name="Write_Protection_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Write_Protection_reg

    //---------------------------------------------------------------------
    // Indirect_Read_Transfer_Control  (0x60, 32-bit, RW) Indirect Read Transfer Control Register
    //---------------------------------------------------------------------
    class Indirect_Read_Transfer_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_Read_Transfer_Control_reg)

        function new(string name="Indirect_Read_Transfer_Control_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_Read_Transfer_Control_reg

    //---------------------------------------------------------------------
    // Indirect_Read_Transfer_Watermark  (0x64, 32-bit, RW) Indirect Read Transfer Watermark Register
    //---------------------------------------------------------------------
    class Indirect_Read_Transfer_Watermark_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_Read_Transfer_Watermark_reg)

        function new(string name="Indirect_Read_Transfer_Watermark_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_Read_Transfer_Watermark_reg

    //---------------------------------------------------------------------
    // Indirect_Read_Transfer_Start_Address  (0x68, 32-bit, RW) Indirect Read Transfer Start Address Register
    //---------------------------------------------------------------------
    class Indirect_Read_Transfer_Start_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_Read_Transfer_Start_Address_reg)

        function new(string name="Indirect_Read_Transfer_Start_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_Read_Transfer_Start_Address_reg

    //---------------------------------------------------------------------
    // Indirect_Read_Transfer_Number_Bytes  (0x6C, 32-bit, RW) Indirect Read Transfer Number Bytes Register
    //---------------------------------------------------------------------
    class Indirect_Read_Transfer_Number_Bytes_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_Read_Transfer_Number_Bytes_reg)

        function new(string name="Indirect_Read_Transfer_Number_Bytes_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_Read_Transfer_Number_Bytes_reg

    //---------------------------------------------------------------------
    // Indirect_Write_Transfer_Control  (0x70, 32-bit, RW) Indirect Write Transfer Control Register
    //---------------------------------------------------------------------
    class Indirect_Write_Transfer_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_Write_Transfer_Control_reg)

        function new(string name="Indirect_Write_Transfer_Control_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_Write_Transfer_Control_reg

    //---------------------------------------------------------------------
    // Indirect_Write_Transfer_Watermark  (0x74, 32-bit, RW) Indirect Write Transfer Watermark Register
    //---------------------------------------------------------------------
    class Indirect_Write_Transfer_Watermark_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_Write_Transfer_Watermark_reg)

        function new(string name="Indirect_Write_Transfer_Watermark_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_Write_Transfer_Watermark_reg

    //---------------------------------------------------------------------
    // Indirect_Write_Transfer_Start_Address  (0x78, 32-bit, RW) Indirect Write Transfer Start Address Register
    //---------------------------------------------------------------------
    class Indirect_Write_Transfer_Start_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_Write_Transfer_Start_Address_reg)

        function new(string name="Indirect_Write_Transfer_Start_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_Write_Transfer_Start_Address_reg

    //---------------------------------------------------------------------
    // Indirect_Write_Transfer_Number_Bytes  (0x7C, 32-bit, RW) Indirect Write Transfer Number Bytes Register
    //---------------------------------------------------------------------
    class Indirect_Write_Transfer_Number_Bytes_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_Write_Transfer_Number_Bytes_reg)

        function new(string name="Indirect_Write_Transfer_Number_Bytes_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_Write_Transfer_Number_Bytes_reg

    //---------------------------------------------------------------------
    // Indirect_Trigger_Address_Range  (0x80, 32-bit, RW) Indirect Trigger Address Range Register
    //---------------------------------------------------------------------
    class Indirect_Trigger_Address_Range_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Indirect_Trigger_Address_Range_reg)

        function new(string name="Indirect_Trigger_Address_Range_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Indirect_Trigger_Address_Range_reg

    //---------------------------------------------------------------------
    // Flash_Command_Control  (0x90, 32-bit, RW) Flash Command Control Register (Using STIG)
    //---------------------------------------------------------------------
    class Flash_Command_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Flash_Command_Control_reg)

        function new(string name="Flash_Command_Control_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Flash_Command_Control_reg

    //---------------------------------------------------------------------
    // Flash_Command_Address  (0x94, 32-bit, RW) Flash Command Address Register
    //---------------------------------------------------------------------
    class Flash_Command_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Flash_Command_Address_reg)

        function new(string name="Flash_Command_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Flash_Command_Address_reg

    //---------------------------------------------------------------------
    // Flash_Command_Read_Data_Lower  (0xA0, 32-bit, RO) Flash Command Read Data Register (Lower)
    //---------------------------------------------------------------------
    class Flash_Command_Read_Data_Lower_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Flash_Command_Read_Data_Lower_reg)

        function new(string name="Flash_Command_Read_Data_Lower_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Flash_Command_Read_Data_Lower_reg

    //---------------------------------------------------------------------
    // Flash_Command_Read_Data_Upper  (0xA4, 32-bit, RO) Flash Command Read Data Register (Upper)
    //---------------------------------------------------------------------
    class Flash_Command_Read_Data_Upper_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Flash_Command_Read_Data_Upper_reg)

        function new(string name="Flash_Command_Read_Data_Upper_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Flash_Command_Read_Data_Upper_reg

    //---------------------------------------------------------------------
    // Flash_Command_Write_Data_Lower  (0xA8, 32-bit, RW) Flash Command Write Data Register (Lower)
    //---------------------------------------------------------------------
    class Flash_Command_Write_Data_Lower_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Flash_Command_Write_Data_Lower_reg)

        function new(string name="Flash_Command_Write_Data_Lower_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Flash_Command_Write_Data_Lower_reg

    //---------------------------------------------------------------------
    // Flash_Command_Write_Data_Upper  (0xAC, 32-bit, RW) Flash Command Write Data Register (Upper)
    //---------------------------------------------------------------------
    class Flash_Command_Write_Data_Upper_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Flash_Command_Write_Data_Upper_reg)

        function new(string name="Flash_Command_Write_Data_Upper_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Flash_Command_Write_Data_Upper_reg

    //---------------------------------------------------------------------
    // Polling_Flash_Status  (0xB0, 32-bit, RO) Polling Flash Status Register
    //---------------------------------------------------------------------
    class Polling_Flash_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Polling_Flash_Status_reg)

        function new(string name="Polling_Flash_Status_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Polling_Flash_Status_reg

    //---------------------------------------------------------------------
    // Module_ID  (0xFC, 32-bit, RO) Module ID Register
    //---------------------------------------------------------------------
    class Module_ID_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Module_ID_reg)

        function new(string name="Module_ID_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Module_ID_reg

    rand QSPI_Configuration_reg QSPI_Configuration;
    rand Device_Read_Instruction_reg Device_Read_Instruction;
    rand Device_Write_Instruction_Configuration_reg Device_Write_Instruction_Configuration;
    rand QSPI_Device_Delay_reg QSPI_Device_Delay;
    rand Read_Data_Capture_reg Read_Data_Capture;
    rand Device_Size_Configuration_reg Device_Size_Configuration;
    rand SRAM_Partition_Configuration_reg SRAM_Partition_Configuration;
    rand Indirect_AHB_Address_Trigger_reg Indirect_AHB_Address_Trigger;
    rand DMA_Peripheral_Configuration_reg DMA_Peripheral_Configuration;
    rand Remap_Address_reg Remap_Address;
    rand Mode_Bit_Configuration_reg Mode_Bit_Configuration;
    rand SRAM_Fill_Level_reg SRAM_Fill_Level;
    rand TX_Threshold_reg TX_Threshold;
    rand RX_Threshold_reg RX_Threshold;
    rand Write_Completion_Control_reg Write_Completion_Control;
    rand Polling_Expiration_reg Polling_Expiration;
    rand Interrupt_Status_reg Interrupt_Status;
    rand Interrupt_Mask_reg Interrupt_Mask;
    rand Lower_Write_Protection_reg Lower_Write_Protection;
    rand Upper_Write_Protection_reg Upper_Write_Protection;
    rand Write_Protection_reg Write_Protection;
    rand Indirect_Read_Transfer_Control_reg Indirect_Read_Transfer_Control;
    rand Indirect_Read_Transfer_Watermark_reg Indirect_Read_Transfer_Watermark;
    rand Indirect_Read_Transfer_Start_Address_reg Indirect_Read_Transfer_Start_Address;
    rand Indirect_Read_Transfer_Number_Bytes_reg Indirect_Read_Transfer_Number_Bytes;
    rand Indirect_Write_Transfer_Control_reg Indirect_Write_Transfer_Control;
    rand Indirect_Write_Transfer_Watermark_reg Indirect_Write_Transfer_Watermark;
    rand Indirect_Write_Transfer_Start_Address_reg Indirect_Write_Transfer_Start_Address;
    rand Indirect_Write_Transfer_Number_Bytes_reg Indirect_Write_Transfer_Number_Bytes;
    rand Indirect_Trigger_Address_Range_reg Indirect_Trigger_Address_Range;
    rand Flash_Command_Control_reg Flash_Command_Control;
    rand Flash_Command_Address_reg Flash_Command_Address;
    rand Flash_Command_Read_Data_Lower_reg Flash_Command_Read_Data_Lower;
    rand Flash_Command_Read_Data_Upper_reg Flash_Command_Read_Data_Upper;
    rand Flash_Command_Write_Data_Lower_reg Flash_Command_Write_Data_Lower;
    rand Flash_Command_Write_Data_Upper_reg Flash_Command_Write_Data_Upper;
    rand Polling_Flash_Status_reg Polling_Flash_Status;
    rand Module_ID_reg Module_ID;

    `uvm_object_utils(qspi_reg_block)

    function new(string name="qspi_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        QSPI_Configuration = QSPI_Configuration_reg::type_id::create("QSPI_Configuration");
        QSPI_Configuration.configure(this, null, "");
        QSPI_Configuration.build();
        default_map.add_reg(QSPI_Configuration, 'h0, "RW");
        QSPI_Configuration.add_hdl_path_slice("QSPI_Configuration", 0, 32, 0);

        Device_Read_Instruction = Device_Read_Instruction_reg::type_id::create("Device_Read_Instruction");
        Device_Read_Instruction.configure(this, null, "");
        Device_Read_Instruction.build();
        default_map.add_reg(Device_Read_Instruction, 'h4, "RW");
        Device_Read_Instruction.add_hdl_path_slice("Device_Read_Instruction", 0, 32, 0);

        Device_Write_Instruction_Configuration = Device_Write_Instruction_Configuration_reg::type_id::create("Device_Write_Instruction_Configuration");
        Device_Write_Instruction_Configuration.configure(this, null, "");
        Device_Write_Instruction_Configuration.build();
        default_map.add_reg(Device_Write_Instruction_Configuration, 'h8, "RW");
        Device_Write_Instruction_Configuration.add_hdl_path_slice("Device_Write_Instruction_Configuration", 0, 32, 0);

        QSPI_Device_Delay = QSPI_Device_Delay_reg::type_id::create("QSPI_Device_Delay");
        QSPI_Device_Delay.configure(this, null, "");
        QSPI_Device_Delay.build();
        default_map.add_reg(QSPI_Device_Delay, 'hC, "RW");
        QSPI_Device_Delay.add_hdl_path_slice("QSPI_Device_Delay", 0, 32, 0);

        Read_Data_Capture = Read_Data_Capture_reg::type_id::create("Read_Data_Capture");
        Read_Data_Capture.configure(this, null, "");
        Read_Data_Capture.build();
        default_map.add_reg(Read_Data_Capture, 'h10, "RW");
        Read_Data_Capture.add_hdl_path_slice("Read_Data_Capture", 0, 32, 0);

        Device_Size_Configuration = Device_Size_Configuration_reg::type_id::create("Device_Size_Configuration");
        Device_Size_Configuration.configure(this, null, "");
        Device_Size_Configuration.build();
        default_map.add_reg(Device_Size_Configuration, 'h14, "RW");
        Device_Size_Configuration.add_hdl_path_slice("Device_Size_Configuration", 0, 32, 0);

        SRAM_Partition_Configuration = SRAM_Partition_Configuration_reg::type_id::create("SRAM_Partition_Configuration");
        SRAM_Partition_Configuration.configure(this, null, "");
        SRAM_Partition_Configuration.build();
        default_map.add_reg(SRAM_Partition_Configuration, 'h18, "RW");
        SRAM_Partition_Configuration.add_hdl_path_slice("SRAM_Partition_Configuration", 0, 32, 0);

        Indirect_AHB_Address_Trigger = Indirect_AHB_Address_Trigger_reg::type_id::create("Indirect_AHB_Address_Trigger");
        Indirect_AHB_Address_Trigger.configure(this, null, "");
        Indirect_AHB_Address_Trigger.build();
        default_map.add_reg(Indirect_AHB_Address_Trigger, 'h1C, "RW");
        Indirect_AHB_Address_Trigger.add_hdl_path_slice("Indirect_AHB_Address_Trigger", 0, 32, 0);

        DMA_Peripheral_Configuration = DMA_Peripheral_Configuration_reg::type_id::create("DMA_Peripheral_Configuration");
        DMA_Peripheral_Configuration.configure(this, null, "");
        DMA_Peripheral_Configuration.build();
        default_map.add_reg(DMA_Peripheral_Configuration, 'h20, "RW");
        DMA_Peripheral_Configuration.add_hdl_path_slice("DMA_Peripheral_Configuration", 0, 32, 0);

        Remap_Address = Remap_Address_reg::type_id::create("Remap_Address");
        Remap_Address.configure(this, null, "");
        Remap_Address.build();
        default_map.add_reg(Remap_Address, 'h24, "RW");
        Remap_Address.add_hdl_path_slice("Remap_Address", 0, 32, 0);

        Mode_Bit_Configuration = Mode_Bit_Configuration_reg::type_id::create("Mode_Bit_Configuration");
        Mode_Bit_Configuration.configure(this, null, "");
        Mode_Bit_Configuration.build();
        default_map.add_reg(Mode_Bit_Configuration, 'h28, "RW");
        Mode_Bit_Configuration.add_hdl_path_slice("Mode_Bit_Configuration", 0, 32, 0);

        SRAM_Fill_Level = SRAM_Fill_Level_reg::type_id::create("SRAM_Fill_Level");
        SRAM_Fill_Level.configure(this, null, "");
        SRAM_Fill_Level.build();
        default_map.add_reg(SRAM_Fill_Level, 'h2C, "RO");
        SRAM_Fill_Level.add_hdl_path_slice("SRAM_Fill_Level", 0, 32, 0);

        TX_Threshold = TX_Threshold_reg::type_id::create("TX_Threshold");
        TX_Threshold.configure(this, null, "");
        TX_Threshold.build();
        default_map.add_reg(TX_Threshold, 'h30, "RW");
        TX_Threshold.add_hdl_path_slice("TX_Threshold", 0, 32, 0);

        RX_Threshold = RX_Threshold_reg::type_id::create("RX_Threshold");
        RX_Threshold.configure(this, null, "");
        RX_Threshold.build();
        default_map.add_reg(RX_Threshold, 'h34, "RW");
        RX_Threshold.add_hdl_path_slice("RX_Threshold", 0, 32, 0);

        Write_Completion_Control = Write_Completion_Control_reg::type_id::create("Write_Completion_Control");
        Write_Completion_Control.configure(this, null, "");
        Write_Completion_Control.build();
        default_map.add_reg(Write_Completion_Control, 'h38, "RW");
        Write_Completion_Control.add_hdl_path_slice("Write_Completion_Control", 0, 32, 0);

        Polling_Expiration = Polling_Expiration_reg::type_id::create("Polling_Expiration");
        Polling_Expiration.configure(this, null, "");
        Polling_Expiration.build();
        default_map.add_reg(Polling_Expiration, 'h3C, "RW");
        Polling_Expiration.add_hdl_path_slice("Polling_Expiration", 0, 32, 0);

        Interrupt_Status = Interrupt_Status_reg::type_id::create("Interrupt_Status");
        Interrupt_Status.configure(this, null, "");
        Interrupt_Status.build();
        default_map.add_reg(Interrupt_Status, 'h40, "RW");
        Interrupt_Status.add_hdl_path_slice("Interrupt_Status", 0, 32, 0);

        Interrupt_Mask = Interrupt_Mask_reg::type_id::create("Interrupt_Mask");
        Interrupt_Mask.configure(this, null, "");
        Interrupt_Mask.build();
        default_map.add_reg(Interrupt_Mask, 'h44, "RW");
        Interrupt_Mask.add_hdl_path_slice("Interrupt_Mask", 0, 32, 0);

        Lower_Write_Protection = Lower_Write_Protection_reg::type_id::create("Lower_Write_Protection");
        Lower_Write_Protection.configure(this, null, "");
        Lower_Write_Protection.build();
        default_map.add_reg(Lower_Write_Protection, 'h50, "RW");
        Lower_Write_Protection.add_hdl_path_slice("Lower_Write_Protection", 0, 32, 0);

        Upper_Write_Protection = Upper_Write_Protection_reg::type_id::create("Upper_Write_Protection");
        Upper_Write_Protection.configure(this, null, "");
        Upper_Write_Protection.build();
        default_map.add_reg(Upper_Write_Protection, 'h54, "RW");
        Upper_Write_Protection.add_hdl_path_slice("Upper_Write_Protection", 0, 32, 0);

        Write_Protection = Write_Protection_reg::type_id::create("Write_Protection");
        Write_Protection.configure(this, null, "");
        Write_Protection.build();
        default_map.add_reg(Write_Protection, 'h58, "RW");
        Write_Protection.add_hdl_path_slice("Write_Protection", 0, 32, 0);

        Indirect_Read_Transfer_Control = Indirect_Read_Transfer_Control_reg::type_id::create("Indirect_Read_Transfer_Control");
        Indirect_Read_Transfer_Control.configure(this, null, "");
        Indirect_Read_Transfer_Control.build();
        default_map.add_reg(Indirect_Read_Transfer_Control, 'h60, "RW");
        Indirect_Read_Transfer_Control.add_hdl_path_slice("Indirect_Read_Transfer_Control", 0, 32, 0);

        Indirect_Read_Transfer_Watermark = Indirect_Read_Transfer_Watermark_reg::type_id::create("Indirect_Read_Transfer_Watermark");
        Indirect_Read_Transfer_Watermark.configure(this, null, "");
        Indirect_Read_Transfer_Watermark.build();
        default_map.add_reg(Indirect_Read_Transfer_Watermark, 'h64, "RW");
        Indirect_Read_Transfer_Watermark.add_hdl_path_slice("Indirect_Read_Transfer_Watermark", 0, 32, 0);

        Indirect_Read_Transfer_Start_Address = Indirect_Read_Transfer_Start_Address_reg::type_id::create("Indirect_Read_Transfer_Start_Address");
        Indirect_Read_Transfer_Start_Address.configure(this, null, "");
        Indirect_Read_Transfer_Start_Address.build();
        default_map.add_reg(Indirect_Read_Transfer_Start_Address, 'h68, "RW");
        Indirect_Read_Transfer_Start_Address.add_hdl_path_slice("Indirect_Read_Transfer_Start_Address", 0, 32, 0);

        Indirect_Read_Transfer_Number_Bytes = Indirect_Read_Transfer_Number_Bytes_reg::type_id::create("Indirect_Read_Transfer_Number_Bytes");
        Indirect_Read_Transfer_Number_Bytes.configure(this, null, "");
        Indirect_Read_Transfer_Number_Bytes.build();
        default_map.add_reg(Indirect_Read_Transfer_Number_Bytes, 'h6C, "RW");
        Indirect_Read_Transfer_Number_Bytes.add_hdl_path_slice("Indirect_Read_Transfer_Number_Bytes", 0, 32, 0);

        Indirect_Write_Transfer_Control = Indirect_Write_Transfer_Control_reg::type_id::create("Indirect_Write_Transfer_Control");
        Indirect_Write_Transfer_Control.configure(this, null, "");
        Indirect_Write_Transfer_Control.build();
        default_map.add_reg(Indirect_Write_Transfer_Control, 'h70, "RW");
        Indirect_Write_Transfer_Control.add_hdl_path_slice("Indirect_Write_Transfer_Control", 0, 32, 0);

        Indirect_Write_Transfer_Watermark = Indirect_Write_Transfer_Watermark_reg::type_id::create("Indirect_Write_Transfer_Watermark");
        Indirect_Write_Transfer_Watermark.configure(this, null, "");
        Indirect_Write_Transfer_Watermark.build();
        default_map.add_reg(Indirect_Write_Transfer_Watermark, 'h74, "RW");
        Indirect_Write_Transfer_Watermark.add_hdl_path_slice("Indirect_Write_Transfer_Watermark", 0, 32, 0);

        Indirect_Write_Transfer_Start_Address = Indirect_Write_Transfer_Start_Address_reg::type_id::create("Indirect_Write_Transfer_Start_Address");
        Indirect_Write_Transfer_Start_Address.configure(this, null, "");
        Indirect_Write_Transfer_Start_Address.build();
        default_map.add_reg(Indirect_Write_Transfer_Start_Address, 'h78, "RW");
        Indirect_Write_Transfer_Start_Address.add_hdl_path_slice("Indirect_Write_Transfer_Start_Address", 0, 32, 0);

        Indirect_Write_Transfer_Number_Bytes = Indirect_Write_Transfer_Number_Bytes_reg::type_id::create("Indirect_Write_Transfer_Number_Bytes");
        Indirect_Write_Transfer_Number_Bytes.configure(this, null, "");
        Indirect_Write_Transfer_Number_Bytes.build();
        default_map.add_reg(Indirect_Write_Transfer_Number_Bytes, 'h7C, "RW");
        Indirect_Write_Transfer_Number_Bytes.add_hdl_path_slice("Indirect_Write_Transfer_Number_Bytes", 0, 32, 0);

        Indirect_Trigger_Address_Range = Indirect_Trigger_Address_Range_reg::type_id::create("Indirect_Trigger_Address_Range");
        Indirect_Trigger_Address_Range.configure(this, null, "");
        Indirect_Trigger_Address_Range.build();
        default_map.add_reg(Indirect_Trigger_Address_Range, 'h80, "RW");
        Indirect_Trigger_Address_Range.add_hdl_path_slice("Indirect_Trigger_Address_Range", 0, 32, 0);

        Flash_Command_Control = Flash_Command_Control_reg::type_id::create("Flash_Command_Control");
        Flash_Command_Control.configure(this, null, "");
        Flash_Command_Control.build();
        default_map.add_reg(Flash_Command_Control, 'h90, "RW");
        Flash_Command_Control.add_hdl_path_slice("Flash_Command_Control", 0, 32, 0);

        Flash_Command_Address = Flash_Command_Address_reg::type_id::create("Flash_Command_Address");
        Flash_Command_Address.configure(this, null, "");
        Flash_Command_Address.build();
        default_map.add_reg(Flash_Command_Address, 'h94, "RW");
        Flash_Command_Address.add_hdl_path_slice("Flash_Command_Address", 0, 32, 0);

        Flash_Command_Read_Data_Lower = Flash_Command_Read_Data_Lower_reg::type_id::create("Flash_Command_Read_Data_Lower");
        Flash_Command_Read_Data_Lower.configure(this, null, "");
        Flash_Command_Read_Data_Lower.build();
        default_map.add_reg(Flash_Command_Read_Data_Lower, 'hA0, "RO");
        Flash_Command_Read_Data_Lower.add_hdl_path_slice("Flash_Command_Read_Data_Lower", 0, 32, 0);

        Flash_Command_Read_Data_Upper = Flash_Command_Read_Data_Upper_reg::type_id::create("Flash_Command_Read_Data_Upper");
        Flash_Command_Read_Data_Upper.configure(this, null, "");
        Flash_Command_Read_Data_Upper.build();
        default_map.add_reg(Flash_Command_Read_Data_Upper, 'hA4, "RO");
        Flash_Command_Read_Data_Upper.add_hdl_path_slice("Flash_Command_Read_Data_Upper", 0, 32, 0);

        Flash_Command_Write_Data_Lower = Flash_Command_Write_Data_Lower_reg::type_id::create("Flash_Command_Write_Data_Lower");
        Flash_Command_Write_Data_Lower.configure(this, null, "");
        Flash_Command_Write_Data_Lower.build();
        default_map.add_reg(Flash_Command_Write_Data_Lower, 'hA8, "RW");
        Flash_Command_Write_Data_Lower.add_hdl_path_slice("Flash_Command_Write_Data_Lower", 0, 32, 0);

        Flash_Command_Write_Data_Upper = Flash_Command_Write_Data_Upper_reg::type_id::create("Flash_Command_Write_Data_Upper");
        Flash_Command_Write_Data_Upper.configure(this, null, "");
        Flash_Command_Write_Data_Upper.build();
        default_map.add_reg(Flash_Command_Write_Data_Upper, 'hAC, "RW");
        Flash_Command_Write_Data_Upper.add_hdl_path_slice("Flash_Command_Write_Data_Upper", 0, 32, 0);

        Polling_Flash_Status = Polling_Flash_Status_reg::type_id::create("Polling_Flash_Status");
        Polling_Flash_Status.configure(this, null, "");
        Polling_Flash_Status.build();
        default_map.add_reg(Polling_Flash_Status, 'hB0, "RO");
        Polling_Flash_Status.add_hdl_path_slice("Polling_Flash_Status", 0, 32, 0);

        Module_ID = Module_ID_reg::type_id::create("Module_ID");
        Module_ID.configure(this, null, "");
        Module_ID.build();
        default_map.add_reg(Module_ID, 'hFC, "RO");
        Module_ID.add_hdl_path_slice("Module_ID", 0, 32, 0);

        lock_model();
    endfunction

endclass : qspi_reg_block

`endif // _QSPI_REG_BLOCK_SV_
