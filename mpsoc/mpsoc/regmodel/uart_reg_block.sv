`ifndef _UART_REG_BLOCK_SV_
`define _UART_REG_BLOCK_SV_

//=========================================================================
// uart_reg_block: UART (DW_apb_uart v4.04a, 16550), 3 实例
//   自动生成, 共 40 个寄存器, 单 DATA 字段(与 esc_reg_block 一致)。
//   访问属性为简化标注: 依据寄存器名启发式区分 RW/RO。
//   复位值统一按 0 建模(数据手册个别寄存器有非零复位值, 未逐一标注)。
//   后门访问 hierarchical path: 每寄存器 add_hdl_path_slice("<id>",0,<width>),
//   相对根路径由测试用例 set_hdl_path_root() 设置(RTL 就绪后按实际 DUT 层级调整)。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class uart_reg_block extends uvm_reg_block;

    //---------------------------------------------------------------------
    // RBR  (0x0, 32-bit, RO) Receive Buffer Register (DLAB=0)
    //---------------------------------------------------------------------
    class RBR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RBR_reg)

        function new(string name="RBR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RBR_reg

    //---------------------------------------------------------------------
    // IER  (0x4, 32-bit, RW) Interrupt Enable Register (DLAB=0)
    //---------------------------------------------------------------------
    class IER_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IER_reg)

        function new(string name="IER_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IER_reg

    //---------------------------------------------------------------------
    // IIR  (0x8, 32-bit, RO) Interrupt Identification Register
    //---------------------------------------------------------------------
    class IIR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(IIR_reg)

        function new(string name="IIR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : IIR_reg

    //---------------------------------------------------------------------
    // LCR  (0xC, 32-bit, RW) Line Control Register
    //---------------------------------------------------------------------
    class LCR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LCR_reg)

        function new(string name="LCR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : LCR_reg

    //---------------------------------------------------------------------
    // MCR  (0x10, 32-bit, RW) Modem Control Register
    //---------------------------------------------------------------------
    class MCR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MCR_reg)

        function new(string name="MCR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MCR_reg

    //---------------------------------------------------------------------
    // LSR  (0x14, 32-bit, RO) Line Status Register
    //---------------------------------------------------------------------
    class LSR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LSR_reg)

        function new(string name="LSR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : LSR_reg

    //---------------------------------------------------------------------
    // MSR  (0x18, 32-bit, RO) Modem Status Register
    //---------------------------------------------------------------------
    class MSR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(MSR_reg)

        function new(string name="MSR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : MSR_reg

    //---------------------------------------------------------------------
    // SCR  (0x1C, 32-bit, RW) Scratchpad Register
    //---------------------------------------------------------------------
    class SCR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SCR_reg)

        function new(string name="SCR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SCR_reg

    //---------------------------------------------------------------------
    // LPDLL  (0x20, 32-bit, RW) Low Power Divisor Latch Low
    //---------------------------------------------------------------------
    class LPDLL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LPDLL_reg)

        function new(string name="LPDLL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : LPDLL_reg

    //---------------------------------------------------------------------
    // LPDLH  (0x24, 32-bit, RW) Low Power Divisor Latch High
    //---------------------------------------------------------------------
    class LPDLH_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LPDLH_reg)

        function new(string name="LPDLH_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : LPDLH_reg

    //---------------------------------------------------------------------
    // SRBR  (0x30, 32-bit, RO) Shadow Receive Buffer Register
    //---------------------------------------------------------------------
    class SRBR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SRBR_reg)

        function new(string name="SRBR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SRBR_reg

    //---------------------------------------------------------------------
    // FAR  (0x70, 32-bit, RW) FIFO Access Register
    //---------------------------------------------------------------------
    class FAR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(FAR_reg)

        function new(string name="FAR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : FAR_reg

    //---------------------------------------------------------------------
    // TFR  (0x74, 32-bit, RO) Transmit FIFO Read
    //---------------------------------------------------------------------
    class TFR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TFR_reg)

        function new(string name="TFR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TFR_reg

    //---------------------------------------------------------------------
    // RFW  (0x78, 32-bit, RW) Receive FIFO Write
    //---------------------------------------------------------------------
    class RFW_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RFW_reg)

        function new(string name="RFW_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RFW_reg

    //---------------------------------------------------------------------
    // USR  (0x7C, 32-bit, RO) UART Status register
    //---------------------------------------------------------------------
    class USR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(USR_reg)

        function new(string name="USR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : USR_reg

    //---------------------------------------------------------------------
    // TFL  (0x80, 32-bit, RO) Transmit FIFO Level
    //---------------------------------------------------------------------
    class TFL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TFL_reg)

        function new(string name="TFL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TFL_reg

    //---------------------------------------------------------------------
    // RFL  (0x84, 32-bit, RO) Receive FIFO Level
    //---------------------------------------------------------------------
    class RFL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RFL_reg)

        function new(string name="RFL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RFL_reg

    //---------------------------------------------------------------------
    // SRR  (0x88, 32-bit, RW) Software Reset Register
    //---------------------------------------------------------------------
    class SRR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SRR_reg)

        function new(string name="SRR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SRR_reg

    //---------------------------------------------------------------------
    // SRTS  (0x8C, 32-bit, RW) Shadow Request to Send
    //---------------------------------------------------------------------
    class SRTS_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SRTS_reg)

        function new(string name="SRTS_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SRTS_reg

    //---------------------------------------------------------------------
    // SBCR  (0x90, 32-bit, RW) Shadow Break Control Register
    //---------------------------------------------------------------------
    class SBCR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SBCR_reg)

        function new(string name="SBCR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SBCR_reg

    //---------------------------------------------------------------------
    // SDMAM  (0x94, 32-bit, RW) Shadow DMA Mode Register
    //---------------------------------------------------------------------
    class SDMAM_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SDMAM_reg)

        function new(string name="SDMAM_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SDMAM_reg

    //---------------------------------------------------------------------
    // SFE  (0x98, 32-bit, RW) Shadow FIFO Enable Register
    //---------------------------------------------------------------------
    class SFE_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SFE_reg)

        function new(string name="SFE_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SFE_reg

    //---------------------------------------------------------------------
    // SRT  (0x9C, 32-bit, RW) Shadow RCVR Trigger Register
    //---------------------------------------------------------------------
    class SRT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(SRT_reg)

        function new(string name="SRT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : SRT_reg

    //---------------------------------------------------------------------
    // STET  (0xA0, 32-bit, RW) Shadow TX Empty Trigger Register
    //---------------------------------------------------------------------
    class STET_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(STET_reg)

        function new(string name="STET_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : STET_reg

    //---------------------------------------------------------------------
    // HTX  (0xA4, 32-bit, RW) Halt TX
    //---------------------------------------------------------------------
    class HTX_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(HTX_reg)

        function new(string name="HTX_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : HTX_reg

    //---------------------------------------------------------------------
    // DMASA  (0xA8, 32-bit, RW) DMA Software Acknowledge Register
    //---------------------------------------------------------------------
    class DMASA_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DMASA_reg)

        function new(string name="DMASA_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DMASA_reg

    //---------------------------------------------------------------------
    // TCR  (0xAC, 32-bit, RW) Transceiver Control Register
    //---------------------------------------------------------------------
    class TCR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TCR_reg)

        function new(string name="TCR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TCR_reg

    //---------------------------------------------------------------------
    // DE_EN  (0xB0, 32-bit, RW) Driver Output Enable Register
    //---------------------------------------------------------------------
    class DE_EN_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DE_EN_reg)

        function new(string name="DE_EN_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DE_EN_reg

    //---------------------------------------------------------------------
    // RE_EN  (0xB4, 32-bit, RW) Receiver Output Enable Register
    //---------------------------------------------------------------------
    class RE_EN_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RE_EN_reg)

        function new(string name="RE_EN_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RE_EN_reg

    //---------------------------------------------------------------------
    // DET  (0xB8, 32-bit, RW) Driver Output Enable Timing Register
    //---------------------------------------------------------------------
    class DET_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DET_reg)

        function new(string name="DET_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DET_reg

    //---------------------------------------------------------------------
    // TAT  (0xBC, 32-bit, RW) Turn Around Timing Register
    //---------------------------------------------------------------------
    class TAT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TAT_reg)

        function new(string name="TAT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TAT_reg

    //---------------------------------------------------------------------
    // DLF  (0xC0, 32-bit, RW) Divisor Latch Fraction Register
    //---------------------------------------------------------------------
    class DLF_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(DLF_reg)

        function new(string name="DLF_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : DLF_reg

    //---------------------------------------------------------------------
    // RAR  (0xC4, 32-bit, RW) Receive Address Register
    //---------------------------------------------------------------------
    class RAR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(RAR_reg)

        function new(string name="RAR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : RAR_reg

    //---------------------------------------------------------------------
    // TAR  (0xC8, 32-bit, RW) Transmit Address Register
    //---------------------------------------------------------------------
    class TAR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(TAR_reg)

        function new(string name="TAR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : TAR_reg

    //---------------------------------------------------------------------
    // LCR_EXT  (0xCC, 32-bit, RW) Line Extended Control Register
    //---------------------------------------------------------------------
    class LCR_EXT_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(LCR_EXT_reg)

        function new(string name="LCR_EXT_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : LCR_EXT_reg

    //---------------------------------------------------------------------
    // UART_PROT_LEVEL  (0xD0, 32-bit, RW) UART Protection level
    //---------------------------------------------------------------------
    class UART_PROT_LEVEL_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(UART_PROT_LEVEL_reg)

        function new(string name="UART_PROT_LEVEL_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : UART_PROT_LEVEL_reg

    //---------------------------------------------------------------------
    // REG_TIMEOUT_RST  (0xD4, 32-bit, RW) Register timeout counter reset value
    //---------------------------------------------------------------------
    class REG_TIMEOUT_RST_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(REG_TIMEOUT_RST_reg)

        function new(string name="REG_TIMEOUT_RST_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : REG_TIMEOUT_RST_reg

    //---------------------------------------------------------------------
    // CPR  (0xF4, 32-bit, RO) Component Parameter Register
    //---------------------------------------------------------------------
    class CPR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CPR_reg)

        function new(string name="CPR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CPR_reg

    //---------------------------------------------------------------------
    // UCV  (0xF8, 32-bit, RO) UART Component Version
    //---------------------------------------------------------------------
    class UCV_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(UCV_reg)

        function new(string name="UCV_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : UCV_reg

    //---------------------------------------------------------------------
    // CTR  (0xFC, 32-bit, RO) Component Type Register
    //---------------------------------------------------------------------
    class CTR_reg extends uvm_reg;

        rand uvm_reg_field DATA;

        `uvm_object_utils(CTR_reg)

        function new(string name="CTR_reg");
            super.new(name, 32, UVM_NO_COVERAGE);
        endfunction

        virtual function void build();
            DATA = uvm_reg_field::type_id::create("DATA");
            DATA.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
        endfunction

    endclass : CTR_reg

    rand RBR_reg RBR;
    rand IER_reg IER;
    rand IIR_reg IIR;
    rand LCR_reg LCR;
    rand MCR_reg MCR;
    rand LSR_reg LSR;
    rand MSR_reg MSR;
    rand SCR_reg SCR;
    rand LPDLL_reg LPDLL;
    rand LPDLH_reg LPDLH;
    rand SRBR_reg SRBR;
    rand FAR_reg FAR;
    rand TFR_reg TFR;
    rand RFW_reg RFW;
    rand USR_reg USR;
    rand TFL_reg TFL;
    rand RFL_reg RFL;
    rand SRR_reg SRR;
    rand SRTS_reg SRTS;
    rand SBCR_reg SBCR;
    rand SDMAM_reg SDMAM;
    rand SFE_reg SFE;
    rand SRT_reg SRT;
    rand STET_reg STET;
    rand HTX_reg HTX;
    rand DMASA_reg DMASA;
    rand TCR_reg TCR;
    rand DE_EN_reg DE_EN;
    rand RE_EN_reg RE_EN;
    rand DET_reg DET;
    rand TAT_reg TAT;
    rand DLF_reg DLF;
    rand RAR_reg RAR;
    rand TAR_reg TAR;
    rand LCR_EXT_reg LCR_EXT;
    rand UART_PROT_LEVEL_reg UART_PROT_LEVEL;
    rand REG_TIMEOUT_RST_reg REG_TIMEOUT_RST;
    rand CPR_reg CPR;
    rand UCV_reg UCV;
    rand CTR_reg CTR;

    `uvm_object_utils(uart_reg_block)

    function new(string name="uart_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        RBR = RBR_reg::type_id::create("RBR");
        RBR.configure(this, null, "");
        RBR.build();
        default_map.add_reg(RBR, 'h0, "RO");
        RBR.add_hdl_path_slice("RBR", 0, 32, 0);

        IER = IER_reg::type_id::create("IER");
        IER.configure(this, null, "");
        IER.build();
        default_map.add_reg(IER, 'h4, "RW");
        IER.add_hdl_path_slice("IER", 0, 32, 0);

        IIR = IIR_reg::type_id::create("IIR");
        IIR.configure(this, null, "");
        IIR.build();
        default_map.add_reg(IIR, 'h8, "RO");
        IIR.add_hdl_path_slice("IIR", 0, 32, 0);

        LCR = LCR_reg::type_id::create("LCR");
        LCR.configure(this, null, "");
        LCR.build();
        default_map.add_reg(LCR, 'hC, "RW");
        LCR.add_hdl_path_slice("LCR", 0, 32, 0);

        MCR = MCR_reg::type_id::create("MCR");
        MCR.configure(this, null, "");
        MCR.build();
        default_map.add_reg(MCR, 'h10, "RW");
        MCR.add_hdl_path_slice("MCR", 0, 32, 0);

        LSR = LSR_reg::type_id::create("LSR");
        LSR.configure(this, null, "");
        LSR.build();
        default_map.add_reg(LSR, 'h14, "RO");
        LSR.add_hdl_path_slice("LSR", 0, 32, 0);

        MSR = MSR_reg::type_id::create("MSR");
        MSR.configure(this, null, "");
        MSR.build();
        default_map.add_reg(MSR, 'h18, "RO");
        MSR.add_hdl_path_slice("MSR", 0, 32, 0);

        SCR = SCR_reg::type_id::create("SCR");
        SCR.configure(this, null, "");
        SCR.build();
        default_map.add_reg(SCR, 'h1C, "RW");
        SCR.add_hdl_path_slice("SCR", 0, 32, 0);

        LPDLL = LPDLL_reg::type_id::create("LPDLL");
        LPDLL.configure(this, null, "");
        LPDLL.build();
        default_map.add_reg(LPDLL, 'h20, "RW");
        LPDLL.add_hdl_path_slice("LPDLL", 0, 32, 0);

        LPDLH = LPDLH_reg::type_id::create("LPDLH");
        LPDLH.configure(this, null, "");
        LPDLH.build();
        default_map.add_reg(LPDLH, 'h24, "RW");
        LPDLH.add_hdl_path_slice("LPDLH", 0, 32, 0);

        SRBR = SRBR_reg::type_id::create("SRBR");
        SRBR.configure(this, null, "");
        SRBR.build();
        default_map.add_reg(SRBR, 'h30, "RO");
        SRBR.add_hdl_path_slice("SRBR", 0, 32, 0);

        FAR = FAR_reg::type_id::create("FAR");
        FAR.configure(this, null, "");
        FAR.build();
        default_map.add_reg(FAR, 'h70, "RW");
        FAR.add_hdl_path_slice("FAR", 0, 32, 0);

        TFR = TFR_reg::type_id::create("TFR");
        TFR.configure(this, null, "");
        TFR.build();
        default_map.add_reg(TFR, 'h74, "RO");
        TFR.add_hdl_path_slice("TFR", 0, 32, 0);

        RFW = RFW_reg::type_id::create("RFW");
        RFW.configure(this, null, "");
        RFW.build();
        default_map.add_reg(RFW, 'h78, "RW");
        RFW.add_hdl_path_slice("RFW", 0, 32, 0);

        USR = USR_reg::type_id::create("USR");
        USR.configure(this, null, "");
        USR.build();
        default_map.add_reg(USR, 'h7C, "RO");
        USR.add_hdl_path_slice("USR", 0, 32, 0);

        TFL = TFL_reg::type_id::create("TFL");
        TFL.configure(this, null, "");
        TFL.build();
        default_map.add_reg(TFL, 'h80, "RO");
        TFL.add_hdl_path_slice("TFL", 0, 32, 0);

        RFL = RFL_reg::type_id::create("RFL");
        RFL.configure(this, null, "");
        RFL.build();
        default_map.add_reg(RFL, 'h84, "RO");
        RFL.add_hdl_path_slice("RFL", 0, 32, 0);

        SRR = SRR_reg::type_id::create("SRR");
        SRR.configure(this, null, "");
        SRR.build();
        default_map.add_reg(SRR, 'h88, "RW");
        SRR.add_hdl_path_slice("SRR", 0, 32, 0);

        SRTS = SRTS_reg::type_id::create("SRTS");
        SRTS.configure(this, null, "");
        SRTS.build();
        default_map.add_reg(SRTS, 'h8C, "RW");
        SRTS.add_hdl_path_slice("SRTS", 0, 32, 0);

        SBCR = SBCR_reg::type_id::create("SBCR");
        SBCR.configure(this, null, "");
        SBCR.build();
        default_map.add_reg(SBCR, 'h90, "RW");
        SBCR.add_hdl_path_slice("SBCR", 0, 32, 0);

        SDMAM = SDMAM_reg::type_id::create("SDMAM");
        SDMAM.configure(this, null, "");
        SDMAM.build();
        default_map.add_reg(SDMAM, 'h94, "RW");
        SDMAM.add_hdl_path_slice("SDMAM", 0, 32, 0);

        SFE = SFE_reg::type_id::create("SFE");
        SFE.configure(this, null, "");
        SFE.build();
        default_map.add_reg(SFE, 'h98, "RW");
        SFE.add_hdl_path_slice("SFE", 0, 32, 0);

        SRT = SRT_reg::type_id::create("SRT");
        SRT.configure(this, null, "");
        SRT.build();
        default_map.add_reg(SRT, 'h9C, "RW");
        SRT.add_hdl_path_slice("SRT", 0, 32, 0);

        STET = STET_reg::type_id::create("STET");
        STET.configure(this, null, "");
        STET.build();
        default_map.add_reg(STET, 'hA0, "RW");
        STET.add_hdl_path_slice("STET", 0, 32, 0);

        HTX = HTX_reg::type_id::create("HTX");
        HTX.configure(this, null, "");
        HTX.build();
        default_map.add_reg(HTX, 'hA4, "RW");
        HTX.add_hdl_path_slice("HTX", 0, 32, 0);

        DMASA = DMASA_reg::type_id::create("DMASA");
        DMASA.configure(this, null, "");
        DMASA.build();
        default_map.add_reg(DMASA, 'hA8, "RW");
        DMASA.add_hdl_path_slice("DMASA", 0, 32, 0);

        TCR = TCR_reg::type_id::create("TCR");
        TCR.configure(this, null, "");
        TCR.build();
        default_map.add_reg(TCR, 'hAC, "RW");
        TCR.add_hdl_path_slice("TCR", 0, 32, 0);

        DE_EN = DE_EN_reg::type_id::create("DE_EN");
        DE_EN.configure(this, null, "");
        DE_EN.build();
        default_map.add_reg(DE_EN, 'hB0, "RW");
        DE_EN.add_hdl_path_slice("DE_EN", 0, 32, 0);

        RE_EN = RE_EN_reg::type_id::create("RE_EN");
        RE_EN.configure(this, null, "");
        RE_EN.build();
        default_map.add_reg(RE_EN, 'hB4, "RW");
        RE_EN.add_hdl_path_slice("RE_EN", 0, 32, 0);

        DET = DET_reg::type_id::create("DET");
        DET.configure(this, null, "");
        DET.build();
        default_map.add_reg(DET, 'hB8, "RW");
        DET.add_hdl_path_slice("DET", 0, 32, 0);

        TAT = TAT_reg::type_id::create("TAT");
        TAT.configure(this, null, "");
        TAT.build();
        default_map.add_reg(TAT, 'hBC, "RW");
        TAT.add_hdl_path_slice("TAT", 0, 32, 0);

        DLF = DLF_reg::type_id::create("DLF");
        DLF.configure(this, null, "");
        DLF.build();
        default_map.add_reg(DLF, 'hC0, "RW");
        DLF.add_hdl_path_slice("DLF", 0, 32, 0);

        RAR = RAR_reg::type_id::create("RAR");
        RAR.configure(this, null, "");
        RAR.build();
        default_map.add_reg(RAR, 'hC4, "RW");
        RAR.add_hdl_path_slice("RAR", 0, 32, 0);

        TAR = TAR_reg::type_id::create("TAR");
        TAR.configure(this, null, "");
        TAR.build();
        default_map.add_reg(TAR, 'hC8, "RW");
        TAR.add_hdl_path_slice("TAR", 0, 32, 0);

        LCR_EXT = LCR_EXT_reg::type_id::create("LCR_EXT");
        LCR_EXT.configure(this, null, "");
        LCR_EXT.build();
        default_map.add_reg(LCR_EXT, 'hCC, "RW");
        LCR_EXT.add_hdl_path_slice("LCR_EXT", 0, 32, 0);

        UART_PROT_LEVEL = UART_PROT_LEVEL_reg::type_id::create("UART_PROT_LEVEL");
        UART_PROT_LEVEL.configure(this, null, "");
        UART_PROT_LEVEL.build();
        default_map.add_reg(UART_PROT_LEVEL, 'hD0, "RW");
        UART_PROT_LEVEL.add_hdl_path_slice("UART_PROT_LEVEL", 0, 32, 0);

        REG_TIMEOUT_RST = REG_TIMEOUT_RST_reg::type_id::create("REG_TIMEOUT_RST");
        REG_TIMEOUT_RST.configure(this, null, "");
        REG_TIMEOUT_RST.build();
        default_map.add_reg(REG_TIMEOUT_RST, 'hD4, "RW");
        REG_TIMEOUT_RST.add_hdl_path_slice("REG_TIMEOUT_RST", 0, 32, 0);

        CPR = CPR_reg::type_id::create("CPR");
        CPR.configure(this, null, "");
        CPR.build();
        default_map.add_reg(CPR, 'hF4, "RO");
        CPR.add_hdl_path_slice("CPR", 0, 32, 0);

        UCV = UCV_reg::type_id::create("UCV");
        UCV.configure(this, null, "");
        UCV.build();
        default_map.add_reg(UCV, 'hF8, "RO");
        UCV.add_hdl_path_slice("UCV", 0, 32, 0);

        CTR = CTR_reg::type_id::create("CTR");
        CTR.configure(this, null, "");
        CTR.build();
        default_map.add_reg(CTR, 'hFC, "RO");
        CTR.add_hdl_path_slice("CTR", 0, 32, 0);

        lock_model();
    endfunction

endclass : uart_reg_block

`endif // _UART_REG_BLOCK_SV_
