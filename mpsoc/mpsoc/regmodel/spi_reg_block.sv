`ifndef _SPI_REG_BLOCK_SV_
`define _SPI_REG_BLOCK_SV_

//=========================================================================
// spi_reg_block: SPI Master (DW_apb_ssi v4.04a), 0x40031000
//   自动生成, 共 28 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class spi_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // CTRLR0  (0x0, 32-bit, RW) Control Register 0
    //---------------------------------------------------------------------
    class CTRLR0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTRLR0_reg)

        function new(string name="CTRLR0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CTRLR0_reg

    //---------------------------------------------------------------------
    // CTRLR1  (0x4, 32-bit, RW) Control Register 1
    //---------------------------------------------------------------------
    class CTRLR1_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTRLR1_reg)

        function new(string name="CTRLR1_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CTRLR1_reg

    //---------------------------------------------------------------------
    // SSIENR  (0x8, 32-bit, RW) SSI Enable Register
    //---------------------------------------------------------------------
    class SSIENR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSIENR_reg)

        function new(string name="SSIENR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSIENR_reg

    //---------------------------------------------------------------------
    // MWCR  (0xC, 32-bit, RW) Microwire Control Register
    //---------------------------------------------------------------------
    class MWCR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MWCR_reg)

        function new(string name="MWCR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MWCR_reg

    //---------------------------------------------------------------------
    // SER  (0x10, 32-bit, RW) Target Enable Register
    //---------------------------------------------------------------------
    class SER_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SER_reg)

        function new(string name="SER_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SER_reg

    //---------------------------------------------------------------------
    // BAUDR  (0x14, 32-bit, RW) Baud Rate Select
    //---------------------------------------------------------------------
    class BAUDR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(BAUDR_reg)

        function new(string name="BAUDR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : BAUDR_reg

    //---------------------------------------------------------------------
    // TXFTLR  (0x18, 32-bit, RW) Transmit FIFO Threshold Level
    //---------------------------------------------------------------------
    class TXFTLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TXFTLR_reg)

        function new(string name="TXFTLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TXFTLR_reg

    //---------------------------------------------------------------------
    // RXFTLR  (0x1C, 32-bit, RW) Receive FIFO Threshold Level
    //---------------------------------------------------------------------
    class RXFTLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RXFTLR_reg)

        function new(string name="RXFTLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RXFTLR_reg

    //---------------------------------------------------------------------
    // TXFLR  (0x20, 32-bit, RO) Transmit FIFO Level Register
    //---------------------------------------------------------------------
    class TXFLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TXFLR_reg)

        function new(string name="TXFLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TXFLR_reg

    //---------------------------------------------------------------------
    // RXFLR  (0x24, 32-bit, RO) Receive FIFO Level Register
    //---------------------------------------------------------------------
    class RXFLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RXFLR_reg)

        function new(string name="RXFLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RXFLR_reg

    //---------------------------------------------------------------------
    // SR  (0x28, 32-bit, RO) Status Register
    //---------------------------------------------------------------------
    class SR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SR_reg)

        function new(string name="SR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SR_reg

    //---------------------------------------------------------------------
    // IMR  (0x2C, 32-bit, RW) Interrupt Mask Register
    //---------------------------------------------------------------------
    class IMR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IMR_reg)

        function new(string name="IMR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IMR_reg

    //---------------------------------------------------------------------
    // ISR  (0x30, 32-bit, RO) Interrupt Status Register
    //---------------------------------------------------------------------
    class ISR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ISR_reg)

        function new(string name="ISR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ISR_reg

    //---------------------------------------------------------------------
    // RISR  (0x34, 32-bit, RO) Raw Interrupt Status Register
    //---------------------------------------------------------------------
    class RISR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RISR_reg)

        function new(string name="RISR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RISR_reg

    //---------------------------------------------------------------------
    // TXOICR  (0x38, 32-bit, RW) Transmit FIFO Overflow Interrupt Clear
    //---------------------------------------------------------------------
    class TXOICR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TXOICR_reg)

        function new(string name="TXOICR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TXOICR_reg

    //---------------------------------------------------------------------
    // RXOICR  (0x3C, 32-bit, RW) Receive FIFO Overflow Interrupt Clear
    //---------------------------------------------------------------------
    class RXOICR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RXOICR_reg)

        function new(string name="RXOICR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RXOICR_reg

    //---------------------------------------------------------------------
    // RXUICR  (0x40, 32-bit, RW) Receive FIFO Underflow Interrupt Clear
    //---------------------------------------------------------------------
    class RXUICR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RXUICR_reg)

        function new(string name="RXUICR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RXUICR_reg

    //---------------------------------------------------------------------
    // MSTICR  (0x44, 32-bit, RW) Multi-Controller Interrupt Clear
    //---------------------------------------------------------------------
    class MSTICR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MSTICR_reg)

        function new(string name="MSTICR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MSTICR_reg

    //---------------------------------------------------------------------
    // ICR  (0x48, 32-bit, RW) Interrupt Clear Register
    //---------------------------------------------------------------------
    class ICR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(ICR_reg)

        function new(string name="ICR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : ICR_reg

    //---------------------------------------------------------------------
    // DMACR  (0x4C, 32-bit, RW) DMA Control Register
    //---------------------------------------------------------------------
    class DMACR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMACR_reg)

        function new(string name="DMACR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMACR_reg

    //---------------------------------------------------------------------
    // DMATDLR  (0x50, 32-bit, RW) DMA Transmit Data Level
    //---------------------------------------------------------------------
    class DMATDLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMATDLR_reg)

        function new(string name="DMATDLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMATDLR_reg

    //---------------------------------------------------------------------
    // DMARDLR  (0x54, 32-bit, RW) DMA Receive Data Level
    //---------------------------------------------------------------------
    class DMARDLR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMARDLR_reg)

        function new(string name="DMARDLR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMARDLR_reg

    //---------------------------------------------------------------------
    // IDR  (0x58, 32-bit, RO) Identification Register
    //---------------------------------------------------------------------
    class IDR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IDR_reg)

        function new(string name="IDR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IDR_reg

    //---------------------------------------------------------------------
    // SSI_VERSION_ID  (0x5C, 32-bit, RO) coreKit version ID Register
    //---------------------------------------------------------------------
    class SSI_VERSION_ID_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SSI_VERSION_ID_reg)

        function new(string name="SSI_VERSION_ID_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SSI_VERSION_ID_reg

    //---------------------------------------------------------------------
    // DR  (0x60, 32-bit, RW) Data Register (36 locations 0x60..0xEC)
    //---------------------------------------------------------------------
    class DR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DR_reg)

        function new(string name="DR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DR_reg

    //---------------------------------------------------------------------
    // RX_SAMPLE_DLY  (0xF0, 32-bit, RW) RX Sample Delay Register
    //---------------------------------------------------------------------
    class RX_SAMPLE_DLY_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RX_SAMPLE_DLY_reg)

        function new(string name="RX_SAMPLE_DLY_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RX_SAMPLE_DLY_reg

    //---------------------------------------------------------------------
    // SPI_CTRLR0  (0xF4, 32-bit, RW) SPI Control Register
    //---------------------------------------------------------------------
    class SPI_CTRLR0_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SPI_CTRLR0_reg)

        function new(string name="SPI_CTRLR0_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SPI_CTRLR0_reg

    //---------------------------------------------------------------------
    // TXD_DRIVE_EDGE  (0xF8, 32-bit, RW) Transmit Drive Edge Register
    //---------------------------------------------------------------------
    class TXD_DRIVE_EDGE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TXD_DRIVE_EDGE_reg)

        function new(string name="TXD_DRIVE_EDGE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TXD_DRIVE_EDGE_reg

    rand CTRLR0_reg CTRLR0;
    rand CTRLR1_reg CTRLR1;
    rand SSIENR_reg SSIENR;
    rand MWCR_reg MWCR;
    rand SER_reg SER;
    rand BAUDR_reg BAUDR;
    rand TXFTLR_reg TXFTLR;
    rand RXFTLR_reg RXFTLR;
    rand TXFLR_reg TXFLR;
    rand RXFLR_reg RXFLR;
    rand SR_reg SR;
    rand IMR_reg IMR;
    rand ISR_reg ISR;
    rand RISR_reg RISR;
    rand TXOICR_reg TXOICR;
    rand RXOICR_reg RXOICR;
    rand RXUICR_reg RXUICR;
    rand MSTICR_reg MSTICR;
    rand ICR_reg ICR;
    rand DMACR_reg DMACR;
    rand DMATDLR_reg DMATDLR;
    rand DMARDLR_reg DMARDLR;
    rand IDR_reg IDR;
    rand SSI_VERSION_ID_reg SSI_VERSION_ID;
    rand DR_reg DR;
    rand RX_SAMPLE_DLY_reg RX_SAMPLE_DLY;
    rand SPI_CTRLR0_reg SPI_CTRLR0;
    rand TXD_DRIVE_EDGE_reg TXD_DRIVE_EDGE;

    `uvm_object_utils(spi_reg_block)

    function new(string name="spi_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        CTRLR0 = CTRLR0_reg::type_id::create("CTRLR0");
        CTRLR0.configure(this, null, "");
        CTRLR0.build();
        default_map.add_reg(CTRLR0, 'h0, "RW");
        CTRLR0.add_hdl_path_slice("CTRLR0", 0, 32, 0);

        CTRLR1 = CTRLR1_reg::type_id::create("CTRLR1");
        CTRLR1.configure(this, null, "");
        CTRLR1.build();
        default_map.add_reg(CTRLR1, 'h4, "RW");
        CTRLR1.add_hdl_path_slice("CTRLR1", 0, 32, 0);

        SSIENR = SSIENR_reg::type_id::create("SSIENR");
        SSIENR.configure(this, null, "");
        SSIENR.build();
        default_map.add_reg(SSIENR, 'h8, "RW");
        SSIENR.add_hdl_path_slice("SSIENR", 0, 32, 0);

        MWCR = MWCR_reg::type_id::create("MWCR");
        MWCR.configure(this, null, "");
        MWCR.build();
        default_map.add_reg(MWCR, 'hC, "RW");
        MWCR.add_hdl_path_slice("MWCR", 0, 32, 0);

        SER = SER_reg::type_id::create("SER");
        SER.configure(this, null, "");
        SER.build();
        default_map.add_reg(SER, 'h10, "RW");
        SER.add_hdl_path_slice("SER", 0, 32, 0);

        BAUDR = BAUDR_reg::type_id::create("BAUDR");
        BAUDR.configure(this, null, "");
        BAUDR.build();
        default_map.add_reg(BAUDR, 'h14, "RW");
        BAUDR.add_hdl_path_slice("BAUDR", 0, 32, 0);

        TXFTLR = TXFTLR_reg::type_id::create("TXFTLR");
        TXFTLR.configure(this, null, "");
        TXFTLR.build();
        default_map.add_reg(TXFTLR, 'h18, "RW");
        TXFTLR.add_hdl_path_slice("TXFTLR", 0, 32, 0);

        RXFTLR = RXFTLR_reg::type_id::create("RXFTLR");
        RXFTLR.configure(this, null, "");
        RXFTLR.build();
        default_map.add_reg(RXFTLR, 'h1C, "RW");
        RXFTLR.add_hdl_path_slice("RXFTLR", 0, 32, 0);

        TXFLR = TXFLR_reg::type_id::create("TXFLR");
        TXFLR.configure(this, null, "");
        TXFLR.build();
        default_map.add_reg(TXFLR, 'h20, "RO");
        TXFLR.add_hdl_path_slice("TXFLR", 0, 32, 0);

        RXFLR = RXFLR_reg::type_id::create("RXFLR");
        RXFLR.configure(this, null, "");
        RXFLR.build();
        default_map.add_reg(RXFLR, 'h24, "RO");
        RXFLR.add_hdl_path_slice("RXFLR", 0, 32, 0);

        SR = SR_reg::type_id::create("SR");
        SR.configure(this, null, "");
        SR.build();
        default_map.add_reg(SR, 'h28, "RO");
        SR.add_hdl_path_slice("SR", 0, 32, 0);

        IMR = IMR_reg::type_id::create("IMR");
        IMR.configure(this, null, "");
        IMR.build();
        default_map.add_reg(IMR, 'h2C, "RW");
        IMR.add_hdl_path_slice("IMR", 0, 32, 0);

        ISR = ISR_reg::type_id::create("ISR");
        ISR.configure(this, null, "");
        ISR.build();
        default_map.add_reg(ISR, 'h30, "RO");
        ISR.add_hdl_path_slice("ISR", 0, 32, 0);

        RISR = RISR_reg::type_id::create("RISR");
        RISR.configure(this, null, "");
        RISR.build();
        default_map.add_reg(RISR, 'h34, "RO");
        RISR.add_hdl_path_slice("RISR", 0, 32, 0);

        TXOICR = TXOICR_reg::type_id::create("TXOICR");
        TXOICR.configure(this, null, "");
        TXOICR.build();
        default_map.add_reg(TXOICR, 'h38, "RW");
        TXOICR.add_hdl_path_slice("TXOICR", 0, 32, 0);

        RXOICR = RXOICR_reg::type_id::create("RXOICR");
        RXOICR.configure(this, null, "");
        RXOICR.build();
        default_map.add_reg(RXOICR, 'h3C, "RW");
        RXOICR.add_hdl_path_slice("RXOICR", 0, 32, 0);

        RXUICR = RXUICR_reg::type_id::create("RXUICR");
        RXUICR.configure(this, null, "");
        RXUICR.build();
        default_map.add_reg(RXUICR, 'h40, "RW");
        RXUICR.add_hdl_path_slice("RXUICR", 0, 32, 0);

        MSTICR = MSTICR_reg::type_id::create("MSTICR");
        MSTICR.configure(this, null, "");
        MSTICR.build();
        default_map.add_reg(MSTICR, 'h44, "RW");
        MSTICR.add_hdl_path_slice("MSTICR", 0, 32, 0);

        ICR = ICR_reg::type_id::create("ICR");
        ICR.configure(this, null, "");
        ICR.build();
        default_map.add_reg(ICR, 'h48, "RW");
        ICR.add_hdl_path_slice("ICR", 0, 32, 0);

        DMACR = DMACR_reg::type_id::create("DMACR");
        DMACR.configure(this, null, "");
        DMACR.build();
        default_map.add_reg(DMACR, 'h4C, "RW");
        DMACR.add_hdl_path_slice("DMACR", 0, 32, 0);

        DMATDLR = DMATDLR_reg::type_id::create("DMATDLR");
        DMATDLR.configure(this, null, "");
        DMATDLR.build();
        default_map.add_reg(DMATDLR, 'h50, "RW");
        DMATDLR.add_hdl_path_slice("DMATDLR", 0, 32, 0);

        DMARDLR = DMARDLR_reg::type_id::create("DMARDLR");
        DMARDLR.configure(this, null, "");
        DMARDLR.build();
        default_map.add_reg(DMARDLR, 'h54, "RW");
        DMARDLR.add_hdl_path_slice("DMARDLR", 0, 32, 0);

        IDR = IDR_reg::type_id::create("IDR");
        IDR.configure(this, null, "");
        IDR.build();
        default_map.add_reg(IDR, 'h58, "RO");
        IDR.add_hdl_path_slice("IDR", 0, 32, 0);

        SSI_VERSION_ID = SSI_VERSION_ID_reg::type_id::create("SSI_VERSION_ID");
        SSI_VERSION_ID.configure(this, null, "");
        SSI_VERSION_ID.build();
        default_map.add_reg(SSI_VERSION_ID, 'h5C, "RO");
        SSI_VERSION_ID.add_hdl_path_slice("SSI_VERSION_ID", 0, 32, 0);

        DR = DR_reg::type_id::create("DR");
        DR.configure(this, null, "");
        DR.build();
        default_map.add_reg(DR, 'h60, "RW");
        DR.add_hdl_path_slice("DR", 0, 32, 0);

        RX_SAMPLE_DLY = RX_SAMPLE_DLY_reg::type_id::create("RX_SAMPLE_DLY");
        RX_SAMPLE_DLY.configure(this, null, "");
        RX_SAMPLE_DLY.build();
        default_map.add_reg(RX_SAMPLE_DLY, 'hF0, "RW");
        RX_SAMPLE_DLY.add_hdl_path_slice("RX_SAMPLE_DLY", 0, 32, 0);

        SPI_CTRLR0 = SPI_CTRLR0_reg::type_id::create("SPI_CTRLR0");
        SPI_CTRLR0.configure(this, null, "");
        SPI_CTRLR0.build();
        default_map.add_reg(SPI_CTRLR0, 'hF4, "RW");
        SPI_CTRLR0.add_hdl_path_slice("SPI_CTRLR0", 0, 32, 0);

        TXD_DRIVE_EDGE = TXD_DRIVE_EDGE_reg::type_id::create("TXD_DRIVE_EDGE");
        TXD_DRIVE_EDGE.configure(this, null, "");
        TXD_DRIVE_EDGE.build();
        default_map.add_reg(TXD_DRIVE_EDGE, 'hF8, "RW");
        TXD_DRIVE_EDGE.add_hdl_path_slice("TXD_DRIVE_EDGE", 0, 32, 0);

        lock_model();
    endfunction

endclass : spi_reg_block

`endif // _SPI_REG_BLOCK_SV_
