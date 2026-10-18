# riscv-dv 随机指令测试架构 — 逐文件详解

> 分析对象：`/Users/ai-work/ai-dv/0-PRJ/riscv-cpu/riscv-dv-master`（Google riscv-dv，Apache-2.0，2023-10 版本）
> 本文是 `RISCV_DV_ANALYSIS.md`（概览）的**细化版**：逐个文件说明职责、关键类/函数与依赖关系。

---

## 0. 一句话架构

riscv-dv 是**「约束随机汇编生成器 + 指令轨迹比对」**的验证框架，核心链路是：

```
run.py (Python 流程编排)
   │ 1. 按 target/ 的 riscv_core_setting.sv 定制 ISA 能力
   │ 2. 编译并运行 SV/UVM 生成器（或 pyflow 纯 Python 生成器）
   ▼
riscv_instr_base_test.run_phase
   │ randomize_cfg()          → riscv_instr_gen_config
   │ riscv_instr::create_instr_list() → 可用指令注册表
   │ riscv_asm_program_gen.gen_program() → 生成 *.S 汇编
   ▼
*.S ──(riscv gcc)──> *.o/*.elf/*.bin ──> RTL 仿真 与 ISS 仿真
                                              │        │
                                        RTL trace   ISS trace
                                              └───┬────┘
                                    instr_trace_compare.py → PASS/FAIL
```

三种**近似**等价实现：**SV/UVM（`src/`+`test/`，功能最完整，推荐主用）**、**pyflow（`pygen/pygen_src/`，纯 Python+PyVSC，缺 MMU/PMP/调试/向量与部分覆盖率，见 §7.4）**、**eUVM（`euvm/`，D 语言逐行移植；不含覆盖率与 `riscv_csr_instr`，且部分 target 缺失）**。`pygen/experimental/` 是更早的 Python 原型，已弃用。

**规模速览**：Python 侧最大文件是 `pygen/pygen_src/riscv_instr_cover_group.py`（8121 行）与 `riscv_instr_pkg.py`（2022 行）；SV 侧最大是 `src/riscv_instr_cover_group.sv`（2579 行）与 `src/riscv_asm_program_gen.sv`（1645 行）；`src/isa/` 共 39 个文件、**注册 500 条指令**（`DEFINE_*INSTR` 实测计数）。

---

## 1. 顶层文件（仓库根）

| 文件 | 行数 | 功能 |
|------|------|------|
| `run.py` | 1170 | **总入口/流程编排**。`SeedGen`/`get_generator_cmd`/`parse_iss_yaml`/`get_iss_cmd`/`do_compile`/`do_simulate`/`gen`/`gcc_compile`/`run_assembly[_from_dir]`/`run_c[_from_dir]`/`iss_sim`/`iss_cmp`/`compare_iss_log`/`save_regr_report`/`parse_args`/`load_config`/`main`。读 `yaml/simulator.yaml`、`yaml/iss.yaml` 生成命令并替换 `<setting>/<cwd>/<out>/<seed>` 等占位符。**产物目录是 `out_<日期>`（如 `out_2024-05-20`，不是时间戳）**。`--simulator`：vcs/ius/questa/dsim/qrun/riviera/xlm/pyflow；`--iss`：spike/ovpsim/sail/whisper/renode（可逗号多选，但 renode 未接入比较路径）；`--steps` 实际取值为 **`all`/`gen`/`gcc_compile`/`iss_sim`/`iss_cmp`**（用 `re.match` 子串匹配，可逗号组合；**没有 `iss_trace_compare` 这个名字**）。 |
| `cov.py` | 344 | **覆盖率流程编排**。驱动 `yaml/cov_testlist.yaml`，跑 `riscv_instr_cov_test` 生成覆盖率数据库（VCS/Questa 等），支持 `--compliance_mode`、合并/生成报告。 |
| `files.f` | 23 | 编译文件清单：`+incdir+src +incdir+test`，源文件顺序为 `riscv_signature_pkg.sv → riscv_instr_pkg.sv → test/riscv_instr_test_pkg.sv → test/riscv_instr_gen_tb_top.sv`（包依赖顺序，不可随意调整）。 |
| `vcs.compile.option.f` | 19 | VCS 专用编译选项：`-sverilog -ntb_opts uvm-1.2 -lca +define+UVM_REGEX_NO_DPI -timescale=1ns/10ps`。 |
| `qrun_option.f` | 11 | Questa `qrun` 的选项文件。 |
| `questa_sim.tcl` | 2 | Questa 仿真脚本。 |
| `riviera_sim.tcl` | 1 | Riviera-PRO 仿真脚本。 |
| `setup.py` / `setup.cfg` | 21 / 25 | Python 包安装与 flake8/pytest 配置。 |
| `requirements.txt` | 6 | Python 依赖（PyYAML、PyVSC 等）。 |
| `MANIFEST.in` | 12 | sdist 打包包含的额外文件。 |
| `.flake8`、`.travis.yml`、`.metrics.json`、`.gitignore`、`__init__.py` | 8~1 | 代码风格、旧 CI、指标配置、忽略规则、包标记。 |
| `README.md` / `CONTRIBUTING.md` | 101 / 28 | 使用说明与贡献指南。 |
| `LICENSE.txt` | — | Apache-2.0。 |

---

## 2. `src/` — SV/UVM 生成器核心

### 2.1 包与宏

| 文件 | 行数 | 功能 |
|------|------|------|
| `riscv_instr_pkg.sv` | 1600 | **总包**。定义全部枚举（`riscv_instr_name_t / _group_t / _category_t / _format_t`、`privileged_reg_t`、`exception_cause_t`、`interrupt_cause_t`、`satp_mode_t` …）、结构体（`mem_region_t`、`instr_desc_t`…）、全局参数（`MAX_INSTR_STR_LEN/LABEL_STR_LEN/MAX_CALLSTACK_DEPTH`…）、工具函数（`format_string`、`format_data`、`get_label`、`hart_prefix`、压/弹栈辅助 `push_gpr_to_kernel_stack`…）。**关键**：第 1213 行 `\`include "riscv_core_setting.sv"` 通过 incdir 把 target 的核配置注入包；第 1528 行起依次 include 各类子文件（矢量/PMP 配置、gen_config、全部 ISA 指令类）。 |
| `riscv_defines.svh` | 131 | 宏定义层：`add_instr`、`add_pseudo_instr`、`INSTR_BODY`、`VA_INSTR_BODY`、`DEFINE_INSTR`/`DEFINE_CSR_INSTR`/`DEFINE_CUSTOM_INSTR`/`DEFINE_PSEUDO_INSTR` 等，把「一条指令」展开成一个带约束的 `riscv_<name>_instr` 类。 |
| `dv_defines.svh` | 89 | 通用宏：`uvm_object_new`、`DV_CHECK*`、`DV_CHECK_RANDOMIZE*`、`VECTOR_INCLUDE`。 |
| `riscv_signature_pkg.sv` | 59 | 签名（signature）机制枚举：`signature_type_t`、`signature_cause_t`、`signature_priv_mode_t`。测试程序把事件写到 `cfg.signature_addr`，TB 据此判定测试结束/进入某状态。 |

### 2.2 配置与寄存器模型

| 文件 | 行数 | 功能 |
|------|------|------|
| `riscv_instr_gen_config.sv` | 789 | **随机化配置中心**。字段分四类：①生成规模（`main_program_instr_cnt`、`sub_program_instr_cnt[]`、`num_of_sub_program`、`num_of_tests`）；②特权/CSR（`init_privileged_mode`、`mstatus/mie/sstatus…`、`mtvec_mode`、`tvec_alignment`、异常/中断委派数组）；③功能开关（`no_branch_jump/no_load_store/no_csr_instr/no_ebreak/no_fence/no_wfi`、`illegal_instr_ratio`、`hint_instr_ratio`、`enable_floating_point`、`enable_vector_extension`、`vector_instr_only`、`enable_sfence`、`bare_program_mode`、`enable_interrupt`、`enable_page_table_exception`）；④内存布局（`mem_region[$]`、`amo_region[$]`、`stack_len`、`s_mem_region[$]`、`kernel_stack_len`）；以及子配置 `riscv_vector_cfg`、`riscv_pmp_cfg`、`data_page_pattern`、`signature_addr`。 |
| `riscv_reg.sv` | 156 | 通用寄存器模型：`riscv_reg_field`（单字段，`val`+硬连线/保留位约束）+ `riscv_reg#(REG_T)`（字段队列、`get_val/set_field/rand_field/get_field_by_name/reset`）。 |
| `riscv_privil_reg.sv` | 575 | 特权寄存器模型：继承 `riscv_reg#(privileged_reg_t)`，`init_reg()` 按寄存器名逐位定义字段（MSTATUS/MIE/MIP/SATP/PMPCFG/MSEccfg/DCSR…），是 `riscv_privileged_common_seq` 生成 CSR 写序列的依据。 |
| `riscv_vector_cfg.sv` | 156 | 向量扩展配置：`vtype`(vsew/vlmul)、`vl`、`vstart`、`vxrm/vxsat`、`vec_fp`、`vec_narrowing_widening`、`vec_quad_widening`、`vec_reg_hazards`、`enable_zvlsseg`、`allow_illegal_vec_instr`。 |
| `riscv_pmp_cfg.sv` | 1072 | **PMP（物理内存保护）配置与代码生成**（最复杂文件之一）：`pmp_num_regions`、`pmp_cfg[]`(R/W/X/A/L + 地址模式 NA4/NAPOT/TOR)、`mseccfg`、`allow_high_addrs`；提供解析（`parse_pmp_config`/`parse_mseccfg`）、地址换算（`convert_addr2pmp`/`format_addr`）、生成（`gen_pmp_instr`、`gen_pmp_enable_all`、`gen_pmp_exception_routine`、`gen_pmp_write_test`）。 |

### 2.3 程序与指令序列生成

| 文件 | 行数 | 功能 |
|------|------|------|
| `riscv_asm_program_gen.sv` | 1645 | **汇编程序总装**。`gen_program()` 按 hart 循环生成：`gen_program_header` → `setup_misa` → `create_page_table` → `pre_enter_privileged_mode` → `gen_init_section`（GPR/FPGPR/向量寄存器初始化）→ PMP 时插入各 trap handler 与 `gen_test_done` → `gen_sub_program` → 主程序 `riscv_instr_sequence` → `gen_callstack` → `post_process_instr` → `insert_sub_program` → 数据段/栈段/内核段/页表段 → `gen_test_file()` 落盘 `.S`。子程序含 `gen_delegation`、`trap_vector_init`、`gen_all_trap_handler`、`gen_interrupt_vector_table`、`gen_privileged_mode_switch_routine` 等。 |
| `riscv_instr_sequence.sv` | 352 | **一段程序的指令序列**（主程序/子程序/内核程序）。`gen_instr()` 逐条随机（避免一次性约束求解导致规模爆炸）；`gen_stack_enter/exit_instr()` 生成栈帧保存恢复；`post_process_instr()` 做分支目标分配（只允许前向跳转，防止死循环）、非法指令/HINT 注入、无用标签清理；`generate_instr_stream()` 转成字符串列表。 |
| `riscv_instr_stream.sv` | 314 | **指令流的基类与随机流**。`riscv_instr_stream`：`instr_list[$]` 容器 + `insert_instr` / `insert_instr_stream` / `mix_instr_stream`（把定向流混入随机流）。`riscv_rand_instr_stream`：`setup_allowed_instr()`、`randomize_instr()`、`randomize_gpr()`、`setup_instruction_dist()` 按 `instr_category_dist` 权重选指令。 |
| `riscv_directed_instr_lib.sv` | 484 | **定向指令流库**：`riscv_directed_instr_stream`（基类）、`riscv_mem_access_stream`、`riscv_jump_instr`（JAL/JALR/分支跳转）、`riscv_jal_instr`、`riscv_push_stack_instr` / `riscv_pop_stack_instr`（栈帧）、`riscv_loop_instr` 相关注册。 |
| `riscv_load_store_instr_lib.sv` | 684 | **访存指令流库**：`riscv_load_store_base_instr_stream`（`num_load_store`、`base`、`locality`、`max_load_store_offset`、`use_sp_as_rs1`）+ 派生 `single / stress / shared_mem / rand / unaligned / page_cross` 等流，覆盖地址对齐、跨页、共享内存等场景。 |
| `riscv_amo_instr_lib.sv` | 230 | **原子指令流库**：`riscv_amo_base_instr_stream`（`num_amo`、地址对齐约束 `aligned_amo_c`）、`riscv_lr_sc_instr_stream`（LR/SC 环路）、`riscv_amo_instr_stream`、`riscv_vector_amo_instr_stream`。 |
| `riscv_loop_instr.sv` | 204 | **循环结构生成**：随机嵌套层数 `num_of_nested_loop`、循环计数/上限寄存器、`branch_type[]`、`loop_init_val/step/limit`，`build_loop_instr_stream()` 产出带正确退出条件的循环体。 |
| `riscv_callstack_gen.sv` | 202 | **调用栈/程序拓扑生成**：`riscv_program`（program_id、call_stack_level、子程序列表）；`riscv_callstack_gen` 随机出主程序与子程序之间的调用关系（`MAX_CALLSTACK_DEPTH`/`MAX_SUB_PROGRAM_CNT`/`MAX_CALL_PER_FUNC`），供 `insert_sub_program` 插入 jal/jalr。 |
| `riscv_data_page_gen.sv` | 110 | **数据页生成**：按 `data_page_pattern`（RAND_DATA / ALL_ZERO / INCR_VAL）产生 `.data` 段的随机数据与标签。 |
| `riscv_pseudo_instr.sv` | 48 | 伪指令模型：`riscv_pseudo_instr_name_t`（如 `LA`、`LI`、`MV`…），`convert2asm()` 生成伪指令文本。 |
| `riscv_privileged_common_seq.sv` | 218 | **特权模式进入序列**：`enter_privileged_mode()` + `setup_mmode_reg/smode_reg/umode_reg` 生成 mstatus/mie/medeleg/mideleg 等 CSR 写序列，`setup_satp()` 建立地址翻译，最后 mret/sret 切换到目标特权级。 |
| `riscv_debug_rom_gen.sv` | 252 | **调试 ROM 生成**（继承 `riscv_asm_program_gen` 并覆写 `gen_program`）：调试异常处理、ebreak 前后处理、单步逻辑（`gen_single_step_logic`）、`dpc/dcsr` 更新、`dcsr.ebreak` 设置。由 base_test 通过 factory override 挂到 `asm_gen.debug_rom`。 |
| `riscv_page_table.sv` | 71 | 页表：`riscv_page_table#(satp_mode_t MODE)`，持有 `pte[]`，`init_page_table()`、`gen_page_table_binary()`（生成二进制 PTE 文件）、`gen_page_table_section()`。 |
| `riscv_page_table_entry.sv` | 194 | 页表项：`riscv_page_table_entry#(MODE)` 的 V/XWR/U/G/A/D/RSW/PPN0-3/RSVD 字段与合法性约束（`access_dirty_bit_c`、`reserved_bits_c`），`bits` 拼接成最终 PTE 值。 |
| `riscv_page_table_list.sv` | 550 | **多级页表集合与页表异常注入**：多层页表随机化（`randomize_page_table`）、合法 PTE 生成（`create_valid_pte`）、异常注入（`inject_page_table_exception`：无效页/权限错/超级页未对齐/叶子链接）、页错误处理例程生成（`gen_page_fault_handling_routine`）、父子表遍历（`get_child_table_id`/`get_level`）。 |
| `riscv_page_table_exception_cfg.sv` | 69 | 页表异常开关与比例：`allow_page_access_control_exception`、`allow_superpage_misaligned_exception`、`allow_leaf_link_page_exception`、`allow_invalid_page_exception`、`allow_privileged_mode_exception`、`allow_zero_access_bit_exception`、`allow_zero_dirty_bit_exception`。 |
| `riscv_illegal_instr.sv` | 431 | **非法指令发生器**：按 `illegal_instr_type_e`（reserved opcode/func3/func7、非法 CSR、system 指令等）与 `reserved_c_instr_e` 随机构造 32 位非法编码（`instr_bin`），含各扩展的合法性约束（B/Zba/Zbs、压缩指令）。 |

### 2.4 覆盖率模型

| 文件 | 行数 | 功能 |
|------|------|------|
| `riscv_instr_cover_group.sv` | 2579 | **功能覆盖率模型主体**。用 `*_CG_BEGIN/CG_END` 宏为每条/每类指令生成 covergroup（如 `add_cg`、`addi_cg` + `cp_rs1/cp_rd/cp_imm_sign/cp_gpr_hazard`…），另含 `rv32i_misc_cg`、`wfi_cg`、`illegal_compressed_instr_cg`、`opcode_cg`、`compressed_opcode_cg`、`branch_hit_history_cg`、`instr_trans_cg`（指令对转移）、`privileged_csr_cg`、`mcause_exception_cg`、`mcause_interrupt_cg`。`compliance_mode` 关闭微架构相关覆盖，`iss_mode` 决定样本来自 ISS trace 还是 RTL trace，`select_isa/cov_isa` 可只跑某一扩展。 |
| `isa/riscv_instr_cov.svh` | 437 | 覆盖率采样所需的信息扩充：`riscv_instr` 的采样派生类字段 `rs1_value/rs2_value/rd_value/fs1_value…`，以及 `get_operand_sign`、`get_operand_special_val`、`get_div_result`、`is_unaligned_mem_access`、`pre_sample()`、GPR/FPR/CSR 的 hazard 枚举（`gpr_habazard_t` 等）。 |

### 2.5 `src/isa/` — 指令定义（共 500 条 `DEFINE_*INSTR`）

| 文件 | 行数 | 指令数 | 覆盖内容 |
|------|------|-------|----------|
| `riscv_instr.sv` | 625 | 基类 | `riscv_instr`：静态注册表 `instr_registry`、分类表 `instr_group/instr_category/instr_names/basic_instr`、`instr_template`（浅拷贝模板，性能优化）。关键静态方法 `register()`、`create_instr_list(cfg)`（按 `supported_isa` + 各开关过滤）、`create_instr()`（用 UVM factory 按 `riscv_<NAME>_instr` 建对象）、`get_rand_instr()/get_instr()/get_load_store_instr()`。实例侧：`imm_c` 约束、`set_rand_mode()` 关闭无用操作数随机、`extend_imm()` 符号扩展、`convert2asm()` 汇编格式化、`get_opcode/get_func3/get_func7()` 编码（用于生成二进制）。 |
| `rv32i_instr.sv` | 81 | 54 | RV32I：LOAD/STORE/SHIFT/ARITH/LOGIC/COMPARE/BRANCH/JUMP/SYNCH/SYSTEM/CSR（`DEFINE_CSR_INSTR`）。 |
| `rv64i_instr.sv` | 30 | 12 | RV64I 新增：ADDIW/SLLIW/SRLIW/SRAIW/ADDW/SUBW/SLLW/SRLW/SRAW/LWU/LD/SD。 |
| `rv32m_instr.sv` / `rv64m_instr.sv` | 25 / 21 | 8 / 5 | M 扩展乘除；RV64 另有 MULW/DIVW/DIVUW/REMW/REMUW。 |
| `rv32a_instr.sv` / `rv64a_instr.sv` | 27 / 27 | 11 / 11 | A 扩展：LR/SC/AMOADD…AMOMAXU（.W / .D）。 |
| `rv32f/64f/rv32d/64d/32fc/32dc_instr.sv` | 42/20/42/22/4/20 | 26/4/26/6/4/4 | F/D 浮点加载存储、算术、比较、转换、融合乘加、FCVT 等。 |
| `rv32c/64c/128c_instr.sv` | 43/23/23 | 27/7/7 | 压缩指令（含 C.ADDI16SP、C.JAL 等 RV32 专有）。 |
| `rv32v_instr.sv` | 242 | 188* | **向量扩展 RVV v0.8，主力是类而非宏**：`rv32v_instr.sv` 的宏只登记 `VSETVL/VSETVLI` 这 2 条控制指令；真正的 180+ 条向量指令由 `riscv_vector_instr.sv` 里的 `riscv_vector_instr` 基类 + `va_variant`（vadd/vmul/vmacc/vred/vle/vse… 的变体枚举）在运行时生成汇编。 |
| `rv32b/rv64b_instr.sv` | 54/46 | 32/24 | B 位操作扩展（旧编码）。 |
| `riscv_zba/zbb/zbc/zbs_instr.sv` | 99/254/73/108 | 3/18/3/8 | Zba/Zbb/Zbc/Zbs 新位操作扩展。 |
| `rv32zba/…/rv64zbb/…` | 20~35 | 3~6 | 上述扩展的 RV32/RV64 变体条目。 |
| `riscv_amo_instr.sv` | 76 | 类 | `riscv_amo_instr` 基类（原子指令共用属性）。 |
| `riscv_compressed_instr.sv` | 394 | 类 | `riscv_compressed_instr`：`rvc_csr_c` 约束（`rs1'/rs2'/rd'` 只能落在 `x8~x15`）、`imm_align` 等压缩指令专属规则。 |
| `riscv_csr_instr.sv` | 182 | 类 | `riscv_csr_instr`：CSR 读写指令模型，静态 `create_csr_filter(cfg)` 依据 `gen_all_csrs_by_default`、`add_csr_write/remove_csr_write`、只读/权限限制筛选可写 CSR 集合。 |
| `riscv_floating_point_instr.sv` | 325 | 类 | `riscv_floating_point_instr`：FPR 操作数、`fcsr_rm` 舍入模式、NaN/Inf/denormal 特殊值约束。 |
| `riscv_vector_instr.sv` | 571 | 类 | `riscv_vector_instr`（继承 FP 指令类）：`vs1/vs2/vs3/vd`、`vm/wd`、`eew/vsew/vlmul`、`va_variant` 等向量操作数与变体。 |
| `isa/custom/riscv_custom_instr.sv` | 51 | 模板 | **用户自定义指令模板**：`riscv_custom_instr extends riscv_instr`，留 `get_instr_name()`/`convert2asm()` 的 TODO 供扩展。 |
| `isa/custom/riscv_custom_instr_enum.sv` | 2 | 模板 | 自定义指令名枚举（默认 `CUSTOM_1`），被 `riscv_instr_pkg.sv` 第 651 行 include。 |
| `isa/custom/rv32x_instr.sv` / `rv64x_instr.sv` | 18 / 18 | 1 / 0 | 自定义扩展 RV32X/RV64X 的 `DEFINE_CUSTOM_INSTR` 示例：`rv32x_instr.sv` 注册了 1 条 `CUSTOM_1`，`rv64x_instr.sv` 目前只有注释（**接入 C910 的 T-Head 自定义指令即从此处开始**）。 |

---

## 3. `test/` — UVM 测试平台

| 文件 | 行数 | 功能 |
|------|------|------|
| `riscv_instr_gen_tb_top.sv` | 26 | **仿真顶层 module**（`files.f` 的最后一个源文件，全库唯一 `module`）。`import uvm_pkg::*; import riscv_instr_test_pkg::*;` + `initial run_test();`，靠 `+UVM_TESTNAME=` 选择测试类（`run.py` 每次 iteration 拼该 plusarg）。 |
| `riscv_instr_test_pkg.sv` | 26 | 测试包：`include` `riscv_instr_test_lib.sv`、`riscv_instr_base_test.sv`、`riscv_instr_cov_test.sv`，并 `import riscv_instr_pkg::*`。 |
| `riscv_instr_test_lib.sv` | 57 | 具体测试类：`riscv_rand_instr_test`（instr_cnt=10000、5 个子程序、注入 7 种定向流各 4 份）、`riscv_ml_test`（关闭地址随机顺序约束）。 |
| `riscv_instr_base_test.sv` | 105 | **主测试类**（`uvm_test`）。`build_phase`：建 `riscv_instr_gen_config` 并放入 `uvm_config_db("instr_cfg")`，按 `+instr_seq=` 覆写指令序列类，调试模式下把 `riscv_asm_program_gen` override 成 `riscv_debug_rom_gen`。`run_phase`：循环 `num_of_tests` 次 → `randomize_cfg()` → `riscv_instr::create_instr_list(cfg)` → `riscv_csr_instr::create_csr_filter(cfg)` → `asm_gen.gen_program()` → `gen_test_file("<asm_file_name>_<i>.S")`。`report_phase` 统计 UVM 错误数打印 TEST PASSED/FAILED。 |
| `riscv_instr_cov_test.sv` | 244 | **覆盖率测试**：不生成程序，读入 `+trace_csv_0..N=` 指定的 CSV，重放并采样 `riscv_instr_cover_group`（另直接采样 `opcode_cg`/`compressed_opcode_cg`/`illegal_compressed_instr_cg`），`process_instr_name()` 归一化伪指令（如 FMV_S→FSGNJ_S）。由 `yaml/cov_testlist.yaml` 的 `gen_test` 选中，`cov.py` 驱动。 |
| `riscv_instr_test.sv` | 59 | 早期冒烟测试（直接 `get_rand_instr` 写 3×10000 条汇编）。**未被 `test_pkg` include，仓库内未见引用**（疑似废弃）。 |

> 串联方式：`files.f` 编译 tb_top → `run_test()` 读 `+UVM_TESTNAME=<testlist 的 gen_test>` → `riscv_instr_base_test::run_phase` → 产出 `.S`。**是 UVM 的 run_test/plusarg 机制，而不是层次化例化。**

---

## 4. `target/` — 核配置与测试列表（12 个 target，35 个文件）

每个 target 目录三件套：`riscv_core_setting.sv`（被 `riscv_instr_pkg.sv` 第 1213 行 include 的**核能力声明**，靠 `+incdir+<target>` 选中）、`testlist.yaml`（测试条目）、`riscvOVPsim.ic`（OVPsim 内存/CSR 配置，统一 `reset=0x80000000`、`unaligned=T`、`wfi_is_nop=T`、`--exitonsymbol _exit`）。

**已确认缺失**：`target/rv32imafdc/riscvOVPsim.ic` 不存在（该 target 只有 2 个文件）。

### 4.1 配置项含义

`XLEN`、`SATP_MODE`(BARE/SV32/SV39)、`supported_privileged_mode[]`、`unsupported_instr[]`、`supported_isa[$]`（决定 `create_instr_list` 例化哪些指令组）、`supported_interrupt_mode[]`+`max_interrupt_vector_num`、`support_pmp`/`support_epmp`/`support_debug_mode`/`support_umode_trap`/`support_sfence`/`support_unaligned_load_store`、`NUM_GPR`/`NUM_FLOAT_GPR`/`NUM_VEC_GPR`、向量 `VECTOR_EXTENSION_ENABLE`/`VLEN`/`ELEN`/`SELEN`/`VELEN`/`MAX_LMUL`、`NUM_HARTS`、`implemented_csr[]`/`custom_csr[]`/`implemented_interrupt[]`/`implemented_exception[]`（供覆盖率按需例化）。

### 4.2 rv64gc（最全）vs rv32imc（最简）逐项对比

| 项 | rv64gc | rv32imc |
|---|---|---|
| XLEN / SATP_MODE | 64 / SV39 | 32 / BARE |
| 特权模式 | U, S, M | M |
| supported_isa | RV32I/M/C + RV64I/M/C + A/F/D + **RV32X** | RV32I, RV32M, RV32C |
| support_sfence | 1 | 0 |
| implemented_csr | 37（含 U/S CSR、MEDELEG/MIDELEG、SATP、FCSR） | 14（仅 M 侧，无 FCSR） |
| implemented_interrupt / exception | 9 / 13 | 3 / 6 |
| 文件行数 | 188 | 149 |

**注意：`target/rv64imafdc/riscv_core_setting.sv` 与 `target/rv64gc/` 逐字节相同（diff 为空）**；`rv64gcv` 以 RVV 取代 RV32X 并打开 `VECTOR_EXTENSION_ENABLE`；全 target 共性为 `support_pmp=0`、`support_epmp=0`、`support_debug_mode=0`、`support_umode_trap=0`、`support_unaligned_load_store=1`、`NUM_HARTS=1`（除 `multi_harts`=2）、默认 VLEN=512/ELEN=32/MAX_LMUL=8。

### 4.3 testlist 继承关系（`scripts/lib.py` 递归解析 `import:`）

```
yaml/base_testlist.yaml            (13 个基础测试：arithmetic_basic / rand_instr / jump_stress /
                                    loop / rand_jump / mmu_stress / no_fence / illegal_instr /
                                    ebreak / ebreak_debug_mode / full_interrupt / csr_test / unaligned)
├── target/rv32i/testlist.yaml          +misaligned_instr
├── target/multi_harts/testlist.yaml    +shared_mem / amo / single_hart
└── target/rv32imc/testlist.yaml        +non_compressed / hint / pmp
    ├── target/rv32imc_sv32/            +riscv_u_mode_rand
    ├── target/rv32imcb/                +b_ext / zbb_zbt
    │   └── target/rv64imcb/            (纯转发，仅一行 import)
    ├── target/rv32imafdc/              +FP / amo / 特权
    └── target/rv64imc/                 (纯转发，仅一行 import)
        ├── target/rv64gc/              +machine / privileged / invalid_csr / page_table_exc /
        │                               sfence_exc / amo / FP×3 / mmu_stress
        ├── target/rv64gcv/             +vector_arithmetic / _stress / _load_store / _amo
        └── target/rv64imafdc/          同族（无 vector）
target/ml/testlist.yaml             独立，无 import（gen_test = riscv_ml_test）
yaml/cov_testlist.yaml              覆盖率专用（riscv_instr_cov_test / exp_...）
```

---

## 5. `yaml/` — 配置与测试列表

| 文件 | 行数 | 功能 |
|------|------|------|
| `base_testlist.yaml` | 199 | 所有 target 的测试基线，文件头即字段文档。条目字段：`test`（与 `-tn` 匹配）、`description`、`iterations`（可被 `-i` 覆盖）、`gen_test`（映射 `+UVM_TESTNAME=`）、`gen_opts`（`+xxx` 传给生成器）、`asm_test`/`c_test`（定向测试，与 `gen_test` 互斥，run.py 拆成两个 directed list）、`rtl_test`、`cmp_opts`/`sim_opts`、`gcc_opts`、`no_gcc`、`no_iss`、`no_post_compare`、`compare_opts`（如 `+compare_final_value_only=1`）。含 13 个基础测试，另支持 `import:` 键拼接其他 testlist。 |
| `cov_testlist.yaml` | 19 | 覆盖率测试列表（`riscv_instr_cov_test`、`exp_riscv_instr_cov_test`，均 `no_iss/no_gcc/no_post_compare=1`），由 `cov.py` 强制使用。 |
| `csr_template.yaml` | 120 | `scripts/gen_csr_test.py` 的 CSR 模板：`csr/address/privilege_mode` + `rv32`/`rv64` 字段列表（`field_name/type(WPRI\|WLRL\|WARL\|R)/reset_val/msb/lsb`，WARL 可带 `warl_legalize` Python 片段）。 |
| `iss.yaml` | 43 | **各 ISS 的调用配置**：spike（`--log-commits --isa=<variant> --misaligned -l`）、ovpsim（`riscvOVPsimPlus.exe --controlfile <cfg_path>/riscvOVPsim.ic … --trace --traceregs`）、sail（`riscv_ocaml_sim_RV<xlen>`）、whisper（`--log --configfile <config_path>/whisper.json`）、renode（转调 `renode_wrapper.py`）。占位符 `<path_var>/<xlen>/<variant>/<elf>/<cfg_path>/<scripts_path>/<config_path>` 由 `parse_iss_yaml` 替换。 |
| `whisper.json` | 7 | Whisper 的 ICCM 区间配置，被 `iss.yaml` 的 `--configfile` 引用。 |
| `simulator.yaml` | 156 | **各仿真器配置**：vcs/ius/questa/dsim/qrun/riviera/xlm/pyflow 的 `compile.cmd`（列表，可多步）+`compile.cov_opts`+`sim.cmd`+`sim.cov_opts`，可选 `env_var`（如 dsim 的 `DSIM,DSIM_LIB_PATH`）。占位符 `<cwd>/<setting>/<user_extension>/<out>/<cmp_opts>/<sim_opts>/<seed>/<test_id>/<test_name>` 由 `get_generator_cmd`/`do_compile`/`do_simulate` 替换。pyflow 只有 `sim`（`python3 <cwd>/pygen/pygen_src/test/<test_name>.py`），无 compile。 |

---

## 6. `scripts/` — 编译、仿真与 trace 比对工具

| 文件 | 行数 | 功能 |
|------|------|------|
| `lib.py` | 607 | **工具函数库**：`run_cmd/run_parallel_cmd`（进程执行与日志）、`check_simulator`、`read_yaml`、`get_env_var`、gcc 编译封装、目录/文件处理、`parse_iss_yaml` 等。被 `run.py`、`cov.py` 广泛调用。 |
| `instr_trace_compare.py` | 292 | **轨迹比对核心**：把 `--csv_file_1/--csv_file_2`（RTL trace 与 ISS trace）按指令序号对齐，逐条比较 GPR/CSR（`--gpr`/`--csr` 指定要比较的寄存器），支持跳过规则与 `--stop_on_first_error`，输出差异报告。 |
| `riscv_trace_csv.py` | 101 | 统一 trace CSV 的读写类（基类），定义 trace 记录字段（pc、instr、二进制、各 GPR）。 |
| `spike_log_to_trace_csv.py` | 252 | Spike `--log-commits` 日志 → 统一 CSV。 |
| `ovpsim_log_to_trace_csv.py` | 226 | OVPsim 日志 → 统一 CSV。 |
| `sail_log_to_trace_csv.py` | 98 | Sail-RISC-V trace → CSV（仅认寄存器写行 `xN <- 0x…`，起于 M 模式 0x…1010，遇 ecall 止）。 |
| `whisper_log_trace_csv.py` | 94 | Whisper ISS trace → CSV（**注意实际文件名无 `_to_`**）。仅 `type=='r'` 的寄存器写生成 entry。 |
| `renode_log_to_trace_csv.py` | 160 | Renode trace → CSV：基于 `REGDUMP:` 行做**差分**（逐行 diff X0–X31，pc 取上次 PC，binary="0"、无指令文本，CSR 为 TODO）。 |
| `renode_wrapper.py` | 115 | 生成 Renode `.repl`/`.resc` 脚本（内存映射 @0x80000000、`SetHookAtBlockEnd` 打印 REGDUMP、自定义 ecall 处理）并启动 `renode --console`。 |
| `gen_csr_test.py` | 434 | **CSR 定向测试生成**：解析 `yaml/csr_template.yaml`（字段类型 WPRI/WLRL/WARL/R，WARL 用 YAML 内嵌 `warl_legalize` 片段），实现 `csr_write/csr_read/predict_csr_val` 参考模型，每个 CSR×每种操作×3 组值生成带 `bne → csr_fail` 自检的汇编；pass 写 0x01、fail 写 0x101 到 `end_signature_addr`。 |
| `genMetricsList.py` | 65 | 从硬编码测试名生成 `regression_list.json`（供 `.metrics.json` 的 `listCmd`）。 |
| `metrics-regress.py` | 117 | Metrics/CHIPS Alliance CI 客户端：POST `/api/v1/projects/<id>/regressionRuns` 并轮询，按失败数 exit 0/1（需 `METRICS_CI_TOKEN`）。 |
| `check-status` | 10 | bash：按 `run.py` 返回码打印 Test passed/failed。 |
| `link.ld` | 33 | 链接脚本，被 gcc 编译/定向测试以 `-T` 引用。 |
| `deprecated/` | 260~438 ×4 | 旧版脚本：`instr_trace_compare.py`、`ovpsim_log_to_trace_csv.py`、`riscv_trace_csv.py`、`spike_log_to_trace_csv.py`。**全目录已无活动代码引用**，仅历史保留。注意：旧版比较器里「乱序/coalescing」分支是活的，而当前版本把它注释掉了。 |

**trace 转换器的统一模式**：①`sys.path` 后 `from riscv_trace_csv import *`；②模块级正则 + `process_<iss>_sim_log(log, csv)`；③先匹配指令行（pc/instr_str/binary/mode）再匹配寄存器写行（追加 `gpr`/`csr`，格式 `abi名:hex值`）；④用 `convert_pseudo_instr`/`gpr_to_abi`/`sint_to_hex` 规范化；⑤起止过滤（跳过 trampoline、遇 ecall 停止）；⑥`RiscvInstructionTraceCsv` 输出统一 9 列表头 `pc,instr,gpr,csr,binary,mode,instr_str,operand,pad`；⑦各带 `argparse main()` 可独立调试。

**`instr_trace_compare.py` 比较算法**：`compare_trace_csv(...)` 读入两侧 CSV，按顺序对齐（`in_order_mode=1`）；跳过 `gpr` 为空或无架构状态更新的条目，逐项比较 GPR/CSR 字符串，输出 `[PASSED]: N matched` / `[FAILED]: N matched, M mismatch`。**注意：`in_order_mode=0` 的乱序比较在本快照中被注释（`TODO: Enable out of order comparison`），一旦走到该分支会恒打印 `0 matched / PASSED`**，`coalescing_limit`/`compare_final_value_only` 参数当前无实际作用。

---

## 7. `pygen/` — 纯 Python 生成器（pyflow）

### 7.1 `pygen/pygen_src/` 核心（20 个 .py + README，共 15173 行）

**与 SV 版最大的架构差异**：pyflow 用**模块级单例**而非参数传递——`riscv_instr_gen_config.py` 末行实例化 `cfg`（import 时即 `parse_args()` 并 `import pygen_src.target.<target>.riscv_core_setting as rcs`），`riscv_instr_pkg.py` 实例化 `pkg_ins`；所有模块通过 `import cfg / pkg_ins` 取配置。

| 文件 | 行数 | 关键定义 | 功能 |
|------|------|----------|------|
| `riscv_instr_cover_group.py` | 8121 | `riscv_instr_cover_group`（`__init__/cg_instantiation/sample/reset`） | Python 版**功能覆盖率模型**（全仓最大文件）。AST 统计：**174 个生效 covergroup 类**（另 33 个被注释）、**1430 个 coverpoint、67 个 cross**、978 个 `bin_array`、82 个 `vsc.bin`。`sample(instr)` 流程：计数 → `check_hazard_condition(pre_instr)` 建立上一条指令的 RAW/WAR/WAW 与 LSU 冒险 → 按 `binary[1:0]` 分流（压缩→`hint_cg`+`illegal_compressed_instr_cg`；否则 `opcode_cg`）→ `eval("self."+<name>+"_cg_i").sample()` 逐指令派发（**异常被 `except Exception` 静默吞掉**）→ RV32I 补采 `rv32i_misc_cg`、`mepc_alignment_cg` → 记录 `pre_instr`。**⚠️ 实测有 26 个 covergroup 从未实例化，覆盖严重缺失，详见 §7.4①。** |
| `riscv_instr_pkg.py` | 2022 | 全部枚举（`riscv_instr_name_t` 数百项、`privileged_reg_t`、`hazard_e`/`branch_hazard_e`/`store_lsu_hazard_e`、`vtype_t`、`b_ext_group_t`…）+ `get_val`、`get_attr_list`、类 `riscv_instr_pkg`（`hart_prefix/get_label/format_string/format_data/push|pop_gpr_from_kernel_stack`）+ 单例 `pkg_ins` | Python 版总包。`get_attr_list` 是「指令名→[format,category,group,imm_type]」表；`push/pop_gpr_from_kernel_stack` 生成 trap 上下文保存/恢复汇编（含 mstatus.MPRV/MPP 判断虚拟或物理栈指针）。 |
| `riscv_asm_program_gen.py` | 1197 | `riscv_asm_program_gen`：`gen_program/gen_program_header/gen_init_section/setup_misa/init_gpr/init_floating_point_gpr*`、`gen_sub_program/gen_callstack/insert_sub_program`、`gen_data_page/gen_stack_section/gen_kernel_sections`、`gen_trap_handler*/gen_interrupt_vector_table/gen_ecall_handler/gen_illegal_instr_handler`、`trap_vector_init/setup_epc/gen_privileged_mode_switch_routine`、`gen_signature_handshake`、`add/get/generate_directed_instr_stream`、`gen_section/gen_test_file` | Python 版汇编总装。定向流按「千条指令比例」注入：`insert_cnt = original_instr_cnt*ratio//1000`，每次 `factory(name)` + `deepcopy` + `randomize()` 后集中 `random.shuffle`。**但 20+ 个方法为空实现**（见 7.4）。 |
| `riscv_instr_gen_config.py` | 684 | 单例 `cfg`：指令数、`data_page_pattern`、`mem_region/amo_region/s_mem_region`、`gpr[4]/scratch_reg/pmp_reg/sp/tp/ra`、`mstatus_*`、~60 个 argparse 开关、`category_dist`；约束 `default_c/mtvec_c/mstatus_c/ra_c/sp_tp_c/reserve_scratch_reg_c/gpr_c/addr_translation_c/floating_point_c`；方法 `parse_args/setup_instr_distribution/check_setting/get_invalid_priv_lvl_csr` | Python 版随机化配置。`check_setting()` 用 `supported_isa` 反推 XLEN/SATP 合法性，不合法直接 `sys.exit`；`get_invalid_priv_lvl_csr()` 按初始特权级把 D/M/S 前缀 CSR 列入非法 CSR 列表。**注意：delegation/debug/向量等约束为 `pass`。** |
| `riscv_illegal_instr.py` | 368 | `illegal_instr_type_e`(7 种)、`reserved_c_instr_e`(12 种)、`riscv_illegal_instr`（`exception_dist_c` 权重 3/1/1/1/1/3/3、`illegal_opcode_c`、`illegal_func3_c`/`func7_c`、`system_instr_c`、`reserved_compressed_instr_c`、`hint_instr_c`、`b_extension_c`）、`initialize()`、`get_bin_str()` | 非法/压缩 HINT 指令二进制生成，被 `riscv_instr_sequence.insert_illegal_hint_instr` 使用。 |
| `riscv_directed_instr_lib.py` | 350 | `riscv_directed_instr_stream`、`riscv_mem_access_stream`（`add_rs1_init_la_instr`/`add_mixed_instr`）、`riscv_jal_instr`、`riscv_int_numeric_corner_stream`（0/全 1/负最大值）、`riscv_push_stack_instr`/`riscv_pop_stack_instr` | 定向指令流库，全部经 `riscv_utils.factory` 被 asm_program_gen 调用。 |
| `riscv_instr_sequence.py` | 312 | `gen_instr/gen_stack_enter_instr/gen_stack_exit_instr/post_process_instr/insert_jump_instr/generate_instr_stream/generate_return_routine/insert_illegal_hint_instr` | 指令序列生成。`gen_instr` 逐条随机化（避免整段约束求解爆炸）；`post_process_instr` 插入定向流→编号 `idx`→按 `illegal_instr_pct`/`hint_instr_pct` 抽样打标→分配本地数字标签→**只做前向**分支目标分配（`idx + rand(1..max_branch_step)`，越界截断）→清理无用标签；`insert_illegal_hint_instr` 按 `instr_cnt*ratio/1000` 在随机位置插 `.4byte`/`.2byte`。 |
| `riscv_load_store_instr_lib.py` | 310 | `locality_e`(NARROW/HIGH/MEDIUM/SPARSE)、`riscv_load_store_base_instr_stream` + `single`/`stress`/`shared_mem`/`rand`/`hazard` 子类 | 访存指令流库，按 locality 随机地址偏移、按对齐/XLEN/压缩支持动态构造候选指令。 |
| `riscv_instr_stream.py` | 270 | `riscv_instr_stream`（`initialize_instr_list/insert_instr/insert_instr_stream`（避开 atomic）/`mix_instr_stream/convert2string`）+ `riscv_rand_instr_stream`（`setup_allowed_instr/setup_instruction_dist/gen_instr/randomize_instr/randomize_gpr`） | 指令流容器与随机流，是所有定向流与 loop 的父类。 |
| `riscv_loop_instr.py` | 255 | `riscv_loop_instr`（`legal_loop_regs_c`、`loop_c`、`build_loop_instr_stream`） | 嵌套循环定向流：约束 1~2 层、循环寄存器与 reserved 不冲突且 unique、init/step/limit 符号一致且差值整除步长。 |
| `riscv_privileged_common_seq.py` | 207 | `enter_privileged_mode/setup_mmode_reg/setup_smode_reg/setup_umode_reg/gen_csr_instr/setup_satp/mstatus_set_field/sstatus_set_field/ustatus_set_field/mie_set_field/sie_set_field/uie_set_field` | 特权模式进入例程（mret + CSR 写序列）。**注意：定义的是 `__init___`（三下划线），实际没有 `__init__`。** |
| `riscv_amo_instr_lib.py` | 192 | `riscv_amo_base_instr_stream`、`riscv_lr_sc_instr_stream`、`riscv_amo_instr_stream`、`riscv_vector_amo_instr_stream`（空） | 原子/LR-SC 定向指令流。 |
| `riscv_defines.py` | 156 | `DEFINE_INSTR`、`DEFINE_C_INSTR`、`DEFINE_FP_INSTR`、`DEFINE_FC_INSTR`、`DEFINE_B_INSTR`、`DEFINE_AMO_INSTR`；`add_pseudo_instr` 仍为 TODO | **指令注册工厂（Python 版）**：用 `type()` 动态建 `riscv_<name>_instr` 并注册，是 `isa/` 各扩展文件的唯一依赖。**缺 `DEFINE_CSR_INSTR`/`DEFINE_VA_INSTR`/`DEFINE_CUSTOM_INSTR`/`DEFINE_ZBA/ZBB/ZBC/ZBS_INSTR`。** |
| `riscv_callstack_gen.py` | 148 | `riscv_program`（program_id/call_stack_level/sub_program_id）、`riscv_callstack_gen`（层级递增约束 + `post_randomize` 自顶向下分配 + `print_call_stack`） | 调用树生成（避免死循环）。 |
| `riscv_reg.py` | 132 | `riscv_reg_field`（`zero_reserved_field_c`/`hardwired_fld_c`）+ `riscv_reg`（`init_reg/get_val/add_field/set_field/rand_field/reset/set_val`） | 轻量寄存器模型，`riscv_privil_reg` 的父类。 |
| `riscv_data_page_gen.py` | 92 | `gen_data`（静态：RAND_DATA/INCR_VAL/ALL_ZERO）、`gen_data_page` | 数据段生成，遍历 `mem_region/amo_region/s_mem_region` 输出 `.section` + `.word`。 |
| `riscv_privil_reg.py` | 79 | `riscv_privil_reg.init_reg` | 特权 CSR 定义。**仅实现 MSTATUS 与 MIE，其余 `logging.error("not supported yet")`**（SV 版 575 行覆盖 M/S/U）。 |
| `riscv_utils.py` | 70 | `factory(obj_of)`（11 个定向流名→类名映射）、`gen_config_table()`（pandas+tabulate 打印 cfg） | Python 特有，**无 SV 对应文件**。 |
| `riscv_signature_pkg.py` | 61 | `signature_type_t`(CORE_STATUS/TEST_RESULT/WRITE_GPR/WRITE_CSR)、`core_status_t`(14 项)、`test_result_t` | 与 TB 的握手协议枚举，与 SV 版几乎 1:1。 |
| `riscv_pseudo_instr.py` | 47 | `riscv_pseudo_instr`（LI/LA） | 伪指令模型。 |
| `README.md` | 100 | — | pyflow 说明：基于 PyVSC；仅 machine mode；自述 1 万条指令约需 12 分钟。 |

**pyflow 覆盖率采样链路**：`test/riscv_instr_cov_test.py` 解析 CSV（pc/binary/instr/operand/gpr/instr_str）→ 重建 `riscv_cov_instr` → `assign_attributes()`（用 `pkg.get_attr_list`）→ `pre_sample()` 计算符号位/特殊值/未对齐/比较结果/分支命中/除法结果 → `riscv_instr_cover_group.sample()`；报告由 `vsc.get_coverage_report` 写 `CoverageReport.txt`，`--enable_visualization` 时写 `cov_db.xml`（供 pyucis-viewer）。

### 7.2 `pygen/pygen_src/isa/`、`test/`、`target/`

**注册机制（与 SV 版不同）**：`isa/` 下 14 个扩展文件**没有类、没有装饰器、没有 `@isa` 宏**，只是一连串 `DEFINE_INSTR / DEFINE_C_INSTR / DEFINE_FP_INSTR / DEFINE_FC_INSTR / DEFINE_B_INSTR / DEFINE_AMO_INSTR` 调用（宏定义在 `riscv_defines.py`）。宏内部用 `type(class_name, (基类,), {...})` 动态建类，并在创建时以「副作用」调用 `<基类>.register(instr_n, instr_group)` 完成注册；类名固定为 `riscv_<NAME>_instr`。全 `isa/` 仅 5 个基类带 `@vsc.randobj`。运行时 `riscv_instr.create_instr()` 按 `group.name.lower()+"_instr"` 反查模块、按 `"riscv_"+instr_name+"_instr"` 反查类名并 `eval` 实例化。

| 路径 | 行数 | 说明 |
|------|------|------|
| `isa/riscv_instr.py` | 533 | `@vsc.randobj` 指令基类。字段分三层：身份元数据（group/format/category/instr_name/imm_type/imm_len）、操作数（`rand_enum_t` rs1/rs2/rd、`rand_bit_t(32)` imm、csr）、辅助状态（`imm_mask/shift_t/mask/XLEN`、is_compressed/is_branch_target/imm_str/label/comment）。四段式协作：`set_rand_mode()` 决定哪些操作数存在 → `imm_c` 约束随机化 → `set_imm_len()`/`extend_imm()` 定宽与符号扩展 → `convert2asm()` 按 format×category 拼汇编。静态方法 `register/create_instr_list/create_instr/build_basic_instruction_list/create_csr_filter/get_rand_instr`，与 SV 版一一对应。 |
| `isa/riscv_cov_instr.py` | 590 | **覆盖率采样载体**（普通类，非 `@vsc.randobj`）。类属性 `gpr_state={}` 跨指令维护寄存器值；`pre_sample()` 把原始值提炼成 coverpoint 友好的枚举（操作数符号、特殊值、compare_result、logical_similarity、div_result、gpr/lsu hazard、branch_hit、非对齐访问）；`check_hazard_condition()` 计算 RAW/WAW/WAR 冒险；`update_src_regs/update_dst_regs` 解析 CSV 操作数并更新寄存器状态。它是「CSV trace → covergroup」之间唯一的桥。 |
| `isa/riscv_compressed_instr.py` | 228 | C 扩展基类：`rvc_csr_c`（CIW/CL/CS/CB/CA 的寄存器限 x8–x15）、`imm_val_c`、`jal_c`（XLEN≠32 禁 C_JAL）、`no_hint_illegal_instr_c`；重载 `set_imm_len/imm_align/extend_imm/set_rand_mode/convert2asm`（C_EBREAK → `c.ebreak; c.nop` 保证 pc+4 边界）。 |
| `isa/riscv_floating_point_instr.py` | 213 | 浮点基类：`fs1/fs2/fs3/fd`（`rand_enum_t(riscv_fpr_t)`）、`has_fs*`；`set_rand_mode()` 按 I/S/R/R4/CL/CS 切换 GPR/FPR；`convert2asm()` 处理 FMV_X_*/FMV_*_X/FCVT_*/COMPARE/R4；覆盖接口委托 `riscv_cov_instr`。 |
| `isa/riscv_b_instr.py` | 178 | B 扩展基类：加 `rs3=rand_enum_t(riscv_reg_t)`、`has_rs3`；`set_imm_len()` 依 log2(XLEN)；`is_supported(cfg)` 检查 `enable_b_extension` 与 `enable_bitmanip_groups`（ZBB/ZBS/ZBP/ZBE/ZBF/ZBC/ZBR/ZBM/ZBT）。 |
| `isa/riscv_amo_instr.py` | 71 | A 扩展基类：`aq/rl` 位 + `aq_rl_c`（不可同时为 1）；`get_instr_name()` 拼 `.w`/`.d` 与 `.aq`/`.rl` 后缀。 |
| `isa/rv32i_instr.py` (138) | 54 条 | RV32I 全量（含 6 条 CSR 指令，imm_type=UIMM）。 |
| `isa/rv32m_instr.py` (35) | 8 条 | RV32M。**注意：REMU 被登记为 `LOAD` 类别，疑为笔误（未确认）**。 |
| `isa/rv32a_instr.py` (40) / `rv64a_instr.py` (39) | 11 / 11 | LR/SC/AMO*（.W / .D）。 |
| `isa/rv32c_instr.py` (77) / `rv64c_instr.py` (33) | 27 / 7 | 压缩指令。 |
| `isa/rv32f_instr.py` (71) / `rv32d_instr.py` (71) / `rv32fc_instr.py` (27) / `rv32dc_instr.py` (27) / `rv64d_instr.py` (29) / `rv64f_instr.py` (25) | 26/26/4/4/6/4 | 浮点单/双精度与压缩浮点。 |
| `isa/rv32b_instr.py` (135) | 55 条 | B 位操作（LOGICAL/SHIFT/ARITHMETIC 三组）。**仓库内无 `rv64b_instr.py`**，而 `riscv_instr_group_t.RV64B` 枚举存在且 cov_test 会引用 RV64B（不一致，未确认）。 |
| `isa/rv64i_instr.py` (45) / `rv64m_instr.py` (29) | 12 / 5 | RV64 扩展指令。 |
| `test/riscv_instr_base_test.py` | 90 | 生成流程基类兼入口：`run()` 用 `multiprocessing.Pool(num_of_tests)` 并行 `_run_phase`（seed → `randomize_cfg` → `create_instr_list` → `get_directed_instr_stream` → `apply_directed_instr()` 钩子 → `gen_program` → `gen_test_file`）。模块级会按 `rcs.supported_isa` `import_module` 各扩展文件（**这一步才触发全部 `DEFINE_*` 注册**），并受 `cfg.argv.gen_test` 门控启动。 |
| `test/riscv_rand_instr_test.py` | 48 | 最常用生成子类：固定 `instr_cnt=10000`、`num_of_sub_program=5`，注入 `riscv_load_store_rand_instr_stream`/`riscv_jal_instr`/`riscv_load_store_hazard_instr_stream` 各 4 份；模块底部**无条件**实例化并 `run()`。 |
| `test/riscv_instr_cov_test.py` | 211 | 覆盖率分析入口（输入 `--trace_csv`，非生成程序）：逐行解析 CSV → `riscv_cov_instr` → `assign_attributes` → 按 `supported_isa` 过滤 → `pre_sample()` → `instr_cg.sample()`；`process_instr_name/update_instr_name` 做旧名映射（FMV_S_X→FMV_W_X）与伪指令展开（FMV_S→FSGNJ_S 等）；`get_coverage_report()` 写 `CoverageReport.txt`（tabulate 汇总 SCORE/WEIGHT/NAME），`enable_visualization` 时另写 `cov_db.xml`。由 `cov.py --simulator=pyflow` 调用。 |
| `target/<name>/riscv_core_setting.py` + `riscvOVPsim.ic` | 116~146 | Python 版核配置，同一组 22 个配置项（XLEN/SATP_MODE/supported_isa/unsupported_instr/supported_privileged_mode/implemented_csr/custom_csr/NUM_HARTS/VLEN/ELEN…），以 `rcs.*` 形式被 `isa/`、`test/`、`riscv_instr_gen_config` 全局消费。 |

**pygen 的 target 集合比 SV 版少**（7 个：`rv32i`、`rv32imc`、`rv32imafdc`、`rv32imcb`、`rv64imc`、`rv64imafdc`、`multi_harts`），**没有** `rv64gc`/`rv64gcv`/`rv32imc_sv32`/`rv64imcb`/`ml`。差异要点：`rv32imc` 是 run.py 的 `--target` 默认值；`rv32imafdc` 是唯一 32 位带浮点/A 的配置；`rv64imafdc` 是唯一支持 SV39 与 U/S/M 的配置（34 项 CSR，含 SATP/SEDELEG/SIDELEG）；`multi_harts` 唯一 `NUM_HARTS=2`。

**已知不一致（未确认原因）**：`pygen_src/target/rv32imafdc/riscvOVPsim.ic` 写的是 `--variant RV64GC`、`MXL=2`，与其 `riscv_core_setting.py` 的 XLEN=32/M-only 矛盾；`rv64imc/`、`rv64imafdc/` 下**缺 `riscvOVPsim.ic`**（对比 SV 版 `target/` 目录 12 个 target 中有 11 个 `.ic`）。

### 7.3 `pygen/experimental/`

早期 Python 原型（`riscv_instr_base.py`、`riscv_asm_program_gen.py`、`riscv_directed_instr_lib.py`、`riscv_load_store_instr_lib.py`、`riscv_instr_sequence.py`、`riscv_instr_stream.py`、`riscv_callstack_gen.py`、`riscv_data_page_gen.py`、`riscv_rand_instr.py`、`utils.py` + `README.md`）。**已被 `pygen_src/` 取代，仅作参考**。

---

### 7.4 pyflow 的功能缺口（**重要：pyflow 不是 SV 版的完整等价物**）

`README.md` 自述「pyflow 是 SV 实现的等价替代」，但源码实测差距明显。若选 `--simulator pyflow`，需要知道以下能力缺位：

**① `riscv_instr_cover_group.py` 有 26 个 covergroup 定义了却从未实例化（严重）**

`cg_instantiation()` 有 **149 条赋值但只有 148 个不同实例**（`fsw_cg` 被连续赋值两次：`fsw_cg(1)` 后立刻被 `fsw_cg(0)` 覆盖，第一个权重变体丢失）。经**精确匹配** `self.<name>_cg_i = self.<name>_cg(` 复核，下列实例**在文件中完全不存在**：

`lb / lh / lw / lbu / lhu / sb / sh / sw / jalr / bne / blt / bge / bltu / bgeu / fsd / slli64 / srli64 / srai64`，外加 8 个模板基类实例（`r_/i_/u_/cmp_/sb_/j_instr_cg`、`load_/store_instr_cg`）。分支/跳转里**只有 `beq_cg_i` 和 `jal_cg_i` 存在**。

**后果**：RV32I 的**全部 load/store（LB/LH/LW/LBU/LHU/SB/SH/SW）、JALR、除 BEQ 外的 5 条分支、FSD、以及 RV64I 的 SLLI64/SRLI64/SRAI64 完全采不到覆盖率** —— `sample()` 里的 `eval(...)` 抛 `AttributeError` 后被 `except Exception` 静默吞掉，只留一行 log，**不会报错、不会失败，只是覆盖率数据缺失**。SV 版这些全部正常实例化。

> 排查提示：这类"静默缺失"用宽泛 `grep lb_cg_i` 会被 `c_lw_cg_i`/`mulhu_cg_i`/`flw_cg_i` 等**子串误报**掩盖，必须用 `self\.<name>_cg_i *= *self\.<name>_cg\(` 精确匹配。

**② SV 有、pyflow 完全缺失的文件**（7 个）：
`riscv_debug_rom_gen`、`riscv_page_table`、`riscv_page_table_entry`、`riscv_page_table_list`、`riscv_page_table_exception_cfg`、`riscv_pmp_cfg`、`riscv_vector_cfg`。
→ 即 **pyflow 不支持调试模式、页表/虚拟内存、PMP、向量扩展**；`cfg` 中的 `pmp_cfg`/`vector_cfg` 是注释掉的 TODO，SV 的 `pmp_reg[2]` 在 py 退化为单值。

**③ `riscv_asm_program_gen.py` 中 20+ 个空实现（pass/TODO）**：
`create_page_table`、`gen_page_table_section`、`setup_pmp`、`gen_pmp_csr_write`、`gen_delegation_instr`、`gen_ebreak_handler`、`gen_instr_fault_handler`、`gen_load_fault_handler`、`gen_store_fault_handler`、`gen_plic_section`、`format_section`、`dump_perf_stats`、`gen_debug_rom`、`randomize_vec_gpr_and_csr`、`init_vec_gpr`、`gen_dummy_csr_write`、`gen_kernel_program` 等。

**④ 指令序列链路不完整**：`riscv_instr_sequence` 的 **stack enter/exit 调用被注释**、`insert_jump_instr` 为 `pass` → **子程序调用/返回（jal/jalr + 栈帧保存恢复）链路不完整**。

**⑤ 库类不全**：访存库 SV 11 类 → py 6 类（缺 `hazard_instr`、`multi_page_load_store`、`mem_region_stress`、`rand_addr`、`vector_load_store`）；定向库缺 `riscv_jump_instr`；`riscv_privil_reg` 只实现 MSTATUS/MIE（SV 575 行覆盖 M/S/U）；`riscv_defines.py` 缺 CSR/VA/CUSTOM/ZBA-ZBS 六类宏；**pyvsc 不支持 covergroup 继承与 `ignore_bins`/`illegal_bins`**，因此 SV 的 `class lb_cg(load_instr_cg)` 被手工展开成 26 段重复代码、保留位用裁剪枚举替代。

**⑥ 覆盖率其他差异**（在上述实例缺失之外）：
缺 `wfi`/`csrrs`/`csrrc`/`csrrwi`/`csrrsi`/`csrrci`（CSR 指令 SV 有 6 个 covergroup，py 只有 `csrrw_cg`）/`branch_hit_history`/`instr_trans`/`privileged_csr`/`mcause_exception`/`mcause_interrupt`/`mstatus_m`/`fcsr` 等；**Bitmanip（ZBA/ZBB/ZBC/ZBS/B）约 106 个 covergroup 在 py 中完全没有**；`compliance_mode`/`select_isa`/`cov_isa`/`branch_hit_history` 等字段**声明但从不使用**（`cg_instantiation()` 无任何 ISA/XLEN/compliance 门控，而 SV 有 `CG_SELECTOR_BEGIN(ISA)`、`c_jal_cg` 仅 XLEN==32 等）；`compressed_opcode_cg` 类体被注释且未实例化。**只支持 machine mode。**两端均无 AMO 覆盖（测试显式跳过 amo/lr/sc）；两端均无实际向量覆盖（SV 的 `VECTOR_INCLUDE("riscv_instr_cover_group_inc_*.sv")` 六个 include 文件在本 checkout 中缺失）。

### 7.5 pyflow 的源码级可疑点（未确认是否有意）

**① 已确认的常量错误（`riscv_instr_pkg.py:1934`）**：

```python
spf_val_r2 = 428657868      # ❌ 少写一位数字 → 0x198C_CCCC（垃圾值）
# 正确值应为 0xFF80_0000 = 4286578688（单精度 −∞）
```

依据 SV 侧 `src/riscv_instr_cover_group.sv:240` `bins infinity[] = {32'h7f80_0000, 32'hff80_0000};`（`src/riscv_asm_program_gen.sv:654` 同）。**影响**：所有单精度 `"infinity"` 的 `vsc.bin_array([], spf_val_r1, spf_val_r2)` 第二个 bin 变成 `0x198CCCCCC`，**−∞ 永不命中**。同文件其余常量经十进制/十六进制双向核对**全部正确**：`spf_val_r1=0x7f800000(+∞)`、`spf_zero_r=0x80000000`、`spf_nan_r=0x7fc00000`、`dpf_val_r1=0x7ff0000000000000`、`dpf_val_r2=0xfff0000000000000`。

**② 其他可疑点**：

- `riscv_instr_cover_group.py` 的 26 个未实例化 covergroup（见 §7.4①，实测已确认）。
- `riscv_privileged_common_seq` 定义的是 **`__init___`（三下划线）**，实际没有 `__init__`。
- `riscv_callstack_gen`：`riscv_program.__init__` 不接参数却以 `riscv_program("program_i")` 构造；`gen_callstack` 中 `self.callstack_gen` 与局部 `callstack_gen` 混用且对 list 取 `.sub_program_id` → **该路径看起来未跑通**。
- `riscv_reg.set_val` 的位移方向与 `get_val` 打包方向相反。
- `riscv_data_page_gen`：`.popsection` 在 32 字节循环体内重复插入；`RAND_DATA` 用 `randrange(0, 255)`（取不到 ≥255 的值）。
- `riscv_illegal_instr.get_bin_str`：压缩指令返回十进制、非压缩返回 hex 字符串。
- `riscv_instr_sequence.generate_instr_stream`：`support_pmp` 且 label 不含 "main" 时在循环内 `insert(0, ".align 2")` → 重复插入。
- `riscv_utils.gen_config_table` 会跳过 `mem_region`/`amo_region`/`s_mem_region`/`argv` 等字段。
- 覆盖率数量（174 covergroup / 1430 coverpoint / 67 cross / 148 实例）为**静态源码统计（AST）**，非 PyVSC 运行时报告。

> **实践建议**：若要用于 C910/E906 验证，**优先走 SV/UVM 路径**（功能完整、含页表/PMP/调试/覆盖率）；pyflow 适合快速迭代「纯 ISA 指令流生成」，但**不要用它的覆盖率结果做验收**（大量指令的覆盖点静默缺失），也不要用它的 MMU/调试能力。

---

## 8. 其他目录

| 路径 | 内容 |
|------|------|
| `euvm/` | **D 语言 eUVM 移植**（`eUVM` = UVM-1800.2-2020 的 D 实现）共 94 个文件：`README.md`(43) 说明构建（`cd euvm/build && make -j$(nproc)`，默认 `TARGET=RV64IMC`，换 target 前须 `make clean`；`make run`，`INSTRCOUNT=` 控制规模）、`build/makefile`(173，`ldc2` 编译，链接 `-L-luvm-ldc-shared -L-lesdl-ldc-shared -L-lz3`，`run` 用 D 全限定测试名 `+UVM_TESTNAME=riscv.test.riscv_instr_base_test.riscv_instr_base_test`）、`riscv/gen/*.d`(28，对应 `src/*.sv`，其中 `package.d` 为聚合入口；`riscv_instr_registry.d`/`riscv_defines.d` 在 SV 侧无独立文件)、`riscv/gen/isa/*.d`(39，对应 `src/isa/`)、`riscv/gen/target/package.d`(50，用 `version(...)` 编译期选 target)、各 target 的 `riscv_core_setting.d`、`riscv/test/*.d`(4，`riscv_instr_gen.d` 里的 `main()` 等价于 SV 的 tb_top+run_test)。**确认为缺失**：无 `rv64imafdc` 的 core_setting.d 且 `package.d` 无对应分支；**SV 的 `riscv_csr_instr` 与覆盖率类（`riscv_instr_cover_group`）没有 D 移植**；目录内无 testlist.yaml/riscvOVPsim.ic/files.f。 |
| `docs/source/` | Sphinx 文档源 15 个文件：`configuration.rst`(312) 自定义 target/`--custom_target --isa --mabi`、内存区域、testlist 字段、plusarg 全表、iss.yaml 接入新 ISS；`handshake.rst`(270) 签名握手（`gen_signature_handshake`、CORE_STATUS/TEST_RESULT/WRITE_GPR/WRITE_CSR 四种下发方式、Ibex TB 集成）；`getting_started.rst`(202) 环境/用法/4 种 ISS；`extension_support.rst`(82) B 扩展接入；`coverage_model.rst`(54) 覆盖率流程；`appendix.rst`(49) **trace CSV 交换格式**；`overview.rst`/`index.rst`/`end_to_end_simulation.rst`(lowRISC/Ibex 集成要点)/`customize_extend_generator.rst`(加自定义指令 4 步)；**`class_reference.rst`/`cmd_line_reference.rst`/`generator_flow.rst` 均为仅标题的 2 行空占位**；`conf.py` Sphinx 配置；`trace_csv.png` 被 appendix 引用。`docs/build/` 是已生成的 HTML 输出（非源文件）。 |
| `sample/` | `sample_rv32imc_test.tar.gz`（约 1.7 MB）—— 预生成的 RV32IMC 测试汇编，含 14 个顶层 `.S`（arithmetic_basic / ebreak / ebreak_debug_mode / full_interrupt / hint_instr / illegal_instr / jump_stress / loop / mmu_stress / no_fence / non_compressed_instr / rand_instr / rand_jump / unaligned_load_store）。可免跑生成器直接拿来做编译/仿真参考。 |
| `user_extension/` | 用户扩展挂载点（`run.py --ext/--user_extension_dir`）：`user_extension.svh`（登记本地扩展 SV 文件）、`user_define.h`（汇编 `.include` 的宏占位）、`user_init.s`（插在程序最开头的自定义初始化）。 |
| `verilog_style/` | `run.sh`(19) 对 `src/**.sv|.svh` 跑 `verible-verilog-lint --rules=-macro-name-style`；`exclude_filelist.f`(8) 排除 `riscv_instr_cover_group.sv`、`riscv_instr_pkg.sv` 等；`build-verible.sh`(68) 构建 Verible。 |
| `.github/` | `workflows/run-tests.yml`(182)：主 CI，`RISCV_TARGET=rv32imc`，先 build-spike → `parse_testlist.py` 生成矩阵 → 对每个 test × [uvm, pyflow] 生成代码（pyflow 走 `run.py --simulator pyflow --iss spike --steps gen`）→ `--steps gcc_compile,iss_sim` 跑测；`workflows/build-spike.yml`(63) 构建/缓存 Spike；`scripts/parse_testlist.py`(26) 递归解析 testlist 的 `import` 输出 JSON 测试名；`scripts/code_fixup.py`(106) 汇编后处理（规避 VeeR 乱序核延迟写取消：div/rem/lw 后两条写同目的寄存器时补 NOP）。 |

---

## 9. 依赖与数据流（端到端）

```
yaml/simulator.yaml ─┐
yaml/iss.yaml ───────┤
target/<t>/riscv_core_setting.sv ──(+incdir, `include)──> riscv_instr_pkg.sv
target/<t>/testlist.yaml ──────────(import 继承)────────> run.py 的 test_list
                                                          │
run.py --steps gen ──> 仿真器编译 files.f + riscv_instr_gen_tb_top
                        └─> +UVM_TESTNAME=<testlist 的 gen_test> +asm_file_name=... +seed=...
                              └─> riscv_instr_base_test::run_phase
                                    └─> riscv_asm_program_gen.gen_program() → out_<日期>/asm_test/*.S
run.py --steps gcc_compile ──> riscv64-unknown-elf-gcc（-T scripts/link.ld）→ *.o/*.elf/*.bin
run.py --steps iss_sim ──────> spike/ovpsim/sail/whisper → ISS log
                               scripts/{spike,ovpsim,sail,whisper}_log*_trace_csv.py → 统一 CSV
run.py --steps iss_cmp ──────> scripts/instr_trace_compare.py（RTL trace vs ISS trace）→ PASS/FAIL
                               out_<日期>/iss_regr.log
（RTL 侧仿真由 simulator.yaml 的 sim.cmd 模板挂到 DUT TB，不在本仓库内）
```

**扩展新核（如 C910）需要改动的点**：
1. 新建 `target/c910/riscv_core_setting.sv`（`XLEN=64`、`supported_isa` 加 `RV32X` 等 T-Head 扩展、`support_pmp/debug_mode/sfence` 等按 C910 实际能力设置）+ `testlist.yaml`（import `target/rv64gc/testlist.yaml`）+ `riscvOVPsim.ic`；
2. 在 `src/isa/custom/riscv_custom_instr_enum.sv` 增加指令名枚举，在 `rv64x_instr.sv` 用 `DEFINE_CUSTOM_INSTR` 注册，并在 `riscv_custom_instr.sv` 的 `get_instr_name()/convert2asm()` 里补编码与汇编格式；
3. 在 `yaml/simulator.yaml` 增加 C910 TB 的编译/仿真命令模板（`<setting>` 占位符指向 `target/c910`），在 `yaml/iss.yaml` 里配上 C910 可用的 ISS；
4. 若要复用 E906（RV32IMACF、`nodsp`），同理新建 `target/e906`，`XLEN=32`、`supported_isa` 按需裁剪（去掉 D/B，保留 A/F/C）；
5. pygen 路径需同步在 `pygen/pygen_src/target/<t>/riscv_core_setting.py` 增加一份 Python 配置（否则 `--simulator pyflow` 无法选到新 target）。

---

## 10. 使用与排错注意事项（源码级发现）

1. **`--steps` 取值**是 `all`/`gen`/`gcc_compile`/`iss_sim`/`iss_cmp`（`re.match` 子串匹配，可逗号组合），没有 `iss_trace_compare`。
2. **输出目录是 `out_<日期>`**（`date.today()`），不是时间戳；同日多次运行会命中同一目录。`--noclean` 默认 `True`，故 `rm -rf` 分支实际不可达。
3. **renode 未接线**：`yaml/iss.yaml` 与 `renode_log_to_trace_csv.py` 都存在，但 `compare_iss_log` 只实现 spike/ovpsim/sail/whisper，用 `--iss renode` 会报 `Unsupported ISS` 退出。
4. **乱序比较失效**：`scripts/instr_trace_compare.py` 中 `in_order_mode=0` 分支被注释（`TODO: Enable out of order comparison`），进入该分支会恒打印 `[PASSED]: 0 matched`；`compare_final_value_only=1` 会强制走这条路。旧实现保留在 `scripts/deprecated/instr_trace_compare.py`。
5. **ISS 日志命名不一致**：`iss_sim` 写 `<test>_<i>.log`，`iss_cmp` 找 `<test>.<i>.log`（下划线 vs 点），本快照下两者不匹配（疑似缺陷，未确认设计意图）。
6. **`target/rv64imafdc` 与 `rv64gc` 逐字节相同**；`target/rv32imafdc/riscvOVPsim.ic` 缺失。
7. **pygen 覆盖率有静默缺失**：26 个 covergroup 定义了但从未实例化（全部 load/store、JALR、除 BEQ 外的分支、FSD、SLLI64/SRLI64/SRAI64），失败被 `except Exception` 吞掉；另有 `spf_val_r2` 常量写错（`0x198CCCCC` 应为 `0xFF800000`）导致 **−∞ 永不命中**。详见 §7.4①、§7.5①。
8. **pygen 与 SV 的能力不对等**：pygen 少 5 个 target，缺 **MMU 页表 / PMP / 调试 / 向量** 四大块与约 106 个 Bitmanip covergroup，且 `riscv_instr_sequence` 的栈帧与子程序跳转链路不完整（详见 §7.4）。
9. **pygen 的 `rv32imafdc/riscvOVPsim.ic` 写成 `--variant RV64GC`**（与其 XLEN=32 矛盾）；`rv64imc`/`rv64imafdc` 目录下缺该 `.ic`。
10. **`test/riscv_instr_test.sv`、`scripts/deprecated/` 均无活动引用**（历史遗留）。
11. **扩展自定义指令时**：`src/isa/custom/rv64x_instr.sv` 当前为空、`rv32x_instr.sv` 只有 1 条示例；`riscv_custom_instr_enum.sv` 里的 `CUSTOM_1` 是唯一枚举项。**注意 pyflow 没有 `DEFINE_CUSTOM_INSTR`，自定义指令扩展必须在 SV 路径做。**
12. **排错方法论提示**：本仓库的「缺失」类问题（如 `lb_cg_i` 未实例化）用宽泛 `grep lb_cg_i` 会被 `c_lw_cg_i`/`mulhu_cg_i`/`flw_cg_i` 等**子串误报**掩盖。核查实例化请用精确模式 `self\.<name>_cg_i *= *self\.<name>_cg\(`；核查常量请做十进制↔十六进制双向转换（如 `428657868` vs `4286578688` 仅差一位）。

---

*本文档由逐文件源码阅读生成；行数为 `wc -l` 实测值。已验证的事实与「未确认」项已在文中分别标注。*
