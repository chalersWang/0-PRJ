`ifndef _MPSOC_TEST_TOP_SV_
`define _MPSOC_TEST_TOP_SV_

package mpsoc_TestTop;

	import uvm_pkg::*;
	`include "uvm_macros.svh"

	//import the SVT UVM PKG
	//import svt_uvm_pkg::*;


	import sysctrl_UvcTop::*;
	import jtag_UvcTop::*;
	import uart_UvcTop::*;
	import gpio_UvcTop::*;
	import qspi_UvcTop::*;
	import switch_UvcTop::*;
	import miiphy_UvcTop::*;
	import efuse_UvcTop::*;
import i2c_UvcTop::*;
import spi_UvcTop::*;
import wdt_UvcTop::*;
import tim_UvcTop::*;
import uc_UvcTop::*;
import sdram_UvcTop::*;
import security_UvcTop::*;
import dma_UvcTop::*;
import pn_irt_UvcTop::*;
import esc_UvcTop::*;
import gmac_UvcTop::*;


	import mpsoc_EnvTop::*;

	`include "mpsoc_sequence_lib.sv"
	`include "mpsoc_base_test.sv"

	`include "mpsoc_demo_test.sv"

	//====================================================================
	// 飞书「验证测试列表」72 个测试 case(见 testcase/README.md)
	//====================================================================
	// 当前 DUT 为 pad 级黑盒(RTL 缺失),driver/scoreboard 为桩,故下列
	// case 暂未 include(否则编译失败),与 cpu/hello_world 的「暂不接入」一致。
	//
	// RTL 就绪后按下列三步接入编译:
	//   1) filelist/tb.f 追加各子系统 +incdir(见每个 case 头注释):
	//        +incdir+${VERIFY_HOME}/testcase/cpu
	//        +incdir+${VERIFY_HOME}/testcase/bus
	//        +incdir+${VERIFY_HOME}/testcase/mem
	//        +incdir+${VERIFY_HOME}/testcase/dma
	//        +incdir+${VERIFY_HOME}/testcase/net
	//        +incdir+${VERIFY_HOME}/testcase/per
	//        +incdir+${VERIFY_HOME}/testcase/sec
	//        +incdir+${VERIFY_HOME}/testcase/sys
	//   2) 在下方追加 `include "<case>.sv"(单 UVC/多 UVC)或
	//      软件 case 子目录下的 `<subsys>_<nnn>_<slug>_test.sv`
	//   3) 若要被回归发现:testplan/<group>/test.json 加
	//      "<case>": {"uvm_testname": "<case>_test 类名"}
	//
	// 示例(取消注释即接入):
	//   `include "cpu_005_jtag_debug_test.sv"
	//   `include "bus_002_apb_rw_test.sv"
	//   `include "bus_004_speed_concurrent_test.sv"
	//   `include "mem_002_sdram_rw_refresh_test.sv"
	//   `include "mem_006_qspi_indirect_dma_test.sv"
	//   `include "dma_001_mem2mem_test.sv"
	//   `include "dma_002_periph2mem_test.sv"
	//   `include "net_001_pn_irt_test.sv"
	//   `include "per_001_gpio_io_test.sv"
	//   `include "per_004_uart_flow_dma_test.sv"
	//   `include "sec_001_otp_write_test.sv"
	//   `include "sys_001_power_reset_test.sv"
	//   `include "sys_005_func_safety_test.sv"
	//   `include "sys_006_stability_test.sv"
	//   ... 其余见 testcase/README.md 完整清单
	//====================================================================

endpackage
`endif
