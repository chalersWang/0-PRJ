`ifndef _SPI_VIF_SV_
`define _SPI_VIF_SV_

//=========================================================================
// spi_vif: spi UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//   信号来源：interface.md「spi2apb」页，全量纳入（无片上总线）
//   位宽解析：CONFIG_REG/INT_REQ/SPI_STATUS_REG/MEM_DATA_*=32，RD/WR_ADDR=16
//=========================================================================
interface spi_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	// 系统与控制
		logic        NRESET;               // 系统复位（低有效，DUT 输入）
		logic        CLK_PDI_EXT;          // PDI 外部时钟（DUT 输入）
		logic [31:0] CONFIG_REG;           // 32 位配置寄存器（DUT 输入）
		logic [31:0] SPI_STATUS_REG;       // SPI 状态寄存器（DUT 输出）
	// 中断系统
		logic        IRQ_IN;               // 中断请求输入（DUT 输入）
		logic [31:0] INT_REQ;              // 中断请求向量/掩码（DUT 输入）
	// 存储器/数据接口
		logic        READ_DATA_READY;      // 读数据准备好（DUT 输入）
		logic        MEM_READ_EN;          // 存储器读使能（DUT 输出）
		logic [15:0] RD_ADDR;              // 读地址总线（DUT 输出）
		logic [15:0] WR_ADDR;              // 写地址总线（DUT 输出）
		logic [31:0] MEM_DATA_OUT;         // 存储器写数据（DUT 输出）
		logic [31:0] MEM_DATA_IN;          // 存储器读数据（DUT 输入）
	// SPI 物理接口（DUT 为 SPI 从机）
		logic        SPI_SEL;              // SPI 片选（DUT 输入）
		logic        SPI_CLK;              // SPI 时钟（DUT 输入）
		logic        SPI_DI;               // SPI 数据输入/MOSI（DUT 输入）
		logic        SPI_DO;               // SPI 数据输出/MISO（DUT 输出）
		logic        SPI_DO_EN;            // SPI 数据输出使能（DUT 输出）
		logic        SPI_IRQ;              // SPI 中断请求（DUT 输出）
		logic        SPI_IRQ_EN;           // SPI 中断使能（DUT 输出）
	// 其他控制
		logic        START_ADDR_PHASE;     // 启动地址相位（DUT 输出）
		logic        SOF_ADDR_STATE_CLK_PDI; // 地址状态起始帧（DUT 输出）
		logic        EOF_SPI_TX;           // SPI 发送结束标志（DUT 输出）

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			output NRESET;
			output CLK_PDI_EXT;
			output CONFIG_REG;
			input  SPI_STATUS_REG;
			output IRQ_IN;
			output INT_REQ;
			output READ_DATA_READY;
			input  MEM_READ_EN;
			input  RD_ADDR;
			input  WR_ADDR;
			input  MEM_DATA_OUT;
			output MEM_DATA_IN;
			output SPI_SEL;
			output SPI_CLK;
			output SPI_DI;
			input  SPI_DO;
			input  SPI_DO_EN;
			input  SPI_IRQ;
			input  SPI_IRQ_EN;
			input  START_ADDR_PHASE;
			input  SOF_ADDR_STATE_CLK_PDI;
			input  EOF_SPI_TX;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input NRESET;
			input CLK_PDI_EXT;
			input CONFIG_REG;
			input SPI_STATUS_REG;
			input IRQ_IN;
			input INT_REQ;
			input READ_DATA_READY;
			input MEM_READ_EN;
			input RD_ADDR;
			input WR_ADDR;
			input MEM_DATA_OUT;
			input MEM_DATA_IN;
			input SPI_SEL;
			input SPI_CLK;
			input SPI_DI;
			input SPI_DO;
			input SPI_DO_EN;
			input SPI_IRQ;
			input SPI_IRQ_EN;
			input START_ADDR_PHASE;
			input SOF_ADDR_STATE_CLK_PDI;
			input EOF_SPI_TX;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_SPI
		`define CHK_SPI 1
	`endif

	`ifndef COV_SPI
		`define COV_SPI 1
	`endif

endinterface : spi_vif

`endif
