`ifndef _REG_SPI_V_
`define _REG_SPI_V_
//=====================================================================
// reg_spi.v —— spi 模块详细寄存器地址宏
// 宏名: <模块>_<寄存器>    值: <模块>_BASE_ADDR + 偏移 (绝对地址)
// 基址宏 <模块>_BASE_ADDR 见 addressmap.v; 层次宏 <模块>_HIER 见 hierarchy.v。
//=====================================================================

// ---------- SPI  (基址 32'h40031000) ----------
`define SPI_CTRLR0         (SPI_BASE_ADDR + 32'h00)
`define SPI_CTRLR1         (SPI_BASE_ADDR + 32'h04)
`define SPI_SSIENR         (SPI_BASE_ADDR + 32'h08)
`define SPI_MWCR           (SPI_BASE_ADDR + 32'h0C)
`define SPI_SER            (SPI_BASE_ADDR + 32'h10)
`define SPI_BAUDR          (SPI_BASE_ADDR + 32'h14)
`define SPI_TXFTLR         (SPI_BASE_ADDR + 32'h18)
`define SPI_RXFTLR         (SPI_BASE_ADDR + 32'h1C)
`define SPI_TXFLR          (SPI_BASE_ADDR + 32'h20)
`define SPI_RXFLR          (SPI_BASE_ADDR + 32'h24)
`define SPI_SR             (SPI_BASE_ADDR + 32'h28)
`define SPI_IMR            (SPI_BASE_ADDR + 32'h2C)
`define SPI_ISR            (SPI_BASE_ADDR + 32'h30)
`define SPI_RISR           (SPI_BASE_ADDR + 32'h34)
`define SPI_TXOICR         (SPI_BASE_ADDR + 32'h38)
`define SPI_RXOICR         (SPI_BASE_ADDR + 32'h3C)
`define SPI_RXUICR         (SPI_BASE_ADDR + 32'h40)
`define SPI_MSTICR         (SPI_BASE_ADDR + 32'h44)
`define SPI_ICR            (SPI_BASE_ADDR + 32'h48)
`define SPI_DMACR          (SPI_BASE_ADDR + 32'h4C)
`define SPI_DMATDLR        (SPI_BASE_ADDR + 32'h50)
`define SPI_DMARDLR        (SPI_BASE_ADDR + 32'h54)
`define SPI_IDR            (SPI_BASE_ADDR + 32'h58)
`define SPI_SSI_VERSION_ID (SPI_BASE_ADDR + 32'h5C)
`define SPI_DR             (SPI_BASE_ADDR + 32'h60)
`define SPI_RX_SAMPLE_DLY  (SPI_BASE_ADDR + 32'hF0)
`define SPI_SPI_CTRLR0     (SPI_BASE_ADDR + 32'hF4)
`define SPI_TXD_DRIVE_EDGE (SPI_BASE_ADDR + 32'hF8)

`endif // _REG_SPI_V_
