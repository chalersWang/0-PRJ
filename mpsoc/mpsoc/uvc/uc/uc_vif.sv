`ifndef _UC_VIF_SV_
`define _UC_VIF_SV_

//=========================================================================
// uc_vif: uc UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//   信号来源：interface.md「uc2apb」页，全量纳入（无片上总线）
//   位宽解析：CONFIG_REG/MEM_DATA_*=32，BUS_WIDTH_CFG/UC_IF_IRR=3，
//             READ_BYTE_SEL/WRITE_BYTE_ENA=8，BUS_WIDTH_CODE=2，
//             MEM_ADDR_*/UC_ADDR=14，UC_DATA_IN/OUT=12
//=========================================================================
interface uc_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	// 全局配置与控制
		logic        NRESET;          // 系统复位（DUT 输入）
		logic        CLK_PDI_EXT;     // PDI 外部时钟（DUT 输入）
		logic        ADDR_MASK_EN_CFG;// 地址掩码使能（DUT 输入）
		logic [2:0]  BUS_WIDTH_CFG;   // 总线宽度配置（DUT 输入）
		logic [31:0] CONFIG_REG;      // 32 位配置寄存器（DUT 输入）
	// 中断与状态
		logic        IRQ_IN;          // 中断请求输入（DUT 输入）
		logic [2:0]  UC_IF_IRR;       // FIFO 状态/中断请求寄存器（DUT 输出）
		logic        UC_IF_ACTIVE;    // UC 接口活性指示（DUT 输出）
		logic        UC_IF_IRQ;       // UC 中断指示（DUT 输出）
	// 总线控制逻辑
		logic [7:0]  READ_BYTE_SEL;   // 读字节选择掩码（DUT 输出）
		logic [1:0]  BUS_WIDTH_CODE;  // 编码总线宽度（DUT 输出）
		logic [7:0]  WRITE_BYTE_ENA;  // 写字节使能（DUT 输出）
	// 存储器接口-写
		logic [13:0] MEM_ADDR_WRITE;  // 存储器写地址（DUT 输出）
		logic [31:0] MEM_DATA_OUT;    // 存储器写数据（DUT 输出）
		logic        MEM_WRITE_EN;    // 存储器写使能（DUT 输出）
		logic        MEM_WRITE_READY; // 存储器写就绪（DUT 输入）
	// 存储器接口-读
		logic [13:0] MEM_ADDR_READ;   // 存储器读地址（DUT 输出）
		logic [31:0] MEM_DATA_IN;     // 存储器读数据（DUT 输入）
		logic        MEM_READ_EN;     // 存储器读使能（DUT 输出）
		logic        MEM_READ_READY;  // 存储器读就绪（DUT 输入）
		logic        MEM_READ_ACK;    // 存储器读应答（DUT 输入）
	// UC 接口-控制
		logic        UC_CS;           // UC 片选（DUT 输入）
		logic        UC_RD;           // UC 读控制（DUT 输入）
		logic        UC_WR;           // UC 写控制（DUT 输入）
		logic [13:0] UC_ADDR;         // UC 地址总线（DUT 输入）
	// UC 接口-数据
		logic [11:0] UC_DATA_IN;      // UC 数据输入（DUT 输入）
		logic [11:0] UC_DATA_OUT;     // UC 数据输出（DUT 输出）
		logic        UC_DATA_ENA;     // UC 数据输出使能（DUT 输出）
	// UC 接口-状态
		logic        UC_BUSY;         // UC 忙信号（DUT 输出）
		logic        UC_IRQ_OUT_1;    // UC 中断输出 1（DUT 输出）
		logic        UC_IRQ_OUT_2;    // UC 中断输出 2（DUT 输出）
	// UC 接口-辅助
		logic        UC_ALE;          // UC 地址锁存使能（DUT 输入）
		logic        UC_NBHE;         // UC 字节使能（DUT 输入）

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			output NRESET;
			output CLK_PDI_EXT;
			output ADDR_MASK_EN_CFG;
			output BUS_WIDTH_CFG;
			output CONFIG_REG;
			output IRQ_IN;
			input  UC_IF_IRR;
			input  UC_IF_ACTIVE;
			input  UC_IF_IRQ;
			input  READ_BYTE_SEL;
			input  BUS_WIDTH_CODE;
			input  WRITE_BYTE_ENA;
			input  MEM_ADDR_WRITE;
			input  MEM_DATA_OUT;
			input  MEM_WRITE_EN;
			output MEM_WRITE_READY;
			input  MEM_ADDR_READ;
			output MEM_DATA_IN;
			input  MEM_READ_EN;
			output MEM_READ_READY;
			output MEM_READ_ACK;
			output UC_CS;
			output UC_RD;
			output UC_WR;
			output UC_ADDR;
			output UC_DATA_IN;
			input  UC_DATA_OUT;
			input  UC_DATA_ENA;
			input  UC_BUSY;
			input  UC_IRQ_OUT_1;
			input  UC_IRQ_OUT_2;
			output UC_ALE;
			output UC_NBHE;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input NRESET;
			input CLK_PDI_EXT;
			input ADDR_MASK_EN_CFG;
			input BUS_WIDTH_CFG;
			input CONFIG_REG;
			input IRQ_IN;
			input UC_IF_IRR;
			input UC_IF_ACTIVE;
			input UC_IF_IRQ;
			input READ_BYTE_SEL;
			input BUS_WIDTH_CODE;
			input WRITE_BYTE_ENA;
			input MEM_ADDR_WRITE;
			input MEM_DATA_OUT;
			input MEM_WRITE_EN;
			input MEM_WRITE_READY;
			input MEM_ADDR_READ;
			input MEM_DATA_IN;
			input MEM_READ_EN;
			input MEM_READ_READY;
			input MEM_READ_ACK;
			input UC_CS;
			input UC_RD;
			input UC_WR;
			input UC_ADDR;
			input UC_DATA_IN;
			input UC_DATA_OUT;
			input UC_DATA_ENA;
			input UC_BUSY;
			input UC_IRQ_OUT_1;
			input UC_IRQ_OUT_2;
			input UC_ALE;
			input UC_NBHE;
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
