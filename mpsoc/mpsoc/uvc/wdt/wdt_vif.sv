`ifndef _WDT_VIF_SV_
`define _WDT_VIF_SV_

//=========================================================================
// wdt_vif: wdt UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//   信号来源：interface.md「wdt」页（DW_apb_wdt），剔除 APB / Test&Scan
//=========================================================================
interface wdt_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	// Watchdog（均为 DUT 输出，driver 仅采样）
		logic wdt_intr;       // 看门狗中断（高有效）
		logic wdt_sys_rst;    // 看门狗系统复位（高有效）

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			input wdt_intr;
			input wdt_sys_rst;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input wdt_intr;
			input wdt_sys_rst;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_WDT
		`define CHK_WDT 1
	`endif

	`ifndef COV_WDT
		`define COV_WDT 1
	`endif

endinterface : wdt_vif

`endif
