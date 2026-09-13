`ifndef _UC_VIF_SV_
`define _UC_VIF_SV_

//=========================================================================
// uc_vif: uc UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//=========================================================================
interface uc_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
		wire [13:0] uc_addr;
		wire [11:0] uc_data;
		logic uc_busy;
		logic uc_cs;
		logic uc_wr;
		logic uc_irq;

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			inout uc_addr;
			inout uc_data;
			input uc_busy;
			output uc_cs;
			output uc_wr;
			input uc_irq;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input uc_addr;
			input uc_data;
			input uc_busy;
			input uc_cs;
			input uc_wr;
			input uc_irq;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_UC
		`define CHK_UC 1
	`endif

	`ifndef COV_UC
		`define COV_UC 1
	`endif

endinterface : uc_vif

`endif
