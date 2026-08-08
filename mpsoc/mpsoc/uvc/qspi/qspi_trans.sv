`ifndef _QSPI_TRANS_SV_
`define _%s_TRANS_SV_

//=========================================================================
// qspi_trans: qspi UVC 的 Transaction 类
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
class qspi_trans extends uvm_sequence_item;

	// ===== 随机化变量（对应 DUT 接口信号） =====
	rand logic         QSPI_CS0N_o;         // 1-bit
	rand logic         QSPI_CS1N_o;         // 1-bit
	rand logic         QSPI_CS2N_o;         // 1-bit
	rand logic         QSPI_CS3N_o;         // 1-bit
	rand logic         QSPI_DAT0;           // 1-bit
	rand logic         QSPI_DAT1;           // 1-bit
	rand logic         QSPI_DAT2;           // 1-bit
	rand logic         QSPI_DAT3;           // 1-bit
	rand logic         QSPI_SCLK_o;         // 1-bit

	// ===== 约束（用户可通过 override 扩展） =====
	// constraint c_default {
	//     // 用户在此添加默认约束
	//     // soft data inside {[0:255]};  // 软约束示例
	// }

	`uvm_object_utils_begin(qspi_trans)
		`uvm_field_int(QSPI_CS0N_o, UVM_ALL_ON)
		`uvm_field_int(QSPI_CS1N_o, UVM_ALL_ON)
		`uvm_field_int(QSPI_CS2N_o, UVM_ALL_ON)
		`uvm_field_int(QSPI_CS3N_o, UVM_ALL_ON)
		`uvm_field_int(QSPI_DAT0, UVM_ALL_ON)
		`uvm_field_int(QSPI_DAT1, UVM_ALL_ON)
		`uvm_field_int(QSPI_DAT2, UVM_ALL_ON)
		`uvm_field_int(QSPI_DAT3, UVM_ALL_ON)
		`uvm_field_int(QSPI_SCLK_o, UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="qspi_trans");
		super.new(name);
	endfunction : new

	// ===== 以下方法可选择性 override 以实现自定义行为 =====
	// 如果不 override，则使用 uvm_field 宏的默认实现
	// 注意：如果 override 了 do_*，需要同时修改 uvm_field 注册内容

	// 自定义 copy（如不需要，保持注释即可使用 field 自动化）
	// function void do_copy(uvm_object rhs);
	//     qspi_trans rhs_;
	//     if(!$cast(rhs_, rhs)) begin
	//         `uvm_fatal("do_copy", "cast failed")
	//         return;
	//     end
	//     super.do_copy(rhs);
	//     this.QSPI_CS0N_o = rhs_.QSPI_CS0N_o;
	//     this.QSPI_CS1N_o = rhs_.QSPI_CS1N_o;
	//     this.QSPI_CS2N_o = rhs_.QSPI_CS2N_o;
	//     this.QSPI_CS3N_o = rhs_.QSPI_CS3N_o;
	//     this.QSPI_DAT0 = rhs_.QSPI_DAT0;
	//     this.QSPI_DAT1 = rhs_.QSPI_DAT1;
	//     this.QSPI_DAT2 = rhs_.QSPI_DAT2;
	//     this.QSPI_DAT3 = rhs_.QSPI_DAT3;
	//     this.QSPI_SCLK_o = rhs_.QSPI_SCLK_o;
	// endfunction

	// 自定义 compare
	// function bit do_compare(uvm_object rhs, uvm_comparer comparer);
	//     qspi_trans rhs_;
	//     if(!$cast(rhs_, rhs)) return 0;
	//     return (super.do_compare(rhs, comparer) &&
	//             this.QSPI_CS0N_o === rhs_.QSPI_CS0N_o &&
	//             this.QSPI_CS1N_o === rhs_.QSPI_CS1N_o &&
	//             this.QSPI_CS2N_o === rhs_.QSPI_CS2N_o &&
	//             this.QSPI_CS3N_o === rhs_.QSPI_CS3N_o &&
	//             this.QSPI_DAT0 === rhs_.QSPI_DAT0 &&
	//             this.QSPI_DAT1 === rhs_.QSPI_DAT1 &&
	//             this.QSPI_DAT2 === rhs_.QSPI_DAT2 &&
	//             this.QSPI_DAT3 === rhs_.QSPI_DAT3 &&
	//             this.QSPI_SCLK_o === rhs_.QSPI_SCLK_o);
	// endfunction

	// 自定义 convert2string（用于 print/sprintf）
	// function string convert2string();
	//     return $sformatf("%s", super.convert2string());
	// endfunction

endclass : qspi_trans

`endif
