`ifndef _SWITCH_TRANS_SV_
`define _%s_TRANS_SV_

//=========================================================================
// switch_trans: switch UVC 的 Transaction 类
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
class switch_trans extends uvm_sequence_item;

	// ===== 随机化变量（对应 DUT 接口信号） =====
	rand logic         switch_mii_p0_rxclock; // 1-bit
	rand logic         switch_mii_p0_rxerror; // 1-bit
	rand logic         switch_mii_p0_rxenable; // 1-bit
	rand logic [3:0] switch_mii_p0_rx;    // [3:0]
	rand logic         switch_mii_p0_txclock; // 1-bit
	rand logic         switch_mii_p0_txenable; // 1-bit
	rand logic [3:0] switch_mii_p0_tx;    // [3:0]
	rand logic         switch_mii_p0_link;  // 1-bit
	rand logic         switch_mii_p1_rxclock; // 1-bit
	rand logic         switch_mii_p1_rxerror; // 1-bit
	rand logic         switch_mii_p1_rxenable; // 1-bit
	rand logic [3:0] switch_mii_p1_rx;    // [3:0]
	rand logic         switch_mii_p1_txclock; // 1-bit
	rand logic         switch_mii_p1_txenable; // 1-bit
	rand logic [3:0] switch_mii_p1_tx;    // [3:0]
	rand logic         switch_mii_p1_link;  // 1-bit
	rand logic         switch_mdio_clock;   // 1-bit
	rand logic         switch_mdio_data;    // 1-bit

	// ===== 约束（用户可通过 override 扩展） =====
	// constraint c_default {
	//     // 用户在此添加默认约束
	//     // soft data inside {[0:255]};  // 软约束示例
	// }

	`uvm_object_utils_begin(switch_trans)
		`uvm_field_int(switch_mii_p0_rxclock, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p0_rxerror, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p0_rxenable, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p0_rx, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p0_txclock, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p0_txenable, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p0_tx, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p0_link, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p1_rxclock, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p1_rxerror, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p1_rxenable, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p1_rx, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p1_txclock, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p1_txenable, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p1_tx, UVM_ALL_ON)
		`uvm_field_int(switch_mii_p1_link, UVM_ALL_ON)
		`uvm_field_int(switch_mdio_clock, UVM_ALL_ON)
		`uvm_field_int(switch_mdio_data, UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="switch_trans");
		super.new(name);
	endfunction : new

	// ===== 以下方法可选择性 override 以实现自定义行为 =====
	// 如果不 override，则使用 uvm_field 宏的默认实现
	// 注意：如果 override 了 do_*，需要同时修改 uvm_field 注册内容

	// 自定义 copy（如不需要，保持注释即可使用 field 自动化）
	// function void do_copy(uvm_object rhs);
	//     switch_trans rhs_;
	//     if(!$cast(rhs_, rhs)) begin
	//         `uvm_fatal("do_copy", "cast failed")
	//         return;
	//     end
	//     super.do_copy(rhs);
	//     this.switch_mii_p0_rxclock = rhs_.switch_mii_p0_rxclock;
	//     this.switch_mii_p0_rxerror = rhs_.switch_mii_p0_rxerror;
	//     this.switch_mii_p0_rxenable = rhs_.switch_mii_p0_rxenable;
	//     this.switch_mii_p0_rx = rhs_.switch_mii_p0_rx;
	//     this.switch_mii_p0_txclock = rhs_.switch_mii_p0_txclock;
	//     this.switch_mii_p0_txenable = rhs_.switch_mii_p0_txenable;
	//     this.switch_mii_p0_tx = rhs_.switch_mii_p0_tx;
	//     this.switch_mii_p0_link = rhs_.switch_mii_p0_link;
	//     this.switch_mii_p1_rxclock = rhs_.switch_mii_p1_rxclock;
	//     this.switch_mii_p1_rxerror = rhs_.switch_mii_p1_rxerror;
	//     this.switch_mii_p1_rxenable = rhs_.switch_mii_p1_rxenable;
	//     this.switch_mii_p1_rx = rhs_.switch_mii_p1_rx;
	//     this.switch_mii_p1_txclock = rhs_.switch_mii_p1_txclock;
	//     this.switch_mii_p1_txenable = rhs_.switch_mii_p1_txenable;
	//     this.switch_mii_p1_tx = rhs_.switch_mii_p1_tx;
	//     this.switch_mii_p1_link = rhs_.switch_mii_p1_link;
	//     this.switch_mdio_clock = rhs_.switch_mdio_clock;
	//     this.switch_mdio_data = rhs_.switch_mdio_data;
	// endfunction

	// 自定义 compare
	// function bit do_compare(uvm_object rhs, uvm_comparer comparer);
	//     switch_trans rhs_;
	//     if(!$cast(rhs_, rhs)) return 0;
	//     return (super.do_compare(rhs, comparer) &&
	//             this.switch_mii_p0_rxclock === rhs_.switch_mii_p0_rxclock &&
	//             this.switch_mii_p0_rxerror === rhs_.switch_mii_p0_rxerror &&
	//             this.switch_mii_p0_rxenable === rhs_.switch_mii_p0_rxenable &&
	//             this.switch_mii_p0_rx === rhs_.switch_mii_p0_rx &&
	//             this.switch_mii_p0_txclock === rhs_.switch_mii_p0_txclock &&
	//             this.switch_mii_p0_txenable === rhs_.switch_mii_p0_txenable &&
	//             this.switch_mii_p0_tx === rhs_.switch_mii_p0_tx &&
	//             this.switch_mii_p0_link === rhs_.switch_mii_p0_link &&
	//             this.switch_mii_p1_rxclock === rhs_.switch_mii_p1_rxclock &&
	//             this.switch_mii_p1_rxerror === rhs_.switch_mii_p1_rxerror &&
	//             this.switch_mii_p1_rxenable === rhs_.switch_mii_p1_rxenable &&
	//             this.switch_mii_p1_rx === rhs_.switch_mii_p1_rx &&
	//             this.switch_mii_p1_txclock === rhs_.switch_mii_p1_txclock &&
	//             this.switch_mii_p1_txenable === rhs_.switch_mii_p1_txenable &&
	//             this.switch_mii_p1_tx === rhs_.switch_mii_p1_tx &&
	//             this.switch_mii_p1_link === rhs_.switch_mii_p1_link &&
	//             this.switch_mdio_clock === rhs_.switch_mdio_clock &&
	//             this.switch_mdio_data === rhs_.switch_mdio_data);
	// endfunction

	// 自定义 convert2string（用于 print/sprintf）
	// function string convert2string();
	//     return $sformatf("%s", super.convert2string());
	// endfunction

endclass : switch_trans

`endif
