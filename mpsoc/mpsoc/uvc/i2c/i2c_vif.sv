`ifndef _I2C_VIF_SV_
`define _I2C_VIF_SV_

//=========================================================================
// i2c_vif: i2c UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//   信号来源：interface.md「i2c」页（DW_apb_i2c），剔除 APB
//=========================================================================
interface i2c_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	// I2C Physical（均为 DUT 输入：本配置下 DUT 为 I2C 从机）
		logic ic_clk;           // I2C 传输时钟
		logic ic_clk_in_a;      // I2C 时钟输入（SCL，异步同步化）
		logic ic_data_in_a;     // I2C 数据输入（SDA，异步同步化）
		logic ic_rst_n;         // I2C 模块复位（低有效）
	// DMA Handshake
		logic dma_tx_req;       // DMA 发送请求（DUT 输出）
		logic dma_tx_single;    // DMA 单次发送请求（DUT 输出）
		logic dma_rx_req;       // DMA 接收请求（DUT 输出）
		logic dma_rx_single;    // DMA 单次接收请求（DUT 输出）
		logic dma_tx_ack;       // DMA 发送应答（DUT 输入）
		logic dma_rx_ack;       // DMA 接收应答（DUT 输入）
	// Interrupts（DUT 输出）
		logic ic_tx_over_intr;  // 发送溢出中断
		logic ic_rx_under_intr; // 接收下溢中断
		logic ic_tx_abrt_intr;  // 发送中止中断
		logic ic_rx_done_intr;  // 接收完成中断
		logic ic_tx_empty_intr; // 发送 FIFO 空中断
		logic ic_activity_intr; // I2C 活动指示中断
		logic ic_stop_det_intr; // 检测 STOP 条件中断
		logic ic_start_det_intr;// 检测 START 条件中断
		logic ic_rd_req_intr;   // 读请求中断
		logic ic_rx_full_intr;  // 接收 FIFO 满中断
		logic ic_gen_call_intr; // 通用调用中断

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			output ic_clk;
			output ic_clk_in_a;
			output ic_data_in_a;
			output ic_rst_n;
			input  dma_tx_req;
			input  dma_tx_single;
			input  dma_rx_req;
			input  dma_rx_single;
			output dma_tx_ack;
			output dma_rx_ack;
			input  ic_tx_over_intr;
			input  ic_rx_under_intr;
			input  ic_tx_abrt_intr;
			input  ic_rx_done_intr;
			input  ic_tx_empty_intr;
			input  ic_activity_intr;
			input  ic_stop_det_intr;
			input  ic_start_det_intr;
			input  ic_rd_req_intr;
			input  ic_rx_full_intr;
			input  ic_gen_call_intr;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input ic_clk;
			input ic_clk_in_a;
			input ic_data_in_a;
			input ic_rst_n;
			input dma_tx_req;
			input dma_tx_single;
			input dma_rx_req;
			input dma_rx_single;
			input dma_tx_ack;
			input dma_rx_ack;
			input ic_tx_over_intr;
			input ic_rx_under_intr;
			input ic_tx_abrt_intr;
			input ic_rx_done_intr;
			input ic_tx_empty_intr;
			input ic_activity_intr;
			input ic_stop_det_intr;
			input ic_start_det_intr;
			input ic_rd_req_intr;
			input ic_rx_full_intr;
			input ic_gen_call_intr;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_I2C
		`define CHK_I2C 1
	`endif

	`ifndef COV_I2C
		`define COV_I2C 1
	`endif

endinterface : i2c_vif

`endif
