`ifndef _SDRAM_VIF_SV_
`define _SDRAM_VIF_SV_

//=========================================================================
// sdram_vif: sdram UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//=========================================================================
interface sdram_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
		logic sdram_clk;
		logic sdram_cke;
		logic sdram_cs_n;
		logic sdram_ras_n;
		logic sdram_cas_n;
		logic sdram_we_n;
		logic [1:0] sdram_ba;
		logic [12:0] sdram_addr;
		logic [15:0] sdram_dq;
		logic [1:0] sdram_dqm;

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			input sdram_clk;
			input sdram_cke;
			input sdram_cs_n;
			input sdram_ras_n;
			input sdram_cas_n;
			input sdram_we_n;
			input sdram_ba;
			input sdram_addr;
			inout sdram_dq;
			input sdram_dqm;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input sdram_clk;
			input sdram_cke;
			input sdram_cs_n;
			input sdram_ras_n;
			input sdram_cas_n;
			input sdram_we_n;
			input sdram_ba;
			input sdram_addr;
			input sdram_dq;
			input sdram_dqm;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_SDRAM
		`define CHK_SDRAM 1
	`endif

	`ifndef COV_SDRAM
		`define COV_SDRAM 1
	`endif

endinterface : sdram_vif

`endif
