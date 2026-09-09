MPSOC_PFS_关键特性
这份文档详细描述了一款面向工业以太网应用的 MPSOC 芯片架构，核心集成了双核 RISC-V 处理器与 EtherCAT、PROFINET 等工业通信协议子系统。
以下是文档内容的思维导图：
以下是该芯片架构的详细总结：
🧠 一、核心处理单元
双核架构：集成两颗 RISC-V E906 核心，Core 0 负责主控与 BootROM，Core 1 作为辅助处理单元。
运行频率：CPU 主频为 375MHz，由 CPU PLL 提供时钟。
总线接口：每颗核心配备独立的 16KB 指令 AHB (I-AHB) 和数据 AHB (D-AHB) 总线。
调试支持：支持 JTAG 调试，且可通过寄存器禁用。
💾 二、存储与总线系统
片上存储：包含 64KB SOC 共享内存和 16KB Boot ROM。
外部存储：支持外部 SDRAM 和 SPI Flash，通过专用控制器连接。
总线互联：采用 AHB 总线矩阵连接 CPU、存储、DMA 及所有外设。
DMA 控制器：4 通道 DMA，支持 QSPI 与 SDRAM 间、SDRAM 内部及 SecureIP 与 SDRAM 间的数据搬移。
🌐 三、工业以太网子系统
EtherCAT 双控制器：
ECAT0：用于外部通信，基地址 0x44c80000。
ECAT1：用于背板同步，基地址 0x44c00000。
均支持 MII/LVDS 接口及 Sync0/1 同步信号。
PROFINET 控制器：
版本 v1.2.0，包含 4KB 消费者与提供者 RAM。
支持非周期通道和周期数据同步。
协议选择：通过 system reg[0] 寄存器选择 EtherCAT 或 PROFINET 模式。
⏱️ 四、时钟与安全子系统
时钟系统：
外部晶振输入，三路独立 PLL。
CPU PLL：375MHz，ESC PLL：400MHz，PN PLL：125MHz。
安全机制：
支持 Secure Boot，可通过引脚旁路。
集成 SecureIP (v1.2.0)，支持密钥编程和 JTAG 禁用。
96bit 用户 OTP 和 96bit 版本 OTP。
🔌 五、外设与封装
GPIO 矩阵：48 引脚，Port A (32 位) 和 Port B (16 位)，支持复用功能。
工业 LED：支持 error/maint/sync/blink/run/op 状态指示。
通信接口：2 路 UART、I2C、16 位 UC 接口、SPI Slave 接口。
系统控制：包含启动控制、复位控制、电源控制和中断控制器。
封装形式：BGA196，14×14mm。
📊 六、关键数据流与启动
数据路径：
固件加载：SPI Flash → QSPI → DMA CH0 → SDRAM
实时数据：ECAT MII → ESC IP → AHB → SDRAM (400MHz 时钟域)
同步信号：ECAT1 Sync → IRT Timestamp → Sync Out Pins
启动流程：
支持 SPI、UART、密钥编程等多种启动模式。
安全启动链：SPI Flash → SecureIP → OTP → Core 0 BootROM。
Core 0 启动后控制 Core 1 启动及外设初始化。
该 MPSOC 芯片通过异构多核架构与专用工业以太网硬件加速，实现了高实时性通信与安全启动的深度融合，适用于对确定性和可靠性要求极高的工业自动化场景。
