`ifndef _ESC_REG_BLOCK_SV_
`define _ESC_REG_BLOCK_SV_

//=========================================================================
// esc_reg_block: EtherCAT 从站控制器(ESC, Beckhoff ESC Section II) 寄存器模型
//   自动生成, 共 108 个寄存器。ESC0(0x44c80000, 外部通信) / ESC1(0x44c00000, 背板 SYNC)
//   两实例寄存器映射完全相同, 故共用本 esc_reg_block, 由顶层 mpsoc_reg_block 例化两次。
//
//   访问类型为简化标注: ESC Information 组为 RO, 其余默认 RW(后门 demo 只做整寄存器读写)。
//   复位值统一按 0 建模(数据手册中个别寄存器有非零复位值, 未逐一标注)。
//
//   后门访问 hierarchical path: 每个寄存器已 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class esc_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // Type  (0x0000, 8-bit, RO)
    //   位域: type[7:0]：EtherCAT 从站控制器类型（0x11=ET1100、0x12=ET1200、0x04=IP Core、0x02=ESC20）
    //---------------------------------------------------------------------
    class Type_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Type_reg)

        function new(string name="Type_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RO", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Type_reg

    //---------------------------------------------------------------------
    // Revision  (0x0001, 8-bit, RO)
    //   位域: revision[7:0]：版本号
    //---------------------------------------------------------------------
    class Revision_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Revision_reg)

        function new(string name="Revision_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RO", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Revision_reg

    //---------------------------------------------------------------------
    // Build  (0x0002, 16-bit, RO)
    //   位域: build[15:0]：构建号（IP Core：build[7:4]=次版本、build[3:0]=维护版本）
    //---------------------------------------------------------------------
    class Build_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Build_reg)

        function new(string name="Build_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RO", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Build_reg

    //---------------------------------------------------------------------
    // FMMUs supported  (0x0004, 8-bit, RO)
    //   位域: fmmu_count[7:0]：FMMU 数量（ET1100=8、ET1200=3、ESC20=4）
    //---------------------------------------------------------------------
    class FMMUs_supported_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(FMMUs_supported_reg)

        function new(string name="FMMUs_supported_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RO", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : FMMUs_supported_reg

    //---------------------------------------------------------------------
    // SyncManagers supported  (0x0005, 8-bit, RO)
    //   位域: sm_count[7:0]：SyncManager 数量（ET1100=8、ET1200=4、ESC20=4）
    //---------------------------------------------------------------------
    class SyncManagers_supported_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SyncManagers_supported_reg)

        function new(string name="SyncManagers_supported_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RO", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : SyncManagers_supported_reg

    //---------------------------------------------------------------------
    // RAM Size  (0x0006, 8-bit, RO)
    //   位域: ram_size[7:0]：Process Data RAM 大小，单位 KB（ET1100=8、ET1200=1）
    //---------------------------------------------------------------------
    class RAM_Size_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RAM_Size_reg)

        function new(string name="RAM_Size_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RO", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : RAM_Size_reg

    //---------------------------------------------------------------------
    // Port Descriptor  (0x0007, 8-bit, RO)
    //   位域: port3[7:6]、port2[5:4]、port1[3:2]、port0[1:0]：各端口配置，编码 00=未实现/01=未配置（SII EEPROM 决定）/10=EBUS/11=MII/RMII/RGMII
    //---------------------------------------------------------------------
    class Port_Descriptor_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Port_Descriptor_reg)

        function new(string name="Port_Descriptor_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RO", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Port_Descriptor_reg

    //---------------------------------------------------------------------
    // ESC Features supported  (0x0008, 16-bit, RO)
    //   位域: fixed_fmmu_sm[11]：固定 FMMU/SM 配置；brw_aprw_fprw[10]：不支持 BRW/APRW/FPRW；lrw[9]：不支持 LRW；enh_dc_sync[8]：增强 DC SYNC 激活；sep_fcs[7]：独立 FCS 错误；enh_link_mii[6]：MII 增强链路检测；enh_link_ebus[5]：EBUS 增强链路检测；low_jitter_ebus[4]：EBUS 低抖动；dc_width[3]：DC 宽度（1=64 位）；dc[2]：分布式时钟可用；fmmu_op[0]：FMMU 操作（0=位映射/1=字节映射）
    //---------------------------------------------------------------------
    class ESC_Features_supported_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ESC_Features_supported_reg)

        function new(string name="ESC_Features_supported_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RO", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : ESC_Features_supported_reg

    //---------------------------------------------------------------------
    // Configured Station Address  (0x0010, 16-bit, RW)
    //   位域: addr[15:0]：配置站地址（节点寻址 FPxx 使用）（复位值 0x0000）
    //---------------------------------------------------------------------
    class Configured_Station_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Configured_Station_Address_reg)

        function new(string name="Configured_Station_Address_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Configured_Station_Address_reg

    //---------------------------------------------------------------------
    // Configured Station Alias  (0x0012, 16-bit, RW)
    //   位域: alias[15:0]：配置站别名（EEPROM 地址 0x0004 加载，DL Control[24] 使能后生效）
    //---------------------------------------------------------------------
    class Configured_Station_Alias_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Configured_Station_Alias_reg)

        function new(string name="Configured_Station_Alias_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Configured_Station_Alias_reg

    //---------------------------------------------------------------------
    // Write Register Enable  (0x0020, 8-bit, RW)
    //   位域: enable[0]：写寄存器使能（写保护使能时须同帧先写本寄存器，值任意）
    //---------------------------------------------------------------------
    class Write_Register_Enable_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Write_Register_Enable_reg)

        function new(string name="Write_Register_Enable_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Write_Register_Enable_reg

    //---------------------------------------------------------------------
    // Write Register Protection  (0x0021, 8-bit, RW)
    //   位域: protect[0]：写寄存器保护使能（保护 0x0000–0x0137 与 0x013A–0x0F0F，0x0030 除外）
    //---------------------------------------------------------------------
    class Write_Register_Protection_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Write_Register_Protection_reg)

        function new(string name="Write_Register_Protection_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Write_Register_Protection_reg

    //---------------------------------------------------------------------
    // ESC Write Enable  (0x0030, 8-bit, RW)
    //   位域: enable[0]：ESC 写使能（ESC 写保护使能时须同帧先写本寄存器）
    //---------------------------------------------------------------------
    class ESC_Write_Enable_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ESC_Write_Enable_reg)

        function new(string name="ESC_Write_Enable_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : ESC_Write_Enable_reg

    //---------------------------------------------------------------------
    // ESC Write Protection  (0x0031, 8-bit, RW)
    //   位域: protect[0]：ESC 写保护使能（保护所有区域，0x0030 除外）
    //---------------------------------------------------------------------
    class ESC_Write_Protection_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ESC_Write_Protection_reg)

        function new(string name="ESC_Write_Protection_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : ESC_Write_Protection_reg

    //---------------------------------------------------------------------
    // ESC Reset ECAT  (0x0040, 8-bit, RW)
    //   位域: reset[7:0]：连续 3 帧写 0x52('R')/0x45('E')/0x53('S') 触发 EtherCAT 核复位；progress[1:0]（读）：复位进度（01=已写 R、10=已写 RE、00=其它）
    //---------------------------------------------------------------------
    class ESC_Reset_ECAT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ESC_Reset_ECAT_reg)

        function new(string name="ESC_Reset_ECAT_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : ESC_Reset_ECAT_reg

    //---------------------------------------------------------------------
    // ESC Reset PDI  (0x0041, 8-bit, RW)
    //   位域: reset[7:0]：同上序列复位 PDI；progress[1:0]（读）
    //---------------------------------------------------------------------
    class ESC_Reset_PDI_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ESC_Reset_PDI_reg)

        function new(string name="ESC_Reset_PDI_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : ESC_Reset_PDI_reg

    //---------------------------------------------------------------------
    // ESC DL Control  (0x0100, 32-bit, RW)
    //   位域: station_alias[24]：站别名使能（FPxx 用别名寻址）；ebus_remote_link_down[22]：EBUS 远程断链信号时间（0=~660ms/1=~80µs）；ebus_low_jitter[19]：EBUS 低抖动；rx_fifo_size[18:16]：RX FIFO 大小（0-7，复位 7）；loop_port3[15:14]、loop_port2[13:12]、loop_port1[11:10]、loop_port0[9:8]：各端口环回（00=Auto/01=Auto Close/10=Open/11=Closed）；temp_use[1]：临时环回（约 1 秒后恢复）；forwarding_rule[0]：转发规则（0=转发非 EtherCAT 帧/1=丢弃，复位 1）
    //---------------------------------------------------------------------
    class ESC_DL_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ESC_DL_Control_reg)

        function new(string name="ESC_DL_Control_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ESC_DL_Control_reg

    //---------------------------------------------------------------------
    // Extended ESC DL Control  (0x0102, 8-bit, RW)
    //   位域: （扩展数据链路控制，仅 IP Core）
    //---------------------------------------------------------------------
    class Extended_ESC_DL_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Extended_ESC_DL_Control_reg)

        function new(string name="Extended_ESC_DL_Control_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Extended_ESC_DL_Control_reg

    //---------------------------------------------------------------------
    // Physical Read/Write Offset  (0x0108, 16-bit, RW)
    //   位域: offset[15:0]：R/W 命令读/写地址偏移（RD_ADR=ADR、WR_ADR=ADR+Offset）
    //---------------------------------------------------------------------
    class Physical_Read_Write_Offset_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Physical_Read_Write_Offset_reg)

        function new(string name="Physical_Read_Write_Offset_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Physical_Read_Write_Offset_reg

    //---------------------------------------------------------------------
    // ESC DL Status  (0x0110, 16-bit, RW)
    //   位域: comm_port3[15]、loop_port3[14]、comm_port2[13]、loop_port2[12]、comm_port1[11]、loop_port1[10]、comm_port0[9]、loop_port0[8]：各端口通信建立/环回关闭；phy_link_port3[7]、phy_link_port2[6]、phy_link_port1[5]、phy_link_port0[4]：各端口物理链路（1=检测到 link）；enh_link[2]：增强链路检测；pdi_wd_status[1]：PDI 看门狗状态（0=超时/1=已重载）；pdi_operational[0]：PDI 运行/EEPROM 已加载（=1 是 Process RAM 可访问前提）
    //---------------------------------------------------------------------
    class ESC_DL_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ESC_DL_Status_reg)

        function new(string name="ESC_DL_Status_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : ESC_DL_Status_reg

    //---------------------------------------------------------------------
    // AL Control  (0x0120, 8-bit, RW)
    //   位域: device_id[5]：设备识别请求；error_ind_ack[4]：Error Ind 应答；device_state[3:0]：请求状态（1=Init/2=Pre-Op/3=Bootstrap/4=Safe-Op/8=Operational）
    //---------------------------------------------------------------------
    class AL_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(AL_Control_reg)

        function new(string name="AL_Control_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : AL_Control_reg

    //---------------------------------------------------------------------
    // AL Status  (0x0130, 8-bit, RW)
    //   位域: device_id[5]：设备识别；error_ind[4]：设备未进入请求状态或因本地动作改变状态；actual_state[3:0]：实际状态（1=Init/2=Pre-Op/3=Bootstrap/4=Safe-Op/8=Operational）
    //---------------------------------------------------------------------
    class AL_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(AL_Status_reg)

        function new(string name="AL_Status_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : AL_Status_reg

    //---------------------------------------------------------------------
    // AL Status Code  (0x0134, 16-bit, RW)
    //   位域: code[15:0]：应用层状态码
    //---------------------------------------------------------------------
    class AL_Status_Code_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(AL_Status_Code_reg)

        function new(string name="AL_Status_Code_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : AL_Status_Code_reg

    //---------------------------------------------------------------------
    // RUN LED Override  (0x0138, 8-bit, RW)
    //   位域: enable[4]：覆盖使能；led_code[3:0]：LED 编码（0x0=Off/0x1-0xC=闪 1-12 次/0xD=Blinking/0xE=Flickering/0xF=On）
    //---------------------------------------------------------------------
    class RUN_LED_Override_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RUN_LED_Override_reg)

        function new(string name="RUN_LED_Override_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : RUN_LED_Override_reg

    //---------------------------------------------------------------------
    // ERR LED Override  (0x0139, 8-bit, RW)
    //   位域: enable[4]：覆盖使能；led_code[3:0]：LED 编码（同 RUN）
    //---------------------------------------------------------------------
    class ERR_LED_Override_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ERR_LED_Override_reg)

        function new(string name="ERR_LED_Override_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : ERR_LED_Override_reg

    //---------------------------------------------------------------------
    // PDI Control  (0x0140, 8-bit, RW)
    //   位域: pdi_type[7:0]：PDI 类型（0x00=无 PDI/0x04=Digital I/O/0x05=SPI Slave/0x06=Oversampling I/O/0x07=EtherCAT Bridge(端口3)/0x08=16 位异步 µC/0x09=8 位异步 µC/0x0A=16 位同步 µC/0x0B=8 位同步 µC/0x10-0x14=32DI~32DO/0x80=On-chip bus）
    //---------------------------------------------------------------------
    class PDI_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PDI_Control_reg)

        function new(string name="PDI_Control_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : PDI_Control_reg

    //---------------------------------------------------------------------
    // ESC Configuration  (0x0141, 8-bit, RW)
    //   位域: enh_link_port3[7]、enh_link_port2[6]、enh_link_port1[5]、enh_link_port0[4]：各端口增强链路检测；dc_latch_in[3]：DC Latch In 单元；dc_sync_out[2]：DC SYNC Out 单元；enh_link_all[1]：所有端口增强链路检测（覆盖 [7:4]）；device_emulation[0]：设备仿真（0=AL status 由 PDI 设/1=自动取 AL control）
    //---------------------------------------------------------------------
    class ESC_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ESC_Configuration_reg)

        function new(string name="ESC_Configuration_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : ESC_Configuration_reg

    //---------------------------------------------------------------------
    // PDI Information  (0x014E, 8-bit, RW)
    //   位域: pdi_config_invalid[3]：PDI 配置无效；pdi_active[2]：PDI 已激活；pdi_configured[1]：PDI 已配置；pdi_write_ack[0]：PDI 寄存器写应答使能
    //---------------------------------------------------------------------
    class PDI_Information_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PDI_Information_reg)

        function new(string name="PDI_Information_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : PDI_Information_reg

    //---------------------------------------------------------------------
    // PDI Configuration  (0x0150, 8-bit, RW)
    //   位域: 依 PDI 类型：SPI 模式 spi_mode[1:0]/spi_irq_pol[3:2]/spi_sel_pol[4]/data_out_sample[5]；异步 µC busy_pol[1:0]/irq_pol[3:2]/bhe_pol[4]/rd_pol[7]；同步 µC ta_pol[1:0]/irq_pol[3:2]/bhe_pol[4]/adr0_pol[5]/byte_access[6]/ts_pol[7]；Digital I/O outvalid_pol[0]/outvalid_mode[1]/bidir[2]/wd_behaviour[3]/input_sample[5:4]/output_update[7:6]
    //---------------------------------------------------------------------
    class PDI_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PDI_Configuration_reg)

        function new(string name="PDI_Configuration_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : PDI_Configuration_reg

    //---------------------------------------------------------------------
    // DC Sync/Latch Configuration  (0x0151, 8-bit, RW)
    //   位域: sync1_to_al_event[7]：SYNC1 映射到 AL Event 0x0220.3；sync1_latch1[6]：SYNC1/LATCH1 选择；sync1_pol[5:4]：SYNC1 驱动/极性；sync0_to_al_event[3]：SYNC0 映射到 0x0220.2；sync0_latch0[2]：SYNC0/LATCH0 选择；sync0_pol[1:0]：SYNC0 驱动/极性
    //---------------------------------------------------------------------
    class DC_Sync_Latch_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DC_Sync_Latch_Configuration_reg)

        function new(string name="DC_Sync_Latch_Configuration_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : DC_Sync_Latch_Configuration_reg

    //---------------------------------------------------------------------
    // Extended PDI Configuration  (0x0152, 8-bit, RW)
    //   位域: Digital I/O：每对 I/O 方向 [15:0]；同步 µC：write_data_valid[8]/read_mode[9]/cs_sample[10]/ta_update[11]；异步 µC：read_busy_delay[0]/write_timing[1]；On-chip bus：read_prefetch[1:0]/axi_subtype[10:8]
    //---------------------------------------------------------------------
    class Extended_PDI_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Extended_PDI_Configuration_reg)

        function new(string name="Extended_PDI_Configuration_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Extended_PDI_Configuration_reg

    //---------------------------------------------------------------------
    // ECAT Event Mask  (0x0200, 16-bit, RW)
    //   位域: mask[15:0]：把 ECAT Event Request 位映射到帧的 ECAT event 字段（0=不映射/1=映射）
    //---------------------------------------------------------------------
    class ECAT_Event_Mask_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ECAT_Event_Mask_reg)

        function new(string name="ECAT_Event_Mask_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : ECAT_Event_Mask_reg

    //---------------------------------------------------------------------
    // PDI AL Event Mask  (0x0204, 16-bit, RW)
    //   位域: mask[15:0]：把 AL Event Request 映射到 PDI IRQ 信号（复位值 0x00FF）
    //---------------------------------------------------------------------
    class PDI_AL_Event_Mask_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PDI_AL_Event_Mask_reg)

        function new(string name="PDI_AL_Event_Mask_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : PDI_AL_Event_Mask_reg

    //---------------------------------------------------------------------
    // ECAT Event Request  (0x0210, 16-bit, RW)
    //   位域: sm_status_mirror[11:4]：SM0-7 状态镜像；al_status_event[3]：AL Status 事件（读 0x0130 清除）；dl_status_event[2]：DL Status 事件（读 0x0110 清除）；dc_latch_event[0]：DC Latch 事件（读 Latch 时间清除）
    //---------------------------------------------------------------------
    class ECAT_Event_Request_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ECAT_Event_Request_reg)

        function new(string name="ECAT_Event_Request_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : ECAT_Event_Request_reg

    //---------------------------------------------------------------------
    // AL Event Request  (0x0220, 32-bit, RW)
    //   位域: sm_int[23:8]：SM0-15 中断（SM Status[0]/[1]）；wd_process_data[6]：Process Data 看门狗（读 0x0440 清除）；eeprom_emulation[5]：EEPROM 仿真；sm_activation_changed[4]：SM 激活改变（读 0x0806 清除）；dc_sync1[3]：DC SYNC1 状态（读 0x098F 清除）；dc_sync0[2]：DC SYNC0 状态（读 0x098E 清除）；dc_latch_event[1]：DC Latch 事件；al_control_event[0]：AL Control 事件（PDI 读 0x0120 清除）
    //---------------------------------------------------------------------
    class AL_Event_Request_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(AL_Event_Request_reg)

        function new(string name="AL_Event_Request_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : AL_Event_Request_reg

    //---------------------------------------------------------------------
    // RX Error Counter Port 0  (0x0300, 16-bit, RW)
    //   位域: rx_error[15:8]：RX 错误计数；invalid_frame[7:0]：无效帧计数（饱和 0xFF，写清除）
    //---------------------------------------------------------------------
    class RX_Error_Counter_Port_0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RX_Error_Counter_Port_0_reg)

        function new(string name="RX_Error_Counter_Port_0_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : RX_Error_Counter_Port_0_reg

    //---------------------------------------------------------------------
    // RX Error Counter Port 1  (0x0302, 16-bit, RW)
    //   位域: rx_error[15:8]；invalid_frame[7:0]：同 Port0
    //---------------------------------------------------------------------
    class RX_Error_Counter_Port_1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RX_Error_Counter_Port_1_reg)

        function new(string name="RX_Error_Counter_Port_1_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : RX_Error_Counter_Port_1_reg

    //---------------------------------------------------------------------
    // RX Error Counter Port 2  (0x0304, 16-bit, RW)
    //   位域: rx_error[15:8]；invalid_frame[7:0]：同 Port0
    //---------------------------------------------------------------------
    class RX_Error_Counter_Port_2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RX_Error_Counter_Port_2_reg)

        function new(string name="RX_Error_Counter_Port_2_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : RX_Error_Counter_Port_2_reg

    //---------------------------------------------------------------------
    // RX Error Counter Port 3  (0x0306, 16-bit, RW)
    //   位域: rx_error[15:8]；invalid_frame[7:0]：同 Port0
    //---------------------------------------------------------------------
    class RX_Error_Counter_Port_3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RX_Error_Counter_Port_3_reg)

        function new(string name="RX_Error_Counter_Port_3_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : RX_Error_Counter_Port_3_reg

    //---------------------------------------------------------------------
    // Forwarded RX Error Port 0  (0x0308, 8-bit, RW)
    //   位域: fwd_rx_error[7:0]：转发 RX 错误计数（饱和 0xFF，写清除）
    //---------------------------------------------------------------------
    class Forwarded_RX_Error_Port_0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Forwarded_RX_Error_Port_0_reg)

        function new(string name="Forwarded_RX_Error_Port_0_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Forwarded_RX_Error_Port_0_reg

    //---------------------------------------------------------------------
    // Forwarded RX Error Port 1  (0x030A, 8-bit, RW)
    //   位域: fwd_rx_error[7:0]：同 Port0
    //---------------------------------------------------------------------
    class Forwarded_RX_Error_Port_1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Forwarded_RX_Error_Port_1_reg)

        function new(string name="Forwarded_RX_Error_Port_1_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Forwarded_RX_Error_Port_1_reg

    //---------------------------------------------------------------------
    // ECAT Processing Unit Error Counter  (0x030C, 8-bit, RW)
    //   位域: ecu_error[7:0]：ECAT 处理单元帧错误计数
    //---------------------------------------------------------------------
    class ECAT_Processing_Unit_Error_Counter_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ECAT_Processing_Unit_Error_Counter_reg)

        function new(string name="ECAT_Processing_Unit_Error_Counter_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : ECAT_Processing_Unit_Error_Counter_reg

    //---------------------------------------------------------------------
    // PDI Error Counter  (0x030D, 8-bit, RW)
    //   位域: pdi_error[7:0]：PDI 错误计数
    //---------------------------------------------------------------------
    class PDI_Error_Counter_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PDI_Error_Counter_reg)

        function new(string name="PDI_Error_Counter_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : PDI_Error_Counter_reg

    //---------------------------------------------------------------------
    // PDI Error Code  (0x030E, 8-bit, RW)
    //   位域: SPI：cmd[7:6]/写继续[5]/缺读终止[4]/读 busy 违例[3]/访问时钟周期数[2:0]；µC：写寻址错[3]/读寻址错[2]/写 busy 违例[1]/读 busy 违例[0]
    //---------------------------------------------------------------------
    class PDI_Error_Code_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PDI_Error_Code_reg)

        function new(string name="PDI_Error_Code_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : PDI_Error_Code_reg

    //---------------------------------------------------------------------
    // Lost Link Counter Port 0  (0x0310, 8-bit, RW)
    //   位域: lost_link[7:0]：丢链计数（仅 Loop=Auto 时）
    //---------------------------------------------------------------------
    class Lost_Link_Counter_Port_0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Lost_Link_Counter_Port_0_reg)

        function new(string name="Lost_Link_Counter_Port_0_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Lost_Link_Counter_Port_0_reg

    //---------------------------------------------------------------------
    // Lost Link Counter Port 1  (0x0312, 8-bit, RW)
    //   位域: lost_link[7:0]：同 Port0
    //---------------------------------------------------------------------
    class Lost_Link_Counter_Port_1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Lost_Link_Counter_Port_1_reg)

        function new(string name="Lost_Link_Counter_Port_1_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Lost_Link_Counter_Port_1_reg

    //---------------------------------------------------------------------
    // Watchdog Divider  (0x0400, 16-bit, RW)
    //   位域: wd_div[15:0]：看门狗分频器，25MHz tick 数减 2（复位值 0x09C2=2498→100µs）
    //---------------------------------------------------------------------
    class Watchdog_Divider_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Watchdog_Divider_reg)

        function new(string name="Watchdog_Divider_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Watchdog_Divider_reg

    //---------------------------------------------------------------------
    // Watchdog Time PDI  (0x0410, 16-bit, RW)
    //   位域: wd_time_pdi[15:0]：PDI 看门狗时间（=0 禁用，复位值 0x03E8=100ms）
    //---------------------------------------------------------------------
    class Watchdog_Time_PDI_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Watchdog_Time_PDI_reg)

        function new(string name="Watchdog_Time_PDI_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Watchdog_Time_PDI_reg

    //---------------------------------------------------------------------
    // Watchdog Time Process Data  (0x0420, 16-bit, RW)
    //   位域: wd_time_pd[15:0]：过程数据看门狗时间（=0 禁用，复位值 0x03E8）
    //---------------------------------------------------------------------
    class Watchdog_Time_Process_Data_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Watchdog_Time_Process_Data_reg)

        function new(string name="Watchdog_Time_Process_Data_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Watchdog_Time_Process_Data_reg

    //---------------------------------------------------------------------
    // Watchdog Status Process Data  (0x0440, 8-bit, RW)
    //   位域: wd_status[0]：0=超时/1=激活或禁用
    //---------------------------------------------------------------------
    class Watchdog_Status_Process_Data_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Watchdog_Status_Process_Data_reg)

        function new(string name="Watchdog_Status_Process_Data_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Watchdog_Status_Process_Data_reg

    //---------------------------------------------------------------------
    // Watchdog Counter Process Data  (0x0442, 8-bit, RW)
    //   位域: wd_counter[7:0]：过程数据看门狗超时计数（写 0x0442/0x0443 任一清两者）
    //---------------------------------------------------------------------
    class Watchdog_Counter_Process_Data_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Watchdog_Counter_Process_Data_reg)

        function new(string name="Watchdog_Counter_Process_Data_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Watchdog_Counter_Process_Data_reg

    //---------------------------------------------------------------------
    // Watchdog Counter PDI  (0x0443, 8-bit, RW)
    //   位域: wd_counter[7:0]：PDI 看门狗超时计数
    //---------------------------------------------------------------------
    class Watchdog_Counter_PDI_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Watchdog_Counter_PDI_reg)

        function new(string name="Watchdog_Counter_PDI_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Watchdog_Counter_PDI_reg

    //---------------------------------------------------------------------
    // EEPROM Configuration  (0x0500, 8-bit, RW)
    //   位域: force_ecat[1]：强制 ECAT 访问（复位 0x0501.0）；pdi_ctrl[0]：EEPROM 控制权交给 PDI
    //---------------------------------------------------------------------
    class EEPROM_Configuration_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(EEPROM_Configuration_reg)

        function new(string name="EEPROM_Configuration_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : EEPROM_Configuration_reg

    //---------------------------------------------------------------------
    // EEPROM PDI Access State  (0x0501, 8-bit, RW)
    //   位域: pdi_access[0]：=1 时 PDI 拥有 EEPROM 控制权
    //---------------------------------------------------------------------
    class EEPROM_PDI_Access_State_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(EEPROM_PDI_Access_State_reg)

        function new(string name="EEPROM_PDI_Access_State_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : EEPROM_PDI_Access_State_reg

    //---------------------------------------------------------------------
    // EEPROM Control/Status  (0x0502, 16-bit, RW)
    //   位域: busy[15]：忙；err_write_enable[14]：无写使能的写；err_ack_cmd[13]：缺应答/无效命令；err_device_info[12]：EEPROM 加载失败；checksum_err[11]：ESC 配置区校验错；cmd[10:8]：命令（000=空闲/清错、001=读、010=写、100=重载）；eeprom_algorithm[7]：地址字节数（0=1 字节/1=2 字节）；eeprom_read_bytes[6]：读字节数（0=4/1=8，ET1100/ET1200=1）；emulation[5]：EEPROM 仿真；write_enable[0]：写请求使能
    //---------------------------------------------------------------------
    class EEPROM_Control_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(EEPROM_Control_Status_reg)

        function new(string name="EEPROM_Control_Status_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : EEPROM_Control_Status_reg

    //---------------------------------------------------------------------
    // EEPROM Address  (0x0504, 32-bit, RW)
    //   位域: addr[17:0]：EEPROM 地址（≤16Kbit 用 [9:0]、32Kbit–4Mbit 用 [17:0]、仿真用 [31:0]）
    //---------------------------------------------------------------------
    class EEPROM_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(EEPROM_Address_reg)

        function new(string name="EEPROM_Address_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : EEPROM_Address_reg

    //---------------------------------------------------------------------
    // EEPROM Data  (0x0508, 64-bit, RW)
    //   位域: data[63:0]：EEPROM 数据（写 [15:0]、读 [63:16]）
    //---------------------------------------------------------------------
    class EEPROM_Data_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(EEPROM_Data_reg)

        function new(string name="EEPROM_Data_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : EEPROM_Data_reg

    //---------------------------------------------------------------------
    // MII Management Control/Status  (0x0510, 16-bit, RW)
    //   位域: busy[15]：忙；cmd_error[14]：命令错误；read_error[13]：读错误；cmd[9:8]：命令（00=空闲/清错、01=读、10=写）；port0_phy_addr[7:3]：Port0 PHY 地址；mi_link_detect[2]：MI 链路检测激活；pdi_ctrl[1]：MI 由 PDI 可控；write_enable[0]：写使能
    //---------------------------------------------------------------------
    class MII_Management_Control_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MII_Management_Control_Status_reg)

        function new(string name="MII_Management_Control_Status_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : MII_Management_Control_Status_reg

    //---------------------------------------------------------------------
    // MII PHY Address  (0x0512, 8-bit, RW)
    //   位域: show_independent[7]：显示独立地址；phy_addr[4:0]：PHY 地址
    //---------------------------------------------------------------------
    class MII_PHY_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MII_PHY_Address_reg)

        function new(string name="MII_PHY_Address_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : MII_PHY_Address_reg

    //---------------------------------------------------------------------
    // MII PHY Register Address  (0x0513, 8-bit, RW)
    //   位域: phy_reg[4:0]：PHY 寄存器号
    //---------------------------------------------------------------------
    class MII_PHY_Register_Address_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MII_PHY_Register_Address_reg)

        function new(string name="MII_PHY_Register_Address_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : MII_PHY_Register_Address_reg

    //---------------------------------------------------------------------
    // MII PHY Data  (0x0514, 16-bit, RW)
    //   位域: data[15:0]：PHY 读/写数据
    //---------------------------------------------------------------------
    class MII_PHY_Data_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MII_PHY_Data_reg)

        function new(string name="MII_PHY_Data_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : MII_PHY_Data_reg

    //---------------------------------------------------------------------
    // MII ECAT Access State  (0x0516, 8-bit, RW)
    //   位域: ecat_access[0]：ECAT 请求独占
    //---------------------------------------------------------------------
    class MII_ECAT_Access_State_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MII_ECAT_Access_State_reg)

        function new(string name="MII_ECAT_Access_State_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : MII_ECAT_Access_State_reg

    //---------------------------------------------------------------------
    // MII PDI Access State  (0x0517, 8-bit, RW)
    //   位域: force_reset[1]：强制复位；pdi_access[0]：=1 时 PDI 拥有 MI 访问
    //---------------------------------------------------------------------
    class MII_PDI_Access_State_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MII_PDI_Access_State_reg)

        function new(string name="MII_PDI_Access_State_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : MII_PDI_Access_State_reg

    //---------------------------------------------------------------------
    // PHY Port Status（Port0–3）  (0x0518, 8-bit, RW)
    //   位域: 每端口 1 字节：phy_config_updated[5]：PHY 配置已更新；peer_error[4]：对端错误；read_error[3]：读错误；link_error[2]：链路错误；link_full_duplex[1]：link（100M 全双工）；phy_link[0]：物理 link
    //---------------------------------------------------------------------
    class PHY_Port_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PHY_Port_Status_reg)

        function new(string name="PHY_Port_Status_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : PHY_Port_Status_reg

    //---------------------------------------------------------------------
    // FMMU（8 通道 × 16 字节）  (0x0600, 8-bit, RW)
    //   位域: 地址=0x0600+y×16+偏移。每通道：Logical Start Address[+0x0]：逻辑起始地址；Length[+0x4]：逻辑字节数；Logical Start bit[+0x6][2:0]：逻辑起始位；Logical Stop bit[+0x7][2:0]：逻辑结束位；Physical Start Address[+0x8]：物理起始地址；Physical Start bit[+0xA][2:0]：物理起始位；Type[+0xB]（bit0=读映射/bit1=写映射）；Activate[+0xC]（bit0=激活）
    //---------------------------------------------------------------------
    class FMMU_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(FMMU_reg)

        function new(string name="FMMU_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : FMMU_reg

    //---------------------------------------------------------------------
    // SyncManager（8 通道 × 8 字节）  (0x0800, 8-bit, RW)
    //   位域: 地址=0x0800+y×8+偏移。每通道：Physical Start Address[+0x0]；Length[+0x2]；Control[+0x4]（[1:0]模式 00=Buffered(3 缓冲)/10=Mailbox(单缓冲)；[3:2]方向 00=Read(ECAT 读/PDI 写)/01=Write(ECAT 写/PDI 读)；[4]ECAT 事件中断；[5]PDI 事件中断；[6]看门狗触发）；Status[+0x5]（[0]写中断/[1]读中断/[3]邮箱满/[5:4]最后写入缓冲/[6]读缓冲占用/[7]写缓冲占用）；Activate[+0x6]（[0]使能/[1]Repeat Request/[6]ECAT Latch/[7]PDI Latch）；PDI Control[+0x7]（[0]停用/[1]Repeat Ack）
    //---------------------------------------------------------------------
    class SyncManager_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SyncManager_reg)

        function new(string name="SyncManager_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : SyncManager_reg

    //---------------------------------------------------------------------
    // Receive Time Port 0  (0x0900, 32-bit, RW)
    //   位域: time[31:0]：写=锁存各端口接收帧开始本地时间；读=最近一次含写访问帧开始时间
    //---------------------------------------------------------------------
    class Receive_Time_Port_0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Receive_Time_Port_0_reg)

        function new(string name="Receive_Time_Port_0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Receive_Time_Port_0_reg

    //---------------------------------------------------------------------
    // Receive Time Port 1  (0x0904, 32-bit, RW)
    //   位域: time[31:0]：同 Port0
    //---------------------------------------------------------------------
    class Receive_Time_Port_1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Receive_Time_Port_1_reg)

        function new(string name="Receive_Time_Port_1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Receive_Time_Port_1_reg

    //---------------------------------------------------------------------
    // Receive Time Port 2  (0x0908, 32-bit, RW)
    //   位域: time[31:0]：同 Port0
    //---------------------------------------------------------------------
    class Receive_Time_Port_2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Receive_Time_Port_2_reg)

        function new(string name="Receive_Time_Port_2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Receive_Time_Port_2_reg

    //---------------------------------------------------------------------
    // Receive Time Port 3  (0x090C, 32-bit, RW)
    //   位域: time[31:0]：同 Port0
    //---------------------------------------------------------------------
    class Receive_Time_Port_3_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Receive_Time_Port_3_reg)

        function new(string name="Receive_Time_Port_3_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Receive_Time_Port_3_reg

    //---------------------------------------------------------------------
    // System Time  (0x0910, 64-bit, RW)
    //   位域: time[63:0]：64 位本地系统时间（1ns 基准，2000-01-01 起）
    //---------------------------------------------------------------------
    class System_Time_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(System_Time_reg)

        function new(string name="System_Time_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : System_Time_reg

    //---------------------------------------------------------------------
    // Receive Time EPU  (0x0918, 64-bit, RW)
    //   位域: time[63:0]：ECAT 处理单元收到帧开始时间
    //---------------------------------------------------------------------
    class Receive_Time_EPU_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Receive_Time_EPU_reg)

        function new(string name="Receive_Time_EPU_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : Receive_Time_EPU_reg

    //---------------------------------------------------------------------
    // System Time Offset  (0x0920, 64-bit, RW)
    //   位域: offset[63:0]：本地时间与 System Time 之差（加到本地时间）
    //---------------------------------------------------------------------
    class System_Time_Offset_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(System_Time_Offset_reg)

        function new(string name="System_Time_Offset_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : System_Time_Offset_reg

    //---------------------------------------------------------------------
    // System Time Delay  (0x0928, 32-bit, RW)
    //   位域: delay[31:0]：参考时钟与 ESC 间传播延迟
    //---------------------------------------------------------------------
    class System_Time_Delay_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(System_Time_Delay_reg)

        function new(string name="System_Time_Delay_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : System_Time_Delay_reg

    //---------------------------------------------------------------------
    // System Time Difference  (0x092C, 32-bit, RW)
    //   位域: sign[31]：符号位；diff[30:0]：本地副本与收到 System Time 的平均差
    //---------------------------------------------------------------------
    class System_Time_Difference_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(System_Time_Difference_reg)

        function new(string name="System_Time_Difference_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : System_Time_Difference_reg

    //---------------------------------------------------------------------
    // Speed Counter Start  (0x0930, 16-bit, RW)
    //   位域: start[15:0]：调整带宽（复位值 0x1000，范围 0x0080–0x3FFF）
    //---------------------------------------------------------------------
    class Speed_Counter_Start_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Speed_Counter_Start_reg)

        function new(string name="Speed_Counter_Start_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Speed_Counter_Start_reg

    //---------------------------------------------------------------------
    // Speed Counter Diff  (0x0932, 16-bit, RW)
    //   位域: diff[15:0]：本地/参考时钟周期偏差（补码）
    //---------------------------------------------------------------------
    class Speed_Counter_Diff_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Speed_Counter_Diff_reg)

        function new(string name="Speed_Counter_Diff_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Speed_Counter_Diff_reg

    //---------------------------------------------------------------------
    // System Time Difference Filter Depth  (0x0934, 8-bit, RW)
    //   位域: depth[7:0]：滤波深度（复位值 4）
    //---------------------------------------------------------------------
    class System_Time_Difference_Filter_Depth_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(System_Time_Difference_Filter_Depth_reg)

        function new(string name="System_Time_Difference_Filter_Depth_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : System_Time_Difference_Filter_Depth_reg

    //---------------------------------------------------------------------
    // Speed Counter Filter Depth  (0x0935, 8-bit, RW)
    //   位域: depth[7:0]：滤波深度（复位值 12）
    //---------------------------------------------------------------------
    class Speed_Counter_Filter_Depth_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Speed_Counter_Filter_Depth_reg)

        function new(string name="Speed_Counter_Filter_Depth_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Speed_Counter_Filter_Depth_reg

    //---------------------------------------------------------------------
    // Receive Time Latch Mode  (0x0936, 8-bit, RW)
    //   位域: mode[0]：0=转发/1=反向
    //---------------------------------------------------------------------
    class Receive_Time_Latch_Mode_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Receive_Time_Latch_Mode_reg)

        function new(string name="Receive_Time_Latch_Mode_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Receive_Time_Latch_Mode_reg

    //---------------------------------------------------------------------
    // Cyclic Unit Control  (0x0980, 8-bit, RW)
    //   位域: latch1_ctrl[5]、latch0_ctrl[4]、sync_out_ctrl[0]：各单元控制（0=ECAT/1=PDI）
    //---------------------------------------------------------------------
    class Cyclic_Unit_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Cyclic_Unit_Control_reg)

        function new(string name="Cyclic_Unit_Control_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Cyclic_Unit_Control_reg

    //---------------------------------------------------------------------
    // DC Activation  (0x0981, 8-bit, RW)
    //   位域: debug_pulse[7]：调试脉冲；near_future[6]：Near future（0=½DC 宽度/1=~2.1s）；start_time_check[5]：开始时间合理性检查；start_time_64[4]：开始时间扩展 64 位；auto_activate[3]：写开始时间自动激活；sync1_gen[2]：SYNC1 产生；sync0_gen[1]：SYNC0 产生；sync_out_activate[0]：Sync Out 激活
    //---------------------------------------------------------------------
    class DC_Activation_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DC_Activation_reg)

        function new(string name="DC_Activation_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : DC_Activation_reg

    //---------------------------------------------------------------------
    // Pulse Length of SyncSignals  (0x0982, 16-bit, RW)
    //   位域: pulse_len[15:0]：SYNC 脉冲宽度（10ns 单位，0=Acknowledge 模式）
    //---------------------------------------------------------------------
    class Pulse_Length_of_SyncSignals_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Pulse_Length_of_SyncSignals_reg)

        function new(string name="Pulse_Length_of_SyncSignals_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : Pulse_Length_of_SyncSignals_reg

    //---------------------------------------------------------------------
    // DC Activation Status  (0x0984, 8-bit, RW)
    //   位域: start_time_check_result[2]：开始时间合理性结果；sync1_pending[1]：SYNC1 挂起；sync0_pending[0]：SYNC0 挂起
    //---------------------------------------------------------------------
    class DC_Activation_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DC_Activation_Status_reg)

        function new(string name="DC_Activation_Status_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : DC_Activation_Status_reg

    //---------------------------------------------------------------------
    // SYNC0 Status  (0x098E, 8-bit, RW)
    //   位域: status[7:0]：Acknowledge 模式状态（读清除）
    //---------------------------------------------------------------------
    class SYNC0_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SYNC0_Status_reg)

        function new(string name="SYNC0_Status_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : SYNC0_Status_reg

    //---------------------------------------------------------------------
    // SYNC1 Status  (0x098F, 8-bit, RW)
    //   位域: status[7:0]：Acknowledge 模式状态（读清除）
    //---------------------------------------------------------------------
    class SYNC1_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SYNC1_Status_reg)

        function new(string name="SYNC1_Status_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : SYNC1_Status_reg

    //---------------------------------------------------------------------
    // Start Time Cyclic Operation / Next SYNC0 Pulse  (0x0990, 64-bit, RW)
    //   位域: time[63:0]：写=循环开始时间（ns）；读=下一 SYNC0 脉冲时间
    //---------------------------------------------------------------------
    class Start_Time_Cyclic_Operation_Next_SYNC0_Pulse_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Start_Time_Cyclic_Operation_Next_SYNC0_Pulse_reg)

        function new(string name="Start_Time_Cyclic_Operation_Next_SYNC0_Pulse_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : Start_Time_Cyclic_Operation_Next_SYNC0_Pulse_reg

    //---------------------------------------------------------------------
    // Next SYNC1 Pulse  (0x0998, 64-bit, RW)
    //   位域: time[63:0]：下一 SYNC1 脉冲时间
    //---------------------------------------------------------------------
    class Next_SYNC1_Pulse_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Next_SYNC1_Pulse_reg)

        function new(string name="Next_SYNC1_Pulse_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : Next_SYNC1_Pulse_reg

    //---------------------------------------------------------------------
    // SYNC0 Cycle Time  (0x09A0, 32-bit, RW)
    //   位域: cycle[31:0]：SYNC0 脉冲间隔（ns，0=单次模式）
    //---------------------------------------------------------------------
    class SYNC0_Cycle_Time_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SYNC0_Cycle_Time_reg)

        function new(string name="SYNC0_Cycle_Time_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SYNC0_Cycle_Time_reg

    //---------------------------------------------------------------------
    // SYNC1 Cycle Time  (0x09A4, 32-bit, RW)
    //   位域: cycle[31:0]：SYNC1 相对 SYNC0 延时（ns，0=跟随 SYNC0）
    //---------------------------------------------------------------------
    class SYNC1_Cycle_Time_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SYNC1_Cycle_Time_reg)

        function new(string name="SYNC1_Cycle_Time_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SYNC1_Cycle_Time_reg

    //---------------------------------------------------------------------
    // Latch0 Control  (0x09A8, 8-bit, RW)
    //   位域: neg_edge[1]：负沿；pos_edge[0]：正沿（0=连续/1=单事件）
    //---------------------------------------------------------------------
    class Latch0_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Latch0_Control_reg)

        function new(string name="Latch0_Control_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Latch0_Control_reg

    //---------------------------------------------------------------------
    // Latch1 Control  (0x09A9, 8-bit, RW)
    //   位域: neg_edge[1]；pos_edge[0]：同 Latch0
    //---------------------------------------------------------------------
    class Latch1_Control_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Latch1_Control_reg)

        function new(string name="Latch1_Control_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Latch1_Control_reg

    //---------------------------------------------------------------------
    // Latch0 Status  (0x09AE, 8-bit, RW)
    //   位域: pin_state[2]：引脚状态；neg_edge_event[1]：负沿事件；pos_edge_event[0]：正沿事件
    //---------------------------------------------------------------------
    class Latch0_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Latch0_Status_reg)

        function new(string name="Latch0_Status_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Latch0_Status_reg

    //---------------------------------------------------------------------
    // Latch1 Status  (0x09AF, 8-bit, RW)
    //   位域: pin_state[2]；neg_edge_event[1]；pos_edge_event[0]：同 Latch0
    //---------------------------------------------------------------------
    class Latch1_Status_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Latch1_Status_reg)

        function new(string name="Latch1_Status_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Latch1_Status_reg

    //---------------------------------------------------------------------
    // Latch0 Positive Edge  (0x09B0, 64-bit, RW)
    //   位域: time[63:0]：Latch0 正沿时间
    //---------------------------------------------------------------------
    class Latch0_Positive_Edge_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Latch0_Positive_Edge_reg)

        function new(string name="Latch0_Positive_Edge_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : Latch0_Positive_Edge_reg

    //---------------------------------------------------------------------
    // Latch0 Negative Edge  (0x09B8, 64-bit, RW)
    //   位域: time[63:0]：Latch0 负沿时间
    //---------------------------------------------------------------------
    class Latch0_Negative_Edge_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Latch0_Negative_Edge_reg)

        function new(string name="Latch0_Negative_Edge_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : Latch0_Negative_Edge_reg

    //---------------------------------------------------------------------
    // Latch1 Positive Edge  (0x09C0, 64-bit, RW)
    //   位域: time[63:0]：Latch1 正沿时间
    //---------------------------------------------------------------------
    class Latch1_Positive_Edge_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Latch1_Positive_Edge_reg)

        function new(string name="Latch1_Positive_Edge_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : Latch1_Positive_Edge_reg

    //---------------------------------------------------------------------
    // Latch1 Negative Edge  (0x09C8, 64-bit, RW)
    //   位域: time[63:0]：Latch1 负沿时间
    //---------------------------------------------------------------------
    class Latch1_Negative_Edge_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Latch1_Negative_Edge_reg)

        function new(string name="Latch1_Negative_Edge_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : Latch1_Negative_Edge_reg

    //---------------------------------------------------------------------
    // EtherCAT Buffer Change Event Time  (0x09F0, 32-bit, RW)
    //   位域: time[31:0]：EtherCAT 缓冲改变事件时间
    //---------------------------------------------------------------------
    class EtherCAT_Buffer_Change_Event_Time_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(EtherCAT_Buffer_Change_Event_Time_reg)

        function new(string name="EtherCAT_Buffer_Change_Event_Time_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : EtherCAT_Buffer_Change_Event_Time_reg

    //---------------------------------------------------------------------
    // PDI Buffer Start Event Time  (0x09F8, 32-bit, RW)
    //   位域: time[31:0]：PDI 缓冲开始事件时间
    //---------------------------------------------------------------------
    class PDI_Buffer_Start_Event_Time_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PDI_Buffer_Start_Event_Time_reg)

        function new(string name="PDI_Buffer_Start_Event_Time_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : PDI_Buffer_Start_Event_Time_reg

    //---------------------------------------------------------------------
    // PDI Buffer Change Event Time  (0x09FC, 32-bit, RW)
    //   位域: time[31:0]：PDI 缓冲改变事件时间
    //---------------------------------------------------------------------
    class PDI_Buffer_Change_Event_Time_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(PDI_Buffer_Change_Event_Time_reg)

        function new(string name="PDI_Buffer_Change_Event_Time_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : PDI_Buffer_Change_Event_Time_reg

    //---------------------------------------------------------------------
    // Power-On Values  (0x0E00, 8-bit, RW)
    //   位域: ET1100：linkpol[14]：PHY 链路极性；phyad_off[13]：PHY 地址偏移（1=+16）；ctrl_status_move[12]：控制/状态信号映射；trans_mode_ena[11]：透明模式 MII；c25_ena[10]：CLK25 输出使能；c25_shi[9:8]：CLK25 移位；clk_mode[7:6]：CPU 时钟输出；p_conf[5:2]：每端口 EBUS(0)/MII(1)；p_mode[1:0]：逻辑端口数（2/3/4）
    //---------------------------------------------------------------------
    class Power_On_Values_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Power_On_Values_reg)

        function new(string name="Power_On_Values_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Power_On_Values_reg

    //---------------------------------------------------------------------
    // Vendor ID（0x0E08:0x0E0F）  (0x0E08, 32-bit, RW)
    //   位域: department[31:24]：部门；company[23:0]：厂商（仅 IP Core）
    //---------------------------------------------------------------------
    class Vendor_ID_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Vendor_ID_reg)

        function new(string name="Vendor_ID_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Vendor_ID_reg

    //---------------------------------------------------------------------
    // Digital I/O Output Data  (0x0F00, 32-bit, RW)
    //   位域: output[31:0]：32 位数字输出（可按位写，用逻辑寻址）
    //---------------------------------------------------------------------
    class Digital_I_O_Output_Data_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Digital_I_O_Output_Data_reg)

        function new(string name="Digital_I_O_Output_Data_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : Digital_I_O_Output_Data_reg

    //---------------------------------------------------------------------
    // General Purpose Outputs  (0x0F10, 16-bit, RW)
    //   位域: gpo[15:0]：通用输出（宽度 1/2/4/8 字节依 PDI）
    //---------------------------------------------------------------------
    class General_Purpose_Outputs_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(General_Purpose_Outputs_reg)

        function new(string name="General_Purpose_Outputs_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : General_Purpose_Outputs_reg

    //---------------------------------------------------------------------
    // General Purpose Inputs  (0x0F18, 16-bit, RW)
    //   位域: gpi[15:0]：通用输入
    //---------------------------------------------------------------------
    class General_Purpose_Inputs_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(General_Purpose_Inputs_reg)

        function new(string name="General_Purpose_Inputs_reg");
            super.new(name, 16, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 1);
        endfunction

    endclass : General_Purpose_Inputs_reg

    //---------------------------------------------------------------------
    // User RAM  (0x0F80, 64-bit, RW)
    //   位域: ram[127:0]：用户 RAM（128 字节）
    //---------------------------------------------------------------------
    class User_RAM_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(User_RAM_reg)

        function new(string name="User_RAM_reg");
            super.new(name, 64, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 64, 0, "RW", 0, 64'h0, 1, 1, 1);
        endfunction

    endclass : User_RAM_reg

    //---------------------------------------------------------------------
    // Process Data RAM  (0x1000, 8-bit, RW)
    //   位域: ram[7:0]（×8KB）：过程数据 RAM（ET1100=8KB；仅在 EEPROM 正确加载后 0x0110[0]=1 可访问）
    //---------------------------------------------------------------------
    class Process_Data_RAM_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(Process_Data_RAM_reg)

        function new(string name="Process_Data_RAM_reg");
            super.new(name, 8, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 8, 0, "RW", 0, 8'h0, 1, 1, 1);
        endfunction

    endclass : Process_Data_RAM_reg

    rand Type_reg Type;
    rand Revision_reg Revision;
    rand Build_reg Build;
    rand FMMUs_supported_reg FMMUs_supported;
    rand SyncManagers_supported_reg SyncManagers_supported;
    rand RAM_Size_reg RAM_Size;
    rand Port_Descriptor_reg Port_Descriptor;
    rand ESC_Features_supported_reg ESC_Features_supported;
    rand Configured_Station_Address_reg Configured_Station_Address;
    rand Configured_Station_Alias_reg Configured_Station_Alias;
    rand Write_Register_Enable_reg Write_Register_Enable;
    rand Write_Register_Protection_reg Write_Register_Protection;
    rand ESC_Write_Enable_reg ESC_Write_Enable;
    rand ESC_Write_Protection_reg ESC_Write_Protection;
    rand ESC_Reset_ECAT_reg ESC_Reset_ECAT;
    rand ESC_Reset_PDI_reg ESC_Reset_PDI;
    rand ESC_DL_Control_reg ESC_DL_Control;
    rand Extended_ESC_DL_Control_reg Extended_ESC_DL_Control;
    rand Physical_Read_Write_Offset_reg Physical_Read_Write_Offset;
    rand ESC_DL_Status_reg ESC_DL_Status;
    rand AL_Control_reg AL_Control;
    rand AL_Status_reg AL_Status;
    rand AL_Status_Code_reg AL_Status_Code;
    rand RUN_LED_Override_reg RUN_LED_Override;
    rand ERR_LED_Override_reg ERR_LED_Override;
    rand PDI_Control_reg PDI_Control;
    rand ESC_Configuration_reg ESC_Configuration;
    rand PDI_Information_reg PDI_Information;
    rand PDI_Configuration_reg PDI_Configuration;
    rand DC_Sync_Latch_Configuration_reg DC_Sync_Latch_Configuration;
    rand Extended_PDI_Configuration_reg Extended_PDI_Configuration;
    rand ECAT_Event_Mask_reg ECAT_Event_Mask;
    rand PDI_AL_Event_Mask_reg PDI_AL_Event_Mask;
    rand ECAT_Event_Request_reg ECAT_Event_Request;
    rand AL_Event_Request_reg AL_Event_Request;
    rand RX_Error_Counter_Port_0_reg RX_Error_Counter_Port_0;
    rand RX_Error_Counter_Port_1_reg RX_Error_Counter_Port_1;
    rand RX_Error_Counter_Port_2_reg RX_Error_Counter_Port_2;
    rand RX_Error_Counter_Port_3_reg RX_Error_Counter_Port_3;
    rand Forwarded_RX_Error_Port_0_reg Forwarded_RX_Error_Port_0;
    rand Forwarded_RX_Error_Port_1_reg Forwarded_RX_Error_Port_1;
    rand ECAT_Processing_Unit_Error_Counter_reg ECAT_Processing_Unit_Error_Counter;
    rand PDI_Error_Counter_reg PDI_Error_Counter;
    rand PDI_Error_Code_reg PDI_Error_Code;
    rand Lost_Link_Counter_Port_0_reg Lost_Link_Counter_Port_0;
    rand Lost_Link_Counter_Port_1_reg Lost_Link_Counter_Port_1;
    rand Watchdog_Divider_reg Watchdog_Divider;
    rand Watchdog_Time_PDI_reg Watchdog_Time_PDI;
    rand Watchdog_Time_Process_Data_reg Watchdog_Time_Process_Data;
    rand Watchdog_Status_Process_Data_reg Watchdog_Status_Process_Data;
    rand Watchdog_Counter_Process_Data_reg Watchdog_Counter_Process_Data;
    rand Watchdog_Counter_PDI_reg Watchdog_Counter_PDI;
    rand EEPROM_Configuration_reg EEPROM_Configuration;
    rand EEPROM_PDI_Access_State_reg EEPROM_PDI_Access_State;
    rand EEPROM_Control_Status_reg EEPROM_Control_Status;
    rand EEPROM_Address_reg EEPROM_Address;
    rand EEPROM_Data_reg EEPROM_Data;
    rand MII_Management_Control_Status_reg MII_Management_Control_Status;
    rand MII_PHY_Address_reg MII_PHY_Address;
    rand MII_PHY_Register_Address_reg MII_PHY_Register_Address;
    rand MII_PHY_Data_reg MII_PHY_Data;
    rand MII_ECAT_Access_State_reg MII_ECAT_Access_State;
    rand MII_PDI_Access_State_reg MII_PDI_Access_State;
    rand PHY_Port_Status_reg PHY_Port_Status;
    rand FMMU_reg FMMU;
    rand SyncManager_reg SyncManager;
    rand Receive_Time_Port_0_reg Receive_Time_Port_0;
    rand Receive_Time_Port_1_reg Receive_Time_Port_1;
    rand Receive_Time_Port_2_reg Receive_Time_Port_2;
    rand Receive_Time_Port_3_reg Receive_Time_Port_3;
    rand System_Time_reg System_Time;
    rand Receive_Time_EPU_reg Receive_Time_EPU;
    rand System_Time_Offset_reg System_Time_Offset;
    rand System_Time_Delay_reg System_Time_Delay;
    rand System_Time_Difference_reg System_Time_Difference;
    rand Speed_Counter_Start_reg Speed_Counter_Start;
    rand Speed_Counter_Diff_reg Speed_Counter_Diff;
    rand System_Time_Difference_Filter_Depth_reg System_Time_Difference_Filter_Depth;
    rand Speed_Counter_Filter_Depth_reg Speed_Counter_Filter_Depth;
    rand Receive_Time_Latch_Mode_reg Receive_Time_Latch_Mode;
    rand Cyclic_Unit_Control_reg Cyclic_Unit_Control;
    rand DC_Activation_reg DC_Activation;
    rand Pulse_Length_of_SyncSignals_reg Pulse_Length_of_SyncSignals;
    rand DC_Activation_Status_reg DC_Activation_Status;
    rand SYNC0_Status_reg SYNC0_Status;
    rand SYNC1_Status_reg SYNC1_Status;
    rand Start_Time_Cyclic_Operation_Next_SYNC0_Pulse_reg Start_Time_Cyclic_Operation_Next_SYNC0_Pulse;
    rand Next_SYNC1_Pulse_reg Next_SYNC1_Pulse;
    rand SYNC0_Cycle_Time_reg SYNC0_Cycle_Time;
    rand SYNC1_Cycle_Time_reg SYNC1_Cycle_Time;
    rand Latch0_Control_reg Latch0_Control;
    rand Latch1_Control_reg Latch1_Control;
    rand Latch0_Status_reg Latch0_Status;
    rand Latch1_Status_reg Latch1_Status;
    rand Latch0_Positive_Edge_reg Latch0_Positive_Edge;
    rand Latch0_Negative_Edge_reg Latch0_Negative_Edge;
    rand Latch1_Positive_Edge_reg Latch1_Positive_Edge;
    rand Latch1_Negative_Edge_reg Latch1_Negative_Edge;
    rand EtherCAT_Buffer_Change_Event_Time_reg EtherCAT_Buffer_Change_Event_Time;
    rand PDI_Buffer_Start_Event_Time_reg PDI_Buffer_Start_Event_Time;
    rand PDI_Buffer_Change_Event_Time_reg PDI_Buffer_Change_Event_Time;
    rand Power_On_Values_reg Power_On_Values;
    rand Vendor_ID_reg Vendor_ID;
    rand Digital_I_O_Output_Data_reg Digital_I_O_Output_Data;
    rand General_Purpose_Outputs_reg General_Purpose_Outputs;
    rand General_Purpose_Inputs_reg General_Purpose_Inputs;
    rand User_RAM_reg User_RAM;
    rand Process_Data_RAM_reg Process_Data_RAM;

    `uvm_object_utils(esc_reg_block)

    function new(string name="esc_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        Type = Type_reg::type_id::create("Type");
        Type.configure(this, null, "");
        Type.build();
        default_map.add_reg(Type, 'h0, "RO");
        Type.add_hdl_path_slice("Type", 0, 8, 0);

        Revision = Revision_reg::type_id::create("Revision");
        Revision.configure(this, null, "");
        Revision.build();
        default_map.add_reg(Revision, 'h1, "RO");
        Revision.add_hdl_path_slice("Revision", 0, 8, 0);

        Build = Build_reg::type_id::create("Build");
        Build.configure(this, null, "");
        Build.build();
        default_map.add_reg(Build, 'h2, "RO");
        Build.add_hdl_path_slice("Build", 0, 16, 0);

        FMMUs_supported = FMMUs_supported_reg::type_id::create("FMMUs_supported");
        FMMUs_supported.configure(this, null, "");
        FMMUs_supported.build();
        default_map.add_reg(FMMUs_supported, 'h4, "RO");
        FMMUs_supported.add_hdl_path_slice("FMMUs_supported", 0, 8, 0);

        SyncManagers_supported = SyncManagers_supported_reg::type_id::create("SyncManagers_supported");
        SyncManagers_supported.configure(this, null, "");
        SyncManagers_supported.build();
        default_map.add_reg(SyncManagers_supported, 'h5, "RO");
        SyncManagers_supported.add_hdl_path_slice("SyncManagers_supported", 0, 8, 0);

        RAM_Size = RAM_Size_reg::type_id::create("RAM_Size");
        RAM_Size.configure(this, null, "");
        RAM_Size.build();
        default_map.add_reg(RAM_Size, 'h6, "RO");
        RAM_Size.add_hdl_path_slice("RAM_Size", 0, 8, 0);

        Port_Descriptor = Port_Descriptor_reg::type_id::create("Port_Descriptor");
        Port_Descriptor.configure(this, null, "");
        Port_Descriptor.build();
        default_map.add_reg(Port_Descriptor, 'h7, "RO");
        Port_Descriptor.add_hdl_path_slice("Port_Descriptor", 0, 8, 0);

        ESC_Features_supported = ESC_Features_supported_reg::type_id::create("ESC_Features_supported");
        ESC_Features_supported.configure(this, null, "");
        ESC_Features_supported.build();
        default_map.add_reg(ESC_Features_supported, 'h8, "RO");
        ESC_Features_supported.add_hdl_path_slice("ESC_Features_supported", 0, 16, 0);

        Configured_Station_Address = Configured_Station_Address_reg::type_id::create("Configured_Station_Address");
        Configured_Station_Address.configure(this, null, "");
        Configured_Station_Address.build();
        default_map.add_reg(Configured_Station_Address, 'h10, "RW");
        Configured_Station_Address.add_hdl_path_slice("Configured_Station_Address", 0, 16, 0);

        Configured_Station_Alias = Configured_Station_Alias_reg::type_id::create("Configured_Station_Alias");
        Configured_Station_Alias.configure(this, null, "");
        Configured_Station_Alias.build();
        default_map.add_reg(Configured_Station_Alias, 'h12, "RW");
        Configured_Station_Alias.add_hdl_path_slice("Configured_Station_Alias", 0, 16, 0);

        Write_Register_Enable = Write_Register_Enable_reg::type_id::create("Write_Register_Enable");
        Write_Register_Enable.configure(this, null, "");
        Write_Register_Enable.build();
        default_map.add_reg(Write_Register_Enable, 'h20, "RW");
        Write_Register_Enable.add_hdl_path_slice("Write_Register_Enable", 0, 8, 0);

        Write_Register_Protection = Write_Register_Protection_reg::type_id::create("Write_Register_Protection");
        Write_Register_Protection.configure(this, null, "");
        Write_Register_Protection.build();
        default_map.add_reg(Write_Register_Protection, 'h21, "RW");
        Write_Register_Protection.add_hdl_path_slice("Write_Register_Protection", 0, 8, 0);

        ESC_Write_Enable = ESC_Write_Enable_reg::type_id::create("ESC_Write_Enable");
        ESC_Write_Enable.configure(this, null, "");
        ESC_Write_Enable.build();
        default_map.add_reg(ESC_Write_Enable, 'h30, "RW");
        ESC_Write_Enable.add_hdl_path_slice("ESC_Write_Enable", 0, 8, 0);

        ESC_Write_Protection = ESC_Write_Protection_reg::type_id::create("ESC_Write_Protection");
        ESC_Write_Protection.configure(this, null, "");
        ESC_Write_Protection.build();
        default_map.add_reg(ESC_Write_Protection, 'h31, "RW");
        ESC_Write_Protection.add_hdl_path_slice("ESC_Write_Protection", 0, 8, 0);

        ESC_Reset_ECAT = ESC_Reset_ECAT_reg::type_id::create("ESC_Reset_ECAT");
        ESC_Reset_ECAT.configure(this, null, "");
        ESC_Reset_ECAT.build();
        default_map.add_reg(ESC_Reset_ECAT, 'h40, "RW");
        ESC_Reset_ECAT.add_hdl_path_slice("ESC_Reset_ECAT", 0, 8, 0);

        ESC_Reset_PDI = ESC_Reset_PDI_reg::type_id::create("ESC_Reset_PDI");
        ESC_Reset_PDI.configure(this, null, "");
        ESC_Reset_PDI.build();
        default_map.add_reg(ESC_Reset_PDI, 'h41, "RW");
        ESC_Reset_PDI.add_hdl_path_slice("ESC_Reset_PDI", 0, 8, 0);

        ESC_DL_Control = ESC_DL_Control_reg::type_id::create("ESC_DL_Control");
        ESC_DL_Control.configure(this, null, "");
        ESC_DL_Control.build();
        default_map.add_reg(ESC_DL_Control, 'h100, "RW");
        ESC_DL_Control.add_hdl_path_slice("ESC_DL_Control", 0, 32, 0);

        Extended_ESC_DL_Control = Extended_ESC_DL_Control_reg::type_id::create("Extended_ESC_DL_Control");
        Extended_ESC_DL_Control.configure(this, null, "");
        Extended_ESC_DL_Control.build();
        default_map.add_reg(Extended_ESC_DL_Control, 'h102, "RW");
        Extended_ESC_DL_Control.add_hdl_path_slice("Extended_ESC_DL_Control", 0, 8, 0);

        Physical_Read_Write_Offset = Physical_Read_Write_Offset_reg::type_id::create("Physical_Read_Write_Offset");
        Physical_Read_Write_Offset.configure(this, null, "");
        Physical_Read_Write_Offset.build();
        default_map.add_reg(Physical_Read_Write_Offset, 'h108, "RW");
        Physical_Read_Write_Offset.add_hdl_path_slice("Physical_Read_Write_Offset", 0, 16, 0);

        ESC_DL_Status = ESC_DL_Status_reg::type_id::create("ESC_DL_Status");
        ESC_DL_Status.configure(this, null, "");
        ESC_DL_Status.build();
        default_map.add_reg(ESC_DL_Status, 'h110, "RW");
        ESC_DL_Status.add_hdl_path_slice("ESC_DL_Status", 0, 16, 0);

        AL_Control = AL_Control_reg::type_id::create("AL_Control");
        AL_Control.configure(this, null, "");
        AL_Control.build();
        default_map.add_reg(AL_Control, 'h120, "RW");
        AL_Control.add_hdl_path_slice("AL_Control", 0, 8, 0);

        AL_Status = AL_Status_reg::type_id::create("AL_Status");
        AL_Status.configure(this, null, "");
        AL_Status.build();
        default_map.add_reg(AL_Status, 'h130, "RW");
        AL_Status.add_hdl_path_slice("AL_Status", 0, 8, 0);

        AL_Status_Code = AL_Status_Code_reg::type_id::create("AL_Status_Code");
        AL_Status_Code.configure(this, null, "");
        AL_Status_Code.build();
        default_map.add_reg(AL_Status_Code, 'h134, "RW");
        AL_Status_Code.add_hdl_path_slice("AL_Status_Code", 0, 16, 0);

        RUN_LED_Override = RUN_LED_Override_reg::type_id::create("RUN_LED_Override");
        RUN_LED_Override.configure(this, null, "");
        RUN_LED_Override.build();
        default_map.add_reg(RUN_LED_Override, 'h138, "RW");
        RUN_LED_Override.add_hdl_path_slice("RUN_LED_Override", 0, 8, 0);

        ERR_LED_Override = ERR_LED_Override_reg::type_id::create("ERR_LED_Override");
        ERR_LED_Override.configure(this, null, "");
        ERR_LED_Override.build();
        default_map.add_reg(ERR_LED_Override, 'h139, "RW");
        ERR_LED_Override.add_hdl_path_slice("ERR_LED_Override", 0, 8, 0);

        PDI_Control = PDI_Control_reg::type_id::create("PDI_Control");
        PDI_Control.configure(this, null, "");
        PDI_Control.build();
        default_map.add_reg(PDI_Control, 'h140, "RW");
        PDI_Control.add_hdl_path_slice("PDI_Control", 0, 8, 0);

        ESC_Configuration = ESC_Configuration_reg::type_id::create("ESC_Configuration");
        ESC_Configuration.configure(this, null, "");
        ESC_Configuration.build();
        default_map.add_reg(ESC_Configuration, 'h141, "RW");
        ESC_Configuration.add_hdl_path_slice("ESC_Configuration", 0, 8, 0);

        PDI_Information = PDI_Information_reg::type_id::create("PDI_Information");
        PDI_Information.configure(this, null, "");
        PDI_Information.build();
        default_map.add_reg(PDI_Information, 'h14E, "RW");
        PDI_Information.add_hdl_path_slice("PDI_Information", 0, 8, 0);

        PDI_Configuration = PDI_Configuration_reg::type_id::create("PDI_Configuration");
        PDI_Configuration.configure(this, null, "");
        PDI_Configuration.build();
        default_map.add_reg(PDI_Configuration, 'h150, "RW");
        PDI_Configuration.add_hdl_path_slice("PDI_Configuration", 0, 8, 0);

        DC_Sync_Latch_Configuration = DC_Sync_Latch_Configuration_reg::type_id::create("DC_Sync_Latch_Configuration");
        DC_Sync_Latch_Configuration.configure(this, null, "");
        DC_Sync_Latch_Configuration.build();
        default_map.add_reg(DC_Sync_Latch_Configuration, 'h151, "RW");
        DC_Sync_Latch_Configuration.add_hdl_path_slice("DC_Sync_Latch_Configuration", 0, 8, 0);

        Extended_PDI_Configuration = Extended_PDI_Configuration_reg::type_id::create("Extended_PDI_Configuration");
        Extended_PDI_Configuration.configure(this, null, "");
        Extended_PDI_Configuration.build();
        default_map.add_reg(Extended_PDI_Configuration, 'h152, "RW");
        Extended_PDI_Configuration.add_hdl_path_slice("Extended_PDI_Configuration", 0, 8, 0);

        ECAT_Event_Mask = ECAT_Event_Mask_reg::type_id::create("ECAT_Event_Mask");
        ECAT_Event_Mask.configure(this, null, "");
        ECAT_Event_Mask.build();
        default_map.add_reg(ECAT_Event_Mask, 'h200, "RW");
        ECAT_Event_Mask.add_hdl_path_slice("ECAT_Event_Mask", 0, 16, 0);

        PDI_AL_Event_Mask = PDI_AL_Event_Mask_reg::type_id::create("PDI_AL_Event_Mask");
        PDI_AL_Event_Mask.configure(this, null, "");
        PDI_AL_Event_Mask.build();
        default_map.add_reg(PDI_AL_Event_Mask, 'h204, "RW");
        PDI_AL_Event_Mask.add_hdl_path_slice("PDI_AL_Event_Mask", 0, 16, 0);

        ECAT_Event_Request = ECAT_Event_Request_reg::type_id::create("ECAT_Event_Request");
        ECAT_Event_Request.configure(this, null, "");
        ECAT_Event_Request.build();
        default_map.add_reg(ECAT_Event_Request, 'h210, "RW");
        ECAT_Event_Request.add_hdl_path_slice("ECAT_Event_Request", 0, 16, 0);

        AL_Event_Request = AL_Event_Request_reg::type_id::create("AL_Event_Request");
        AL_Event_Request.configure(this, null, "");
        AL_Event_Request.build();
        default_map.add_reg(AL_Event_Request, 'h220, "RW");
        AL_Event_Request.add_hdl_path_slice("AL_Event_Request", 0, 32, 0);

        RX_Error_Counter_Port_0 = RX_Error_Counter_Port_0_reg::type_id::create("RX_Error_Counter_Port_0");
        RX_Error_Counter_Port_0.configure(this, null, "");
        RX_Error_Counter_Port_0.build();
        default_map.add_reg(RX_Error_Counter_Port_0, 'h300, "RW");
        RX_Error_Counter_Port_0.add_hdl_path_slice("RX_Error_Counter_Port_0", 0, 16, 0);

        RX_Error_Counter_Port_1 = RX_Error_Counter_Port_1_reg::type_id::create("RX_Error_Counter_Port_1");
        RX_Error_Counter_Port_1.configure(this, null, "");
        RX_Error_Counter_Port_1.build();
        default_map.add_reg(RX_Error_Counter_Port_1, 'h302, "RW");
        RX_Error_Counter_Port_1.add_hdl_path_slice("RX_Error_Counter_Port_1", 0, 16, 0);

        RX_Error_Counter_Port_2 = RX_Error_Counter_Port_2_reg::type_id::create("RX_Error_Counter_Port_2");
        RX_Error_Counter_Port_2.configure(this, null, "");
        RX_Error_Counter_Port_2.build();
        default_map.add_reg(RX_Error_Counter_Port_2, 'h304, "RW");
        RX_Error_Counter_Port_2.add_hdl_path_slice("RX_Error_Counter_Port_2", 0, 16, 0);

        RX_Error_Counter_Port_3 = RX_Error_Counter_Port_3_reg::type_id::create("RX_Error_Counter_Port_3");
        RX_Error_Counter_Port_3.configure(this, null, "");
        RX_Error_Counter_Port_3.build();
        default_map.add_reg(RX_Error_Counter_Port_3, 'h306, "RW");
        RX_Error_Counter_Port_3.add_hdl_path_slice("RX_Error_Counter_Port_3", 0, 16, 0);

        Forwarded_RX_Error_Port_0 = Forwarded_RX_Error_Port_0_reg::type_id::create("Forwarded_RX_Error_Port_0");
        Forwarded_RX_Error_Port_0.configure(this, null, "");
        Forwarded_RX_Error_Port_0.build();
        default_map.add_reg(Forwarded_RX_Error_Port_0, 'h308, "RW");
        Forwarded_RX_Error_Port_0.add_hdl_path_slice("Forwarded_RX_Error_Port_0", 0, 8, 0);

        Forwarded_RX_Error_Port_1 = Forwarded_RX_Error_Port_1_reg::type_id::create("Forwarded_RX_Error_Port_1");
        Forwarded_RX_Error_Port_1.configure(this, null, "");
        Forwarded_RX_Error_Port_1.build();
        default_map.add_reg(Forwarded_RX_Error_Port_1, 'h30A, "RW");
        Forwarded_RX_Error_Port_1.add_hdl_path_slice("Forwarded_RX_Error_Port_1", 0, 8, 0);

        ECAT_Processing_Unit_Error_Counter = ECAT_Processing_Unit_Error_Counter_reg::type_id::create("ECAT_Processing_Unit_Error_Counter");
        ECAT_Processing_Unit_Error_Counter.configure(this, null, "");
        ECAT_Processing_Unit_Error_Counter.build();
        default_map.add_reg(ECAT_Processing_Unit_Error_Counter, 'h30C, "RW");
        ECAT_Processing_Unit_Error_Counter.add_hdl_path_slice("ECAT_Processing_Unit_Error_Counter", 0, 8, 0);

        PDI_Error_Counter = PDI_Error_Counter_reg::type_id::create("PDI_Error_Counter");
        PDI_Error_Counter.configure(this, null, "");
        PDI_Error_Counter.build();
        default_map.add_reg(PDI_Error_Counter, 'h30D, "RW");
        PDI_Error_Counter.add_hdl_path_slice("PDI_Error_Counter", 0, 8, 0);

        PDI_Error_Code = PDI_Error_Code_reg::type_id::create("PDI_Error_Code");
        PDI_Error_Code.configure(this, null, "");
        PDI_Error_Code.build();
        default_map.add_reg(PDI_Error_Code, 'h30E, "RW");
        PDI_Error_Code.add_hdl_path_slice("PDI_Error_Code", 0, 8, 0);

        Lost_Link_Counter_Port_0 = Lost_Link_Counter_Port_0_reg::type_id::create("Lost_Link_Counter_Port_0");
        Lost_Link_Counter_Port_0.configure(this, null, "");
        Lost_Link_Counter_Port_0.build();
        default_map.add_reg(Lost_Link_Counter_Port_0, 'h310, "RW");
        Lost_Link_Counter_Port_0.add_hdl_path_slice("Lost_Link_Counter_Port_0", 0, 8, 0);

        Lost_Link_Counter_Port_1 = Lost_Link_Counter_Port_1_reg::type_id::create("Lost_Link_Counter_Port_1");
        Lost_Link_Counter_Port_1.configure(this, null, "");
        Lost_Link_Counter_Port_1.build();
        default_map.add_reg(Lost_Link_Counter_Port_1, 'h312, "RW");
        Lost_Link_Counter_Port_1.add_hdl_path_slice("Lost_Link_Counter_Port_1", 0, 8, 0);

        Watchdog_Divider = Watchdog_Divider_reg::type_id::create("Watchdog_Divider");
        Watchdog_Divider.configure(this, null, "");
        Watchdog_Divider.build();
        default_map.add_reg(Watchdog_Divider, 'h400, "RW");
        Watchdog_Divider.add_hdl_path_slice("Watchdog_Divider", 0, 16, 0);

        Watchdog_Time_PDI = Watchdog_Time_PDI_reg::type_id::create("Watchdog_Time_PDI");
        Watchdog_Time_PDI.configure(this, null, "");
        Watchdog_Time_PDI.build();
        default_map.add_reg(Watchdog_Time_PDI, 'h410, "RW");
        Watchdog_Time_PDI.add_hdl_path_slice("Watchdog_Time_PDI", 0, 16, 0);

        Watchdog_Time_Process_Data = Watchdog_Time_Process_Data_reg::type_id::create("Watchdog_Time_Process_Data");
        Watchdog_Time_Process_Data.configure(this, null, "");
        Watchdog_Time_Process_Data.build();
        default_map.add_reg(Watchdog_Time_Process_Data, 'h420, "RW");
        Watchdog_Time_Process_Data.add_hdl_path_slice("Watchdog_Time_Process_Data", 0, 16, 0);

        Watchdog_Status_Process_Data = Watchdog_Status_Process_Data_reg::type_id::create("Watchdog_Status_Process_Data");
        Watchdog_Status_Process_Data.configure(this, null, "");
        Watchdog_Status_Process_Data.build();
        default_map.add_reg(Watchdog_Status_Process_Data, 'h440, "RW");
        Watchdog_Status_Process_Data.add_hdl_path_slice("Watchdog_Status_Process_Data", 0, 8, 0);

        Watchdog_Counter_Process_Data = Watchdog_Counter_Process_Data_reg::type_id::create("Watchdog_Counter_Process_Data");
        Watchdog_Counter_Process_Data.configure(this, null, "");
        Watchdog_Counter_Process_Data.build();
        default_map.add_reg(Watchdog_Counter_Process_Data, 'h442, "RW");
        Watchdog_Counter_Process_Data.add_hdl_path_slice("Watchdog_Counter_Process_Data", 0, 8, 0);

        Watchdog_Counter_PDI = Watchdog_Counter_PDI_reg::type_id::create("Watchdog_Counter_PDI");
        Watchdog_Counter_PDI.configure(this, null, "");
        Watchdog_Counter_PDI.build();
        default_map.add_reg(Watchdog_Counter_PDI, 'h443, "RW");
        Watchdog_Counter_PDI.add_hdl_path_slice("Watchdog_Counter_PDI", 0, 8, 0);

        EEPROM_Configuration = EEPROM_Configuration_reg::type_id::create("EEPROM_Configuration");
        EEPROM_Configuration.configure(this, null, "");
        EEPROM_Configuration.build();
        default_map.add_reg(EEPROM_Configuration, 'h500, "RW");
        EEPROM_Configuration.add_hdl_path_slice("EEPROM_Configuration", 0, 8, 0);

        EEPROM_PDI_Access_State = EEPROM_PDI_Access_State_reg::type_id::create("EEPROM_PDI_Access_State");
        EEPROM_PDI_Access_State.configure(this, null, "");
        EEPROM_PDI_Access_State.build();
        default_map.add_reg(EEPROM_PDI_Access_State, 'h501, "RW");
        EEPROM_PDI_Access_State.add_hdl_path_slice("EEPROM_PDI_Access_State", 0, 8, 0);

        EEPROM_Control_Status = EEPROM_Control_Status_reg::type_id::create("EEPROM_Control_Status");
        EEPROM_Control_Status.configure(this, null, "");
        EEPROM_Control_Status.build();
        default_map.add_reg(EEPROM_Control_Status, 'h502, "RW");
        EEPROM_Control_Status.add_hdl_path_slice("EEPROM_Control_Status", 0, 16, 0);

        EEPROM_Address = EEPROM_Address_reg::type_id::create("EEPROM_Address");
        EEPROM_Address.configure(this, null, "");
        EEPROM_Address.build();
        default_map.add_reg(EEPROM_Address, 'h504, "RW");
        EEPROM_Address.add_hdl_path_slice("EEPROM_Address", 0, 32, 0);

        EEPROM_Data = EEPROM_Data_reg::type_id::create("EEPROM_Data");
        EEPROM_Data.configure(this, null, "");
        EEPROM_Data.build();
        default_map.add_reg(EEPROM_Data, 'h508, "RW");
        EEPROM_Data.add_hdl_path_slice("EEPROM_Data", 0, 64, 0);

        MII_Management_Control_Status = MII_Management_Control_Status_reg::type_id::create("MII_Management_Control_Status");
        MII_Management_Control_Status.configure(this, null, "");
        MII_Management_Control_Status.build();
        default_map.add_reg(MII_Management_Control_Status, 'h510, "RW");
        MII_Management_Control_Status.add_hdl_path_slice("MII_Management_Control_Status", 0, 16, 0);

        MII_PHY_Address = MII_PHY_Address_reg::type_id::create("MII_PHY_Address");
        MII_PHY_Address.configure(this, null, "");
        MII_PHY_Address.build();
        default_map.add_reg(MII_PHY_Address, 'h512, "RW");
        MII_PHY_Address.add_hdl_path_slice("MII_PHY_Address", 0, 8, 0);

        MII_PHY_Register_Address = MII_PHY_Register_Address_reg::type_id::create("MII_PHY_Register_Address");
        MII_PHY_Register_Address.configure(this, null, "");
        MII_PHY_Register_Address.build();
        default_map.add_reg(MII_PHY_Register_Address, 'h513, "RW");
        MII_PHY_Register_Address.add_hdl_path_slice("MII_PHY_Register_Address", 0, 8, 0);

        MII_PHY_Data = MII_PHY_Data_reg::type_id::create("MII_PHY_Data");
        MII_PHY_Data.configure(this, null, "");
        MII_PHY_Data.build();
        default_map.add_reg(MII_PHY_Data, 'h514, "RW");
        MII_PHY_Data.add_hdl_path_slice("MII_PHY_Data", 0, 16, 0);

        MII_ECAT_Access_State = MII_ECAT_Access_State_reg::type_id::create("MII_ECAT_Access_State");
        MII_ECAT_Access_State.configure(this, null, "");
        MII_ECAT_Access_State.build();
        default_map.add_reg(MII_ECAT_Access_State, 'h516, "RW");
        MII_ECAT_Access_State.add_hdl_path_slice("MII_ECAT_Access_State", 0, 8, 0);

        MII_PDI_Access_State = MII_PDI_Access_State_reg::type_id::create("MII_PDI_Access_State");
        MII_PDI_Access_State.configure(this, null, "");
        MII_PDI_Access_State.build();
        default_map.add_reg(MII_PDI_Access_State, 'h517, "RW");
        MII_PDI_Access_State.add_hdl_path_slice("MII_PDI_Access_State", 0, 8, 0);

        PHY_Port_Status = PHY_Port_Status_reg::type_id::create("PHY_Port_Status");
        PHY_Port_Status.configure(this, null, "");
        PHY_Port_Status.build();
        default_map.add_reg(PHY_Port_Status, 'h518, "RW");
        PHY_Port_Status.add_hdl_path_slice("PHY_Port_Status", 0, 8, 0);

        FMMU = FMMU_reg::type_id::create("FMMU");
        FMMU.configure(this, null, "");
        FMMU.build();
        default_map.add_reg(FMMU, 'h600, "RW");
        FMMU.add_hdl_path_slice("FMMU", 0, 8, 0);

        SyncManager = SyncManager_reg::type_id::create("SyncManager");
        SyncManager.configure(this, null, "");
        SyncManager.build();
        default_map.add_reg(SyncManager, 'h800, "RW");
        SyncManager.add_hdl_path_slice("SyncManager", 0, 8, 0);

        Receive_Time_Port_0 = Receive_Time_Port_0_reg::type_id::create("Receive_Time_Port_0");
        Receive_Time_Port_0.configure(this, null, "");
        Receive_Time_Port_0.build();
        default_map.add_reg(Receive_Time_Port_0, 'h900, "RW");
        Receive_Time_Port_0.add_hdl_path_slice("Receive_Time_Port_0", 0, 32, 0);

        Receive_Time_Port_1 = Receive_Time_Port_1_reg::type_id::create("Receive_Time_Port_1");
        Receive_Time_Port_1.configure(this, null, "");
        Receive_Time_Port_1.build();
        default_map.add_reg(Receive_Time_Port_1, 'h904, "RW");
        Receive_Time_Port_1.add_hdl_path_slice("Receive_Time_Port_1", 0, 32, 0);

        Receive_Time_Port_2 = Receive_Time_Port_2_reg::type_id::create("Receive_Time_Port_2");
        Receive_Time_Port_2.configure(this, null, "");
        Receive_Time_Port_2.build();
        default_map.add_reg(Receive_Time_Port_2, 'h908, "RW");
        Receive_Time_Port_2.add_hdl_path_slice("Receive_Time_Port_2", 0, 32, 0);

        Receive_Time_Port_3 = Receive_Time_Port_3_reg::type_id::create("Receive_Time_Port_3");
        Receive_Time_Port_3.configure(this, null, "");
        Receive_Time_Port_3.build();
        default_map.add_reg(Receive_Time_Port_3, 'h90C, "RW");
        Receive_Time_Port_3.add_hdl_path_slice("Receive_Time_Port_3", 0, 32, 0);

        System_Time = System_Time_reg::type_id::create("System_Time");
        System_Time.configure(this, null, "");
        System_Time.build();
        default_map.add_reg(System_Time, 'h910, "RW");
        System_Time.add_hdl_path_slice("System_Time", 0, 64, 0);

        Receive_Time_EPU = Receive_Time_EPU_reg::type_id::create("Receive_Time_EPU");
        Receive_Time_EPU.configure(this, null, "");
        Receive_Time_EPU.build();
        default_map.add_reg(Receive_Time_EPU, 'h918, "RW");
        Receive_Time_EPU.add_hdl_path_slice("Receive_Time_EPU", 0, 64, 0);

        System_Time_Offset = System_Time_Offset_reg::type_id::create("System_Time_Offset");
        System_Time_Offset.configure(this, null, "");
        System_Time_Offset.build();
        default_map.add_reg(System_Time_Offset, 'h920, "RW");
        System_Time_Offset.add_hdl_path_slice("System_Time_Offset", 0, 64, 0);

        System_Time_Delay = System_Time_Delay_reg::type_id::create("System_Time_Delay");
        System_Time_Delay.configure(this, null, "");
        System_Time_Delay.build();
        default_map.add_reg(System_Time_Delay, 'h928, "RW");
        System_Time_Delay.add_hdl_path_slice("System_Time_Delay", 0, 32, 0);

        System_Time_Difference = System_Time_Difference_reg::type_id::create("System_Time_Difference");
        System_Time_Difference.configure(this, null, "");
        System_Time_Difference.build();
        default_map.add_reg(System_Time_Difference, 'h92C, "RW");
        System_Time_Difference.add_hdl_path_slice("System_Time_Difference", 0, 32, 0);

        Speed_Counter_Start = Speed_Counter_Start_reg::type_id::create("Speed_Counter_Start");
        Speed_Counter_Start.configure(this, null, "");
        Speed_Counter_Start.build();
        default_map.add_reg(Speed_Counter_Start, 'h930, "RW");
        Speed_Counter_Start.add_hdl_path_slice("Speed_Counter_Start", 0, 16, 0);

        Speed_Counter_Diff = Speed_Counter_Diff_reg::type_id::create("Speed_Counter_Diff");
        Speed_Counter_Diff.configure(this, null, "");
        Speed_Counter_Diff.build();
        default_map.add_reg(Speed_Counter_Diff, 'h932, "RW");
        Speed_Counter_Diff.add_hdl_path_slice("Speed_Counter_Diff", 0, 16, 0);

        System_Time_Difference_Filter_Depth = System_Time_Difference_Filter_Depth_reg::type_id::create("System_Time_Difference_Filter_Depth");
        System_Time_Difference_Filter_Depth.configure(this, null, "");
        System_Time_Difference_Filter_Depth.build();
        default_map.add_reg(System_Time_Difference_Filter_Depth, 'h934, "RW");
        System_Time_Difference_Filter_Depth.add_hdl_path_slice("System_Time_Difference_Filter_Depth", 0, 8, 0);

        Speed_Counter_Filter_Depth = Speed_Counter_Filter_Depth_reg::type_id::create("Speed_Counter_Filter_Depth");
        Speed_Counter_Filter_Depth.configure(this, null, "");
        Speed_Counter_Filter_Depth.build();
        default_map.add_reg(Speed_Counter_Filter_Depth, 'h935, "RW");
        Speed_Counter_Filter_Depth.add_hdl_path_slice("Speed_Counter_Filter_Depth", 0, 8, 0);

        Receive_Time_Latch_Mode = Receive_Time_Latch_Mode_reg::type_id::create("Receive_Time_Latch_Mode");
        Receive_Time_Latch_Mode.configure(this, null, "");
        Receive_Time_Latch_Mode.build();
        default_map.add_reg(Receive_Time_Latch_Mode, 'h936, "RW");
        Receive_Time_Latch_Mode.add_hdl_path_slice("Receive_Time_Latch_Mode", 0, 8, 0);

        Cyclic_Unit_Control = Cyclic_Unit_Control_reg::type_id::create("Cyclic_Unit_Control");
        Cyclic_Unit_Control.configure(this, null, "");
        Cyclic_Unit_Control.build();
        default_map.add_reg(Cyclic_Unit_Control, 'h980, "RW");
        Cyclic_Unit_Control.add_hdl_path_slice("Cyclic_Unit_Control", 0, 8, 0);

        DC_Activation = DC_Activation_reg::type_id::create("DC_Activation");
        DC_Activation.configure(this, null, "");
        DC_Activation.build();
        default_map.add_reg(DC_Activation, 'h981, "RW");
        DC_Activation.add_hdl_path_slice("DC_Activation", 0, 8, 0);

        Pulse_Length_of_SyncSignals = Pulse_Length_of_SyncSignals_reg::type_id::create("Pulse_Length_of_SyncSignals");
        Pulse_Length_of_SyncSignals.configure(this, null, "");
        Pulse_Length_of_SyncSignals.build();
        default_map.add_reg(Pulse_Length_of_SyncSignals, 'h982, "RW");
        Pulse_Length_of_SyncSignals.add_hdl_path_slice("Pulse_Length_of_SyncSignals", 0, 16, 0);

        DC_Activation_Status = DC_Activation_Status_reg::type_id::create("DC_Activation_Status");
        DC_Activation_Status.configure(this, null, "");
        DC_Activation_Status.build();
        default_map.add_reg(DC_Activation_Status, 'h984, "RW");
        DC_Activation_Status.add_hdl_path_slice("DC_Activation_Status", 0, 8, 0);

        SYNC0_Status = SYNC0_Status_reg::type_id::create("SYNC0_Status");
        SYNC0_Status.configure(this, null, "");
        SYNC0_Status.build();
        default_map.add_reg(SYNC0_Status, 'h98E, "RW");
        SYNC0_Status.add_hdl_path_slice("SYNC0_Status", 0, 8, 0);

        SYNC1_Status = SYNC1_Status_reg::type_id::create("SYNC1_Status");
        SYNC1_Status.configure(this, null, "");
        SYNC1_Status.build();
        default_map.add_reg(SYNC1_Status, 'h98F, "RW");
        SYNC1_Status.add_hdl_path_slice("SYNC1_Status", 0, 8, 0);

        Start_Time_Cyclic_Operation_Next_SYNC0_Pulse = Start_Time_Cyclic_Operation_Next_SYNC0_Pulse_reg::type_id::create("Start_Time_Cyclic_Operation_Next_SYNC0_Pulse");
        Start_Time_Cyclic_Operation_Next_SYNC0_Pulse.configure(this, null, "");
        Start_Time_Cyclic_Operation_Next_SYNC0_Pulse.build();
        default_map.add_reg(Start_Time_Cyclic_Operation_Next_SYNC0_Pulse, 'h990, "RW");
        Start_Time_Cyclic_Operation_Next_SYNC0_Pulse.add_hdl_path_slice("Start_Time_Cyclic_Operation_Next_SYNC0_Pulse", 0, 64, 0);

        Next_SYNC1_Pulse = Next_SYNC1_Pulse_reg::type_id::create("Next_SYNC1_Pulse");
        Next_SYNC1_Pulse.configure(this, null, "");
        Next_SYNC1_Pulse.build();
        default_map.add_reg(Next_SYNC1_Pulse, 'h998, "RW");
        Next_SYNC1_Pulse.add_hdl_path_slice("Next_SYNC1_Pulse", 0, 64, 0);

        SYNC0_Cycle_Time = SYNC0_Cycle_Time_reg::type_id::create("SYNC0_Cycle_Time");
        SYNC0_Cycle_Time.configure(this, null, "");
        SYNC0_Cycle_Time.build();
        default_map.add_reg(SYNC0_Cycle_Time, 'h9A0, "RW");
        SYNC0_Cycle_Time.add_hdl_path_slice("SYNC0_Cycle_Time", 0, 32, 0);

        SYNC1_Cycle_Time = SYNC1_Cycle_Time_reg::type_id::create("SYNC1_Cycle_Time");
        SYNC1_Cycle_Time.configure(this, null, "");
        SYNC1_Cycle_Time.build();
        default_map.add_reg(SYNC1_Cycle_Time, 'h9A4, "RW");
        SYNC1_Cycle_Time.add_hdl_path_slice("SYNC1_Cycle_Time", 0, 32, 0);

        Latch0_Control = Latch0_Control_reg::type_id::create("Latch0_Control");
        Latch0_Control.configure(this, null, "");
        Latch0_Control.build();
        default_map.add_reg(Latch0_Control, 'h9A8, "RW");
        Latch0_Control.add_hdl_path_slice("Latch0_Control", 0, 8, 0);

        Latch1_Control = Latch1_Control_reg::type_id::create("Latch1_Control");
        Latch1_Control.configure(this, null, "");
        Latch1_Control.build();
        default_map.add_reg(Latch1_Control, 'h9A9, "RW");
        Latch1_Control.add_hdl_path_slice("Latch1_Control", 0, 8, 0);

        Latch0_Status = Latch0_Status_reg::type_id::create("Latch0_Status");
        Latch0_Status.configure(this, null, "");
        Latch0_Status.build();
        default_map.add_reg(Latch0_Status, 'h9AE, "RW");
        Latch0_Status.add_hdl_path_slice("Latch0_Status", 0, 8, 0);

        Latch1_Status = Latch1_Status_reg::type_id::create("Latch1_Status");
        Latch1_Status.configure(this, null, "");
        Latch1_Status.build();
        default_map.add_reg(Latch1_Status, 'h9AF, "RW");
        Latch1_Status.add_hdl_path_slice("Latch1_Status", 0, 8, 0);

        Latch0_Positive_Edge = Latch0_Positive_Edge_reg::type_id::create("Latch0_Positive_Edge");
        Latch0_Positive_Edge.configure(this, null, "");
        Latch0_Positive_Edge.build();
        default_map.add_reg(Latch0_Positive_Edge, 'h9B0, "RW");
        Latch0_Positive_Edge.add_hdl_path_slice("Latch0_Positive_Edge", 0, 64, 0);

        Latch0_Negative_Edge = Latch0_Negative_Edge_reg::type_id::create("Latch0_Negative_Edge");
        Latch0_Negative_Edge.configure(this, null, "");
        Latch0_Negative_Edge.build();
        default_map.add_reg(Latch0_Negative_Edge, 'h9B8, "RW");
        Latch0_Negative_Edge.add_hdl_path_slice("Latch0_Negative_Edge", 0, 64, 0);

        Latch1_Positive_Edge = Latch1_Positive_Edge_reg::type_id::create("Latch1_Positive_Edge");
        Latch1_Positive_Edge.configure(this, null, "");
        Latch1_Positive_Edge.build();
        default_map.add_reg(Latch1_Positive_Edge, 'h9C0, "RW");
        Latch1_Positive_Edge.add_hdl_path_slice("Latch1_Positive_Edge", 0, 64, 0);

        Latch1_Negative_Edge = Latch1_Negative_Edge_reg::type_id::create("Latch1_Negative_Edge");
        Latch1_Negative_Edge.configure(this, null, "");
        Latch1_Negative_Edge.build();
        default_map.add_reg(Latch1_Negative_Edge, 'h9C8, "RW");
        Latch1_Negative_Edge.add_hdl_path_slice("Latch1_Negative_Edge", 0, 64, 0);

        EtherCAT_Buffer_Change_Event_Time = EtherCAT_Buffer_Change_Event_Time_reg::type_id::create("EtherCAT_Buffer_Change_Event_Time");
        EtherCAT_Buffer_Change_Event_Time.configure(this, null, "");
        EtherCAT_Buffer_Change_Event_Time.build();
        default_map.add_reg(EtherCAT_Buffer_Change_Event_Time, 'h9F0, "RW");
        EtherCAT_Buffer_Change_Event_Time.add_hdl_path_slice("EtherCAT_Buffer_Change_Event_Time", 0, 32, 0);

        PDI_Buffer_Start_Event_Time = PDI_Buffer_Start_Event_Time_reg::type_id::create("PDI_Buffer_Start_Event_Time");
        PDI_Buffer_Start_Event_Time.configure(this, null, "");
        PDI_Buffer_Start_Event_Time.build();
        default_map.add_reg(PDI_Buffer_Start_Event_Time, 'h9F8, "RW");
        PDI_Buffer_Start_Event_Time.add_hdl_path_slice("PDI_Buffer_Start_Event_Time", 0, 32, 0);

        PDI_Buffer_Change_Event_Time = PDI_Buffer_Change_Event_Time_reg::type_id::create("PDI_Buffer_Change_Event_Time");
        PDI_Buffer_Change_Event_Time.configure(this, null, "");
        PDI_Buffer_Change_Event_Time.build();
        default_map.add_reg(PDI_Buffer_Change_Event_Time, 'h9FC, "RW");
        PDI_Buffer_Change_Event_Time.add_hdl_path_slice("PDI_Buffer_Change_Event_Time", 0, 32, 0);

        Power_On_Values = Power_On_Values_reg::type_id::create("Power_On_Values");
        Power_On_Values.configure(this, null, "");
        Power_On_Values.build();
        default_map.add_reg(Power_On_Values, 'hE00, "RW");
        Power_On_Values.add_hdl_path_slice("Power_On_Values", 0, 8, 0);

        Vendor_ID = Vendor_ID_reg::type_id::create("Vendor_ID");
        Vendor_ID.configure(this, null, "");
        Vendor_ID.build();
        default_map.add_reg(Vendor_ID, 'hE08, "RW");
        Vendor_ID.add_hdl_path_slice("Vendor_ID", 0, 32, 0);

        Digital_I_O_Output_Data = Digital_I_O_Output_Data_reg::type_id::create("Digital_I_O_Output_Data");
        Digital_I_O_Output_Data.configure(this, null, "");
        Digital_I_O_Output_Data.build();
        default_map.add_reg(Digital_I_O_Output_Data, 'hF00, "RW");
        Digital_I_O_Output_Data.add_hdl_path_slice("Digital_I_O_Output_Data", 0, 32, 0);

        General_Purpose_Outputs = General_Purpose_Outputs_reg::type_id::create("General_Purpose_Outputs");
        General_Purpose_Outputs.configure(this, null, "");
        General_Purpose_Outputs.build();
        default_map.add_reg(General_Purpose_Outputs, 'hF10, "RW");
        General_Purpose_Outputs.add_hdl_path_slice("General_Purpose_Outputs", 0, 16, 0);

        General_Purpose_Inputs = General_Purpose_Inputs_reg::type_id::create("General_Purpose_Inputs");
        General_Purpose_Inputs.configure(this, null, "");
        General_Purpose_Inputs.build();
        default_map.add_reg(General_Purpose_Inputs, 'hF18, "RW");
        General_Purpose_Inputs.add_hdl_path_slice("General_Purpose_Inputs", 0, 16, 0);

        User_RAM = User_RAM_reg::type_id::create("User_RAM");
        User_RAM.configure(this, null, "");
        User_RAM.build();
        default_map.add_reg(User_RAM, 'hF80, "RW");
        User_RAM.add_hdl_path_slice("User_RAM", 0, 64, 0);

        Process_Data_RAM = Process_Data_RAM_reg::type_id::create("Process_Data_RAM");
        Process_Data_RAM.configure(this, null, "");
        Process_Data_RAM.build();
        default_map.add_reg(Process_Data_RAM, 'h1000, "RW");
        Process_Data_RAM.add_hdl_path_slice("Process_Data_RAM", 0, 8, 0);

        lock_model();
    endfunction

endclass : esc_reg_block

`endif // _ESC_REG_BLOCK_SV_
