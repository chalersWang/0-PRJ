`ifndef _ESC_TRANS_SV_
`define _ESC_TRANS_SV_

//=========================================================================
// esc_trans: esc UVC 的 Transaction 类
//
// 【UVM Field 机制说明】
// uvm_field 宏驱动 UVM 自动化操作，通过 FLAG 控制行为：
//
// 基础宏：
//   `uvm_field_int(ARG, FLAG)           — 整型变量
//   `uvm_field_enum(T, ARG, FLAG)       — 枚举变量
//   `uvm_field_object(ARG, FLAG)        — 对象引用
//   `uvm_field_string(ARG, FLAG)        — 字符串
//   `uvm_field_event(ARG, FLAG)         — 事件
//
// 数组宏：
//   `uvm_field_sarray_int(ARG, FLAG)    — 定宽整型数组
//   `uvm_field_array_int(ARG, FLAG)     — 动态整型数组
//   `uvm_field_queue_int(ARG, FLAG)     — 队列
//
// FLAG 控制位（可组合）：
//   UVM_ALL_ON     = 开启所有操作（copy/compare/print/record/pack）
//   UVM_DEFAULT    = 除 radix 外的所有操作
//   UVM_NOPACK     = 关闭 pack（节省内存，推荐大多数场景）
//   UVM_NOCOMPARE  = 关闭 compare
//   UVM_NOPRINT    = 关闭 print
//
// 【推荐配置】
//   - 大型 transaction（>100 字段）：使用 UVM_NOPACK 节省内存
//   - 调试阶段：使用 UVM_ALL_ON 方便查看
//   - 回归测试：使用 UVM_DEFAULT | UVM_NOPACK 提速
//=========================================================================
class esc_trans extends uvm_sequence_item;

	// ===== 随机化变量（对应 DUT 接口信号） =====
	// System Control
		rand logic        NRESET;
		rand logic        NRESET_DELAY7;
		rand logic        CLK2S;
		rand logic        CLK25_2NS;
		rand logic        CLK50;
		rand logic        CLK100;
		rand logic        CLK125;
		rand logic        CLK125_90;
		rand logic        CLK_PDI_EXT;
	// Security Device
		rand logic        SEC_DEV_CLK;
		rand logic        SEC_DEV_CHAL_VALID;
		rand logic [7:0]  SEC_DEV_CHAL_DATA;
		rand logic        SEC_DEV_RESP_VALID;
		rand logic [7:0]  SEC_DEV_RESP_DATA;
	// RGMII Port 0
		rand logic        RGMII_LINK0;
		rand logic        RGMII_RX_CLK0;
		rand logic        RGMII_RX_CTL0;
		rand logic [3:0]  RGMII_RX_DATA0;
		rand logic        RGMII_TX_CLK0;
		rand logic        RGMII_TX_CTL0;
		rand logic [3:0]  RGMII_TX_DATA0;
		rand logic        RGMII_RX_CTL_DATA_DDR_CLK0;
		rand logic        RGMII_TX_CTL_DATA_DDR_CLK0;
	// MII Port 0
		rand logic        NMII_LINK0;
		rand logic        MII_RX_CLK0;
		rand logic        MII_RX_DV0;
		rand logic [3:0]  MII_RX_DATA0;
		rand logic        MII_RX_ERR0;
		rand logic        MII_TX_CLK0;
		rand logic        MII_TX_ENA0;
		rand logic [3:0]  MII_TX_DATA0;
		rand logic [1:0]  MII_TX_SHIFT0;
	// RMII Port 0
		rand logic        NRMII_LINK0;
		rand logic        RMII_RX_DV0;
		rand logic [1:0]  RMII_RX_DATA0;
		rand logic        RMII_RX_ER0;
		rand logic        RMII_TX_ENA0;
		rand logic [1:0]  RMII_TX_DATA0;
	// MDIO Interface
		rand logic        MDIO;
		rand logic        MDIO_DATA_IN;
		rand logic        MDIO_DATA_OUT;
		rand logic        MDIO_DATA_ENA;
		rand logic        MCLK;
	// LED Interface
		rand logic        LED_LINK_ACT;
		rand logic        LED_RX_ERROR;
		rand logic        LED_RUN;
		rand logic        LED_ERR;
	// PROM/SPI
		rand logic        PROM_CLK_IN;
		rand logic        PROM_CLK_OUT;
		rand logic        PROM_DATA_IN;
		rand logic        PROM_DATA_OUT;
		rand logic        PROM_SIZE;
	// PDI SPI
		rand logic        PDI_SPI_SEL;
		rand logic        PDI_SPI_DO;
		rand logic        PDI_SPI_DI;
		rand logic        PDI_SPI_IRQ;
	// Digital IO
		rand logic [7:0]  PDI_DIGI_DATA_IN0;
		rand logic [7:0]  PDI_DIGI_DATA_IN1;
		rand logic [7:0]  PDI_DIGI_DATA_IN2;
		rand logic [7:0]  PDI_DIGI_DATA_IN3;
		rand logic [7:0]  PDI_DIGI_DATA_OUT0;
		rand logic [7:0]  PDI_DIGI_DATA_OUT1;
		rand logic [7:0]  PDI_DIGI_DATA_OUT2;
		rand logic [7:0]  PDI_DIGI_DATA_OUT3;
	// GPIO & Misc
		rand logic [7:0]  PDI_GPI;
		rand logic [7:0]  PDI_GPO;
		rand logic        PROM_LOADED;
		rand logic        PDI_SOF;
		rand logic        PDI_EOF;
		rand logic        PDI_WD_TRIGGER;
	// Mode Config
		rand logic [1:0]  P_MODE;
		rand logic [3:0]  P_CONF;
		rand logic        LINKPOL;
		rand logic        Trans_Mode_Ena;

	// ===== 约束（用户可通过 override 扩展） =====
	// constraint c_default {
	//     // 用户在此添加默认约束
	//     // soft data inside {[0:255]};  // 软约束示例
	// }

	`uvm_object_utils_begin(esc_trans)
		`uvm_field_int(NRESET, UVM_ALL_ON)
		`uvm_field_int(NRESET_DELAY7, UVM_ALL_ON)
		`uvm_field_int(CLK2S, UVM_ALL_ON)
		`uvm_field_int(CLK25_2NS, UVM_ALL_ON)
		`uvm_field_int(CLK50, UVM_ALL_ON)
		`uvm_field_int(CLK100, UVM_ALL_ON)
		`uvm_field_int(CLK125, UVM_ALL_ON)
		`uvm_field_int(CLK125_90, UVM_ALL_ON)
		`uvm_field_int(CLK_PDI_EXT, UVM_ALL_ON)
		`uvm_field_int(SEC_DEV_CLK, UVM_ALL_ON)
		`uvm_field_int(SEC_DEV_CHAL_VALID, UVM_ALL_ON)
		`uvm_field_int(SEC_DEV_CHAL_DATA, UVM_ALL_ON)
		`uvm_field_int(SEC_DEV_RESP_VALID, UVM_ALL_ON)
		`uvm_field_int(SEC_DEV_RESP_DATA, UVM_ALL_ON)
		`uvm_field_int(RGMII_LINK0, UVM_ALL_ON)
		`uvm_field_int(RGMII_RX_CLK0, UVM_ALL_ON)
		`uvm_field_int(RGMII_RX_CTL0, UVM_ALL_ON)
		`uvm_field_int(RGMII_RX_DATA0, UVM_ALL_ON)
		`uvm_field_int(RGMII_TX_CLK0, UVM_ALL_ON)
		`uvm_field_int(RGMII_TX_CTL0, UVM_ALL_ON)
		`uvm_field_int(RGMII_TX_DATA0, UVM_ALL_ON)
		`uvm_field_int(RGMII_RX_CTL_DATA_DDR_CLK0, UVM_ALL_ON)
		`uvm_field_int(RGMII_TX_CTL_DATA_DDR_CLK0, UVM_ALL_ON)
		`uvm_field_int(NMII_LINK0, UVM_ALL_ON)
		`uvm_field_int(MII_RX_CLK0, UVM_ALL_ON)
		`uvm_field_int(MII_RX_DV0, UVM_ALL_ON)
		`uvm_field_int(MII_RX_DATA0, UVM_ALL_ON)
		`uvm_field_int(MII_RX_ERR0, UVM_ALL_ON)
		`uvm_field_int(MII_TX_CLK0, UVM_ALL_ON)
		`uvm_field_int(MII_TX_ENA0, UVM_ALL_ON)
		`uvm_field_int(MII_TX_DATA0, UVM_ALL_ON)
		`uvm_field_int(MII_TX_SHIFT0, UVM_ALL_ON)
		`uvm_field_int(NRMII_LINK0, UVM_ALL_ON)
		`uvm_field_int(RMII_RX_DV0, UVM_ALL_ON)
		`uvm_field_int(RMII_RX_DATA0, UVM_ALL_ON)
		`uvm_field_int(RMII_RX_ER0, UVM_ALL_ON)
		`uvm_field_int(RMII_TX_ENA0, UVM_ALL_ON)
		`uvm_field_int(RMII_TX_DATA0, UVM_ALL_ON)
		`uvm_field_int(MDIO, UVM_ALL_ON)
		`uvm_field_int(MDIO_DATA_IN, UVM_ALL_ON)
		`uvm_field_int(MDIO_DATA_OUT, UVM_ALL_ON)
		`uvm_field_int(MDIO_DATA_ENA, UVM_ALL_ON)
		`uvm_field_int(MCLK, UVM_ALL_ON)
		`uvm_field_int(LED_LINK_ACT, UVM_ALL_ON)
		`uvm_field_int(LED_RX_ERROR, UVM_ALL_ON)
		`uvm_field_int(LED_RUN, UVM_ALL_ON)
		`uvm_field_int(LED_ERR, UVM_ALL_ON)
		`uvm_field_int(PROM_CLK_IN, UVM_ALL_ON)
		`uvm_field_int(PROM_CLK_OUT, UVM_ALL_ON)
		`uvm_field_int(PROM_DATA_IN, UVM_ALL_ON)
		`uvm_field_int(PROM_DATA_OUT, UVM_ALL_ON)
		`uvm_field_int(PROM_SIZE, UVM_ALL_ON)
		`uvm_field_int(PDI_SPI_SEL, UVM_ALL_ON)
		`uvm_field_int(PDI_SPI_DO, UVM_ALL_ON)
		`uvm_field_int(PDI_SPI_DI, UVM_ALL_ON)
		`uvm_field_int(PDI_SPI_IRQ, UVM_ALL_ON)
		`uvm_field_int(PDI_DIGI_DATA_IN0, UVM_ALL_ON)
		`uvm_field_int(PDI_DIGI_DATA_IN1, UVM_ALL_ON)
		`uvm_field_int(PDI_DIGI_DATA_IN2, UVM_ALL_ON)
		`uvm_field_int(PDI_DIGI_DATA_IN3, UVM_ALL_ON)
		`uvm_field_int(PDI_DIGI_DATA_OUT0, UVM_ALL_ON)
		`uvm_field_int(PDI_DIGI_DATA_OUT1, UVM_ALL_ON)
		`uvm_field_int(PDI_DIGI_DATA_OUT2, UVM_ALL_ON)
		`uvm_field_int(PDI_DIGI_DATA_OUT3, UVM_ALL_ON)
		`uvm_field_int(PDI_GPI, UVM_ALL_ON)
		`uvm_field_int(PDI_GPO, UVM_ALL_ON)
		`uvm_field_int(PROM_LOADED, UVM_ALL_ON)
		`uvm_field_int(PDI_SOF, UVM_ALL_ON)
		`uvm_field_int(PDI_EOF, UVM_ALL_ON)
		`uvm_field_int(PDI_WD_TRIGGER, UVM_ALL_ON)
		`uvm_field_int(P_MODE, UVM_ALL_ON)
		`uvm_field_int(P_CONF, UVM_ALL_ON)
		`uvm_field_int(LINKPOL, UVM_ALL_ON)
		`uvm_field_int(Trans_Mode_Ena, UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="esc_trans");
		super.new(name);
	endfunction : new

	// ===== 以下方法可选择性 override 以实现自定义行为 =====
	// 如果不 override，则使用 uvm_field 宏的默认实现
	// 注意：如果 override 了 do_*，需要同时修改 uvm_field 注册内容

	// 自定义 copy（如不需要，保持注释即可使用 field 自动化）
	// function void do_copy(uvm_object rhs);
	//     esc_trans rhs_;
	//     if(!$cast(rhs_, rhs)) begin
	//         `uvm_fatal("do_copy", "cast failed")
	//         return;
	//     end
	//     super.do_copy(rhs);
	//     this.<sig> = rhs_.<sig>;
	// endfunction

	// 自定义 compare
	// function bit do_compare(uvm_object rhs, uvm_comparer comparer);
	//     esc_trans rhs_;
	//     if(!$cast(rhs_, rhs)) return 0;
	//     return (super.do_compare(rhs, comparer) &&
	//             this.<sig> === rhs_.<sig>);
	// endfunction

	// 自定义 convert2string（用于 print/sprintf）
	// function string convert2string();
	//     return $sformatf("%s", super.convert2string());
	// endfunction

endclass : esc_trans

`endif
