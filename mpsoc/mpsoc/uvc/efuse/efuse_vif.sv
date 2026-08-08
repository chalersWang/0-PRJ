`ifndef _EFUSE_VIF_SV_
`define _%s_VIF_SV_

//=========================================================================
// efuse_vif: efuse UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//=========================================================================
interface efuse_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	logic [3:0-1:0] o_efuse_dout;
	logic [3:0-1:0] i_efuse_pgm;
	logic i_efuse_sclk;
	logic i_efuse_cs;
	logic i_efuse_wr;

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
		input  [3:0-1:0] o_efuse_dout;
		output [3:0-1:0] i_efuse_pgm;
		output i_efuse_sclk;
		output i_efuse_cs;
		output i_efuse_wr;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
		input [3:0-1:0] o_efuse_dout;
		input [3:0-1:0] i_efuse_pgm;
		input i_efuse_sclk;
		input i_efuse_cs;
		input i_efuse_wr;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_EFUSE
		`define CHK_EFUSE 1
	`endif

	`ifndef COV_EFUSE
		`define COV_EFUSE 1
	`endif

endinterface : efuse_vif

`endif
