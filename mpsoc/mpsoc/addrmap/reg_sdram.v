`ifndef _REG_SDRAM_V_
`define _REG_SDRAM_V_
//=====================================================================
// reg_sdram.v —— sdram 模块详细寄存器地址宏
// 宏名: <模块>_<寄存器>    值: <模块>_BASE_ADDR + 偏移 (绝对地址)
// 基址宏 <模块>_BASE_ADDR 见 addressmap.v; 层次宏 <模块>_HIER 见 hierarchy.v。
//=====================================================================

// ---------- SDRAM  (基址 32'h54000000) ----------
`define SDRAM_SCONR        (SDRAM_BASE_ADDR + 32'h00)
`define SDRAM_STMG0R       (SDRAM_BASE_ADDR + 32'h04)
`define SDRAM_STMG1R       (SDRAM_BASE_ADDR + 32'h08)
`define SDRAM_SCTLR        (SDRAM_BASE_ADDR + 32'h0C)
`define SDRAM_SREFR        (SDRAM_BASE_ADDR + 32'h10)
`define SDRAM_SCSLR0_LOW   (SDRAM_BASE_ADDR + 32'h14)
`define SDRAM_SCSLR1_LOW   (SDRAM_BASE_ADDR + 32'h18)
`define SDRAM_SCSLR2_LOW   (SDRAM_BASE_ADDR + 32'h1C)
`define SDRAM_SCSLR3_LOW   (SDRAM_BASE_ADDR + 32'h20)
`define SDRAM_SCSLR4_LOW   (SDRAM_BASE_ADDR + 32'h24)
`define SDRAM_SCSLR5_LOW   (SDRAM_BASE_ADDR + 32'h28)
`define SDRAM_SCSLR6_LOW   (SDRAM_BASE_ADDR + 32'h2C)
`define SDRAM_SCSLR7_LOW   (SDRAM_BASE_ADDR + 32'h30)
`define SDRAM_SMSKR0       (SDRAM_BASE_ADDR + 32'h54)
`define SDRAM_SMSKR1       (SDRAM_BASE_ADDR + 32'h58)
`define SDRAM_SMSKR2       (SDRAM_BASE_ADDR + 32'h5C)
`define SDRAM_SMSKR3       (SDRAM_BASE_ADDR + 32'h60)
`define SDRAM_SMSKR4       (SDRAM_BASE_ADDR + 32'h64)
`define SDRAM_SMSKR5       (SDRAM_BASE_ADDR + 32'h68)
`define SDRAM_SMSKR6       (SDRAM_BASE_ADDR + 32'h6C)
`define SDRAM_SMSKR7       (SDRAM_BASE_ADDR + 32'h70)
`define SDRAM_CSALIAS0_LOW (SDRAM_BASE_ADDR + 32'h74)
`define SDRAM_CSALIAS1_LOW (SDRAM_BASE_ADDR + 32'h78)
`define SDRAM_CSREMAP0_LOW (SDRAM_BASE_ADDR + 32'h84)
`define SDRAM_CSREMAP1_LOW (SDRAM_BASE_ADDR + 32'h88)
`define SDRAM_SMTMGR_SET0  (SDRAM_BASE_ADDR + 32'h94)
`define SDRAM_SMTMGR_SET1  (SDRAM_BASE_ADDR + 32'h98)
`define SDRAM_SMTMGR_SET2  (SDRAM_BASE_ADDR + 32'h9C)
`define SDRAM_FLASH_TRPDR  (SDRAM_BASE_ADDR + 32'hA0)
`define SDRAM_SMCTLR       (SDRAM_BASE_ADDR + 32'hA4)
`define SDRAM_EXN_MODE_REG (SDRAM_BASE_ADDR + 32'hAC)
`define SDRAM_COMP_TYPE    (SDRAM_BASE_ADDR + 32'hFC)

`endif // _REG_SDRAM_V_
