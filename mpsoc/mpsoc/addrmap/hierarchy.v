`ifndef _HIERARCHY_V_
`define _HIERARCHY_V_
//=====================================================================
// hierarchy.v —— 各模块实例化层次宏 (后门访问 hierarchical path)
// 宏名: <模块>_HIER    值: "tb_top.DUT.<handle>_regs"
// 用法: <block>.set_hdl_path_root(<模块>_HIER);
//=====================================================================

`define SYSCTRL_HIER  "tb_top.DUT.sysctrl_regs"
`define GPIO_HIER     "tb_top.DUT.gpio_regs"
`define I2C_HIER      "tb_top.DUT.i2c_regs"
`define SPI_HIER      "tb_top.DUT.spi_regs"
`define UART0_HIER    "tb_top.DUT.uart0_regs"
`define UART1_HIER    "tb_top.DUT.uart1_regs"
`define UART2_HIER    "tb_top.DUT.uart2_regs"
`define WDT_HIER      "tb_top.DUT.wdt_regs"
`define TIM0_HIER     "tb_top.DUT.tim0_regs"
`define TIM1_HIER     "tb_top.DUT.tim1_regs"
`define DMA_HIER      "tb_top.DUT.dma_regs"
`define GMAC_HIER     "tb_top.DUT.gmac_regs"
`define QSPI_HIER     "tb_top.DUT.qspi_regs"
`define SDRAM_HIER    "tb_top.DUT.sdram_regs"
`define ESC0_HIER     "tb_top.DUT.esc0_regs"
`define ESC1_HIER     "tb_top.DUT.esc1_regs"
`define JTAG_HIER     "tb_top.DUT.jtag_regs"
`define SWITCH_HIER   "tb_top.DUT.sw_regs"
`define MIIPHY_HIER   "tb_top.DUT.miiphy_regs"
`define EFUSE_HIER    "tb_top.DUT.efuse_regs"
`define UC_HIER       "tb_top.DUT.uc_regs"
`define SECURITY_HIER "tb_top.DUT.security_regs"
`define PN_IRT_HIER   "tb_top.DUT.pn_irt_regs"

`endif // _HIERARCHY_V_
