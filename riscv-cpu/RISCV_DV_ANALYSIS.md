# riscv-dv (Google RISC-V DV 验证框架) 分析

## 1. 概述

riscv-dv 是 Google 开源的 **SV/UVM/Python 随机指令生成器** (Apache 2.0)，专门用于 RISC-V 处理器验证。核心理念：**约束随机生成 -> RTL 仿真 vs ISS 指令轨迹对比**。

### 版本信息

| 项目 | 内容 |
|------|------|
| 源码路径 | `/Users/ai-work/ai-dv/0-PRJ/riscv-cpu/riscv-dv-master` |
| 仓库 | https://github.com/google/riscv-dv.git |
| 许可证 | Apache 2.0 |
| SV/UVM 版本 | UVM 1.2 |
| Python 版本 | 3.x (pyflow) |

## 2. 三种等价的生成器实现

| 实现 | 语言 | 位置 | 适用场景 |
|------|------|------|----------|
| **SV/UVM** | SystemVerilog + UVM | `src/` | 商业仿真器 (VCS/Xcelium/Questa) |
| **pyflow** | Python + PyVSC | `pygen/pygen_src/` | 快速迭代，无需商业 EDA |
| **eUVM** | D 语言 + eUVM | `euvm/` | 开源 eUVM 框架 |

## 3. 验证流程

```
run.py ──> 加载配置 (target/testlist) ──> 编译生成器
                                   │
                   ┌───────────────┴───────────────┐
                   ▼                               ▼
          指令生成 (随机汇编 .S)            pyflow (Python 直接输出)
                   │
                   ▼
          RISC-V GCC 编译 (.S → ELF)
                   │
           ┌───────┴───────┐
           ▼               ▼
      RTL 仿真         ISS 仿真
      (VCS/irun)       (Spike/OVPsim)
           │               │
       trace log        trace log
           │               │
           └───────┬───────┘
                   ▼
          instr_trace_compare.py
           (GPR 轨迹逐条对比)
                   │
            PASS / FAIL
```

### 运行命令

```bash
# 完整流程 (RV64GC, Spike ISS)
python3 run.py --target rv64gc --steps all

# 仅生成指令流
python3 run.py --target rv64gc --steps gen

# pyflow 模式（无需 RTL 仿真器）
python3 run.py --target rv64gc --simulator pyflow --steps gen

# 固定种子复现
python3 run.py --target rv64gc --seed 12345

# 双 ISS 交叉对比
python3 run.py --target rv64gc --iss spike,ovpsim
```

## 4. 指令生成原理

### 4.1 配置层

`riscv_instr_gen_config` 定义所有随机化参数:

| 参数 | 作用 |
|------|------|
| `main_program_instr_cnt` | 主程序指令数 |
| `num_of_sub_program` | 子程序数量 |
| `enable_floating_point` | 启用浮点指令 |
| `disable_compressed_instr` | 禁用压缩指令 |
| `illegal_instr_ratio` | 非法指令插入比例 (N/1000) |
| `hint_instr_ratio` | HINT 指令比例 |
| `instr_category_dist` | 指令类别分布 (算术/访存/分支等) |
| `directed_instr_0~N` | 定向指令流 (名称, 权重) |

### 4.2 指令选择

`riscv_instr.create_instr_list()` 构建指令列表:
1. 遍历 `instr_registry` 注册表
2. 检查指令是否在 `supported_isa` 中
3. 按类别分类 (ARITHMETIC/LOAD/STORE/BRANCH/CSR/SYSTEM)
4. `get_rand_instr()` 按权重随机选取

### 4.3 程序生成

`riscv_asm_program_gen.gen_program()` 生成完整汇编:

```
├── CRT0 初始化 (SP/GP/TP 设置)
├── 主程序 (随机指令流 + 定向流)
├── 子程序 (多个, 带栈帧推入/弹出)
├── JAL/JALR 跳转到子程序
├── 数据页 (随机初始化数据)
├── 页表 (虚拟内存模式下随机化)
├── 异常/中断处理例程
└── 调试 ROM (调试模式开启时)
```

### 4.4 指令序列生成

`riscv_instr_sequence.gen_instr()`:
1. 创建指定数量的指令对象
2. `post_randomize()` 随机化操作数 (rs1/rs2/rd/imm)
3. 混合随机流与定向流 (load/store 序列、循环等)
4. 为分支分配有效的前向跳转目标 (避免死循环)
5. 插入非法指令 (随机非法编码)
6. 插入 HINT 指令 (压缩指令 HINT 编码)

## 5. ISA 配置文件结构

### 5.1 指令定义 (`src/isa/`)

使用 `DEFINE_INSTR` 宏注册指令，按 ISA 扩展分组:

| 文件 | 覆盖的扩展 |
|------|-----------|
| `rv32i_instr.sv` | RV32I 基础 (54条: LOAD/STORE/SHIFT/ARITH/LOGIC/BRANCH/JUMP/SYSTEM/CSR) |
| `rv64i_instr.sv` | RV64I 扩展 (ADDIW/SLLIW/SRLIW/SRAIW/ADDW/SUBW/SLLW/SRLW/SRAW/LWU/LD/SD) |
| `rv32m_instr.sv` | RV32M (MUL/MULH/MULHSU/MULHU/DIV/DIVU/REM/REMU) |
| `rv64m_instr.sv` | RV64M (MULW/DIVW/DIVUW/REMW/REMUW) |
| `rv32a_instr.sv` | RV32A (LR.W/SC.W/AMOADD.W/AMOXOR.W/AMOAND.W/AMOOR.W/AMOMIN.W/AMOMAX.W) |
| `rv64a_instr.sv` | RV64A (LR.D/SC.D/AMOADD.D/AMOXOR.D 等) |
| `rv32f_instr.sv` | RV32F 单精度浮点 |
| `rv64f_instr.sv` | RV64F 单精度浮点 |
| `rv32d_instr.sv` | RV32D 双精度浮点 |
| `rv64d_instr.sv` | RV64D 双精度浮点 |
| `rv32c_instr.sv` | RV32C 压缩指令 |
| `rv64c_instr.sv` | RV64C 压缩指令 |
| `rv32v_instr.sv` | RVV 向量扩展 (450+ 指令) |
| `rv32b_instr.sv` | RV32B 位操作 |
| `rv64b_instr.sv` | RV64B 位操作 |
| `riscv_zba_instr.sv` | Zba 地址生成 |
| `riscv_zbb_instr.sv` | Zbb 基础位操作 |
| `riscv_zbc_instr.sv` | Zbc 进位/借位 |
| `riscv_zbs_instr.sv` | Zbs 单比特操作 |
| `custom/*` | 用户自定义指令扩展 |

### 5.2 Target 配置 (`target/`)

每个 target 包含三个文件:
- `riscv_core_setting.sv`: 核心配置
- `testlist.yaml`: 测试列表
- `riscvOVPsim.ic`: OVPsim 配置文件 (可选)

| Target | XLEN | 权限模式 | 分页 | 关键特性 |
|--------|------|----------|------|----------|
| `rv32imc` | 32 | M Only | BARE | 最简配置 |
| `rv32imafdc` | 32 | M Only | BARE | +FP+Atom |
| `rv64imc` | 64 | M Only | BARE | 64位最小 |
| `rv64gc` | 64 | U+S+M | SV39 | **最丰富**, 含自定义指令 |
| `rv64gcv` | 64 | M Only | BARE | +RVV 向量扩展 |
| `rv32imc_sv32` | 32 | U+S+M | SV32 | 32位分页 |
| `rv32imcb` | 32 | M Only | BARE | +B 位操作 |
| `multi_harts` | 64 | M Only | BARE | 多核测试 |

## 6. 核心 SV/UVM 组件

| 类/文件 | 职责 |
|---------|------|
| `riscv_instr_gen_config` | 生成器配置（所有随机化参数） |
| `riscv_asm_program_gen` | 汇编程序生成器核心 |
| `riscv_instr_sequence` | 指令序列生成（随机+定向混合） |
| `riscv_instr_stream` | 指令流操作基类 |
| `riscv_load_store_instr_lib` | 访存指令流库（随机、多页、Hazard） |
| `riscv_directed_instr_lib` | 定向指令流库（跳转、边界） |
| `riscv_amo_instr_lib` | 原子指令流库 |
| `riscv_loop_instr` | 循环指令生成 |
| `riscv_callstack_gen` | 调用栈生成 |
| `riscv_data_page_gen` | 数据页生成 |
| `riscv_page_table*` | 页表结构生成 |
| `riscv_privil_reg` | 特权寄存器模型 |
| `riscv_illegal_instr` | 非法指令生成 |
| `riscv_debug_rom_gen` | 调试 ROM 生成 |
| `riscv_vector_cfg` | 向量扩展配置 |
| `riscv_pmp_cfg` | PMP 配置 |
| `riscv_instr_cover_group` | 功能覆盖率模型 |

## 7. Testlist 层级

```
yaml/base_testlist.yaml (基础)
  ├── rv32imc/testlist.yaml (+无压缩、HINT、PMP 测试)
  │     └── rv32imafdc/testlist.yaml (+FP 测试)
  │           └── rv32imcb/testlist.yaml (+B 扩展测试)
  │
  └── rv64imc/testlist.yaml
        └── rv64gc/testlist.yaml (+特权模式、页表、AMO、浮点压力)
              └── rv64gcv/testlist.yaml (+向量指令)
```

## 8. ISS 支持

| ISS | 命令 | 配置 | 特性 |
|-----|------|------|------|
| **Spike** | `spike --log-commits` | `yaml/iss.yaml` | RISC-V 官方参考模型 |
| **OVPsim** | `riscvOVPsimPlus` | `yaml/iss.yaml` + `.ic` | Imperas 商业 ISS |
| **Sail-riscv** | `sail_cheri_riscv` | `yaml/iss.yaml` | 形式化定义模型 |
| **Whisper** | `whisper` | `yaml/iss.yaml` | Tenstorrent ISS |
| **Renode** | `renode` | `yaml/iss.yaml` | Antmicro 开源框架 |

## 9. pyflow (Python 生成器)

Python 实现的等价替代，无需商业 EDA:

```
pygen/pygen_src/
├── riscv_instr_gen_config.py   # 配置 (PyVSC)
├── riscv_asm_program_gen.py    # 程序生成
├── riscv_instr_pkg.py          # 类型定义
├── isa/                        # 指令定义
│   ├── riscv_instr.py          # 基类
│   ├── rv32i_instr.py          # RV32I
│   └── ...
└── test/                       # 测试
    ├── riscv_instr_base_test.py
    └── riscv_rand_instr_test.py
```

## 10. 与 C910 验证的关联分析

riscv-dv 可为 C910 提供：

| 验证能力 | 说明 |
|---------|------|
| **随机指令生成** | 自动生成 RV64GC + T-Head 自定义指令的随机流 |
| **RTL vs ISS 对比** | 自定义 ISS 或 Spike 对比 C910 RTL 仿真轨迹 |
| **CSR 随机化** | C910 所有特权 CSR 的随机访问测试 |
| **MMU 压力** | 随机页表配置 + 地址翻译 + SFENCE.VMA |
| **中断/异常** | 随机中断注入 + 异常处理路径测试 |
| **多核一致性** | ACE 一致性协议的随机访存序列测试 |
| **向量指令** | RVV 向量扩展的随机指令生成 |
| **调试模式** | JTAG 调试 + 硬件断点随机测试 |

### 集成方式

```bash
# 1. 创建自定义 C910 target 配置
mkdir -p target/c910
cp target/rv64gc/* target/c910/
# 修改 riscv_core_setting.sv 以匹配 C910 的 ISA 和 CSR

# 2. 添加 T-Head 自定义指令支持
# 编辑 src/isa/custom/ 下的扩展文件

# 3. 运行验证
python3 run.py --target c910 --simulator vcs --steps all
```

---

*分析基于 riscv-dv-master 源码 (Apache 2.0)，目录 `/Users/ai-work/ai-dv/0-PRJ/riscv-cpu/riscv-dv-master`*
