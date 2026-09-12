# mpsoc 测试 case 清单(依据飞书「验证测试列表」72 项)

> 生成时间 2026-09-13。来源:飞书知识空间 Upgrade → 4、mpsoc → 验证文档 → 验证测试列表
> (51 正式 + 21 补充 = 72 项)。每个测试项对应一个 `.sv` case;软件类 case 额外配套 C 程序 + Makefile。

## 目录结构

```
testcase/
├── cpu/   (计算 6)
├── bus/   (通路 5)
├── mem/   (存储 9)
├── dma/   (数据搬运 6)
├── net/   (工业以太网 10)
├── per/   (通用外设 25)
├── sec/   (安全 5)
├── sys/   (系统 6)
└── sequence_lib/ sw/  (公共虚拟序列库 / E906 软件编译环境)
```

## 命名规则

- 单外设/多外设 case:`<subsys>_<nnn>_<slug>_test.sv`,类名同名;sequence 类 `<subsys>_<nnn>_<slug>_sequence`。
- 软件 case:`<subsys>_<nnn>_<slug>/` 子目录,内含 `<...>_test.sv` + `<c_func>.c` + `Makefile`。
- 优先级:高 / 中。

## 清单

### 计算(TST-CPU,6 项)

| 编号 | 测试项 | 文件 | UVC 映射 | 优先级 |
|------|--------|------|----------|:---:|
| TST-CPU-001 | 双核启动与 BOOT ROM 引导 | `cpu/cpu_001_dual_core_boot_test.sv` | SW/dual_core_boot | 高 |
| TST-CPU-002 | 核间中断通信 | `cpu/cpu_002_ipi_test.sv` | SW/core_ipi | 高 |
| TST-CPU-003 | 菊花链级联通信 | `cpu/cpu_003_daisy_chain_test.sv` | SW/daisy_chain | 中 |
| TST-CPU-004 | 私有 TCM 读写 | `cpu/cpu_004_tcm_rw_test.sv` | SW/tcm_march | 高 |
| TST-CPU-005 | JTAG 调试 | `cpu/cpu_005_jtag_debug_test.sv` | jtag | 中 |
| TST-CPU-006 | 双核并发访问 AHB | `cpu/cpu_006_ahb_concurrent_test.sv` | SW/ahb_concurrent | 高 |

### 通路(TST-BUS,5 项)

| 编号 | 测试项 | 文件 | UVC 映射 | 优先级 |
|------|--------|------|----------|:---:|
| TST-BUS-001 | AHB 总线带宽 | `bus/bus_001_ahb_bw_test.sv` | SW/ahb_bw | 中 |
| TST-BUS-002 | APB 桥接读写 | `bus/bus_002_apb_rw_test.sv` | sysctrl | 高 |
| TST-BUS-003 | 总线错误处理 | `bus/bus_003_bus_error_test.sv` | sysctrl | 中 |
| TST-BUS-004 | 高低速通路并发 | `bus/bus_004_speed_concurrent_test.sv` | multi(sysctrl,esc) | 中 |
| TST-BUS-005 | 存储地址映射 | `bus/bus_005_addr_map_test.sv` | sysctrl | 高 |

### 存储(TST-MEM,9 项)

| 编号 | 测试项 | 文件 | UVC 映射 | 优先级 |
|------|--------|------|----------|:---:|
| TST-MEM-001 | SRAM(64K) 读写 | `mem/mem_001_sram_rw_test.sv` | SW/sram_march | 高 |
| TST-MEM-002 | SDRAM 读写与刷新 | `mem/mem_002_sdram_rw_refresh_test.sv` | sdram | 高 |
| TST-MEM-003 | BOOT ROM 启动流程 | `mem/mem_003_boot_rom_test.sv` | SW/boot_rom_boot | 高 |
| TST-MEM-004 | QSPI FLASH 读写/XIP | `mem/mem_004_qspi_flash_rw_xip_test.sv` | qspi | 高 |
| TST-MEM-005 | TCM 与总线一致性 | `mem/mem_005_tcm_coherence_test.sv` | SW/tcm_coherence | 中 |
| TST-MEM-006 | QSPI 间接传输与 DMA | `mem/mem_006_qspi_indirect_dma_test.sv` | multi(qspi,dma) | 中 |
| TST-MEM-007 | QSPI DDR/DTR 与写保护 | `mem/mem_007_qspi_ddr_dtr_wp_test.sv` | qspi | 中 |
| TST-MEM-008 | QSPI STIG 命令与器件枚举 | `mem/mem_008_qspi_stig_test.sv` | qspi | 中 |
| TST-MEM-009 | SDRAM 时序配置与静态存储 | `mem/mem_009_sdram_timing_test.sv` | sdram | 中 |

### 数据搬运(TST-DMA,6 项)

| 编号 | 测试项 | 文件 | UVC 映射 | 优先级 |
|------|--------|------|----------|:---:|
| TST-DMA-001 | 内存到内存搬运 | `dma/dma_001_mem2mem_test.sv` | dma | 高 |
| TST-DMA-002 | 外设到内存搬运 | `dma/dma_002_periph2mem_test.sv` | multi(dma,uart) | 高 |
| TST-DMA-003 | DMA 完成/错误中断 | `dma/dma_003_done_err_intr_test.sv` | dma | 中 |
| TST-DMA-004 | DMA 与 CPU 竞争 | `dma/dma_004_dma_cpu_race_test.sv` | SW/dma_cpu_race | 中 |
| TST-DMA-005 | DMAC 链表(LLP)传输 | `dma/dma_005_llp_test.sv` | dma | 中 |
| TST-DMA-006 | DMAC 通道优先级与错误中止 | `dma/dma_006_prio_err_abort_test.sv` | dma | 中 |

### 工业以太网(TST-NET,10 项)

| 编号 | 测试项 | 文件 | UVC 映射 | 优先级 |
|------|--------|------|----------|:---:|
| TST-NET-001 | PROFINET IRT 实时通信 | `net/net_001_pn_irt_test.sv` | pn_irt | 高 |
| TST-NET-002 | EtherCAT 从站通信 | `net/net_002_esc0_pdo_sdo_test.sv` | esc | 高 |
| TST-NET-003 | EtherCAT 双口环网 | `net/net_003_esc_ring_test.sv` | esc | 高 |
| TST-NET-004 | 线缆冗余切换 | `net/net_004_cable_redundant_test.sv` | esc | 高 |
| TST-NET-005 | 千兆以太网吞吐 | `net/net_005_gmac_throughput_test.sv` | gmac | 高 |
| TST-NET-006 | MUX 协议切换 | `net/net_006_mux_switch_test.sv` | switch | 中 |
| TST-NET-007 | ROUTE 路由切换 | `net/net_007_route_switch_test.sv` | switch | 中 |
| TST-NET-008 | ESC1 LVDS 模式 | `net/net_008_esc1_lvds_test.sv` | esc | 中 |
| TST-NET-009 | 四路 PHY 独立隔离 | `net/net_009_phy_isolation_test.sv` | miiphy | 中 |
| TST-NET-010 | 网络错误注入 | `net/net_010_err_inject_test.sv` | esc | 中 |

### 通用外设(TST-PER,25 项)

| 编号 | 测试项 | 文件 | UVC 映射 | 优先级 |
|------|--------|------|----------|:---:|
| TST-PER-001 | GPIO 输入输出 | `per/per_001_gpio_io_test.sv` | gpio | 高 |
| TST-PER-002 | GPIO 中断 | `per/per_002_gpio_intr_test.sv` | gpio | 中 |
| TST-PER-003 | UART0/1/2 收发 | `per/per_003_uart_loopback_test.sv` | uart | 高 |
| TST-PER-004 | UART 流控与 DMA | `per/per_004_uart_flow_dma_test.sv` | multi(uart,dma) | 中 |
| TST-PER-005 | I2C 通信 | `per/per_005_i2c_comm_test.sv` | i2c | 中 |
| TST-PER-006 | SPI Master 通信 | `per/per_006_spi_master_test.sv` | spi | 高 |
| TST-PER-007 | SPI Slave 通信 | `per/per_007_spi_slave_test.sv` | spi | 中 |
| TST-PER-008 | 定时器 TIM0/TIM1 | `per/per_008_tim_pwm_test.sv` | tim | 高 |
| TST-PER-009 | 看门狗 WDT | `per/per_009_wdt_timeout_test.sv` | wdt | 高 |
| TST-PER-010 | HOST 接口通信 | `per/per_010_uc_slave_test.sv` | uc | 中 |
| TST-PER-011 | GPIO 去抖(debounce) | `per/per_011_gpio_debounce_test.sv` | gpio | 中 |
| TST-PER-012 | GPIO 双边沿/电平中断类型 | `per/per_012_gpio_edge_intr_test.sv` | gpio | 中 |
| TST-PER-013 | GPIO 外部端口与同步电平 | `per/per_013_gpio_port_sync_test.sv` | gpio | 中 |
| TST-PER-014 | UART 分数波特率 | `per/per_014_uart_fractional_baud_test.sv` | uart | 中 |
| TST-PER-015 | UART 16550 兼容与 FIFO 阈值 | `per/per_015_uart_16550_fifo_test.sv` | uart | 中 |
| TST-PER-016 | UART IrDA/RS485/自动流控 | `per/per_016_uart_irda_rs485_test.sv` | uart | 中 |
| TST-PER-017 | UART 回环与 Shadow 寄存器 | `per/per_017_uart_loopback_shadow_test.sv` | uart | 中 |
| TST-PER-018 | I2C 7/10 位寻址 | `per/per_018_i2c_7_10bit_test.sv` | i2c | 中 |
| TST-PER-019 | I2C 高速模式与时钟同步 | `per/per_019_i2c_hs_sync_test.sv` | i2c | 中 |
| TST-PER-020 | I2C SMBus(ARP/UDID/超时) | `per/per_020_i2c_smbus_test.sv` | i2c | 中 |
| TST-PER-021 | I2C 总线清除与尖峰抑制 | `per/per_021_i2c_bus_clear_test.sv` | i2c | 中 |
| TST-PER-022 | SPI Dual/Quad/Octal 与 DDR | `per/per_022_spi_dual_quad_ddr_test.sv` | spi | 中 |
| TST-PER-023 | SPI Microwire 与 RX 采样延迟 | `per/per_023_spi_microwire_test.sv` | spi | 中 |
| TST-PER-024 | TIM 计数模式与多定时器 | `per/per_024_tim_count_mode_test.sv` | tim | 中 |
| TST-PER-025 | WDT 超时动作与保护级别 | `per/per_025_wdt_prot_level_test.sv` | wdt | 中 |

### 安全(TST-SEC,5 项)

| 编号 | 测试项 | 文件 | UVC 映射 | 优先级 |
|------|--------|------|----------|:---:|
| TST-SEC-001 | OTP 一次性写入 | `sec/sec_001_otp_write_test.sv` | security | 高 |
| TST-SEC-002 | OTP 内容读取 | `sec/sec_002_otp_read_test.sv` | security | 高 |
| TST-SEC-003 | 安全启动链 | `sec/sec_003_secure_boot_test.sv` | security | 高 |
| TST-SEC-004 | 固件篡改检测 | `sec/sec_004_fw_tamper_test.sv` | security | 高 |
| TST-SEC-005 | 调试口安全 | `sec/sec_005_jtag_secure_test.sv` | security | 中 |

### 系统(TST-SYS,6 项)

| 编号 | 测试项 | 文件 | UVC 映射 | 优先级 |
|------|--------|------|----------|:---:|
| TST-SYS-001 | 上电/复位流程 | `sys/sys_001_power_reset_test.sv` | sysctrl | 高 |
| TST-SYS-002 | 时钟与系统控制 | `sys/sys_002_clk_ctrl_test.sv` | sysctrl | 高 |
| TST-SYS-003 | 外设低功耗 | `sys/sys_003_low_power_test.sv` | sysctrl | 中 |
| TST-SYS-004 | 异常与恢复 | `sys/sys_004_exception_test.sv` | sysctrl | 中 |
| TST-SYS-005 | 功能安全联动 | `sys/sys_005_func_safety_test.sv` | multi(wdt,sysctrl) | 中 |
| TST-SYS-006 | 长期稳定性 | `sys/sys_006_stability_test.sv` | multi(sysctrl,gpio,uart,dma) | 高 |

**合计:72 项**(覆盖 8 大类)。

## 接入编译(待 RTL 就绪)

当前 DUT 为 pad 级黑盒、driver/scoreboard 为桩,72 个 case 暂未 include 进 `mpsoc_TestTop.svh`。
RTL 就绪后接入三步(详见 `mpsoc_TestTop.svh` 尾部注释块):

1. `filelist/tb.f` 追加 `+incdir+${VERIFY_HOME}/testcase/<subsys>`(8 个目录);
2. `mpsoc_TestTop.svh` 追加 `` `include "<case>.sv" ``;
3. 回归发现:`testplan/<group>/test.json` 加 `"<case>": {"uvm_testname": "<case>_test"}`。

> 注:软件类 case 的 C 程序为可编译骨架(本地无 RISC-V 工具链,未实测),
> 复用 `testcase/sw/` 编译环境,`source sw/setup/setup_env.sh` 后 `make` 生成 `.elf/.bin/inst.pat/data.pat`。
