+define+UVM_PACKER_MAX_BYTES=1500000
+define+SVT_UVM_TECHNOLOGY
+define+SVT_FSDB_ENABLE
+define+UVM_DISABLE_AUTO_ITEM_RECORDING
+define+SYNOPSYS_SV
//Disable AXI coveragroup
+define+SVT_AXI_MON_CFG_BASED_COV_GRP_dEF

//+incdir+${XX_VIP_HOME}/include
//+incdir+${XX_VIP_HOME}/vcs

//============================================================================
// Synopsys DesignWare VIP 封装层接入(接入时取消注释,填实际 VIP 库路径)
//   1) Synopsys VIP 库 incdir(按所装 VIP 目录):
//+incdir+${DESIGNWARE_HOME}/vip/amba/svt/include
//+incdir+${DESIGNWARE_HOME}/vip/amba/svt/vcs
//   2) 本环境 VIP 封装 incdir:
//+incdir+${VERIFY_HOME}/uvc/VIP/i2c
//+incdir+${VERIFY_HOME}/uvc/VIP/spi
//+incdir+${VERIFY_HOME}/uvc/VIP/uart
//+incdir+${VERIFY_HOME}/uvc/VIP/axi
//+incdir+${VERIFY_HOME}/uvc/VIP/ahb
//+incdir+${VERIFY_HOME}/uvc/VIP/apb
//+incdir+${VERIFY_HOME}/uvc/VIP/gpio
//+incdir+${VERIFY_HOME}/uvc/VIP/wdt
//+incdir+${VERIFY_HOME}/uvc/VIP/timer
//+incdir+${VERIFY_HOME}/uvc/VIP/qspi
//+incdir+${VERIFY_HOME}/uvc/VIP/jtag
//   3) VIP 封装 package(.svh 由 EnvTop/TestTop 的 import 触发 include):
//${VERIFY_HOME}/uvc/VIP/i2c/svt_i2c_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/spi/svt_spi_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/uart/svt_uart_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/axi/svt_axi_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/ahb/svt_ahb_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/apb/svt_apb_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/gpio/svt_gpio_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/wdt/svt_wdt_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/timer/svt_timer_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/qspi/svt_qspi_UvcTop.svh
//${VERIFY_HOME}/uvc/VIP/jtag/svt_jtag_UvcTop.svh
//============================================================================

