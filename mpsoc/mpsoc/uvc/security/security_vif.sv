`ifndef _SECURITY_VIF_SV_
`define _SECURITY_VIF_SV_

//=========================================================================
// security_vif: security UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//   信号来源：interface.md「security」页，剔除 AHB Master/Slave 总线
//=========================================================================
interface security_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	// System & Debug
		logic i_clk;             // 系统主时钟（DUT 输入）
		logic i_rst_n;           // 系统复位（低有效，DUT 输入）
		logic o_irq;             // 中断请求（DUT 输出）
		logic i_scan_mode;       // 扫描测试使能（DUT 输入）
		logic i_skip_startup;    // 跳过启动初始化（DUT 输入）
	// Verification
		logic o_verify_vld;      // 验证数据有效（DUT 输出）
		logic [7:0] o_verify_ok; // 验证结果状态码（DUT 输出）
		logic i_verify_ack;      // 验证握手确认（DUT 输入）
	// Clocks
		logic [3:0] o_ro_clk;    // 路由时钟输出（DUT 输出）
		logic [3:0] o_ro_out;    // 路由输出（DUT 输出）
	// eFuse Ctrl
		logic [31:0] o_chip_id;  // 芯片唯一 ID（DUT 输出）
		logic [31:0] o_uid;      // 用户 ID（DUT 输出）
		logic [3:0] o_efuse_dout;// eFuse 串行数据输出（DUT 输出）
		logic [3:0] i_efuse_pgm; // eFuse 编程高压使能（DUT 输入）
		logic i_efuse_sclk;      // eFuse 串行时钟（DUT 输入）
		logic i_efuse_cs;        // eFuse 片选（DUT 输入）
		logic i_efuse_wr;        // eFuse 写使能（DUT 输入）

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			output i_clk;
			output i_rst_n;
			input  o_irq;
			output i_scan_mode;
			output i_skip_startup;
			input  o_verify_vld;
			input  o_verify_ok;
			output i_verify_ack;
			input  o_ro_clk;
			input  o_ro_out;
			input  o_chip_id;
			input  o_uid;
			input  o_efuse_dout;
			output i_efuse_pgm;
			output i_efuse_sclk;
			output i_efuse_cs;
			output i_efuse_wr;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input i_clk;
			input i_rst_n;
			input o_irq;
			input i_scan_mode;
			input i_skip_startup;
			input o_verify_vld;
			input o_verify_ok;
			input i_verify_ack;
			input o_ro_clk;
			input o_ro_out;
			input o_chip_id;
			input o_uid;
			input o_efuse_dout;
			input i_efuse_pgm;
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
	`ifndef CHK_SECURITY
		`define CHK_SECURITY 1
	`endif

	`ifndef COV_SECURITY
		`define COV_SECURITY 1
	`endif

endinterface : security_vif

`endif
