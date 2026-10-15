# CAN FD IP 验证环境 — 仿真回归指南

> 基于 AMD/Xilinx PG223 v3.0 | UVM 1.2 | VCS/Verdi
> 测试用例: 91 个 | 测试组: 7 个 | 更新时间: 2026-06-25

---

## 1. 环境准备

### 1.1 必需环境变量

| 变量 | 说明 | 默认值 |
|------|------|--------|
| `VERIFY_HOME` | 验证环境根目录 | `pwd` |
| `TESTPLAN_HOME` | 测试计划目录（含 group 子目录） | `pwd/testplan` |
| `VCS_HOME` | VCS 安装路径 | `pwd/vcs` |
| `VERDI_HOME` | Verdi 安装路径 | `pwd/verdi` |
| `TOOLS_HOME` | 工具目录 | `pwd/tools` |

> 5 个变量未设置时自动使用默认子目录，打印 `[WARN]` 警告。

### 1.2 SourceMe 示例

```bash
export VERIFY_HOME=/path/to/canfd
export TESTPLAN_HOME=$VERIFY_HOME/testplan
export VCS_HOME=/tools/synopsys/vcs/2023.12
export VERDI_HOME=/tools/synopsys/verdi/2023.12
```

---

## 2. 快速入门

```bash
cd $VERIFY_HOME/run

# 查看所有测试
python3 xrun -l

# 编译 + 仿真单个测试
python3 xrun -t T_01_01 -c -s

# 编译 + 仿真整组测试
python3 xrun -g T1_group -c -s
```

---

## 3. 命令行参数

| 参数 | 简写 | 类型 | 说明 |
|------|------|------|------|
| `--test` | `-t` | list | 指定测试名称列表 |
| `--group` | `-g` | list | 指定测试组列表 |
| `--comp` | `-c` | flag | 执行 VCS 编译 |
| `--sim` | `-s` | flag | 执行仿真 |
| `--list` | `-l` | flag | 列出全部测试用例 |
| `--num` | `-n` | int | 仿真迭代次数（默认 1） |
| `--parallel` | `-p` | int | 并行 worker 数（0=串行） |
| `--seed` | | int | 指定仿真种子 |
| `--cov` | | flag | 开启覆盖率收集 |
| `--covmerge` | | flag | 合并覆盖率数据库 |
| `--opencov` | | str | 打开覆盖率 GUI |
| `--fsdb` | | flag | 开启 FSDB 波形 |
| `--gls` | | flag | 门级仿真模式 |
| `--debug` | `-d` | flag | 调试模式 |
| `--log` | | flag | 打开仿真日志 |
| `--clean` | | flag | 清理 build 目录 |
| `--compcfg` | | str | 额外编译配置文件 |
| `--simcfg` | | str | 额外仿真配置文件 |
| `--tcl` | | str | 额外波形 TCL |

---

## 4. 测试组概览（91 用例 / 7 组）

| 组 | 用例 | 分类 | 主要内容 |
|----|------|------|----------|
| T1_group | 8 | T: 寄存器/中断 | 寄存器读写、软件复位、中断系统 |
| T2_group | 22 | B: CAN 通信 | CAN 2.0/CAN FD 帧收发、发送控制 |
| T3_group | 9 | R/S: 接收/特殊 | RX FIFO、Mailbox、时间戳、TDC |
| T4_group | 8 | M/E: 模式/错误 | 工作模式、Bus-Off、错误检测 |
| T5_group | 11 | E/I: 错误/接口 | 错误计数器、AXI4-Lite/APB、PEE |
| T6_group | 7 | C: 压力/角落 | 满载压力、边界条件 |
| T7_group | 15 | 综合回归 | 混合帧、CDC、综合场景 |

---

## 5. 常用工作流

### 5.1 冒烟测试
```bash
python3 xrun -g T1_group -c
python3 xrun -g T1_group -s -n 2
```

### 5.2 全量回归
```bash
python3 xrun -g T1_group T2_group T3_group T4_group T5_group T6_group T7_group -c -s
```

### 5.3 并行回归（推荐）
```bash
# 4 worker 并行
python3 xrun -g T2_group -s -p 4

# 8 worker 全量并行
python3 xrun -g T1_group T2_group T3_group T4_group T5_group T6_group T7_group -s -p 8
```

### 5.4 带覆盖率回归
```bash
python3 xrun -g T1_group T2_group -c --cov
python3 xrun -g T1_group T2_group -s --cov -p 4
python3 xrun --covmerge
python3 xrun --opencov verdi
```

### 5.5 门级仿真
```bash
# 需在 filelist/netlist.f 中配置网表路径
python3 xrun -g T1_group -c --gls
python3 xrun -g T1_group -s --gls
```

### 5.6 调试单个测试
```bash
python3 xrun -t B_03_02 -c -s --fsdb --seed 12345
verdi -ssf build/B_03_02/sim/12345/novas.fsdb &
```

---

## 6. 目录结构

```
canfd/
├── run/
│   ├── README.md                  # 本指南
│   ├── xrun                       # 主仿真脚本
│   ├── run                        # 简化启动脚本
│   ├── regression.py              # CI 回归入口
│   └── gen_dashboard.py           # 覆盖率 Dashboard
├── cfg/
│   ├── comp_base.cfg              # 编译选项（可选覆盖）
│   ├── sim_base.cfg               # 仿真选项
│   ├── coverage.cfg               # 覆盖率选项
│   ├── debug.cfg                  # 调试选项
│   └── assertion.cfg              # 断言选项
├── filelist/
│   ├── rtl.f / tb.f / vip.f       # 编译文件列表
│   ├── vhdl.f                     # VHDL 设计文件（可选）
│   ├── cmodel.f                   # C 参考模型
│   ├── netlist.f                  # 门级网表（GLS 模式）
│   └── *.k                        # 条件编译预处理
├── testcase/                      # 91 个 UVM 测试用例
├── testplan/                      # T1-T7 测试组 + test.json
├── env/                           # UVM 验证环境
├── regmodel/                      # 寄存器模型
├── tb/                            # Testbench 顶层
├── sva/                           # 接口/断言
└── uvc/                           # AXI4/APB/CANPHY VIP
```

---

## 7. 仿真结果判定

```
UVM_FATAL   → FAIL (FATAL)
UVM_ERROR   → FAIL (ERROR)
UVM TIMEOUT → FAIL (TIMEOUT)
UVM TEST FAILED → FAIL (FAILED)
UVM TEST PASSED → PASS
无日志      → EXCEPTION (no log)
日志不完整  → EXCEPTION (incomplete log)
```

终端输出带颜色：🟢 PASS / 🔴 FAIL / 🔴 EXCEPTION

回归结果持久化到：`build/<group>/comp/regression`

---

## 8. K 文件与 VHDL 支持

### K 文件（条件编译预处理）
```verilog
// rtl.k
`ifdef GATE_SIM
    ${VERIFY_HOME}/netlist/canfd_top.v
`else
    ${VERIFY_HOME}/rtl/canfd_top.v
`endif
```
根据 `compile.opt` 中 `+define+xxx` 自动展开，支持任意嵌套层级。

### VHDL 混合编译
在 `filelist/vhdl.f` 中添加 VHDL 文件，脚本自动追加 `-vhdl` 选项：
```tcl
// filelist/vhdl.f
-vhdl -work canfd_lib:${VERIFY_HOME}/../rtl/vhdl
${VERIFY_HOME}/../rtl/vhdl/canfd_core.vhd
```
无 VHDL 文件时自动跳过。

---

## 9. 故障排查

| 问题 | 原因 | 解决 |
|------|------|------|
| `VCS compilation failed` | RTL 语法错误 / license | 查看 `build/<group>/comp/compile.log` |
| `EXCEPTION (no log)` | 仿真未生成日志 | 检查 simv / 磁盘空间 |
| `No RegModel` | 寄存器模型未编译 | 确认 `REG_MODEL` 宏编译 |
| 并行卡住 | VCS license 不足 | 减少 `-p` 值 |

---

## 10. 命令速查

```bash
python3 xrun -l                                    # 列测试
python3 xrun -t T_01_01 -c -s                      # 编译+仿真单个
python3 xrun -g T1_group -c -s                     # 编译+仿真整组
python3 xrun -g T1_group -s -n 5                   # 迭代 5 次
python3 xrun -g T2_group -s -p 4                   # 4 并行
python3 xrun -g T1_group T2_group -c --cov         # 带覆盖率编译
python3 xrun -g T1_group T2_group -s --cov -p 4    # 带覆盖率并行仿真
python3 xrun --covmerge                            # 合并覆盖率
python3 xrun -t B_03_02 -c -s --fsdb --seed 99999  # 调试模式
python3 xrun --clean                               # 清理
```
