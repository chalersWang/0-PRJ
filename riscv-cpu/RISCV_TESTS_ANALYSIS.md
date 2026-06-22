# riscv-tests (RISC-V 指令集测试套件) 分析

## 1. 概述

riscv-tests 是 RISC-V **官方指令集测试套件**，提供完整的 ISA 功能测试、性能基准测试、调试测试和多线程测试。

| 项目 | 内容 |
|------|------|
| 源码路径 | `/Users/ai-work/ai-dv/0-PRJ/riscv-cpu/riscv-tests-master` |
| 仓库 | https://github.com/riscv-software-src/riscv-tests.git |
| 测试框架 | 测试虚拟机 (TVM) 模型 |
| 构建系统 | autoconf + Makefile |
| 目标平台 | 裸机 (physical) / 虚拟内存 (virtual) |

## 2. 测试框架架构 (TVM 模型)

### 2.1 测试虚拟机

每个测试运行于特定 **测试虚拟机 (TVM)** 内，TVM 定义了可用的寄存器、指令集、内存布局和测试接口：

| TVM | XLEN | 扩展 | 权限模式 |
|-----|------|------|----------|
| `rv32ui` | 32 | I (整数) | 用户 |
| `rv32si` | 32 | I (整数) | 监管 |
| `rv32mi` | 32 | I (整数) | 机器 |
| `rv64ui` | 64 | I (整数) | 用户 |
| `rv64uf` | 64 | I+F (浮点) | 用户 |
| `rv64uv` | 64 | I+F+V (向量) | 用户 |
| `rv64si` | 64 | I (整数) | 监管 |
| `rv64sv` | 64 | I+V (向量) | 监管 |

### 2.2 目标环境

| 环境 | 说明 |
|------|------|
| `p` (physical) | 虚拟内存关闭，仅核心 0 启动 |
| `v` (virtual) | 虚拟内存开启 (Sv39/Sv32) |
| `pm` (physical multi) | 虚拟内存关闭，所有核心启动 |
| `pt` (physical timer) | 虚拟内存关闭，定时器每 100 周期触发 |

### 2.3 构建系统

```bash
# autoconf 配置
./configure --with-xlen=64

# 编译所有 ISA 测试
make

# 编译特定子集
make rv64ui
make rv64mi
```

每个测试编译两次:
- `rv64ui-p-add`: 物理环境 (env/p/link.ld)
- `rv64ui-v-add`: 虚拟内存环境 (env/v/link.ld)

输出文件:
- `.dump`: 反汇编文件
- `.out`: 仿真器运行日志

<div style="page-break-after: always;"></div>

## 3. ISA 测试覆盖分析

### 3.1 测试目录总览

| 目录 | 测试数 | 覆盖范围 |
|------|--------|----------|
| `rv32ui/` | 41 | RV32I 整数指令 (委派给 rv64ui) |
| `rv64ui/` | 48 | RV64I 整数指令 |
| `rv32um/` | 8 | RV32M 乘除 (委派) |
| `rv64um/` | 12 | RV64M 乘除 |
| `rv32ua/` | 10 | RV32A 原子 (委派) |
| `rv64ua/` | 18 | RV64A 原子 |
| `rv32uf/` | 11 | RV32F 单精度浮点 (委派) |
| `rv64uf/` | 11 | RV64F 单精度浮点 |
| `rv32ud/` | 11 | RV32D 双精度浮点 (委派) |
| `rv64ud/` | 12 | RV64D 双精度浮点 |
| `rv32uc/` | 1 | RV32C 压缩 (委派) |
| `rv64uc/` | 1 | RV64C 压缩 |
| `rv32mi/` | 14 | RV32 机器模式 (委派) |
| `rv64mi/` | 16 | RV64 机器模式 |
| `rv32si/` | 6 | RV32 监管模式 (委派) |
| `rv64si/` | 7 | RV64 监管模式 |
| `rv32uzba/` | 3 | RV32 Zba 地址生成 (委派) |
| `rv64uzba/` | 8 | RV64 Zba 地址生成 |
| `rv32uzbb/` | 18 | RV32 Zbb 位操作 (委派) |
| `rv64uzbb/` | 23 | RV64 Zbb 位操作 |
| `rv32uzbc/` | 3 | RV32 Zbc 无进位乘法 (委派) |
| `rv64uzbc/` | 3 | RV64 Zbc 无进位乘法 |
| `rv32uzbs/` | 8 | RV32 Zbs 单比特操作 (委派) |
| `rv64uzbs/` | 8 | RV64 Zbs 单比特操作 |
| `rv32uzfh/` | 11 | RV32 Zfh 半精度浮点 (委派) |
| `rv64uzfh/` | 11 | RV64 Zfh 半精度浮点 |
| `rv64ssvnapot/` | 1 | Svnapot 页表 |
| `rv64mzicbo/` | 1 | Zicbo 缓存块操作 |

> 注: rv32* 目录仅存根包含 rv64* 文件，通过宏重定义实现。

### 3.2 rv64ui 指令覆盖 (48 个测试)

**算术/逻辑**: add, addi, and, andi, or, ori, xor, xori, sub
**移位**: sll, slli, slliw, sllw, sra, srai, sraiw, sraw, srl, srli, srliw, srlw
**比较**: slt, slti, sltiu, sltu
**加载**: lb, lbu, ld, lh, lhu, lw, lwu
**存储**: sb, sd, sh, sw
**分支**: beq, bge, bgeu, blt, bltu, bne
**跳转**: jal, jalr
**立即数**: lui, auipc
**其他**: fence_i, simple, ma_data (非对齐数据)

### 3.3 rv64um 指令覆盖 (12 个测试)

mul, mulh, mulhsu, mulhu, div, divu, divw, divuw, mulw, rem, remu, remuw, remw

### 3.4 rv64ua 指令覆盖 (18 个测试)

lrsc (LR/SC), amoadd_w/d, amoand_w/d, amomax_w/d, amomaxu_w/d,
amomin_w/d, amominu_w/d, amoor_w/d, amoswap_w/d, amoxor_w/d

### 3.5 机器模式 (rv64mi, 16 个测试)

| 测试 | 覆盖内容 |
|------|----------|
| `csr.S` | CSR 读写 (mstatus/mcause/mepc/mtval 等) |
| `mcsr.S` | 机器模式特定 CSR (misa/mvendorid/marchid 等) |
| `illegal.S` | 非法指令陷阱、WFI、SFENCE.VMA、SRET |
| `breakpoint.S` | 硬件断点 (tselect/tdata1/tdata2/mcontrol) |
| `scall.S` | ECALL 环境调用 |
| `sbreak.S` | EBREAK 断点指令 |
| `access.S` | 内存访问权限检查 |
| `ma_fetch.S` | 非对齐取指 |
| `ma_addr.S` | 非对齐加载/存储 |
| `ld-misaligned.S` | 非对齐加载异常 |
| `lh-misaligned.S` | 非对齐半字加载 |
| `lw-misaligned.S` | 非对齐字加载 |
| `sd-misaligned.S` | 非对齐双字存储 |
| `sh-misaligned.S` | 非对齐半字存储 |
| `sw-misaligned.S` | 非对齐字存储 |
| `zicntr.S` | 计数器寄存器 (mcycle/minstret) |

### 3.6 监管模式 (rv64si, 7 个测试)

| 测试 | 覆盖内容 |
|------|----------|
| `csr.S` | 监管 CSR (sstatus/sepc/scause/stvec/sscratch/satp) + 用户模式转换 |
| `dirty.S` | 脏页管理 |
| `icache-alias.S` | I-Cache 别名 |
| `ma_fetch.S` | 监管模式非对齐取指 |
| `scall.S` | 监管 ECALL |
| `sbreak.S` | 监管 EBREAK |
| `wfi.S` | WFI 等待中断 |

## 4. 典型测试结构

### 4.1 测试模板 (以 add.S 为例)

```asm
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U                // 声明 TVM = RV64 用户整数
RVTEST_CODE_BEGIN           // 测试代码开始

  // === 阶段 1: 操作数组合 (15 种) ===
  TEST_RR_OP( 2,  add, 0x00000000, 0x00000000, 0x00000000 );
  TEST_RR_OP( 3,  add, 0x00000002, 0x00000001, 0x00000001 );
  // ... 零 / 正 / 负 / 符号扩展 / 最大值

  // === 阶段 2: 源/目标复用 ===
  TEST_RR_SRC1_EQ_DEST( 17, add, 24, 13, 11 );
  TEST_RR_SRC2_EQ_DEST( 18, add, 25, 14, 11 );
  TEST_RR_SRC12_EQ_DEST( 19, add, 26, 13 );

  // === 阶段 3: 转发旁路 ===
  TEST_RR_DEST_BYPASS( 20, 0, add, 24, 13, 11 );  // 0 nop
  TEST_RR_DEST_BYPASS( 21, 1, add, 25, 14, 11 );  // 1 nop
  TEST_RR_DEST_BYPASS( 22, 2, add, 26, 15, 11 );  // 2 nop

  // === 阶段 4: 零寄存器 ===
  TEST_RR_ZEROSRC1( 35, add, 15, 15 );
  TEST_RR_ZERODEST( 38, add, 16, 30 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN
  TEST_DATA
RVTEST_DATA_END
```

### 4.2 核心宏定义

| 宏 | 作用 | 说明 |
|----|------|------|
| `TEST_RR_OP( n, inst, result, val1, val2 )` | R型指令测试 | 加载 val1/val2，执行 inst，验证 result |
| `TEST_BR2_OP_TAKEN( n, inst, val1, val2 )` | 分支已跳转 | 前向和后向跳转验证 |
| `TEST_BR2_OP_NOTTAKEN( n, inst, val1, val2 )` | 分支未跳转 | 条件不满足时验证 |
| `TEST_RR_DEST_BYPASS( n, nops, inst, result, v1, v2 )` | 目标旁路测试 | 0/1/2 个 nop 延迟后使用结果 |
| `TEST_RR_SRC12_BYPASS( n, nops1, nops2, inst, result, v1, v2 )` | 源旁路测试 | 源来自不同延迟的指令 |
| `TEST_RR_ZEROSRC1( n, inst, result, val )` | x0 作为源 | 验证 x0 始终为 0 |
| `TEST_CASE( n, testreg, correct, code... )` | 基础断言 | 执行代码，验证 testreg == correct |
| `TEST_PASSFAIL` | 通过/失败 | 根据 TESTNUM 决定 |

### 4.3 每个指令的测试维度

以 add.S 为例，74 个测试点覆盖:

| 维度 | 测试号 | 覆盖场景 |
|------|--------|----------|
| 操作数组合 | 2-16 | 0+0=0, 1+1=2, 3+7=10, -0x8000+0, -0x80000000+0, 全1+1=0, 溢出等 |
| 源=目标 | 17-19 | rd=rs1, rd=rs2, rd=rs1=rs2 |
| 目标旁路 | 20-22 | 0/1/2 级 nop 延迟使用结果 |
| 源12旁路 | 23-28 | src1/src2 来自 0/1/2 级前的指令 |
| 源21旁路 | 29-34 | 源以相反顺序加载 |
| 零源1 | 35 | x0 作为 src1 |
| 零源2 | 36 | x0 作为 src2 |
| 双零源 | 37 | x0+x0=0 |
| 零目标 | 38 | 写入 x0 应该无效果 |

## 5. Benchmark 分析

### 5.1 目录

```
benchmarks/
├── common/        # 共享运行时
├── dhrystone/     # Dhrystone V2.1 综合整数基准
├── median/        # 中值滤波 (排序网络)
├── qsort/         # 快速排序
├── rsort/         # 基数排序
├── towers/        # 汉诺塔 (递归测试)
├── vvadd/         # 向量-向量加法
├── multiply/      # 软件乘法 (移位加)
├── mm/            # 矩阵乘法 (阻塞算法)
├── spmv/          # 稀疏矩阵-向量乘法 (CRS 格式)
├── memcpy/        # 内存复制
├── pmp/           # 物理内存保护
├── mt-vvadd/      # 多线程向量加法
├── mt-matmul/     # 多线程矩阵乘法
├── mt-memcpy/     # 多线程内存复制
├── vec-daxpy/     # 向量化 DAXPY (RVV 汇编)
├── vec-memcpy/    # 向量化 memcpy (RVV 汇编)
├── vec-sgemm/     # 向量化 SGEMM (RVV 汇编)
└── vec-strcmp/    # 向量化 strcmp (RVV 汇编)
```

### 5.2 运行时环境

**启动代码** (`benchmarks/common/crt.S`):
- 清零所有寄存器
- 初始化 GP/SP/TP
- 启用浮点 (mstatus.FS)
- 设置 mtvec 到 trap_entry
- 调用 main()
- main 返回后写入 tohost

**系统调用** (`benchmarks/common/syscalls.c`):
- 通过 tohost/fromhost 内存魔法实现
- 支持: printf/sprintf/exit/read/write 等
- `setStats(n)`: 采样 mcycle/minstret

**内存映射** (`benchmarks/common/test.ld`):
- 0x80000000: 启动代码入口
- 0x80001000: tohost/fromhost 通信区
- 栈: 每个核心 128KB

## 6. 调试测试

### 6.1 测试框架

```
debug/
├── gdbserver.py        # Python 驱动测试框架
├── programs/           # 测试程序源码
│   ├── debug.c         # CRC/ROT13 基础调试测试
│   ├── regs.S          # 寄存器读写测试
│   ├── trigger.S       # 硬件触发/断点测试
│   ├── step.S          # 单步 (beq/jal/jr/nop/非法)
│   ├── ebreak.S        # EBREAK 行为
│   ├── interrupt.c     # 中断+调试交互
│   └── multicore.c     # 多核调试
└── targets/            # 目标配置
    ├── RISC-V/         # Spike 模拟器目标
    └── SiFive/         # SiFive 硬件目标
```

### 6.2 运行方式

```bash
# 单核 Spike 调试测试
./gdbserver.py targets/RISC-V/spike64.py SimpleS0Test
```

流程: Spike → OpenOCD → GDB → 执行测试序列 → 验证结果

## 7. 多线程测试

### 7.1 mt/ 目录 (torture 测试)

```
mt/
├── vvadd0-4.c        # 5 个多线程向量加法测试
└── {xx}_matmul.c     # 40+ 个随机矩阵乘法测试 (ad~自定义命名)
```

特点:
- 每个核心 2 个线程
- 随机数据生成 (通过 Perl 脚本)
- 使用 AMO 和 barrier 同步

### 7.2 多线程 Benchmark

- `benchmarks/mt-vvadd/`: 按 coreid 划分工作区间
- `benchmarks/mt-matmul/`: 多核矩阵分块
- `benchmarks/mt-memcpy/`: 多核并行复制

使用 `barrier()` (来自 `util.h`) 进行同步点控制。

## 8. 关键文件清单

### 测试框架核心
```
isa/macros/scalar/test_macros.h   # 测试宏库 (TEST_CASE 等)
isa/Makefile                       # ISA 测试构建
benchmarks/common/crt.S            # 启动代码
benchmarks/common/syscalls.c       # 系统调用
benchmarks/common/util.h           # 验证工具函数
```

### 测试入口
```
env/p/riscv_test.h     # 物理环境 TVM 头文件 (需外部提供)
env/v/riscv_test.h     # 虚拟环境 TVM 头文件 (需外部提供)
env/p/link.ld           # 物理环境链接脚本
env/v/link.ld           # 虚拟环境链接脚本
```

> ⚠️ **注意**: `env/` 目录当前为空，`riscv_test.h` 和 `link.ld` 需由目标平台提供。

### 重要测试文件
```
isa/rv64ui/simple.S         # 最小通过/失败测试
isa/rv64ui/add.S            # 算术测试模板 (74 个测试点)
isa/rv64ui/ma_data.S        # 非对齐数据访问 (380+ 行，最大测试文件)
isa/rv64mi/breakpoint.S     # 硬件断点 (执行/加载/存储触发)
isa/rv64mi/illegal.S        # 非法指令 + WFI/SFENCE/SRET

benchmarks/dhrystone/       # Dhrystone 性能基准
benchmarks/mm/mm.c          # 优化矩阵乘法
benchmarks/spmv/spmv_main.c # 稀疏矩阵-向量乘法

debug/programs/trigger.S    # 硬件触发测试
debug/programs/step.S       # 单步指令测试
```

## 9. 与 C910 验证的关联

| 测试类型 | 测试内容 | 对应 C910 模块 |
|----------|----------|---------------|
| rv64ui/* | RV64I 整数指令功能 | IU (ALU/BJU/Div/Mult) |
| rv64um/* | 乘除扩展指令功能 | IU (Mult/Div) |
| rv64ua/* | 原子操作 (AMO/LR/SC) | LSU (AMR) |
| rv64uf/* | 浮点指令功能 | VFALU/VFMAU |
| rv64ud/* | 双精度浮点 | VFALU/VFDSM |
| rv64mi/* | 机器模式 CSR/异常/中断 | CP0/RTU |
| rv64si/* | 监管模式/页表 | MMU/PTU |
| rv64uc/* | 压缩指令 | IDU (解码) |
| rv64uzb* | 位操作扩展 | IU (ALU) |
| benchmarks/* | 性能/压力测试 | 全系统集成 |
| debug/* | JTAG 调试 | HAD |
| mt/* | 多核一致性 | BIU/ACE/L2C |

---

*分析基于 riscv-tests-master 源码，目录 `/Users/ai-work/ai-dv/0-PRJ/riscv-cpu/riscv-tests-master`*
