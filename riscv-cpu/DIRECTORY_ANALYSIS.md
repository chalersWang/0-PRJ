# riscv-cpu 目录分析报告

> 分析时间：基于当前工作区快照 ｜ 工作目录：`/Users/ai-work/ai-dv/0-PRJ/riscv-cpu`

## 1. 总览

本目录是**RISC-V CPU 设计与验证工作区**，聚合了 4 个上游开源项目，形成
「两套待验证 DUT（C910 / E906） + 两套验证资产（riscv-tests 定向测试 / riscv-dv 随机激励）」的格局。

```
riscv-cpu/                        148 MB，git 跟踪 1983 个文件
├── AI操作.md                     操作提示：读 C910 RTL 的入口
├── C910_DESIGN_ANALYSIS.md       415 行  C910 微架构分析（已产出）
├── RISCV_DV_ANALYSIS.md          263 行  riscv-dv 框架分析（已产出）
├── RISCV_TESTS_ANALYSIS.md       380 行  riscv-tests 测试套件分析（已产出）
├── VERIFICATION_PLAN.md          223 行  验证规划（已产出）
│
├── openc910-main/                45 MB  阿里平头哥 C910（RV64 乱序多核）RTL + 仿真环境
├── opene906-main/                23 MB  阿里平头哥 E906（RV32 顺序单核）RTL + 仿真环境
├── riscv-dv-master/              21 MB  Google 约束随机指令流生成器（UVM/SV+Python）
├── riscv-tests-master/          3.2 MB  RISC-V 官方 ISA/特权态定向测试套件
└── *.zip (4 个, 共 ~57 MB)       源码包原件，**未被 git 跟踪**
```

## 2. 逐目录详情

### 2.1 `openc910-main/` — C910 DUT（主验证目标）

| 项目 | 内容 |
|------|------|
| 架构 | RV64GC，乱序超标量，1~4 核，L2 Cache、MMU、VFPU（向量浮点） |
| RTL | `C910_RTL_FACTORY/gen_rtl/` — **483 个 `.v`，414,907 行，0 个 `.sv`** |
| 模块分区 | `ifu / idu / iu / lsu / mmu / rtu / cp0 / biu / ciu / l2c / plic / clint / pmp / pmu / vfpu / vfalu / vfdsu / vfmau / had / fpga / common / clk / rst` |
| 文件清单 | `gen_rtl/filelists/C910_asic_rtl.fl`（486 条，含 `.h` 头文件） |
| 仿真环境 | `smart_run/`：`logical/`（SoC demo + TB）、`tests/`（用例）、`impl/`（SDC/UPF）、`setup/` |
| TB | `logical/tb/tb.v`、`tb_verilator.v`、`sim_main1.cpp`（**支持 Verilator 流程**） |
| 用例 | `tests/cases/`：`smoke / ISA(AMO,BARRIER,FP,IMAC,THEAD) / cache / csr / debug(gpr,memory) / exception / interrupt / MMU / sleep / coremark / hello_world` |
| 文档 | `doc/`：用户手册、集成手册、datasheet（3 份 PDF） |
| 许可 | Apache-2.0 |

关键：C910 走的是**商用 EDA 流程**（VCS `-full64 -kdb -lca`），同时保留了 Verilator 分支。

### 2.2 `opene906-main/` — E906 DUT（新加入，9 月新增）

| 项目 | 内容 |
|------|------|
| 架构 | RV32IMACF，顺序单发射，低功耗小核 |
| RTL | `E906_RTL_FACTORY/gen_rtl/` — **249 个 `.v`，106,499 行，0 个 `.sv`** |
| 模块分区 | `ifu / idu / iu / lsu / bmu / rtu / cp0 / biu / clic / clint / pmp / pmu / tdt(Debug) / tcipif / fpu / falu / fdsu / fmau / sysmap / dtm` |
| 文件清单 | `E906_asic_rtl.fl`（243 条）+ `tdt_dmi_top_rtl.fl`（调试子系统独立清单） |
| 仿真环境 | 结构同 C910，但**没有 Verilator 流程**，Makefile 仅 `iverilog / vcs` |
| 用例 | `debug_2wire_jtag / ISA(RV32F,RV32IMAC) / dhry / memset / memcp / debug / csr_rw_extend / coremark / hello_world` |
| 文档 | `doc/`：E906 用户手册 / 集成手册 / datasheet（20240627 版） |
| 许可 | Apache-2.0 |

**与 C910 的差异（重要）**：E906 的 TB 用 `mnt.v / uart_mnt.v / had_drv.h` 组合，
调试用 2-wire JTAG（TDT/DMI）；C910 是 `int_mnt.v` + Verilator C++ 顶层。二者
**不能共用同一套编译脚本**，验证环境需分别对接。

### 2.3 `riscv-dv-master/` — 随机指令流生成器

- **形态**：UVM SystemVerilog（`src/`、`euvm/`）+ Python 驱动（`run.py` 52 KB、`cov.py`、`pygen/`）。
- **架构**：`riscv_instr_gen_config → riscv_instr_stream → riscv_instr_sequence`，输出汇编 → 用 GCC 汇编成 ELF/hex。
- **现成 target**（`target/`）：`rv32i / rv32imc / rv32imafdc / rv32imc_sv32 / rv32imcb / rv64imc / rv64imcb / rv64gc / rv64gcv / rv64imafdc / multi_harts / ml`。
- **覆盖率**：支持 RV32/RV64、C/A/F/D、CSR、异常/中断、MMU/Sv32/Sv39、多核多线程、非法指令。
- **缺口**：**没有 T-Head C910/E906 的 target**（缺 `riscv_core_setting.sv` 定制：C910 特有 CSR、C910 自定义指令、E906 的 `e906f/nodsp` 配置）。

### 2.4 `riscv-tests-master/` — 定向测试套件

- `isa/` 共 **331 个 `.S` 测试**，`benchmarks/`（含 coremark 等 20+ 项）、`mt/`（多核 51 项）、`debug/`。
- 覆盖面：`rv32ui(40) rv64ui(52) rv32mi(14) rv64mi(16) rv64ua(19) rv64uc/ud/uf、rv64uzba/uzbb/uzbc/uzbs、rv64ssvnapot、rv64mzicbo` 等。
- **注意**：`env/` 是 **git submodule 且为空**（指向 riscv-test-env），直接 `make` 会失败。

## 3. 四者关系

```
              riscv-tests (定向)      riscv-dv (随机)
                     │                     │
              RV32/RV64 ELF  +  指令流 trace
                     ▼                     ▼
        ┌────────────────────────────────────────┐
        │        smart_run 仿真环境              │
        │  C910: iverilog / vcs / verilator      │
        │  E906: iverilog / vcs                  │
        └────────────────────────────────────────┘
                     ▼
        openc910-main  RTL        opene906-main  RTL
        （RV64 乱序多核）          （RV32 顺序单核）
```

- `riscv-tests` 与 `riscv-dv` 产出的 ELF/hex 可直接喂给 `smart_run/tests/`（smart_run 自带 `tests/lib` 链接脚本与 boot 代码）。
- 现有 4 份分析文档已覆盖 C910 设计、riscv-dv、riscv-tests 三块，并给出了验证规划；**尚无 E906 的分析文档**，验证规划也未纳入 E906。

## 4. 当前状态与风险

| 类别 | 观察 | 影响 |
|------|------|------|
| **无构建产物** | 全树无 `work/`、`obj_dir/`、`simv/` | 尚未跑通过任何一次仿真 |
| **工具缺失** | 本机只有 `python3`；**无 verilator / iverilog / vcs / xrun，无 RISC-V GCC** | 当前环境无法编译 RTL 或测试程序 |
| **压缩包冗余** | 4 个 `.zip` 共 ~57 MB，均**未被 git 跟踪**（untracked），内容与解压目录重复 | 仓库体积虚高，建议删除或加 `.gitignore` |
| **submodule 空** | `riscv-tests-master/env` 为空 | riscv-tests 无法直接 make |
| **E906 环境较弱** | 无 Verilator 支持、TB 结构不同、测试集更少 | 复用 C910 验证流程需改造 |
| **随机激励未对接** | riscv-dv 无 C910/E906 target | 需自建 `riscv_core_setting.sv` |
| **最近活动** | 9/13 新增 E906（commit `621bc7c`），随后同步了兄弟目录 `mpsoc` 的改动 | 重心正从 C910 扩展到 E906 / SoC 级 |
| **兄弟项目** | `../mpsoc`、`../canfd` 与本目录同属 `0-PRJ` 仓库，工作区有未提交改动 | 提交时注意不要混入无关变更 |

## 5. 建议的下一步（按优先级）

1. **补齐工具链**：安装 Verilator（C910 已有 `tb_verilator.v` + `sim_main1.cpp`，验证最快路径）+ RISC-V GCC（`riscv64-unknown-elf`）。
2. **先跑最小编译**：C910 用 `make buildVerilator` / E906 用 `make compile SIM=iverilog`，确认 RTL 语法与 filelist 完整。
3. **跑 smoke**：C910 `hello_world` / `smoke_bus`，E906 `hello_world`，打通「编译 → 加载 → 比对」闭环。
4. **接入 riscv-tests**：先修 `env` submodule，编译 `rv64ui-p-*` 喂给 C910 的 `tests/ISA` 流程。
5. **建 riscv-dv target**：从 `rv64imc` 复制，定制 C910（RV64GC + T-Head 扩展）与 E906（RV32IMACF, `nodsp`）的 `riscv_core_setting.sv`。
6. **补 E906 分析文档**，并把 E906 纳入 `VERIFICATION_PLAN.md`。
7. **清理仓库**：删除/忽略 4 个 zip，处理 `env` submodule。

## 6. 关键文件速查

| 用途 | 路径 |
|------|------|
| C910 RTL 入口 | `openc910-main/C910_RTL_FACTORY/gen_rtl/`（`AI操作.md` 指定） |
| C910 仿真 Makefile | `openc910-main/smart_run/Makefile` |
| C910 用例配置 | `openc910-main/smart_run/setup/smart_cfg.mk` |
| E906 仿真 Makefile | `opene906-main/smart_run/Makefile` |
| E906 用例配置 | `opene906-main/smart_run/setup/smart_cfg.mk` |
| riscv-dv 主驱动 | `riscv-dv-master/run.py` |
| riscv-dv target 模板 | `riscv-dv-master/target/rv64imc/riscv_core_setting.sv` |
| riscv-tests ISA | `riscv-tests-master/isa/rv64ui/`、`rv32ui/` |
