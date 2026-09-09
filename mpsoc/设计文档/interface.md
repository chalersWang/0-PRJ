# interface（接口信号列表）

## interface

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| 系统控制与时钟 | i_pad_clk | input | 1 | 系统时钟输入 |
|  | i_pad_rst_b | input | 1 | 系统复位信号（低有效） |
|  | i_pad_boot_mode | input | 2 | 启动模式选择配置 |
|  | i_pad_host_if_mode | input | 1 | 主机接口模式选择 |
|  | i_pad_bypass_secure | input | 1 | 安全旁路控制信号 |
| JTAG 调试接口 | i_pad_jtg_nrst_b | input | 1 | JTAG 复位信号（低有效） |
|  | i_pad_jtg_tclk | input | 1 | JTAG 测试时钟 |
|  | i_pad_jtg_tdi | input | 1 | JTAG 测试数据输入 |
|  | i_pad_jtg_tms | input | 1 | JTAG 测试模式选择 |
|  | i_pad_jtg_trst_b | input | 1 | JTAG 测试复位（低有效） |
|  | o_pad_jtg_tdo | output | 1 | JTAG 测试数据输出 |
| UART 串口 | i_pad_uart0_sin | input | 1 | UART0 串行数据输入 |
|  | o_pad_uart0_sout | output | 1 | UART0 串行数据输出 |
| GPIO 通用接口 | b_pad_gpio_porta | inout | 32 | GPIO A 端口双向数据 |
|  | b_pad_gpio_portb | inout | 16 | GPIO B 端口双向数据 |
| QSPI 闪存接口 | QSPI_CS0N_o | output | 1 | QSPI 片选 0 输出 |
|  | QSPI_CS1N_o | output | 1 | QSPI 片选 1 输出 |
|  | QSPI_CS2N_o | output | 1 | QSPI 片选 2 输出 |
|  | QSPI_CS3N_o | output | 1 | QSPI 片选 3 输出 |
|  | QSPI_DAT0 | inout | 1 | QSPI 数据位 0 (双向) |
|  | QSPI_DAT1 | inout | 1 | QSPI 数据位 1 (双向) |
|  | QSPI_DAT2 | inout | 1 | QSPI 数据位 2 (双向) |
|  | QSPI_DAT3 | inout | 1 | QSPI 数据位 3 (双向) |
|  | QSPI_SCLK_o | output | 1 | QSPI 串行时钟输出 |
| 以太网交换机接口 (MII) | switch_mii_p0_rxclock | input | 1 | Port 0 MII 接收时钟 |
|  | switch_mii_p0_rxerror | input | 1 | Port 0 MII 接收错误指示 |
|  | switch_mii_p0_rxenable | input | 1 | Port 0 MII 接收使能 |
|  | switch_mii_p0_rx | input | 4 | Port 0 MII 接收数据 (4-bit) |
|  | switch_mii_p0_txclock | input | 1 | Port 0 MII 发送时钟 |
|  | switch_mii_p0_txenable | output | 1 | Port 0 MII 发送使能 |
|  | switch_mii_p0_tx | output | 4 | Port 0 MII 发送数据 (4-bit) |
|  | switch_mii_p0_link | input | 1 | Port 0 链路状态指示 |
|  | switch_mii_p1_rxclock | input | 1 | Port 1 MII 接收时钟 |
|  | switch_mii_p1_rxerror | input | 1 | Port 1 MII 接收错误指示 |
|  | switch_mii_p1_rxenable | input | 1 | Port 1 MII 接收使能 |
|  | switch_mii_p1_rx | input | 4 | Port 1 MII 接收数据 (4-bit) |
|  | switch_mii_p1_txclock | input | 1 | Port 1 MII 发送时钟 |
|  | switch_mii_p1_txenable | output | 1 | Port 1 MII 发送使能 |
|  | switch_mii_p1_tx | output | 4 | Port 1 MII 发送数据 (4-bit) |
|  | switch_mii_p1_link | input | 1 | Port 1 链路状态指示 |
|  | switch_mdio_clock | output | 1 | MDIO 管理接口时钟 |
|  | switch_mdio_data | inout | 1 | MDIO 管理接口数据 (双向) |
| 以太网 PHY 接口 | phy_rxd_i | input | 4 | PHY 接收数据 (4-bit) |
|  | phy_rxdv_i | input | 1 | PHY 接收数据有效指示 |
|  | phy_rxer_i | input | 1 | PHY 接收错误指示 |
|  | phy_txd_o | output | 4 | PHY 发送数据 (4-bit) |
|  | phy_txen_o | output | 1 | PHY 发送使能 |
|  | RGMIIRXC_i | input | 1 | RGMII 接收参考时钟 |
|  | RGMIITXC_o | input | 1 | RGMII 发送参考时钟 |
|  | phy_link_i | input | 1 | PHY 链路状态指示 |
| eFuse 熔丝编程 | o_efuse_dout | output | 4 | eFuse 数据输出 |
|  | i_efuse_pgm | input | 4 | eFuse 编程电压/控制 |
|  | i_efuse_sclk | input | 1 | eFuse 串行时钟 |
|  | i_efuse_cs | input | 1 | eFuse 片选 |
|  | i_efuse_wr | input | 1 | eFuse 写使能 |
| 同步信号 | o_pad_pn_sync | output | 4 | 脉冲同步信号输出 |
| 条件编译信号 | i_pad_test_mode | input | 1 | 测试模式输入 (FPGA_CLK未定义时) |
