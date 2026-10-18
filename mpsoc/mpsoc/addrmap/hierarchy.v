`ifndef _HIERARCHY_V_
`define _HIERARCHY_V_
//=====================================================================
// hierarchy.v —— 各模块实例化层次宏 (后门访问 hierarchical path)
// 宏名: HIER_<模块>    值: "tb_top.DUT.<handle>_regs"
// 用法: <block>.set_hdl_path_root(HIER_<模块>);
//=====================================================================

`define HIER_SYSCTRL  "tb_top.DUT.sysctrl_regs"
`define HIER_GPIO     "tb_top.DUT.gpio_regs"
`define HIER_I2C      "tb_top.DUT.i2c_regs"
`define HIER_SPI      "tb_top.DUT.spi_regs"
`define HIER_UART0    "tb_top.DUT.uart0_regs"
`define HIER_UART1    "tb_top.DUT.uart1_regs"
`define HIER_UART2    "tb_top.DUT.uart2_regs"
`define HIER_WDT      "tb_top.DUT.wdt_regs"
`define HIER_TIM0     "tb_top.DUT.tim0_regs"
`define HIER_TIM1     "tb_top.DUT.tim1_regs"
`define HIER_DMA      "tb_top.DUT.dma_regs"
`define HIER_GMAC     "tb_top.DUT.gmac_regs"
`define HIER_QSPI     "tb_top.DUT.qspi_regs"
`define HIER_SDRAM    "tb_top.DUT.sdram_regs"
`define HIER_ESC0     "tb_top.DUT.esc0_regs"
`define HIER_ESC1     "tb_top.DUT.esc1_regs"
`define HIER_JTAG     "tb_top.DUT.jtag_regs"
`define HIER_SWITCH   "tb_top.DUT.sw_regs"
`define HIER_MIIPHY   "tb_top.DUT.miiphy_regs"
`define HIER_EFUSE    "tb_top.DUT.efuse_regs"
`define HIER_UC       "tb_top.DUT.uc_regs"
`define HIER_SECURITY "tb_top.DUT.security_regs"
`define HIER_PN_IRT   "tb_top.DUT.pn_irt_regs"

//=====================================================================
// 以下合并自原 sva/VifMacroDefine.v —— 各模块 VIF 宏 + 双核内存层级
//=====================================================================

`define MPSOC_TOP_VIF     tb_top.DUT

`define UT_SYSCTRL_VIF     `MPSOC_TOP_VIF
`define UT_JTAG_VIF        `MPSOC_TOP_VIF
`define UT_UART_VIF        `MPSOC_TOP_VIF
`define UT_GPIO_VIF        `MPSOC_TOP_VIF
`define UT_QSPI_VIF        `MPSOC_TOP_VIF
`define UT_SWITCH_VIF      `MPSOC_TOP_VIF
`define UT_MIIPHY_VIF      `MPSOC_TOP_VIF
`define UT_EFUSE_VIF       `MPSOC_TOP_VIF
`define UT_I2C_VIF         `MPSOC_TOP_VIF
`define UT_SPI_VIF         `MPSOC_TOP_VIF
`define UT_WDT_VIF         `MPSOC_TOP_VIF
`define UT_TIM_VIF         `MPSOC_TOP_VIF
`define UT_UC_VIF          `MPSOC_TOP_VIF
`define UT_SDRAM_VIF       `MPSOC_TOP_VIF
`define UT_SECURITY_VIF    `MPSOC_TOP_VIF
`define UT_DMA_VIF         `MPSOC_TOP_VIF
`define UT_PN_IRT_VIF      `MPSOC_TOP_VIF
`define UT_ESC_VIF         `MPSOC_TOP_VIF
`define UT_GMAC_VIF        `MPSOC_TOP_VIF

// 双核 RISC-V 子系统(kcore0/kcore1)与 iram/dram 内存层级(iram/dram 各 16KB: mem_array[4095:0][31:0])
`define UT_RVCORE           `MPSOC_TOP_VIF.x_cpu_sub_system_ahb
`define UT_RVCORE_C1        `MPSOC_TOP_VIF.x_cpu_sub_system_ahb_c1
`define UT_RVCORE_IRAM      `MPSOC_TOP_VIF.x_cpu_sub_system_ahb.x_iahb_mem_ctrl.mem_x256y16d32_inst.mem_array
`define UT_RVCORE_DRAM      `MPSOC_TOP_VIF.x_cpu_sub_system_ahb.x_dahb_mem_ctrl.mem_x256y16d32_inst.mem_array
`define UT_RVCORE_C1_IRAM   `MPSOC_TOP_VIF.x_cpu_sub_system_ahb_c1.x_iahb_mem_ctrl.mem_x256y16d32_inst.mem_array
`define UT_RVCORE_C1_DRAM   `MPSOC_TOP_VIF.x_cpu_sub_system_ahb_c1.x_dahb_mem_ctrl.mem_x256y16d32_inst.mem_array

`endif // _HIERARCHY_V_
