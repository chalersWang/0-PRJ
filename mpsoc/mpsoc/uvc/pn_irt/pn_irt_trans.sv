`ifndef _PN_IRT_TRANS_SV_
`define _PN_IRT_TRANS_SV_

//=========================================================================
// pn_irt_trans: pn_irt UVC 的 Transaction 类
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
class pn_irt_trans extends uvm_sequence_item;

	// ===== 随机化变量（对应 DUT 接口信号） =====
	// 系统与基础控制
		rand logic        clock_125m;
		rand logic        reset_n;
	// 中断系统
		rand logic        ins_control_irq;
		rand logic        ins_acyclicp0_irq;
	// RMII 接口 p0
		rand logic        rmii_p0_clock;
		rand logic        rmii_p0_carrier_rxenable;
		rand logic [1:0]  rmii_p0_rx;
		rand logic        rmii_p0_txenable;
		rand logic [1:0]  rmii_p0_tx;
	// RMII 接口 p1
		rand logic        rmii_p1_clock;
		rand logic        rmii_p1_carrier_rxenable;
		rand logic [1:0]  rmii_p1_rx;
		rand logic        rmii_p1_txenable;
		rand logic [1:0]  rmii_p1_tx;
	// MII 接口 p0
		rand logic        mii_p0_collision;
		rand logic        mii_p0_carrier;
		rand logic [1:0]  mii_p0_speed;
		rand logic        mii_p0_rxclk;
		rand logic        mii_p0_rxerr;
		rand logic [3:0]  mii_p0_rxd;
		rand logic        mii_p0_rx_dv;
		rand logic        mii_p0_txclk;
		rand logic        mii_p0_txerr;
		rand logic [3:0]  mii_p0_txd;
		rand logic        mii_p0_txen;
	// MII 接口 p1
		rand logic        mii_p1_collision;
		rand logic        mii_p1_carrier;
		rand logic [1:0]  mii_p1_speed;
		rand logic        mii_p1_rxclk;
		rand logic        mii_p1_rxerr;
		rand logic [3:0]  mii_p1_rxd;
		rand logic        mii_p1_rx_dv;
		rand logic        mii_p1_txclk;
		rand logic        mii_p1_txerr;
		rand logic [3:0]  mii_p1_txd;
		rand logic        mii_p1_txen;
	// MDIO 接口
		rand logic        mdio_clock;
		rand logic        mdio_in;
		rand logic        mdio_out;
		rand logic        mdio_outenable;
		rand logic [1:0]  mdio_portselect;
	// DMA 信号
		rand logic [15:0] dma_datain_selector;
		rand logic        dma_datain_allowed;
		rand logic [15:0] dma_dataout_selector;
		rand logic        dma_dataout_allowed;
		rand logic        dma_extin_intreq;
		rand logic        dma_extin_intclear;
	// IRT（Profinet 相关）
		rand logic        irt_sync;
		rand logic [31:0] irt_sync_timestamp;
		rand logic [15:0] pn_base_clk_31_25us;
		rand logic [15:0] pn_cycle_counter;
		rand logic [15:0] pn_cycle_timestamp;
		rand logic        pn_consumer_update;
		rand logic        pn_provider_update;
		rand logic        cputx;
		rand logic        cpurx;
		rand logic [3:0]  pn_irq;
		rand logic [3:0]  pn_sync;

	// ===== 约束（用户可通过 override 扩展） =====
	// constraint c_default {
	//     // 用户在此添加默认约束
	//     // soft data inside {[0:255]};  // 软约束示例
	// }

	`uvm_object_utils_begin(pn_irt_trans)
		`uvm_field_int(clock_125m, UVM_ALL_ON)
		`uvm_field_int(reset_n, UVM_ALL_ON)
		`uvm_field_int(ins_control_irq, UVM_ALL_ON)
		`uvm_field_int(ins_acyclicp0_irq, UVM_ALL_ON)
		`uvm_field_int(rmii_p0_clock, UVM_ALL_ON)
		`uvm_field_int(rmii_p0_carrier_rxenable, UVM_ALL_ON)
		`uvm_field_int(rmii_p0_rx, UVM_ALL_ON)
		`uvm_field_int(rmii_p0_txenable, UVM_ALL_ON)
		`uvm_field_int(rmii_p0_tx, UVM_ALL_ON)
		`uvm_field_int(rmii_p1_clock, UVM_ALL_ON)
		`uvm_field_int(rmii_p1_carrier_rxenable, UVM_ALL_ON)
		`uvm_field_int(rmii_p1_rx, UVM_ALL_ON)
		`uvm_field_int(rmii_p1_txenable, UVM_ALL_ON)
		`uvm_field_int(rmii_p1_tx, UVM_ALL_ON)
		`uvm_field_int(mii_p0_collision, UVM_ALL_ON)
		`uvm_field_int(mii_p0_carrier, UVM_ALL_ON)
		`uvm_field_int(mii_p0_speed, UVM_ALL_ON)
		`uvm_field_int(mii_p0_rxclk, UVM_ALL_ON)
		`uvm_field_int(mii_p0_rxerr, UVM_ALL_ON)
		`uvm_field_int(mii_p0_rxd, UVM_ALL_ON)
		`uvm_field_int(mii_p0_rx_dv, UVM_ALL_ON)
		`uvm_field_int(mii_p0_txclk, UVM_ALL_ON)
		`uvm_field_int(mii_p0_txerr, UVM_ALL_ON)
		`uvm_field_int(mii_p0_txd, UVM_ALL_ON)
		`uvm_field_int(mii_p0_txen, UVM_ALL_ON)
		`uvm_field_int(mii_p1_collision, UVM_ALL_ON)
		`uvm_field_int(mii_p1_carrier, UVM_ALL_ON)
		`uvm_field_int(mii_p1_speed, UVM_ALL_ON)
		`uvm_field_int(mii_p1_rxclk, UVM_ALL_ON)
		`uvm_field_int(mii_p1_rxerr, UVM_ALL_ON)
		`uvm_field_int(mii_p1_rxd, UVM_ALL_ON)
		`uvm_field_int(mii_p1_rx_dv, UVM_ALL_ON)
		`uvm_field_int(mii_p1_txclk, UVM_ALL_ON)
		`uvm_field_int(mii_p1_txerr, UVM_ALL_ON)
		`uvm_field_int(mii_p1_txd, UVM_ALL_ON)
		`uvm_field_int(mii_p1_txen, UVM_ALL_ON)
		`uvm_field_int(mdio_clock, UVM_ALL_ON)
		`uvm_field_int(mdio_in, UVM_ALL_ON)
		`uvm_field_int(mdio_out, UVM_ALL_ON)
		`uvm_field_int(mdio_outenable, UVM_ALL_ON)
		`uvm_field_int(mdio_portselect, UVM_ALL_ON)
		`uvm_field_int(dma_datain_selector, UVM_ALL_ON)
		`uvm_field_int(dma_datain_allowed, UVM_ALL_ON)
		`uvm_field_int(dma_dataout_selector, UVM_ALL_ON)
		`uvm_field_int(dma_dataout_allowed, UVM_ALL_ON)
		`uvm_field_int(dma_extin_intreq, UVM_ALL_ON)
		`uvm_field_int(dma_extin_intclear, UVM_ALL_ON)
		`uvm_field_int(irt_sync, UVM_ALL_ON)
		`uvm_field_int(irt_sync_timestamp, UVM_ALL_ON)
		`uvm_field_int(pn_base_clk_31_25us, UVM_ALL_ON)
		`uvm_field_int(pn_cycle_counter, UVM_ALL_ON)
		`uvm_field_int(pn_cycle_timestamp, UVM_ALL_ON)
		`uvm_field_int(pn_consumer_update, UVM_ALL_ON)
		`uvm_field_int(pn_provider_update, UVM_ALL_ON)
		`uvm_field_int(cputx, UVM_ALL_ON)
		`uvm_field_int(cpurx, UVM_ALL_ON)
		`uvm_field_int(pn_irq, UVM_ALL_ON)
		`uvm_field_int(pn_sync, UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="pn_irt_trans");
		super.new(name);
	endfunction : new

	// ===== 以下方法可选择性 override 以实现自定义行为 =====
	// 如果不 override，则使用 uvm_field 宏的默认实现
	// 注意：如果 override 了 do_*，需要同时修改 uvm_field 注册内容

	// 自定义 copy（如不需要，保持注释即可使用 field 自动化）
	// function void do_copy(uvm_object rhs);
	//     pn_irt_trans rhs_;
	//     if(!$cast(rhs_, rhs)) begin
	//         `uvm_fatal("do_copy", "cast failed")
	//         return;
	//     end
	//     super.do_copy(rhs);
	//     this.<sig> = rhs_.<sig>;
	// endfunction

	// 自定义 compare
	// function bit do_compare(uvm_object rhs, uvm_comparer comparer);
	//     pn_irt_trans rhs_;
	//     if(!$cast(rhs_, rhs)) return 0;
	//     return (super.do_compare(rhs, comparer) &&
	//             this.<sig> === rhs_.<sig>);
	// endfunction

	// 自定义 convert2string（用于 print/sprintf）
	// function string convert2string();
	//     return $sformatf("%s", super.convert2string());
	// endfunction

endclass : pn_irt_trans

`endif
