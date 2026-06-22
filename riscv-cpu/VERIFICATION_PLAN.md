# RISC-V CPU 验证规划 (Verification Plan)

基于对 **C910 设计**、**riscv-dv 框架**、**riscv-tests 套件**的全面分析，制定以下验证策略。

## 1. 验证框架总览

```
┌─────────────────────────────────────────────────────────────────┐
│                     C910 Design Under Verification              │
│  ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐      │
│  │ IFU │ │ IDU │ │ IU  │ │ LSU │ │VFPU │ │ RTU │ │ BIU │ ...  │
│  └──┬──┘ └──┬──┘ └──┬──┘ └──┬──┘ └──┬──┘ └──┬──┘ └──┬──┘      │
└─────┼────────┼────────┼────────┼────────┼────────┼─────────────┘
      │        │        │        │        │        │
      ▼        ▼        ▼        ▼        ▼        ▼
┌─────────────────────────────────────────────────────────────────┐
│                    验证方法学                                    │
├───────────────┬───────────────────┬─────────────────────────────┤
│  riscv-tests  │   riscv-dv        │   C910 smart_run            │
│  (定向测试)    │   (随机生成)      │   (平台集成测试)            │
├───────────────┼───────────────────┼─────────────────────────────┤
│ ISA 功能      │ 约束随机指令流     │ SoC 引导/启动              │
│ 寄存器旁路    │ CSR 随机化        │ 外设访问 (UART/GPIO)       │
│ 异常/中断     │ MMU 页表随机      │ CoreMark 基准              │
│ 调试          │ 非法/特殊指令     │ 多核一致性                  │
│               │ 多核/多线程       │                            │
└───────────────┴───────────────────┴─────────────────────────────┘
```

## 2. 测试层级策略

### Level 1: 指令级验证 (riscv-tests)

| 优先级 | 测试集 | 覆盖范围 | 状态 |
|--------|--------|----------|------|
| P0 | `rv64ui/*` | RV64I 整数指令 (48 个测试/3600+ 测试点) | ✅ 可用 |
| P0 | `rv64um/*` | 乘除扩展 (12 个测试) | ✅ 可用 |
| P0 | `rv64mi/*` | 机器模式 (CSR/异常/断点/非法) | ✅ 可用 |
| P0 | `rv64uc/*` | 压缩指令 (所有 C 扩展) | ✅ 可用 |
| P1 | `rv64ua/*` | 原子操作 (AMO/LR/SC) | ✅ 可用 |
| P1 | `rv64uf/*` | 单精度浮点 | ✅ 可用 |
| P1 | `rv64ud/*` | 双精度浮点 | ✅ 可用 |
| P1 | `rv64si/*` | 监管模式 (页表/特权) | ✅ 可用 |
| P2 | `rv64uzb*/*` | 位操作扩展 (Zba/Zbb/Zbc/Zbs) | ✅ 可用 |
| P2 | `rv64uzfh/*` | 半精度浮点 | ✅ 可用 |
| P2 | `rv64ssvnapot` | Svnapot 页表 | ✅ 可用 |

#### 每个指令测试覆盖维度 (以 ALU 指令为例)

| 维度 | 测试点数量 | 说明 |
|------|-----------|------|
| 操作数组合 | 15 | 0/正/负/边界/符号扩展/溢出 |
| 源=目标 | 3 | rd=rs1, rd=rs2, rd=rs1=rs2 |
| 目标旁路 | 3 | 0/1/2 nop 后使用结果 |
| 源12旁路 | 6 | src 来自 0/1/2 级前指令 |
| 源21旁路 | 6 | 源以相反顺序加载 |
| 零寄存器源 | 3 | x0 作为 src1/src2/both |
| 零寄存器目标 | 1 | 写入 x0 |
| **总计/指令** | **~37** | 每个 R-type 指令 |

### Level 2: 随机指令验证 (riscv-dv)

| 测试类型 | 指令数/迭代 | 迭代数 | 覆盖目标 |
|----------|------------|--------|----------|
| 基础随机 | 10,000 | 100 | 通用指令覆盖 |
| 跳转压力 | 10,000 | 50 | 分支预测单元 |
| 访存压力 | 10,000 | 100 | LSU/MMU |
| 浮点随机 | 5,000 | 50 | VFPU |
| 原子操作 | 5,000 | 30 | LSU atomic |
| 向量随机 | 5,000 | 30 | VFPU 向量单元 |
| MMU 压力 | 10,000 | 100 | MMU/PTU TLB |
| 中断/异常 | 5,000 | 50 | RTU/CP0 |
| 调试模式 | 3,000 | 20 | HAD/JTAG |
| 多核压力 | 10,000 | 50 | BIU/ACE/L2C |

**总指令数**: ~3,000,000 条/覆盖迭代

### Level 3: 平台级验证 (smart_run)

| 测试用例 | 仿真器 | 说明 |
|----------|--------|------|
| `hello_world` | Verilator/iverilog | 最小系统启动测试 |
| `smoke/*` | Verilator/iverilog | 冒烟测试 |
| `ISA_IMAC/*` | VCS | RV64IMAC 指令集 |
| `ISA_FP/*` | VCS | 浮点指令 |
| `ISA_AMO/*` | VCS | 原子操作 |
| `ISA_BARRIER/*` | VCS | 屏障指令 |
| `ISA_THEAD/*` | VCS | T-Head 自定义指令 |
| `cache/*` | VCS | 缓存一致性操作 |
| `MMU/*` | VCS | MMU 页表遍历 |
| `CSR/*` | VCS | 特权 CSR 访问 |
| `exception/*` | VCS | 异常处理 |
| `interrupt/*` | VCS | 中断响应 |
| `debug/*` | VCS | JTAG 调试 |
| `sleep/*` | VCS | 低功耗睡眠 |
| `coremark` | Verilator (8线程) | CoreMark 性能基准 |

### Level 4: 微架构验证

基于 RTL 分析的定向验证场景:

| 验证场景 | 目标模块 | 方法 |
|----------|----------|------|
| 分支预测命中/未命中 | IFU (BTB/BHT/IBP) | 定向分支+随机跳转模式 |
| 寄存器重命名压力 | IDU (物理寄存器池) | 多依赖的连续指令流 |
| 发射队列满/空 | IDU (IQ) | 大量并行指令 |
| Load-to-Use 延迟 | LSU (转发逻辑) | 加载后紧跟使用 |
| Store Buffer 满/空 | LSU (Store Buffer) | 大量连续存储 |
| Cache 缺失/命中 | LSU (D-Cache) | 地址模式 + 内存区域 |
| L2 Cache 替换 | L2C (16路) | 大量地址访问 |
| TLB 缺失/命中 | MMU (JTLB) | 随机虚拟地址空间 |
| 页表多项遍历 | MMU (PTU) | 深度页表分裂 (Sv39) |
| 原子操作冲突 | LSU (AMR) | 多核同地址 AMO |
| ACE snoop 协议 | BIU (一致性) | 多核读写同一缓存行 |
| 中断延迟 | RTU/PLIC | 随机中断注入 |
| 写后写/读后写 | LSU (WAW/RAW) | 依赖指令序列 |

## 3. 覆盖率目标

### 3.1 代码覆盖率

| 类型 | 目标 | 工具 |
|------|------|------|
| 行覆盖率 | ≥ 95% | VCS/Verilator --coverage |
| 条件覆盖率 | ≥ 90% | VCS/Verilator |
| 状态机覆盖率 | ≥ 95% | VCS 状态机探测 |
| 翻转覆盖率 | ≥ 85% | VCS |
| 分支覆盖率 | ≥ 90% | VCS |
| 表达式覆盖率 | ≥ 85% | VCS |

### 3.2 功能覆盖率

| 功能点 | 覆盖组 | 实现方法 |
|--------|--------|----------|
| 指令编码覆盖 | `riscv_instr_cover_group` | riscv-dv 内置 |
| 操作数组合 | 自定义 covergroup | SV assertion |
| 分支预测 | 自定义 covergroup | IFU 接口监控 |
| 缓存状态 | 自定义 covergroup | D-Cache/L2C 监控 |
| TLB 状态 | 自定义 covergroup | MMU 接口监控 |
| 流水线停顿 | 自定义 covergroup | IDU 发射监控 |
| 写缓冲满 | 自定义 covergroup | Store Buffer 监控 |
| 一致性协议 | 自定义 covergroup | BIU ACE 监控 |

## 4. 验证流程

### 4.1 持续集成

```
Pull Request → regress (所有 Level 1-3 测试)
                     │
             ┌───────┴───────┐
             ▼               ▼
         通过 (PASS)      失败 (FAIL)
             │               │
             ▼               ▼
        Merge main      Debug 查询
             │               │
             ▼               ▼
       Nightly regress   Bug 记录
       (Level 4 + 压力)
```

### 4.2 回归测试

```bash
# Level 1: riscv-tests (使用 iverilog)
make runcase CASE=ISA_IMAC SIM=iverilog

# Level 2: riscv-dv (pyflow + ISS 对比)
python3 riscv-dv/run.py --target rv64gc --simulator pyflow --steps all -i 100

# Level 3: smart_run 全量回归
make regress SIM=vcs

# 覆盖率收集
make compile SIM=vcs +coverage
# 合并覆盖率
urg -dir work/*.vdb -dbname merged_vdb
```

## 5. 验证环境配置

### 5.1 riscv-dv C910 自定义 Target

```
target/c910/
├── riscv_core_setting.sv    # C910 配置
├── testlist.yaml             # C910 测试列表
└── riscvOVPsim.ic            # OVPsim 配置 (可选)
```

`riscv_core_setting.sv` 关键配置:
```systemverilog
isa = "rv64imafdc_zba_zbb_zbc_zbs";
xlen = 64;
satp_mode = "sv39";
pmp_regions = 8;
// T-Head 自定义扩展
support_custom_extension = 1;
```

### 5.2 支持的仿真器

| 仿真器 | 速度 | 能力 | 建议用途 |
|--------|------|------|----------|
| ⭐ Verilator | 最快 | 功能正确性 | Level 1 快速回归 |
| VCS | 快 | 完整 UVM + 覆盖率 | Level 2-3 完整验证 |
| iverilog | 慢 | 基本功能 | Level 1 本地调试 |
| irun | 快 | 商业完整 | Level 3-4 备选 |

## 6. 验证风险与缓解

| 风险 | 影响 | 缓解方案 |
|------|------|----------|
| T-Head 自定义指令无法被标准 riscv-dv 覆盖 | 指令集覆盖缺失 | 扩展 `src/isa/custom/` 添加自定义指令描述 |
| env/ 目录 `riscv_test.h` 缺失 | riscv-tests 无法编译 | 参考 smart_run 测试框架，提供 C910 适配的 TVM 头文件 |
| ISS 对比缺少 T-Head ISA 支持 | 无法做 RTL vs ISS 对比 | 自定义 ISS 或使用 Spike + T-Head 扩展 |
| 多核 ACE 一致性测试复杂度高 | 死锁或协议违规 | 从简单双核一致性开始，逐步增加核数 |
| 随机指令生成收敛性 | 相同场景重复 | 增加定向指令流比例，优化约束分布 |

---

*本验证规划基于 RISC-V CPU 验证最佳实践，可随项目进展持续优化。*
