`ifndef _GMAC_TRANS_SV_
`define _GMAC_TRANS_SV_

//=========================================================================
// gmac_trans: gmac UVC 的 Transaction 类
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
class gmac_trans extends uvm_sequence_item;

	// ===== 随机化变量（对应 DUT 接口信号） =====
	// RGMII Interface
		rand logic        RGMII_RXC_i;
		rand logic        RGMII_TXC_i;
		rand logic        RGMII_TXC_o;
		rand logic        RGMII_TXC_oen;
	// GMAC Control
		rand logic [2:0]  gephy_ifsel;
		rand logic        gmac_ack;
		rand logic        gmac_areset_n;
		rand logic        gmac_clk;
		rand logic        gmac_pclk;
		rand logic        gmac_preset_n;
		rand logic        gmac_reset_n;
	// GMII Interface
		rand logic        gmii_mdc_o;
		rand logic        gmii_mdc_oen;
		rand logic        gmii_mdi_i;
		rand logic        gmii_mdio_oen;
		rand logic        gmii_mdo_o;
		rand logic        lpi_intr_o;
	// PCS Interface
		rand logic        pcs_acquired_sync_o;
		rand logic        pcs_en_cdet_o;
		rand logic        pcs_ewrap_o;
		rand logic        pcs_lck_ref_o;
		rand logic        phy_col_i;
		rand logic        phy_crs_i;
		rand logic        phy_intr_i;
		rand logic [7:0]  phy_rxd_i;
		rand logic        phy_rxdv_i;
		rand logic        phy_rxer_i;
		rand logic [7:0]  phy_txd_o;
		rand logic        phy_txd_oen;
		rand logic        phy_txen_o;
		rand logic        phy_txen_oen;
		rand logic        phy_txer_o;
		rand logic        phy_txerr_oen;
	// PTP (1588)
		rand logic        pmt_intr_o;
		rand logic        ptp_aux_ts_trig_i;
		rand logic        ptp_pps_o;
		rand logic [63:0] ptp_timestamp_i;
	// System & Power
		rand logic        pwr_clamp_ctrl_i;
		rand logic        pwr_down_ctrl_i;
		rand logic        pwr_isolate_i;
	// Debug/Test
		rand logic        sbd_intr_o;
		rand logic        sbd_pwr_down_ack_o;
		rand logic        sbd_tx_clk_gating_ctrl_o;
		rand logic [1:0]  sgmii_link_speed_o;

	// ===== 约束（用户可通过 override 扩展） =====
	// constraint c_default {
	//     // 用户在此添加默认约束
	//     // soft data inside {[0:255]};  // 软约束示例
	// }

	`uvm_object_utils_begin(gmac_trans)
		`uvm_field_int(RGMII_RXC_i, UVM_ALL_ON)
		`uvm_field_int(RGMII_TXC_i, UVM_ALL_ON)
		`uvm_field_int(RGMII_TXC_o, UVM_ALL_ON)
		`uvm_field_int(RGMII_TXC_oen, UVM_ALL_ON)
		`uvm_field_int(gephy_ifsel, UVM_ALL_ON)
		`uvm_field_int(gmac_ack, UVM_ALL_ON)
		`uvm_field_int(gmac_areset_n, UVM_ALL_ON)
		`uvm_field_int(gmac_clk, UVM_ALL_ON)
		`uvm_field_int(gmac_pclk, UVM_ALL_ON)
		`uvm_field_int(gmac_preset_n, UVM_ALL_ON)
		`uvm_field_int(gmac_reset_n, UVM_ALL_ON)
		`uvm_field_int(gmii_mdc_o, UVM_ALL_ON)
		`uvm_field_int(gmii_mdc_oen, UVM_ALL_ON)
		`uvm_field_int(gmii_mdi_i, UVM_ALL_ON)
		`uvm_field_int(gmii_mdio_oen, UVM_ALL_ON)
		`uvm_field_int(gmii_mdo_o, UVM_ALL_ON)
		`uvm_field_int(lpi_intr_o, UVM_ALL_ON)
		`uvm_field_int(pcs_acquired_sync_o, UVM_ALL_ON)
		`uvm_field_int(pcs_en_cdet_o, UVM_ALL_ON)
		`uvm_field_int(pcs_ewrap_o, UVM_ALL_ON)
		`uvm_field_int(pcs_lck_ref_o, UVM_ALL_ON)
		`uvm_field_int(phy_col_i, UVM_ALL_ON)
		`uvm_field_int(phy_crs_i, UVM_ALL_ON)
		`uvm_field_int(phy_intr_i, UVM_ALL_ON)
		`uvm_field_int(phy_rxd_i, UVM_ALL_ON)
		`uvm_field_int(phy_rxdv_i, UVM_ALL_ON)
		`uvm_field_int(phy_rxer_i, UVM_ALL_ON)
		`uvm_field_int(phy_txd_o, UVM_ALL_ON)
		`uvm_field_int(phy_txd_oen, UVM_ALL_ON)
		`uvm_field_int(phy_txen_o, UVM_ALL_ON)
		`uvm_field_int(phy_txen_oen, UVM_ALL_ON)
		`uvm_field_int(phy_txer_o, UVM_ALL_ON)
		`uvm_field_int(phy_txerr_oen, UVM_ALL_ON)
		`uvm_field_int(pmt_intr_o, UVM_ALL_ON)
		`uvm_field_int(ptp_aux_ts_trig_i, UVM_ALL_ON)
		`uvm_field_int(ptp_pps_o, UVM_ALL_ON)
		`uvm_field_int(ptp_timestamp_i, UVM_ALL_ON)
		`uvm_field_int(pwr_clamp_ctrl_i, UVM_ALL_ON)
		`uvm_field_int(pwr_down_ctrl_i, UVM_ALL_ON)
		`uvm_field_int(pwr_isolate_i, UVM_ALL_ON)
		`uvm_field_int(sbd_intr_o, UVM_ALL_ON)
		`uvm_field_int(sbd_pwr_down_ack_o, UVM_ALL_ON)
		`uvm_field_int(sbd_tx_clk_gating_ctrl_o, UVM_ALL_ON)
		`uvm_field_int(sgmii_link_speed_o, UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="gmac_trans");
		super.new(name);
	endfunction : new

	// ===== 以下方法可选择性 override 以实现自定义行为 =====
	// 如果不 override，则使用 uvm_field 宏的默认实现
	// 注意：如果 override 了 do_*，需要同时修改 uvm_field 注册内容

	// 自定义 copy（如不需要，保持注释即可使用 field 自动化）
	// function void do_copy(uvm_object rhs);
	//     gmac_trans rhs_;
	//     if(!$cast(rhs_, rhs)) begin
	//         `uvm_fatal("do_copy", "cast failed")
	//         return;
	//     end
	//     super.do_copy(rhs);
	//     this.<sig> = rhs_.<sig>;
	// endfunction

	// 自定义 compare
	// function bit do_compare(uvm_object rhs, uvm_comparer comparer);
	//     gmac_trans rhs_;
	//     if(!$cast(rhs_, rhs)) return 0;
	//     return (super.do_compare(rhs, comparer) &&
	//             this.<sig> === rhs_.<sig>);
	// endfunction

	// 自定义 convert2string（用于 print/sprintf）
	// function string convert2string();
	//     return $sformatf("%s", super.convert2string());
	// endfunction

endclass : gmac_trans

`endif
