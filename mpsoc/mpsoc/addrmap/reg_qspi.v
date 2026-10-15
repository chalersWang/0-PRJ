`ifndef _REG_QSPI_V_
`define _REG_QSPI_V_
//=====================================================================
// reg_qspi.v —— qspi 模块详细寄存器地址宏
// 宏名: <模块>_<寄存器>    值: <模块>_BASE_ADDR + 偏移 (绝对地址)
// 基址宏 <模块>_BASE_ADDR 见 addressmap.v; 层次宏 <模块>_HIER 见 hierarchy.v。
//=====================================================================

// ---------- QSPI  (基址 32'h48000000) ----------
`define QSPI_QSPI_Configuration (QSPI_BASE_ADDR + 32'h0)
`define QSPI_Device_Read_Instruction (QSPI_BASE_ADDR + 32'h4)
`define QSPI_Device_Write_Instruction_Configuration (QSPI_BASE_ADDR + 32'h8)
`define QSPI_QSPI_Device_Delay (QSPI_BASE_ADDR + 32'hC)
`define QSPI_Read_Data_Capture (QSPI_BASE_ADDR + 32'h10)
`define QSPI_Device_Size_Configuration (QSPI_BASE_ADDR + 32'h14)
`define QSPI_SRAM_Partition_Configuration (QSPI_BASE_ADDR + 32'h18)
`define QSPI_Indirect_AHB_Address_Trigger (QSPI_BASE_ADDR + 32'h1C)
`define QSPI_DMA_Peripheral_Configuration (QSPI_BASE_ADDR + 32'h20)
`define QSPI_Remap_Address (QSPI_BASE_ADDR + 32'h24)
`define QSPI_Mode_Bit_Configuration (QSPI_BASE_ADDR + 32'h28)
`define QSPI_SRAM_Fill_Level (QSPI_BASE_ADDR + 32'h2C)
`define QSPI_TX_Threshold (QSPI_BASE_ADDR + 32'h30)
`define QSPI_RX_Threshold (QSPI_BASE_ADDR + 32'h34)
`define QSPI_Write_Completion_Control (QSPI_BASE_ADDR + 32'h38)
`define QSPI_Polling_Expiration (QSPI_BASE_ADDR + 32'h3C)
`define QSPI_Interrupt_Status (QSPI_BASE_ADDR + 32'h40)
`define QSPI_Interrupt_Mask (QSPI_BASE_ADDR + 32'h44)
`define QSPI_Lower_Write_Protection (QSPI_BASE_ADDR + 32'h50)
`define QSPI_Upper_Write_Protection (QSPI_BASE_ADDR + 32'h54)
`define QSPI_Write_Protection (QSPI_BASE_ADDR + 32'h58)
`define QSPI_Indirect_Read_Transfer_Control (QSPI_BASE_ADDR + 32'h60)
`define QSPI_Indirect_Read_Transfer_Watermark (QSPI_BASE_ADDR + 32'h64)
`define QSPI_Indirect_Read_Transfer_Start_Address (QSPI_BASE_ADDR + 32'h68)
`define QSPI_Indirect_Read_Transfer_Number_Bytes (QSPI_BASE_ADDR + 32'h6C)
`define QSPI_Indirect_Write_Transfer_Control (QSPI_BASE_ADDR + 32'h70)
`define QSPI_Indirect_Write_Transfer_Watermark (QSPI_BASE_ADDR + 32'h74)
`define QSPI_Indirect_Write_Transfer_Start_Address (QSPI_BASE_ADDR + 32'h78)
`define QSPI_Indirect_Write_Transfer_Number_Bytes (QSPI_BASE_ADDR + 32'h7C)
`define QSPI_Indirect_Trigger_Address_Range (QSPI_BASE_ADDR + 32'h80)
`define QSPI_Flash_Command_Control (QSPI_BASE_ADDR + 32'h90)
`define QSPI_Flash_Command_Address (QSPI_BASE_ADDR + 32'h94)
`define QSPI_Flash_Command_Read_Data_Lower (QSPI_BASE_ADDR + 32'hA0)
`define QSPI_Flash_Command_Read_Data_Upper (QSPI_BASE_ADDR + 32'hA4)
`define QSPI_Flash_Command_Write_Data_Lower (QSPI_BASE_ADDR + 32'hA8)
`define QSPI_Flash_Command_Write_Data_Upper (QSPI_BASE_ADDR + 32'hAC)
`define QSPI_Polling_Flash_Status (QSPI_BASE_ADDR + 32'hB0)
`define QSPI_Module_ID (QSPI_BASE_ADDR + 32'hFC)

`endif // _REG_QSPI_V_
