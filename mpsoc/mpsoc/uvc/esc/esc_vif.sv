`ifndef _ESC_VIF_SV_
`define _ESC_VIF_SV_

//=========================================================================
// esc_vif: esc UVC 的 virtual interface
//   interface 端口：clk, rstn → 由 tb_top 传入
//   内部信号：使用 logic 类型（非 input/output），由 DUT 和 driver 共驱
//   信号来源：interface.md「esc0」页（Beckhoff ESC），剔除 Avalon/PLB/AXI/UC
//   位宽解析：LED_* 的 N 按 Port0 单端口取 1；PDI_GPI/GPO 的 N 取 8
//=========================================================================
interface esc_vif(input logic clk, input logic rstn);

	// ===== DUT 信号声明（logic 类型） =====
	// System Control
		logic NRESET;              // 全局复位（低有效，DUT 输入）
		logic NRESET_DELAY7;       // 延时复位输出（DUT 输出）
		logic CLK2S;               // 2.5MHz 时钟（DUT 输入）
		logic CLK25_2NS;           // 25MHz 时钟（DUT 输入）
		logic CLK50;               // 50MHz 时钟（DUT 输入）
		logic CLK100;              // 100MHz 时钟（DUT 输入）
		logic CLK125;              // 125MHz 时钟（DUT 输入）
		logic CLK125_90;           // 125MHz 90 度相移时钟（DUT 输入）
		logic CLK_PDI_EXT;         // 外部 PDI 时钟（DUT 输入）
	// Security Device
		logic SEC_DEV_CLK;         // 安全设备时钟（DUT 输出）
		logic SEC_DEV_CHAL_VALID;  // 安全挑战数据有效（DUT 输出）
		logic [7:0] SEC_DEV_CHAL_DATA; // 安全挑战数据（DUT 输出）
		logic SEC_DEV_RESP_VALID;  // 安全响应数据有效（DUT 输入）
		logic [7:0] SEC_DEV_RESP_DATA; // 安全响应数据（DUT 输入）
	// RGMII Port 0
		logic RGMII_LINK0;         // 链路状态（DUT 输入）
		logic RGMII_RX_CLK0;       // 接收时钟（DUT 输入）
		logic RGMII_RX_CTL0;       // 接收控制（DUT 输入）
		logic [3:0] RGMII_RX_DATA0;// 接收数据（DUT 输入）
		logic RGMII_TX_CLK0;       // 发送时钟（DUT 输出）
		logic RGMII_TX_CTL0;       // 发送控制（DUT 输出）
		logic [3:0] RGMII_TX_DATA0;// 发送数据（DUT 输出）
		logic RGMII_RX_CTL_DATA_DDR_CLK0; // RX CTL 数据 DDR 时钟（DUT 输出）
		logic RGMII_TX_CTL_DATA_DDR_CLK0; // TX CTL 数据 DDR 时钟（DUT 输出）
	// MII Port 0
		logic NMII_LINK0;          // MII 链路状态（DUT 输入）
		logic MII_RX_CLK0;         // 接收时钟（DUT 输入）
		logic MII_RX_DV0;          // 接收数据有效（DUT 输入）
		logic [3:0] MII_RX_DATA0;  // 接收数据（DUT 输入）
		logic MII_RX_ERR0;         // 接收错误（DUT 输入）
		logic MII_TX_CLK0;         // 发送时钟（DUT 输入）
		logic MII_TX_ENA0;         // 发送使能（DUT 输出）
		logic [3:0] MII_TX_DATA0;  // 发送数据（DUT 输出）
		logic [1:0] MII_TX_SHIFT0; // 发送移位控制（DUT 输入）
	// RMII Port 0
		logic NRMII_LINK0;         // RMII 链路状态（DUT 输入）
		logic RMII_RX_DV0;         // 接收数据有效（DUT 输入）
		logic [1:0] RMII_RX_DATA0; // 接收数据（DUT 输入）
		logic RMII_RX_ER0;         // 接收错误（DUT 输入）
		logic RMII_TX_ENA0;        // 发送使能（DUT 输出）
		logic [1:0] RMII_TX_DATA0; // 发送数据（DUT 输出）
	// MDIO Interface
		wire  MDIO;                // 双向管理数据（inout）
		logic MDIO_DATA_IN;        // MDIO 输入缓冲（DUT 输入）
		logic MDIO_DATA_OUT;       // MDIO 输出驱动（DUT 输出）
		logic MDIO_DATA_ENA;       // MDIO 输出使能（DUT 输出）
		logic MCLK;                // MDIO 管理时钟（DUT 输出）
	// LED Interface（N 按 Port0 单端口取 1）
		logic LED_LINK_ACT;        // 链路/活动指示灯（DUT 输出）
		logic LED_RX_ERROR;        // 接收错误指示灯（DUT 输出）
		logic LED_RUN;             // 系统运行状态灯（DUT 输出）
		logic LED_ERR;             // 系统错误状态灯（DUT 输出）
	// PROM/SPI（文档合并写法拆分）
		logic PROM_CLK_IN;         // SPI/PROM 时钟输入（DUT 输入）
		logic PROM_CLK_OUT;        // SPI/PROM 时钟输出（DUT 输出）
		logic PROM_DATA_IN;        // SPI/PROM 数据输入（DUT 输入）
		logic PROM_DATA_OUT;       // SPI/PROM 数据输出（DUT 输出）
		logic PROM_SIZE;           // PROM 容量选择（DUT 输入）
	// PDI SPI
		logic PDI_SPI_SEL;         // PDI SPI 片选（DUT 输入）
		logic PDI_SPI_DO;          // PDI SPI 数据输出（DUT 输出）
		logic PDI_SPI_DI;          // PDI SPI 数据输入（DUT 输入）
		logic PDI_SPI_IRQ;         // PDI SPI 中断请求（DUT 输出）
	// Digital IO
		logic [7:0] PDI_DIGI_DATA_IN0;  // 通用数字输入 0（DUT 输入）
		logic [7:0] PDI_DIGI_DATA_IN1;  // 通用数字输入 1（DUT 输入）
		logic [7:0] PDI_DIGI_DATA_IN2;  // 通用数字输入 2（DUT 输入）
		logic [7:0] PDI_DIGI_DATA_IN3;  // 通用数字输入 3（DUT 输入）
		logic [7:0] PDI_DIGI_DATA_OUT0; // 通用数字输出 0（DUT 输出）
		logic [7:0] PDI_DIGI_DATA_OUT1; // 通用数字输出 1（DUT 输出）
		logic [7:0] PDI_DIGI_DATA_OUT2; // 通用数字输出 2（DUT 输出）
		logic [7:0] PDI_DIGI_DATA_OUT3; // 通用数字输出 3（DUT 输出）
	// GPIO & Misc（PDI_GPI/GPO 的 N 取 8）
		logic [7:0] PDI_GPI;       // 通用输入（DUT 输入）
		logic [7:0] PDI_GPO;       // 通用输出（DUT 输出）
		logic PROM_LOADED;         // PROM 加载完成（DUT 输出）
		logic PDI_SOF;             // 帧开始（DUT 输出）
		logic PDI_EOF;             // 帧结束（DUT 输出）
		logic PDI_WD_TRIGGER;      // 看门狗触发（DUT 输出）
	// Mode Config
		logic [1:0] P_MODE;        // 工作模式（DUT 输入）
		logic [3:0] P_CONF;        // 功能配置（DUT 输入）
		logic LINKPOL;             // 链路极性反转（DUT 输入）
		logic Trans_Mode_Ena;      // 透传模式使能（DUT 输入）

	// ===== Clocking Blocks =====
	// dcb: Driver 视角的 clocking block
	//   驱动信号使用 output（相对于 driver），采样信号使用 input
	//   input #1step: 在时钟边沿前采样（避免竞争）
	//   output #0: 在时钟边沿后驱动（避免竞争）
	default clocking dcb @(posedge clk);
		default input #1step output #0;
			output NRESET;
			input  NRESET_DELAY7;
			output CLK2S;
			output CLK25_2NS;
			output CLK50;
			output CLK100;
			output CLK125;
			output CLK125_90;
			output CLK_PDI_EXT;
			input  SEC_DEV_CLK;
			input  SEC_DEV_CHAL_VALID;
			input  SEC_DEV_CHAL_DATA;
			output SEC_DEV_RESP_VALID;
			output SEC_DEV_RESP_DATA;
			output RGMII_LINK0;
			output RGMII_RX_CLK0;
			output RGMII_RX_CTL0;
			output RGMII_RX_DATA0;
			input  RGMII_TX_CLK0;
			input  RGMII_TX_CTL0;
			input  RGMII_TX_DATA0;
			input  RGMII_RX_CTL_DATA_DDR_CLK0;
			input  RGMII_TX_CTL_DATA_DDR_CLK0;
			output NMII_LINK0;
			output MII_RX_CLK0;
			output MII_RX_DV0;
			output MII_RX_DATA0;
			output MII_RX_ERR0;
			output MII_TX_CLK0;
			input  MII_TX_ENA0;
			input  MII_TX_DATA0;
			output MII_TX_SHIFT0;
			output NRMII_LINK0;
			output RMII_RX_DV0;
			output RMII_RX_DATA0;
			output RMII_RX_ER0;
			input  RMII_TX_ENA0;
			input  RMII_TX_DATA0;
			inout  MDIO;
			output MDIO_DATA_IN;
			input  MDIO_DATA_OUT;
			input  MDIO_DATA_ENA;
			input  MCLK;
			input  LED_LINK_ACT;
			input  LED_RX_ERROR;
			input  LED_RUN;
			input  LED_ERR;
			output PROM_CLK_IN;
			input  PROM_CLK_OUT;
			output PROM_DATA_IN;
			input  PROM_DATA_OUT;
			output PROM_SIZE;
			output PDI_SPI_SEL;
			input  PDI_SPI_DO;
			output PDI_SPI_DI;
			input  PDI_SPI_IRQ;
			output PDI_DIGI_DATA_IN0;
			output PDI_DIGI_DATA_IN1;
			output PDI_DIGI_DATA_IN2;
			output PDI_DIGI_DATA_IN3;
			input  PDI_DIGI_DATA_OUT0;
			input  PDI_DIGI_DATA_OUT1;
			input  PDI_DIGI_DATA_OUT2;
			input  PDI_DIGI_DATA_OUT3;
			output PDI_GPI;
			input  PDI_GPO;
			input  PROM_LOADED;
			input  PDI_SOF;
			input  PDI_EOF;
			input  PDI_WD_TRIGGER;
			output P_MODE;
			output P_CONF;
			output LINKPOL;
			output Trans_Mode_Ena;
	endclocking : dcb

	// mcb: Monitor 视角的 clocking block（纯观察，全部 input）
	clocking mcb @(posedge clk);
		default input #1step;
			input NRESET;
			input NRESET_DELAY7;
			input CLK2S;
			input CLK25_2NS;
			input CLK50;
			input CLK100;
			input CLK125;
			input CLK125_90;
			input CLK_PDI_EXT;
			input SEC_DEV_CLK;
			input SEC_DEV_CHAL_VALID;
			input SEC_DEV_CHAL_DATA;
			input SEC_DEV_RESP_VALID;
			input SEC_DEV_RESP_DATA;
			input RGMII_LINK0;
			input RGMII_RX_CLK0;
			input RGMII_RX_CTL0;
			input RGMII_RX_DATA0;
			input RGMII_TX_CLK0;
			input RGMII_TX_CTL0;
			input RGMII_TX_DATA0;
			input RGMII_RX_CTL_DATA_DDR_CLK0;
			input RGMII_TX_CTL_DATA_DDR_CLK0;
			input NMII_LINK0;
			input MII_RX_CLK0;
			input MII_RX_DV0;
			input MII_RX_DATA0;
			input MII_RX_ERR0;
			input MII_TX_CLK0;
			input MII_TX_ENA0;
			input MII_TX_DATA0;
			input MII_TX_SHIFT0;
			input NRMII_LINK0;
			input RMII_RX_DV0;
			input RMII_RX_DATA0;
			input RMII_RX_ER0;
			input RMII_TX_ENA0;
			input RMII_TX_DATA0;
			input MDIO;
			input MDIO_DATA_IN;
			input MDIO_DATA_OUT;
			input MDIO_DATA_ENA;
			input MCLK;
			input LED_LINK_ACT;
			input LED_RX_ERROR;
			input LED_RUN;
			input LED_ERR;
			input PROM_CLK_IN;
			input PROM_CLK_OUT;
			input PROM_DATA_IN;
			input PROM_DATA_OUT;
			input PROM_SIZE;
			input PDI_SPI_SEL;
			input PDI_SPI_DO;
			input PDI_SPI_DI;
			input PDI_SPI_IRQ;
			input PDI_DIGI_DATA_IN0;
			input PDI_DIGI_DATA_IN1;
			input PDI_DIGI_DATA_IN2;
			input PDI_DIGI_DATA_IN3;
			input PDI_DIGI_DATA_OUT0;
			input PDI_DIGI_DATA_OUT1;
			input PDI_DIGI_DATA_OUT2;
			input PDI_DIGI_DATA_OUT3;
			input PDI_GPI;
			input PDI_GPO;
			input PROM_LOADED;
			input PDI_SOF;
			input PDI_EOF;
			input PDI_WD_TRIGGER;
			input P_MODE;
			input P_CONF;
			input LINKPOL;
			input Trans_Mode_Ena;
	endclocking : mcb

	// ===== Modports（可选） =====
	// 用于 module 端口连接时指定方向
	modport drv_mp (clocking dcb, input clk, input rstn);
	modport mon_mp (clocking mcb, input clk, input rstn);

	// ===== UT/IT/ST 级宏定义 =====
	// 用于控制断言和覆盖率在不同验证级别的使能
	`ifndef CHK_ESC
		`define CHK_ESC 1
	`endif

	`ifndef COV_ESC
		`define COV_ESC 1
	`endif

endinterface : esc_vif

`endif
