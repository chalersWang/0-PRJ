# MPSoC 验证环境架构文档

> MPSoC UVM Verification Environment
>
> 19 外设 UVC | 双核 RISC-V (kcore0/kcore1) | 99 测试用例 | SystemVerilog | UVM 1.2 | VCS/Verdi
>
> 日期: 2026-10-25

---

## 1. 概述

本验证环境用于验证 **MPSoC (Multi-Processor System-on-Chip)**，包含：

- **19 个外设 UVC**：系统控制、JTAG、UART、GPIO、QSPI、Switch、MII PHY、eFuse、I2C、SPI、WDT、TIM、uC、SDRAM、Security、DMA、PN-IRT、ESC、GMAC
- **双核 RISC-V 子系统**：kcore0 / kcore1（E906），支持独立编译 C 程序 + 后门加载镜像
- **99 个测试用例**：10 个子系统（bus/cpu/dma/mem/net/per/register/sec/sys/vip）

环境基于标准 UVM 分层架构，支持覆盖率驱动验证（CDV）。

### 验证目标

- 各外设接口协议合规性
- 寄存器读写正确性（前门/后门访问）
- 双核启动、核间通信（IPI/菊花链）、并发访问
- 多 UVC 协同场景（跨外设数据流）
- 中断路由与处理、功耗模式切换
- 错误注入与异常恢复

---

## 2. 目录结构

```
mpsoc/
├── ARCHITECTURE.md           ← 本架构文档
├── Makefile                  ← 顶层编译入口 (make comp/sim TC=<test>)
├── SourceMe                  ← 环境变量设置脚本
├── synopsys_sim.setup        ← Synopsys 仿真配置
│
├── tb/                       ← 测试平台顶层
│   ├── tb_top.sv             ← UVM 顶层模块 + kcore AHB force 接线
│   ├── crg_gen.sv            ← 时钟复位生成
│   ├── dutinst.sv            ← DUT 实例化
│   ├── uvmconfigdb.sv        ← UVM Config DB 接口注册
│   ├── dumpctrl.sv           ← 波形 dump 控制
│   └── filelist.f            ← tb 编译文件列表
│
├── testcase/                 ← 测试用例层
│   ├── mpsoc_TestTop.svh     ← TestTop Package (include 各 TestTop_*.svh)
│   ├── mpsoc_base_test.sv    ← 基础测试类 (后门读写 + pat 加载)
│   ├── mpsoc_demo_test.sv    ← 示例测试
│   ├── sequence_lib/         ← 序列库
│   ├── filelist.f            ← testcase 二级目录 +incdir
│   ├── bus/    TestTop_bus.svh      (5 case)
│   ├── cpu/    TestTop_cpu.svh      (9 case, 含 C 程序)
│   ├── dma/    TestTop_dma.svh      (6 case)
│   ├── mem/    TestTop_mem.svh      (9 case)
│   ├── net/    TestTop_net.svh      (10 case)
│   ├── per/    TestTop_per.svh      (25 case)
│   ├── register/TestTop_register.svh (13 case, 后门访问)
│   ├── sec/    TestTop_sec.svh      (5 case)
│   ├── sys/    TestTop_sys.svh      (6 case)
│   ├── vip/    TestTop_vip.svh      (11 case, Synopsys VIP)
│   └── sw/                     ← 软件编译环境 (C 程序双核编译)
│       ├── setup/              ← 工具链配置 (setup_env.sh)
│       ├── lib/                ← 编译规则 + 双核 crt0/linker + clib
│       │   ├── Makefile        ← 共享编译规则 (kcore0/kcore1)
│       │   ├── crt0_kcore0.s / crt0_kcore1.s   ← 双核启动代码
│       │   ├── linker_kcore0.lcf / linker_kcore1.lcf ← 双核链接脚本
│       │   ├── clib/           ← 最小 C 库
│       │   └── newlib_wrap/    ← newlib 封装
│       └── bin/Srec2vmem       ← srec→pat 转换器
│
├── env/                      ← 环境层
│   ├── mpsoc_EnvTop.svh      ← EnvTop Package
│   ├── mpsoc_env.sv          ← UVM env (19 Agent + Scoreboard)
│   ├── mpsoc_config.sv       ← 全局配置 (统一管理 19 UVC config)
│   ├── mpsoc_event.sv        ← 全局事件同步
│   ├── mpsoc_scoreboard.sv   ← 计分板 (uvm_analysis_imp 回调)
│   ├── mpsoc_virtual_sequencer.sv ← 虚拟 Sequencer (19 handles)
│   ├── mpsoc_function_coverage.sv  ← 功能覆盖率封装
│   └── filelist.f
│
├── uvc/                      ← UVC 组件层 (19 个外设 + VIP)
│   ├── sysctrl/ jtag/ uart/ gpio/ qspi/ switch/ miiphy/ efuse/
│   ├── i2c/ spi/ wdt/ tim/ uc/ sdram/ security/ dma/
│   ├── pn_irt/ esc/ gmac/
│   ├── VIP/                  ← Synopsys DesignWare VIP (svt_*)
│   └── filelist.f            ← 19 UVC 的 vif.sv + UvcTop.svh
│
├── addrmap/                  ← 地址映射层
│   ├── addressmap.v          ← 各模块基地址宏
│   ├── hierarchy.v           ← 层次路径宏 (HIER_* + UT_*_VIF + 双核内存层级)
│   ├── reg_*.v (12 个)       ← 各外设寄存器地址宏
│   └── filelist.f
│
├── regmodel/                 ← 寄存器模型层
│   ├── mpsoc_reg_block.sv    ← 顶层寄存器 Block
│   ├── mpsoc_reg_sequence.sv ← 寄存器访问 Sequence
│   ├── *_reg_block.sv (21 个)← 各外设寄存器 Block
│   ├── sysctrl_reg_adapter.sv← 寄存器 Adapter
│   └── filelist.f
│
├── sva/                      ← SVA 断言层
│   ├── mpsoc_vif.sv          ← 顶层 Virtual Interface
│   ├── ahb_master_if.sv      ← AHB 主机接口 (kcore 桥接)
│   ├── define_lib.v          ← 宏定义库
│   ├── code/                 ← SVA 断言代码
│   └── filelist.f
│
├── coverage/                 ← 覆盖率层
│   └── code/                 ← 8 个外设 function_coverage
│
├── filelist/                 ← 文件列表 (顶层)
│   ├── tb.f                  ← 引用各目录 filelist.f
│   ├── rtl.f / vip.f / cmodel.f / netlist.f / vhdl.f
│
├── cfg/                      ← 仿真配置 (comp_base/sim_base/assertion/...)
├── build/                    ← 编译产物 (build/<TC>/)
│   └── Makefile              ← VCS 编译脚本 (vhdlan/vlogan/vcs)
├── testplan/                 ← 测试计划 (T1~T7 组)
├── json/                     ← JSON 配置
└── reference/                ← 参考数据
```

---

## 3. 架构层次图

```
┌──────────────────────────────────────────────────────────────┐
│                      Build / Run                              │
│  make comp TC=<test> / make sim TC=<test> (VCS)              │
│  + 双核 C 程序: make kcore0/kcore1 (Xuantie GCC)             │
└──────────────────────────────────────────────────────────────┘
                              │
┌──────────────────────────────────────────────────────────────┐
│                       Test Layer                              │
│  mpsoc_TestTop Package                                        │
│  ├── mpsoc_base_test (后门读写 + pat 加载 + 19 UVC cfg)      │
│  ├── mpsoc_demo_test                                          │
│  └── TestTop_*.svh (10 个子系统 case list)                   │
└──────────────────────────────────────────────────────────────┘
                              │
┌──────────────────────────────────────────────────────────────┐
│                     Environment Layer                          │
│  mpsoc_EnvTop Package                                         │
│  ├── mpsoc_env          ← 19 Agent 容器 + Scoreboard         │
│  ├── mpsoc_config       ← 全局配置 (统一管理 19 UVC config)  │
│  ├── mpsoc_event        ← 全局事件同步                         │
│  ├── mpsoc_virtual_sequencer ← 19 UVC sequencer handles      │
│  └── mpsoc_scoreboard   ← uvm_analysis_imp 回调模式          │
└──────────────────────────────────────────────────────────────┘
                              │
   ┌──────────┬──────────┬───┴───┬──────────┬──────────┬──────────┬──────────┐
   ▼          ▼          ▼       ▼          ▼          ▼          ▼          ▼
┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐
│sysctrl│ │ jtag │ │ uart │ │ gpio │ │ qspi │ │switch│ │miiphy│ │efuse │
│ Agent │ │ Agent│ │ Agent│ │ Agent│ │ Agent│ │ Agent│ │ Agent│ │ Agent│
└──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘
   │   ... (其余 11 个: i2c/spi/wdt/tim/uc/sdram/security/dma/pn_irt/esc/gmac)
   └────────┴────────┴────────┴────────┴────────┴────────┴────────┘
                                    │
                    ┌───────────────┴───────────────┐
                    ▼                               ▼
          ┌─────────────────┐           ┌─────────────────────┐
          │   mpsoc_vif     │           │  mpsoc_scoreboard   │
          │  (19 子 vif)    │           │  (19 uvm_analysis_  │
          │                 │           │   imp callbacks)    │
          └───────┬─────────┘           └─────────────────────┘
                  ▼
          ┌───────────────┐
          │  DUT (MPSoC)  │
          │  kcore0/kcore1│
          └───────────────┘
```

---

## 4. 核心组件详解

### 4.1 测试平台顶层 (`tb/tb_top.sv`)

```systemverilog
module tb_top;
    import uvm_pkg::*;
    import mpsoc_TestTop::*;
    `include "crg_gen.sv"       // 时钟复位
    `include "uvmconfigdb.sv"   // vif → config_db
    `include "dutinst.sv"       // DUT 例化
    `include "dumpctrl.sv"      // 波形控制

    // kcore0/kcore1 AHB 主机端口 force 桥接
    force `UT_RVCORE.biU_pad_haddr = TopVif.ahb_m_vif.haddr;
    ...
endmodule
```

双核 AHB 主机端口通过 `force` 桥接到 TB 侧 `ahb_master_if`。

### 4.2 测试用例层

#### mpsoc_base_test — 基类

| Phase | 职责 |
|-------|------|
| `new` | 创建 mpsoc_config + mpsoc_event + env |
| `build_phase` | 获取 vif，config_db 下发 19 UVC config |
| `connect_phase` | config_db 下发 + RegModel 连接 |
| `run_phase` | 等待复位释放 |

**新增能力**（双核软件验证）：
- `backdoor_write_mem()` / `backdoor_read_mem()` — 后门读写 kcore IRAM/DRAM
- `load_pat_to_mem()` — 解析 pat 文件后门加载
- `load_kcore_pat(core, inst_pat, data_pat)` — 加载双核 inst.pat/data.pat

#### TestTop_*.svh — 子系统 case list 组织

每个 case 子系统一个 `TestTop_<sub>.svh`，内部 include 该子系统的 case：

```systemverilog
// testcase/register/TestTop_register.svh
`include "esc0_reg_backdoor/esc0_reg_backdoor_test.sv"
`include "sysctrl_reg_backdoor/sysctrl_reg_backdoor_test.sv"
...
```

`mpsoc_TestTop.svh` 只 include 10 个 TestTop_*.svh，层次清晰。

### 4.3 环境层

#### mpsoc_config — 全局配置容器

统一管理 19 个 UVC config + 全局仿真参数：

```systemverilog
class mpsoc_config extends uvm_object;
    // 全局仿真参数
    int drain_time = 100;  int max_quit_count = 0; ...
    // 19 个 UVC config（new 中统一例化）
    sysctrl_config sysctrl_cfg;  jtag_config jtag_cfg; ...
endclass
```

#### mpsoc_scoreboard — 计分板（uvm_analysis_imp 回调）

19 个 `uvm_analysis_imp_xxx` 回调，每个 `write_xxx()` 目前为占位桩（TODO），比对逻辑待实现。

### 4.4 UVC 层 — 19 个外设组件

| UVC | 接口 | 关键功能 |
|-----|------|----------|
| sysctrl | 系统控制总线 | 寄存器配置、时钟/复位控制、电源管理 |
| jtag | JTAG (IEEE 1149.1) | 调试访问、边界扫描 |
| uart | UART 串口 | 异步收发、波特率配置 |
| gpio | GPIO 并行 I/O | 输入/输出/双向、中断检测 |
| qspi | Quad-SPI | Flash 读写、XIP |
| switch | 交换矩阵 | 路由配置、端口连接 |
| miiphy | MII (Ethernet PHY) | MDIO 寄存器访问 |
| efuse | eFuse 控制器 | 熔丝编程/读取 |
| i2c | I2C (DW_apb_i2c) | 主从通信 |
| spi | SPI (DW_apb_ssi) | Master/Slave |
| wdt | 看门狗 (DW_apb_wdt) | 超时中断/复位 |
| tim | 定时器 (DW_apb_timers) | 定时中断、PWM、捕获 |
| uc | uC Slave 接口 | HOST 接口通信 |
| sdram | SDRAM/SRAM (DW_memctl) | 内存控制器读写/刷新 |
| security | Security/OTP | OTP 编程/读取 |
| dma | DMAC (DW_ahb_dmac) | 8 通道内存/外设搬运 |
| pn_irt | PROFINET IRT | IRT 实时同步 |
| esc | EtherCAT ESC0/ESC1 | MII 通信、Sync0/1 |
| gmac | 千兆以太网 GMAC | RGMII 收发 |

每个 UVC 标准结构：`UvcTop.svh / agent / driver / monitor / sequencer / sequence_lib / trans / config / vif`（sdram 特殊：`sdram_if.sv + sdram_pkg.sv` + 各 `*.svh`）。

---

## 5. 双核软件编译（kcore0/kcore1）

双核 RISC-V 子系统（E906）的软件测试，需要将 C 程序交叉编译成 `inst.pat`/`data.pat`，由 SV test 后门加载到各自 IRAM/DRAM 运行。

### 5.1 前置条件

- **Linux 服务器**（工具链是 Linux x86_64 静态程序，macOS 无法运行）
- **工具链路径**：`/home/edatools/Xuantie/gcc/Xuantie-900-gcc-elf-newlib-x86_64-V2.6.2/bin`（`riscv64-unknown-elf-*`）
- **转换工具**：`testcase/sw/bin/Srec2vmem`（Linux x86_64 静态可执行文件）

### 5.2 内存布局

| 核 | IRAM | DRAM | 链接脚本 | 启动代码 |
|----|------|------|---------|---------|
| kcore0 | 0x00000000 | 0x10000000 | linker_kcore0.lcf | crt0_kcore0.s |
| kcore1 | 0x20000000 | 0x30000000 | linker_kcore1.lcf | crt0_kcore1.s |

IRAM/DRAM 各 16KB（`mem_array[4095:0][31:0]`）。crt0 启动时读 `mhartid` 存入全局 `__core_id`，供 C 代码区分核。

### 5.3 编译命令

```bash
# 1. 配置工具链（SourceMe 已自动 source）
source testcase/sw/setup/setup_env.sh
# 或指定工具链路径：
source testcase/sw/setup/setup_env.sh /path/to/toolchain/bin

# 2. 进入 case 目录（每个 case 一个目录，内含 kcore0/kcore1 两份 C 源码）
cd testcase/cpu/hello_world

# 3. 编译（三选一）
make            # 编译双核 (kcore0 + kcore1)，默认目标
make kcore0     # 仅编译 CPU0，产物在 kcore0/
make kcore1     # 仅编译 CPU1，产物在 kcore1/

# 4. 指定 CPU 架构（默认 e906f）
make kcore0 CPU_ARCH_FLAG_0=e906f CPU_ARCH_FLAG_1=nodsp

# 5. 清理产物
make clean
```

**CPU 架构标志**：

| 变量 | 取值 | 含义 |
|------|------|------|
| `CPU_ARCH_FLAG_0` | `e906` / `e906f`(默认) / `e906d` | rv32imac / rv32imafc / rv32imafdc |
| `CPU_ARCH_FLAG_1` | `nodsp`(默认) / `dsp` | 不加 / 加 `pzp64` DSP 扩展 |

### 5.4 编译产物链路

```
kcore0/*.c + crt0_kcore0.s + clib/*.c
        │ gcc -c -march=rv32imafc -mabi=ilp32f
        ▼
kcore0/*.o
        │ gcc -T linker_kcore0.lcf -nostartfiles
        ▼
kcore0/<name>.elf
        ├── objcopy -O srec -j .text*/.rodata* ──▶ kcore0/<name>_inst.hex ──Srec2vmem──▶ kcore0/inst.pat
        ├── objcopy -O srec -j .data*/.bss      ──▶ kcore0/<name>_data.hex ──Srec2vmem──▶ kcore0/data.pat
        ├── objcopy -O srec                     ──▶ kcore0/<name>.hex ──Srec2vmem──▶ kcore0/case.pat
        └── objcopy -O binary                   ──▶ kcore0/<name>.bin
```

### 5.5 编译产物清单

| 产物 | 内容 | 用途 |
|------|------|------|
| `inst.pat` | 指令镜像（.text/.rodata） | 后门加载到 **IRAM** |
| `data.pat` | 数据镜像（.data/.bss） | 后门加载到 **DRAM** |
| `case.pat` | 完整镜像 | 调试用 |
| `.elf` | 可执行文件 | 反汇编/调试 |
| `.bin` | 裸二进制 | 烧写/加载 |
| `.obj` | 反汇编 | 代码检查 |

### 5.6 case 目录结构

```
testcase/cpu/hello_world/
├── Makefile                    ← FILE=hello_world, include 共享规则
├── hello_world_test.sv         ← SV test（含 inst_pat0/data_pat0/inst_pat1/data_pat1 路径）
├── kcore0/
│   ├── hello_world_main.c      ← CPU0 C 程序
│   └── (编译产物: .o/.elf/.hex/.pat/.bin)
└── kcore1/
    ├── hello_world_main.c      ← CPU1 C 程序
    └── (编译产物)
```

### 5.7 后门加载（配合 SV test）

```systemverilog
// 在 run_phase 中调用（base_test 提供）
load_kcore_pat(0, inst_pat0, data_pat0);  // kcore0: inst.pat→IRAM, data.pat→DRAM
load_kcore_pat(1, inst_pat1, data_pat1);  // kcore1
```

底层由 `backdoor_write_mem()`（`uvm_hdl_deposit` 写 `mem_array[addr]`）逐条加载。

### 5.8 新增 case 步骤

```bash
cp -r testcase/cpu/hello_world testcase/cpu/<new_case>
# 1) 放入 C 程序（分别替换 kcore0/ 和 kcore1/ 下的 .c）
# 2) 改 Makefile 的 FILE = <new_case>
# 3) 把 hello_world_test.sv 改名并改写类名为 <new_case>_test
# 4) SV test 中 inst_pat0/data_pat0/inst_pat1/data_pat1 路径改为 <new_case>/kcore*/
```

### 5.9 常见问题排查

| 问题 | 排查 |
|------|------|
| `riscv64-unknown-elf-gcc: not found` | 工具链路径不对，`source setup_env.sh` 或指定正确路径 |
| `cannot open pat file` | 编译未执行或产物目录不对 |
| `Srec2vmem: Permission denied` | `chmod +x testcase/sw/bin/Srec2vmem` |
| `minilibc_stdio.h: No such file` | 检查 `-I` 路径是否包含 clib/newlib_wrap |

---

## 6. SVA 断言体系

```
sva/
├── mpsoc_vif.sv          ← 顶层 virtual interface (含 19 子 vif)
├── ahb_master_if.sv      ← AHB 主机接口 (kcore 桥接)
├── define_lib.v          ← 宏定义库
└── code/
    ├── sva_tb_top.sv     ← TB 顶层断言
    └── sva_vif_*.sv      ← 各外设接口断言
```

---

## 7. 功能覆盖率体系

8 个外设 function_coverage（sysctrl/jtag/uart/gpio/qspi/switch/miiphy/efuse），通过 `mpsoc_function_coverage.sv` 按 `COVERAGE_XXX` 宏条件 include。

---

## 8. 寄存器模型与地址映射

### 8.1 addrmap（地址映射宏）

- `addressmap.v` — 各模块基地址宏（`SYSCTRL_BASE_ADDR` 等）
- `hierarchy.v` — 层次路径宏（`HIER_*` 字符串 + `UT_*_VIF` + `UT_RVCORE_*` 双核内存层级）
- `reg_*.v`（12 个）— 各外设寄存器地址宏（`DMA_SAR0` 等）

### 8.2 regmodel（寄存器模型）

21 个 `*_reg_block.sv` + `mpsoc_reg_block.sv` + `sysctrl_reg_adapter.sv`，通过 `REG_MODEL` 宏启用，被 `mpsoc_EnvTop.svh` include。

---

## 9. 文件列表组织（filelist 分层）

顶层 `filelist/tb.f` 通过 `-f` 引用各目录 filelist.f：

```
filelist/tb.f
├── +incdir cfg/coverage/coverage/code    ← 顶层保留
├── -f addrmap/filelist.f     ← 14 个 .v 宏定义
├── -f env/filelist.f         ← mpsoc_EnvTop.svh
├── -f reference/filelist.f   ← (空)
├── -f regmodel/filelist.f    ← +incdir
├── -f sva/filelist.f         ← define_lib.v + ahb_master_if.sv + mpsoc_vif.sv
├── -f tb/filelist.f          ← tb_top.sv
├── -f uvc/filelist.f         ← 19 UVC vif.sv + UvcTop.svh
└── -f testcase/filelist.f    ← +incdir 二级目录 + mpsoc_TestTop.svh
    ├── -f bus/filelist.f     ← +incdir 三级目录 (case)
    ├── -f cpu/filelist.f
    └── ... (10 个子系统)
```

规则：
- 一级目录 filelist.f：+incdir 子目录 + 列编译文件（除被 include 的）
- testcase/filelist.f：+incdir 二级目录 + mpsoc_TestTop.svh
- testcase/二级目录/filelist.f：+incdir 三级目录（各 case）

---

## 10. 运行流程

### 10.1 SV 环境编译仿真

```bash
source SourceMe                              # 配置环境
make comp TC=mpsoc_demo_test                 # 编译 (vhdlan+vlogan+vcs) → build/<TC>/
make sim  TC=mpsoc_demo_test                 # 仿真
make clean TC=mpsoc_demo_test                # 清理
```

### 10.2 双核 C 程序编译

```bash
source testcase/sw/setup/setup_env.sh
cd testcase/cpu/hello_world
make kcore0    # 或 make kcore1 / make
```

---

## 11. 文件统计

| 类型 | 数量 |
|------|:---:|
| SystemVerilog (.sv) | 337 |
| Header (.svh) | 48 |
| Verilog (.v) | 16 |
| C 程序 (.c) | 206 |
| Filelist (.f / filelist.f) | 52 / 18 |
| Linker (.lcf) | 2 |
| Python (.py) | 1 |

---

## 12. 与 canfd 环境对比

| 维度 | canfd | mpsoc |
|------|-------|-------|
| UVC 数量 | 3 (canphy/axi4lite/ucspi) | 19 外设 |
| Scoreboard 模式 | uvm_analysis_fifo + fork | uvm_analysis_imp 回调 |
| 参考模型 | ✅ 完整 | ❌ (TODO) |
| 测试用例 | 95+ (7 组) | 99 (10 子系统) |
| 双核软件 | ❌ | ✅ kcore0/kcore1 独立编译 |
| 后门内存访问 | ❌ | ✅ 后门读写 + pat 加载 |
| 编译方式 | run/xrun (Python) | make comp/sim (VCS) |
| filelist | 单一 tb.f | 分层 filelist.f (18 个) |

---

## 13. 开发状态

| 组件 | 状态 |
|------|:---:|
| UVC 框架 (19 个) | ✅ 完成 |
| env / tb / cfg | ✅ 完成 |
| 双核编译 (kcore0/kcore1) | ✅ 完成 |
| 后门内存访问 + pat 加载 | ✅ 完成 |
| addrmap 地址映射 | ✅ 完成 |
| filelist 分层 | ✅ 完成 |
| case list 组织 (TestTop_*.svh) | ✅ 完成 |
| SVA 断言 | ⚠️ 框架就绪 |
| 功能覆盖率 | ⚠️ 框架就绪 |
| 寄存器模型 | ⚠️ 基础框架 (REG_MODEL 宏) |
| Scoreboard 比对 | ❌ TODO (占位桩) |
| 参考模型 | ❌ 未实现 |

### 后续建议

1. **实现 Scoreboard 比对**：为 19 个 `write_xxx()` 填充比对逻辑
2. **添加参考模型**：创建 `mpsoc_ref_model.sv` 维护外设状态镜像
3. **case 接入编译**：RTL 就绪后，在 TestTop_*.svh 中取消注释 case include
4. **寄存器模型扩展**：完善各外设 reg_block 的实际寄存器
5. **双核软件测试**：补全 cpu 各 case 的双核算法（目前为打印骨架）
