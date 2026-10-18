`ifndef _PN_IRT_VIF_SV_
`define _PN_IRT_VIF_SV_

//=========================================================================
// pn_irt_vif: pn_irt UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//   信号来源：interface.md「pn-irt」页（PROFINET IRT），剔除 AXI-Lite/AXI4
//   非法标识符：pn_base_clk_31.25us → pn_base_clk_31_25us
//=========================================================================
interface pn_irt_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	// 系统与基础控制
		logic clock_125m;          // 主时钟 125MHz（DUT 输入）
		logic reset_n;             // 系统复位（低有效，DUT 输入）
	// 中断系统
		logic ins_control_irq;     // 内部控制中断（DUT 输出）
		logic ins_acyclicp0_irq;   // 非周期端口 0 中断（DUT 输出）
	// RMII 接口 p0
		logic rmii_p0_clock;       // 参考时钟（DUT 输入）
		logic rmii_p0_carrier_rxenable; // 载波侦听/接收使能（DUT 输入）
		logic [1:0] rmii_p0_rx;    // 接收数据（DUT 输入）
		logic rmii_p0_txenable;    // 发送使能（DUT 输出）
		logic [1:0] rmii_p0_tx;    // 发送数据（DUT 输出）
	// RMII 接口 p1
		logic rmii_p1_clock;       // 参考时钟（DUT 输入）
		logic rmii_p1_carrier_rxenable; // 载波侦听/接收使能（DUT 输入）
		logic [1:0] rmii_p1_rx;    // 接收数据（DUT 输入）
		logic rmii_p1_txenable;    // 发送使能（DUT 输出）
		logic [1:0] rmii_p1_tx;    // 发送数据（DUT 输出）
	// MII 接口 p0
		logic mii_p0_collision;    // 冲突检测（DUT 输入）
		logic mii_p0_carrier;      // 载波侦听（DUT 输入）
		logic [1:0] mii_p0_speed;  // 速率选择（DUT 输出）
		logic mii_p0_rxclk;        // 接收时钟（DUT 输入）
		logic mii_p0_rxerr;        // 接收错误（DUT 输入）
		logic [3:0] mii_p0_rxd;    // 接收数据（DUT 输入）
		logic mii_p0_rx_dv;        // 接收数据有效（DUT 输入）
		logic mii_p0_txclk;        // 发送时钟（DUT 输出）
		logic mii_p0_txerr;        // 发送编码错误（DUT 输出）
		logic [3:0] mii_p0_txd;    // 发送数据（DUT 输出）
		logic mii_p0_txen;         // 发送使能（DUT 输出）
	// MII 接口 p1（文档“其余信号同 MII P0”展开）
		logic mii_p1_collision;    // 冲突检测（DUT 输入）
		logic mii_p1_carrier;      // 载波侦听（DUT 输入）
		logic [1:0] mii_p1_speed;  // 速率选择（DUT 输出）
		logic mii_p1_rxclk;        // 接收时钟（DUT 输入）
		logic mii_p1_rxerr;        // 接收错误（DUT 输入）
		logic [3:0] mii_p1_rxd;    // 接收数据（DUT 输入）
		logic mii_p1_rx_dv;        // 接收数据有效（DUT 输入）
		logic mii_p1_txclk;        // 发送时钟（DUT 输出）
		logic mii_p1_txerr;        // 发送编码错误（DUT 输出）
		logic [3:0] mii_p1_txd;    // 发送数据（DUT 输出）
		logic mii_p1_txen;         // 发送使能（DUT 输出）
	// MDIO 接口
		logic mdio_clock;          // MDIO 管理时钟（DUT 输出）
		logic mdio_in;             // MDIO 数据输入（DUT 输入）
		logic mdio_out;            // MDIO 数据输出（DUT 输出）
		logic mdio_outenable;      // MDIO 输出使能（DUT 输出）
		logic [1:0] mdio_portselect; // MDIO 端口选择（DUT 输出）
	// DMA 信号
		logic [15:0] dma_datain_selector;  // DMA 输入数据选择器（DUT 输入）
		logic dma_datain_allowed;   // DMA 输入允许（DUT 输出）
		logic [15:0] dma_dataout_selector; // DMA 输出数据选择器（DUT 输入）
		logic dma_dataout_allowed;  // DMA 输出允许（DUT 输出）
		logic dma_extin_intreq;     // DMA 外部中断请求（DUT 输入）
		logic dma_extin_intclear;   // DMA 外部中断清除（DUT 输入）
	// IRT（Profinet 相关）
		logic irt_sync;            // IRT 同步（DUT 输出）
		logic [31:0] irt_sync_timestamp; // IRT 同步时间戳（DUT 输出）
		logic [15:0] pn_base_clk_31_25us; // 基础时钟计数器（DUT 输出）
		logic [15:0] pn_cycle_counter;    // 周期计数器（DUT 输出）
		logic [15:0] pn_cycle_timestamp;  // 周期时间戳（DUT 输出）
		logic pn_consumer_update;   // Consumer 更新（DUT 输出）
		logic pn_provider_update;   // Provider 更新（DUT 输出）
		logic cputx;               // CPU 发送指示（DUT 输出）
		logic cpurx;               // CPU 接收指示（DUT 输出）
		logic [3:0] pn_irq;        // Profinet 中断（DUT 输出）
		logic [3:0] pn_sync;       // Profinet 同步（DUT 输出）

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			output clock_125m;
			output reset_n;
			input  ins_control_irq;
			input  ins_acyclicp0_irq;
			output rmii_p0_clock;
			output rmii_p0_carrier_rxenable;
			output rmii_p0_rx;
			input  rmii_p0_txenable;
			input  rmii_p0_tx;
			output rmii_p1_clock;
			output rmii_p1_carrier_rxenable;
			output rmii_p1_rx;
			input  rmii_p1_txenable;
			input  rmii_p1_tx;
			output mii_p0_collision;
			output mii_p0_carrier;
			input  mii_p0_speed;
			output mii_p0_rxclk;
			output mii_p0_rxerr;
			output mii_p0_rxd;
			output mii_p0_rx_dv;
			input  mii_p0_txclk;
			input  mii_p0_txerr;
			input  mii_p0_txd;
			input  mii_p0_txen;
			output mii_p1_collision;
			output mii_p1_carrier;
			input  mii_p1_speed;
			output mii_p1_rxclk;
			output mii_p1_rxerr;
			output mii_p1_rxd;
			output mii_p1_rx_dv;
			input  mii_p1_txclk;
			input  mii_p1_txerr;
			input  mii_p1_txd;
			input  mii_p1_txen;
			input  mdio_clock;
			output mdio_in;
			input  mdio_out;
			input  mdio_outenable;
			input  mdio_portselect;
			output dma_datain_selector;
			input  dma_datain_allowed;
			output dma_dataout_selector;
			input  dma_dataout_allowed;
			output dma_extin_intreq;
			output dma_extin_intclear;
			input  irt_sync;
			input  irt_sync_timestamp;
			input  pn_base_clk_31_25us;
			input  pn_cycle_counter;
			input  pn_cycle_timestamp;
			input  pn_consumer_update;
			input  pn_provider_update;
			input  cputx;
			input  cpurx;
			input  pn_irq;
			input  pn_sync;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input clock_125m;
			input reset_n;
			input ins_control_irq;
			input ins_acyclicp0_irq;
			input rmii_p0_clock;
			input rmii_p0_carrier_rxenable;
			input rmii_p0_rx;
			input rmii_p0_txenable;
			input rmii_p0_tx;
			input rmii_p1_clock;
			input rmii_p1_carrier_rxenable;
			input rmii_p1_rx;
			input rmii_p1_txenable;
			input rmii_p1_tx;
			input mii_p0_collision;
			input mii_p0_carrier;
			input mii_p0_speed;
			input mii_p0_rxclk;
			input mii_p0_rxerr;
			input mii_p0_rxd;
			input mii_p0_rx_dv;
			input mii_p0_txclk;
			input mii_p0_txerr;
			input mii_p0_txd;
			input mii_p0_txen;
			input mii_p1_collision;
			input mii_p1_carrier;
			input mii_p1_speed;
			input mii_p1_rxclk;
			input mii_p1_rxerr;
			input mii_p1_rxd;
			input mii_p1_rx_dv;
			input mii_p1_txclk;
			input mii_p1_txerr;
			input mii_p1_txd;
			input mii_p1_txen;
			input mdio_clock;
			input mdio_in;
			input mdio_out;
			input mdio_outenable;
			input mdio_portselect;
			input dma_datain_selector;
			input dma_datain_allowed;
			input dma_dataout_selector;
			input dma_dataout_allowed;
			input dma_extin_intreq;
			input dma_extin_intclear;
			input irt_sync;
			input irt_sync_timestamp;
			input pn_base_clk_31_25us;
			input pn_cycle_counter;
			input pn_cycle_timestamp;
			input pn_consumer_update;
			input pn_provider_update;
			input cputx;
			input cpurx;
			input pn_irq;
			input pn_sync;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_PN_IRT
		`define CHK_PN_IRT 1
	`endif

	`ifndef COV_PN_IRT
		`define COV_PN_IRT 1
	`endif

endinterface : pn_irt_vif

`endif
