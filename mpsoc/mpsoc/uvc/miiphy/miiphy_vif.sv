`ifndef _MIIPHY_VIF_SV_
`define _%s_VIF_SV_

//=========================================================================
// miiphy_vif: miiphy UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//=========================================================================
interface miiphy_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	logic [3:0-1:0] phy_rxd_i;
	logic phy_rxdv_i;
	logic phy_rxer_i;
	logic [3:0-1:0] phy_txd_o;
	logic phy_txen_o;
	logic RGMIIRXC_i;
	logic RGMIITXC_o;
	logic phy_link_i;

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
		output [3:0-1:0] phy_rxd_i;
		output phy_rxdv_i;
		output phy_rxer_i;
		input  [3:0-1:0] phy_txd_o;
		input  phy_txen_o;
		output RGMIIRXC_i;
		output RGMIITXC_o;
		output phy_link_i;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
		input [3:0-1:0] phy_rxd_i;
		input phy_rxdv_i;
		input phy_rxer_i;
		input [3:0-1:0] phy_txd_o;
		input phy_txen_o;
		input RGMIIRXC_i;
		input RGMIITXC_o;
		input phy_link_i;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_MIIPHY
		`define CHK_MIIPHY 1
	`endif

	`ifndef COV_MIIPHY
		`define COV_MIIPHY 1
	`endif

endinterface : miiphy_vif

`endif
