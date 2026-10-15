`ifndef _REG_TIM_V_
`define _REG_TIM_V_
//=====================================================================
// reg_tim.v —— tim 模块详细寄存器地址宏
// 宏名: <模块>_<寄存器>    值: <模块>_BASE_ADDR + 偏移 (绝对地址)
// 基址宏 <模块>_BASE_ADDR 见 addressmap.v; 层次宏 <模块>_HIER 见 hierarchy.v。
//=====================================================================

// ---------- TIM0  (基址 32'h40018000) ----------
`define TIM0_Timer1LoadCount (TIM0_BASE_ADDR + 32'h0)
`define TIM0_Timer1CurrentValue (TIM0_BASE_ADDR + 32'h4)
`define TIM0_Timer1ControlReg (TIM0_BASE_ADDR + 32'h8)
`define TIM0_Timer1EOI (TIM0_BASE_ADDR + 32'hC)
`define TIM0_Timer1IntStatus (TIM0_BASE_ADDR + 32'h10)
`define TIM0_TimersIntStatus (TIM0_BASE_ADDR + 32'hA0)
`define TIM0_TimersEOI (TIM0_BASE_ADDR + 32'hA4)
`define TIM0_TimersRawIntStatus (TIM0_BASE_ADDR + 32'hA8)
`define TIM0_TIMERS_COMP_VERSION (TIM0_BASE_ADDR + 32'hAC)
`define TIM0_Timer1LoadCount2 (TIM0_BASE_ADDR + 32'hB0)
`define TIM0_Timer1ProtLevel (TIM0_BASE_ADDR + 32'hD0)

// ---------- TIM1  (基址 32'h40011000) ----------
`define TIM1_Timer1LoadCount (TIM1_BASE_ADDR + 32'h0)
`define TIM1_Timer1CurrentValue (TIM1_BASE_ADDR + 32'h4)
`define TIM1_Timer1ControlReg (TIM1_BASE_ADDR + 32'h8)
`define TIM1_Timer1EOI (TIM1_BASE_ADDR + 32'hC)
`define TIM1_Timer1IntStatus (TIM1_BASE_ADDR + 32'h10)
`define TIM1_TimersIntStatus (TIM1_BASE_ADDR + 32'hA0)
`define TIM1_TimersEOI (TIM1_BASE_ADDR + 32'hA4)
`define TIM1_TimersRawIntStatus (TIM1_BASE_ADDR + 32'hA8)
`define TIM1_TIMERS_COMP_VERSION (TIM1_BASE_ADDR + 32'hAC)
`define TIM1_Timer1LoadCount2 (TIM1_BASE_ADDR + 32'hB0)
`define TIM1_Timer1ProtLevel (TIM1_BASE_ADDR + 32'hD0)

`endif // _REG_TIM_V_
