`ifndef _REG_SYSCTRL_V_
`define _REG_SYSCTRL_V_
//=====================================================================
// reg_sysctrl.v —— sysctrl 模块详细寄存器地址宏
// 宏名: <模块>_<寄存器>    值: <模块>_BASE_ADDR + 偏移 (绝对地址)
// 基址宏 <模块>_BASE_ADDR 见 addressmap.v; 层次宏 <模块>_HIER 见 hierarchy.v。
//=====================================================================

// ---------- SYSCTRL  (基址 32'h40017000) ----------
`define SYSCTRL_System_Config (SYSCTRL_BASE_ADDR + 32'h0)
`define SYSCTRL_PDI_Config (SYSCTRL_BASE_ADDR + 32'h4)
`define SYSCTRL_LVDS_Config (SYSCTRL_BASE_ADDR + 32'h8)
`define SYSCTRL_IRT_Sync_Timestamp (SYSCTRL_BASE_ADDR + 32'hC)
`define SYSCTRL_PN_Cycle (SYSCTRL_BASE_ADDR + 32'h10)
`define SYSCTRL_CPU_PLL_Config (SYSCTRL_BASE_ADDR + 32'h14)
`define SYSCTRL_Core_ID (SYSCTRL_BASE_ADDR + 32'h18)
`define SYSCTRL_ECAT_PDI_Clock (SYSCTRL_BASE_ADDR + 32'h1C)
`define SYSCTRL_Security_Control (SYSCTRL_BASE_ADDR + 32'h20)
`define SYSCTRL_Boot_Control (SYSCTRL_BASE_ADDR + 32'h24)
`define SYSCTRL_Reset_Control (SYSCTRL_BASE_ADDR + 32'h28)
`define SYSCTRL_ECAT1_Config (SYSCTRL_BASE_ADDR + 32'h2C)
`define SYSCTRL_CORE0_SW_INT (SYSCTRL_BASE_ADDR + 32'h74)
`define SYSCTRL_CORE1_SW_INT (SYSCTRL_BASE_ADDR + 32'h78)
`define SYSCTRL_Cycle_Count_Mask (SYSCTRL_BASE_ADDR + 32'h7C0)
`define SYSCTRL_COMPA (SYSCTRL_BASE_ADDR + 32'h7C4)
`define SYSCTRL_COMPB (SYSCTRL_BASE_ADDR + 32'h7C8)
`define SYSCTRL_COMPC (SYSCTRL_BASE_ADDR + 32'h7CC)
`define SYSCTRL_COMPD (SYSCTRL_BASE_ADDR + 32'h7D0)
`define SYSCTRL_PN_IP_EVENT_CTRL (SYSCTRL_BASE_ADDR + 32'h7D4)

`endif // _REG_SYSCTRL_V_
