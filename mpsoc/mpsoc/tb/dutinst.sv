
//dut inst
wire  i_pad_clk;
wire  i_pad_rst_b;
wire  [1:0] i_pad_boot_mode;
wire  i_pad_host_if_mode;
wire  i_pad_bypass_secure;
wire  [3:0] o_pad_pn_sync;
wire  i_pad_test_mode;

wire  i_pad_jtg_nrst_b;
wire  i_pad_jtg_tclk;
wire  i_pad_jtg_tdi;
wire  i_pad_jtg_tms;
wire  i_pad_jtg_trst_b;
wire  o_pad_jtg_tdo;

wire  i_pad_uart0_sin;
wire  o_pad_uart0_sout;

wire  [31:0] b_pad_gpio_porta;
wire  [15:0] b_pad_gpio_portb;

wire  QSPI_CS0N_o;
wire  QSPI_CS1N_o;
wire  QSPI_CS2N_o;
wire  QSPI_CS3N_o;
wire  QSPI_DAT0;
wire  QSPI_DAT1;
wire  QSPI_DAT2;
wire  QSPI_DAT3;
wire  QSPI_SCLK_o;

wire  switch_mii_p0_rxclock;
wire  switch_mii_p0_rxerror;
wire  switch_mii_p0_rxenable;
wire  [3:0] switch_mii_p0_rx;
wire  switch_mii_p0_txclock;
wire  switch_mii_p0_txenable;
wire  [3:0] switch_mii_p0_tx;
wire  switch_mii_p0_link;
wire  switch_mii_p1_rxclock;
wire  switch_mii_p1_rxerror;
wire  switch_mii_p1_rxenable;
wire  [3:0] switch_mii_p1_rx;
wire  switch_mii_p1_txclock;
wire  switch_mii_p1_txenable;
wire  [3:0] switch_mii_p1_tx;
wire  switch_mii_p1_link;
wire  switch_mdio_clock;
wire  switch_mdio_data;

wire  [3:0] phy_rxd_i;
wire  phy_rxdv_i;
wire  phy_rxer_i;
wire  [3:0] phy_txd_o;
wire  phy_txen_o;
wire  RGMIIRXC_i;
wire  RGMIITXC_o;
wire  phy_link_i;

wire  [3:0] o_efuse_dout;
wire  [3:0] i_efuse_pgm;
wire  i_efuse_sclk;
wire  i_efuse_cs;
wire  i_efuse_wr;

mpsoc DUT(
.i_pad_clk			(TopVif.sysctrlvif.i_pad_clk			),
.i_pad_rst_b			(TopVif.sysctrlvif.i_pad_rst_b			),
.i_pad_boot_mode			(TopVif.sysctrlvif.i_pad_boot_mode			),
.i_pad_host_if_mode			(TopVif.sysctrlvif.i_pad_host_if_mode			),
.i_pad_bypass_secure			(TopVif.sysctrlvif.i_pad_bypass_secure			),
.o_pad_pn_sync			(TopVif.sysctrlvif.o_pad_pn_sync			),
.i_pad_test_mode			(TopVif.sysctrlvif.i_pad_test_mode			),
.i_pad_jtg_nrst_b			(TopVif.jtagvif.i_pad_jtg_nrst_b			),
.i_pad_jtg_tclk			(TopVif.jtagvif.i_pad_jtg_tclk			),
.i_pad_jtg_tdi			(TopVif.jtagvif.i_pad_jtg_tdi			),
.i_pad_jtg_tms			(TopVif.jtagvif.i_pad_jtg_tms			),
.i_pad_jtg_trst_b			(TopVif.jtagvif.i_pad_jtg_trst_b			),
.o_pad_jtg_tdo			(TopVif.jtagvif.o_pad_jtg_tdo			),
.i_pad_uart0_sin			(TopVif.uartvif.i_pad_uart0_sin			),
.o_pad_uart0_sout			(TopVif.uartvif.o_pad_uart0_sout			),
.b_pad_gpio_porta			(TopVif.gpiovif.b_pad_gpio_porta			),
.b_pad_gpio_portb			(TopVif.gpiovif.b_pad_gpio_portb			),
.QSPI_CS0N_o			(TopVif.qspivif.QSPI_CS0N_o			),
.QSPI_CS1N_o			(TopVif.qspivif.QSPI_CS1N_o			),
.QSPI_CS2N_o			(TopVif.qspivif.QSPI_CS2N_o			),
.QSPI_CS3N_o			(TopVif.qspivif.QSPI_CS3N_o			),
.QSPI_DAT0			(TopVif.qspivif.QSPI_DAT0			),
.QSPI_DAT1			(TopVif.qspivif.QSPI_DAT1			),
.QSPI_DAT2			(TopVif.qspivif.QSPI_DAT2			),
.QSPI_DAT3			(TopVif.qspivif.QSPI_DAT3			),
.QSPI_SCLK_o			(TopVif.qspivif.QSPI_SCLK_o			),
.switch_mii_p0_rxclock			(TopVif.switchvif.switch_mii_p0_rxclock			),
.switch_mii_p0_rxerror			(TopVif.switchvif.switch_mii_p0_rxerror			),
.switch_mii_p0_rxenable			(TopVif.switchvif.switch_mii_p0_rxenable			),
.switch_mii_p0_rx			(TopVif.switchvif.switch_mii_p0_rx			),
.switch_mii_p0_txclock			(TopVif.switchvif.switch_mii_p0_txclock			),
.switch_mii_p0_txenable			(TopVif.switchvif.switch_mii_p0_txenable			),
.switch_mii_p0_tx			(TopVif.switchvif.switch_mii_p0_tx			),
.switch_mii_p0_link			(TopVif.switchvif.switch_mii_p0_link			),
.switch_mii_p1_rxclock			(TopVif.switchvif.switch_mii_p1_rxclock			),
.switch_mii_p1_rxerror			(TopVif.switchvif.switch_mii_p1_rxerror			),
.switch_mii_p1_rxenable			(TopVif.switchvif.switch_mii_p1_rxenable			),
.switch_mii_p1_rx			(TopVif.switchvif.switch_mii_p1_rx			),
.switch_mii_p1_txclock			(TopVif.switchvif.switch_mii_p1_txclock			),
.switch_mii_p1_txenable			(TopVif.switchvif.switch_mii_p1_txenable			),
.switch_mii_p1_tx			(TopVif.switchvif.switch_mii_p1_tx			),
.switch_mii_p1_link			(TopVif.switchvif.switch_mii_p1_link			),
.switch_mdio_clock			(TopVif.switchvif.switch_mdio_clock			),
.switch_mdio_data			(TopVif.switchvif.switch_mdio_data			),
.phy_rxd_i			(TopVif.miiphyvif.phy_rxd_i			),
.phy_rxdv_i			(TopVif.miiphyvif.phy_rxdv_i			),
.phy_rxer_i			(TopVif.miiphyvif.phy_rxer_i			),
.phy_txd_o			(TopVif.miiphyvif.phy_txd_o			),
.phy_txen_o			(TopVif.miiphyvif.phy_txen_o			),
.RGMIIRXC_i			(TopVif.miiphyvif.RGMIIRXC_i			),
.RGMIITXC_o			(TopVif.miiphyvif.RGMIITXC_o			),
.phy_link_i			(TopVif.miiphyvif.phy_link_i			),
.o_efuse_dout			(TopVif.efusevif.o_efuse_dout			),
.i_efuse_pgm			(TopVif.efusevif.i_efuse_pgm			),
.i_efuse_sclk			(TopVif.efusevif.i_efuse_sclk			),
.i_efuse_cs			(TopVif.efusevif.i_efuse_cs			),
.i_efuse_wr			(TopVif.efusevif.i_efuse_wr			)
);

