`ifndef _SPI_TRANS_SV_
`define _SPI_TRANS_SV_

//=========================================================================
// spi_trans: spi UVC 的 Transaction 类
//
// 【UVM Field 机制说明】
// uvm_field 宏驱动 UVM 自动化操作，通过 FLAG 控制行为：
//
// 基础宏：
//   `uvm_field_int(ARG, FLAG)           — 整型变量
//   `uvm_field_enum(T, ARG, FLAG)       — 枚举变量
//   `uvm_field_object(ARG, FLAG)        — 对象引用
//   `uvm_field_string(ARG, FLAG)        — 字符串
//   `uvm_field_event(ARG, FLAG)         — 事件
//
// 数组宏：
//   `uvm_field_sarray_int(ARG, FLAG)    — 定宽整型数组
//   `uvm_field_array_int(ARG, FLAG)     — 动态整型数组
//   `uvm_field_queue_int(ARG, FLAG)     — 队列
//
// FLAG 控制位（可组合）：
//   UVM_ALL_ON     = 开启所有操作（copy/compare/print/record/pack）
//   UVM_DEFAULT    = 除 radix 外的所有操作
//   UVM_NOPACK     = 关闭 pack（节省内存，推荐大多数场景）
//   UVM_NOCOMPARE  = 关闭 compare
//   UVM_NOPRINT    = 关闭 print
//
// 【推荐配置】
//   - 大型 transaction（>100 字段）：使用 UVM_NOPACK 节省内存
//   - 调试阶段：使用 UVM_ALL_ON 方便查看
//   - 回归测试：使用 UVM_DEFAULT | UVM_NOPACK 提速
//=========================================================================
class spi_trans extends uvm_sequence_item;

	// ===== 随机化变量（对应 DUT 接口信号） =====
	// 系统与控制
		rand logic        NRESET;
		rand logic        CLK_PDI_EXT;
		rand logic [31:0] CONFIG_REG;
		rand logic [31:0] SPI_STATUS_REG;
	// 中断系统
		rand logic        IRQ_IN;
		rand logic [31:0] INT_REQ;
	// 存储器/数据接口
		rand logic        READ_DATA_READY;
		rand logic        MEM_READ_EN;
		rand logic [15:0] RD_ADDR;
		rand logic [15:0] WR_ADDR;
		rand logic [31:0] MEM_DATA_OUT;
		rand logic [31:0] MEM_DATA_IN;
	// SPI 物理接口（DUT 为 SPI 从机）
		rand logic        SPI_SEL;
		rand logic        SPI_CLK;
		rand logic        SPI_DI;
		rand logic        SPI_DO;
		rand logic        SPI_DO_EN;
		rand logic        SPI_IRQ;
		rand logic        SPI_IRQ_EN;
	// 其他控制
		rand logic        START_ADDR_PHASE;
		rand logic        SOF_ADDR_STATE_CLK_PDI;
		rand logic        EOF_SPI_TX;

	// ===== 协议级字段（driver 为主机，驱动 SPI_SEL/SPI_CLK/SPI_DI） =====
		rand int         frame_size; // 每帧 bit 数（默认 8）
		rand bit [31:0]  tx_data;    // 主机经 SPI_DI 发送
		bit [31:0]       rx_data;    // 主机从 SPI_DO 接收（观察）
		constraint c_spi { frame_size inside {[1:32]}; }

	// ===== 约束（用户可通过 override 扩展） =====
	// constraint c_default {
	//     // 用户在此添加默认约束
	//     // soft data inside {[0:255]};  // 软约束示例
	// }

	`uvm_object_utils_begin(spi_trans)
		`uvm_field_int(NRESET, UVM_ALL_ON)
		`uvm_field_int(CLK_PDI_EXT, UVM_ALL_ON)
		`uvm_field_int(CONFIG_REG, UVM_ALL_ON)
		`uvm_field_int(SPI_STATUS_REG, UVM_ALL_ON)
		`uvm_field_int(IRQ_IN, UVM_ALL_ON)
		`uvm_field_int(INT_REQ, UVM_ALL_ON)
		`uvm_field_int(READ_DATA_READY, UVM_ALL_ON)
		`uvm_field_int(MEM_READ_EN, UVM_ALL_ON)
		`uvm_field_int(RD_ADDR, UVM_ALL_ON)
		`uvm_field_int(WR_ADDR, UVM_ALL_ON)
		`uvm_field_int(MEM_DATA_OUT, UVM_ALL_ON)
		`uvm_field_int(MEM_DATA_IN, UVM_ALL_ON)
		`uvm_field_int(SPI_SEL, UVM_ALL_ON)
		`uvm_field_int(SPI_CLK, UVM_ALL_ON)
		`uvm_field_int(SPI_DI, UVM_ALL_ON)
		`uvm_field_int(SPI_DO, UVM_ALL_ON)
		`uvm_field_int(SPI_DO_EN, UVM_ALL_ON)
		`uvm_field_int(SPI_IRQ, UVM_ALL_ON)
		`uvm_field_int(SPI_IRQ_EN, UVM_ALL_ON)
		`uvm_field_int(START_ADDR_PHASE, UVM_ALL_ON)
		`uvm_field_int(SOF_ADDR_STATE_CLK_PDI, UVM_ALL_ON)
		`uvm_field_int(EOF_SPI_TX, UVM_ALL_ON)
		`uvm_field_int(frame_size, UVM_ALL_ON)
		`uvm_field_int(tx_data, UVM_ALL_ON)
		`uvm_field_int(rx_data, UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="spi_trans");
		super.new(name);
	endfunction : new

	// ===== 以下方法可选择性 override 以实现自定义行为 =====
	// 如果不 override，则使用 uvm_field 宏的默认实现
	// 注意：如果 override 了 do_*，需要同时修改 uvm_field 注册内容

	// 自定义 copy（如不需要，保持注释即可使用 field 自动化）
	// function void do_copy(uvm_object rhs);
	//     spi_trans rhs_;
	//     if(!$cast(rhs_, rhs)) begin
	//         `uvm_fatal("do_copy", "cast failed")
	//         return;
	//     end
	//     super.do_copy(rhs);
	//     this.<sig> = rhs_.<sig>;
	// endfunction

	// 自定义 compare
	// function bit do_compare(uvm_object rhs, uvm_comparer comparer);
	//     spi_trans rhs_;
	//     if(!$cast(rhs_, rhs)) return 0;
	//     return (super.do_compare(rhs, comparer) &&
	//             this.<sig> === rhs_.<sig>);
	// endfunction

	// 自定义 convert2string（用于 print/sprintf）
	// function string convert2string();
	//     return $sformatf("%s", super.convert2string());
	// endfunction

endclass : spi_trans

`endif
