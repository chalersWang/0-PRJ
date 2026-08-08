`ifndef _SWITCH_VIF_SV_
`define _%s_VIF_SV_

//=========================================================================
// switch_vif: switch UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//=========================================================================
interface switch_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	logic switch_mii_p0_rxclock;
	logic switch_mii_p0_rxerror;
	logic switch_mii_p0_rxenable;
	logic [3:0-1:0] switch_mii_p0_rx;
	logic switch_mii_p0_txclock;
	logic switch_mii_p0_txenable;
	logic [3:0-1:0] switch_mii_p0_tx;
	logic switch_mii_p0_link;
	logic switch_mii_p1_rxclock;
	logic switch_mii_p1_rxerror;
	logic switch_mii_p1_rxenable;
	logic [3:0-1:0] switch_mii_p1_rx;
	logic switch_mii_p1_txclock;
	logic switch_mii_p1_txenable;
	logic [3:0-1:0] switch_mii_p1_tx;
	logic switch_mii_p1_link;
	logic switch_mdio_clock;
	logic switch_mdio_data;

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
		output switch_mii_p0_rxclock;
		output switch_mii_p0_rxerror;
		output switch_mii_p0_rxenable;
		output [3:0-1:0] switch_mii_p0_rx;
		output switch_mii_p0_txclock;
		input  switch_mii_p0_txenable;
		input  [3:0-1:0] switch_mii_p0_tx;
		output switch_mii_p0_link;
		output switch_mii_p1_rxclock;
		output switch_mii_p1_rxerror;
		output switch_mii_p1_rxenable;
		output [3:0-1:0] switch_mii_p1_rx;
		output switch_mii_p1_txclock;
		input  switch_mii_p1_txenable;
		input  [3:0-1:0] switch_mii_p1_tx;
		output switch_mii_p1_link;
		input  switch_mdio_clock;
		inout  switch_mdio_data;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
		input switch_mii_p0_rxclock;
		input switch_mii_p0_rxerror;
		input switch_mii_p0_rxenable;
		input [3:0-1:0] switch_mii_p0_rx;
		input switch_mii_p0_txclock;
		input switch_mii_p0_txenable;
		input [3:0-1:0] switch_mii_p0_tx;
		input switch_mii_p0_link;
		input switch_mii_p1_rxclock;
		input switch_mii_p1_rxerror;
		input switch_mii_p1_rxenable;
		input [3:0-1:0] switch_mii_p1_rx;
		input switch_mii_p1_txclock;
		input switch_mii_p1_txenable;
		input [3:0-1:0] switch_mii_p1_tx;
		input switch_mii_p1_link;
		input switch_mdio_clock;
		input switch_mdio_data;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_SWITCH
		`define CHK_SWITCH 1
	`endif

	`ifndef COV_SWITCH
		`define COV_SWITCH 1
	`endif

endinterface : switch_vif

`endif
