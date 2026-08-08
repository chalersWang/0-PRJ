# MPSoC 验证环境架构文档

> MPSoC UVM Verification Environment
>
> 8 外设 UVC 覆盖 | SystemVerilog | UVM 1.2 | VCS/Verdi | MyUvmGen v2.0
>
> 日期: 2026-08-08

---

## 1. 概述

本验证环境用于验证 **MPSoC (Multi-Processor System-on-Chip)** 的外设子系统，包含 **8 个 UVC 组件**，覆盖 SoC 常见外设接口：系统控制、JTAG、UART、GPIO、QSPI、Switch、MII PHY、eFuse。

环境由 [MyUvmGen_v2.0](https://github.com/chalersWang/MyUvmGen) 自动生成基础框架，采用标准 UVM 分层架构，支持覆盖率驱动验证（CDV）。

### 验证目标

- 各外设接口协议合规性
- 寄存器读写正确性（前门/后门访问）
- 多 UVC 协同场景（跨外设数据流）
- 中断路由与处理
- 功耗模式切换
- 错误注入与异常恢复

---

## 2. 目录结构

```
mpsoc/
├── ARCHITECTURE.md           ← 本架构文档
├── readme                    ← 使用说明
├── SourceMe                  ← 环境变量设置脚本
│
├── tb/                       ← 测试平台顶层
│   ├── tb_top.sv             ← UVM 顶层模块
│   ├── crg_gen.sv            ← 时钟复位生成
│   ├── dutinst.sv            ← DUT 实例化 + SVA 绑定
│   ├── uvmconfigdb.sv        ← UVM Config DB 接口注册
│   └── dumpctrl.sv           ← 波形 dump 控制
│
├── testcase/                 ← 测试用例层
│   ├── mpsoc_TestTop.svh     ← TestTop Package
│   ├── mpsoc_base_test.sv    ← 基础测试类 (含 8 个 UVC cfg)
│   ├── mpsoc_demo_test.sv    ← 示例测试
│   └── sequence_lib/         ← 序列库
│       ├── mpsoc_sequence_lib.sv
│       └── mpsoc_common_task_function.sv
│
├── env/                      ← 环境层
│   ├── mpsoc_EnvTop.svh      ← EnvTop Package
│   ├── mpsoc_env.sv          ← UVM env (8 个 Agent + Scoreboard)
│   ├── mpsoc_config.sv       ← 全局配置对象
│   ├── mpsoc_event.sv        ← 全局事件同步
│   ├── mpsoc_scoreboard.sv   ← 计分板 (uvm_analysis_imp 回调模式)
│   ├── mpsoc_virtual_sequencer.sv ← 虚拟 Sequencer
│   └── mpsoc_function_coverage.sv  ← 功能覆盖率封装
│
├── uvc/                      ← UVC 组件层 (8 个, 各 9 文件)
│   ├── sysctrl/              ← 系统控制器 UVC
│   ├── jtag/                 ← JTAG 调试接口 UVC
│   ├── uart/                 ← UART 串口 UVC
│   ├── gpio/                 ← GPIO 通用 I/O UVC
│   ├── qspi/                 ← Quad-SPI Flash UVC
│   ├── switch/               ← 交换/互联模块 UVC
│   ├── miiphy/               ← MII 以太网 PHY UVC
│   └── efuse/                ← eFuse 熔丝 UVC
│   每个 UVC: UvcTop / agent / driver / monitor / sequencer / sequence_lib / trans / config / vif
│
├── regmodel/                 ← 寄存器模型层 (MyUvmGen 自动生成)
│   ├── mpsoc_reg_block.sv    ← 寄存器 Block + 各寄存器 uvm_reg 类
│   ├── mpsoc_reg_sequence.sv ← 寄存器访问 Sequence
│   └── sysctrl_reg_adapter.sv← 寄存器 Adapter
│
├── sva/                      ← SVA 断言层 (8 接口 + 顶层)
│   ├── mpsoc_vif.sv          ← 顶层 Virtual Interface (含 8 个子 vif)
│   ├── define_lib.v          ← 宏定义库
│   ├── VifMacroDefine.v      ← Interface 宏定义
│   └── code/
│       ├── sva_tb_top.sv     ← TB 顶层断言
│       ├── sva_vif_top.sv    ← 顶层接口断言
│       ├── sva_vif_sysctrl.sv / sva_vif_jtag.sv / sva_vif_uart.sv
│       ├── sva_vif_gpio.sv / sva_vif_qspi.sv / sva_vif_switch.sv
│       ├── sva_vif_miiphy.sv / sva_vif_efuse.sv
│       └── AssertionHierarchy.lst
│
├── coverage/                 ← 覆盖率层 (8 模块 + ucspi)
│   └── code/
│       ├── sysctrl_function_coverage.sv / jtag_function_coverage.sv
│       ├── uart_function_coverage.sv / gpio_function_coverage.sv
│       ├── qspi_function_coverage.sv / switch_function_coverage.sv
│       ├── miiphy_function_coverage.sv / efuse_function_coverage.sv
│       ├── ucspi_function_coverage.sv
│       ├── Guide.Coverage_coding.sv  ← 覆盖率编码规范
│       └── CoverageHierarchy.lst
│
├── testplan/                 ← 测试计划层 (7 组)
│   ├── T1_group/ ~ T7_group/
│   每组包含: cmodel.f, rtl.f, tb.f, vip.f, test.json
│
├── filelist/                 ← 文件列表
│   ├── rtl.f / tb.f / vip.f / cmodel.f / netlist.f
│
├── cfg/                      ← 仿真配置
│   ├── comp_base.cfg / sim_base.cfg / assertion.cfg
│   ├── coverage.cfg / debug.cfg / xprop.cfg
│   └── partitioncompile_cfg.v
│
├── run/                      ← 运行基础设施
│   ├── xrun (Python) / run / Makefile
│
├── tcl/                      ← TCL 脚本
│   └── wave.tcl
│
├── json/                     ← JSON 配置
│   ├── mpsoc_VerifyPlan.xlsx
│   └── excel_to_json.py
│
└── reference/                ← 参考数据
```

---

## 3. 架构层次图

```
┌──────────────────────────────────────────────────────────────┐
│                     Run Infrastructure                        │
│  xrun (Python): compile / sim / regression / coverage       │
└──────────────────────────────────────────────────────────────┘
                              │
┌──────────────────────────────────────────────────────────────┐
│                       Test Layer                              │
│  mpsoc_TestTop Package                                        │
│  ├── mpsoc_base_test (8 UVC cfg + env + regmodel)            │
│  ├── mpsoc_demo_test                                          │
│  └── mpsoc_sequence_lib                                      │
└──────────────────────────────────────────────────────────────┘
                              │
┌──────────────────────────────────────────────────────────────┐
│                     Environment Layer                          │
│  mpsoc_EnvTop Package                                         │
│  ├── mpsoc_env          ← 8 Agent 容器 + Scoreboard          │
│  ├── mpsoc_config       ← 全局仿真参数 (config_db)            │
│  ├── mpsoc_event        ← 全局事件同步                         │
│  ├── mpsoc_virtual_sequencer ← 8 UVC sequencer handles       │
│  └── mpsoc_scoreboard   ← uvm_analysis_imp 回调模式          │
└──────────────────────────────────────────────────────────────┘
                              │
   ┌──────────┬──────────┬───┴───┬──────────┬──────────┬──────────┬──────────┐
   ▼          ▼          ▼       ▼          ▼          ▼          ▼          ▼
┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐
│sysctrl│ │ jtag │ │ uart │ │ gpio │ │ qspi │ │switch│ │miiphy│ │efuse │
│ Agent │ │ Agent│ │ Agent│ │ Agent│ │ Agent│ │ Agent│ │ Agent│ │ Agent│
├──────┤ ├──────┤ ├──────┤ ├──────┤ ├──────┤ ├──────┤ ├──────┤ ├──────┤
│Driver │ │Driver│ │Driver│ │Driver│ │Driver│ │Driver│ │Driver│ │Driver│
│Monitor│ │Monit.│ │Monit.│ │Monit.│ │Monit.│ │Monit.│ │Monit.│ │Monit.│
│Seqr   │ │Seqr  │ │Seqr  │ │Seqr  │ │Seqr  │ │Seqr  │ │Seqr  │ │Seqr  │
└──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘ └──┬───┘
   │        │        │        │        │        │        │        │
   └────────┴────────┴────────┴────────┴────────┴────────┴────────┘
                                    │
                    ┌───────────────┴───────────────┐
                    ▼                               ▼
          ┌─────────────────┐           ┌─────────────────────┐
          │   mpsoc_vif     │           │  mpsoc_scoreboard   │
          │  (8 子 vif)     │           │  (8 uvm_analysis_   │
          │                 │           │   imp callbacks)    │
          └───────┬─────────┘           └─────────────────────┘
                  ▼
          ┌───────────────┐
          │  DUT (MPSoC)  │
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
endmodule
```

### 4.2 测试用例层

#### mpsoc_base_test — 基类

| Phase | 职责 |
|-------|------|
| `new` | 创建 8 个 UVC config + mpsoc_config + mpsoc_event |
| `build_phase` | 创建 env，获取 mpsoc_vif，构建 RegModel |
| `connect_phase` | 连接 RegModel → sysctrl sequencer |
| `run_phase` | 等待复位释放 + DUT 稳定 |

**特点**：在 `new()` 中预创建所有 UVC config，支持 test.json 参数传递。

### 4.3 环境层

#### mpsoc_env — 顶层容器

```
mpsoc_env (uvm_env)
├── mpsoc_config             ← 全局配置
├── mpsoc_event              ← 事件池
├── mpsoc_virtual_sequencer  ← 虚拟 Sequencer (8 个 sequencer handles)
├── mpsoc_scoreboard         ← 计分板
│   ├── sysctrl_scb_imp      ← analysis_imp 回调
│   ├── jtag_scb_imp
│   ├── uart_scb_imp
│   ├── gpio_scb_imp
│   ├── qspi_scb_imp
│   ├── switch_scb_imp
│   ├── miiphy_scb_imp
│   └── efuse_scb_imp
├── sysctrl_agent / jtag_agent / uart_agent / gpio_agent
├── qspi_agent / switch_agent / miiphy_agent / efuse_agent
└── [RegModel] (可选, `REG_MODEL)
```

#### mpsoc_scoreboard — 计分板（uvm_analysis_imp 回调模式）

与 canfd 环境不同，mpsoc 使用 `uvm_analysis_imp_xxx` 模板模式：

```
                    ┌─────────────────────────┐
  sysctrl_monitor ──│► uvm_analysis_imp_sysctrl│──► write_sysctrl()  [TODO]
  jtag_monitor ─────│► uvm_analysis_imp_jtag   │──► write_jtag()     [TODO]
  uart_monitor ─────│► uvm_analysis_imp_uart   │──► write_uart()     [TODO]
  gpio_monitor ─────│► uvm_analysis_imp_gpio   │──► write_gpio()     [TODO]
  qspi_monitor ─────│► uvm_analysis_imp_qspi   │──► write_qspi()     [TODO]
  switch_monitor ───│► uvm_analysis_imp_switch │──► write_switch()   [TODO]
  miiphy_monitor ───│► uvm_analysis_imp_miiphy │──► write_miiphy()   [TODO]
  efuse_monitor ────│► uvm_analysis_imp_efuse  │──► write_efuse()    [TODO]
                    └─────────────────────────┘
```

> ⚠️ **当前状态**：所有 `write_xxx()` 函数均为占位桩（只打印 `uvm_info`，标注 TODO），比对逻辑待实现。

### 4.4 UVC 层 — 8 个外设组件

| UVC | 接口 | 方向 | 关键功能 |
|-----|------|------|----------|
| **sysctrl** | 系统控制总线 | Master | 寄存器配置、时钟/复位控制、电源管理 |
| **jtag** | JTAG (IEEE 1149.1) | Master | 调试访问、边界扫描、IDCODE 读取 |
| **uart** | UART 串口 | Master/Slave | 异步收发、波特率配置、奇偶校验 |
| **gpio** | GPIO 并行 I/O | Master/Slave | 输入/输出/双向、中断检测 |
| **qspi** | Quad-SPI | Master | Flash 读写、XIP、DDR 模式 |
| **switch** | 交换矩阵 | Monitor | 路由配置、端口连接状态 |
| **miiphy** | MII (Ethernet PHY) | Master/Slave | MDIO 寄存器访问、RMII/RGMII |
| **efuse** | eFuse 控制器 | Master | 熔丝编程/读取、锁定控制 |

每个 UVC 标准 9 文件结构：

```
<name>/
├── <name>_UvcTop.svh      ← Package (含所有 typedef + include)
├── <name>_agent.sv        ← Agent (封装 driver + monitor + sequencer)
├── <name>_driver.sv       ← Driver (seq_item_port → vif 驱动)
├── <name>_monitor.sv      ← Monitor (vif 采样 → analysis_port)
├── <name>_sequencer.sv    ← Sequencer
├── <name>_sequence_lib.sv ← 基础 Sequence 库
├── <name>_trans.sv        ← Transaction
├── <name>_config.sv       ← Config 对象
└── <name>_vif.sv          ← SystemVerilog Interface
```

### 4.5 Virtual Interface 层

```systemverilog
interface mpsoc_vif(input clk, input rstn);
    string   TestCaseName;
    sysctrl_vif sysctrlvif(clk, rstn);
    jtag_vif    jtagvif(clk, rstn);
    uart_vif    uartvif(clk, rstn);
    gpio_vif    gpiovif(clk, rstn);
    qspi_vif    qspivif(clk, rstn);
    switch_vif  switchvif(clk, rstn);
    miiphy_vif  miiphyvif(clk, rstn);
    efuse_vif   efusevif(clk, rstn);
endinterface
```

单一顶层 vif 包含所有外设子接口，通过 `uvm_config_db` 传递给各组件。

---

## 5. 数据流

```
  Virtual Sequencer (8 handles)
       │
       ├── sysctrl_seqr → sysctrl_driver → sysctrl_vif ──┐
       ├── jtag_seqr    → jtag_driver    → jtag_vif    ──┤
       ├── uart_seqr    → uart_driver    → uart_vif    ──┤
       ├── gpio_seqr    → gpio_driver    → gpio_vif    ──┤
       ├── qspi_seqr    → qspi_driver    → qspi_vif    ──┤
       ├── switch_seqr  → switch_driver  → switch_vif  ──┤
       ├── miiphy_seqr  → miiphy_driver  → miiphy_vif  ──┤
       └── efuse_seqr   → efuse_driver   → efuse_vif   ──┤
                                                        │
                                          ┌─────────────┘
                                          ▼
                                    mpsoc_vif
                                          │
                                          ▼
                                     DUT (MPSoC)
                                          │
       ┌──────────────────────────────────┘
       ▼
  Monitor (8 个各自独立采样)
       │
       ├── sysctrl_monitor ──► sysctrl_analysis_port ──► sysctrl_scb_imp.write()
       ├── jtag_monitor    ──► jtag_analysis_port    ──► jtag_scb_imp.write()
       ├── uart_monitor    ──► uart_analysis_port    ──► uart_scb_imp.write()
       ├── gpio_monitor    ──► gpio_analysis_port    ──► gpio_scb_imp.write()
       ├── qspi_monitor    ──► qspi_analysis_port    ──► qspi_scb_imp.write()
       ├── switch_monitor  ──► switch_analysis_port  ──► switch_scb_imp.write()
       ├── miiphy_monitor  ──► miiphy_analysis_port  ──► miiphy_scb_imp.write()
       └── efuse_monitor   ──► efuse_analysis_port   ──► efuse_scb_imp.write()
                                                            │
                                                    [TODO: 比对逻辑]
```

---

## 6. SVA 断言体系

```
sva/
├── mpsoc_vif.sv          ← 顶层枚举: 所有子 vif 的信号名字符串
├── define_lib.v          ← 寄存器地址 / 位域宏
├── VifMacroDefine.v      ← Interface 实例化宏
└── code/
    ├── sva_tb_top.sv     ← TB 顶层: 跨模块协议
    ├── sva_vif_top.sv    ← 时钟/复位 X/Z 检测
    ├── sva_vif_sysctrl.sv← 总线协议时序
    ├── sva_vif_jtag.sv   ← JTAG TAP 状态机
    ├── sva_vif_uart.sv   ← 波特率 / 帧格式
    ├── sva_vif_gpio.sv   ← 方向冲突 / glitch
    ├── sva_vif_qspi.sv   ← SPI 模式 / 片选时序
    ├── sva_vif_switch.sv ← 路由配置一致性
    ├── sva_vif_miiphy.sv ← MDIO 时序 / RMII
    └── sva_vif_efuse.sv  ← 编程时序 / 锁定状态
```

---

## 7. 功能覆盖率体系

| 覆盖率模块 | 覆盖目标 |
|-----------|----------|
| **sysctrl_function_coverage** | 寄存器访问、中断路由、功耗模式 |
| **jtag_function_coverage** | TAP 状态机、IR/DR 扫描、IDCODE |
| **uart_function_coverage** | 波特率、数据位、奇偶校验、停止位 |
| **gpio_function_coverage** | 方向、输入/输出值、中断边沿 |
| **qspi_function_coverage** | 模式 (SPI/DSPI/QSPI)、XIP、DDR |
| **switch_function_coverage** | 端口连接、路由表 |
| **miiphy_function_coverage** | MDIO 寄存器、RMII/RGMII 速度 |
| **efuse_function_coverage** | 编程操作、读取模式、锁定状态 |
| **ucspi_function_coverage** | UCSPI 协议覆盖 |

---

## 8. 寄存器模型 (MyUvmGen 自动生成)

由 MyUvmGen v2.0 从 Excel 配置自动生成，包含：

| 寄存器 | 位宽 | 访问 | 说明 |
|--------|:---:|:----:|------|
| BASE_ADDR | 0 | RW | 基地址配置 |
| Offset | 32 | RW | 偏移地址 |
| ... | | | (由 MyUvmGen 按 Excel 扩展) |

支持 `REG_MODEL` 宏控制启用，通过 sysctrl_reg_adapter 桥接到 sysctrl sequencer。

---

## 9. 与 canfd 环境对比

| 维度 | canfd | mpsoc |
|------|-------|-------|
| **UVC 数量** | 3 (canphy, axi4lite, ucspi) | 8 (sysctrl, jtag, uart, gpio, qspi, switch, miiphy, efuse) |
| **Scoreboard 模式** | `uvm_analysis_fifo` + fork 线程 | `uvm_analysis_imp` 回调 |
| **参考模型** | ✅ canfd_ref_model | ❌ (TODO) |
| **比对成熟度** | ✅ 完整 TX/RX/AXI 比对 | ⚠️ 占位桩 (write_xxx 全为 TODO) |
| **测试用例** | 95+ (7 组全覆盖) | 2 (demo_test 为主) |
| **SVA 覆盖** | 4 接口 (TB/CANPHY/UCSPI/Top) | 8 接口 + Top |
| **覆盖率模块** | 4 (CANFD/CANPHY/AXI4Lite/UCSPI) | 9 (8 外设 + UCSPI) |
| **Virtual Sequencer** | 2 handles | 8 handles + JSON 参数 |
| **开发阶段** | 成熟 (完整回归) | 早期 (框架搭建完成) |

---

## 10. 运行流程

```bash
# 环境初始化
source SourceMe

# 列出用例
run/xrun -l

# 编译
run/xrun -g T1_group -t mpsoc_demo_test -c

# 仿真 (带波形)
run/xrun -g T1_group -t mpsoc_demo_test -s --fsdb

# 覆盖率
run/xrun -g T1_group -c --cov
run/xrun -g T1_group -s --cov -n 10
xrun --covmerge
xrun --opencov
```

---

## 11. 文件统计

| 类型 | 数量 |
|------|:---:|
| SystemVerilog (.sv) | 103 |
| Header (.svh) | 10 |
| Verilog (.v) | 3 |
| Python (.py) | 1 |
| Filelist (.f) | 33 |
| Config (.cfg) | 6 |
| JSON | 7 |
| TCL (.tcl) | 1 |
| **总计** | **172** |

---

## 12. 开发状态与建议

### 当前状态

| 组件 | 状态 |
|------|:---:|
| UVC 框架 (8 个) | ✅ 完成 (9 文件标准结构) |
| env / tb / cfg | ✅ 完成 |
| SVA 断言 | ✅ 框架就绪 |
| 功能覆盖率 | ✅ 框架就绪 |
| 寄存器模型 | ⚠️ 基础框架 (待扩展) |
| Scoreboard 比对 | ❌ TODO (全占位桩) |
| 参考模型 | ❌ 未实现 |
| 测试用例 | ⚠️ 仅 demo_test (2 用例) |

### 后续建议

1. **实现 Scoreboard 比对**：为每个 `write_xxx()` 填充实际比对逻辑，或统一改用 `uvm_analysis_fifo` + Reference Model 模式（参考 canfd）
2. **添加参考模型**：创建 `mpsoc_ref_model.sv` 维护外设状态镜像
3. **扩展测试用例**：按 7 个 Testplan 组逐步填充，可参考 canfd 的用例组织结构
4. **寄存器模型扩展**：通过 MyUvmGen 完善 Excel 配置，生成完整 reg_block
5. **跨 UVC 协同测试**：利用 Virtual Sequencer 的 8 个 handles 实现多外设并发场景
