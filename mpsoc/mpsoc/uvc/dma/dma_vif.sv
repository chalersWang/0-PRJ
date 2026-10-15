`ifndef _DMA_VIF_SV_
`define _DMA_VIF_SV_

//=========================================================================
// dma_vif: dma UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//   信号来源：interface.md「dmac」页（DW_ahb_dmac），剔除 Debug Bus
//   位宽解析：DMAH_HADDR_WIDTH/M1_HDATA_WIDTH/S_HDATA_WIDTH=32，
//             DMAH_SLV_HRESP_WIDTH=2，DMAH_NUM_HS_INT=8
//=========================================================================
interface dma_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	// AHB Manager Interface 1（DUT 为 AHB 主机，均输出）
		logic [31:0] haddr1;     // 主机接口1 地址总线
		logic [31:0] hwdata1;    // 主机接口1 写数据总线
		logic        hwriten1;   // 主机接口1 写使能
		logic        hlock1;     // 主机接口1 锁定传输
		logic [1:0]  htrans1;    // 主机接口1 传输类型
		logic [2:0]  hburst1;    // 主机接口1 突发类型
		logic [2:0]  hsize1;     // 主机接口1 传输大小
		logic [3:0]  hprot1;     // 主机接口1 保护控制
	// AHB Subordinate Interface（DUT 输出）
		logic [31:0] hrdata;     // 从机接口读数据总线
		logic        hready_resp;// 从机接口就绪响应
		logic [1:0]  hresp;      // 从机接口响应状态
	// Peripheral Handshaking Interface（DUT 输出）
		logic [7:0]  dma_ack;    // 外设握手确认
		logic [7:0]  dma_finish; // 外设握手完成
	// External Memory Interface
		logic        int_combined; // 组合中断输出

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			input haddr1;
			input hwdata1;
			input hwriten1;
			input hlock1;
			input htrans1;
			input hburst1;
			input hsize1;
			input hprot1;
			input hrdata;
			input hready_resp;
			input hresp;
			input dma_ack;
			input dma_finish;
			input int_combined;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input haddr1;
			input hwdata1;
			input hwriten1;
			input hlock1;
			input htrans1;
			input hburst1;
			input hsize1;
			input hprot1;
			input hrdata;
			input hready_resp;
			input hresp;
			input dma_ack;
			input dma_finish;
			input int_combined;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_DMA
		`define CHK_DMA 1
	`endif

	`ifndef COV_DMA
		`define COV_DMA 1
	`endif

endinterface : dma_vif

`endif
