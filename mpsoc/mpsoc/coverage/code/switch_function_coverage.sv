//CDV: Coverage Drive Verify
covergroup FeatureListNum_SWITCH with function sample(switch_trans switch_tr);
	//function code
	SWITCH_switch_mii_p0_rxclock:coverpoint switch_tr.switch_mii_p0_rxclock{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p0_rxerror:coverpoint switch_tr.switch_mii_p0_rxerror{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p0_rxenable:coverpoint switch_tr.switch_mii_p0_rxenable{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p0_rx:coverpoint switch_tr.switch_mii_p0_rx{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p0_txclock:coverpoint switch_tr.switch_mii_p0_txclock{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p0_txenable:coverpoint switch_tr.switch_mii_p0_txenable{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p0_tx:coverpoint switch_tr.switch_mii_p0_tx{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p0_link:coverpoint switch_tr.switch_mii_p0_link{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p1_rxclock:coverpoint switch_tr.switch_mii_p1_rxclock{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p1_rxerror:coverpoint switch_tr.switch_mii_p1_rxerror{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p1_rxenable:coverpoint switch_tr.switch_mii_p1_rxenable{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p1_rx:coverpoint switch_tr.switch_mii_p1_rx{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p1_txclock:coverpoint switch_tr.switch_mii_p1_txclock{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p1_txenable:coverpoint switch_tr.switch_mii_p1_txenable{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p1_tx:coverpoint switch_tr.switch_mii_p1_tx{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mii_p1_link:coverpoint switch_tr.switch_mii_p1_link{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_switch_mdio_clock:coverpoint switch_tr.switch_mdio_clock{bins zero={0};bins nonzero={['h1:$]};
	SWITCH_inoutswitch_mdio_data:coverpoint switch_tr.inoutswitch_mdio_data{bins zero={0};bins nonzero={['h1:$]};
endgroup
