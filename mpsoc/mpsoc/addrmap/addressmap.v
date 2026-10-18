`ifndef _ADDRESSMAP_V_
`define _ADDRESSMAP_V_
//=====================================================================
// addressmap.v —— 各模块基地址宏 (地址来源: mpsoc_reg_block.sv add_submap)
// 宏名: <模块>_BASE_ADDR    值: 绝对基地址
// 占位模块(jtag/switch/miiphy/efuse/uc)基址为 0, RTL 就绪后补。
//=====================================================================

`define SYSCTRL_BASE_ADDR  32'h40017000
`define GPIO_BASE_ADDR     32'h40019000
`define I2C_BASE_ADDR      32'h40021000
`define SPI_BASE_ADDR      32'h40031000
`define UART0_BASE_ADDR    32'h40015000
`define UART1_BASE_ADDR    32'h40026000
`define UART2_BASE_ADDR    32'h40025000
`define WDT_BASE_ADDR      32'h4001A000
`define TIM0_BASE_ADDR     32'h40018000
`define TIM1_BASE_ADDR     32'h40011000
`define DMA_BASE_ADDR      32'h42000000
`define GMAC_BASE_ADDR     32'h40040000
`define QSPI_BASE_ADDR     32'h48000000
`define SDRAM_BASE_ADDR    32'h54000000
`define ESC0_BASE_ADDR     32'h44C80000
`define ESC1_BASE_ADDR     32'h44C00000
`define JTAG_BASE_ADDR     32'h00000000
`define SWITCH_BASE_ADDR   32'h00000000
`define MIIPHY_BASE_ADDR   32'h00000000
`define EFUSE_BASE_ADDR    32'h00000000
`define UC_BASE_ADDR       32'h00000000
`define SECURITY_BASE_ADDR 32'h40012000
`define PN_IRT_BASE_ADDR   32'h43C90000

`endif // _ADDRESSMAP_V_
