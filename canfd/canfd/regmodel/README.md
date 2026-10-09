# CANFD Register Model 说明文档

> 基于寄存器描述 v2.0（实际自定义设计）同步更新；PG223 v3.0 为基线  
> 生成工具：MyUvmGen_v2.0_macos / gen_regmodel  
> 生成时间：2026-06-18（2026-10 同步 v2.0）

---

## 文件清单

| 文件 | 说明 | 行数 |
|------|------|------|
| `canfd_reg_block.sv` | UVM Register Block（37 个寄存器 + field 定义） | — |
| `canfd_reg_adapter.sv` | APB 总线适配器（reg2bus / bus2reg） | 39 |
| `canfd_reg_sequence.sv` | 寄存器自测试 Sequence 库（4 个） | 185 |
| `canphy_reg_adapter.sv` | CAN PHY 寄存器适配器（原有） | — |

---

## 寄存器列表（37 个，寄存器描述 v2.0）

> ⚠️ v2.0 相对 PG223 v3.0 的差异：IER 拆为 IER0/IER1/IER2（0x20/0x24/0x28）；ICR 移位 0x24→0x2C；TSR 移位 0x28→0x34 并新增 DIV_CLK_RATIO[15:8]；MSR 增 RX_MODE[16]；ESR 增 ECCERR[19:12]；新增 IMCR/TS32/TXTS/RXTS/ECC0~ECC3/IERBF1。完整位域见 `CANFD_寄存器.md`。

### 控制/状态寄存器 (0x0000-0x0050)

| 地址 | 寄存器 | 宽度 | 访问 | 说明 |
|------|--------|------|------|------|
| 0x0000 | **SRR** | 32 | RW | Software Reset Register — CEN/SRST |
| 0x0004 | **MSR** | 32 | RW | Mode Select — RX_MODE[16]/ITO/ABR/SBR/DPEE/DAR/BRSD/SNOOP/LBACK/SLEEP |
| 0x0008 | **BRPR** | 32 | RW | Arbitration Phase Baud Rate Prescaler — BRP[7:0] |
| 0x000C | **BTR** | 32 | RW | Arbitration Phase Bit Timing — SJW/TS2/TS1 |
| 0x0010 | **ECR** | 32 | RO | Error Counter Register — REC[15:8]/TEC[7:0] |
| 0x0014 | **ESR** | 32 | W1C | Error Status Register — ECCERR[19:12]/F_BERR/F_STER/F_FMER/F_CRCER/ACKER/BERR/STER/FMER/CRCER |
| 0x0018 | **SR** | 32 | RO | Status Register — 模式/状态指示 |
| 0x001C | **ISR** | 32 | RO | Interrupt Status Register — 中断状态位 |
| 0x0020 | **IER0** | 32 | RW | Interrupt Enable 0 — 与 ISR 一一对应的使能位（E 前缀） |
| 0x0024 | **IER1** | 32 | RW | Interrupt Enable 1 — ⚠️ 位域待设计确认（32 位占位字段） |
| 0x0028 | **IER2** | 32 | RW | Interrupt Enable 2 — ⚠️ 位域待设计确认（32 位占位字段） |
| 0x002C | **ICR** | 32 | WO | Interrupt Clear Register — 中断清除（v2.0 移位） |
| 0x0030 | **IMCR** | 32 | RW | Interrupt Mode Config — PULSE_INTERVAL/PULSE_WIDTH/POLARITY/MODE |
| 0x0034 | **TSR** | 32 | RW | Timestamp Register — TIMESTAMP_CNT[31:16]/DIV_CLK_RATIO[15:8]/CTS（v2.0 移位） |
| 0x0038 | **TS32** | 32 | RO | 32 位自由运行时间戳计数器（v2.0 新增） |
| 0x003C | **TXTS** | 32 | RO | 最近发送 SOF 时间戳捕获（v2.0 新增） |
| 0x0040 | **RXTS** | 32 | RO | 最近接收 SOF 时间戳捕获（v2.0 新增） |
| 0x0044 | **ECC0** | 32 | RW | ECC 解码使能 + 校验位错误注入（v2.0 新增） |
| 0x0048 | **ECC1** | 32 | RW | TX RAM 数据错误注入 DATA_ERR_INJ_TXH（v2.0 新增） |
| 0x004C | **ECC2** | 32 | RW | RX RAM 数据错误注入 DATA_ERR_INJ_RXH（v2.0 新增） |
| 0x0050 | **ECC3** | 32 | RW | 内核路径 RX RAM 数据错误注入 DATA_ERR_INJ_RXC（v2.0 新增） |

### 数据相位寄存器 (0x0088-0x008C)

| 地址 | 寄存器 | 宽度 | 访问 | 说明 |
|------|--------|------|------|------|
| 0x0088 | **DP_BRPR** | 32 | RW | Data Phase Baud Rate Prescaler — TDC/TDCOFF/DP_BRP |
| 0x008C | **DP_BTR** | 32 | RW | Data Phase Bit Timing — DP_SJW/DP_TS2/DP_TS1 |

### TX 控制寄存器 (0x0090-0x009C)

| 地址 | 寄存器 | 宽度 | 访问 | 说明 |
|------|--------|------|------|------|
| 0x0090 | **TRR** | 32 | RW | TX Buffer Ready Request |
| 0x0094 | **IETRS** | 32 | RW | Interrupt Enable TX Ready Request Served/Cleared |
| 0x0098 | **TCR** | 32 | RW | TX Buffer Cancel Request |
| 0x009C | **IETCS** | 32 | RW | Interrupt Enable TX Cancel Request Served/Cleared |

### TX Event FIFO (0x00A0-0x00A4)

| 地址 | 寄存器 | 宽度 | 访问 | 说明 |
|------|--------|------|------|------|
| 0x00A0 | **TXE_FSR** | 32 | RW | TX Event FIFO Status Register |
| 0x00A4 | **TXE_WMR** | 32 | RW | TX Event FIFO Watermark Register |

### RX 邮箱缓冲区 (0x00B0-0x00C4)

| 地址 | 寄存器 | 宽度 | 访问 | 说明 |
|------|--------|------|------|------|
| 0x00B0 | **RCS0** | 32 | RW | RX Buffer Control Status 0 |
| 0x00B4 | **RCS1** | 32 | RW | RX Buffer Control Status 1 |
| 0x00B8 | **RCS2** | 32 | RW | RX Buffer Control Status 2 |
| 0x00C0 | **IERBF0** | 32 | RW | Interrupt Enable RX Buffer Full 0 |
| 0x00C4 | **IERBF1** | 32 | RW | Interrupt Enable RX Buffer Full 1 — ERBF47~32（v2.0 新增） |

### RX FIFO/滤波器 (0x00E0-0x00EC)

| 地址 | 寄存器 | 宽度 | 访问 | 说明 |
|------|--------|------|------|------|
| 0x00E0 | **AFR** | 32 | RW | Acceptance Filter Register |
| 0x00E8 | **FSR** | 32 | RW | RX FIFO Status Register |
| 0x00EC | **WMR** | 32 | RW | RX FIFO Watermark Register |

---

## 寄存器自测试 Sequence

### 1. canfd_reg_reset_check_seq
- **功能**：读取所有寄存器的复位值，与 UVM register model 中定义的期望值比对
- **适用场景**：每次仿真启动后首先运行，验证寄存器初始状态

### 2. canfd_reg_access_seq
- **功能**：对所有非 RO/WO 的寄存器执行"随机写 → 读回比对"，测试后恢复复位值
- **适用场景**：验证寄存器读写路径正确性
- **参数**：`restore_reset` (bit) — 测试后是否恢复复位值，默认 1

### 3. canfd_reg_bit_bash_seq
- **功能**：对每个 RW 寄存器执行 walking-1 和 walking-0 测试，检测位间串扰
- **适用场景**：门级网表仿真、后端验证

### 4. canfd_reg_config_seq
- **功能**：测试 CAN 控制器工作模式切换
  - Test1: 配置模式 → 使能 → 正常模式
  - Test2: 回环模式 (LBACK=1)
  - Test3: 监听模式 (SNOOP=1)
  - Test4: 恢复配置模式
- **适用场景**：验证 CAN 控制器模式切换逻辑

---

## 环境集成说明

### 编译宏

```tcl
# 在仿真脚本中添加以下宏以启用寄存器模型
+define+REG_MODEL
```

### 关键组件

```
canfd_env
  ├── RegModel (canfd_reg_block)           # 寄存器块实例
  │   └── default_map                       # 地址映射表
  └── end_of_elaboration_phase → lock_model()

canfd_base_test
  ├── RegModel                              # 从 env 获取的 regmodel 引用
  ├── reg_adapter (canfd_reg_adapter)       # APB 总线适配器
  └── reg_predictor (uvm_reg_predictor)     # 自动预测器
```

### 在 Test 中使用寄存器自测试

```systemverilog
// 示例：在 canfd_demo_test 中调用
task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    `ifdef REG_MODEL
    // 1. 复位值检查
    canfd_reg_reset_check_seq reset_seq;
    reset_seq = canfd_reg_reset_check_seq::type_id::create("reset_seq");
    reset_seq.regmodel = RegModel;
    reset_seq.start(null);
    
    // 2. 读写比对
    canfd_reg_access_seq access_seq;
    access_seq = canfd_reg_access_seq::type_id::create("access_seq");
    access_seq.regmodel = RegModel;
    access_seq.start(null);
    
    // 3. CAN 配置测试
    canfd_reg_config_seq config_seq;
    config_seq = canfd_reg_config_seq::type_id::create("config_seq");
    config_seq.regmodel = RegModel;
    config_seq.start(null);
    `endif
endtask
```

### 单个寄存器访问示例

```systemverilog
uvm_status_e   status;
uvm_reg_data_t value;

// 读取 SR 寄存器
RegModel.SR.read(status, value, UVM_FRONTDOOR);
$display("SR = 0x%08h, CONFIG=%0b, NORMAL=%0b", value, value[0], value[3]);

// 写入波特率预分频器
RegModel.BRPR.write(status, 32'd4, UVM_FRONTDOOR);  // BRP = 4 → 分频比=5

// 使能 CAN
RegModel.SRR.CEN.write(status, 1'b1, UVM_FRONTDOOR);
```

---

## 注意事项

1. 部分寄存器字段（如 ISR 的 RXBOFLW/RXRBF 等）在邮箱模式和 FIFO 模式下含义不同，regmodel 中按邮箱模式定义
2. ESR 寄存器为 W1C (Write-1-Clear) 类型，regmodel 中标记为 RW，需要适配器中处理清除语义
3. ICR 为纯写寄存器 (WO)，regmodel 中标记为 WO，read 操作返回 0
4. SR.CONFIG 位上电复位值为 1（配置模式），regmodel 中已正确设置
5. 使用时需在仿真编译选项中添加 `+define+REG_MODEL` 以启用寄存器模型
