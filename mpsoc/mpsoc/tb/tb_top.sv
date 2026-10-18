module tb_top;                          

import uvm_pkg::*;

//import svt_uvm_pkg::*;

import mpsoc_TestTop::*;                   


`include "crg_gen.sv"


`include "uvmconfigdb.sv"   


`include "dutinst.sv"  


`include "dumpctrl.sv"


//============================================================================
// Synopsys DesignWare VIP interface 例化预留(接入时取消注释)
//   例:Synopsys I2C VIP 的 interface 例化与 config_db 下发示例
//   svt_i2c_if i2c_if();
//   initial begin
//       uvm_config_db#(virtual svt_i2c_if)::set(null, "uvm_test_top.*", "svt_i2c_if", i2c_if);
//   end
//   其余 VIP(uart/gpio/... )同理,interface 例化与 key 名以 VIP databook 为准。
//============================================================================

// kcore0: x_cpu_sub_system_ahb 的 AHB 主机端口 force 接线(时钟/复位经 mpsoc_vif 端口接入)
initial begin
    force `UT_RVCORE.biU_pad_haddr  =TopVif.ahb_m_vif.haddr ;
    force `UT_RVCORE.biU_pad_htrans =TopVif.ahb_m_vif.htrans;
    force `UT_RVCORE.biU_pad_hwrite =TopVif.ahb_m_vif.hwrite;
    force `UT_RVCORE.biU_pad_hsize  =TopVif.ahb_m_vif.hsize ;
    force `UT_RVCORE.biU_pad_hburst =TopVif.ahb_m_vif.hburst;
    force `UT_RVCORE.biU_pad_hprot  =TopVif.ahb_m_vif.hprot ;
    force `UT_RVCORE.biU_pad_hwdata =TopVif.ahb_m_vif.hwdata;

    force TopVif.ahb_m_vif.hrdata ='UT_RVCORE.pad_biu_hrdata;
    force TopVif.ahb_m_vif.hready ='UT_RVCORE.pad_biu_hready;
    force TopVif.ahb_m_vif.hresp  ='UT_RVCORE.pad_biu_hresp ;
end

// kcore1: x_cpu_sub_system_ahb_c1 的 AHB 主机端口 force 接线(时钟/复位经 mpsoc_vif 端口接入)
initial begin
    force `UT_RVCORE_C1.biU_pad_haddr  =TopVif.ahb_m_vif_c1.haddr ;
    force `UT_RVCORE_C1.biU_pad_htrans =TopVif.ahb_m_vif_c1.htrans;
    force `UT_RVCORE_C1.biU_pad_hwrite =TopVif.ahb_m_vif_c1.hwrite;
    force `UT_RVCORE_C1.biU_pad_hsize  =TopVif.ahb_m_vif_c1.hsize ;
    force `UT_RVCORE_C1.biU_pad_hburst =TopVif.ahb_m_vif_c1.hburst;
    force `UT_RVCORE_C1.biU_pad_hprot  =TopVif.ahb_m_vif_c1.hprot ;
    force `UT_RVCORE_C1.biU_pad_hwdata =TopVif.ahb_m_vif_c1.hwdata;

    force TopVif.ahb_m_vif_c1.hrdata ='UT_RVCORE_C1.pad_biu_hrdata;
    force TopVif.ahb_m_vif_c1.hready ='UT_RVCORE_C1.pad_biu_hready;
    force TopVif.ahb_m_vif_c1.hresp  ='UT_RVCORE_C1.pad_biu_hresp ;
end

endmodule
