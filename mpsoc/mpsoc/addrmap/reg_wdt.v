`ifndef _REG_WDT_V_
`define _REG_WDT_V_
//=====================================================================
// reg_wdt.v —— wdt 模块详细寄存器地址宏
// 宏名: <模块>_<寄存器>    值: <模块>_BASE_ADDR + 偏移 (绝对地址)
// 基址宏 <模块>_BASE_ADDR 见 addressmap.v; 层次宏 <模块>_HIER 见 hierarchy.v。
//=====================================================================

// ---------- WDT  (基址 32'h4001A000) ----------
`define WDT_WDT_CR             (WDT_BASE_ADDR + 32'h00)
`define WDT_WDT_TORR           (WDT_BASE_ADDR + 32'h04)
`define WDT_WDT_CCVR           (WDT_BASE_ADDR + 32'h08)
`define WDT_WDT_CRR            (WDT_BASE_ADDR + 32'h0C)
`define WDT_WDT_STAT           (WDT_BASE_ADDR + 32'h10)
`define WDT_WDT_EOI            (WDT_BASE_ADDR + 32'h14)
`define WDT_WDT_PROT_LEVEL     (WDT_BASE_ADDR + 32'h1C)
`define WDT_WDT_SFTY_INTR_STAT (WDT_BASE_ADDR + 32'h20)
`define WDT_WDT_SFTY_INTR_CLR  (WDT_BASE_ADDR + 32'h24)
`define WDT_WDT_COMP_PARAM_5   (WDT_BASE_ADDR + 32'hE4)
`define WDT_WDT_COMP_PARAM_4   (WDT_BASE_ADDR + 32'hE8)
`define WDT_WDT_COMP_PARAM_3   (WDT_BASE_ADDR + 32'hEC)
`define WDT_WDT_COMP_PARAM_2   (WDT_BASE_ADDR + 32'hF0)
`define WDT_WDT_COMP_PARAM_1   (WDT_BASE_ADDR + 32'hF4)
`define WDT_WDT_COMP_VERSION   (WDT_BASE_ADDR + 32'hF8)
`define WDT_WDT_COMP_TYPE      (WDT_BASE_ADDR + 32'hFC)

`endif // _REG_WDT_V_
