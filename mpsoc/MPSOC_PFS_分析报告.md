# MPSOC_PFS.xlsx 分析报告

> 分析日期：2026-08-09 | 文件来源：`/Users/ai-work/ai-dv/0-PRJ/mpsoc/MPSOC_PFS.xlsx`

---

## 一、文件概览

| 项目 | 数值 |
|------|------|
| 工作表数 | 17 |
| 嵌入图片数 | 27 |
| 芯片封装 | BGA196 (14×14mm) |
| 文档版本 | Revision 0.9.0 (2026-06-27) |

**工作表列表**：Revison Log、system reg、power、PN IPCore、base address、DMA、IP Core List、gpio、Package、BootROM、SecureIP、schedule、sram、irq、freq、Use Case、bug

---

## 二、系统架构分析

### 2.1 芯片整体定位

根据 `Use Case` 工作表和 `system reg` 内容分析，MPSOC 是一颗面向工业以太网的**多协议从站芯片**，核心用例为：

> **"EtherCAT Slave to EtherCAT Backplane"**（EtherCAT 从站到 EtherCAT 背板桥接）

关键双协议支持：
- **EtherCAT**：双 ESC IP（`ecat0` 外部通信，`ecat1` 背板同步）
- **PROFINET**：PN IP Core 集成（可通过 System Register 切换 `1: ethercat; 0: profinet`）

### 2.2 处理器核心

- **双 RISC-V E906 核心**：
  - Core 0：运行 BootROM、主控逻辑
  - Core 1：辅助处理、调试 UART
- 各核独立 IAHB/DAHB SRAM：各 16KB
- SOC 共享内存：64KB
- Boot ROM：16KB（支持 SPI Flash / UART 固件加载器 / 密钥编程三种启动模式）

### 2.3 时钟频率

| 模块 | 频率 (MHz) |
|------|-----------|
| ESC (EtherCAT) | 400 |
| PN Switch | 125 |
| RISC-V 核心 | 375 |

### 2.4 图像信息：系统架构图

`Use Case_img1.png`（1480×1000px，61.7KB）位于 Use Case 工作表，推断为 **EtherCAT Slave ↔ EtherCAT Backplane 系统级用例框图**，展示了芯片在网络拓扑中的位置。

---

## 三、System Register（系统寄存器）详细分析

> `system reg` 工作表是文档中内容最丰富的部分，包含 22 张图片。

### 3.1 基地址映射

| 模块 | 基地址 | 用途 |
|------|--------|------|
| ecat0 | `0x44c80000` | 外部 EtherCAT 通信 |
| ecat1 | `0x44c00000` | 背板 SYNC 同步 |
| system reg | `0x40017000` | 系统控制寄存器 |
| security | `0x40012000` | 安全控制 |

### 3.2 寄存器详细清单

#### 3.2.1 系统配置寄存器组（offset 0x00 起始）

| Offset | 寄存器名 | 关键位域 |
|--------|---------|---------|
| `0x00` | **System Config** | `ext_base_addr[31:16]`：UC/SPI 映射基地址高16位；`pmemos driver[15:14]`：外部存储驱动；`pmembs cfg[13:6]`：ODT/PE/PS/ST/IEN/PD 配置；`ethercat link polarity[5]`；`sync time esc mode[4:3]`：ESC同步模式选择（LVDS/EBUS/MII/GMAC）；`esc_latch_in[2]`；`esc1 verify[1]`；`ethercat/profinet 选择[0]` |
| `0x04` | **PDI Config** | 默认值 `32'h40004403`（SPI模式）或 `32'h2002CC00`（UC模式） |
| `0x08` | **LVDS Config** | `pn_reset[31]`、`ecat1_reset[30]`、`ecat0_reset[29]`、`gpio_config[28]`（32pin GPIO/UC IF/SPI IF）、`ecat_pll_lock[27]`、`ecat_pll_n[26:23]`、`ecat_pll_m[22:16]`、`ecat_pll_od[15:14]`、`ecat_pll_pdrst[13]`、`ecat_pll_bypass[12]`、`esc_prom_size[11:10]`、`lvds_txdrv[9:6]`、`lvcmos_schmitt_en[5]`、`LVDS_vreff_sel[4:3]`、`LVDS_RT_CAL[2:1]`、`LVDS_RT_EN[0]` |

#### 3.2.2 IRT 同步与 PLL 配置

| Offset | 寄存器名 | 关键位域 |
|--------|---------|---------|
| `0x0C` | **IRT Sync Timestamp** | 同步工作时钟的时间戳（只读） |
| `0x10` | **PN Cycle** | `counter[31:16]`：PROFINET 周期计数器；`timestamp[15:0]`：周期时间戳 |
| `0x14` | **CPU PLL Config** | `cpu_pll_lock[31]`、`cpu_pll_n[30:27]`、`cpu_pll_m[26:20]`、`cpu_pll_od[19:18]`、`cpu_pll_pdrst[17]`、`cpu_pll_bypass[16]`；`pn_pll_lock[15]`、`pn_pll_n[14:11]`、`pn_pll_m[10:7]`、`pn_pll_od[3:2]`、`pn_pll_pdrst[1]`、`pn_pll_bypass[0]` |

#### 3.2.3 Core ID 与启动控制

| Offset | 寄存器名 | 关键位域 |
|--------|---------|---------|
| `0x18` | **Core ID** | `HW Vendor ID[31:24]`、`HW Device ID[23:8]`、`HW Version[7:4]`、`Fix Version[1:0]` |
| `0x1C` | **ECAT PDI Clock** | `PDI/CORE 选择[1]`；时钟配置 `2'b00:25MHz, 01:50MHz, 10:100MHz, 11:125MHz`（默认50MHz） |
| `0x20` | **Security Control** | `JTAG Enable[0]`：JTAG 调试开关 |
| `0x24` | **Boot Control** | `Bypass Secure Boot[3]`、`host if mode[2]`、`boot mode[1:0]`（上电锁存） |
| `0x28` | **Reset Control** | `bypass reset control[1]`：写1使能复位控制；`reset whole system[0]`：写0全系统复位 |

#### 3.2.4 ECAT1 配置

| Offset | 寄存器名 | 内容 |
|--------|---------|------|
| `0x2C` | **ECAT1 Config** | 多芯片内部寄存器映射：`142:11-8[25:22]`、`142:6[21]`、`142:3-1[20:18]`、`152:1-0[17:16]`、`151:7-0[15:8]`、`150:4-0[7:3]`、`141:3[2]`、`141:2[1]`、`141:0[0]` |

#### 3.2.5 比较器与事件控制

| Offset | 寄存器名 | 功能 |
|--------|---------|------|
| `0x7C0` | **Cycle Count Mask** | 比较器循环掩码 |
| `0x7C4` | **COMPA** | 比较值 A |
| `0x7C8` | **COMPB** | 比较值 B |
| `0x7CC` | **COMPC** | 比较值 C |
| `0x7D0` | **COMPD** | 比较值 D |
| `0x7D4` | **PN_IP_EVENT_CTRL** | 4通道事件控制：使能、极性、脉冲宽度（1+n μs） |

#### 3.2.6 软中断

| Offset | 寄存器名 | 功能 |
|--------|---------|------|
| `0x74` | **CORE0 SW_INT** | Core 0 软中断触发（SW_INT1/0） |
| `0x78` | **CORE1 SW_INT** | Core 1 软中断触发（SW_INT1/0） |

#### 3.2.7 外设时钟分频器（TBD）

- Offset：待定
- 功能：外设时钟分频控制

### 3.3 图像信息：寄存器位域图

`system reg` 工作表中的 22 张图片按功能分组：

| 图片编号 | 尺寸 | 推定内容 | 所在行 |
|---------|------|---------|--------|
| img1/12 | 1815×711 | 系统配置寄存器顶层框图 | row 7-10 |
| img2/13 | 1479×486 | LVDS/PLL 配置位域图 | row 5-8 |
| img3/14 | 549×408 | 小型配置示意图（33色） | row 28-31 |
| img4/15 | 1260×120 | 时序波形/状态机 | row 28-31 |
| img5/16 | 1260×299 | 寄存器布局表 | row 33-36 |
| img6/17 | 1269×201 | 时序波形图 | row 42-45 |
| img7/18 | 1248×114 | 时序横条图 | row 49-52 |
| img8/19 | 1254×1085 | **大型架构框图**（ECAT0子系统） | row 29-32 |
| img9/20 | 1260×1047 | 详细寄存器映射表（白底） | row 28-31 |
| img10/21 | 1160×201 | 时序波形/事件图 | row 28-31 |
| img11/22 | 1005×921 | **信号连接详图**（ECAT1子系统） | row 33-36 |

**重要发现**：图片成对出现（前半部分 vs 后半部分），对应两个 EtherCAT 子系统的独立配置（ecat0 和 ecat1）。

---

## 四、GPIO 复用矩阵分析

> `gpio` 工作表描述了 48 个引脚的复用功能。

### 4.1 功能模式

每个引脚可配置为以下模式之一（由 system reg `gpio_config[28]` 全局选择）：

| 模式 | 编码 | 说明 |
|------|------|------|
| GPIO | `2'h0` | 通用 IO |
| UC IF | `2'h1` | 微控制器接口 |
| SPI | `2'h2` | SPI 从机接口（默认） |

### 4.2 端口分配

#### Port A（32位：b_pad_gpio_porta[31:0]）

| 引脚 | GPIO | UC 模式 | 备注 |
|------|------|---------|------|
| 0-31 | gpioA | `uc_busy`, `uc_cs`, `uc_wr`, `uc_data_en`, `uc_irq`, `uc_addr[14:0]`, `uc_data[10:0]` | 支持中断输入/输出、I2C |

#### Port B（16位：b_pad_gpio_portb[15:0]）

| 引脚 | GPIO | UC 模式 | SPI 模式 | LED (PN/ECAT) |
|------|------|---------|---------|---------------|
| 32-41 | gpioB | `uc_data[15:11]`, `spi_clk/sel/di/do/irq` | 同UC | `i2c_clk/data` |
| 42-47 | gpioB | `error`, `maintant`, `sync`, `device_blink`, `error`, `op` | `error0/1`, `linkact0/1`, `run`, `op?` | 复用为工业LED指示灯 |

### 4.3 专用引脚（独立引出）

| 功能 | 说明 |
|------|------|
| `uart0` / Core1 | Debug 串口 |
| `uart1` / Core0 | Boot ROM 串口 |
| `boot mode[1:0]` | 上电锁存：`00`=SPI, `01`=UART FW Loader, `10`=Program Key, `11`=保留 |
| `host if mode` | 上电锁存：`0`=UC, `1`=SPI |
| `Bypass Secure Boot` | 隐藏引脚（内部下拉），Demo版本封装引出 |
| `sync_out[3:0]` | PN_SYNC[A:D] ↔ ECAT sync[0:1]_[0:1] |

### 4.4 图像信息

| 图片 | 尺寸 | 推定内容 |
|------|------|---------|
| gpio_img1 | 982×624 | GPIO 引脚复用配置表（白底，27KB） |
| gpio_img2 | 1852×866 | GPIO 完整 Pin Mux 矩阵图（白底，105KB） |

---

## 五、中断系统分析

> `irq` 工作表列出中断向量，标注 **@牟宁 TODO: 补全并整理**。

### 5.1 中断源列表

| 中断 | 状态 | 说明 |
|------|------|------|
| PN_IRQA | TODO | PROFINET 中断 A |
| PN_IRQB | TODO | PROFINET 中断 B |
| PN_IRQC | TODO | PROFINET 中断 C |
| PN_IRQD | TODO | PROFINET 中断 D |
| EXTERNAL_INT0/GPIO | TODO | 外部中断0/GPIO |
| EXTERNAL_INT1/GPIO | TODO | 外部中断1/GPIO |
| ESC0_IRQ | TODO | EtherCAT 0 中断 |
| ESC0_SYNC0 | TODO | EtherCAT 0 同步0 |
| ESC0_SYNC1 | TODO | EtherCAT 0 同步1 |
| ESC1_IRQ | TODO | EtherCAT 1 中断 |
| ESC1_SYNC0 | TODO | EtherCAT 1 同步0 |
| ESC1_SYNC1 | TODO | EtherCAT 1 同步1 |
| PN_INS_CONTROL_IRQ | 未标注 | PROFINET 指令控制中断 |
| PN_ACYCLICP0_IRQ | 未标注 | PROFINET 非周期通道0中断 |
| PN_ACYCLICP1_IRQ | 未标注 | PROFINET 非周期通道1中断 |

> **注意**：ESC中断尚未连接（标注 "esc中断还没有接上"）。

### 5.2 图像信息

| 图片 | 尺寸 | 推定内容 |
|------|------|---------|
| irq_img1 | 1242×48 | 中断向量横条图（极宽、极矮，推定中断路由/优先级表头） |

---

## 六、DMA 与数据流

> `DMA` 工作表描述 4 个 DMA 通道。

| 通道 | 源 | 目的 | 备注 |
|------|-----|------|------|
| Channel 0 | QSPI | SDRAM | Flash→内存 |
| Channel 1 | SDRAM | SDRAM | 内存拷贝 |
| Channel 2 | SecureIP | SDRAM | 安全IP→内存（待确认） |
| Channel 3 | SDRAM | SecureIP | 内存→安全IP（待确认） |

---

## 七、SRAM 资源分配

| 存储区域 | 容量 |
|---------|------|
| e906-0 IAHB Mem | 16KB |
| e906-0 DAHB Mem | 16KB |
| e906-1 IAHB Mem | 16KB |
| e906-1 DAHB Mem | 16KB |
| SOC Mem | 64KB |
| Boot ROM | 16KB |
| OTP (用户) | 96bit |
| Version OTP (固定) | 96bit |

---

## 八、电源与时钟管理

### 8.1 电源域控制

| 模块 | 控制方式 |
|------|---------|
| PN | system reg[0]=1 关闭时钟 |
| ESC0 | system reg[0]=0 关闭时钟 |

### 8.2 图像信息

| 图片 | 尺寸 | 推定内容 |
|------|------|---------|
| freq_img1 | 1346×738 | 时钟树/频率分配架构图（白底，38KB） |

---

## 九、安全机制

| 功能 | 说明 |
|------|------|
| Secure Boot | 支持，可通过 Bypass Secure Boot 引脚跳过 |
| JTAG 保护 | system reg `0x20[0]` 控制 JTAG 使能/禁用 |
| SecureIP v1.2.0 | 修复多次操作卡死 Bug |
| 密钥编程 | boot mode=`10` 进入 Program Key 模式 |

---

## 十、项目进度 (schedule)

| 任务 | 计划时间 |
|------|---------|
| BootROM | 9月中旬 |
| MAC | 9月中旬 |
| ESC 主站移植 | 2周完成 |
| 新验证板 | **8月20日左右** |
| PN FPGA 协议栈验证 | 10月底 |
| All Feature Verify | 10月底 |
| SDRAM 读写冲突验证 | 待定 |
| RISC-V 间验证 | 待定 |

---

## 十一、IP Core 与外部接口

### 11.1 PN IPCore（PROFINET）

- Consumer Process RAM：建议扩至 4KB（原因：最大4个AR，每个对应1KB）
- Provider Process RAM：建议扩至 4KB

### 11.2 已知 Bug

| 编号 | 描述 | 状态 | 备注 |
|------|------|------|------|
| 1 | nanosec 无法立即读取 | Going | 等待 synq7100 PCB |

### 11.3 图像信息

`system reg` 中的 8 张大型图片（img8/19 各539KB，img9/20 各451KB，img11/22 各294KB）推断为：
- **ECAT0/ECAT1 子系统完整架构图** — 展示 ESC IP 的内部结构、信号连接和数据通路
- **寄存器详细映射表** — 完整的寄存器位域映射关系图
- **PN/ESC 信号互联图** — 展示两个 EtherCAT 控制器之间的同步信号连接

---

## 十二、关键待办事项（TODO汇总）

| 序号 | 内容 | 负责人 |
|------|------|--------|
| 1 | LVDS/PDI 配置寄存器字段完善 | — |
| 2 | Core ID 寄存器定义完善 | — |
| 3 | ECAT PDI Clock 寄存器定义 | — |
| 4 | 中断列表补全并整理 | @牟宁 |
| 5 | ESC 中断连接 | — |
| 6 | Boot Sequence 定义 | — |
| 7 | GPIO POR Reset 加内部 Pull-Up | — |
| 8 | 外设时钟分频器寄存器 | TBD |
| 9 | Consumer/Provider Process RAM 扩容 | — |

---

## 十三、总结

MPSOC 是一颗基于**双核 RISC-V E906** 的工业以太网通信芯片，核心特性：

1. **双协议支持**：EtherCAT + PROFINET，可通过寄存器位切换
2. **双 ESC 架构**：ecat0 用于外部通信，ecat1 用于背板同步 — 这是 "EtherCAT Slave to Backplane" 用例的基础
3. **灵活的 GPIO 复用**：48引脚支持 GPIO/UC IF/SPI 三种模式，集成工业 LED 指示灯
4. **完整的时钟架构**：ESC@400MHz、RISC-V@375MHz、PN Switch@125MHz
5. **安全启动**：支持 Secure Boot + JTAG 保护 + 密钥编程
6. **当前阶段**：FPGA 验证阶段，验证板预计 8月20日到位，全功能验证目标10月底
