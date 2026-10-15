`ifndef _GMAC_VIF_SV_
`define _GMAC_VIF_SV_

//=========================================================================
// gmac_vif: gmac UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//   信号来源：interface.md「gmac」页（DW GMAC），剔除 AHB Slave/BIST/APB/scan
//=========================================================================
interface gmac_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	// RGMII Interface
		logic RGMII_RXC_i;         // RGMII 接收时钟（DUT 输入）
		logic RGMII_TXC_i;         // RGMII 发送时钟输入（DUT 输入）
		logic RGMII_TXC_o;         // RGMII 发送时钟输出（DUT 输出）
		logic RGMII_TXC_oen;       // RGMII 发送时钟输出使能（DUT 输出）
	// GMAC Control
		logic [2:0] gephy_ifsel;   // PHY 接口选择（DUT 输入）
		logic gmac_ack;            // GMAC 握手确认（DUT 输入）
		logic gmac_areset_n;       // GMAC 异步复位（DUT 输入）
		logic gmac_clk;            // GMAC 主时钟（DUT 输入）
		logic gmac_pclk;           // GMAC 外设时钟（DUT 输入）
		logic gmac_preset_n;       // GMAC 外设复位（DUT 输入）
		logic gmac_reset_n;        // GMAC 全局复位（DUT 输入）
	// GMII Interface
		logic gmii_mdc_o;          // 管理数据时钟（DUT 输出）
		logic gmii_mdc_oen;        // MDC 输出使能（DUT 输出）
		logic gmii_mdi_i;          // 管理数据输入（DUT 输入）
		logic gmii_mdio_oen;       // 管理数据 IO 使能（DUT 输出）
		logic gmii_mdo_o;          // 管理数据输出（DUT 输出）
		logic lpi_intr_o;          // LPI 节能中断（DUT 输出）
	// PCS Interface
		logic pcs_acquired_sync_o; // PCS 锁定同步（DUT 输出）
		logic pcs_en_cdet_o;       // PCS 载波检测使能（DUT 输出）
		logic pcs_ewrap_o;         // PCS 环回/封装（DUT 输出）
		logic pcs_lck_ref_o;       // PCS 参考时钟锁定（DUT 输出）
		logic phy_col_i;           // 冲突检测（DUT 输入）
		logic phy_crs_i;           // 载波监听（DUT 输入）
		logic phy_intr_i;          // PHY 中断（DUT 输入）
		logic [7:0] phy_rxd_i;     // PHY 接收数据（DUT 输入）
		logic phy_rxdv_i;          // PHY 接收数据有效（DUT 输入）
		logic phy_rxer_i;          // PHY 接收错误（DUT 输入）
		logic [7:0] phy_txd_o;     // PHY 发送数据（DUT 输出）
		logic phy_txd_oen;         // PHY 发送数据使能（DUT 输出）
		logic phy_txen_o;          // PHY 发送使能（DUT 输出）
		logic phy_txen_oen;        // PHY 发送使能输出控制（DUT 输出）
		logic phy_txer_o;          // PHY 发送错误（DUT 输出）
		logic phy_txerr_oen;       // PHY 发送错误输出控制（DUT 输出）
	// PTP (1588)
		logic pmt_intr_o;          // PTP 模块中断（DUT 输出）
		logic ptp_aux_ts_trig_i;   // PTP 辅助时间戳触发（DUT 输入）
		logic ptp_pps_o;           // PTP 秒脉冲（DUT 输出）
		logic [63:0] ptp_timestamp_i; // 外部时间戳（DUT 输入）
	// System & Power
		logic pwr_clamp_ctrl_i;    // 电源钳位控制（DUT 输入）
		logic pwr_down_ctrl_i;     // 掉电模式控制（DUT 输入）
		logic pwr_isolate_i;       // 电源隔离控制（DUT 输入）
	// Debug/Test（功能侧带，剔除 scan_mode）
		logic sbd_intr_o;          // SBD 中断（DUT 输出）
		logic sbd_pwr_down_ack_o;  // SBD 掉电确认（DUT 输出）
		logic sbd_tx_clk_gating_ctrl_o; // SBD 发送时钟门控（DUT 输出）
		logic [1:0] sgmii_link_speed_o; // SGMII 链路速率（DUT 输出）

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			output RGMII_RXC_i;
			output RGMII_TXC_i;
			input  RGMII_TXC_o;
			input  RGMII_TXC_oen;
			output gephy_ifsel;
			output gmac_ack;
			output gmac_areset_n;
			output gmac_clk;
			output gmac_pclk;
			output gmac_preset_n;
			output gmac_reset_n;
			input  gmii_mdc_o;
			input  gmii_mdc_oen;
			output gmii_mdi_i;
			input  gmii_mdio_oen;
			input  gmii_mdo_o;
			input  lpi_intr_o;
			input  pcs_acquired_sync_o;
			input  pcs_en_cdet_o;
			input  pcs_ewrap_o;
			input  pcs_lck_ref_o;
			output phy_col_i;
			output phy_crs_i;
			output phy_intr_i;
			output phy_rxd_i;
			output phy_rxdv_i;
			output phy_rxer_i;
			input  phy_txd_o;
			input  phy_txd_oen;
			input  phy_txen_o;
			input  phy_txen_oen;
			input  phy_txer_o;
			input  phy_txerr_oen;
			input  pmt_intr_o;
			output ptp_aux_ts_trig_i;
			input  ptp_pps_o;
			output ptp_timestamp_i;
			output pwr_clamp_ctrl_i;
			output pwr_down_ctrl_i;
			output pwr_isolate_i;
			input  sbd_intr_o;
			input  sbd_pwr_down_ack_o;
			input  sbd_tx_clk_gating_ctrl_o;
			input  sgmii_link_speed_o;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input RGMII_RXC_i;
			input RGMII_TXC_i;
			input RGMII_TXC_o;
			input RGMII_TXC_oen;
			input gephy_ifsel;
			input gmac_ack;
			input gmac_areset_n;
			input gmac_clk;
			input gmac_pclk;
			input gmac_preset_n;
			input gmac_reset_n;
			input gmii_mdc_o;
			input gmii_mdc_oen;
			input gmii_mdi_i;
			input gmii_mdio_oen;
			input gmii_mdo_o;
			input lpi_intr_o;
			input pcs_acquired_sync_o;
			input pcs_en_cdet_o;
			input pcs_ewrap_o;
			input pcs_lck_ref_o;
			input phy_col_i;
			input phy_crs_i;
			input phy_intr_i;
			input phy_rxd_i;
			input phy_rxdv_i;
			input phy_rxer_i;
			input phy_txd_o;
			input phy_txd_oen;
			input phy_txen_o;
			input phy_txen_oen;
			input phy_txer_o;
			input phy_txerr_oen;
			input pmt_intr_o;
			input ptp_aux_ts_trig_i;
			input ptp_pps_o;
			input ptp_timestamp_i;
			input pwr_clamp_ctrl_i;
			input pwr_down_ctrl_i;
			input pwr_isolate_i;
			input sbd_intr_o;
			input sbd_pwr_down_ack_o;
			input sbd_tx_clk_gating_ctrl_o;
			input sgmii_link_speed_o;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_GMAC
		`define CHK_GMAC 1
	`endif

	`ifndef COV_GMAC
		`define COV_GMAC 1
	`endif

endinterface : gmac_vif

`endif
