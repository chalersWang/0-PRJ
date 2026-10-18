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

## rvcore

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| 系统控制与时钟 | cpu_clk | input | 1 | 系统时钟输入：E906 核心主时钟。 |
|  | clk_en | input | 1 | 时钟使能：用于控制时钟门控，通常用于低功耗模式。 |
|  | pad_cpu_rst_b | input | 1 | 系统复位信号：低电平有效，复位整个处理器核心。 |
|  | pg_reset_b | input | 1 | 电源管理复位：通常用于复位电源管理相关逻辑或作为次级复位。 |
|  | pmu_corec_isolation | input | 1 | 隔离控制信号：PMU（电源管理单元）发出的隔离信号，用于在掉电区与常电区之间隔离数据。 |
|  | pmu_corec_sleep_in | input | 1 | 休眠请求输入：PMU 发出的休眠指示信号，告知核心进入低功耗状态。 |
|  | corec_pmu_sleep_out | output | 1 | 休眠响应输出：核心向 PMU 反馈的休眠确认信号（WFI/WFE 后）。 |
| 总线接口 (AHB) | biu_pad_haddr | output | 32 | 地址总线：主机接口单元输出的 32 位地址信号。 |
|  | biu_pad_hburst | output | 3 | 突发传输类型：指示当前传输的突发模式（如单次、4拍、8拍等）。 |
|  | biu_pad_hprot | output | 3 | 保护控制：指示传输的属性（如缓存、缓冲、特权级等）。 |
|  | biu_pad_hsize | output | 2 | 传输大小：指示当前传输的数据宽度（如字节、半字、字）。 |
|  | biu_pad_htrans | output | 2 | 传输类型：指示当前传输的状态（如非顺序、顺序、空闲等）。 |
|  | biu_pad_hwdata | output | 32 | 写数据总线：主机向从机发送的数据。 |
|  | biu_pad_hwrite | output | 1 | 读写指示：高电平表示写操作，低电平表示读操作。 |
|  | biu_pad_hready | input | 1 | 就绪信号：从机反馈给主机的握手信号，表示传输完成。 |
|  | biu_pad_hrdata | input | 32 | 读数据总线：从机向主机返回的数据。 |
|  | biu_pad_hresp | input | 1 | 响应信号：从机反馈的传输结果（OKAY 或 ERROR）。 |
| 调试接口 (JTAG) | pad_had_jtg_tclk | input | 1 | JTAG 测试时钟。 |
|  | pad_had_jtg_tdi | input | 1 | JTAG 测试数据输入。 |
|  | pad_had_jtg_tms | input | 1 | JTAG 测试模式选择。 |
|  | pad_had_jtg_trst_b | input | 1 | JTAG 复位信号：低电平有效，异步复位 TAP 控制器。 |
|  | had_pad_jtg_tdo | output | 1 | JTAG 测试数据输出。 |
| 中断控制 (PLIC) | pad_vic_int_vld | input | 64 | 中断有效向量：连接 PLIC（平台级中断控制器），支持最多 64 个外部中断源输入。 |
| DFT/扫描链 | pad_yy_scan_enable | input | 1 | 扫描链使能：高电平激活内部扫描链，用于生产测试。 |
|  | pad_yy_scan_mode | input | 1 | 扫描模式选择：配置不同的扫描测试模式。 |
|  | pad_yy_scan_rst_b | input | 1 | 扫描复位：在扫描测试模式下使用的复位信号。 |
|  | pad_yy_icg_scan_en | input | 1 | ICG 扫描使能：专门用于控制时钟门控单元（ICG）的扫描旁路。 |
| 其他配置 | nmi_wake_int_lower | input | 2 | NMI/唤醒中断：不可屏蔽中断或唤醒源输入。 |
|  | pad_biu_bigend_b | input | 1 | 大小端配置：低电平有效，配置总线为大端模式（Big-Endian），高电平为小端。 |
|  | sys_rst | output | 1 | 系统复位输出：可能是 E906 输出给外设的复位信号（具体视集成方式而定）。 |

## security

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| System & Debug | i_clk | input | 1 | 系统主时钟输入 |
|  | i_rst_n | input | 1 | 系统复位信号（低电平有效） |
|  | o_irq | output | 1 | 中断请求输出 |
|  | i_scan_mode | input | 1 | 扫描测试模式使能（DFT相关） |
|  | i_skip_startup | input | 1 | 跳过启动初始化序列 |
| Verification | o_verify_vld | output | 1 | 验证环境数据有效指示 |
|  | o_verify_ok | output | 8 | 验证结果状态码/掩码 |
|  | i_verify_ack | input | 1 | 验证环境握手确认 |
| AHB Master Port | i_s_hsel | input | 1 | 主机片选信号 (Select) |
|  | i_s_haddr | input | 12 | 地址总线 (Address) |
|  | i_s_hwrite | input | 1 | 写使能 (Write Enable) |
|  | i_s_hsize | input | 3 | 传输位宽大小 (Size) |
|  | i_s_hburst | input | 3 | 突发传输类型 (Burst) |
|  | i_s_hprot | input | 4 | 保护类型 (Protection) |
|  | i_s_htrans | input | 2 | 传输类型 (Trans) |
|  | i_s_hmastlock | input | 1 | 主机锁定传输 (Master Lock) |
|  | i_s_hready | input | 1 | 主机就绪信号 (Ready) |
|  | i_s_hwdata | input | 32 | 写数据总线 (Write Data) |
| AHB Slave Port | o_m_hsel | output | 4 | 从机片选信号 (Select) |
|  | o_m_haddr | output | 64 | 地址总线 (Address) |
|  | o_m_htrans | output | 2 | 传输类型 (Trans) |
|  | o_m_hwrite | output | 1 | 写使能 (Write Enable) |
|  | o_m_hburst | output | 3 | 突发传输类型 (Burst) |
|  | o_m_hsize | output | 3 | 传输位宽大小 (Size) |
|  | o_m_hprot | output | 4 | 保护类型 (Protection) |
|  | o_m_hmaster | output | 3 | 主机ID标识 (Master ID) |
|  | o_m_hmastlock | output | 1 | 主机锁定传输 (Master Lock) |
|  | o_m_hready | output | 1 | 主机就绪信号 (Ready) |
|  | o_m_hwdata | output | 32 | 写数据总线 (Write Data) |
|  | o_m_hrdata | input | 32 | 读数据总线 (Read Data) |
|  | o_m_hresp | input | 2 | 传输响应状态 (Response) |
|  | o_m_hreadyout | input | 1 | 从机就绪输出 (Ready Out) |
| Clocks | o_ro_clk | output | 4 | 路由时钟输出 (Route Clock) |
|  | o_ro_out | output | 4 | 路由时钟输出 (Route Output) |
| eFuse Ctrl | o_chip_id | output | 32 | 芯片唯一 ID 输出 |
|  | o_uid | output | 32 | 用户 ID 输出 |
|  | o_efuse_dout | output | 4 | eFuse 串行数据输出 |
|  | i_efuse_pgm | input | 4 | eFuse 编程高压使能 |
|  | i_efuse_sclk | input | 1 | eFuse 串行时钟 |
|  | i_efuse_cs | input | 1 | eFuse 片选 |
|  | i_efuse_wr | input | 1 | eFuse 写使能 |

## dmac

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| AHB Manager Interface 1 | haddr1 | output | DMAH_HADDR_WIDTH | 主机接口1地址总线 |
|  | hwdata1 | output | DMAH_M1_HDATA_WIDTH | 主机接口1写数据总线 |
|  | hwriten1 | output | 1 | 主机接口1写使能 |
|  | hlock1 | output | 1 | 主机接口1锁定传输 |
|  | htrans1 | output | 2 | 主机接口1传输类型 |
|  | hburst1 | output | 3 | 主机接口1突发传输类型 |
|  | hsize1 | output | 3 | 主机接口1传输大小 |
|  | hprot1 | output | 4 | 主机接口1保护控制 |
| AHB Manager Interface 2 | (未列出具体信号) | - | - | 代码中预留了接口2的注释区域，但无具体信号定义 |
| AHB Manager Interface 3 | (未列出具体信号) | - | - | 代码中预留了接口3的注释区域，但无具体信号定义 |
| AHB Manager Interface 4 | (未列出具体信号) | - | - | 代码中预留了接口4的注释区域，但无具体信号定义 |
| AHB Subordinate Interface | hrdata | output | DMAH_S_HDATA_WIDTH | 从机接口读数据总线 |
|  | hready_resp | output | 1 | 从机接口就绪响应 |
|  | hresp | output | DMAH_SLV_HRESP_WIDTH | 从机接口响应状态 |
| Peripheral Handshaking Interface | dma_ack | output | DMAH_NUM_HS_INT | 外设握手确认信号 |
|  | dma_finish | output | DMAH_NUM_HS_INT | 外设握手完成信号 |
| Debug Bus | debug_granted_m1 | output | 1 | 调试：M1主机授权状态 |
|  | debug_grant_index_m1 | output | LOG2_DMAH_NUM_PER | 调试：M1授权索引 |
|  | debug_dum_req_src_region | output | DMAH_NUM_CHANNELS | 调试：源地址区域请求 |
|  | debug_dum_req_dst_region | output | DMAH_NUM_CHANNELS | 调试：目的地址区域请求 |
|  | debug_fifo_ready_src | output | DMAH_NUM_CHANNELS | 调试：源FIFO就绪状态 |
|  | debug_fifo_ready_dst | output | DMAH_NUM_CHANNELS | 调试：目的FIFO就绪状态 |
|  | debug_fifo_half_full | output | DMAH_NUM_CHANNELS | 调试：FIFO半满状态 |
|  | debug_fifo_empty | output | DMAH_NUM_CHANNELS | 调试：FIFO空状态 |
|  | debug_tfr_req_m1 | output | 1 | 调试：M1传输请求 |
|  | debug_length_m_i | output | DMAH_NUM_MASTER_INT*LENGTH_BW | 调试：传输长度信息 |
|  | debug_dma_data_req | output | DMAH_NUM_PER | 调试：DMA数据请求 |
|  | debug_req_mi1 | output | DMAH_NUM_PER | 调试：MI1请求 |
|  | debug_rd_rawtfr | output | DMAH_NUM_CHANNELS | 调试：原始中断传输读取 |
|  | debug_rd_rawblock | output | DMAH_NUM_CHANNELS | 调试：原始中断块传输读取 |
|  | debug_rd_rawsrctrans | output | DMAH_NUM_CHANNELS | 调试：原始中断源传输读取 |
|  | debug_rd_rawdsttran | output | DMAH_NUM_CHANNELS | 调试：原始中断目的传输读取 |
|  | debug_rd_rawerr | output | DMAH_NUM_CHANNELS | 调试：原始中断错误读取 |
|  | debug_rd_int_en | output | DMAH_NUM_CHANNELS | 调试：中断使能读取 |
|  | debug_rd_masktfr | output | DMAH_NUM_CHANNELS | 调试：掩码中断传输读取 |
|  | debug_rd_maskblock | output | DMAH_NUM_CHANNELS | 调试：掩码中断块传输读取 |
|  | debug_rd_masksrctrans | output | DMAH_NUM_CHANNELS | 调试：掩码中断源传输读取 |
|  | debug_rd_maskdsttran | output | DMAH_NUM_CHANNELS | 调试：掩码中断目的传输读取 |
|  | debug_rd_maskerr | output | DMAH_NUM_CHANNELS | 调试：掩码中断错误读取 |
|  | debug_mask_ick_ch_m1 | output | DMAH_NUM_PER | 调试：通道掩码时钟 |
|  | debug_ch_enable | output | DMAH_NUM_CHANNELS | 调试：通道使能状态 |
|  | debug_statusint_dmacore | output | 5 | 调试：DMA核心中断状态 |
|  | debug_en_src_hs_sgl | output | DMAH_NUM_CHANNELS | 调试：源握手单脉冲使能 |
|  | debug_en_dst_hs_sgl | output | DMAH_NUM_CHANNELS | 调试：目的握手单脉冲使能 |
|  | debug_dma_ctl_en | output | 1 | 调试：DMA控制使能 |
|  | debug_ch_enable_reg | output | DMAH_NUM_CHANNELS | 调试：通道使能寄存器值 |
| External Memory Interface | int_combined | output | 1 | (截图中仅显示此信号，推测为组合中断输出) |

## qspi

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| QSPI Interface | QSPI_CSBn_o | output | 1 | QSPI 片选信号 (低电平有效) |
|  | QSPI_CS0N_oen | output | 1 | CS0 输出使能 |
|  | QSPI_CS1N_o | output | 1 | QSPI 片选 1 信号 |
|  | QSPI_CS1N_oen | output | 1 | CS1 输出使能 |
|  | QSPI_CS2N_o | output | 1 | QSPI 片选 2 信号 |
|  | QSPI_CS2N_oen | output | 1 | CS2 输出使能 |
|  | QSPI_CS3N_o | output | 1 | QSPI 片选 3 信号 |
|  | QSPI_CS3N_oen | output | 1 | CS3 输出使能 |
|  | QSPI_DAT0_i | input | 1 | QSPI 数据位 0 输入 |
|  | QSPI_DAT0_o | output | 1 | QSPI 数据位 0 输出 |
|  | QSPI_DAT0_oen | output | 1 | 数据位 0 输出使能 |
|  | QSPI_DAT1_i | input | 1 | QSPI 数据位 1 输入 |
|  | QSPI_DAT1_o | output | 1 | QSPI 数据位 1 输出 |
|  | QSPI_DAT1_oen | output | 1 | 数据位 1 输出使能 |
|  | QSPI_DAT2_i | input | 1 | QSPI 数据位 2 输入 |
|  | QSPI_DAT2_o | output | 1 | QSPI 数据位 2 输出 |
|  | QSPI_DAT2_oen | output | 1 | 数据位 2 输出使能 |
|  | QSPI_DAT3_i | input | 1 | QSPI 数据位 3 输入 |
|  | QSPI_DAT3_o | output | 1 | QSPI 数据位 3 输出 |
|  | QSPI_DAT3_oen | output | 1 | 数据位 3 输出使能 |
|  | QSPI_SCLK_i | input | 1 | QSPI 时钟输入 |
|  | QSPI_SCLK_o | output | 1 | QSPI 时钟输出 |
|  | QSPI_SCLK_oen | output | 1 | QSPI 时钟输出使能 |
|  | SD | input | 1 | SD 卡检测或相关控制信号 |
|  | SLP | input | 1 | Sleep 模式控制信号 |
| AHB Interface | haddr_i | input | [31:0] | AHB 地址总线 |
|  | hburst | input | [2:0] | AHB 突发传输类型 |
|  | hclk | input | 1 | AHB 时钟信号 |
|  | hrdata | output | [31:0] | AHB 读数据总线 |
|  | hready_in | input | 1 | 来自从机的 Ready 信号 |
|  | hready_out | output | 1 | 发送给主机的 Ready 信号 |
|  | hresp | output | 1 | AHB 传输响应状态 |
|  | hsel | input | 1 | AHB 片选信号 |
|  | hsize | input | [2:0] | AHB 传输大小 |
|  | htrans | input | [1:0] | AHB 传输类型 |
|  | hwdata | input | [31:0] | AHB 写数据总线 |
|  | hwrite | input | 1 | AHB 读写控制 (1:写, 0:读) |
|  | interrupt | output | 1 | 中断请求信号 |
|  | n_hreset | input | 1 | AHB 复位信号 (低电平有效) |
|  | n_preset | input | 1 | 外设复位信号 (低电平有效) |
|  | n_ref_rst | input | 1 | 参考时钟复位信号 |
|  | paddr | input | [31:0] | APB/内部地址总线 |
|  | pclk | input | 1 | APB/内部时钟信号 |
|  | penable | input | 1 | APB/内部使能信号 |
|  | prdata | output | [31:0] | APB/内部读数据 |
|  | psel | input | 1 | APB/内部片选信号 |
|  | pwdata | input | [31:0] | APB/内部写数据 |
|  | pwrite | input | 1 | APB/内部读写控制 |
| QSPI BIST | qspi_bist_addr | input | [7:0] | BIST 测试地址 |
|  | qspi_bist_cs | input | 1 | BIST 片选控制 |
|  | qspi_bist_din | input | [31:0] | BIST 写入数据 |
|  | qspi_bist_dout | output | [31:0] | BIST 读出数据 |
|  | qspi_bist_mode | input | 1 | BIST 模式选择 |
|  | qspi_bist_oe | input | 1 | BIST 输出使能 |
|  | qspi_bist_we | input | 1 | BIST 写使能 |
|  | qspi_hclk | input | 1 | BIST 模块时钟 |
|  | ref_clk | input | 1 | 参考时钟 |
|  | scan_mode | input | 1 | 扫描测试模式 (DFT) |

## sram

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| System | pad_cpu_rst_b | input | 1 | CPU/系统复位信号，低电平有效 |
|  | pll_core_cpuckl | input | 1 | 核心时钟信号 (Core Clock) |
| AHB Control | haddr_sl | input | 1.2916666666666667 | AHB 地址总线 (Address Bus) |
|  | hburst_sl | input | 0.08333333333333333 | AHB 突发传输类型 (Burst Type) |
|  | hprot_sl | input | 0.125 | AHB 保护类型控制 (Protection Control) |
|  | hsel_sl | input | 1 | AHB 从机选择信号 (Slave Select) |
|  | hsize_sl | input | 0.08333333333333333 | AHB 传输大小 (Transfer Size) |
|  | htrans_sl | input | 0.041666666666666664 | AHB 传输类型 (Transfer Type) |
|  | hwrite_sl | input | 1 | AHB 读写控制 (Write Enable) |
| AHB Data | hwdata_sl | input | 1.2916666666666667 | AHB 写数据总线 (Write Data) |
|  | hrdata_sl | output | 1.2916666666666667 | AHB 读数据总线 (Read Data) |
| AHB Response | hready_sl | output | 1 | 从机就绪信号 (Slave Ready) |
|  | hresp_sl | output | 0.041666666666666664 | 从机响应状态 (Response Status) |

## sdram

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| AHB Interface | hclk | input | 1 | System Clock (系统时钟) |
|  | hresetn | input | 1 | System Reset (系统复位) |
|  | haddr | input | 'H_ADDR_WIDTH | AHB Address Bus (地址总线) |
|  | hsel_mem | input | 1 | AHB Select - Memory (存储器片选) |
|  | hsel_reg | input | 1 | AHB Select - Register (寄存器片选) |
|  | hwrite | input | 1 | AHB Transfer Direction (传输方向) |
|  | htrans | input | 2 | AHB Transfer Type (传输类型) |
|  | hsize | input | 3 | AHB Transfer Size (传输大小) |
|  | hburst | input | 3 | AHB Burst Type (突发类型) |
|  | hready_resp | output | 1 | AHB Transfer Done - Out (传输完成响应) |
|  | hready | input | 1 | AHB Transfer Done - In (传输完成输入) |
|  | hresp | output | 2 | AHB Transfer Response (传输响应状态) |
|  | hwdata | input | 'H_DATA_WIDTH | AHB Write Data (写数据) |
|  | hrdata | output | 'H_DATA_WIDTH | AHB Read Data (读数据) |
| SDRAM Interface | s_ras_n | output | 1 | SDRAM row addr. select (行地址选通) |
|  | s_cas_n | output | 1 | SDRAM column addr. sel (列地址选通) |
|  | s_cke | output | 1 | SDRAM clock enable (时钟使能) |
|  | s_rd_data | input | 'S_RD_DATA_WIDTH | SDRAM read data (读数据) |
|  | s_wr_data | output | 'MAX_S_ADDR_WIDTH | SDRAM write data (写数据) |
|  | s_addr | output | 'MAX_S_BANK_ADDR_WIDTH | SDRAM address (地址) |
|  | s_bank_addr | output | 'MAX_S_BANK_ADDR_WIDTH | SDRAM bank address (Bank地址) |
|  | s_dout_valid | output | 'MAX_S_DATA_WIDTH/8-1 | SDRAM chip select (数据输出有效/片选相关) |
|  | s_sel_n | output | 'N_CS-1 | SDRAM chip select (片选信号) |
|  | s_dqm | output | 'MAX_S_DATA_WIDTH/8-1 | SDRAM data mask (数据掩码) |
|  | s_we_n | output | 1 | SDRAM write enable (写使能) |
|  | s_rd_ready | input | 1 | Data ready signal (数据准备好) |
|  | s_rd_start | output | 1 | Read burst start (读突发开始) |
|  | s_rd_pop | output | 1 | Data pop signal for read data capture (读数据捕获弹出信号) |
|  | s_rd_end | output | 1 | Read burst end (读突发结束) |
|  | s_rd_dqs_mask | output | 1 | Read dqs mask (DQS掩码) |
|  | s_cas_latency | output | 3 | SDRAM cas latency (CAS延迟配置) |
|  | s_read_pipe | output | 3 | read pipe (读管道延迟) |
| SPD Interface | s_sa | output | 3 | Serial Presence Address (SPD地址) |
|  | s_scl | output | 1 | Serial Presence Clock (SPD时钟) |
|  | s_sda_out | output | 1 | Serial Presence Data Out (SPD数据输出) |
|  | s_sda_oe_n | output | 1 | Serial Presence Data Ena (SPD数据输出使能) |
|  | s_sda_in | input | 1 | Serial Presence Data In (SPD数据输入) |
| Sync Flash | remap | input | 1 | Address remap control in (地址重映射控制) |
|  | power_down | input | 1 | External power down in (外部掉电输入) |
|  | clear_sr_dp | input | 1 | clear the self_ref_rp bit (清除自刷新位) |
|  | big_endian | input | 1 | Endianness Control (大小端控制) |
|  | gpi | input | 8 | general purpose inputs (通用输入) |
|  | gpo | output | 8 | general purpose outputs (通用输出) |
| Debug Signals | debug_ad_bank_addr | output | 'MAX_S_BANK_ADDR_WIDTH | Debug: Bank Address (调试：Bank地址) |
|  | debug_ad_row_addr | output | 'MAX_S_ADDR_WIDTH | Debug: Row Address (调试：行地址) |
|  | debug_ad_col_addr | output | 'MAX_S_ADDR_WIDTH | Debug: Col Address (调试：列地址) |
|  | debug_ad_sf_bank_addr | output | 'MAX_S_BANK_ADDR_WIDTH | Debug: SF Bank Address (调试：SF Bank地址) |
|  | debug_ad_sf_row_addr | output | 'MAX_S_ADDR_WIDTH | Debug: SF Row Address (调试：SF行地址) |
|  | debug_ad_sf_col_addr | output | 'MAX_S_ADDR_WIDTH | Debug: SF Col Address (调试：SF列地址) |
|  | debug_hiu_addr | output | 'H_ADDR_WIDTH | Debug: HIU Address (调试：HIU地址) |
|  | debug_sm_burst_done | output | 1 | Debug: State Machine Burst Done (调试：SM突发完成) |
|  | debug_sm_pop_n | output | 1 | Debug: State Machine Pop (调试：SM弹出) |
|  | debug_sm_push_n | output | 1 | Debug: State Machine Push (调试：SM推入) |
|  | debug_smc_cs | output | 4 | Debug: SMC Chip Select (调试：SMC片选) |
|  | debug_ref_req | output | 1 | Debug: Refresh Request (调试：刷新请求) |

## gmac

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| RGMII Interface | RGMII_RXC_i | input | 1 | RGMII 接收时钟输入 |
|  | RGMII_TXC_i | input | 1 | RGMII 发送时钟输入 |
|  | RGMII_TXC_o | output | 1 | RGMII 发送时钟输出 |
|  | RGMII_TXC_oen | output | 1 | RGMII 发送时钟输出使能 |
|  | SD; | input | 1 | 串行数据/配置引脚 (Signal Data) |
|  | SLP; | input | 1 | 休眠/低功耗控制信号 (Sleep) |
| AHB Slave Port | araddr_m_o | output | 32 | AHB 读地址总线 |
|  | arburst_m_o | output | 2 | AHB 读突发类型 |
|  | arcache_m_o | output | 3 | AHB 读缓存属性 |
|  | arid_m_o | output | 7 | AHB 读 ID 标签 |
|  | arlen_m_o | output | 4 | AHB 读突发长度 |
|  | arlock_m_o | output | 1 | AHB 读锁定信号 |
|  | arprot_m_o | output | 3 | AHB 读保护类型 |
|  | arready_m_i | input | 1 | AHB 读就绪响应 |
|  | arsize_m_o | output | 2 | AHB 读传输大小 |
|  | arvalid_m_o | output | 1 | AHB 读地址有效 |
|  | awaddr_m_o | output | 32 | AHB 写地址总线 |
|  | awburst_m_o | output | 2 | AHB 写突发类型 |
|  | awcache_m_o | output | 3 | AHB 写缓存属性 |
|  | awid_m_o | output | 7 | AHB 写 ID 标签 |
|  | awlen_m_o | output | 4 | AHB 写突发长度 |
|  | awlock_m_o | output | 1 | AHB 写锁定信号 |
|  | awprot_m_o | output | 3 | AHB 写保护类型 |
|  | awready_m_i | input | 1 | AHB 写就绪响应 |
|  | awsize_m_o | output | 2 | AHB 写传输大小 |
|  | awvalid_m_o | output | 1 | AHB 写地址有效 |
|  | bid_m_i | input | 7 | AHB 写响应 ID |
|  | bready_m_o | output | 1 | AHB 写响应就绪 |
|  | bresp_m_i | input | 2 | AHB 写响应状态 |
|  | bvalid_m_i | input | 1 | AHB 写响应有效 |
|  | rdata_m_i | input | 128 | AHB 读数据总线 |
|  | rid_m_i | input | 7 | AHB 读数据 ID |
|  | rlast_m_i | input | 1 | AHB 读最后数据标志 |
|  | rready_m_o | output | 1 | AHB 读数据就绪 |
|  | rresp_m_i | input | 2 | AHB 读响应状态 |
|  | rvalid_m_i | input | 1 | AHB 读数据有效 |
|  | wdata_m_o | output | 128 | AHB 写数据总线 |
|  | wlast_m_o | output | 1 | AHB 写最后数据标志 |
|  | wready_m_i | input | 1 | AHB 写数据就绪 |
|  | wstrb_m_o | output | 16 | AHB 写字节选通 |
|  | wvalid_m_o | output | 1 | AHB 写数据有效 |
| BIST Interface | bist_addr0 | input | 7 | BIST 地址总线 0 |
|  | bist_addr1 | input | 7 | BIST 地址总线 1 |
|  | bist_cen0 | input | 1 | BIST 片选/使能 0 |
|  | bist_cen1 | input | 1 | BIST 片选/使能 1 |
|  | bist_d0 | input | 132 | BIST 写入数据 0 |
|  | bist_d1 | input | 132 | BIST 写入数据 1 |
|  | bist_mode | input | 1 | BIST 模式选择 |
|  | bist_q0 | output | 132 | BIST 读出数据 0 |
|  | bist_q1 | output | 132 | BIST 读出数据 1 |
|  | bist_wen0 | output | 8 | BIST 写使能 0 |
|  | bist_wen1 | output | 8 | BIST 写使能 1 |
| GMAC Control | gephy_ifsel | input | 3 | 以太网 PHY 接口选择 |
|  | gmac_ack | input | 1 | GMAC 握手确认 |
|  | gmac_areset_n | input | 1 | GMAC 异步复位 |
|  | gmac_clk | input | 1 | GMAC 主时钟 |
|  | gmac_pclk | input | 1 | GMAC 外设/寄存器时钟 |
|  | gmac_preset_n | input | 1 | GMAC 外设复位 |
|  | gmac_reset_n | input | 1 | GMAC 全局复位 |
| GMII Interface | gmii_mdc_o | output | 1 | 管理数据时钟 (MDC) |
|  | gmii_mdc_oen | output | 1 | MDC 输出使能 |
|  | gmii_mdi_i | input | 1 | 管理数据输入 (MDI) |
|  | gmii_mdio_oen | output | 1 | 管理数据 IO 使能 |
|  | gmii_mdo_o | output | 1 | 管理数据输出 (MDO) |
|  | lpi_intr_o | output | 1 | LPI (节能以太网) 中断 |
| PCS Interface | paddr_i | input | 32 | 物理地址输入 |
|  | pcs_acquired_sync_o | output | 1 | PCS 锁定同步指示 |
|  | pcs_en_cdet_o | output | 1 | PCS 载波检测使能 |
|  | pcs_ewrap_o | output | 1 | PCS 环回/封装控制 |
|  | pcs_lck_ref_o | output | 1 | PCS 参考时钟锁定 |
|  | penable_i | input | 1 | APB 总线使能 (用于 PCS 配置) |
|  | phy_col_i | input | 1 | 冲突检测信号 |
|  | phy_crs_i | input | 1 | 载波监听信号 |
|  | phy_intr_i | input | 1 | PHY 中断输入 |
|  | phy_rxd_i | input | 8 | PHY 接收数据 |
|  | phy_rxdv_i | input | 1 | PHY 接收数据有效 |
|  | phy_rxer_i | input | 1 | PHY 接收错误 |
|  | phy_txd_o | output | 8 | PHY 发送数据 |
|  | phy_txd_oen | output | 1 | PHY 发送数据使能 |
|  | phy_txen_o | output | 1 | PHY 发送使能 |
|  | phy_txen_oen | output | 1 | PHY 发送使能输出控制 |
|  | phy_txer_o | output | 1 | PHY 发送错误 |
|  | phy_txerr_oen | output | 1 | PHY 发送错误输出控制 |
| PTP (1588) | pmt_intr_o | output | 1 | PTP 模块中断 |
|  | ptp_aux_ts_trig_i | input | 1 | PTP 辅助时间戳触发 |
|  | ptp_pps_o | output | 1 | PTP 秒脉冲输出 |
|  | ptp_timestamp_i | input | 64 | 外部时间戳输入 |
| System & Power | prdata_o | output | 32 | APB 读数据 |
|  | pready_o | output | 1 | APB 就绪信号 |
|  | psel_i | input | 1 | APB 片选 |
|  | pwdata_i | input | 32 | APB 写数据 |
|  | pwr_clamp_ctrl_i | input | 1 | 电源钳位控制 |
|  | pwr_down_ctrl_i | input | 1 | 掉电模式控制 |
|  | pwr_isolate_i | input | 1 | 电源隔离控制 |
|  | pwrite_i | input | 1 | APB 写使能 |
| Debug/Test | sbd_intr_o | output | 1 | SBD (Sideband) 中断 |
|  | sbd_pwr_down_ack_o | output | 1 | SBD 掉电确认 |
|  | sbd_tx_clk_gating_ctrl_o | output | 1 | SBD 发送时钟门控 |
|  | scan_mode | input | 1 | 扫描测试模式 |
|  | sgmii_link_speed_o | output | 2 | SGMII 链路速率指示 |

## esc0

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| System Control | NRESET | input | 1 | 全局复位信号 (低电平有效) |
|  | NRESET_DELAY7 | output | 1 | 延时复位输出 |
|  | CLK2S | input | 1 | 2.5MHz 时钟输入 (通常用于 MII/RMII) |
|  | CLK25_2NS | input | 1 | 25MHz 时钟输入 |
|  | CLK50 | input | 1 | 50MHz 时钟输入 (RGMII 常用) |
|  | CLK100 | input | 1 | 100MHz 时钟输入 |
|  | CLK125 | input | 1 | 125MHz 时钟输入 (千兆以太网常用) |
|  | CLK125_90 | input | 1 | 125MHz 90度相移时钟 |
|  | CLK_PDI_EXT | input | 1 | 外部 PDI 接口时钟 |
| Security Device | SEC_DEV_CLK | output | 1 | 安全设备时钟输出 |
|  | SEC_DEV_CHAL_VALID | output | 1 | 安全挑战数据有效 |
|  | SEC_DEV_CHAL_DATA | output | 8 | 安全挑战数据总线 |
|  | SEC_DEV_RESP_VALID | input | 1 | 安全响应数据有效 |
|  | SEC_DEV_RESP_DATA | input | 8 | 安全响应数据总线 |
| RGMII Port 0 | RGMII_LINK0 | input | 1 | 链路状态指示 |
|  | RGMII_RX_CLK0 | input | 1 | 接收时钟 (RX Clock) |
|  | RGMII_RX_CTL0 | input | 1 | 接收控制 (RX_DV/RX_ER 复用) |
|  | RGMII_RX_DATA0 | input | 4 | 接收数据总线 (RXD[3:0]) |
|  | RGMII_TX_CLK0 | output | 1 | 发送时钟 (TX Clock) |
|  | RGMII_TX_CTL0 | output | 1 | 发送控制 (TX_EN/TX_ER 复用) |
|  | RGMII_TX_DATA0 | output | 4 | 发送数据总线 (TXD[3:0]) |
|  | RGMII_RX_CTL_DATA_DDR_CLK0 | output | 1 | RX CTL 数据 DDR 时钟 (用于源同步) |
|  | RGMII_TX_CTL_DATA_DDR_CLK0 | output | 1 | TX CTL 数据 DDR 时钟 |
|  | ... (DDR 相关信号) | - | - | 包含 _DDR_L0, _DDR_H0, _NRESET0 等高速接口信号 |
| MII Port 0 | NMII_LINK0 | input | 1 | MII 链路状态 |
|  | MII_RX_CLK0 | input | 1 | 接收时钟 (25MHz) |
|  | MII_RX_DV0 | input | 1 | 接收数据有效 |
|  | MII_RX_DATA0 | input | 4 | 接收数据 (RXD[3:0]) |
|  | MII_RX_ERR0 | input | 1 | 接收错误指示 |
|  | MII_TX_CLK0 | input | 1 | 发送时钟 (25MHz) |
|  | MII_TX_ENA0 | output | 1 | 发送使能 |
|  | MII_TX_DATA0 | output | 4 | 发送数据 (TXD[3:0]) |
|  | MII_TX_SHIFT0 | input | 2 | 发送移位控制 (可能用于特定模式) |
| RMII Port 0 | NRMII_LINK0 | input | 1 | RMII 链路状态 |
|  | RMII_RX_DV0 | input | 1 | 接收数据有效 |
|  | RMII_RX_DATA0 | input | 2 | 接收数据 (RXD[1:0], 2-bit 宽) |
|  | RMII_RX_ER0 | input | 1 | 接收错误指示 |
|  | RMII_TX_ENA0 | output | 1 | 发送使能 |
|  | RMII_TX_DATA0 | output | 2 | 发送数据 (TXD[1:0], 2-bit 宽) |
| MDIO Interface | MDIO | inout | 1 | 双向管理数据引脚 |
|  | MDIO_DATA_IN | input | 1 | MDIO 输入缓冲 |
|  | MDIO_DATA_OUT | output | 1 | MDIO 输出驱动 |
|  | MDIO_DATA_ENA | output | 1 | MDIO 输出使能 |
|  | MCLK | output | 1 | MDIO 管理时钟 (MDC) |
| LED Interface | LED_LINK_ACT | output | N | 链路/活动指示灯 (位宽取决于端口数) |
|  | LED_RX_ERROR | output | N | 接收错误指示灯 |
|  | LED_RUN / LED_ERR | output | 1 | 系统运行/错误状态灯 |
| PROM/SPI | PROM_CLK_IN/OUT | input/output | 1 | SPI/PROM 时钟 |
|  | PROM_DATA_IN/OUT | inout/input/output | 1 | SPI/PROM 数据 |
|  | PROM_SIZE | input | 1 | PROM 容量选择 |
| PDI SPI | PDI_SPI_SEL | input | 1 | PDI SPI 片选 |
|  | PDI_SPI_DO/DI | output/input | 1 | PDI SPI 数据 |
|  | PDI_SPI_IRQ | output | 1 | PDI SPI 中断请求 |
| Digital IO | PDI_DIGI_DATA_IN0-3 | input | 8x4 | 通用数字输入端口 (32-bit) |
|  | PDI_DIGI_DATA_OUT0-3 | output | 8x4 | 通用数字输出端口 (32-bit) |
| Avalon Bus | PDI_AVALON_AD | input | 18 | Avalon 地址/数据复用总线 |
|  | PDI_AVALON_RD/WR_DATA | input/output | 8 | Avalon 读写数据 |
|  | PDI_AVALON_READ/WRITE | input | 1 | Avalon 读写控制 |
|  | PDI_AVALON_CS | input | 1 | Avalon 片选 |
|  | PDI_AVALON_IRQ | output | 1 | Avalon 中断 |
|  | PDI_AVALON_SYNC0/1 | output | 1 | Avalon 同步信号 |
| PLB Interface | PDI_PLB_ABUS | input | 32 | 地址总线 |
|  | PDI_PLB_UABUS | input | 32 | 高位地址总线 |
|  | PDI_PLB_RNW | input | 1 | 读写控制 (1=Read, 0=Write) |
|  | PDI_PLB_BE | input | 4 | 字节使能 |
|  | PDI_PLB_DBUS | input | 32 | 写数据总线 |
|  | PDI_PLB_RDBUS | output | 32 | 读数据总线 |
|  | PDI_PLB_RdAck | output | 1 | 读响应确认 |
|  | PDI_PLB_WrAck | output | 1 | 写响应确认 |
| AXI Write Channel | PDI_AXI_AWID | input | ID Width | 写地址 ID |
|  | PDI_AXI_AWADDR | input | Addr Width | 写地址 |
|  | PDI_AXI_AWLEN | input | 8 | 突发长度 |
|  | PDI_AXI_AWSIZE | input | 3 | 突发大小 |
|  | PDI_AXI_AWVALID | input | 1 | 写地址有效 |
|  | PDI_AXI_WDATA | input | Data Width | 写数据 |
|  | PDI_AXI_WSTRB | input | Data Width/8 | 写数据选通 |
|  | PDI_AXI_WVALID | input | 1 | 写数据有效 |
|  | PDI_AXI_BREADY | input | 1 | 写响应就绪 |
|  | PDI_AXI_ARID | input | ID Width | 读地址 ID |
|  | PDI_AXI_ARADDR | input | Addr Width | 读地址 |
|  | PDI_AXI_ARVALID | input | 1 | 读地址有效 |
|  | PDI_AXI_RDATA | output | Data Width | 读数据 |
|  | PDI_AXI_RVALID | output | 1 | 读数据有效 |
|  | PDI_AXI_RREADY | input | 1 | 读数据就绪 |
| UC Interface | PDI_UC_CLK_IN | input | 1 | UC 模块时钟 |
|  | PDI_UC_TXDATA_OUT | output | 8 | 发送数据 |
|  | PDI_UC_RXDATA_IN | input | 8 | 接收数据 |
| GPIO & Misc | PDI_GPI | input | N | 通用输入 |
|  | PDI_GPO | output | N | 通用输出 |
|  | PROM_LOADED | output | 1 | PROM 加载完成标志 |
|  | PDI_SOF | output | 1 | 帧开始指示 |
|  | PDI_EOF | output | 1 | 帧结束指示 |
|  | PDI_WD_TRIGGER | output | 1 | 看门狗触发 |
| Mode Config | P_MODE | input | 2 | 工作模式配置 |
|  | P_CONF | input | 4 | 功能配置引脚 |
|  | LINKPOL | input | 1 | 链路极性反转配置 |
|  | Trans_Mode_Ena | input | 1 | 透传模式使能 |

## esc1

（空表）

## i2c

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| APB Interface | pclk | input | 1 | APB 时钟信号 (Bus Interface Unit Clock) |
|  | presetn | input | 1 | APB 复位信号 (低电平有效) |
|  | psel | input | 1 | 外设选择信号 (Peripheral Select) |
|  | penable | input | 1 | 传输使能/选通信号 (Strobe Signal) |
|  | pwrite | input | 1 | 读写控制信号 (高电平为写，低电平为读) |
|  | paddr | input | 8 | 地址总线 (取低7位用于寄存器译码) |
|  | pwdata | input | APB_DATA_WIDTH | 写数据总线 (宽度可配置，通常为 8/16/32 位) |
|  | prdata | output | APB_DATA_WIDTH | 读数据总线 (返回给 CPU 的数据) |
| I2C Physical | ic_clk | input | 1 | I2C 传输时钟 (用于标准/快速/高速模式) |
|  | ic_clk_in_a | input | 1 | 输入的 I2C 时钟 (异步，用于同步化处理) |
|  | ic_data_in_a | input | 1 | 输入的 I2C 数据 (异步，即 SDA 输入) |
|  | ic_rst_n | input | 1 | I2C 模块复位信号 (低电平有效) |
| DMA Handshake | dma_tx_req | output | 1 | DMA 发送请求 (Transmit Request) |
|  | dma_tx_single | output | 1 | DMA 单次发送请求 |
|  | dma_rx_req | output | 1 | DMA 接收请求 (Receive Request) |
|  | dma_rx_single | output | 1 | DMA 单次接收请求 |
|  | dma_tx_ack | input | 1 | DMA 发送应答 (Transmit Acknowledge) |
|  | dma_rx_ack | input | 1 | DMA 接收应答 (Receive Acknowledge) |
| Interrupts | ic_tx_over_intr | output | 1 | 发送溢出中断 (Transmit Overflow) |
|  | ic_rx_under_intr | output | 1 | 接收下溢中断 (Receive Underflow) |
|  | ic_tx_over_intr | output | 1 | 发送结束中断 (可能是重复定义或特定状态) |
|  | ic_tx_abrt_intr | output | 1 | 发送中止中断 (Transaction Aborted) |
|  | ic_rx_done_intr | output | 1 | 接收完成中断 |
|  | ic_tx_empty_intr | output | 1 | 发送 FIFO 空中断 |
|  | ic_activity_intr | output | 1 | I2C 活动指示中断 |
|  | ic_stop_det_intr | output | 1 | 检测到 STOP 条件中断 |
|  | ic_start_det_intr | output | 1 | 检测到 START 条件中断 |
|  | ic_rd_req_intr | output | 1 | 读请求中断 (作为从机时被主机读) |
|  | ic_rx_full_intr | output | 1 | 接收 FIFO 满中断 |
|  | ic_gen_call_intr | output | 1 | 通用调用中断 (General Call Address Match) |

## pmu

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| APB Interface | apb_pmu_paddr | input | 12 | PMU 配置地址总线 |
|  | apb_pmu_penable | input | 1 | APB 传输使能 |
|  | apb_pmu_psel | input | 1 | APB 外设选择 |
|  | apb_pmu_pwdata | input | 32 | APB 写数据 |
|  | apb_pmu_pwrite | input | 1 | APB 写使能 |
|  | pmu_apb_prdata | output | 32 | APB 读数据 |
| Power Mgmt | corec_pmu_sleep_out | output | 1 | Core C 睡眠状态输出 |
|  | blu_pad_lpm_b | input | 1 | 低功耗模式指示 (低有效) |
|  | pmu_corec_isolation | output | 1 | Core C 隔离控制 |
|  | had_pad_wakeup_req_b | input | 1 | 硬件唤醒请求 (低有效) |
|  | gate_en0 / gate_en1 | output | 1 | 时钟门控使能 |
| JTAG/Debug | i_pad_cpu_jtg_rst_b | input | 1 | CPU JTAG 复位 (低有效) |
|  | i_pad_jtg_tclk | input | 1 | JTAG 时钟 |
|  | pad_had_jtg_tms_i | input | 1 | JTAG 模式选择 |
|  | pad_had_jtg_trst_b | output | 1 | JTAG 复位输出 |
| Clock/Reset | sys_clk | input | 1 | 系统时钟 |
|  | sys_rst | input | 1 | 系统复位 |
|  | pg_reset_b | output | 1 | Power Good 复位 (低有效) |

## wdt

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| Clock & Reset | pclk | input | 1 | APB 时钟信号 (APB Clock) |
|  | presetn | input | 1 | APB 异步复位信号，低电平有效 (APB Active Low Async Reset) |
| APB Interface | psel | input | 1 | APB 外设选择信号 (APB Peripheral Select) |
|  | penable | input | 1 | APB 传输使能/选通信号 (APB Strobe Signal) |
|  | pwrite | input | 1 | APB 写使能信号，高电平为写 (APB Write Enable) |
|  | pwdata | input | APB_DATA_WIDTH-1:0 | APB 写数据总线 (APB Write Data Bus) |
|  | paddr | input | WDT_ADDR_SLICE_LHS-1:0 | APB 地址总线 (APB Address Bus) |
|  | prdata | output | APB_DATA_WIDTH-1:0 | APB 读数据总线 (APB Read Data Bus) |
| Test & Scan | speed_up | input | 1 | 测试加速信号，用于缩短测试时间 (Test Speed Up Signal) |
|  | scan_mode | input | 1 | 扫描测试模式信号 (Scan Test Mode Signal) |
| Watchdog | wdt_intr | output | 1 | 看门狗中断信号，高电平有效 (Watchdog Active High Interrupt) |
|  | wdt_sys_rst | output | 1 | 看门狗系统复位信号，高电平有效 (Watchdog Active High System Reset) |

## timer

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| Clock & Reset | pclk | input | 1 | APB 时钟信号 (APB Clock) |
|  | presetn | input | 1 | APB 异步复位信号，低电平有效 (APB Active Low Async Reset) |
| APB Interface | paddr | input | [15:0] | APB 地址总线 (APB Address Bus) |
|  | penable | input | 1 | APB 传输使能/选通信号 (APB Strobe Signal) |
|  | psel | input | 1 | APB 外设选择信号 (APB Peripheral Select) |
|  | pwdata | input | [31:0] | APB 写数据总线 (APB Write Data Bus) |
|  | pwrite | input | 1 | APB 写使能信号 (APB Write Enable) |
| Interrupts | timer_int | output | [3:0] | 定时器中断信号 (Timer Interrupt)，支持4个通道 |

## stimer

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| Clock & Reset | pclk | input | 1 | APB 接口时钟 (APB Clock) |
|  | presetn | input | 1 | APB 接口复位，低电平有效 (APB Async Reset) |
| APB Interface | psel | input | 1 | APB 外设选择信号 (APB Peripheral Select) |
|  | penable | input | 1 | APB 传输使能信号 (APB Enable) |
|  | pwrite | input | 1 | APB 写使能信号 (APB Write Enable) |
|  | paddr | input | TIM_ADDR_SLICE_LHS:0 | APB 地址总线 (APB Address Bus) |
|  | pwdata | input | APB_DATA_WIDTH-1:0 | APB 写数据总线 (APB Write Data) |
|  | prdata | output | APB_DATA_WIDTH-1:0 | APB 读数据总线 (APB Read Data) |
| Test & Scan | scan_mode | input | 1 | 扫描测试模式信号 (Scan Mode) |
| Timer Channels | timer_1_clk | input | 1 | 定时器 1 时钟 (Timer 1 Clock) |
|  | timer_1_resetn | input | 1 | 定时器 1 复位，低电平有效 (Timer 1 Reset) |
|  | timer_2_clk | input | 1 | 定时器 2 时钟 (Timer 2 Clock) |
|  | timer_2_resetn | input | 1 | 定时器 2 复位，低电平有效 (Timer 2 Reset) |
|  | timer_3_clk | input | 1 | 定时器 3 时钟 (Timer 3 Clock) |
|  | timer_3_resetn | input | 1 | 定时器 3 复位，低电平有效 (Timer 3 Reset) |
|  | timer_4_clk | input | 1 | 定时器 4 时钟 (Timer 4 Clock) |
|  | timer_4_resetn | input | 1 | 定时器 4 复位，低电平有效 (Timer 4 Reset) |
| Status & Interrupts | timer_en | output | NUM_TIMERS-1:0 | 定时器运行状态指示 (Timer Enable Status) |
|  | timer_intr | output | NUM_TIMERS-1:0 | 定时器中断请求 (Timer Interrupt Request) |

## uart0

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| Clock & Reset | pclk | input | 1 | APB 时钟信号 (APB Clock) |
|  | presetn | input | 1 | APB 异步复位信号，低电平有效 (APB Active Low Async Reset) |
| APB Interface | psel | input | 1 | APB 外设选择信号 (APB Peripheral Select) |
|  | penable | input | 1 | APB 传输使能/选通信号 (APB Strobe Signal) |
|  | pwrite | input | 1 | APB 写使能信号，高电平为写 (APB Write Enable) |
|  | pwdata | input | APB_DATA_WIDTH-1:0 | APB 写数据总线 (APB Write Data Bus) |
|  | paddr | input | UART_ADDR_SLICE_LHS-1:0 | APB 地址总线 (APB Address Bus) |
|  | prdata | output | APB_DATA_WIDTH-1:0 | APB 读数据总线 (APB Read Data Bus) |
| APB3 Completer | pready | output | 1 | 完成器就绪信号：低电平时挂起 APB 事务直到信号变高 (Completer Ready) |
|  | pslverr | output | 1 | 完成器错误信号：高电平表示传输出错 (APB3 Slave Error) |
| Test & Scan | scan_mode | input | 1 | 扫描测试模式信号 (Scan Test Mode Signal) |
| UART Modem Control | cts_n | input | 1 | 清除发送，低电平有效 (Clear To Send, Active Low) |
|  | dsr_n | input | 1 | 数据设备就绪，低电平有效 (Data Set Ready, Active Low) |
|  | dcd_n | input | 1 | 数据载波检测，低电平有效 (Data Carrier Detect, Active Low) |
|  | ri_n | input | 1 | 振铃指示，低电平有效 (Ring Indicator, Active Low) |
| UART Serial | sin | input | 1 | 串行数据输入 (Serial Input) |
| DMA | dma_tx_ack | input | 1 | DMA 发送突发结束确认，高电平有效 (DMA TX Burst End) |
|  | dma_rx_ack | input | 1 | DMA 接收突发结束确认，高电平有效 (DMA RX Burst End) |

## gpio

| 分组名 | 信号名 | 输入/输出 | 位宽 | 备注 |
| --- | --- | --- | --- | --- |
| Clock & Reset | pclk | input | 1 | 时钟信号 |
|  | pclk_intr | input | 1 | 内部时钟(?) |
|  | presetn | input | 1 | 复位信号 (低电平有效) |
|  | dbclk | input | 1 | 调试时钟 |
| APB Interface | psel | input | 1 | 外设选择信号 |
|  | penable | input | 1 | 传输使能信号 |
|  | pwrite | input | 1 | 读写控制信号 |
|  | scan_mode | input | 1 | 扫描测试模式 |
|  | pwdata | input | APB_DATA_WIDTH | 写数据总线 |
|  | paddr | input | GPIO_ADDR_SLICE_LHS:0 | 地址总线 (注释提到低2位未使用) |
| GPIO Port A | aux_porta_out | input | GPIO_PWIDTH_A-1:0 | 辅助端口输出(作为模块输入) |
|  | aux_porta_en | input | GPIO_PWIDTH_A-1:0 | 辅助端口使能 |
|  | gpio_ext_porta | input | GPIO_PWIDTH_A-1:0 | 外部GPIO端口A输入 |
|  | aux_porta_in | output | GPIO_PWIDTH_A-1:0 | 辅助端口输入(作为模块输出) |
|  | gpio_porta_dr | output | GPIO_PWIDTH_A-1:0 | GPIO端口A数据寄存器输出 |
|  | gpio_porta_ddr | output | GPIO_PWIDTH_A-1:0 | GPIO端口A方向寄存器输出 |
| GPIO Port B | aux_portb_out | input | GPIO_PWIDTH_B-1:0 | 辅助端口B输出 |
|  | aux_portb_en | input | GPIO_PWIDTH_B-1:0 | 辅助端口B使能 |
|  | gpio_ext_portb | input | GPIO_PWIDTH_B-1:0 | 外部GPIO端口B输入 |
|  | aux_portb_in | output | GPIO_PWIDTH_B-1:0 | 辅助端口B输入 |
|  | gpio_portb_dr | output | GPIO_PWIDTH_B-1:0 | GPIO端口B数据寄存器输出 |
|  | gpio_portb_ddr | output | GPIO_PWIDTH_B-1:0 | GPIO端口B方向寄存器输出 |
| Interrupts | gpio_intrclk_en | output | GPIO_PWIDTH_A-1:0 | 中断时钟使能 |
|  | gpio_intr_n | output | GPIO_PWIDTH_A-1:0 | 中断信号 (低电平有效) |

## wic

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| Power & Wakeup | ctl_xx_awake_enable_high_a | input | 32 | 唤醒使能控制信号 (域A, 高电平) |
|  | ctl_xx_awake_enable_low_a | input | 32 | 唤醒使能控制信号 (域A, 低电平) |
|  | ctl_xx_awake_enable_high_b | input | 32 | 唤醒使能控制信号 (域B, 高电平) |
|  | ctl_xx_awake_enable_low_b | input | 32 | 唤醒使能控制信号 (域B, 低电平) |
|  | nmi_wake_int_higher | input | 2 | 不可屏蔽中断唤醒信号 |
| Config & Mask | pad_wic_int_cfg_high_a | input | 32 | 中断配置信号 (域A, 高) |
|  | pad_wic_int_cfg_low_a | input | 32 | 中断配置信号 (域A, 低) |
|  | pad_wic_int_cfg_high_b | input | 32 | 中断配置信号 (域B, 高) |
|  | pad_wic_int_cfg_low_b | input | 32 | 中断配置信号 (域B, 低) |
|  | pad_wic_int_exit_high_a | input | 32 | 退出模式中断配置 (域A, 高) |
|  | pad_wic_int_exit_low_a | input | 32 | 退出模式中断配置 (域A, 低) |
|  | pad_wic_int_exit_high_b | input | 32 | 退出模式中断配置 (域B, 高) |
|  | pad_wic_int_exit_low_b | input | 32 | 退出模式中断配置 (域B, 低) |
|  | pad_wic_int_mask_high_a | input | 32 | 中断掩码 (域A, 高) |
|  | pad_wic_int_mask_low_a | input | 32 | 中断掩码 (域A, 低) |
|  | pad_wic_int_mask_high_b | input | 32 | 中断掩码 (域B, 高) |
|  | pad_wic_int_mask_low_b | input | 32 | 中断掩码 (域B, 低) |
|  | pad_wic_int_edge_clr | input | 14 | 边沿中断清除信号 |
| Peripheral Int | gpio_vic_int | input | 32 | GPIO 中断输入 |
|  | pulse_int | input | 1 | 脉冲中断输入 |
|  | stim_vic_int | input | 4 | 刺激模块中断输入 |
|  | timl_vic_int | input | 4 | 定时器 L 中断输入 |
|  | tim_vic_int | input | 4 | 定时器中断输入 |
|  | uart8_vic_int | input | 1 | UART8 中断输入 |
|  | ins_control_irq | input | 1 | 指令控制中断 |
|  | ins_acyclicp0_irq | input | 1 | 指令非周期中断0 |
|  | ins_acyclicp1_irq | input | 1 | 指令非周期中断1 |
|  | pn_irq | input | 4 | 网络/包处理中断 |
|  | dma_int_combined | input | 1 | DMA 综合中断 |
|  | sbd_intr_o | input | 1 | 系统总线调试中断 |
| Core & Bus | core0_sw_int | input | 1 | 核心0 软件中断 |
|  | core1_sw_int | input | 1 | 核心1 软件中断 |
|  | esc_pdi_axi_irq_main | input | 3 | AXI 总线安全/错误中断 |
|  | esc0_sync_out | input | 1 | 安全组件0 同步输出 |
|  | esc1_sync_out | input | 1 | 安全组件1 同步输出 |
| Clock | wic_clk | input | 1 | 中断控制器时钟 |
| Status Output | intraw_vld_a | output | 1 | 原始中断有效指示 (域A) |
|  | intraw_vld_b | output | 1 | 原始中断有效指示 (域B) |
|  | pad_vic_int_vld_a | output | 64 | 中断有效状态向量 (域A) |
|  | pad_vic_int_vld_b | output | 64 | 中断有效状态向量 (域B) |

## uc2apb

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| 全局配置与控制 | NRESET | input | 1 | 系统复位信号 (System Reset) |
|  | CLK_PDI_EXT | input | 1 | PDI 外部时钟 (PDI External Clock) |
|  | ADDR_MASK_EN_CFG | input | 1 | 地址掩码使能配置 (Address Mask Enable Config) |
|  | BUS_WIDTH_CFG | input | 0.2916666666666667 | 总线宽度配置输入 (Bus Width Configuration) |
|  | CONFIG_REG | input | 1.2916666666666667 | 32位配置寄存器输入 (Configuration Register) |
| 中断与状态 | IRQ_IN | input | 1 | 中断请求输入 (Interrupt Request Input) |
|  | UC_IF_IRR | output | 0.2916666666666667 | FIFO 状态输出 / 中断请求寄存器 (FIFO_STATUS_OUT) |
|  | UC_IF_ACTIVE | output | 1 | 总线模式检测 / UC 接口活性指示 (BUS_MODE_DETECT) |
|  | UC_IF_IRQ | output | 1 | FIFO 控制输出 / UC 中断指示 (FIFO_CTRL_OUT) |
| 总线控制逻辑 | READ_BYTE_SEL | output | 0.125 | 读操作字节选择掩码，每位指示读响应中哪个字节通道有效 (REG_ADDR_OUT_1) |
|  | BUS_WIDTH_CODE | output | 0.041666666666666664 | 编码总线宽度配置：00=8bit, 01=16bit, 10=32bit, 11=64bit (WORD_ADDR_OUT) |
|  | WRITE_BYTE_ENA | output | 0.125 | 写操作字节使能，每位控制对应字节通道的写入 (INTF_CTRL_OUT) |
| 存储器接口-写 | MEM_ADDR_WRITE | output | 0.625 | 存储器写地址总线 (DATA_ADDR_OUT) |
|  | MEM_DATA_OUT | output | 1.2916666666666667 | 存储器写数据总线 (KERNEL_DATA_OUT) |
|  | MEM_WRITE_EN | output | 1 | 存储器写使能信号 (BUS_ACCESS_OUT) |
|  | MEM_WRITE_READY | input | 1 | 存储器写就绪握手信号 (OP_READY_IN) |
| 存储器接口-读 | MEM_ADDR_READ | output | 0.625 | 存储器读地址总线 (NODE_ADDR_OUT) |
|  | MEM_DATA_IN | input | 1.2916666666666667 | 存储器读数据总线 |
|  | MEM_READ_EN | output | 1 | 存储器读使能信号 (DATA_VALID_OUT) |
|  | MEM_READ_READY | input | 1 | 存储器读就绪握手信号 (BUSY_STAT_IN) |
|  | MEM_READ_ACK | input | 1 | 存储器读应答信号 (WRITE_ACK_IN) |
| UC接口-控制 | UC_CS | input | 1 | UC 片选信号 (Chip Select) |
|  | UC_RD | input | 1 | UC 读控制信号 (Read) |
|  | UC_WR | input | 1 | UC 写控制信号 (Write) |
|  | UC_ADDR | input | 0.625 | UC 地址总线 |
| UC接口-数据 | UC_DATA_IN | input | 0.625 | UC 数据输入总线 (MCU 写入的数据) |
|  | UC_DATA_OUT | output | 0.625 | UC 数据输出总线 (发送给 MCU 的数据) |
|  | UC_DATA_ENA | output | 1 | UC 数据输出使能 (三态门控制) |
| UC接口-状态 | UC_BUSY | output | 1 | UC 忙信号，通知 MCU 等待 |
|  | UC_IRQ_OUT_1 | output | 1 | UC 中断输出1 |
|  | UC_IRQ_OUT_2 | output | 1 | UC 中断输出2 |
| UC接口-辅助 | UC_ALE | input | 1 | UC 地址锁存使能 (Address Latch Enable) |
|  | UC_NBHE | input | 1 | UC 字节使能 (Not Byte Enable) |

## spi2apb

| 分组名 | 信号名 | 输入/输出 | 位宽 | 信号描述 |
| --- | --- | --- | --- | --- |
| 系统与控制 | NRESET | input | 1 | 系统复位信号 (System Reset) |
|  | CLK_PDI_EXT | input | 1 | PDI 外部时钟 (PDI External Clock) |
|  | CONFIG_REG | input | 1.2916666666666667 | 32位配置寄存器。Bit[1:0]定义SPI模式(00-11); Bit[3:2]定义IRQ驱动类型; Bit[4]定义片选极性; Bit[5]定义采样模式。 |
|  | SPI_STATUS_REG | output | 0.2916666666666667 | SPI 状态寄存器输出 (SPI Status Register) |
| 中断系统 | IRQ_IN | input | 1 | 中断请求输入 (Interrupt Request Input) |
|  | INT_REQ | input | 1.2916666666666667 | 中断请求向量/掩码 (Interrupt Request Vector) |
| 存储器/数据接口 | READ_DATA_READY | input | 1 | 读数据准备好信号 (Read Data Ready) |
|  | MEM_READ_EN | output | 1 | 存储器读使能 (Memory Read Enable) |
|  | RD_ADDR | output | 0.625 | 读地址总线 (Read Address) |
|  | WR_ADDR | output | 0.625 | 写地址总线 (Write Address) |
|  | MEM_DATA_OUT | output | 0.2916666666666667 | 存储器写数据/输出数据 (Memory Data Out) |
|  | MEM_DATA_IN | input | 0.2916666666666667 | 存储器读数据/输入数据 (Memory Data In) |
| SPI 物理接口 | SPI_SEL | input | 1 | SPI 片选信号 (Chip Select) |
|  | SPI_CLK | input | 1 | SPI 时钟信号 (Serial Clock) |
|  | SPI_DI | input | 1 | SPI 数据输入 (Data In / MOSI) |
|  | SPI_DO | output | 1 | SPI 数据输出 (Data Out / MISO) |
|  | SPI_DO_EN | output | 1 | SPI 数据输出使能 (Data Out Enable) |
|  | SPI_IRQ | output | 1 | SPI 中断请求输出 (SPI Interrupt Request) |
|  | SPI_IRQ_EN | output | 1 | SPI 中断使能 (SPI Interrupt Enable) |
| 其他控制 | START_ADDR_PHASE | output | 1 | 启动地址相位信号 (Start Address Phase) |
|  | SOF_ADDR_STATE_CLK_PDI | output | 1 | PDI 时钟下的地址状态起始帧信号 (Start of Frame Address State) |
|  | EOF_SPI_TX | output | 1 | SPI 发送结束标志 (End of Frame SPI TX) |

## mem2apb

（空表）

## pn-irt

| 功能分组 | 信号名称 | 方向 | 位宽 | 信号描述/分析说明 |
| --- | --- | --- | --- | --- |
| 系统与基础控制 | clock_125m | input | 1 | 主时钟输入 (125MHz) |
|  | reset_n | input | 1 | 系统复位信号 (低电平有效) |
| 中断系统 | ins_control_irq | output | 1 | 内部控制中断请求 |
|  | ins_acyclicp0_irq | output | 1 | 非周期端口0中断请求 |
| AXI-Lite: 控制总线 | s_axi_control_awaddr | input | [18:0] | 写地址通道地址 |
|  | s_axi_control_awvalid | input | 1 | 写地址有效信号 |
|  | s_axi_control_awready | output | 1 | 写地址就绪信号 |
|  | s_axi_control_wdata | input | [31:0] | 写数据通道数据 |
|  | s_axi_control_wstrb | input | [3:0] | 写数据选通信号 (Byte Enable) |
|  | s_axi_control_wvalid | input | 1 | 写数据有效信号 |
|  | s_axi_control_wready | output | 1 | 写数据就绪信号 |
|  | s_axi_control_bresp | output | [1:0] | 写响应状态 (如 OKAY, SLVERR) |
|  | s_axi_control_bvalid | output | 1 | 写响应有效信号 |
|  | s_axi_control_bready | input | 1 | 写响应就绪信号 |
|  | s_axi_control_araddr | input | [18:0] | 读地址通道地址 |
|  | s_axi_control_arvalid | input | 1 | 读地址有效信号 |
|  | s_axi_control_arready | output | 1 | 读地址就绪信号 |
|  | s_axi_control_rdata | output | [31:0] | 读数据通道数据 |
|  | s_axi_control_rresp | output | [1:0] | 读响应状态 |
|  | s_axi_control_rvalid | output | 1 | 读数据有效信号 |
|  | s_axi_control_rready | input | 1 | 读数据就绪信号 |
| AXI-Lite: 过程数据 | s_axi_process_data_awaddr | input | [15:0] | 过程数据写地址 |
|  | s_axi_process_data_awvalid | input | 1 | ... (AXI握手信号同上) |
|  | s_axi_process_data_awready | output | 1 | ... |
|  | s_axi_process_data_wdata | input | [31:0] | 过程数据写数据 |
|  | s_axi_process_data_wstrb | input | [3:0] | ... |
|  | s_axi_process_data_wvalid | input | 1 | ... |
|  | s_axi_process_data_wready | output | 1 | ... |
|  | s_axi_process_data_bresp | output | [1:0] | ... |
|  | s_axi_process_data_bvalid | output | 1 | ... |
|  | s_axi_process_data_bready | input | 1 | ... |
|  | s_axi_process_data_araddr | input | [15:0] | 过程数据读地址 |
|  | s_axi_process_data_arvalid | input | 1 | ... |
|  | s_axi_process_data_arready | output | 1 | ... |
|  | s_axi_process_data_rdata | output | [31:0] | 过程数据读数据 |
|  | s_axi_process_data_rresp | output | [1:0] | ... |
|  | s_axi_process_data_rvalid | output | 1 | ... |
|  | s_axi_process_data_rready | input | 1 | ... |
| AXI-Lite: Acyclic P0 | s_axi_acyclicp0_awaddr | input | [10:0] | 非周期P0写地址 |
|  | s_axi_acyclicp0_awvalid | input | 1 | ... (AXI握手信号同上) |
|  | s_axi_acyclicp0_awready | output | 1 | ... |
|  | s_axi_acyclicp0_wdata | input | [31:0] | 非周期P0写数据 |
|  | s_axi_acyclicp0_wstrb | input | [3:0] | ... |
|  | s_axi_acyclicp0_wvalid | input | 1 | ... |
|  | s_axi_acyclicp0_wready | output | 1 | ... |
|  | s_axi_acyclicp0_bresp | output | [1:0] | ... |
|  | s_axi_acyclicp0_bvalid | output | 1 | ... |
|  | s_axi_acyclicp0_bready | input | 1 | ... |
|  | s_axi_acyclicp0_araddr | input | [10:0] | 非周期P0读地址 |
|  | s_axi_acyclicp0_arvalid | input | 1 | ... |
|  | s_axi_acyclicp0_arready | output | 1 | ... |
|  | s_axi_acyclicp0_rdata | output | [31:0] | 非周期P0读数据 |
|  | s_axi_acyclicp0_rresp | output | [1:0] | ... |
|  | s_axi_acyclicp0_rvalid | output | 1 | ... |
|  | s_axi_acyclicp0_rready | input | 1 | ... |
| AXI-Lite: Acyclic P1 | s_axi_acyclicp1_awaddr | input | [10:0] | 非周期P1写地址 |
|  | (其余信号同 Acyclic P0) | - | - | 包含 awvalid, wdata, rdata 等全套AXI信号 |
| AXI4 Master: Acyclic P0 Tx | m_axi_acyclicp0tx_araddr | output | [31:0] | P0发送读地址 (Master Read) |
|  | m_axi_acyclicp0tx_arlen | output | [7:0] | 读突发长度 |
|  | m_axi_acyclicp0tx_arsize | output | [2:0] | 读突发大小 |
|  | m_axi_acyclicp0tx_arburst | output | [1:0] | 读突发类型 |
|  | m_axi_acyclicp0tx_arprot | output | [2:0] | 保护类型 |
|  | m_axi_acyclicp0tx_arcache | output | [3:0] | 缓存属性 |
|  | m_axi_acyclicp0tx_aruser | output | [3:0] | 用户自定义信号 |
|  | m_axi_acyclicp0tx_arvalid | output | 1 | 读地址有效 |
|  | m_axi_acyclicp0tx_arready | input | 1 | 读地址就绪 |
|  | m_axi_acyclicp0tx_rdata | input | [31:0] | 读数据 |
|  | m_axi_acyclicp0tx_rresp | input | [1:0] | 读响应 |
|  | m_axi_acyclicp0tx_rlast | input | 1 | 读最后一个数据 |
|  | m_axi_acyclicp0tx_rvalid | input | 1 | 读数据有效 |
|  | m_axi_acyclicp0tx_rready | output | 1 | 读数据就绪 |
|  | m_axi_acyclicp0tx_awaddr | output | [31:0] | P0发送写地址 (Master Write) |
|  | m_axi_acyclicp0tx_awlen | output | [7:0] | 写突发长度 |
|  | m_axi_acyclicp0tx_awsize | output | [2:0] | 写突发大小 |
|  | m_axi_acyclicp0tx_awburst | output | [1:0] | 写突发类型 |
|  | m_axi_acyclicp0tx_awprot | output | [2:0] | 保护类型 |
|  | m_axi_acyclicp0tx_awcache | output | [3:0] | 缓存属性 |
|  | m_axi_acyclicp0tx_awuser | output | [3:0] | 用户自定义信号 |
|  | m_axi_acyclicp0tx_awvalid | output | 1 | 写地址有效 |
|  | m_axi_acyclicp0tx_awready | input | 1 | 写地址就绪 |
|  | m_axi_acyclicp0tx_wdata | output | [31:0] | 写数据 |
|  | m_axi_acyclicp0tx_wstrb | output | [3:0] | 写选通 |
|  | m_axi_acyclicp0tx_wlast | output | 1 | 写最后一个数据 |
|  | m_axi_acyclicp0tx_wvalid | output | 1 | 写数据有效 |
|  | m_axi_acyclicp0tx_wready | input | 1 | 写数据就绪 |
|  | m_axi_acyclicp0tx_bresp | input | [1:0] | 写响应 |
|  | m_axi_acyclicp0tx_bvalid | input | 1 | 写响应有效 |
|  | m_axi_acyclicp0tx_bready | output | 1 | 写响应就绪 |
| AXI4 Master: Acyclic P0 Rx | m_axi_acyclicp0rx_araddr | output | [31:0] | P0接收读地址 (Master Read) |
|  | (其余信号同 Acyclic P0 Tx) | - | - | 包含全套 AXI4 Read/Write 通道信号 |
| RMII 接口 (以太网) | rmii_p0_clock | input | 1 | RMII 端口0 参考时钟 (通常50MHz) |
|  | rmii_p0_carrier_rxenable | input | 1 | 载波侦听/接收使能 |
|  | rmii_p0_rx | input | [1:0] | RMII 接收数据线 (2-bit) |
|  | rmii_p0_txenable | output | 1 | 发送使能 |
|  | rmii_p0_tx | output | [1:0] | RMII 发送数据线 (2-bit) |
|  | rmii_p1_clock | input | 1 | RMII 端口1 参考时钟 |
|  | rmii_p1_carrier_rxenable | input | 1 | ... (同端口0) |
|  | rmii_p1_rx | input | [1:0] | ... |
|  | rmii_p1_txenable | output | 1 | ... |
|  | rmii_p1_tx | output | [1:0] | ... |
| MII 接口 (以太网) | mii_p0_collision | input | 1 | MII 端口0 冲突检测 |
|  | mii_p0_carrier | input | 1 | 载波侦听 |
|  | mii_p0_speed | output | [1:0] | 速率选择 (10/100M) |
|  | mii_p0_rxclk | input | 1 | 接收时钟 |
|  | mii_p0_rxerr | input | 1 | 接收错误指示 |
|  | mii_p0_rxd | input | [3:0] | MII 接收数据线 (4-bit) |
|  | mii_p0_rx_dv | input | 1 | 接收数据有效 |
|  | mii_p0_txclk | output | 1 | 发送时钟 |
|  | mii_p0_txerr | output | 1 | 发送编码错误 |
|  | mii_p0_txd | output | [3:0] | MII 发送数据线 (4-bit) |
|  | mii_p0_txen | output | 1 | 发送使能 |
|  | mii_p1_collision | input | 1 | MII 端口1 冲突检测 |
|  | (其余信号同 MII P0) | - | - | 包含 carrier, speed, rxd, txd 等 |
| MDIO 接口 (管理) | mdio_clock | output | 1 | MDIO 管理接口时钟 (MDC) |
|  | mdio_in | input | 1 | MDIO 数据输入 (MDI) |
|  | mdio_out | output | 1 | MDIO 数据输出 (MDO) |
|  | mdio_outenable | output | 1 | MDIO 输出使能 (三态控制) |
|  | mdio_portselect | output | [1:0] | MDIO 端口选择 (选择PHY0或PHY1) |
| DMA 信号 | dma_datain_selector | input | [15:0] | DMA输入数据选择器 |
|  | dma_datain_allowed | output | 1 | DMA输入允许 |
|  | dma_dataout_selector | input | [15:0] | DMA输出数据选择器 |
|  | dma_dataout_allowed | output | 1 | DMA输出允许 |
|  | dma_extin_intreq | input | 1 | DMA外部中断请求 |
|  | dma_extin_intclear | input | 1 | DMA外部中断清除 |
| 其他信号 (Profinet相关) | irt_sync | output | 1 | IRT 同步信号 |
|  | irt_sync_timestamp | output | [31:0] | IRT 同步时间戳 |
|  | pn_base_clk_31.25us | output | [15:0] | Profinet 基础时钟计数器 |
|  | pn_cycle_counter | output | [15:0] | Profinet 周期计数器 |
|  | pn_cycle_timestamp | output | [15:0] | Profinet 周期时间戳 |
|  | pn_consumer_update | output | 1 | Consumer 数据更新指示 |
|  | pn_provider_update | output | 1 | Provider 数据更新指示 |
|  | cputx | output | 1 | CPU 发送指示 |
|  | cpurx | output | 1 | CPU 接收指示 |
|  | pn_irq | output | [3:0] | Profinet 中断请求 (4路) |
|  | pn_sync | output | [3:0] | Profinet 同步信号 (4路) |
