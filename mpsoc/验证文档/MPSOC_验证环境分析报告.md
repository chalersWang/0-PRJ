# MPSoC 验证环境 —— 读取分析与自洽性验证报告

- 分析对象：`/Users/ai-work/ai-dv/0-PRJ/mpsoc/mpsoc/`（UVM 验证环境）
- 关联文档：`设计文档/`、`验证文档/`、`IP/`
- 分析方式：全量静态阅读 + 脚本化一致性校验（本机无 EDA 工具，未编译）
- 分析日期：见文件修改时间

---

## 0. 结论速览

| 维度 | 结论 |
| --- | --- |
| 目录/分层结构 | ✅ 完整，19 个 UVC 各 9 文件，层级规范 |
| 顶层端口契约 | ✅ `interface.md` 顶层段 57 端口 ↔ `dutinst.sv` 57 端口，**名称/位宽/方向 100% 一致，0 缺失 0 多余** |
| 代码自洽性 | ✅ `import`/`` `include `` 全闭合，21 个 package 均有定义；88 个 test 文件类名与文件名 100% 一致 |
| 可编译性 | ❌ **不能编译**：缺 DUT RTL；`tb_top` 作用域内 2 处标识符重复声明；6 个 driver 对 `wire` 型 inout 做过程赋值；`run/xrun` 分组 filelist 陈旧（8/19 UVC）；`make comp` 引用 5 个不存在的文件 |
| 可仿真性 | ❌ DUT 时钟未接 TB 时钟源（DUT 永远无时钟）；`mpsoc_event` 配置缺失会触发 `uvm_fatal`；`starting_phase` 从未设置 → objection 体系失效 |
| 激励完备度 | ⚠️ 19 个 driver 中仅 **6 个**有真实时序（dma/i2c/sdram/spi/tim/wdt），13 个为 TODO 桩 |
| 比对完备度 | ❌ 19 个 `write_xx()` 全部为打印桩；86 个 case 中 **0 个**含 `uvm_error`；10 个 C 骨架无条件 `return 0` → **回归结果无信号量** |
| 断言层 | ❌ `sva/code/` 10 个文件**全部 0 字节** |
| 功能覆盖率 | ❌ 10 个 covergroup 文件存在，但被未定义的 `COVERAGE_*` 宏包裹；且其中 4 个文件字段名带 `inout` 前缀错误，**启用即编译失败** |
| 回归矩阵 | ❌ 7 个 group 的 `test.json` 完全同 MD5，21 条 entry 只映射 1 个 test 类 |
| 文档一致性 | ❌ `ARCHITECTURE.md` 12 处仍描述「8 个 UVC」，与代码的 19 个不符；测试清单 72/75/88/103 四个数字互不收敛 |

**一句话结论**：这是一套**框架完整、结构规范、但尚未"活起来"**的 UVM 环境——骨架（分层、UVC 模板、filelist、regmodel）已就位，然而 DUT RTL 缺失、DUT 时钟未连通、回归与覆盖率未真正接入，当前**不具备可运行的验证能力**。

---

## 1. 环境规模统计

| 层 | 路径 | 代码行数 | 文件数 |
| --- | --- | --- | --- |
| TB 顶层 | `tb/` | 283 | 5 |
| 环境层 | `env/` | 870 | 7 |
| UVC 层 | `uvc/` | 16,278 | 171（19×9） |
| UVC VIP 封装 | `uvc/VIP/` | 52 | 45 |
| 测试用例 | `testcase/` | 5,496 | 88 个 `*_test.sv`（77 自研 + 11 VIP demo） |
| 断言 | `sva/` | 122（`define_lib.v`）+ **0（`code/*.sv` 全空）** | 15 |
| 覆盖率 | `coverage/code/` | 224 | 12 |
| 寄存器模型 | `regmodel/` | 647 | 3 |

- 顶层 DUT 端口：**57 个**（`tb/dutinst.sv`），全部集中在 **8 个**外设接口上。
- `设计文档/interface.md` 顶层接口段（第一个 `## interface`）也恰好是 **57 个**端口 → 与 `dutinst.sv` **逐字一致**（详见 §6.1）。
- `interface.md` 其余 21 个章节（rvcore/security/dmac/qspi/sram/sdram/gmac/esc0/esc1/i2c/pmu/wdt/timer/stimer/uart0/gpio/wic/uc2apb/spi2apb/mem2apb/pn-irt）描述的是**模块内部接口**，全书共 846 条带方向信号行；这些内部接口在当前环境中**没有对应的验证承载**。

---

## 2. 运行流程现状（两条并存的链路）

环境里存在**两套互不同步**的构建流程，`readme` 只描述了其中一套：

### 链路 A：`run/xrun`（Python，`readme` 推荐）
```
source SourceMe
run/xrun -l                          # 列 case
run/xrun -g T1_group -t mpsoc_demo_test_1 -c   # 编译
run/xrun -g T1_group -t mpsoc_demo_test_1 -s   # 仿真
```
- 读取 `testplan/<group>/{rtl,tb,vip,cmodel}.f` + `test.json`（`run/xrun:150-175`，对 4 个 `.f` 与 `test.json` 有 `assert`）。
- 读取 `cfg/comp_base.cfg`、`cfg/sim_base.cfg`、`cfg/coverage.cfg`（`run/xrun:408-473`）。

### 链路 B：顶层 `Makefile` → `run/Makefile`
```
make comp TC=mpsoc_demo_test
make sim  TC=mpsoc_demo_test
```
- 读取 `filelist/{rtl,tb,vip}.f`。

**两条链路使用的 filelist 内容不一致**，这是当前最直接的阻断点（见 3.1）。

---

## 3. 阻断级问题（必须修复才能编译/仿真）

### 3.1 【阻断】分组 filelist 陈旧，缺 11 个 UVC 包

- `env/mpsoc_EnvTop.svh:26-44` 与 `testcase/mpsoc_TestTop.svh:25-43` 均 `import` **19 个** `*_UvcTop::*`（含 i2c/spi/wdt/tim/uc/sdram/security/dma/pn_irt/esc/gmac）。
- 但 `testplan/T1_group/tb.f`（T2~T7 **与之逐字节相同**）只收录 **8 个** UVC 的 `_vif.sv` / `_UvcTop.svh`（sysctrl/jtag/uart/gpio/qspi/switch/miiphy/efuse）。
- 而 `filelist/tb.f` 已更新为 **19 个**。

> 证据：`grep -c 'uvc/.*_UvcTop.svh' filelist/tb.f` = **19**；`testplan/T1_group/tb.f` = **8**。

**影响**：走 `run/xrun` 编译时，11 个 package 未定义 → 编译必然失败。
**修复**：把 `filelist/tb.f` 同步覆盖到 `testplan/T{1..7}_group/tb.f`，或让分组 filelist 改为 `-f ${VERIFY_HOME}/filelist/tb.f` 引用。

### 3.2 【阻断】DUT RTL 缺失

- `filelist/rtl.f` 仅 2 行注释；`testplan/*/rtl.f` 同样为空。
- 全仓库搜索不到 `module mpsoc`；`tb/dutinst.sv:68` 的 `mpsoc DUT(...)` 无法解析。
- 该现状与 `testcase/mpsoc_TestTop.svh:69-71` 的注释自述一致（"当前 DUT 为 pad 级黑盒(RTL 缺失)"）。

### 3.3 【阻断】`make comp` 引用 5 个不存在的文件/变量

| 位置 | 引用 | 实际 |
| --- | --- | --- |
| `run/Makefile:73` | `${VERIFY_HOME}/coverage/coverage_list/Coverage_define.lst` | 目录 `coverage_list/` 不存在 |
| `run/Makefile:74` | `${VERIFY_HOME}/coverage/coverage_list/Coverage.lst` | 同上 |
| `run/Makefile:75` | `${VERIFY_HOME}/sva/sva_lst/Assertion_define.lst` | 目录 `sva_lst/` 不存在（实际是 `sva/code/`） |
| `run/Makefile:80` | `${VERIFY_HOME}/run/xprop_merge.cfg` | 不存在（实际是 `cfg/xprop.cfg`） |
| `run/Makefile:144` | `${VERIFY_HOME}/filelist/c_filelist.lst` | 不存在 |
| `run/Makefile:151` | `$(DEFINE_FILELIST)` | **变量从未定义** → `-file` 后无参数 |

### 3.4 【阻断】`make comp` 不等待编译结束

`run/Makefile:151` 的 vcs 命令行以 `&` 结尾，make 的 recipe 在子 shell 中后台启动 vcs 后立即返回。`make comp && make sim` 会在 `simv` 尚未生成时启动仿真。

### 3.5 【阻断】DUT 时钟/复位未接到 TB 时钟源

- `tb/crg_gen.sv:5-28` 产生 `tb_top.i_pad_clk` / `tb_top.i_pad_rst_b`（`reg`）。
- `tb/uvmconfigdb.sv:4`：`mpsoc_vif TopVif(tb_top.i_pad_clk, tb_top.i_pad_rst_b)` —— 只接到了 `mpsoc_vif` 的 `clk`/`rstn` 端口（供 clocking block 与监视使用）。
- 而 `tb/dutinst.sv:69-70` 把 `DUT.i_pad_clk` / `DUT.i_pad_rst_b` 接到了 `TopVif.sysctrlvif.i_pad_clk` / `.i_pad_rst_b`，这两个信号在 `uvc/sysctrl/sysctrl_vif.sv:12-13` 只是**裸 `logic`，无任何驱动源**。
- sysctrl driver 只在 `reset_phase` 把它们写 0（`uvc/sysctrl/sysctrl_driver.sv:65-66`），而 `driver_one_pkt()` 是 TODO 空实现（同文件 `:134-135`）。

**影响**：DUT 永远拿不到时钟与复位释放 → 即使 RTL 补齐也跑不动。

### 3.6 【阻断】`mpsoc_event` 配置缺失 → 运行期 `uvm_fatal`

- 唯一 set 点：`env/mpsoc_env.sv:74` → `uvm_config_db#(mpsoc_event)::set(null, "", "mpsoc_event", mpsoc_evt);`
  （`null` 上下文 + 空 `inst_name` 不是层次通配，无法覆盖 `uvm_test_top.*`）
- 消费点：`testcase/sequence_lib/mpsoc_sequence_lib.sv:32` → `get(null, get_full_name(), ...)`，失败即 `` `uvm_fatal("Can't get event object!") ``。
- 对比：`mpsoc_config` 在 `testcase/mpsoc_base_test.sv:93` 有正确的 `set(this, "*", ...)`，所以没问题；`mpsoc_event` **遗漏了同等 set**。

**影响**：`mpsoc_demo_test`（当前唯一可运行 test）在虚拟 sequence `pre_body` 即 fatal 退出。

### 3.7 【阻断】`tb_top` 作用域内标识符重复声明

`tb/crg_gen.sv` 与 `tb/dutinst.sv` 都被 `tb/tb_top.sv:10,16` 在**同一个 `module tb_top` 作用域**内 `` `include ``，但两者重复声明了同名标识符：

| 标识符 | 声明 A | 声明 B |
| --- | --- | --- |
| `i_pad_clk` | `tb/crg_gen.sv:5` → `reg i_pad_clk;` | `tb/dutinst.sv:3` → `wire i_pad_clk;` |
| `i_pad_rst_b` | `tb/crg_gen.sv:17` → `reg i_pad_rst_b;` | `tb/dutinst.sv:4` → `wire i_pad_rst_b;` |

**影响**：SystemVerilog 不允许同一作用域内重复声明同一标识符 → **编译直接报错**（"Identifier already declared"）。
**修复**：删除 `tb/dutinst.sv:3-66` 的全部 57 条 `wire` 声明（经核对，这 57 条**全部未被使用**——DUT 端口直接连到 `TopVif.*`）。

### 3.8 【阻断】6 个 driver 对 `wire` 型 inout 信号做过程赋值

6 个 UVC 的 vif 把 inout 类信号声明为 **`wire`**，但对应 driver 在 `reset_phase` 里用**过程赋值**（`=`）驱动它们：

| UVC | vif 中的 `wire` 声明 | driver 中的过程赋值 |
| --- | --- | --- |
| gpio | `uvc/gpio/gpio_vif.sv:12-13` `wire [31:0] b_pad_gpio_porta;` `wire [15:0] b_pad_gpio_portb;` | `uvc/gpio/gpio_driver.sv:65-66` |
| i2c | `uvc/i2c/i2c_vif.sv:12-13` `wire scl;` `wire sda;` | `uvc/i2c/i2c_driver.sv:65,66,123,124,126,128,133,134,136,138,143,144,146,148,156,157,159,162,169,170,172,175` |
| uc | `uvc/uc/uc_vif.sv:12-13` `wire [13:0] uc_addr;` `wire [11:0] uc_data;` | `uvc/uc/uc_driver.sv:65-66` |
| sdram | `uvc/sdram/sdram_vif.sv:20` `wire [15:0] sdram_dq;` | `uvc/sdram/sdram_driver.sv:65,176,179` |
| qspi | `uvc/qspi/qspi_vif.sv:16-19` `wire QSPI_DAT0..3;` | `uvc/qspi/qspi_driver.sv:69-72` |
| switch | `uvc/switch/switch_vif.sv:29` `wire switch_mdio_data;` | `uvc/switch/switch_driver.sv:82` |

**影响**：对 `wire`（net）做过程赋值在 SystemVerilog 中非法 → VCS 报 `Error-[IBLHS-NT] Illegal left-hand side of assignment: not a variable`。
**修复**：把这 6 组信号在 vif 中改为 `logic`（配合 `*_o`/`*_oe` 方向拆分），或在 driver 中改用 `assign`/`force` 驱动。

---

## 4. 功能缺陷与结构性问题

### 4.1 DUT 只连了 8 个外设，11 个 UVC 完全"悬空"

`tb/dutinst.sv` 的 57 个端口按接口分布：

| 接口 | 端口数 | 接口 | 端口数 |
| --- | --- | --- | --- |
| switch | 18 | efuse | 5 |
| qspi | 9 | uart | 2 |
| miiphy | 8 | gpio | 2 |
| sysctrl | 7 | jtag | 6 |

**完全没有 DUT 连接**的 11 个 UVC：`i2c`、`spi`、`wdt`、`tim`、`uc`、`sdram`、`security`、`dma`、`pn_irt`、`esc`、`gmac`。
对照 `设计文档/interface.md`：其顶层接口段的 57 个端口**全部已接入**（见 §6.1），但这 57 个端口只覆盖 8 个外设；其余 21 个章节描述的 **789 条模块内部接口信号**在当前环境中没有任何验证承载。

另：`tb/dutinst.sv:3-66` 声明的 57 个 `wire` 全部未被使用（DUT 端口直接连到 `TopVif.*`），属死代码。

### 4.2 driver 驱动方向冲突（含 DUT 输出被反驱）

**(1) 5 个 driver 驱动 DUT 的 `o_` 输出信号**（多驱动，方向错误），均在 `reset_phase` 中：

| UVC | driver 赋值 | DUT 端口 |
| --- | --- | --- |
| sysctrl | `uvc/sysctrl/sysctrl_driver.sv:70` `vif.o_pad_pn_sync = 'd0;` | `tb/dutinst.sv:74` |
| jtag | `uvc/jtag/jtag_driver.sv:70` `vif.o_pad_jtg_tdo = 'd0;` | `tb/dutinst.sv:81` |
| uart | `uvc/uart/uart_driver.sv:66` `vif.o_pad_uart0_sout = 'd0;` | `tb/dutinst.sv:83` |
| efuse | `uvc/efuse/efuse_driver.sv:65` `vif.o_efuse_dout = 'd0;` | `tb/dutinst.sv:121` |
| miiphy | `uvc/miiphy/miiphy_driver.sv:68-71` `phy_txd_o` / `phy_txen_o` / `RGMIITXC_o` | `tb/dutinst.sv:116,117,119` |

**(2) 同一个 driver 还驱动本不该由 TB 驱动的时钟/复位**（`uvc/sysctrl/sysctrl_driver.sv:65-66`）：

```systemverilog
vif.i_pad_clk       = 'd0;   // 与 crg_gen 的 always 争用
vif.i_pad_rst_b     = 'd0;   // 同上
```

**同类问题在其余 UVC 的 `reset_phase` 中成模板复制**，且与部分 driver 注释"输出由 DUT 驱动"自相矛盾。

### 4.3 激励层实现度：19 个 driver 中仅 6 个有真实时序

| 状态 | UVC |
| --- | --- |
| ✅ 已实现 `driver_one_pkt`（6） | `dma`、`i2c`、`sdram`、`spi`、`tim`、`wdt` |
| ❌ 仍为 TODO 桩（13） | `efuse`、`esc`、`gmac`、`gpio`、`jtag`、`miiphy`、`pn_irt`、`qspi`、`security`、`switch`、`sysctrl`、`uart`、`uc` |

已实现的 6 个还带超时保护（如 `uvc/wdt/wdt_monitor.sv` 采用事件驱动采样、`uvc/spi/spi_driver.sv` 带 `TIMEOUT_CYCLES` 兜底），质量明显高于模板生成部分。

### 4.4 计分板无任何比对能力

`env/mpsoc_scoreboard.sv` 中 19 个 `write_<ip>()` 回调（`:151-338`）**全部**只做 `` `uvm_info `` 打印 + `// TODO: 用户在此实现 <ip> 的比对逻辑`。`report_phase`（`:358-364`）也没有 pass/fail 统计。**当前环境不具备任何自动判错能力**。

### 4.5 断言层为空

`sva/code/` 下 10 个 `sva_*.sv` 文件**字节数均为 0**：

```
sva_tb_top.sv  sva_vif_top.sv  sva_vif_sysctrl.sv  sva_vif_jtag.sv
sva_vif_uart.sv  sva_vif_gpio.sv  sva_vif_qspi.sv  sva_vif_switch.sv
sva_vif_miiphy.sv  sva_vif_efuse.sv
```

`AssertionHierarchy.lst` 与 `coverage/code/CoverageHierarchy.lst` 也只有注释行。

### 4.6 功能覆盖率被未定义的宏"锁死"

- `env/mpsoc_function_coverage.sv:7-30` 用 `` `ifdef COVERAGE_SYSCTRL `` … `` `endif `` 包裹 8 个 coverage 文件。
- 全仓库搜索：`COVERAGE_*` 宏**从未被定义**（各 `*_vif.sv` 只定义了 `COV_<IP>`，是另一套名字）。
- 结果：`coverage/code/` 下 10 个含 `covergroup` 的文件（sysctrl/jtag/uart/gpio/qspi/switch/miiphy/efuse/ucspi）**永远不会进入编译**。

同理，monitor 中的 X/Z 检查（`` `ifdef CHECK_SIGNAL_XZ_<IP> ``）也全部失效。

### 4.7 回归矩阵是空壳

- `testplan/T1_group ~ T7_group/test.json` **内容完全相同**，都是 3 条 `mpsoc_demo_test_1/2/3`，`uvm_testname` 均为 `mpsoc_demo_test`。
- `sim_args` 写的是 `+uvm_set_config_int="uvm_test_top.env.mpsoc_vseqr,c1,1"`，但 `env/mpsoc_virtual_sequencer.sv:29-30` 只有 `aa` / `bb` 字段，**没有 `c1`** → 该配置静默无效。
- 7 组的 filelist 也完全一致（无差异化编译）。

### 4.8 `run/xrun` 脚本自身缺陷

| 位置 | 问题 |
| --- | --- |
| `run/xrun:311` | cmodel 分支误用 `tb_new.f`（应为 `cmodel_new.f`），`:698` 已定义 `cmodel_newfile` 却没用 |
| `run/xrun:279` / `:380` | `-cm dir` 语法错误，应为 `-cm_dir` |
| `run/xrun:371` | `base_simulation_opt` 在循环内累加，每次迭代重复追加 `-ucli -do` |
| `run/xrun:278` | `base_compile_opt` 跨调用累加，未复位 |
| `run/xrun:689-693` | 期待 `filelist/*.k`，实际只有 `*.f` → `.k` 条件编译机制整体失效（只能 fallback 到 `.f`） |
| `run/xrun:217` | `self.testgroup_list` 打印时恒为空（从未填充） |
| `run/Makefile:59` | `-cm_line contassion` 拼写错误，应为 `contassign` |
| `run/Makefile:90` | `-sv_lib libdpi`，环境内无 `libdpi` 构建产物 |
| `run/run:198` | `-t` 不带 `-g` 分支直接 `assert False` → 死代码 |
| `run/run:235` | `-g` 不带 `-t` 分支直接 `assert False` → **组级全量回归无法执行** |
| `run/run:486` | 传参用小写 `tcl_file=`，而 `run/Makefile:42` 是 `TCL_FILE`（大小写敏感）→ 该传参无效 |

另：`run/run`（`run/run:88-95`）取的是 `testplan/<group>/tb.f`，因此**组回归走的是那份陈旧的 8-UVC filelist**——这使 §3.1 成为组回归的硬阻断。

`run/Makefile` 另有一处**目录名拼写错误**：`:145` 写 `-CFLAGS "-I${VERIFY_HOME}/refrence"`，实际目录是 `reference/`（且该目录为空）。

`run/Makefile:169`：`$(TCL_FILE) -ucli -do $(TCL_FILE)` —— 同一 tcl 文件既作位置参数又作 `-do` 参数。

`cfg/comp_base.cfg:19` 声明 `-top tb_top`，而 `cfg/partitioncompile_cfg.v:2` 写 `partition instance top_tb.DUT;` —— 顶层模块名不一致。

另：`run/run`（第二份 Python runner，568 行）与 `run/xrun` 功能重叠，但 `readme` 未提及，属维护负担。

### 4.9 本机环境不可运行

- `vcs` / `verdi` / `xrun` / `urg` 均不存在；`/network/tools/synopsys` 不存在。
- `VCS_HOME`、`VERDI_HOME`、`DESIGNWARE_HOME` 均未设置（`SourceMe:5-19` 指向 `/network/...`）。
- 无 `build/` 目录，说明该 workspace 从未留下成功编译产物。

### 4.10 寄存器模型覆盖面不足且存在 0 位宽寄存器

`regmodel/mpsoc_reg_block.sv` 只实例化了 **10 个 `uvm_reg`**：

| 寄存器 | `configure()` 位宽 | 行 |
| --- | --- | --- |
| 第 1 个 | **0** | `:29` |
| 第 2 个 | 32 | `:52` |
| 第 3 个 | 1 | `:75` |
| 第 4 个 | 2 | `:98` |
| 第 5 个 | 3 | `:121` |
| 第 6 个 | 32 | `:144` |
| 第 7 个 | **0** | `:167` |
| 第 8 个 | **0** | `:190` |
| 第 9 个 | 32 | `:213` |
| 第 10 个 | 32 | `:236` |

对照 `验证文档/信息汇总.md:36-68` 列出的 19 个寄存器（0x00–0x2C、0x74/0x78、0x7C0–0x7D4），regmodel **缺 0x28 / 0x2C / 0x74 / 0x78 / 0x7C0–0x7D4**，且有 3 个寄存器位宽为 0（不可用）。
> 注意：**缺失的 `0x28 Reset Control` 正是 §5.4 中 `sys_rst` / `pg_reset_b` P0 问题所对应的复位控制寄存器。**

### 4.11 `ucspi_function_coverage.sv` 是孤儿文件

`coverage/code/ucspi_function_coverage.sv:2` 定义 `covergroup FeatureListNum_UCSPI with function sample(ucspi_trans ucspi_tr)`，但：
- 类型 `ucspi_trans` 在整个仓库中**无定义**（grep 仅命中这一行自身）；
- `env/mpsoc_function_coverage.sv:7-30` 的 `` `ifdef `` 分支中**没有 `UCSPI` 分支**，该文件永远不会被 include。

### 4.12 覆盖率/检查宏三套命名分裂

| 角色 | 使用的宏 | 证据 |
| --- | --- | --- |
| VIF 定义（19 个） | `COV_<IP>` / `CHK_<IP>` | `uvc/sysctrl/sysctrl_vif.sv:55-61` |
| Monitor 引用（19 个） | `COVERAGE_<IP>` / `CHECK_SIGNAL_XZ_<IP>` | `uvc/sysctrl/sysctrl_monitor.sv:72-86` |
| 覆盖率封装引用 | `COVERAGE_<IP>` | `env/mpsoc_function_coverage.sv:7-30` |

后两套宏**全仓库从未被 `define`** → 19 个 UVC 的 X/Z 检查、功能覆盖率采样、10 个 covergroup 全部为死代码。唯一未被宏保护的是 `uvc/sysctrl/sysctrl_monitor.sv:88-91` 的 X/Z 检查，但它检查的正是 §3.5 中那两个与 DUT 不同源的影子信号。

### 4.13 时钟方案与设计文档不符

| 项 | 设计文档 | 代码实现 |
| --- | --- | --- |
| 时钟源 | 3 路独立 PLL（`设计文档/MPSOC_架构图.md:5-15,186-193`、`MPSOC_PFS_关键特性.md:33-38`） | **1 路** `i_pad_clk` |
| 频率 | 25 / 125 / 375 / 400 MHz | **100 MHz**（`tb/crg_gen.sv:11` 半周期 10ns） |
| 复位极性 | `i_pad_rst_b` 低有效 | 低有效 ✅ 一致（`tb/crg_gen.sv:20,24`） |
| `sys_rst` / `pg_reset_b` / `gate_en*` / `clk_en` / `cpu_clk` | `interface.md` 中明确定义 | **代码中 0 次出现** |

`interface.md` 自身还有内部矛盾（详见 §5.5）。

### 4.14 模块覆盖缺口：设计有、UVC 无

把 `interface.md` 的 21 个模块章节与 19 个 UVC 目录做对照，以下设计模块**没有任何 UVC 承载**：

| 设计模块 | `interface.md` 章节 | 对应 UVC |
| --- | --- | --- |
| 双核 RISC-V E906（rvcore） | `:65-98` | **无** |
| WIC 中断控制器 | `:714-757` | **无** |
| PMU 电源管理 | `:585-606` | **无** |
| stimer 系统定时器（4 通道） | `:638-660` | **无**（`tim` 只覆盖 TIMOx3/TIMIx3） |
| SOC SRAM 64KB / Boot ROM 16KB | `:261-278` | **无** |
| mem2apb 桥 | `:824-826`（空表） | **无** |
| AHB / APB 总线矩阵 | —（仅 `uvc/VIP/ahb,apb` 占位） | **无** |
| PLL / CRG 时钟复位生成 | —（仅 TB 桩 `crg_gen.sv`） | **无** |

反向：`switch`、`wdt`、`tim`、`efuse`、`gmac` 这 5 个 UVC 在 `MPSOC_PFS_关键特性.md` / `分析报告.md` 中**几乎没有对应描述**（仅 `interface.md` 与 `addrmap&registers（待补充）.md` 提到），属"UVC 先于设计文档"。

**影响**：`验证测试列表.md` 中 `TST-CPU-*`(8) + `TST-BUS-*`(5) + `TST-SYS-007~010` 等 **17+ 项**已排期但没有落地能力。
**建议**：在 `ARCHITECTURE.md` 增加"未覆盖模块清单"，并在 testplan 中把这些用例标记为 `blocked-by-env`。

### 4.15 `REG_MODEL` 一旦打开即编译失败

`env/mpsoc_env.sv:33` 与 `testcase/mpsoc_base_test.sv:49` 都声明了：

```systemverilog
`ifdef REG_MODEL
    mpsoc_reg_top  RegModel;
`endif
```

但全仓库**没有 `mpsoc_reg_top` 这个类型**——`regmodel/mpsoc_reg_block.sv:245` 定义的类名是 `mpsoc_reg_block`。

**影响**：`REG_MODEL` 宏当前未定义（`grep` 无 `+define+REG_MODEL`），所以现在是"潜伏"状态；一旦按 `env/mpsoc_EnvTop.svh:57-60` 的意图打开寄存器模型，立即编译失败。
**修复**：统一类名，或补 `typedef mpsoc_reg_block mpsoc_reg_top;`。

### 4.16 覆盖率文件的字段名被 `inout` 前缀污染（启用宏即编译失败）

`coverage/code/` 下 4 个文件引用了**不存在的** trans 字段（模板生成时把方向前缀 `inout` 拼进了字段名）：

| 文件:行 | 引用的字段 | 实际 trans 字段 |
| --- | --- | --- |
| `coverage/code/gpio_function_coverage.sv:4-5` | `gpio_tr.inoutb_pad_gpio_porta/portb` | `uvc/gpio/gpio_trans.sv:37-38`（无 `inout` 前缀） |
| `coverage/code/qspi_function_coverage.sv:8-11` | `qspi_tr.inoutQSPI_DAT0..3` | 无此前缀 |
| `coverage/code/switch_function_coverage.sv:21` | `switch_tr.inoutswitch_mdio_data` | 无此前缀 |
| `coverage/code/ucspi_function_coverage.sv:2` | `sample(ucspi_trans ...)` | 类型 `ucspi_trans` 不存在 |

**影响**：与 §4.6 叠加——现在因宏未定义而不编译（"因祸得福"）；**一旦启用 `COVERAGE_*` 宏，这 4 个文件立即报错**。修复宏名的同时必须一并修正字段名。

### 4.17 `starting_phase` 从未被设置 → 全部 objection 失效

19 个 UVC 的 `*_base_sequence` 与 `testcase/sequence_lib/mpsoc_sequence_lib.sv:26-27,45-46` 都写了：

```systemverilog
if (starting_phase != null)
    starting_phase.raise_objection(this, get_type_name());
```

但全仓库：

```bash
grep -rn "set_starting_phase\|default_sequence" --include=*.sv --include=*.svh .
# → 0 条
```

`uvm_sequence_base::starting_phase` 不会被 `.start(sequencer)` 自动赋值（只有 `default_sequence` 或显式 `set_starting_phase()` 才会）。因此这些 `raise_objection` / `drop_objection` **全部是死代码**。

**影响**：`main` 等 12 个子 phase 没有任何 objection 来源 → 子 phase 可能在 time 0 即结束，driver 的 `main_phase` 被提前杀掉。当前唯一还活着的 objection 是 `testcase/mpsoc_demo_test.sv:478-482` 在 `run_phase` 里显式 raise 的那一对。
**修复**：在 test 中 `seq.set_starting_phase(phase)`，或改用 `uvm_sequence_base::set_automatic_phase_objection(1)` + 正确赋值 `starting_phase`。

### 4.18 回归 PASS 判据没有任何信号量（"零错误 = 通过"）

| 环节 | 现状 | 证据 |
| --- | --- | --- |
| test 判定 | `err_num==0` 即打印 `===UVM TEST PASSED===`（未调用 `super.report_phase`） | `testcase/mpsoc_base_test.sv:244-262` |
| 回归判据 | `run/run:521-525` 以 `sim.log` 中出现 `UVM TEST PASSED` 判定 PASS | `run/run` |
| case 内是否有判错 | **0 / 86**（`grep -rl "uvm_error" --include='*_test.sv' testcase` = 0） | — |
| scoreboard 判错 | 19 个 `write_*` 全部无判错（§4.4） | `env/mpsoc_scoreboard.sv:151-338` |
| C 程序判定 | 10 个新写 C 骨架**无条件** `return 0; /* 0 = PASS */` | 如 `testcase/cpu/cpu_001_dual_core_boot/dual_core_boot.c:19` |
| C 结果回读 | C 文件注释称"由 SV test 侧轮询"，但 SV 侧 `PASS_MARK`/`PASS_ADDR`/`0x200b0000` **命中 26 处、全部在注释里**（非注释行 = 0） | `testcase/cpu/*/*_test.sv:12,33` 等 |

**影响**：只要不 fatal，**任何 case 都会 PASS**。当前回归结果**不携带任何关于 DUT 的信息**。

### 4.19 软件用例工具链在本机/本环境不可用

| 项 | 现状 | 证据 |
| --- | --- | --- |
| 交叉工具链默认路径 | `/tools/riscv/riscv64-elf-x86_64/bin` —— 本机不存在 | `testcase/sw/lib/Makefile:32`、`testcase/sw/setup/setup_env.sh:21` |
| `Srec2vmem` | **Linux x86-64 静态 ELF**，macOS 无法执行 | `file testcase/sw/bin/Srec2vmem` |
| `env_check.mk` | 未被任何 case Makefile include | `testcase/sw/setup/env_check.mk` |

### 4.20 `mpsoc_common_task_function.sv` 的 `ReadCfgFile()` 无副作用

`testcase/sequence_lib/mpsoc_common_task_function.sv:25-44` 把解析结果写入**局部变量** `CfgData`（`:30`），而真正回填 `mpsoc_cfg` 的那一行被注释掉（`:40`），函数返回后无任何效果。

---

## 5. 文档与代码的漂移

### 5.1 `ARCHITECTURE.md` 严重滞后（12 处仍称"8"）

| 行 | 文档描述 | 实际 |
| --- | --- | --- |
| 45 | base_test "含 8 个 UVC cfg" | 20 个 config 对象（mpsoc + 19 UVC） |
| 147 | "8 UVC cfg + env + regmodel" | 19 |
| 155 | "8 Agent 容器" | 19 agent（`env/mpsoc_env.sv:53-71`） |
| 158 / 226 | "8 UVC sequencer handles" | 19（`env/mpsoc_virtual_sequencer.sv:8-26`） |
| 179 | "(8 子 vif)" | 19（`sva/mpsoc_vif.sv:8-26`） |
| 211 | "创建 8 个 UVC config" | 20 |
| 322 | "Virtual Sequencer (8 handles)" | 19 |
| 342 | "Monitor (8 个各自独立采样)" | 19 |
| 421 | "2 handles → 8 handles" | 19 |
| 472 | "UVC 框架 (8 个) ✅ 完成" | 19（其中 13 个仍是桩） |
| 487 | "Virtual Sequencer 的 8 个 handles" | 19 |

同时 `:87` 称 "SVA 断言层 (19 接口 + 顶层)"，实际 `sva/code/` 只有 10 个文件且**全部为空**。

### 5.2 测试清单数量对不上

| 来源 | 数量 | 证据 |
| --- | --- | --- |
| `验证文档/验证测试列表.md` 实际 `TST-*` 行 | **103** | `:41-142`，统计表亦自述 103（`:28,:35`） |
| 同文件"本地补充"说明 | 72 原始 + **31** 本地补充 = 103 | `:10`、`:12` |
| `testcase/README.md` | **72**（"51 正式 + 21 补充 = 72 项"） | `README.md:1,4,141,145` |
| `testcase/` 8 大子系统 `*_test.sv` | **75** | cpu 9 + bus 5 + mem 9 + dma 6 + net 10 + per 25 + sec 5 + sys 6 |
| 其中对应 TST 编号 | **72** | 75 − 3 个 opene906 遗留（`hello_world`/`memcp`/`memset`） |
| 另有基础设施 test | 2（`mpsoc_base_test`、`mpsoc_demo_test`） | `testcase/` |
| VIP demo test | 11 | `testcase/vip/` |
| **合计 `*_test.sv`** | **88** = 75 + 2 + 11 | — |
| `testplan/T*/test.json` 映射到 TST 的用例 | **0** | 7 份 json 只有 `mpsoc_demo_test_1/2/3` |

**31 项有清单、无 `.sv` 文件**（`验证测试列表.md:113-142`）：

```
TST-CPU-007,008                                   (2)
TST-MEM-010,011,012,013                           (4)
TST-DMA-007                                       (1)
TST-NET-011..020                                  (10)
TST-PER-026..031                                  (6)
TST-SEC-006,007                                   (2)
TST-SYS-007..012                                  (6)
                                          合计 = 31
```

反向检查：**有 `.sv` 但清单无对应 = 0**（无孤儿文件，除上述 3 个非 TST 用例）。

另：`testcase/README.md` 中 **10 条路径与实际目录结构不符**——README 写成平铺路径，实际是子目录，例如
`cpu/cpu_001_dual_core_boot_test.sv` 实际在 `cpu/cpu_001_dual_core_boot/cpu_001_dual_core_boot_test.sv`；
`bus/bus_001_ahb_bw_test.sv` → `bus/bus_001_ahb_bw/…`；`mem/mem_001_sram_rw_test.sv` → `mem/mem_001_sram_rw/…` 等。

**四个数字（72 / 75 / 88 / 103）互不相等**，且 `testcase/mpsoc_TestTop.svh:39-43` 只 include 了 `mpsoc_sequence_lib.sv` / `mpsoc_base_test.sv` / `mpsoc_demo_test.sv`，**77 个自研 case 全部未接入编译**。

### 5.3 设计资料本身仍有多处空缺

`验证文档/信息汇总.md`：
- Addrmap 中 GPIO / I2C / UART0-2 / WDT / TIM / SPI / SRAM / SDRAM / DMAC / QSPI / PN-IRT / GMAC 等 12 项基地址仍为「？？？？」（`:13-31`）。
- irq 清单 14 项中 13 项为 TODO（`:184-197`）。
- `function` 特性表中"case / 状态"列大量空白（`:203-268`）。
- `boot方式` 为空表（`:164`）。

`验证文档/问题记录.md`：王鑫鑫名下 P0 未解决问题 2 条（Q2 `sys_rst` 一直为高、Q3 `pg_reset_b` 一直为低），其余人员条目为空。全表 30 行中 **23 行为空占位**，无日期、无闭环判据。

### 5.4 两条 P0 问题在验证环境中完全无承载（验证盲区）

`验证文档/问题记录.md:10-11` 记录了两条 **P0 待解决**问题（王鑫鑫）：

| 编号 | 描述 | 状态 |
| --- | --- | --- |
| Q2 | riscv：`sys_rst` 一直为高，没有复位操作？低复位有效？ | 待解决 / P0 |
| Q3 | riscv：`pg_reset_b` 一直为低，此信号为 kcore 的主复位？ | 待解决 / P0 |

但：

```bash
grep -rn "sys_rst\|pg_reset_b" --include=*.sv --include=*.svh --include=*.v mpsoc/
# → 0 条匹配
```

即：整个验证代码库中**既无这两个信号的探针、也无驱动、也无断言**；而 `设计文档/interface.md` 明确把它们定义为 rvcore / pmu 的接口信号（`interface.md:72,98,605-606`）。

**影响**：这是**最高优先级的验证盲区**——设计方与验证方对同一对复位信号的极性理解存在分歧（Q2 问"一直为高，是否低有效？"，而 `pg_reset_b` 的 `_b` 后缀又是低有效命名），却没有任何机制能在仿真中发现它。
**建议**：① 在 `sysctrl_vif` 增加 `sys_rst` / `pg_reset_b` 探针（若为内部信号用 `uvm_hdl_read` 后门）；② 在 `sva/code/sva_vif_top.sv`（当前 0 字节）落一条极性/时序断言；③ 在 `interface.md` 补"上电复位释放顺序"，明确 `i_pad_rst_b` / `pg_reset_b` / `sys_rst` 三者优先级与相位关系。

### 5.5 `interface.md` 自身的质量问题

**(1) 37 行位宽为非法小数或占位符**（全书 846 条带方向信号行中）：

| 行 | 信号 | 位宽值 |
| --- | --- | --- |
| `:267` | `haddr_sl` | `1.2916666666666667` |
| `:268` | `hburst_sl` | `0.08333333333333333` |
| `:269` | `hprot_sl` | `0.125` |
| `:271` | `hsize_sl` | `0.08333333333333333` |
| `:272` | `htrans_sl` | `0.041666666666666664` |
| `:274` | `hwdata_sl` | `1.2916666666666667` |

`1.2916666…` ≈ 31/24 —— 明显是 **Excel 列宽数值被误粘贴进位宽列**。涉及 `sram`(`:267-277`)、`uc2apb`(`:766-789`)、`spi2apb`(`:803-812`)、`PDI_AXI_*`(`:517-529`，"ID Width"/"Addr Width" 等文字) 等段落。

**(2) 同名信号跨章节定义冲突（6 处）**：

| 信号 | 位置 A | 位置 B | 冲突 |
| --- | --- | --- | --- |
| `RGMIITXC_o` / `RGMII_TXC_o` | `:55` 顶层，**input** | `:345` gmac，**output** | 命名与方向均冲突 |
| `RGMIIRXC_i` / `RGMII_RXC_i` | `:54` | `:343` | 命名不一致（下划线） |
| `phy_rxd_i` | `:49` 位宽 **4** | `:417` 位宽 **8** | 位宽冲突 |
| `phy_txd_o` | `:52` 位宽 **4** | `:420` 位宽 **8** | 位宽冲突 |
| `corec_pmu_sleep_out` | `:75` output | `:595` output | 两端同为 output |
| `ic_tx_over_intr` | `:572` | `:574` | 同节内重名 |

**(3) 章节内容缺失**：`ESC1`(`:546-548`)、`mem2apb`(`:824-826`) 为空表；`pn-irt`(`:888`) 内含 `... (DDR 相关信号)` 等占位行。

> `RGMIITXC_o` 的方向歧义直接决定 GMAC 是驱动还是接收 TXC（`tb/dutinst.sv:119` 用的是 `RGMIITXC_o`），属**接口契约级歧义**。

---

## 6. 校验通过的部分（环境健康面）

### 6.1 顶层端口契约：57 / 57 逐字一致 ✅

`设计文档/interface.md` 的第一个 `## interface` 段（顶层 pad 清单）与 `tb/dutinst.sv` 的 `mpsoc DUT(...)` 端口清单做了逐条比对：

| 比对项 | 结果 |
| --- | --- |
| 顶层端口总数 | 文档 57 ↔ 代码 57 |
| 文档有、代码无 | **0** |
| 代码有、文档无 | **0** |
| 名称逐字匹配 | **57 / 57** |
| 位宽不一致（`dutinst.sv` wire 层 + 各 UVC VIF `logic` 层双重校验） | **0** |
| 方向不一致（VIF `dcb` 为 driver 视角，反相归一化后） | **0** |
| `inout` 端口 | 7 ↔ 7 ✅ |

> 这是本次审计**最健康的一环**：VIF 框架确实是严格按 `interface.md` 顶层表生成的。

### 6.2 其余通过项

以下为脚本化校验的**通过项**，说明框架本身是干净的：

1. **`` `include `` 闭合**：对所有 `.sv/.svh` 去注释后检查，除 UVM 自带 `uvm_macros.svh` 外**无悬空 include**（`uvm_macros.svh` 由 `run/Makefile:64` 的 `+incdir+${VCS_HOME}/etc/uvm-1.2` 提供）。
2. **package 闭合**：21 个 `package` 均有定义，所有 `import` 都能解析（除预期中的 `uvm_pkg` / `svt_uvm_pkg`）。
3. **test 类名规范**：88 个 `*_test.sv` 的 test 类名与文件名**100% 一致**，且全部满足 `class <stem> extends …` + `` `uvm_component_utils(<stem>) `` 三元一致；**无重名类**；`testcase/` 内 180 个 class 声明与 `uvc/ env/ cfg/ regmodel/ tb/` **零冲突**；88 个文件**全部含 `` `ifndef `` guard**。
4. **case 引用完整性**：86 个 case 引用的 **53 个** `req.<field>` 全部能在对应 `uvc/*/*_trans.sv` 找到声明（含 `cmd_e CFG`：`uvc/sysctrl/sysctrl_trans.sv:47-50`；`cmd/bank/addr`：`uvc/sdram/sdram_trans.sv:52-54`）；引用的 19 个 `*_base_sequence` 全部有定义。
5. **UVC 结构统一**：19 个目录各 9 文件，命名 `<ip>_{vif,UvcTop,agent,config,driver,monitor,sequence_lib,sequencer,trans}.sv(h)` 完全一致。
6. **UVC 与 env 的成员命名对齐**：`env/mpsoc_env.sv:53-71` 与 `:82-120` 引用的 `xx_agt` / `xx_mon` / `mon_analysis_port` / `xx_seqr` / `xx_scb_imp`，在 19 个 UVC 与 `env/mpsoc_scoreboard.sv` 中**均真实存在且拼写一致**；38 处 agent TLM 连接（`seq_item_port` + `rsp_port`）齐全。
7. **config_db key 对齐**：`tb/uvmconfigdb.sv:12-30` 下发的 20 个 vif key（含 `mpsoc_vif`），与各 driver/monitor 的 `get` **零不匹配**。
8. **trans 字段对齐**：`testcase/mpsoc_demo_test.sv` 的随机约束所用字段在对应 trans 中均存在——
   `i2c`(addr/rnw/data[])、`spi`(channel/frame_size/tx_data)、`wdt`(timeout_cycles)、`tim`(channel/pulse_count/pulse_period)、`dma`(channel/handshake_delay)、`sdram`(cmd/bank/addr)；19/19 UVC 的 trans 字段名与位宽和 vif 完全对应。
9. **19 个 monitor 均已实现采样 + `mon_analysis_port.write()`**，无空监视器（其中 6 个还实现了协议/事件解码：dma/i2c/sdram/spi/tim/wdt）。
10. **package 与 include 顺序**：19 个 UvcTop 包名与 `env/mpsoc_EnvTop.svh:26-44`、`testcase/mpsoc_TestTop.svh:25-43` 的 import **19/19 一致**；`filelist/tb.f` 的 `vif.sv → UvcTop.svh → mpsoc_vif.sv → EnvTop → TestTop` 顺序正确，**无循环依赖**。
11. **行尾格式**：`readme:29-34` 要求转 unix 的 4 个文件当前均为 LF，无需再转。

---

## 7. 修复优先级建议

### P0 — 让环境"能跑起来"
1. 补齐 DUT RTL 或提供 `mpsoc` 空壳/黑盒 stub，使 `tb/dutinst.sv` 可 elaborate。
2. **删除 `tb/dutinst.sv:3-66` 的 57 条冗余 `wire`**，消除与 `tb/crg_gen.sv:5,17` 的同名重复声明（§3.7）。
3. **把 6 个 vif 的 `wire` 型 inout 改为 `logic`**（gpio/i2c/uc/sdram/qspi/switch），或把 driver 的过程赋值改为 `assign`/`force`（§3.8）。
4. 把 `filelist/tb.f` 同步到 `testplan/T{1..7}_group/tb.f`（消除 8 vs 19 的差异；`run/run` 走的正是后者）。
5. 修正 `run/Makefile` 的 5 处悬空引用 + `:145` 的 `refrence` 拼写 + `:59` 的 `contassion` 拼写，并去掉 `:151` 行尾的 `&`。
6. 在 `mpsoc_base_test.sv` 的 `build_phase` 补 `uvm_config_db#(mpsoc_event)::set(this,"*","mpsoc_event",mpsoc_evt)`；顺手把 `env/mpsoc_env.sv:73-74` 的 `set(null,"",…)` 改为 `set(null,"*",…)`。
7. 把 TB 时钟/复位接入 DUT：让 `DUT.i_pad_clk`/`DUT.i_pad_rst_b` 取自 `tb_top.i_pad_clk`/`i_pad_rst_b`，并从 `sysctrl_vif.dcb` 中移除这两根信号（§3.5）。
8. 删除 5 个 driver 对 DUT `o_` 输出的赋值（efuse/jtag/miiphy/sysctrl/uart，§4.2）。

### P1 — 让环境"能验证"
9. 为 13 个桩 driver 实现 `driver_one_pkt()`；优先 8 个已连 DUT 的接口（uart/gpio/jtag/qspi/switch/miiphy/efuse/sysctrl）。
10. 实现 scoreboard 比对逻辑，并在 `report_phase` 输出 pass/fail 统计；把 `mpsoc_base_test.sv:244-262` 的"零错误即 PASS"改为"ERR==0 **且** checker 有覆盖"。
11. 统一宏名为 `COV_<IP>` / `CHK_<IP>`（并在 `VifMacroDefine.v` 集中定义），**同时修正 4 个覆盖率文件的 `inout` 前缀字段名**（§4.12、§4.16）。
12. 在 `sva/code/` 至少补顶层时钟/复位极性与 X/Z 断言，并优先覆盖 §5.4 的 `sys_rst` / `pg_reset_b`。
13. 修正 `starting_phase` 赋值（`set_starting_phase` 或 `default_sequence`），让 12 个子 phase 的 objection 生效（§4.17）。
14. 把 77 个自研 test 按 `mpsoc_TestTop.svh:73-85` 的三步接入编译。
15. 重新生成 `regmodel`：补 0x28/0x2C/0x74/0x78/0x7C0–0x7D4，修正 3 个 0 位宽寄存器，并统一 `mpsoc_reg_top` 类名（§4.10、§4.15）。

### P2 — 让环境"能回归"
16. 用真实的 103（或对接后的最终数）条用例重建 `testplan/T{1..7}_group/test.json`，并让各组 filelist 差异化。
17. 修正 `test.json` 中无效的 `c1` 配置字段，并避免 `sim_args` 以命令行赋值覆盖 `run/Makefile` 的 `SIM_ARGS +=`。
18. 修复 `run/xrun` / `run/run` 的脚本 bug（cmodel filelist、`-cm_line`、`-cm dir`、选项累加、`.k` 机制、`-g`/`-t` 死分支、`tcl_file` 大小写）。
19. 更新 `ARCHITECTURE.md` 的 12 处 "8" 与 SVA/覆盖率章节描述。
20. 统一 `72 / 75 / 88 / 103` 用例数量口径，修正 `testcase/README.md` 的 10 条路径，补记 3 个 opene906 遗留 case。
21. 补 `interface.md` 的 37 行非法位宽与 6 处同名冲突，裁决 `RGMIITXC_o` 方向（§5.5）。
22. 软件用例：提供可用的 RISC-V 交叉工具链，替换 Linux-only 的 `Srec2vmem`，并在 SV 侧实现 PASS 标记轮询（§4.18、§4.19）。

---

## 附录 A：证据命令

```bash
cd /Users/ai-work/ai-dv/0-PRJ/mpsoc/mpsoc

# UVC 收录数量差异
grep -c 'uvc/.*_UvcTop.svh' filelist/tb.f               # 19
grep -c 'uvc/.*_UvcTop.svh' testplan/T1_group/tb.f      # 8

# SVA 全空
find sva/code -name '*.sv' -size +0 | wc -l             # 0

# 覆盖率宏从未定义
grep -rn "define COVERAGE_" --include=*.v --include=*.sv --include=*.svh .   # 无输出

# 悬空引用
ls coverage/coverage_list sva/sva_lst filelist/c_filelist.lst run/xprop_merge.cfg   # 均不存在

# 无 RTL
grep -rn "^module mpsoc" --include=*.v --include=*.sv .   # 无输出

# 端口覆盖
grep -c "TopVif\." tb/dutinst.sv                         # 57

# tb_top 同作用域重复声明
grep -n "^reg  *i_pad_clk\|^reg  *i_pad_rst_b" tb/crg_gen.sv    # :5, :17
grep -n "^wire *i_pad_clk\|^wire *i_pad_rst_b" tb/dutinst.sv    # :3, :4

# 6 个 vif 中 wire 型 inout 被 driver 过程赋值（编译错误）
grep -n "wire" uvc/{gpio,i2c,uc,sdram,qspi,switch}/*_vif.sv

# driver/scoreboard 桩比例
grep -l "用户在此实现接口时序驱动" uvc/*/*_driver.sv | wc -l     # 13 / 19
grep -c "TODO: 用户在此实现" env/mpsoc_scoreboard.sv            # 19

# 覆盖率宏从未定义 / 字段名污染
grep -rn "define COVERAGE_" --include=*.v --include=*.sv --include=*.svh .   # 无输出
grep -n "inout" coverage/code/*.sv                            # 4 个文件

# objection 体系失效
grep -rn "set_starting_phase\|default_sequence" --include=*.sv --include=*.svh . | wc -l   # 0

# 回归判据无信号量
grep -rl "uvm_error" --include='*_test.sv' testcase | wc -l   # 0

# 两条 P0 复位信号在代码中无承载
grep -rn "sys_rst\|pg_reset_b" --include=*.sv --include=*.svh --include=*.v .  # 0

# 7 份 testplan 完全相同
md5 testplan/T*/test.json | awk '{print $1}' | sort -u | wc -l   # 1
```
