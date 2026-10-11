`ifndef _MPSOC_REG_BLOCK_SV_
`define _MPSOC_REG_BLOCK_SV_

//=========================================================================
// mpsoc_reg_block: MPSoC 顶层寄存器块, 汇总 19 个外设模块寄存器子块。
//   - 真实模型(12): sysctrl/uart/gpio/i2c/spi/wdt/tim/dma/gmac/qspi/sdram/esc
//   - 占位模型(7):  jtag/switch/miiphy/efuse/uc/security/pn_irt (无寄存器数据)
//   多实例: uart0/1/2, tim0/1, esc0/1 共用同一 reg_block 类, 不同基地址。
//=========================================================================
`include "uvm_macros.svh"
import uvm_pkg::*;

class mpsoc_reg_block extends uvm_reg_block;

    rand sysctrl_reg_block sysctrl;
    rand gpio_reg_block    gpio;
    rand i2c_reg_block     i2c;
    rand spi_reg_block     spi;
    rand uart_reg_block    uart0;
    rand uart_reg_block    uart1;
    rand uart_reg_block    uart2;
    rand wdt_reg_block     wdt;
    rand tim_reg_block     tim0;
    rand tim_reg_block     tim1;
    rand dma_reg_block     dma;
    rand gmac_reg_block    gmac;
    rand qspi_reg_block    qspi;
    rand sdram_reg_block   sdram;
    rand esc_reg_block     esc0;
    rand esc_reg_block     esc1;
    rand jtag_reg_block    jtag;
    rand switch_reg_block  sw;
    rand miiphy_reg_block  miiphy;
    rand efuse_reg_block   efuse;
    rand uc_reg_block      uc;
    rand security_reg_block security;
    rand pn_irt_reg_block  pn_irt;

    `uvm_object_utils(mpsoc_reg_block)

    function new(string name="mpsoc_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        super.build();
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        sysctrl = sysctrl_reg_block::type_id::create("sysctrl");
        sysctrl.configure(this, null, "");
        sysctrl.build();
        default_map.add_submap(sysctrl.default_map, 'h40017000);

        gpio = gpio_reg_block::type_id::create("gpio");
        gpio.configure(this, null, "");
        gpio.build();
        default_map.add_submap(gpio.default_map, 'h40019000);

        i2c = i2c_reg_block::type_id::create("i2c");
        i2c.configure(this, null, "");
        i2c.build();
        default_map.add_submap(i2c.default_map, 'h40021000);

        spi = spi_reg_block::type_id::create("spi");
        spi.configure(this, null, "");
        spi.build();
        default_map.add_submap(spi.default_map, 'h40031000);

        uart0 = uart_reg_block::type_id::create("uart0");
        uart0.configure(this, null, "");
        uart0.build();
        default_map.add_submap(uart0.default_map, 'h40015000);

        uart1 = uart_reg_block::type_id::create("uart1");
        uart1.configure(this, null, "");
        uart1.build();
        default_map.add_submap(uart1.default_map, 'h40026000);

        uart2 = uart_reg_block::type_id::create("uart2");
        uart2.configure(this, null, "");
        uart2.build();
        default_map.add_submap(uart2.default_map, 'h40025000);

        wdt = wdt_reg_block::type_id::create("wdt");
        wdt.configure(this, null, "");
        wdt.build();
        default_map.add_submap(wdt.default_map, 'h4001A000);

        tim0 = tim_reg_block::type_id::create("tim0");
        tim0.configure(this, null, "");
        tim0.build();
        default_map.add_submap(tim0.default_map, 'h40018000);

        tim1 = tim_reg_block::type_id::create("tim1");
        tim1.configure(this, null, "");
        tim1.build();
        default_map.add_submap(tim1.default_map, 'h40011000);

        dma = dma_reg_block::type_id::create("dma");
        dma.configure(this, null, "");
        dma.build();
        default_map.add_submap(dma.default_map, 'h42000000);

        gmac = gmac_reg_block::type_id::create("gmac");
        gmac.configure(this, null, "");
        gmac.build();
        default_map.add_submap(gmac.default_map, 'h40040000);

        qspi = qspi_reg_block::type_id::create("qspi");
        qspi.configure(this, null, "");
        qspi.build();
        default_map.add_submap(qspi.default_map, 'h48000000);

        sdram = sdram_reg_block::type_id::create("sdram");
        sdram.configure(this, null, "");
        sdram.build();
        default_map.add_submap(sdram.default_map, 'h54000000);

        esc0 = esc_reg_block::type_id::create("esc0");
        esc0.configure(this, null, "");
        esc0.build();
        default_map.add_submap(esc0.default_map, 'h44C80000);

        esc1 = esc_reg_block::type_id::create("esc1");
        esc1.configure(this, null, "");
        esc1.build();
        default_map.add_submap(esc1.default_map, 'h44C00000);

        jtag = jtag_reg_block::type_id::create("jtag");
        jtag.configure(this, null, "");
        jtag.build();
        default_map.add_submap(jtag.default_map, 'h0);

        sw = switch_reg_block::type_id::create("sw");
        sw.configure(this, null, "");
        sw.build();
        default_map.add_submap(sw.default_map, 'h0);

        miiphy = miiphy_reg_block::type_id::create("miiphy");
        miiphy.configure(this, null, "");
        miiphy.build();
        default_map.add_submap(miiphy.default_map, 'h0);

        efuse = efuse_reg_block::type_id::create("efuse");
        efuse.configure(this, null, "");
        efuse.build();
        default_map.add_submap(efuse.default_map, 'h0);

        uc = uc_reg_block::type_id::create("uc");
        uc.configure(this, null, "");
        uc.build();
        default_map.add_submap(uc.default_map, 'h0);

        security = security_reg_block::type_id::create("security");
        security.configure(this, null, "");
        security.build();
        default_map.add_submap(security.default_map, 'h40012000);

        pn_irt = pn_irt_reg_block::type_id::create("pn_irt");
        pn_irt.configure(this, null, "");
        pn_irt.build();
        default_map.add_submap(pn_irt.default_map, 'h43C90000);

        lock_model();
    endfunction

endclass : mpsoc_reg_block

`endif // _MPSOC_REG_BLOCK_SV_
