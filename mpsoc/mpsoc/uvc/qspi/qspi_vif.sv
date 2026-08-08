`ifndef _QSPI_VIF_SV_
`define _%s_VIF_SV_

//=========================================================================
// qspi_vif: qspi UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//=========================================================================
interface qspi_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	logic QSPI_CS0N_o;
	logic QSPI_CS1N_o;
	logic QSPI_CS2N_o;
	logic QSPI_CS3N_o;
	logic QSPI_DAT0;
	logic QSPI_DAT1;
	logic QSPI_DAT2;
	logic QSPI_DAT3;
	logic QSPI_SCLK_o;

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
		input  QSPI_CS0N_o;
		input  QSPI_CS1N_o;
		input  QSPI_CS2N_o;
		input  QSPI_CS3N_o;
		inout  QSPI_DAT0;
		inout  QSPI_DAT1;
		inout  QSPI_DAT2;
		inout  QSPI_DAT3;
		input  QSPI_SCLK_o;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
		input QSPI_CS0N_o;
		input QSPI_CS1N_o;
		input QSPI_CS2N_o;
		input QSPI_CS3N_o;
		input QSPI_DAT0;
		input QSPI_DAT1;
		input QSPI_DAT2;
		input QSPI_DAT3;
		input QSPI_SCLK_o;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_QSPI
		`define CHK_QSPI 1
	`endif

	`ifndef COV_QSPI
		`define COV_QSPI 1
	`endif

endinterface : qspi_vif

`endif
