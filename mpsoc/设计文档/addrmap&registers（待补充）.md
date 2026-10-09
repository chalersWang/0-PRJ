# addrmap&registers（待补充）

## addrmap

| 模块 | 基地址 | 用途 |
| --- | --- | --- |
| sys ctrl | 0x40017000 | 系统控制寄存器 |
| GPIO | ？？？？ |  |
| I2C | ？？？？ |  |
| UART0 | ？？？？ |  |
| UART1 | ？？？？ |  |
| UART2 | ？？？？ |  |
| WDT | ？？？？ |  |
| TIMOx3 | ？？？？ |  |
| TIMIx3 | ？？？？ |  |
| uC Slave | ？？？？ |  |
| SPI Master | ？？？？ |  |
| SPI Slave | ？？？？ |  |
| SRAM（64KB） | ？？？？ |  |
| SDRAM（64KB） | ？？？？ |  |
| Security/OTP | 0x40012000 | 安全控制 |
| DMACx8 | ？？？？ |  |
| QSPI | ？？？？ |  |
| PN-IRT | ？？？？ |  |
| ESC0 | 0x44c80000 | 外部 EtherCAT 通信 |
| GMAC | ？？？？ |  |
| ESC1 | 0x44c00000 | 背板 SYNC 同步 |

## SYS_CTRL

（空表）

## GPIO

（空表）

## I2C

（空表）

## UART

（空表）

## WDT

（空表）

## TIM

（空表）

## SPI

（空表）

## Security

（空表）

## DMACx8

（空表）

## QSPI

（空表）

## PN-IRT

（空表）

## GMAC

（空表）

## ESC0

> EtherCAT 从站控制器（ESC，Beckhoff ESC Section II），基地址 0x44c80000（外部 EtherCAT 通信）。
> 寄存器以 ESC 内部地址空间 0x0000–0x0FFF 访问；与 ESC1 寄存器映射完全相同，仅基地址不同。

| Offset | 寄存器名 | 关键位域 |
| --- | --- | --- |
| EtherCAT ESC 寄存器（Beckhoff ESC Section II），共 109 个 |  |  |
| ESC Information（0x0000–0x0009） |  |  |
| 0x0000 | Type | type[7:0]：EtherCAT 从站控制器类型（0x11=ET1100、0x12=ET1200、0x04=IP Core、0x02=ESC20） |
| 0x0001 | Revision | revision[7:0]：版本号 |
| 0x0002 | Build | build[15:0]：构建号（IP Core：build[7:4]=次版本、build[3:0]=维护版本） |
| 0x0004 | FMMUs supported | fmmu_count[7:0]：FMMU 数量（ET1100=8、ET1200=3、ESC20=4） |
| 0x0005 | SyncManagers supported | sm_count[7:0]：SyncManager 数量（ET1100=8、ET1200=4、ESC20=4） |
| 0x0006 | RAM Size | ram_size[7:0]：Process Data RAM 大小，单位 KB（ET1100=8、ET1200=1） |
| 0x0007 | Port Descriptor | port3[7:6]、port2[5:4]、port1[3:2]、port0[1:0]：各端口配置，编码 00=未实现/01=未配置（SII EEPROM 决定）/10=EBUS/11=MII/RMII/RGMII |
| 0x0008 | ESC Features supported | fixed_fmmu_sm[11]：固定 FMMU/SM 配置；brw_aprw_fprw[10]：不支持 BRW/APRW/FPRW；lrw[9]：不支持 LRW；enh_dc_sync[8]：增强 DC SYNC 激活；sep_fcs[7]：独立 FCS 错误；enh_link_mii[6]：MII 增强链路检测；enh_link_ebus[5]：EBUS 增强链路检测；low_jitter_ebus[4]：EBUS 低抖动；dc_width[3]：DC 宽度（1=64 位）；dc[2]：分布式时钟可用；fmmu_op[0]：FMMU 操作（0=位映射/1=字节映射） |
| Station Address（0x0010–0x0013） |  |  |
| 0x0010 | Configured Station Address | addr[15:0]：配置站地址（节点寻址 FPxx 使用）（复位值 0x0000） |
| 0x0012 | Configured Station Alias | alias[15:0]：配置站别名（EEPROM 地址 0x0004 加载，DL Control[24] 使能后生效） |
| Write Protection（0x0020–0x0031） |  |  |
| 0x0020 | Write Register Enable | enable[0]：写寄存器使能（写保护使能时须同帧先写本寄存器，值任意） |
| 0x0021 | Write Register Protection | protect[0]：写寄存器保护使能（保护 0x0000–0x0137 与 0x013A–0x0F0F，0x0030 除外） |
| 0x0030 | ESC Write Enable | enable[0]：ESC 写使能（ESC 写保护使能时须同帧先写本寄存器） |
| 0x0031 | ESC Write Protection | protect[0]：ESC 写保护使能（保护所有区域，0x0030 除外） |
| Reset（0x0040–0x0041） |  |  |
| 0x0040 | ESC Reset ECAT | reset[7:0]：连续 3 帧写 0x52('R')/0x45('E')/0x53('S') 触发 EtherCAT 核复位；progress[1:0]（读）：复位进度（01=已写 R、10=已写 RE、00=其它） |
| 0x0041 | ESC Reset PDI | reset[7:0]：同上序列复位 PDI；progress[1:0]（读） |
| Data Link Layer（0x0100–0x0111） |  |  |
| 0x0100 | ESC DL Control | station_alias[24]：站别名使能（FPxx 用别名寻址）；ebus_remote_link_down[22]：EBUS 远程断链信号时间（0=~660ms/1=~80µs）；ebus_low_jitter[19]：EBUS 低抖动；rx_fifo_size[18:16]：RX FIFO 大小（0-7，复位 7）；loop_port3[15:14]、loop_port2[13:12]、loop_port1[11:10]、loop_port0[9:8]：各端口环回（00=Auto/01=Auto Close/10=Open/11=Closed）；temp_use[1]：临时环回（约 1 秒后恢复）；forwarding_rule[0]：转发规则（0=转发非 EtherCAT 帧/1=丢弃，复位 1） |
| 0x0102 | Extended ESC DL Control | （扩展数据链路控制，仅 IP Core） |
| 0x0108 | Physical Read/Write Offset | offset[15:0]：R/W 命令读/写地址偏移（RD_ADR=ADR、WR_ADR=ADR+Offset） |
| 0x0110 | ESC DL Status | comm_port3[15]、loop_port3[14]、comm_port2[13]、loop_port2[12]、comm_port1[11]、loop_port1[10]、comm_port0[9]、loop_port0[8]：各端口通信建立/环回关闭；phy_link_port3[7]、phy_link_port2[6]、phy_link_port1[5]、phy_link_port0[4]：各端口物理链路（1=检测到 link）；enh_link[2]：增强链路检测；pdi_wd_status[1]：PDI 看门狗状态（0=超时/1=已重载）；pdi_operational[0]：PDI 运行/EEPROM 已加载（=1 是 Process RAM 可访问前提） |
| Application Layer（0x0120–0x0139） |  |  |
| 0x0120 | AL Control | device_id[5]：设备识别请求；error_ind_ack[4]：Error Ind 应答；device_state[3:0]：请求状态（1=Init/2=Pre-Op/3=Bootstrap/4=Safe-Op/8=Operational） |
| 0x0130 | AL Status | device_id[5]：设备识别；error_ind[4]：设备未进入请求状态或因本地动作改变状态；actual_state[3:0]：实际状态（1=Init/2=Pre-Op/3=Bootstrap/4=Safe-Op/8=Operational） |
| 0x0134 | AL Status Code | code[15:0]：应用层状态码 |
| 0x0138 | RUN LED Override | enable[4]：覆盖使能；led_code[3:0]：LED 编码（0x0=Off/0x1-0xC=闪 1-12 次/0xD=Blinking/0xE=Flickering/0xF=On） |
| 0x0139 | ERR LED Override | enable[4]：覆盖使能；led_code[3:0]：LED 编码（同 RUN） |
| PDI / ESC Configuration（0x0140–0x0153） |  |  |
| 0x0140 | PDI Control | pdi_type[7:0]：PDI 类型（0x00=无 PDI/0x04=Digital I/O/0x05=SPI Slave/0x06=Oversampling I/O/0x07=EtherCAT Bridge(端口3)/0x08=16 位异步 µC/0x09=8 位异步 µC/0x0A=16 位同步 µC/0x0B=8 位同步 µC/0x10-0x14=32DI~32DO/0x80=On-chip bus） |
| 0x0141 | ESC Configuration | enh_link_port3[7]、enh_link_port2[6]、enh_link_port1[5]、enh_link_port0[4]：各端口增强链路检测；dc_latch_in[3]：DC Latch In 单元；dc_sync_out[2]：DC SYNC Out 单元；enh_link_all[1]：所有端口增强链路检测（覆盖 [7:4]）；device_emulation[0]：设备仿真（0=AL status 由 PDI 设/1=自动取 AL control） |
| 0x014E | PDI Information | pdi_config_invalid[3]：PDI 配置无效；pdi_active[2]：PDI 已激活；pdi_configured[1]：PDI 已配置；pdi_write_ack[0]：PDI 寄存器写应答使能 |
| 0x0150 | PDI Configuration | 依 PDI 类型：SPI 模式 spi_mode[1:0]/spi_irq_pol[3:2]/spi_sel_pol[4]/data_out_sample[5]；异步 µC busy_pol[1:0]/irq_pol[3:2]/bhe_pol[4]/rd_pol[7]；同步 µC ta_pol[1:0]/irq_pol[3:2]/bhe_pol[4]/adr0_pol[5]/byte_access[6]/ts_pol[7]；Digital I/O outvalid_pol[0]/outvalid_mode[1]/bidir[2]/wd_behaviour[3]/input_sample[5:4]/output_update[7:6] |
| 0x0151 | DC Sync/Latch Configuration | sync1_to_al_event[7]：SYNC1 映射到 AL Event 0x0220.3；sync1_latch1[6]：SYNC1/LATCH1 选择；sync1_pol[5:4]：SYNC1 驱动/极性；sync0_to_al_event[3]：SYNC0 映射到 0x0220.2；sync0_latch0[2]：SYNC0/LATCH0 选择；sync0_pol[1:0]：SYNC0 驱动/极性 |
| 0x0152 | Extended PDI Configuration | Digital I/O：每对 I/O 方向 [15:0]；同步 µC：write_data_valid[8]/read_mode[9]/cs_sample[10]/ta_update[11]；异步 µC：read_busy_delay[0]/write_timing[1]；On-chip bus：read_prefetch[1:0]/axi_subtype[10:8] |
| Interrupts / Events（0x0200–0x0223） |  |  |
| 0x0200 | ECAT Event Mask | mask[15:0]：把 ECAT Event Request 位映射到帧的 ECAT event 字段（0=不映射/1=映射） |
| 0x0204 | PDI AL Event Mask | mask[15:0]：把 AL Event Request 映射到 PDI IRQ 信号（复位值 0x00FF） |
| 0x0210 | ECAT Event Request | sm_status_mirror[11:4]：SM0-7 状态镜像；al_status_event[3]：AL Status 事件（读 0x0130 清除）；dl_status_event[2]：DL Status 事件（读 0x0110 清除）；dc_latch_event[0]：DC Latch 事件（读 Latch 时间清除） |
| 0x0220 | AL Event Request | sm_int[23:8]：SM0-15 中断（SM Status[0]/[1]）；wd_process_data[6]：Process Data 看门狗（读 0x0440 清除）；eeprom_emulation[5]：EEPROM 仿真；sm_activation_changed[4]：SM 激活改变（读 0x0806 清除）；dc_sync1[3]：DC SYNC1 状态（读 0x098F 清除）；dc_sync0[2]：DC SYNC0 状态（读 0x098E 清除）；dc_latch_event[1]：DC Latch 事件；al_control_event[0]：AL Control 事件（PDI 读 0x0120 清除） |
| Error Counters（0x0300–0x0313） |  |  |
| 0x0300 | RX Error Counter Port 0 | rx_error[15:8]：RX 错误计数；invalid_frame[7:0]：无效帧计数（饱和 0xFF，写清除） |
| 0x0302 | RX Error Counter Port 1 | rx_error[15:8]；invalid_frame[7:0]：同 Port0 |
| 0x0304 | RX Error Counter Port 2 | rx_error[15:8]；invalid_frame[7:0]：同 Port0 |
| 0x0306 | RX Error Counter Port 3 | rx_error[15:8]；invalid_frame[7:0]：同 Port0 |
| 0x0308 | Forwarded RX Error Port 0 | fwd_rx_error[7:0]：转发 RX 错误计数（饱和 0xFF，写清除） |
| 0x030A | Forwarded RX Error Port 1 | fwd_rx_error[7:0]：同 Port0 |
| 0x030C | ECAT Processing Unit Error Counter | ecu_error[7:0]：ECAT 处理单元帧错误计数 |
| 0x030D | PDI Error Counter | pdi_error[7:0]：PDI 错误计数 |
| 0x030E | PDI Error Code | SPI：cmd[7:6]/写继续[5]/缺读终止[4]/读 busy 违例[3]/访问时钟周期数[2:0]；µC：写寻址错[3]/读寻址错[2]/写 busy 违例[1]/读 busy 违例[0] |
| 0x0310 | Lost Link Counter Port 0 | lost_link[7:0]：丢链计数（仅 Loop=Auto 时） |
| 0x0312 | Lost Link Counter Port 1 | lost_link[7:0]：同 Port0 |
| Watchdogs（0x0400–0x0443） |  |  |
| 0x0400 | Watchdog Divider | wd_div[15:0]：看门狗分频器，25MHz tick 数减 2（复位值 0x09C2=2498→100µs） |
| 0x0410 | Watchdog Time PDI | wd_time_pdi[15:0]：PDI 看门狗时间（=0 禁用，复位值 0x03E8=100ms） |
| 0x0420 | Watchdog Time Process Data | wd_time_pd[15:0]：过程数据看门狗时间（=0 禁用，复位值 0x03E8） |
| 0x0440 | Watchdog Status Process Data | wd_status[0]：0=超时/1=激活或禁用 |
| 0x0442 | Watchdog Counter Process Data | wd_counter[7:0]：过程数据看门狗超时计数（写 0x0442/0x0443 任一清两者） |
| 0x0443 | Watchdog Counter PDI | wd_counter[7:0]：PDI 看门狗超时计数 |
| SII EEPROM Interface（0x0500–0x050F） |  |  |
| 0x0500 | EEPROM Configuration | force_ecat[1]：强制 ECAT 访问（复位 0x0501.0）；pdi_ctrl[0]：EEPROM 控制权交给 PDI |
| 0x0501 | EEPROM PDI Access State | pdi_access[0]：=1 时 PDI 拥有 EEPROM 控制权 |
| 0x0502 | EEPROM Control/Status | busy[15]：忙；err_write_enable[14]：无写使能的写；err_ack_cmd[13]：缺应答/无效命令；err_device_info[12]：EEPROM 加载失败；checksum_err[11]：ESC 配置区校验错；cmd[10:8]：命令（000=空闲/清错、001=读、010=写、100=重载）；eeprom_algorithm[7]：地址字节数（0=1 字节/1=2 字节）；eeprom_read_bytes[6]：读字节数（0=4/1=8，ET1100/ET1200=1）；emulation[5]：EEPROM 仿真；write_enable[0]：写请求使能 |
| 0x0504 | EEPROM Address | addr[17:0]：EEPROM 地址（≤16Kbit 用 [9:0]、32Kbit–4Mbit 用 [17:0]、仿真用 [31:0]） |
| 0x0508 | EEPROM Data | data[63:0]：EEPROM 数据（写 [15:0]、读 [63:16]） |
| MII Management（0x0510–0x051B） |  |  |
| 0x0510 | MII Management Control/Status | busy[15]：忙；cmd_error[14]：命令错误；read_error[13]：读错误；cmd[9:8]：命令（00=空闲/清错、01=读、10=写）；port0_phy_addr[7:3]：Port0 PHY 地址；mi_link_detect[2]：MI 链路检测激活；pdi_ctrl[1]：MI 由 PDI 可控；write_enable[0]：写使能 |
| 0x0512 | MII PHY Address | show_independent[7]：显示独立地址；phy_addr[4:0]：PHY 地址 |
| 0x0513 | MII PHY Register Address | phy_reg[4:0]：PHY 寄存器号 |
| 0x0514 | MII PHY Data | data[15:0]：PHY 读/写数据 |
| 0x0516 | MII ECAT Access State | ecat_access[0]：ECAT 请求独占 |
| 0x0517 | MII PDI Access State | force_reset[1]：强制复位；pdi_access[0]：=1 时 PDI 拥有 MI 访问 |
| 0x0518 | PHY Port Status（Port0–3） | 每端口 1 字节：phy_config_updated[5]：PHY 配置已更新；peer_error[4]：对端错误；read_error[3]：读错误；link_error[2]：链路错误；link_full_duplex[1]：link（100M 全双工）；phy_link[0]：物理 link |
| FMMU（0x0600–0x06FF） |  |  |
| 0x0600 | FMMU（8 通道 × 16 字节） | 地址=0x0600+y×16+偏移。每通道：Logical Start Address[+0x0]：逻辑起始地址；Length[+0x4]：逻辑字节数；Logical Start bit[+0x6][2:0]：逻辑起始位；Logical Stop bit[+0x7][2:0]：逻辑结束位；Physical Start Address[+0x8]：物理起始地址；Physical Start bit[+0xA][2:0]：物理起始位；Type[+0xB]（bit0=读映射/bit1=写映射）；Activate[+0xC]（bit0=激活） |
| SyncManager（0x0800–0x087F） |  |  |
| 0x0800 | SyncManager（8 通道 × 8 字节） | 地址=0x0800+y×8+偏移。每通道：Physical Start Address[+0x0]；Length[+0x2]；Control[+0x4]（[1:0]模式 00=Buffered(3 缓冲)/10=Mailbox(单缓冲)；[3:2]方向 00=Read(ECAT 读/PDI 写)/01=Write(ECAT 写/PDI 读)；[4]ECAT 事件中断；[5]PDI 事件中断；[6]看门狗触发）；Status[+0x5]（[0]写中断/[1]读中断/[3]邮箱满/[5:4]最后写入缓冲/[6]读缓冲占用/[7]写缓冲占用）；Activate[+0x6]（[0]使能/[1]Repeat Request/[6]ECAT Latch/[7]PDI Latch）；PDI Control[+0x7]（[0]停用/[1]Repeat Ack） |
| Distributed Clocks（0x0900–0x09FF） |  |  |
| 0x0900 | Receive Time Port 0 | time[31:0]：写=锁存各端口接收帧开始本地时间；读=最近一次含写访问帧开始时间 |
| 0x0904 | Receive Time Port 1 | time[31:0]：同 Port0 |
| 0x0908 | Receive Time Port 2 | time[31:0]：同 Port0 |
| 0x090C | Receive Time Port 3 | time[31:0]：同 Port0 |
| 0x0910 | System Time | time[63:0]：64 位本地系统时间（1ns 基准，2000-01-01 起） |
| 0x0918 | Receive Time EPU | time[63:0]：ECAT 处理单元收到帧开始时间 |
| 0x0920 | System Time Offset | offset[63:0]：本地时间与 System Time 之差（加到本地时间） |
| 0x0928 | System Time Delay | delay[31:0]：参考时钟与 ESC 间传播延迟 |
| 0x092C | System Time Difference | sign[31]：符号位；diff[30:0]：本地副本与收到 System Time 的平均差 |
| 0x0930 | Speed Counter Start | start[15:0]：调整带宽（复位值 0x1000，范围 0x0080–0x3FFF） |
| 0x0932 | Speed Counter Diff | diff[15:0]：本地/参考时钟周期偏差（补码） |
| 0x0934 | System Time Difference Filter Depth | depth[7:0]：滤波深度（复位值 4） |
| 0x0935 | Speed Counter Filter Depth | depth[7:0]：滤波深度（复位值 12） |
| 0x0936 | Receive Time Latch Mode | mode[0]：0=转发/1=反向 |
| 0x0980 | Cyclic Unit Control | latch1_ctrl[5]、latch0_ctrl[4]、sync_out_ctrl[0]：各单元控制（0=ECAT/1=PDI） |
| 0x0981 | DC Activation | debug_pulse[7]：调试脉冲；near_future[6]：Near future（0=½DC 宽度/1=~2.1s）；start_time_check[5]：开始时间合理性检查；start_time_64[4]：开始时间扩展 64 位；auto_activate[3]：写开始时间自动激活；sync1_gen[2]：SYNC1 产生；sync0_gen[1]：SYNC0 产生；sync_out_activate[0]：Sync Out 激活 |
| 0x0982 | Pulse Length of SyncSignals | pulse_len[15:0]：SYNC 脉冲宽度（10ns 单位，0=Acknowledge 模式） |
| 0x0984 | DC Activation Status | start_time_check_result[2]：开始时间合理性结果；sync1_pending[1]：SYNC1 挂起；sync0_pending[0]：SYNC0 挂起 |
| 0x098E | SYNC0 Status | status[7:0]：Acknowledge 模式状态（读清除） |
| 0x098F | SYNC1 Status | status[7:0]：Acknowledge 模式状态（读清除） |
| 0x0990 | Start Time Cyclic Operation / Next SYNC0 Pulse | time[63:0]：写=循环开始时间（ns）；读=下一 SYNC0 脉冲时间 |
| 0x0998 | Next SYNC1 Pulse | time[63:0]：下一 SYNC1 脉冲时间 |
| 0x09A0 | SYNC0 Cycle Time | cycle[31:0]：SYNC0 脉冲间隔（ns，0=单次模式） |
| 0x09A4 | SYNC1 Cycle Time | cycle[31:0]：SYNC1 相对 SYNC0 延时（ns，0=跟随 SYNC0） |
| 0x09A8 | Latch0 Control | neg_edge[1]：负沿；pos_edge[0]：正沿（0=连续/1=单事件） |
| 0x09A9 | Latch1 Control | neg_edge[1]；pos_edge[0]：同 Latch0 |
| 0x09AE | Latch0 Status | pin_state[2]：引脚状态；neg_edge_event[1]：负沿事件；pos_edge_event[0]：正沿事件 |
| 0x09AF | Latch1 Status | pin_state[2]；neg_edge_event[1]；pos_edge_event[0]：同 Latch0 |
| 0x09B0 | Latch0 Positive Edge | time[63:0]：Latch0 正沿时间 |
| 0x09B8 | Latch0 Negative Edge | time[63:0]：Latch0 负沿时间 |
| 0x09C0 | Latch1 Positive Edge | time[63:0]：Latch1 正沿时间 |
| 0x09C8 | Latch1 Negative Edge | time[63:0]：Latch1 负沿时间 |
| 0x09F0 | EtherCAT Buffer Change Event Time | time[31:0]：EtherCAT 缓冲改变事件时间 |
| 0x09F8 | PDI Buffer Start Event Time | time[31:0]：PDI 缓冲开始事件时间 |
| 0x09FC | PDI Buffer Change Event Time | time[31:0]：PDI 缓冲改变事件时间 |
| ESC specific（0x0E00–0x0EFF） |  |  |
| 0x0E00 | Power-On Values | ET1100：linkpol[14]：PHY 链路极性；phyad_off[13]：PHY 地址偏移（1=+16）；ctrl_status_move[12]：控制/状态信号映射；trans_mode_ena[11]：透明模式 MII；c25_ena[10]：CLK25 输出使能；c25_shi[9:8]：CLK25 移位；clk_mode[7:6]：CPU 时钟输出；p_conf[5:2]：每端口 EBUS(0)/MII(1)；p_mode[1:0]：逻辑端口数（2/3/4） |
| 0x0E00 | Product ID（0x0E00:0x0E07） | department[31:24]：部门；company[23:0]：厂商（仅 IP Core） |
| 0x0E08 | Vendor ID（0x0E08:0x0E0F） | department[31:24]：部门；company[23:0]：厂商（仅 IP Core） |
| ESC specific I/O（0x0F00–0x0F1F） |  |  |
| 0x0F00 | Digital I/O Output Data | output[31:0]：32 位数字输出（可按位写，用逻辑寻址） |
| 0x0F10 | General Purpose Outputs | gpo[15:0]：通用输出（宽度 1/2/4/8 字节依 PDI） |
| 0x0F18 | General Purpose Inputs | gpi[15:0]：通用输入 |
| User RAM / Process Data RAM |  |  |
| 0x0F80 | User RAM | ram[127:0]：用户 RAM（128 字节） |
| 0x1000 | Process Data RAM | ram[7:0]（×8KB）：过程数据 RAM（ET1100=8KB；仅在 EEPROM 正确加载后 0x0110[0]=1 可访问） |

## ESC1

> EtherCAT 从站控制器（ESC，Beckhoff ESC Section II），基地址 0x44c00000（背板 SYNC 同步）。
> 寄存器以 ESC 内部地址空间 0x0000–0x0FFF 访问；与 ESC0 寄存器映射完全相同，仅基地址不同。

| Offset | 寄存器名 | 关键位域 |
| --- | --- | --- |
| EtherCAT ESC 寄存器（Beckhoff ESC Section II），共 109 个 |  |  |
| ESC Information（0x0000–0x0009） |  |  |
| 0x0000 | Type | type[7:0]：EtherCAT 从站控制器类型（0x11=ET1100、0x12=ET1200、0x04=IP Core、0x02=ESC20） |
| 0x0001 | Revision | revision[7:0]：版本号 |
| 0x0002 | Build | build[15:0]：构建号（IP Core：build[7:4]=次版本、build[3:0]=维护版本） |
| 0x0004 | FMMUs supported | fmmu_count[7:0]：FMMU 数量（ET1100=8、ET1200=3、ESC20=4） |
| 0x0005 | SyncManagers supported | sm_count[7:0]：SyncManager 数量（ET1100=8、ET1200=4、ESC20=4） |
| 0x0006 | RAM Size | ram_size[7:0]：Process Data RAM 大小，单位 KB（ET1100=8、ET1200=1） |
| 0x0007 | Port Descriptor | port3[7:6]、port2[5:4]、port1[3:2]、port0[1:0]：各端口配置，编码 00=未实现/01=未配置（SII EEPROM 决定）/10=EBUS/11=MII/RMII/RGMII |
| 0x0008 | ESC Features supported | fixed_fmmu_sm[11]：固定 FMMU/SM 配置；brw_aprw_fprw[10]：不支持 BRW/APRW/FPRW；lrw[9]：不支持 LRW；enh_dc_sync[8]：增强 DC SYNC 激活；sep_fcs[7]：独立 FCS 错误；enh_link_mii[6]：MII 增强链路检测；enh_link_ebus[5]：EBUS 增强链路检测；low_jitter_ebus[4]：EBUS 低抖动；dc_width[3]：DC 宽度（1=64 位）；dc[2]：分布式时钟可用；fmmu_op[0]：FMMU 操作（0=位映射/1=字节映射） |
| Station Address（0x0010–0x0013） |  |  |
| 0x0010 | Configured Station Address | addr[15:0]：配置站地址（节点寻址 FPxx 使用）（复位值 0x0000） |
| 0x0012 | Configured Station Alias | alias[15:0]：配置站别名（EEPROM 地址 0x0004 加载，DL Control[24] 使能后生效） |
| Write Protection（0x0020–0x0031） |  |  |
| 0x0020 | Write Register Enable | enable[0]：写寄存器使能（写保护使能时须同帧先写本寄存器，值任意） |
| 0x0021 | Write Register Protection | protect[0]：写寄存器保护使能（保护 0x0000–0x0137 与 0x013A–0x0F0F，0x0030 除外） |
| 0x0030 | ESC Write Enable | enable[0]：ESC 写使能（ESC 写保护使能时须同帧先写本寄存器） |
| 0x0031 | ESC Write Protection | protect[0]：ESC 写保护使能（保护所有区域，0x0030 除外） |
| Reset（0x0040–0x0041） |  |  |
| 0x0040 | ESC Reset ECAT | reset[7:0]：连续 3 帧写 0x52('R')/0x45('E')/0x53('S') 触发 EtherCAT 核复位；progress[1:0]（读）：复位进度（01=已写 R、10=已写 RE、00=其它） |
| 0x0041 | ESC Reset PDI | reset[7:0]：同上序列复位 PDI；progress[1:0]（读） |
| Data Link Layer（0x0100–0x0111） |  |  |
| 0x0100 | ESC DL Control | station_alias[24]：站别名使能（FPxx 用别名寻址）；ebus_remote_link_down[22]：EBUS 远程断链信号时间（0=~660ms/1=~80µs）；ebus_low_jitter[19]：EBUS 低抖动；rx_fifo_size[18:16]：RX FIFO 大小（0-7，复位 7）；loop_port3[15:14]、loop_port2[13:12]、loop_port1[11:10]、loop_port0[9:8]：各端口环回（00=Auto/01=Auto Close/10=Open/11=Closed）；temp_use[1]：临时环回（约 1 秒后恢复）；forwarding_rule[0]：转发规则（0=转发非 EtherCAT 帧/1=丢弃，复位 1） |
| 0x0102 | Extended ESC DL Control | （扩展数据链路控制，仅 IP Core） |
| 0x0108 | Physical Read/Write Offset | offset[15:0]：R/W 命令读/写地址偏移（RD_ADR=ADR、WR_ADR=ADR+Offset） |
| 0x0110 | ESC DL Status | comm_port3[15]、loop_port3[14]、comm_port2[13]、loop_port2[12]、comm_port1[11]、loop_port1[10]、comm_port0[9]、loop_port0[8]：各端口通信建立/环回关闭；phy_link_port3[7]、phy_link_port2[6]、phy_link_port1[5]、phy_link_port0[4]：各端口物理链路（1=检测到 link）；enh_link[2]：增强链路检测；pdi_wd_status[1]：PDI 看门狗状态（0=超时/1=已重载）；pdi_operational[0]：PDI 运行/EEPROM 已加载（=1 是 Process RAM 可访问前提） |
| Application Layer（0x0120–0x0139） |  |  |
| 0x0120 | AL Control | device_id[5]：设备识别请求；error_ind_ack[4]：Error Ind 应答；device_state[3:0]：请求状态（1=Init/2=Pre-Op/3=Bootstrap/4=Safe-Op/8=Operational） |
| 0x0130 | AL Status | device_id[5]：设备识别；error_ind[4]：设备未进入请求状态或因本地动作改变状态；actual_state[3:0]：实际状态（1=Init/2=Pre-Op/3=Bootstrap/4=Safe-Op/8=Operational） |
| 0x0134 | AL Status Code | code[15:0]：应用层状态码 |
| 0x0138 | RUN LED Override | enable[4]：覆盖使能；led_code[3:0]：LED 编码（0x0=Off/0x1-0xC=闪 1-12 次/0xD=Blinking/0xE=Flickering/0xF=On） |
| 0x0139 | ERR LED Override | enable[4]：覆盖使能；led_code[3:0]：LED 编码（同 RUN） |
| PDI / ESC Configuration（0x0140–0x0153） |  |  |
| 0x0140 | PDI Control | pdi_type[7:0]：PDI 类型（0x00=无 PDI/0x04=Digital I/O/0x05=SPI Slave/0x06=Oversampling I/O/0x07=EtherCAT Bridge(端口3)/0x08=16 位异步 µC/0x09=8 位异步 µC/0x0A=16 位同步 µC/0x0B=8 位同步 µC/0x10-0x14=32DI~32DO/0x80=On-chip bus） |
| 0x0141 | ESC Configuration | enh_link_port3[7]、enh_link_port2[6]、enh_link_port1[5]、enh_link_port0[4]：各端口增强链路检测；dc_latch_in[3]：DC Latch In 单元；dc_sync_out[2]：DC SYNC Out 单元；enh_link_all[1]：所有端口增强链路检测（覆盖 [7:4]）；device_emulation[0]：设备仿真（0=AL status 由 PDI 设/1=自动取 AL control） |
| 0x014E | PDI Information | pdi_config_invalid[3]：PDI 配置无效；pdi_active[2]：PDI 已激活；pdi_configured[1]：PDI 已配置；pdi_write_ack[0]：PDI 寄存器写应答使能 |
| 0x0150 | PDI Configuration | 依 PDI 类型：SPI 模式 spi_mode[1:0]/spi_irq_pol[3:2]/spi_sel_pol[4]/data_out_sample[5]；异步 µC busy_pol[1:0]/irq_pol[3:2]/bhe_pol[4]/rd_pol[7]；同步 µC ta_pol[1:0]/irq_pol[3:2]/bhe_pol[4]/adr0_pol[5]/byte_access[6]/ts_pol[7]；Digital I/O outvalid_pol[0]/outvalid_mode[1]/bidir[2]/wd_behaviour[3]/input_sample[5:4]/output_update[7:6] |
| 0x0151 | DC Sync/Latch Configuration | sync1_to_al_event[7]：SYNC1 映射到 AL Event 0x0220.3；sync1_latch1[6]：SYNC1/LATCH1 选择；sync1_pol[5:4]：SYNC1 驱动/极性；sync0_to_al_event[3]：SYNC0 映射到 0x0220.2；sync0_latch0[2]：SYNC0/LATCH0 选择；sync0_pol[1:0]：SYNC0 驱动/极性 |
| 0x0152 | Extended PDI Configuration | Digital I/O：每对 I/O 方向 [15:0]；同步 µC：write_data_valid[8]/read_mode[9]/cs_sample[10]/ta_update[11]；异步 µC：read_busy_delay[0]/write_timing[1]；On-chip bus：read_prefetch[1:0]/axi_subtype[10:8] |
| Interrupts / Events（0x0200–0x0223） |  |  |
| 0x0200 | ECAT Event Mask | mask[15:0]：把 ECAT Event Request 位映射到帧的 ECAT event 字段（0=不映射/1=映射） |
| 0x0204 | PDI AL Event Mask | mask[15:0]：把 AL Event Request 映射到 PDI IRQ 信号（复位值 0x00FF） |
| 0x0210 | ECAT Event Request | sm_status_mirror[11:4]：SM0-7 状态镜像；al_status_event[3]：AL Status 事件（读 0x0130 清除）；dl_status_event[2]：DL Status 事件（读 0x0110 清除）；dc_latch_event[0]：DC Latch 事件（读 Latch 时间清除） |
| 0x0220 | AL Event Request | sm_int[23:8]：SM0-15 中断（SM Status[0]/[1]）；wd_process_data[6]：Process Data 看门狗（读 0x0440 清除）；eeprom_emulation[5]：EEPROM 仿真；sm_activation_changed[4]：SM 激活改变（读 0x0806 清除）；dc_sync1[3]：DC SYNC1 状态（读 0x098F 清除）；dc_sync0[2]：DC SYNC0 状态（读 0x098E 清除）；dc_latch_event[1]：DC Latch 事件；al_control_event[0]：AL Control 事件（PDI 读 0x0120 清除） |
| Error Counters（0x0300–0x0313） |  |  |
| 0x0300 | RX Error Counter Port 0 | rx_error[15:8]：RX 错误计数；invalid_frame[7:0]：无效帧计数（饱和 0xFF，写清除） |
| 0x0302 | RX Error Counter Port 1 | rx_error[15:8]；invalid_frame[7:0]：同 Port0 |
| 0x0304 | RX Error Counter Port 2 | rx_error[15:8]；invalid_frame[7:0]：同 Port0 |
| 0x0306 | RX Error Counter Port 3 | rx_error[15:8]；invalid_frame[7:0]：同 Port0 |
| 0x0308 | Forwarded RX Error Port 0 | fwd_rx_error[7:0]：转发 RX 错误计数（饱和 0xFF，写清除） |
| 0x030A | Forwarded RX Error Port 1 | fwd_rx_error[7:0]：同 Port0 |
| 0x030C | ECAT Processing Unit Error Counter | ecu_error[7:0]：ECAT 处理单元帧错误计数 |
| 0x030D | PDI Error Counter | pdi_error[7:0]：PDI 错误计数 |
| 0x030E | PDI Error Code | SPI：cmd[7:6]/写继续[5]/缺读终止[4]/读 busy 违例[3]/访问时钟周期数[2:0]；µC：写寻址错[3]/读寻址错[2]/写 busy 违例[1]/读 busy 违例[0] |
| 0x0310 | Lost Link Counter Port 0 | lost_link[7:0]：丢链计数（仅 Loop=Auto 时） |
| 0x0312 | Lost Link Counter Port 1 | lost_link[7:0]：同 Port0 |
| Watchdogs（0x0400–0x0443） |  |  |
| 0x0400 | Watchdog Divider | wd_div[15:0]：看门狗分频器，25MHz tick 数减 2（复位值 0x09C2=2498→100µs） |
| 0x0410 | Watchdog Time PDI | wd_time_pdi[15:0]：PDI 看门狗时间（=0 禁用，复位值 0x03E8=100ms） |
| 0x0420 | Watchdog Time Process Data | wd_time_pd[15:0]：过程数据看门狗时间（=0 禁用，复位值 0x03E8） |
| 0x0440 | Watchdog Status Process Data | wd_status[0]：0=超时/1=激活或禁用 |
| 0x0442 | Watchdog Counter Process Data | wd_counter[7:0]：过程数据看门狗超时计数（写 0x0442/0x0443 任一清两者） |
| 0x0443 | Watchdog Counter PDI | wd_counter[7:0]：PDI 看门狗超时计数 |
| SII EEPROM Interface（0x0500–0x050F） |  |  |
| 0x0500 | EEPROM Configuration | force_ecat[1]：强制 ECAT 访问（复位 0x0501.0）；pdi_ctrl[0]：EEPROM 控制权交给 PDI |
| 0x0501 | EEPROM PDI Access State | pdi_access[0]：=1 时 PDI 拥有 EEPROM 控制权 |
| 0x0502 | EEPROM Control/Status | busy[15]：忙；err_write_enable[14]：无写使能的写；err_ack_cmd[13]：缺应答/无效命令；err_device_info[12]：EEPROM 加载失败；checksum_err[11]：ESC 配置区校验错；cmd[10:8]：命令（000=空闲/清错、001=读、010=写、100=重载）；eeprom_algorithm[7]：地址字节数（0=1 字节/1=2 字节）；eeprom_read_bytes[6]：读字节数（0=4/1=8，ET1100/ET1200=1）；emulation[5]：EEPROM 仿真；write_enable[0]：写请求使能 |
| 0x0504 | EEPROM Address | addr[17:0]：EEPROM 地址（≤16Kbit 用 [9:0]、32Kbit–4Mbit 用 [17:0]、仿真用 [31:0]） |
| 0x0508 | EEPROM Data | data[63:0]：EEPROM 数据（写 [15:0]、读 [63:16]） |
| MII Management（0x0510–0x051B） |  |  |
| 0x0510 | MII Management Control/Status | busy[15]：忙；cmd_error[14]：命令错误；read_error[13]：读错误；cmd[9:8]：命令（00=空闲/清错、01=读、10=写）；port0_phy_addr[7:3]：Port0 PHY 地址；mi_link_detect[2]：MI 链路检测激活；pdi_ctrl[1]：MI 由 PDI 可控；write_enable[0]：写使能 |
| 0x0512 | MII PHY Address | show_independent[7]：显示独立地址；phy_addr[4:0]：PHY 地址 |
| 0x0513 | MII PHY Register Address | phy_reg[4:0]：PHY 寄存器号 |
| 0x0514 | MII PHY Data | data[15:0]：PHY 读/写数据 |
| 0x0516 | MII ECAT Access State | ecat_access[0]：ECAT 请求独占 |
| 0x0517 | MII PDI Access State | force_reset[1]：强制复位；pdi_access[0]：=1 时 PDI 拥有 MI 访问 |
| 0x0518 | PHY Port Status（Port0–3） | 每端口 1 字节：phy_config_updated[5]：PHY 配置已更新；peer_error[4]：对端错误；read_error[3]：读错误；link_error[2]：链路错误；link_full_duplex[1]：link（100M 全双工）；phy_link[0]：物理 link |
| FMMU（0x0600–0x06FF） |  |  |
| 0x0600 | FMMU（8 通道 × 16 字节） | 地址=0x0600+y×16+偏移。每通道：Logical Start Address[+0x0]：逻辑起始地址；Length[+0x4]：逻辑字节数；Logical Start bit[+0x6][2:0]：逻辑起始位；Logical Stop bit[+0x7][2:0]：逻辑结束位；Physical Start Address[+0x8]：物理起始地址；Physical Start bit[+0xA][2:0]：物理起始位；Type[+0xB]（bit0=读映射/bit1=写映射）；Activate[+0xC]（bit0=激活） |
| SyncManager（0x0800–0x087F） |  |  |
| 0x0800 | SyncManager（8 通道 × 8 字节） | 地址=0x0800+y×8+偏移。每通道：Physical Start Address[+0x0]；Length[+0x2]；Control[+0x4]（[1:0]模式 00=Buffered(3 缓冲)/10=Mailbox(单缓冲)；[3:2]方向 00=Read(ECAT 读/PDI 写)/01=Write(ECAT 写/PDI 读)；[4]ECAT 事件中断；[5]PDI 事件中断；[6]看门狗触发）；Status[+0x5]（[0]写中断/[1]读中断/[3]邮箱满/[5:4]最后写入缓冲/[6]读缓冲占用/[7]写缓冲占用）；Activate[+0x6]（[0]使能/[1]Repeat Request/[6]ECAT Latch/[7]PDI Latch）；PDI Control[+0x7]（[0]停用/[1]Repeat Ack） |
| Distributed Clocks（0x0900–0x09FF） |  |  |
| 0x0900 | Receive Time Port 0 | time[31:0]：写=锁存各端口接收帧开始本地时间；读=最近一次含写访问帧开始时间 |
| 0x0904 | Receive Time Port 1 | time[31:0]：同 Port0 |
| 0x0908 | Receive Time Port 2 | time[31:0]：同 Port0 |
| 0x090C | Receive Time Port 3 | time[31:0]：同 Port0 |
| 0x0910 | System Time | time[63:0]：64 位本地系统时间（1ns 基准，2000-01-01 起） |
| 0x0918 | Receive Time EPU | time[63:0]：ECAT 处理单元收到帧开始时间 |
| 0x0920 | System Time Offset | offset[63:0]：本地时间与 System Time 之差（加到本地时间） |
| 0x0928 | System Time Delay | delay[31:0]：参考时钟与 ESC 间传播延迟 |
| 0x092C | System Time Difference | sign[31]：符号位；diff[30:0]：本地副本与收到 System Time 的平均差 |
| 0x0930 | Speed Counter Start | start[15:0]：调整带宽（复位值 0x1000，范围 0x0080–0x3FFF） |
| 0x0932 | Speed Counter Diff | diff[15:0]：本地/参考时钟周期偏差（补码） |
| 0x0934 | System Time Difference Filter Depth | depth[7:0]：滤波深度（复位值 4） |
| 0x0935 | Speed Counter Filter Depth | depth[7:0]：滤波深度（复位值 12） |
| 0x0936 | Receive Time Latch Mode | mode[0]：0=转发/1=反向 |
| 0x0980 | Cyclic Unit Control | latch1_ctrl[5]、latch0_ctrl[4]、sync_out_ctrl[0]：各单元控制（0=ECAT/1=PDI） |
| 0x0981 | DC Activation | debug_pulse[7]：调试脉冲；near_future[6]：Near future（0=½DC 宽度/1=~2.1s）；start_time_check[5]：开始时间合理性检查；start_time_64[4]：开始时间扩展 64 位；auto_activate[3]：写开始时间自动激活；sync1_gen[2]：SYNC1 产生；sync0_gen[1]：SYNC0 产生；sync_out_activate[0]：Sync Out 激活 |
| 0x0982 | Pulse Length of SyncSignals | pulse_len[15:0]：SYNC 脉冲宽度（10ns 单位，0=Acknowledge 模式） |
| 0x0984 | DC Activation Status | start_time_check_result[2]：开始时间合理性结果；sync1_pending[1]：SYNC1 挂起；sync0_pending[0]：SYNC0 挂起 |
| 0x098E | SYNC0 Status | status[7:0]：Acknowledge 模式状态（读清除） |
| 0x098F | SYNC1 Status | status[7:0]：Acknowledge 模式状态（读清除） |
| 0x0990 | Start Time Cyclic Operation / Next SYNC0 Pulse | time[63:0]：写=循环开始时间（ns）；读=下一 SYNC0 脉冲时间 |
| 0x0998 | Next SYNC1 Pulse | time[63:0]：下一 SYNC1 脉冲时间 |
| 0x09A0 | SYNC0 Cycle Time | cycle[31:0]：SYNC0 脉冲间隔（ns，0=单次模式） |
| 0x09A4 | SYNC1 Cycle Time | cycle[31:0]：SYNC1 相对 SYNC0 延时（ns，0=跟随 SYNC0） |
| 0x09A8 | Latch0 Control | neg_edge[1]：负沿；pos_edge[0]：正沿（0=连续/1=单事件） |
| 0x09A9 | Latch1 Control | neg_edge[1]；pos_edge[0]：同 Latch0 |
| 0x09AE | Latch0 Status | pin_state[2]：引脚状态；neg_edge_event[1]：负沿事件；pos_edge_event[0]：正沿事件 |
| 0x09AF | Latch1 Status | pin_state[2]；neg_edge_event[1]；pos_edge_event[0]：同 Latch0 |
| 0x09B0 | Latch0 Positive Edge | time[63:0]：Latch0 正沿时间 |
| 0x09B8 | Latch0 Negative Edge | time[63:0]：Latch0 负沿时间 |
| 0x09C0 | Latch1 Positive Edge | time[63:0]：Latch1 正沿时间 |
| 0x09C8 | Latch1 Negative Edge | time[63:0]：Latch1 负沿时间 |
| 0x09F0 | EtherCAT Buffer Change Event Time | time[31:0]：EtherCAT 缓冲改变事件时间 |
| 0x09F8 | PDI Buffer Start Event Time | time[31:0]：PDI 缓冲开始事件时间 |
| 0x09FC | PDI Buffer Change Event Time | time[31:0]：PDI 缓冲改变事件时间 |
| ESC specific（0x0E00–0x0EFF） |  |  |
| 0x0E00 | Power-On Values | ET1100：linkpol[14]：PHY 链路极性；phyad_off[13]：PHY 地址偏移（1=+16）；ctrl_status_move[12]：控制/状态信号映射；trans_mode_ena[11]：透明模式 MII；c25_ena[10]：CLK25 输出使能；c25_shi[9:8]：CLK25 移位；clk_mode[7:6]：CPU 时钟输出；p_conf[5:2]：每端口 EBUS(0)/MII(1)；p_mode[1:0]：逻辑端口数（2/3/4） |
| 0x0E00 | Product ID（0x0E00:0x0E07） | department[31:24]：部门；company[23:0]：厂商（仅 IP Core） |
| 0x0E08 | Vendor ID（0x0E08:0x0E0F） | department[31:24]：部门；company[23:0]：厂商（仅 IP Core） |
| ESC specific I/O（0x0F00–0x0F1F） |  |  |
| 0x0F00 | Digital I/O Output Data | output[31:0]：32 位数字输出（可按位写，用逻辑寻址） |
| 0x0F10 | General Purpose Outputs | gpo[15:0]：通用输出（宽度 1/2/4/8 字节依 PDI） |
| 0x0F18 | General Purpose Inputs | gpi[15:0]：通用输入 |
| User RAM / Process Data RAM |  |  |
| 0x0F80 | User RAM | ram[127:0]：用户 RAM（128 字节） |
| 0x1000 | Process Data RAM | ram[7:0]（×8KB）：过程数据 RAM（ET1100=8KB；仅在 EEPROM 正确加载后 0x0110[0]=1 可访问） |

