`ifndef _I2C_REG_BLOCK_SV_
`define _I2C_REG_BLOCK_SV_

//=========================================================================
// i2c_reg_block: I2C (DW_apb_i2c v2.04a), 0x40021000
//   自动生成, 共 61 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class i2c_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // IC_CON  (0x0, 32-bit, RW) I2C Control Register
    //---------------------------------------------------------------------
    class IC_CON_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CON_reg)

        function new(string name="IC_CON_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CON_reg

    //---------------------------------------------------------------------
    // IC_TAR  (0x4, 32-bit, RW) I2C Target Address Register
    //---------------------------------------------------------------------
    class IC_TAR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_TAR_reg)

        function new(string name="IC_TAR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_TAR_reg

    //---------------------------------------------------------------------
    // IC_SAR  (0x8, 32-bit, RW) I2C Target Device Address Register
    //---------------------------------------------------------------------
    class IC_SAR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SAR_reg)

        function new(string name="IC_SAR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SAR_reg

    //---------------------------------------------------------------------
    // IC_HS_MADDR  (0xC, 32-bit, RW) I2C High Speed Mode Code Address Register
    //---------------------------------------------------------------------
    class IC_HS_MADDR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_HS_MADDR_reg)

        function new(string name="IC_HS_MADDR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_HS_MADDR_reg

    //---------------------------------------------------------------------
    // IC_DATA_CMD  (0x10, 32-bit, RW) I2C Rx/Tx Data Buffer and Command Register
    //---------------------------------------------------------------------
    class IC_DATA_CMD_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_DATA_CMD_reg)

        function new(string name="IC_DATA_CMD_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_DATA_CMD_reg

    //---------------------------------------------------------------------
    // IC_SS_SCL_HCNT  (0x14, 32-bit, RW) Standard Speed SCL High Count
    //---------------------------------------------------------------------
    class IC_SS_SCL_HCNT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SS_SCL_HCNT_reg)

        function new(string name="IC_SS_SCL_HCNT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SS_SCL_HCNT_reg

    //---------------------------------------------------------------------
    // IC_SS_SCL_LCNT  (0x18, 32-bit, RW) Standard Speed SCL Low Count
    //---------------------------------------------------------------------
    class IC_SS_SCL_LCNT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SS_SCL_LCNT_reg)

        function new(string name="IC_SS_SCL_LCNT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SS_SCL_LCNT_reg

    //---------------------------------------------------------------------
    // IC_FS_SCL_HCNT  (0x1C, 32-bit, RW) Fast Speed SCL High Count
    //---------------------------------------------------------------------
    class IC_FS_SCL_HCNT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_FS_SCL_HCNT_reg)

        function new(string name="IC_FS_SCL_HCNT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_FS_SCL_HCNT_reg

    //---------------------------------------------------------------------
    // IC_FS_SCL_LCNT  (0x20, 32-bit, RW) Fast Speed SCL Low Count
    //---------------------------------------------------------------------
    class IC_FS_SCL_LCNT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_FS_SCL_LCNT_reg)

        function new(string name="IC_FS_SCL_LCNT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_FS_SCL_LCNT_reg

    //---------------------------------------------------------------------
    // IC_HS_SCL_HCNT  (0x24, 32-bit, RW) High Speed SCL High Count
    //---------------------------------------------------------------------
    class IC_HS_SCL_HCNT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_HS_SCL_HCNT_reg)

        function new(string name="IC_HS_SCL_HCNT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_HS_SCL_HCNT_reg

    //---------------------------------------------------------------------
    // IC_HS_SCL_LCNT  (0x28, 32-bit, RW) High Speed SCL Low Count
    //---------------------------------------------------------------------
    class IC_HS_SCL_LCNT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_HS_SCL_LCNT_reg)

        function new(string name="IC_HS_SCL_LCNT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_HS_SCL_LCNT_reg

    //---------------------------------------------------------------------
    // IC_INTR_STAT  (0x2C, 32-bit, RO) Interrupt Status Register
    //---------------------------------------------------------------------
    class IC_INTR_STAT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_INTR_STAT_reg)

        function new(string name="IC_INTR_STAT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_INTR_STAT_reg

    //---------------------------------------------------------------------
    // IC_INTR_MASK  (0x30, 32-bit, RW) Interrupt Mask Register
    //---------------------------------------------------------------------
    class IC_INTR_MASK_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_INTR_MASK_reg)

        function new(string name="IC_INTR_MASK_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_INTR_MASK_reg

    //---------------------------------------------------------------------
    // IC_RAW_INTR_STAT  (0x34, 32-bit, RO) Raw Interrupt Status Register
    //---------------------------------------------------------------------
    class IC_RAW_INTR_STAT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_RAW_INTR_STAT_reg)

        function new(string name="IC_RAW_INTR_STAT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_RAW_INTR_STAT_reg

    //---------------------------------------------------------------------
    // IC_RX_TL  (0x38, 32-bit, RW) Receive FIFO Threshold Level
    //---------------------------------------------------------------------
    class IC_RX_TL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_RX_TL_reg)

        function new(string name="IC_RX_TL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_RX_TL_reg

    //---------------------------------------------------------------------
    // IC_TX_TL  (0x3C, 32-bit, RW) Transmit FIFO Threshold Level
    //---------------------------------------------------------------------
    class IC_TX_TL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_TX_TL_reg)

        function new(string name="IC_TX_TL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_TX_TL_reg

    //---------------------------------------------------------------------
    // IC_CLR_INTR  (0x40, 32-bit, RW) Clear Combined/Individual Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_INTR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_INTR_reg)

        function new(string name="IC_CLR_INTR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_INTR_reg

    //---------------------------------------------------------------------
    // IC_CLR_RX_UNDER  (0x44, 32-bit, RW) Clear RX_UNDER Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_RX_UNDER_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_RX_UNDER_reg)

        function new(string name="IC_CLR_RX_UNDER_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_RX_UNDER_reg

    //---------------------------------------------------------------------
    // IC_CLR_RX_OVER  (0x48, 32-bit, RW) Clear RX_OVER Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_RX_OVER_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_RX_OVER_reg)

        function new(string name="IC_CLR_RX_OVER_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_RX_OVER_reg

    //---------------------------------------------------------------------
    // IC_CLR_TX_OVER  (0x4C, 32-bit, RW) Clear TX_OVER Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_TX_OVER_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_TX_OVER_reg)

        function new(string name="IC_CLR_TX_OVER_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_TX_OVER_reg

    //---------------------------------------------------------------------
    // IC_CLR_RD_REQ  (0x50, 32-bit, RW) Clear RD_REQ Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_RD_REQ_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_RD_REQ_reg)

        function new(string name="IC_CLR_RD_REQ_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_RD_REQ_reg

    //---------------------------------------------------------------------
    // IC_CLR_TX_ABRT  (0x54, 32-bit, RW) Clear TX_ABRT Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_TX_ABRT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_TX_ABRT_reg)

        function new(string name="IC_CLR_TX_ABRT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_TX_ABRT_reg

    //---------------------------------------------------------------------
    // IC_CLR_RX_DONE  (0x58, 32-bit, RW) Clear RX_DONE Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_RX_DONE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_RX_DONE_reg)

        function new(string name="IC_CLR_RX_DONE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_RX_DONE_reg

    //---------------------------------------------------------------------
    // IC_CLR_ACTIVITY  (0x5C, 32-bit, RW) Clear ACTIVITY Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_ACTIVITY_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_ACTIVITY_reg)

        function new(string name="IC_CLR_ACTIVITY_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_ACTIVITY_reg

    //---------------------------------------------------------------------
    // IC_CLR_STOP_DET  (0x60, 32-bit, RW) Clear STOP_DET Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_STOP_DET_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_STOP_DET_reg)

        function new(string name="IC_CLR_STOP_DET_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_STOP_DET_reg

    //---------------------------------------------------------------------
    // IC_CLR_START_DET  (0x64, 32-bit, RW) Clear START_DET Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_START_DET_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_START_DET_reg)

        function new(string name="IC_CLR_START_DET_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_START_DET_reg

    //---------------------------------------------------------------------
    // IC_CLR_GEN_CALL  (0x68, 32-bit, RW) Clear GEN_CALL Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_GEN_CALL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_GEN_CALL_reg)

        function new(string name="IC_CLR_GEN_CALL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_GEN_CALL_reg

    //---------------------------------------------------------------------
    // IC_ENABLE  (0x6C, 32-bit, RW) I2C Enable Register
    //---------------------------------------------------------------------
    class IC_ENABLE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_ENABLE_reg)

        function new(string name="IC_ENABLE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_ENABLE_reg

    //---------------------------------------------------------------------
    // IC_STATUS  (0x70, 32-bit, RO) I2C Status Register
    //---------------------------------------------------------------------
    class IC_STATUS_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_STATUS_reg)

        function new(string name="IC_STATUS_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_STATUS_reg

    //---------------------------------------------------------------------
    // IC_TXFLR  (0x74, 32-bit, RO) Transmit FIFO Level Register
    //---------------------------------------------------------------------
    class IC_TXFLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_TXFLR_reg)

        function new(string name="IC_TXFLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_TXFLR_reg

    //---------------------------------------------------------------------
    // IC_RXFLR  (0x78, 32-bit, RO) Receive FIFO Level Register
    //---------------------------------------------------------------------
    class IC_RXFLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_RXFLR_reg)

        function new(string name="IC_RXFLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_RXFLR_reg

    //---------------------------------------------------------------------
    // IC_SDA_HOLD  (0x7C, 32-bit, RW) SDA Hold Time Register
    //---------------------------------------------------------------------
    class IC_SDA_HOLD_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SDA_HOLD_reg)

        function new(string name="IC_SDA_HOLD_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SDA_HOLD_reg

    //---------------------------------------------------------------------
    // IC_TX_ABRT_SOURCE  (0x80, 32-bit, RO) Transmit Abort Source Register
    //---------------------------------------------------------------------
    class IC_TX_ABRT_SOURCE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_TX_ABRT_SOURCE_reg)

        function new(string name="IC_TX_ABRT_SOURCE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_TX_ABRT_SOURCE_reg

    //---------------------------------------------------------------------
    // IC_SLV_DATA_NACK_ONLY  (0x84, 32-bit, RW) Slave Data NACK Only
    //---------------------------------------------------------------------
    class IC_SLV_DATA_NACK_ONLY_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SLV_DATA_NACK_ONLY_reg)

        function new(string name="IC_SLV_DATA_NACK_ONLY_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SLV_DATA_NACK_ONLY_reg

    //---------------------------------------------------------------------
    // IC_DMA_CR  (0x88, 32-bit, RW) DMA Control Register
    //---------------------------------------------------------------------
    class IC_DMA_CR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_DMA_CR_reg)

        function new(string name="IC_DMA_CR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_DMA_CR_reg

    //---------------------------------------------------------------------
    // IC_DMA_TDLR  (0x8C, 32-bit, RW) DMA Transmit Data Level
    //---------------------------------------------------------------------
    class IC_DMA_TDLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_DMA_TDLR_reg)

        function new(string name="IC_DMA_TDLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_DMA_TDLR_reg

    //---------------------------------------------------------------------
    // IC_DMA_RDLR  (0x90, 32-bit, RW) DMA Receive Data Level
    //---------------------------------------------------------------------
    class IC_DMA_RDLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_DMA_RDLR_reg)

        function new(string name="IC_DMA_RDLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_DMA_RDLR_reg

    //---------------------------------------------------------------------
    // IC_SDA_SETUP  (0x94, 32-bit, RW) SDA Setup Register
    //---------------------------------------------------------------------
    class IC_SDA_SETUP_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SDA_SETUP_reg)

        function new(string name="IC_SDA_SETUP_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SDA_SETUP_reg

    //---------------------------------------------------------------------
    // IC_ACK_GENERAL_CALL  (0x98, 32-bit, RW) ACK General Call Register
    //---------------------------------------------------------------------
    class IC_ACK_GENERAL_CALL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_ACK_GENERAL_CALL_reg)

        function new(string name="IC_ACK_GENERAL_CALL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_ACK_GENERAL_CALL_reg

    //---------------------------------------------------------------------
    // IC_ENABLE_STATUS  (0x9C, 32-bit, RO) Enable Status Register
    //---------------------------------------------------------------------
    class IC_ENABLE_STATUS_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_ENABLE_STATUS_reg)

        function new(string name="IC_ENABLE_STATUS_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_ENABLE_STATUS_reg

    //---------------------------------------------------------------------
    // IC_FS_SPKLEN  (0xA0, 32-bit, RW) Fast Speed Spike Suppression Limit
    //---------------------------------------------------------------------
    class IC_FS_SPKLEN_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_FS_SPKLEN_reg)

        function new(string name="IC_FS_SPKLEN_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_FS_SPKLEN_reg

    //---------------------------------------------------------------------
    // IC_HS_SPKLEN  (0xA4, 32-bit, RW) High Speed Spike Suppression Limit
    //---------------------------------------------------------------------
    class IC_HS_SPKLEN_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_HS_SPKLEN_reg)

        function new(string name="IC_HS_SPKLEN_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_HS_SPKLEN_reg

    //---------------------------------------------------------------------
    // IC_CLR_RESTART_DET  (0xA8, 32-bit, RW) Clear RESTART_DET Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_RESTART_DET_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_RESTART_DET_reg)

        function new(string name="IC_CLR_RESTART_DET_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_RESTART_DET_reg

    //---------------------------------------------------------------------
    // IC_SCL_STUCK_AT_LOW_TIMEOUT  (0xAC, 32-bit, RW) SCL Stuck at Low Timeout
    //---------------------------------------------------------------------
    class IC_SCL_STUCK_AT_LOW_TIMEOUT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SCL_STUCK_AT_LOW_TIMEOUT_reg)

        function new(string name="IC_SCL_STUCK_AT_LOW_TIMEOUT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SCL_STUCK_AT_LOW_TIMEOUT_reg

    //---------------------------------------------------------------------
    // IC_SDA_STUCK_AT_LOW_TIMEOUT  (0xB0, 32-bit, RW) SDA Stuck at Low Timeout
    //---------------------------------------------------------------------
    class IC_SDA_STUCK_AT_LOW_TIMEOUT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SDA_STUCK_AT_LOW_TIMEOUT_reg)

        function new(string name="IC_SDA_STUCK_AT_LOW_TIMEOUT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SDA_STUCK_AT_LOW_TIMEOUT_reg

    //---------------------------------------------------------------------
    // IC_CLR_SCL_STUCK_DET  (0xB4, 32-bit, RW) Clear SCL Stuck Detect
    //---------------------------------------------------------------------
    class IC_CLR_SCL_STUCK_DET_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_SCL_STUCK_DET_reg)

        function new(string name="IC_CLR_SCL_STUCK_DET_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_SCL_STUCK_DET_reg

    //---------------------------------------------------------------------
    // IC_DEVICE_ID  (0xB8, 32-bit, RO) I2C Device ID
    //---------------------------------------------------------------------
    class IC_DEVICE_ID_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_DEVICE_ID_reg)

        function new(string name="IC_DEVICE_ID_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_DEVICE_ID_reg

    //---------------------------------------------------------------------
    // IC_SMBUS_CLK_LOW_SEXT  (0xBC, 32-bit, RW) SMBus Clock Low SExt Timeout
    //---------------------------------------------------------------------
    class IC_SMBUS_CLK_LOW_SEXT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SMBUS_CLK_LOW_SEXT_reg)

        function new(string name="IC_SMBUS_CLK_LOW_SEXT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SMBUS_CLK_LOW_SEXT_reg

    //---------------------------------------------------------------------
    // IC_SMBUS_CLK_LOW_MEXT  (0xC0, 32-bit, RW) SMBus Clock Low MExt Timeout
    //---------------------------------------------------------------------
    class IC_SMBUS_CLK_LOW_MEXT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SMBUS_CLK_LOW_MEXT_reg)

        function new(string name="IC_SMBUS_CLK_LOW_MEXT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SMBUS_CLK_LOW_MEXT_reg

    //---------------------------------------------------------------------
    // IC_SMBUS_THIGH_MAX_IDLE_COUNT  (0xC4, 32-bit, RW) SMBus THigh Max Idle Count
    //---------------------------------------------------------------------
    class IC_SMBUS_THIGH_MAX_IDLE_COUNT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SMBUS_THIGH_MAX_IDLE_COUNT_reg)

        function new(string name="IC_SMBUS_THIGH_MAX_IDLE_COUNT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SMBUS_THIGH_MAX_IDLE_COUNT_reg

    //---------------------------------------------------------------------
    // IC_SMBUS_INTR_STAT  (0xC8, 32-bit, RO) SMBus Interrupt Status
    //---------------------------------------------------------------------
    class IC_SMBUS_INTR_STAT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SMBUS_INTR_STAT_reg)

        function new(string name="IC_SMBUS_INTR_STAT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SMBUS_INTR_STAT_reg

    //---------------------------------------------------------------------
    // IC_SMBUS_INTR_MASK  (0xCC, 32-bit, RW) SMBus Interrupt Mask
    //---------------------------------------------------------------------
    class IC_SMBUS_INTR_MASK_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SMBUS_INTR_MASK_reg)

        function new(string name="IC_SMBUS_INTR_MASK_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SMBUS_INTR_MASK_reg

    //---------------------------------------------------------------------
    // IC_SMBUS_RAW_INTR_STAT  (0xD0, 32-bit, RO) SMBus Raw Interrupt Status
    //---------------------------------------------------------------------
    class IC_SMBUS_RAW_INTR_STAT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SMBUS_RAW_INTR_STAT_reg)

        function new(string name="IC_SMBUS_RAW_INTR_STAT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SMBUS_RAW_INTR_STAT_reg

    //---------------------------------------------------------------------
    // IC_CLR_SMBUS_INTR  (0xD4, 32-bit, RW) Clear SMBus Interrupt
    //---------------------------------------------------------------------
    class IC_CLR_SMBUS_INTR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_CLR_SMBUS_INTR_reg)

        function new(string name="IC_CLR_SMBUS_INTR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_CLR_SMBUS_INTR_reg

    //---------------------------------------------------------------------
    // IC_OPTIONAL_SAR  (0xD8, 32-bit, RW) Optional Slave Address Register
    //---------------------------------------------------------------------
    class IC_OPTIONAL_SAR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_OPTIONAL_SAR_reg)

        function new(string name="IC_OPTIONAL_SAR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_OPTIONAL_SAR_reg

    //---------------------------------------------------------------------
    // IC_SMBUS_UDID_LSB  (0xDC, 32-bit, RW) SMBus UDID LSB/Word0
    //---------------------------------------------------------------------
    class IC_SMBUS_UDID_LSB_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SMBUS_UDID_LSB_reg)

        function new(string name="IC_SMBUS_UDID_LSB_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SMBUS_UDID_LSB_reg

    //---------------------------------------------------------------------
    // IC_SMBUS_UDID_WORD1  (0xE0, 32-bit, RW) SMBus UDID Word1
    //---------------------------------------------------------------------
    class IC_SMBUS_UDID_WORD1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SMBUS_UDID_WORD1_reg)

        function new(string name="IC_SMBUS_UDID_WORD1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SMBUS_UDID_WORD1_reg

    //---------------------------------------------------------------------
    // IC_SMBUS_UDID_WORD2  (0xE4, 32-bit, RW) SMBus UDID Word2
    //---------------------------------------------------------------------
    class IC_SMBUS_UDID_WORD2_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_SMBUS_UDID_WORD2_reg)

        function new(string name="IC_SMBUS_UDID_WORD2_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_SMBUS_UDID_WORD2_reg

    //---------------------------------------------------------------------
    // IC_COMP_PARAM_1  (0xF4, 32-bit, RO) Component Parameter Register 1
    //---------------------------------------------------------------------
    class IC_COMP_PARAM_1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_COMP_PARAM_1_reg)

        function new(string name="IC_COMP_PARAM_1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_COMP_PARAM_1_reg

    //---------------------------------------------------------------------
    // IC_COMP_VERSION  (0xF8, 32-bit, RO) Component Version Register
    //---------------------------------------------------------------------
    class IC_COMP_VERSION_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_COMP_VERSION_reg)

        function new(string name="IC_COMP_VERSION_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_COMP_VERSION_reg

    //---------------------------------------------------------------------
    // IC_COMP_TYPE  (0xFC, 32-bit, RO) Component Type Register
    //---------------------------------------------------------------------
    class IC_COMP_TYPE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IC_COMP_TYPE_reg)

        function new(string name="IC_COMP_TYPE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IC_COMP_TYPE_reg

    rand IC_CON_reg IC_CON;
    rand IC_TAR_reg IC_TAR;
    rand IC_SAR_reg IC_SAR;
    rand IC_HS_MADDR_reg IC_HS_MADDR;
    rand IC_DATA_CMD_reg IC_DATA_CMD;
    rand IC_SS_SCL_HCNT_reg IC_SS_SCL_HCNT;
    rand IC_SS_SCL_LCNT_reg IC_SS_SCL_LCNT;
    rand IC_FS_SCL_HCNT_reg IC_FS_SCL_HCNT;
    rand IC_FS_SCL_LCNT_reg IC_FS_SCL_LCNT;
    rand IC_HS_SCL_HCNT_reg IC_HS_SCL_HCNT;
    rand IC_HS_SCL_LCNT_reg IC_HS_SCL_LCNT;
    rand IC_INTR_STAT_reg IC_INTR_STAT;
    rand IC_INTR_MASK_reg IC_INTR_MASK;
    rand IC_RAW_INTR_STAT_reg IC_RAW_INTR_STAT;
    rand IC_RX_TL_reg IC_RX_TL;
    rand IC_TX_TL_reg IC_TX_TL;
    rand IC_CLR_INTR_reg IC_CLR_INTR;
    rand IC_CLR_RX_UNDER_reg IC_CLR_RX_UNDER;
    rand IC_CLR_RX_OVER_reg IC_CLR_RX_OVER;
    rand IC_CLR_TX_OVER_reg IC_CLR_TX_OVER;
    rand IC_CLR_RD_REQ_reg IC_CLR_RD_REQ;
    rand IC_CLR_TX_ABRT_reg IC_CLR_TX_ABRT;
    rand IC_CLR_RX_DONE_reg IC_CLR_RX_DONE;
    rand IC_CLR_ACTIVITY_reg IC_CLR_ACTIVITY;
    rand IC_CLR_STOP_DET_reg IC_CLR_STOP_DET;
    rand IC_CLR_START_DET_reg IC_CLR_START_DET;
    rand IC_CLR_GEN_CALL_reg IC_CLR_GEN_CALL;
    rand IC_ENABLE_reg IC_ENABLE;
    rand IC_STATUS_reg IC_STATUS;
    rand IC_TXFLR_reg IC_TXFLR;
    rand IC_RXFLR_reg IC_RXFLR;
    rand IC_SDA_HOLD_reg IC_SDA_HOLD;
    rand IC_TX_ABRT_SOURCE_reg IC_TX_ABRT_SOURCE;
    rand IC_SLV_DATA_NACK_ONLY_reg IC_SLV_DATA_NACK_ONLY;
    rand IC_DMA_CR_reg IC_DMA_CR;
    rand IC_DMA_TDLR_reg IC_DMA_TDLR;
    rand IC_DMA_RDLR_reg IC_DMA_RDLR;
    rand IC_SDA_SETUP_reg IC_SDA_SETUP;
    rand IC_ACK_GENERAL_CALL_reg IC_ACK_GENERAL_CALL;
    rand IC_ENABLE_STATUS_reg IC_ENABLE_STATUS;
    rand IC_FS_SPKLEN_reg IC_FS_SPKLEN;
    rand IC_HS_SPKLEN_reg IC_HS_SPKLEN;
    rand IC_CLR_RESTART_DET_reg IC_CLR_RESTART_DET;
    rand IC_SCL_STUCK_AT_LOW_TIMEOUT_reg IC_SCL_STUCK_AT_LOW_TIMEOUT;
    rand IC_SDA_STUCK_AT_LOW_TIMEOUT_reg IC_SDA_STUCK_AT_LOW_TIMEOUT;
    rand IC_CLR_SCL_STUCK_DET_reg IC_CLR_SCL_STUCK_DET;
    rand IC_DEVICE_ID_reg IC_DEVICE_ID;
    rand IC_SMBUS_CLK_LOW_SEXT_reg IC_SMBUS_CLK_LOW_SEXT;
    rand IC_SMBUS_CLK_LOW_MEXT_reg IC_SMBUS_CLK_LOW_MEXT;
    rand IC_SMBUS_THIGH_MAX_IDLE_COUNT_reg IC_SMBUS_THIGH_MAX_IDLE_COUNT;
    rand IC_SMBUS_INTR_STAT_reg IC_SMBUS_INTR_STAT;
    rand IC_SMBUS_INTR_MASK_reg IC_SMBUS_INTR_MASK;
    rand IC_SMBUS_RAW_INTR_STAT_reg IC_SMBUS_RAW_INTR_STAT;
    rand IC_CLR_SMBUS_INTR_reg IC_CLR_SMBUS_INTR;
    rand IC_OPTIONAL_SAR_reg IC_OPTIONAL_SAR;
    rand IC_SMBUS_UDID_LSB_reg IC_SMBUS_UDID_LSB;
    rand IC_SMBUS_UDID_WORD1_reg IC_SMBUS_UDID_WORD1;
    rand IC_SMBUS_UDID_WORD2_reg IC_SMBUS_UDID_WORD2;
    rand IC_COMP_PARAM_1_reg IC_COMP_PARAM_1;
    rand IC_COMP_VERSION_reg IC_COMP_VERSION;
    rand IC_COMP_TYPE_reg IC_COMP_TYPE;

    `uvm_object_utils(i2c_reg_block)

    function new(string name="i2c_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        IC_CON = IC_CON_reg::type_id::create("IC_CON");
        IC_CON.configure(this, null, "");
        IC_CON.build();
        default_map.add_reg(IC_CON, 'h0, "RW");
        IC_CON.add_hdl_path_slice("IC_CON", 0, 32, 0);

        IC_TAR = IC_TAR_reg::type_id::create("IC_TAR");
        IC_TAR.configure(this, null, "");
        IC_TAR.build();
        default_map.add_reg(IC_TAR, 'h4, "RW");
        IC_TAR.add_hdl_path_slice("IC_TAR", 0, 32, 0);

        IC_SAR = IC_SAR_reg::type_id::create("IC_SAR");
        IC_SAR.configure(this, null, "");
        IC_SAR.build();
        default_map.add_reg(IC_SAR, 'h8, "RW");
        IC_SAR.add_hdl_path_slice("IC_SAR", 0, 32, 0);

        IC_HS_MADDR = IC_HS_MADDR_reg::type_id::create("IC_HS_MADDR");
        IC_HS_MADDR.configure(this, null, "");
        IC_HS_MADDR.build();
        default_map.add_reg(IC_HS_MADDR, 'hC, "RW");
        IC_HS_MADDR.add_hdl_path_slice("IC_HS_MADDR", 0, 32, 0);

        IC_DATA_CMD = IC_DATA_CMD_reg::type_id::create("IC_DATA_CMD");
        IC_DATA_CMD.configure(this, null, "");
        IC_DATA_CMD.build();
        default_map.add_reg(IC_DATA_CMD, 'h10, "RW");
        IC_DATA_CMD.add_hdl_path_slice("IC_DATA_CMD", 0, 32, 0);

        IC_SS_SCL_HCNT = IC_SS_SCL_HCNT_reg::type_id::create("IC_SS_SCL_HCNT");
        IC_SS_SCL_HCNT.configure(this, null, "");
        IC_SS_SCL_HCNT.build();
        default_map.add_reg(IC_SS_SCL_HCNT, 'h14, "RW");
        IC_SS_SCL_HCNT.add_hdl_path_slice("IC_SS_SCL_HCNT", 0, 32, 0);

        IC_SS_SCL_LCNT = IC_SS_SCL_LCNT_reg::type_id::create("IC_SS_SCL_LCNT");
        IC_SS_SCL_LCNT.configure(this, null, "");
        IC_SS_SCL_LCNT.build();
        default_map.add_reg(IC_SS_SCL_LCNT, 'h18, "RW");
        IC_SS_SCL_LCNT.add_hdl_path_slice("IC_SS_SCL_LCNT", 0, 32, 0);

        IC_FS_SCL_HCNT = IC_FS_SCL_HCNT_reg::type_id::create("IC_FS_SCL_HCNT");
        IC_FS_SCL_HCNT.configure(this, null, "");
        IC_FS_SCL_HCNT.build();
        default_map.add_reg(IC_FS_SCL_HCNT, 'h1C, "RW");
        IC_FS_SCL_HCNT.add_hdl_path_slice("IC_FS_SCL_HCNT", 0, 32, 0);

        IC_FS_SCL_LCNT = IC_FS_SCL_LCNT_reg::type_id::create("IC_FS_SCL_LCNT");
        IC_FS_SCL_LCNT.configure(this, null, "");
        IC_FS_SCL_LCNT.build();
        default_map.add_reg(IC_FS_SCL_LCNT, 'h20, "RW");
        IC_FS_SCL_LCNT.add_hdl_path_slice("IC_FS_SCL_LCNT", 0, 32, 0);

        IC_HS_SCL_HCNT = IC_HS_SCL_HCNT_reg::type_id::create("IC_HS_SCL_HCNT");
        IC_HS_SCL_HCNT.configure(this, null, "");
        IC_HS_SCL_HCNT.build();
        default_map.add_reg(IC_HS_SCL_HCNT, 'h24, "RW");
        IC_HS_SCL_HCNT.add_hdl_path_slice("IC_HS_SCL_HCNT", 0, 32, 0);

        IC_HS_SCL_LCNT = IC_HS_SCL_LCNT_reg::type_id::create("IC_HS_SCL_LCNT");
        IC_HS_SCL_LCNT.configure(this, null, "");
        IC_HS_SCL_LCNT.build();
        default_map.add_reg(IC_HS_SCL_LCNT, 'h28, "RW");
        IC_HS_SCL_LCNT.add_hdl_path_slice("IC_HS_SCL_LCNT", 0, 32, 0);

        IC_INTR_STAT = IC_INTR_STAT_reg::type_id::create("IC_INTR_STAT");
        IC_INTR_STAT.configure(this, null, "");
        IC_INTR_STAT.build();
        default_map.add_reg(IC_INTR_STAT, 'h2C, "RO");
        IC_INTR_STAT.add_hdl_path_slice("IC_INTR_STAT", 0, 32, 0);

        IC_INTR_MASK = IC_INTR_MASK_reg::type_id::create("IC_INTR_MASK");
        IC_INTR_MASK.configure(this, null, "");
        IC_INTR_MASK.build();
        default_map.add_reg(IC_INTR_MASK, 'h30, "RW");
        IC_INTR_MASK.add_hdl_path_slice("IC_INTR_MASK", 0, 32, 0);

        IC_RAW_INTR_STAT = IC_RAW_INTR_STAT_reg::type_id::create("IC_RAW_INTR_STAT");
        IC_RAW_INTR_STAT.configure(this, null, "");
        IC_RAW_INTR_STAT.build();
        default_map.add_reg(IC_RAW_INTR_STAT, 'h34, "RO");
        IC_RAW_INTR_STAT.add_hdl_path_slice("IC_RAW_INTR_STAT", 0, 32, 0);

        IC_RX_TL = IC_RX_TL_reg::type_id::create("IC_RX_TL");
        IC_RX_TL.configure(this, null, "");
        IC_RX_TL.build();
        default_map.add_reg(IC_RX_TL, 'h38, "RW");
        IC_RX_TL.add_hdl_path_slice("IC_RX_TL", 0, 32, 0);

        IC_TX_TL = IC_TX_TL_reg::type_id::create("IC_TX_TL");
        IC_TX_TL.configure(this, null, "");
        IC_TX_TL.build();
        default_map.add_reg(IC_TX_TL, 'h3C, "RW");
        IC_TX_TL.add_hdl_path_slice("IC_TX_TL", 0, 32, 0);

        IC_CLR_INTR = IC_CLR_INTR_reg::type_id::create("IC_CLR_INTR");
        IC_CLR_INTR.configure(this, null, "");
        IC_CLR_INTR.build();
        default_map.add_reg(IC_CLR_INTR, 'h40, "RW");
        IC_CLR_INTR.add_hdl_path_slice("IC_CLR_INTR", 0, 32, 0);

        IC_CLR_RX_UNDER = IC_CLR_RX_UNDER_reg::type_id::create("IC_CLR_RX_UNDER");
        IC_CLR_RX_UNDER.configure(this, null, "");
        IC_CLR_RX_UNDER.build();
        default_map.add_reg(IC_CLR_RX_UNDER, 'h44, "RW");
        IC_CLR_RX_UNDER.add_hdl_path_slice("IC_CLR_RX_UNDER", 0, 32, 0);

        IC_CLR_RX_OVER = IC_CLR_RX_OVER_reg::type_id::create("IC_CLR_RX_OVER");
        IC_CLR_RX_OVER.configure(this, null, "");
        IC_CLR_RX_OVER.build();
        default_map.add_reg(IC_CLR_RX_OVER, 'h48, "RW");
        IC_CLR_RX_OVER.add_hdl_path_slice("IC_CLR_RX_OVER", 0, 32, 0);

        IC_CLR_TX_OVER = IC_CLR_TX_OVER_reg::type_id::create("IC_CLR_TX_OVER");
        IC_CLR_TX_OVER.configure(this, null, "");
        IC_CLR_TX_OVER.build();
        default_map.add_reg(IC_CLR_TX_OVER, 'h4C, "RW");
        IC_CLR_TX_OVER.add_hdl_path_slice("IC_CLR_TX_OVER", 0, 32, 0);

        IC_CLR_RD_REQ = IC_CLR_RD_REQ_reg::type_id::create("IC_CLR_RD_REQ");
        IC_CLR_RD_REQ.configure(this, null, "");
        IC_CLR_RD_REQ.build();
        default_map.add_reg(IC_CLR_RD_REQ, 'h50, "RW");
        IC_CLR_RD_REQ.add_hdl_path_slice("IC_CLR_RD_REQ", 0, 32, 0);

        IC_CLR_TX_ABRT = IC_CLR_TX_ABRT_reg::type_id::create("IC_CLR_TX_ABRT");
        IC_CLR_TX_ABRT.configure(this, null, "");
        IC_CLR_TX_ABRT.build();
        default_map.add_reg(IC_CLR_TX_ABRT, 'h54, "RW");
        IC_CLR_TX_ABRT.add_hdl_path_slice("IC_CLR_TX_ABRT", 0, 32, 0);

        IC_CLR_RX_DONE = IC_CLR_RX_DONE_reg::type_id::create("IC_CLR_RX_DONE");
        IC_CLR_RX_DONE.configure(this, null, "");
        IC_CLR_RX_DONE.build();
        default_map.add_reg(IC_CLR_RX_DONE, 'h58, "RW");
        IC_CLR_RX_DONE.add_hdl_path_slice("IC_CLR_RX_DONE", 0, 32, 0);

        IC_CLR_ACTIVITY = IC_CLR_ACTIVITY_reg::type_id::create("IC_CLR_ACTIVITY");
        IC_CLR_ACTIVITY.configure(this, null, "");
        IC_CLR_ACTIVITY.build();
        default_map.add_reg(IC_CLR_ACTIVITY, 'h5C, "RW");
        IC_CLR_ACTIVITY.add_hdl_path_slice("IC_CLR_ACTIVITY", 0, 32, 0);

        IC_CLR_STOP_DET = IC_CLR_STOP_DET_reg::type_id::create("IC_CLR_STOP_DET");
        IC_CLR_STOP_DET.configure(this, null, "");
        IC_CLR_STOP_DET.build();
        default_map.add_reg(IC_CLR_STOP_DET, 'h60, "RW");
        IC_CLR_STOP_DET.add_hdl_path_slice("IC_CLR_STOP_DET", 0, 32, 0);

        IC_CLR_START_DET = IC_CLR_START_DET_reg::type_id::create("IC_CLR_START_DET");
        IC_CLR_START_DET.configure(this, null, "");
        IC_CLR_START_DET.build();
        default_map.add_reg(IC_CLR_START_DET, 'h64, "RW");
        IC_CLR_START_DET.add_hdl_path_slice("IC_CLR_START_DET", 0, 32, 0);

        IC_CLR_GEN_CALL = IC_CLR_GEN_CALL_reg::type_id::create("IC_CLR_GEN_CALL");
        IC_CLR_GEN_CALL.configure(this, null, "");
        IC_CLR_GEN_CALL.build();
        default_map.add_reg(IC_CLR_GEN_CALL, 'h68, "RW");
        IC_CLR_GEN_CALL.add_hdl_path_slice("IC_CLR_GEN_CALL", 0, 32, 0);

        IC_ENABLE = IC_ENABLE_reg::type_id::create("IC_ENABLE");
        IC_ENABLE.configure(this, null, "");
        IC_ENABLE.build();
        default_map.add_reg(IC_ENABLE, 'h6C, "RW");
        IC_ENABLE.add_hdl_path_slice("IC_ENABLE", 0, 32, 0);

        IC_STATUS = IC_STATUS_reg::type_id::create("IC_STATUS");
        IC_STATUS.configure(this, null, "");
        IC_STATUS.build();
        default_map.add_reg(IC_STATUS, 'h70, "RO");
        IC_STATUS.add_hdl_path_slice("IC_STATUS", 0, 32, 0);

        IC_TXFLR = IC_TXFLR_reg::type_id::create("IC_TXFLR");
        IC_TXFLR.configure(this, null, "");
        IC_TXFLR.build();
        default_map.add_reg(IC_TXFLR, 'h74, "RO");
        IC_TXFLR.add_hdl_path_slice("IC_TXFLR", 0, 32, 0);

        IC_RXFLR = IC_RXFLR_reg::type_id::create("IC_RXFLR");
        IC_RXFLR.configure(this, null, "");
        IC_RXFLR.build();
        default_map.add_reg(IC_RXFLR, 'h78, "RO");
        IC_RXFLR.add_hdl_path_slice("IC_RXFLR", 0, 32, 0);

        IC_SDA_HOLD = IC_SDA_HOLD_reg::type_id::create("IC_SDA_HOLD");
        IC_SDA_HOLD.configure(this, null, "");
        IC_SDA_HOLD.build();
        default_map.add_reg(IC_SDA_HOLD, 'h7C, "RW");
        IC_SDA_HOLD.add_hdl_path_slice("IC_SDA_HOLD", 0, 32, 0);

        IC_TX_ABRT_SOURCE = IC_TX_ABRT_SOURCE_reg::type_id::create("IC_TX_ABRT_SOURCE");
        IC_TX_ABRT_SOURCE.configure(this, null, "");
        IC_TX_ABRT_SOURCE.build();
        default_map.add_reg(IC_TX_ABRT_SOURCE, 'h80, "RO");
        IC_TX_ABRT_SOURCE.add_hdl_path_slice("IC_TX_ABRT_SOURCE", 0, 32, 0);

        IC_SLV_DATA_NACK_ONLY = IC_SLV_DATA_NACK_ONLY_reg::type_id::create("IC_SLV_DATA_NACK_ONLY");
        IC_SLV_DATA_NACK_ONLY.configure(this, null, "");
        IC_SLV_DATA_NACK_ONLY.build();
        default_map.add_reg(IC_SLV_DATA_NACK_ONLY, 'h84, "RW");
        IC_SLV_DATA_NACK_ONLY.add_hdl_path_slice("IC_SLV_DATA_NACK_ONLY", 0, 32, 0);

        IC_DMA_CR = IC_DMA_CR_reg::type_id::create("IC_DMA_CR");
        IC_DMA_CR.configure(this, null, "");
        IC_DMA_CR.build();
        default_map.add_reg(IC_DMA_CR, 'h88, "RW");
        IC_DMA_CR.add_hdl_path_slice("IC_DMA_CR", 0, 32, 0);

        IC_DMA_TDLR = IC_DMA_TDLR_reg::type_id::create("IC_DMA_TDLR");
        IC_DMA_TDLR.configure(this, null, "");
        IC_DMA_TDLR.build();
        default_map.add_reg(IC_DMA_TDLR, 'h8C, "RW");
        IC_DMA_TDLR.add_hdl_path_slice("IC_DMA_TDLR", 0, 32, 0);

        IC_DMA_RDLR = IC_DMA_RDLR_reg::type_id::create("IC_DMA_RDLR");
        IC_DMA_RDLR.configure(this, null, "");
        IC_DMA_RDLR.build();
        default_map.add_reg(IC_DMA_RDLR, 'h90, "RW");
        IC_DMA_RDLR.add_hdl_path_slice("IC_DMA_RDLR", 0, 32, 0);

        IC_SDA_SETUP = IC_SDA_SETUP_reg::type_id::create("IC_SDA_SETUP");
        IC_SDA_SETUP.configure(this, null, "");
        IC_SDA_SETUP.build();
        default_map.add_reg(IC_SDA_SETUP, 'h94, "RW");
        IC_SDA_SETUP.add_hdl_path_slice("IC_SDA_SETUP", 0, 32, 0);

        IC_ACK_GENERAL_CALL = IC_ACK_GENERAL_CALL_reg::type_id::create("IC_ACK_GENERAL_CALL");
        IC_ACK_GENERAL_CALL.configure(this, null, "");
        IC_ACK_GENERAL_CALL.build();
        default_map.add_reg(IC_ACK_GENERAL_CALL, 'h98, "RW");
        IC_ACK_GENERAL_CALL.add_hdl_path_slice("IC_ACK_GENERAL_CALL", 0, 32, 0);

        IC_ENABLE_STATUS = IC_ENABLE_STATUS_reg::type_id::create("IC_ENABLE_STATUS");
        IC_ENABLE_STATUS.configure(this, null, "");
        IC_ENABLE_STATUS.build();
        default_map.add_reg(IC_ENABLE_STATUS, 'h9C, "RO");
        IC_ENABLE_STATUS.add_hdl_path_slice("IC_ENABLE_STATUS", 0, 32, 0);

        IC_FS_SPKLEN = IC_FS_SPKLEN_reg::type_id::create("IC_FS_SPKLEN");
        IC_FS_SPKLEN.configure(this, null, "");
        IC_FS_SPKLEN.build();
        default_map.add_reg(IC_FS_SPKLEN, 'hA0, "RW");
        IC_FS_SPKLEN.add_hdl_path_slice("IC_FS_SPKLEN", 0, 32, 0);

        IC_HS_SPKLEN = IC_HS_SPKLEN_reg::type_id::create("IC_HS_SPKLEN");
        IC_HS_SPKLEN.configure(this, null, "");
        IC_HS_SPKLEN.build();
        default_map.add_reg(IC_HS_SPKLEN, 'hA4, "RW");
        IC_HS_SPKLEN.add_hdl_path_slice("IC_HS_SPKLEN", 0, 32, 0);

        IC_CLR_RESTART_DET = IC_CLR_RESTART_DET_reg::type_id::create("IC_CLR_RESTART_DET");
        IC_CLR_RESTART_DET.configure(this, null, "");
        IC_CLR_RESTART_DET.build();
        default_map.add_reg(IC_CLR_RESTART_DET, 'hA8, "RW");
        IC_CLR_RESTART_DET.add_hdl_path_slice("IC_CLR_RESTART_DET", 0, 32, 0);

        IC_SCL_STUCK_AT_LOW_TIMEOUT = IC_SCL_STUCK_AT_LOW_TIMEOUT_reg::type_id::create("IC_SCL_STUCK_AT_LOW_TIMEOUT");
        IC_SCL_STUCK_AT_LOW_TIMEOUT.configure(this, null, "");
        IC_SCL_STUCK_AT_LOW_TIMEOUT.build();
        default_map.add_reg(IC_SCL_STUCK_AT_LOW_TIMEOUT, 'hAC, "RW");
        IC_SCL_STUCK_AT_LOW_TIMEOUT.add_hdl_path_slice("IC_SCL_STUCK_AT_LOW_TIMEOUT", 0, 32, 0);

        IC_SDA_STUCK_AT_LOW_TIMEOUT = IC_SDA_STUCK_AT_LOW_TIMEOUT_reg::type_id::create("IC_SDA_STUCK_AT_LOW_TIMEOUT");
        IC_SDA_STUCK_AT_LOW_TIMEOUT.configure(this, null, "");
        IC_SDA_STUCK_AT_LOW_TIMEOUT.build();
        default_map.add_reg(IC_SDA_STUCK_AT_LOW_TIMEOUT, 'hB0, "RW");
        IC_SDA_STUCK_AT_LOW_TIMEOUT.add_hdl_path_slice("IC_SDA_STUCK_AT_LOW_TIMEOUT", 0, 32, 0);

        IC_CLR_SCL_STUCK_DET = IC_CLR_SCL_STUCK_DET_reg::type_id::create("IC_CLR_SCL_STUCK_DET");
        IC_CLR_SCL_STUCK_DET.configure(this, null, "");
        IC_CLR_SCL_STUCK_DET.build();
        default_map.add_reg(IC_CLR_SCL_STUCK_DET, 'hB4, "RW");
        IC_CLR_SCL_STUCK_DET.add_hdl_path_slice("IC_CLR_SCL_STUCK_DET", 0, 32, 0);

        IC_DEVICE_ID = IC_DEVICE_ID_reg::type_id::create("IC_DEVICE_ID");
        IC_DEVICE_ID.configure(this, null, "");
        IC_DEVICE_ID.build();
        default_map.add_reg(IC_DEVICE_ID, 'hB8, "RO");
        IC_DEVICE_ID.add_hdl_path_slice("IC_DEVICE_ID", 0, 32, 0);

        IC_SMBUS_CLK_LOW_SEXT = IC_SMBUS_CLK_LOW_SEXT_reg::type_id::create("IC_SMBUS_CLK_LOW_SEXT");
        IC_SMBUS_CLK_LOW_SEXT.configure(this, null, "");
        IC_SMBUS_CLK_LOW_SEXT.build();
        default_map.add_reg(IC_SMBUS_CLK_LOW_SEXT, 'hBC, "RW");
        IC_SMBUS_CLK_LOW_SEXT.add_hdl_path_slice("IC_SMBUS_CLK_LOW_SEXT", 0, 32, 0);

        IC_SMBUS_CLK_LOW_MEXT = IC_SMBUS_CLK_LOW_MEXT_reg::type_id::create("IC_SMBUS_CLK_LOW_MEXT");
        IC_SMBUS_CLK_LOW_MEXT.configure(this, null, "");
        IC_SMBUS_CLK_LOW_MEXT.build();
        default_map.add_reg(IC_SMBUS_CLK_LOW_MEXT, 'hC0, "RW");
        IC_SMBUS_CLK_LOW_MEXT.add_hdl_path_slice("IC_SMBUS_CLK_LOW_MEXT", 0, 32, 0);

        IC_SMBUS_THIGH_MAX_IDLE_COUNT = IC_SMBUS_THIGH_MAX_IDLE_COUNT_reg::type_id::create("IC_SMBUS_THIGH_MAX_IDLE_COUNT");
        IC_SMBUS_THIGH_MAX_IDLE_COUNT.configure(this, null, "");
        IC_SMBUS_THIGH_MAX_IDLE_COUNT.build();
        default_map.add_reg(IC_SMBUS_THIGH_MAX_IDLE_COUNT, 'hC4, "RW");
        IC_SMBUS_THIGH_MAX_IDLE_COUNT.add_hdl_path_slice("IC_SMBUS_THIGH_MAX_IDLE_COUNT", 0, 32, 0);

        IC_SMBUS_INTR_STAT = IC_SMBUS_INTR_STAT_reg::type_id::create("IC_SMBUS_INTR_STAT");
        IC_SMBUS_INTR_STAT.configure(this, null, "");
        IC_SMBUS_INTR_STAT.build();
        default_map.add_reg(IC_SMBUS_INTR_STAT, 'hC8, "RO");
        IC_SMBUS_INTR_STAT.add_hdl_path_slice("IC_SMBUS_INTR_STAT", 0, 32, 0);

        IC_SMBUS_INTR_MASK = IC_SMBUS_INTR_MASK_reg::type_id::create("IC_SMBUS_INTR_MASK");
        IC_SMBUS_INTR_MASK.configure(this, null, "");
        IC_SMBUS_INTR_MASK.build();
        default_map.add_reg(IC_SMBUS_INTR_MASK, 'hCC, "RW");
        IC_SMBUS_INTR_MASK.add_hdl_path_slice("IC_SMBUS_INTR_MASK", 0, 32, 0);

        IC_SMBUS_RAW_INTR_STAT = IC_SMBUS_RAW_INTR_STAT_reg::type_id::create("IC_SMBUS_RAW_INTR_STAT");
        IC_SMBUS_RAW_INTR_STAT.configure(this, null, "");
        IC_SMBUS_RAW_INTR_STAT.build();
        default_map.add_reg(IC_SMBUS_RAW_INTR_STAT, 'hD0, "RO");
        IC_SMBUS_RAW_INTR_STAT.add_hdl_path_slice("IC_SMBUS_RAW_INTR_STAT", 0, 32, 0);

        IC_CLR_SMBUS_INTR = IC_CLR_SMBUS_INTR_reg::type_id::create("IC_CLR_SMBUS_INTR");
        IC_CLR_SMBUS_INTR.configure(this, null, "");
        IC_CLR_SMBUS_INTR.build();
        default_map.add_reg(IC_CLR_SMBUS_INTR, 'hD4, "RW");
        IC_CLR_SMBUS_INTR.add_hdl_path_slice("IC_CLR_SMBUS_INTR", 0, 32, 0);

        IC_OPTIONAL_SAR = IC_OPTIONAL_SAR_reg::type_id::create("IC_OPTIONAL_SAR");
        IC_OPTIONAL_SAR.configure(this, null, "");
        IC_OPTIONAL_SAR.build();
        default_map.add_reg(IC_OPTIONAL_SAR, 'hD8, "RW");
        IC_OPTIONAL_SAR.add_hdl_path_slice("IC_OPTIONAL_SAR", 0, 32, 0);

        IC_SMBUS_UDID_LSB = IC_SMBUS_UDID_LSB_reg::type_id::create("IC_SMBUS_UDID_LSB");
        IC_SMBUS_UDID_LSB.configure(this, null, "");
        IC_SMBUS_UDID_LSB.build();
        default_map.add_reg(IC_SMBUS_UDID_LSB, 'hDC, "RW");
        IC_SMBUS_UDID_LSB.add_hdl_path_slice("IC_SMBUS_UDID_LSB", 0, 32, 0);

        IC_SMBUS_UDID_WORD1 = IC_SMBUS_UDID_WORD1_reg::type_id::create("IC_SMBUS_UDID_WORD1");
        IC_SMBUS_UDID_WORD1.configure(this, null, "");
        IC_SMBUS_UDID_WORD1.build();
        default_map.add_reg(IC_SMBUS_UDID_WORD1, 'hE0, "RW");
        IC_SMBUS_UDID_WORD1.add_hdl_path_slice("IC_SMBUS_UDID_WORD1", 0, 32, 0);

        IC_SMBUS_UDID_WORD2 = IC_SMBUS_UDID_WORD2_reg::type_id::create("IC_SMBUS_UDID_WORD2");
        IC_SMBUS_UDID_WORD2.configure(this, null, "");
        IC_SMBUS_UDID_WORD2.build();
        default_map.add_reg(IC_SMBUS_UDID_WORD2, 'hE4, "RW");
        IC_SMBUS_UDID_WORD2.add_hdl_path_slice("IC_SMBUS_UDID_WORD2", 0, 32, 0);

        IC_COMP_PARAM_1 = IC_COMP_PARAM_1_reg::type_id::create("IC_COMP_PARAM_1");
        IC_COMP_PARAM_1.configure(this, null, "");
        IC_COMP_PARAM_1.build();
        default_map.add_reg(IC_COMP_PARAM_1, 'hF4, "RO");
        IC_COMP_PARAM_1.add_hdl_path_slice("IC_COMP_PARAM_1", 0, 32, 0);

        IC_COMP_VERSION = IC_COMP_VERSION_reg::type_id::create("IC_COMP_VERSION");
        IC_COMP_VERSION.configure(this, null, "");
        IC_COMP_VERSION.build();
        default_map.add_reg(IC_COMP_VERSION, 'hF8, "RO");
        IC_COMP_VERSION.add_hdl_path_slice("IC_COMP_VERSION", 0, 32, 0);

        IC_COMP_TYPE = IC_COMP_TYPE_reg::type_id::create("IC_COMP_TYPE");
        IC_COMP_TYPE.configure(this, null, "");
        IC_COMP_TYPE.build();
        default_map.add_reg(IC_COMP_TYPE, 'hFC, "RO");
        IC_COMP_TYPE.add_hdl_path_slice("IC_COMP_TYPE", 0, 32, 0);

        lock_model();
    endfunction

endclass : i2c_reg_block

`endif // _I2C_REG_BLOCK_SV_
