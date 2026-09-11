`ifndef _GMAC_VIF_SV_
`define _GMAC_VIF_SV_

//=========================================================================
// gmac_vif: gmac UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//=========================================================================
interface gmac_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
		logic gmac_rgmii_txc;
		logic [3:0] gmac_rgmii_txd;
		logic gmac_rgmii_tx_ctl;
		logic gmac_rgmii_rxc;
		logic [3:0] gmac_rgmii_rxd;
		logic gmac_rgmii_rx_ctl;

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			input gmac_rgmii_txc;
			input [3:0] gmac_rgmii_txd;
			input gmac_rgmii_tx_ctl;
			output gmac_rgmii_rxc;
			output [3:0] gmac_rgmii_rxd;
			output gmac_rgmii_rx_ctl;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input gmac_rgmii_txc;
			input [3:0] gmac_rgmii_txd;
			input gmac_rgmii_tx_ctl;
			input gmac_rgmii_rxc;
			input [3:0] gmac_rgmii_rxd;
			input gmac_rgmii_rx_ctl;
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
