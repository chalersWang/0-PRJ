# 玄铁 C910 (OpenC910) 处理器设计分析

## 1. 概述

C910 是 T-Head Semiconductor 开发的高性能 64 位 RISC-V 处理器核，支持 RV64GC[Zb[abcs]] 指令集。开源版本开放了完整的 RTL 源码、仿真环境、FPGA 支持和综合/实现脚本。

### 关键特性

| 特性 | 参数 |
|------|------|
| **ISA** | RV64GC + T-Head 自定义扩展 + 向量扩展 |
| **流水线** | 12 级，乱序执行 (Out-of-Order) |
| **解码/发射** | 4 路解码，8 路发射 |
| **物理寄存器** | GPR: 64 个 / FPR: 64 个 / VR: 64 个 |
| **L1 I-Cache** | 64 KB，4 路组相联 |
| **L1 D-Cache** | 64 KB，4 路组相联 |
| **L2 Cache** | 1 MB，16 路组相联（可配置 128K~8M） |
| **MMU/TLB** | JTLB 1024 条目，页表遍历硬件单元 |
| **分支预测** | BTB 1024 条目 + L0 BTB + IBP(TAGE) + RAS |
| **总线接口** | ACE 128-bit 全一致性接口 |
| **调试** | JTAG，硬件断点，实时跟踪 |
| **PMP** | 8 个物理内存保护区域 |
| **PLIC** | 支持 144 个中断源，32 个 HART |
| **HPCP** | 16 个性能计数器 |
| **核数** | 支持最多 4 核 SMP 配置 |
| **物理地址** | 40 位物理地址空间 |
| **虚拟地址** | 39 位虚拟地址空间 |
| **工艺** | FPGA 验证 + ASIC ready |

## 2. 流水线架构

C910 采用 12 级流水线乱序执行架构，流水线阶段如下：

```
IFU (指令取指)                              IDU (指令译码)
┌─────────────────────┐                     ┌─────────────────────┐
│ Stage 1: PC生成      │                    │ Stage 5: 预解码     │
│ Stage 2: I-Cache访问 │                     │ Stage 6: 译码/重命名│
│ Stage 3: 数据对齐     │                    │ Stage 7: 发射队列   │
│ Stage 4: 指令缓冲     │                    └─────────┬───────────┘
└─────────────────────┘                               │
                                                      │ 8 路发射
                                                      ▼
                ┌─────────────────────────────────────────────┐
                │              IU (整型执行单元)               │
                │  Pipe0: ALU / 分支 / CSR                    │
                │  Pipe1: ALU / 乘法 / MLA                    │
                │  Pipe2: 分支/BJU (PC FIFO)                   │
                │  Stage 8-10: EX1-EX3                        │
                └─────────────────────────────────────────────┘
                                                      │
                ┌─────────────────────────────────────────────┐
                │             LSU (加载存储单元)               │
                │  Pipe3: 加载 / 原子操作                       │
                │  Pipe4: 存储 / 缓存维护                       │
                │  Pipe5: 向量加载存储                           │
                │  D-Cache: 64KB 4路                           │
                └─────────────────────────────────────────────┘
                                                      │
                ┌─────────────────────────────────────────────┐
                │         VFPU (向量/浮点单元)                │
                │  VFALU: 浮点加/减/转换                      │
                │  VFMDU: 浮点乘/除                           │
                │  VFDS: 浮点融合乘加                          │
                └─────────────────────────────────────────────┘
                                                      │
                ┌─────────────────────────────────────────────┐
                │           RTU (指令退役单元)                │
                │  Stage 11-12: 写回/退役                      │
                │  3 路退休（64 项 ROB）                      │
                └─────────────────────────────────────────────┘
```

## 3. 子模块详细分析

### 3.1 IFU (Instruction Fetch Unit) - 指令取指单元

**源文件**: `gen_rtl/ifu/rtl/`

**功能**:
- PC 生成和选择：顺序、分支目标、异常返回、调试入口
- L0 BTB (Level-0 Branch Target Buffer)：零延迟分支预测
- BTB (Branch Target Buffer)：1024 条目标地址缓存
- IBP (Indirect Branch Predictor, TAGE)：间接跳转预测
- BHT (Branch History Table)：分支历史表
- RAS (Return Address Stack)：返回地址栈
- L1 I-Cache：64KB，4 路组相联
- LBUF (Line Buffer)：指令行缓冲

**关键文件清单**:
| 文件 | 功能 |
|------|------|
| `ct_ifu_addrgen.v` | 地址生成 |
| `ct_ifu_bht.v` / `ct_ifu_bht_pre_array.v` / `ct_ifu_bht_sel_array.v` | 分支历史表（BHT + 预测 + 选择阵列） |
| `ct_ifu_btb.v` / `ct_ifu_btb_data_array.v` / `ct_ifu_btb_tag_array.v` | 分支目标缓冲 |
| `ct_ifu_ibctrl.v` | 指令缓冲控制 |
| `ct_ifu_l0btb.v` / `ct_ifu_l0btb_data.v` / `ct_ifu_l0btb_tag.v` | L0 BTB |
| `ct_ifu_ras.v` | 返回地址栈 |
| `ct_ifu_icache.v` / `ct_ifu_icache_data_array.v` / `ct_ifu_icache_tag_array.v` | I-Cache |
| `ct_ifu_ifctrl.v` | IF 控制 |
| `ct_ifu_mmu.v` | IFU-MMU 接口 |
| `ct_ifu_pf_ctrl.v` / `ct_ifu_pf_entry.v` / `ct_ifu_pf_hit_detect.v` | 预取控制 |

### 3.2 IDU (Instruction Decode Unit) - 指令译码/发射单元

**源文件**: `gen_rtl/idu/rtl/`

**功能**:
- 4 路指令译码（支持 RISC-V 标准指令 + T-Head 扩展 + 向量指令）
- 寄存器重命名：GPR (64项) + FPR (64项) + VR (64项)
- 8 路发射：Pipe0~2 (IU) + Pipe3~4 (LSU) + Pipe5~7 (VFPU)
- 依赖检测与前瞻（Forwarding）
- 发射队列/Issue Queue

**关键文件清单**:
| 文件 | 功能 |
|------|------|
| `ct_idu_id_ctrl.v` | 译码控制 |
| `ct_idu_id_decd.v` | 标准 RISC-V 指令译码 |
| `ct_idu_id_decd_special.v` | 特殊/自定义指令译码 |
| `ct_idu_id_dp.v` | 译码数据通路 |
| `ct_idu_id_fence.v` | Fence 指令处理 |
| `ct_idu_dep_reg_entry.v` | GPR 依赖表条目 |
| `ct_idu_dep_vreg_entry.v` | 向量寄存器依赖表条目 |
| `ct_idu_rf_ctrl.v` | RF/发射控制 |
| `ct_idu_ir_arb.v` | IR (指令寄存器) 仲裁 |
| `ct_idu_iq.v` / `ct_idu_iq_entry.v` | Issue Queue 发射队列 |

### 3.3 IU (Integer Unit) - 整型执行单元

**源文件**: `gen_rtl/iu/rtl/`

**功能**:
- **Pipe0**: ALU + 特殊指令 + CSBus (CSR 总线)
- **Pipe1**: ALU + 乘法器 (MUL) + 乘加累加 (MLA)
- **Pipe2**: 分支执行单元 (BJU) + PC FIFO
- 除法器：Radix-16 SRT 除法，非恢复除法

**关键文件清单**:
| 文件 | 功能 |
|------|------|
| `ct_iu_alu.v` | ALU：加/减/移位/逻辑/比较 |
| `ct_iu_mult.v` | 乘法器 |
| `multiplier_65x65_3_stage.v` | 65x65 位 3 级流水线乘法器 |
| `ct_iu_div.v` / `ct_iu_div_entry.v` | 除法器 |
| `ct_iu_div_srt_radix16.v` | Radix-16 SRT 除法核心 |
| `ct_iu_bju.v` | 分支执行单元 (Branch/Jump) |
| `ct_iu_bju_pcfifo.v` | BJU PC FIFO（预测模式下的 PC 管理） |
| `ct_iu_cbus.v` / `ct_iu_rbus.v` | CSR 总线/结果总线 |
| `ct_iu_special.v` | 特殊指令（CSR 访问、屏障等） |

### 3.4 LSU (Load Store Unit) - 加载存储单元

**源文件**: `gen_rtl/lsu/rtl/`

**功能**:
- **Pipe3**: 加载指令 (LB/LH/LW/LD/LBU/LHU/LWU) + 原子操作 (AMO/LR/SC)
- **Pipe4**: 存储指令 (SB/SH/SW/SD) + 缓存维护操作 (FENCE.I/CBO)
- **Pipe5**: 向量加载/存储 (VLS/VLD/单元步长等)
- D-Cache：64KB，4 路组相联
- Store Buffer + Write Combine Buffer
- 加载-存储转发 (Load-to-Store Forwarding)
- 缓存一致性协议 (ACE snoop)

**关键文件清单**:
| 文件 | 功能 |
|------|------|
| `ct_lsu_ctrl.v` | LSU 控制器 |
| `ct_lsu_amr.v` | 原子操作（AMO/LR/SC） |
| `ct_lsu_bus_arb.v` | 总线仲裁 |
| `ct_lsu_dcache_arb.v` | D-Cache 仲裁 |
| `ct_lsu_dcache_data_array.v` | D-Cache 数据阵列 |
| `ct_lsu_dcache_tag_array.v` | D-Cache Tag 阵列 |
| `ct_lsu_dcache_dirty_array.v` | D-Cache 脏位阵列 |
| `ct_lsu_dcache_ld_tag_array.v` | D-Cache 加载 Tag |
| `ct_lsu_store_buffer.v` / `ct_lsu_store_buffer_entry.v` | Store Buffer |
| `ct_lsu_wmb.v` | Write Merge Buffer |

### 3.5 VFPU (Vector/FP Unit) - 向量浮点单元

**子模块**: `vfalu/`, `vfmau/`, `vfdsu/`, `vfpu/`

**功能**:
- **VFALU**: 浮点加/减、浮点/整数转换、定点运算
- **VFMAU**: 浮点乘/除、平方根
- **VFDU**: 融合乘加 (FMA)、浮点比较
- **VFPU**: 向量处理顶层，向量寄存器管理
- 支持 RISC-V V 扩展（向量扩展）+ VFLOAT（向量浮点）

### 3.6 MMU (Memory Management Unit) - 内存管理单元

**源文件**: `gen_rtl/mmu/rtl/`

**功能**:
- 39 位虚拟地址 → 40 位物理地址转换
- JTLB (Joint TLB)：1024 条目（可配置 2048）
- PTU (Page Table Walker)：硬件页表遍历
- 支持 Sv39 分页模式
- PMP (Physical Memory Protection)：8 个区域
- 多核 TLB 一致性广播

### 3.7 RTU (Retire Unit) - 退役单元

**源文件**: `gen_rtl/rtu/rtl/`

**功能**:
- 物理寄存器管理：GPR 64 + FPR 64 + VR 64 + EREG 64
- ROB (Reorder Buffer) 管理：64 项，每周期最多 3 路退休
- 精确异常处理
- 中断响应与处理
- 调试事件（断点、单步）

**关键文件清单**:
| 文件 | 功能 |
|------|------|
| `ct_rtu_pst_ereg.v` | 异常寄存器管理 |
| `ct_rtu_pst_preg.v` | 物理寄存器状态 |
| `ct_rtu_encode_8/32/64/96.v` | 退休编码（8/32/64/96 位宽） |
| `ct_rtu_expand_8/32/64/96.v` | 退休展开 |
| `ct_rtu_expt.v` | 异常处理 |
| `ct_rtu_int.v` | 中断处理 |
| `ct_rtu_dcache_flush.v` | D-Cache 刷写 |
| `ct_rtu_pipe_ctrl.v` | 流水线控制 |

### 3.8 BIU (Bus Interface Unit) - 总线接口单元

**源文件**: `gen_rtl/biu/rtl/`

**功能**:
- ACE 128-bit 全一致性接口
- 5 个 AXI 通道 (AR/R/AW/W/B) + 3 个 ACE 通道 (AC/CR/CD)
- IFU 独立读总线（指令获取不阻塞数据访问）
- LSU ACE 接口（加载/存储/一致性）
- CSR 从接口（APB 风格）
- 低功耗管理 (LPMD)
- 中断汇聚与传递

### 3.9 CP0 (CoProcessor 0) - 系统控制器

**源文件**: `gen_rtl/cp0/rtl/`

**功能**:
- RISC-V 特权 CSR 寄存器集合
- 所有子模块的控制/状态寄存器
- 时钟门控控制 (ICG)
- 性能计数器 (HPCP)
- 低功耗模式控制
- 复位与初始化序列

### 3.10 其他模块

| 模块 | 文件位置 | 功能 |
|------|----------|------|
| **CIU** | `gen_rtl/ciu/rtl/` | CPU 接口单元（DDR/Flash/APB） |
| **CLINT** | `gen_rtl/clint/rtl/` | 核心本地中断控制器 |
| **PLIC** | `gen_rtl/plic/rtl/` | 平台级中断控制器，144 中断源 |
| **HAD** | `gen_rtl/had/rtl/` | 硬件辅助调试 (JTAG) |
| **PMU** | `gen_rtl/pmu/rtl/` | 电源管理单元 |
| **L2C** | `gen_rtl/l2c/rtl/` | L2 Cache 控制器，1MB 16路 |
| **CLK/RST** | `gen_rtl/clk/rtl/`, `gen_rtl/rst/rtl/` | 时钟/复位生成 |
| **PMP** | `gen_rtl/pmp/rtl/` | 物理内存保护 |
| **FPGA** | `gen_rtl/fpga/` | FPGA 支持逻辑 |

## 4. 设计关键参数 (cpu_cfig.h 分析)

| 参数 | 值 | 说明 |
|------|-----|------|
| PRODUCT_ID | 12'h000 | C910 产品 ID |
| `ICACHE_64K` | 64KB | L1 指令缓存 |
| `DCACHE_64K` | 64KB | L1 数据缓存 |
| `L2_CACHE_1M` | 1MB | L2 缓存 |
| `L2_CACHE_16WAY` | 16路 | L2 缓存组相联度 |
| `BTB_1024` | 1024 条 | 分支目标缓冲 |
| `IBP_PRO` | (TAGE) | 专业级间接分支预测 |
| `LBUF` | 有 | 行缓冲 |
| `JTLB_ENTRY_1024` | 1024 条 | 联合 TLB |
| `PMP_REGION_8` | 8 个 | 物理内存保护区域 |
| `PLIC_INT_NUM` | 144 | PLIC 中断源数 |
| `PLIC_ID_NUM` | 10 | PLIC ID 位宽 |
| `PLIC_PRIO_BIT` | 5 | PLIC 优先级位宽 |
| `MAX_HART_NUM` | 32 | 最大 HART 数 |
| `HPCP_CNT_NUM_16` | 16 | 性能计数器数 |
| `PA_WIDTH` | 40 | 物理地址宽度 |
| `VA_WIDTH` | 39 | 虚拟地址宽度 |
| `FPR_WIDTH` | 63 | 浮点寄存器宽度 |
| `VEC_WIDTH` | 63 | 向量寄存器宽度 |
| `MULTI_PROCESSING` | 支持 | 最多 4 核 |
| `SAB_DEPTH` | 24 | Store Address Buffer 深度 |
| `SAB_RDEPTH` | 16 | SAB 读深度 |
| `SAB_WDEPTH` | 8 | SAB 写深度 |

## 5. 自定义指令扩展 (T-Head ISA)

C910 支持 T-Head 自定义 RISC-V 指令扩展，位于 `ISA_THEAD` 测试分类下：

- T-Head 特定 ISA 编码空间
- 用于协处理器/自定义加速器的指令槽
- 低延迟的自定义计算指令

## 6. 仿真验证环境 (smart_run)

### 目录结构

```
smart_run/
├── Makefile              # 主 Makefile，支持编译/运行/回归测试
├── logical/              # SoC 平台 + 验证 Testbench
│   ├── tb/               # Testbench 顶层 (tb.v)
│   ├── axi/              # AXI 总线模型
│   ├── ahb/              # AHB 总线模型
│   ├── apb/              # APB 总线模型
│   ├── mem/              # 内存模型
│   ├── uart/             # UART 外设模型
│   ├── gpio/             # GPIO 外设模型
│   └── filelists/        # 文件列表
├── setup/                # GNU 工具链配置
├── tests/                # 测试用例
│   └── cases/            # 分目录测试
├── impl/                 # 综合/实现脚本
│   ├── upf/              # UPF 电源意图
│   └── memlist/          # 内存列表
└── work/                 # 编译运行工作目录
```

### 支持的仿真器

| 仿真器 | 命令 | 说明 |
|--------|------|------|
| Verilator | `SIM=verilator` | 推荐 >= 4.215，性能最优 |
| Icarus Verilog | `SIM=iverilog` | 开源免费 |
| Synopsys VCS | `SIM=vcs` | 商业，支持 UPF 仿真 |
| Cadence irun | `SIM=nc` | 商业 |

### 测试用例分类

| 分类 | 子目录 | 说明 |
|------|--------|------|
| ISA | `ISA_AMO/`, `ISA_BARRIER/`, `ISA_FP/`, `ISA_IMAC/`, `ISA_THEAD/` | 指令集功能测试 |
| MMU | `ct_mmu_basic.s` 等 | MMU 页表遍历/翻译测试 |
| Cache | `cache/` | 缓存一致性/刷写测试 |
| CSR | `csr/` | 特权 CSR 访问测试 |
| Debug | `debug_gpr/`, `debug_memory/` | JTAG 调试测试 |
| Exception | `exception/` | 异常/陷阱处理测试 |
| Interrupt | `interrupt/` | 中断响应测试 |
| Sleep | `sleep/` | 低功耗睡眠测试 |
| Smoke | `smoke/` | 冒烟测试 |
| CoreMark | `coremark/` | 性能基准测试 |
| hello_world | `hello_world/` | 最小系统测试 |

## 7. RTL 文件统计

| 子模块 | RTL 文件数 | 功能 |
|--------|-----------|------|
| biu | 12 | 总线接口单元 |
| ciu | 6 | CPU 接口单元 |
| clint | 2 | 本地中断控制器 |
| clk | 2 | 时钟生成 |
| common | 1 | 公共模块 |
| cp0 | 1 | 系统控制器 |
| cpu | 2 | 顶层 + 配置 |
| filelists | 1 | 文件列表 |
| fpga | - | FPGA 相关 |
| had | 3 | 硬件调试 |
| idu | 28 | 译码/发射 |
| ifu | 34 | 指令取指 |
| iu | 11 | 整型执行 |
| l2c | 9 | L2 Cache |
| lsu | 26 | 加载存储 |
| mmu | 3 | 内存管理 |
| plic | 2 | 平台中断控制器 |
| pmp | 1 | 物理内存保护 |
| pmu | 1 | 电源管理 |
| rst | 1 | 复位生成 |
| rtu | 21 | 退役单元 |
| vfalu | 5 | 向量浮点 ALU |
| vfdsu | 1 | 向量浮点除法/平方根 |
| vfmau | 1 | 向量浮点乘加 |
| vfpu | 1 | 向量浮点顶层 |
| **总计** | **~175** | |

## 8. 微架构设计要点

### 分支预测
- 三级预测：L0 BTB (0-cycle) → BTB (1-cycle) → IBP/TAGE (multi-cycle)
- RAS 用于函数返回预测
- BHT 记录分支历史

### 内存子系统
- I-Cache 和 D-Cache 分离，均为 64KB 4 路
- L2 Cache 统一，1MB 16 路
- Store Buffer 24 项（16 读 + 8 写）
- 硬件预取器（I-Cache + D-Cache + L2）

### 乱序执行
- 64 项 ROB
- 物理寄存器池：GPR/FPR/VR 各 64
- 8 路动态发射
- 完整的寄存器重命名
- 加载-存储队列 (LSQ)

### 缓存一致性
- ACE 128-bit 全一致性接口
- MESI 协议（MOESI 子集）
- Snoop filter (L2)
- 多核缓存一致性广播

### 调试
- JTAG 调试接口
- 硬件断点（指令 + 数据）
- 实时跟踪 (ETM)
- 调试 ROM

---

*分析基于 openc910-main 源码 (Apache 2.0 许可证)，目录 `/Users/ai-work/ai-dv/0-PRJ/riscv-cpu/openc910-main`*
