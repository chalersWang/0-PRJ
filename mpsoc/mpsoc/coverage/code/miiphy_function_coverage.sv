//CDV: Coverage Drive Verify
covergroup FeatureListNum_MIIPHY with function sample(miiphy_trans miiphy_tr);
	//function code
	MIIPHY_phy_rxd_i:coverpoint miiphy_tr.phy_rxd_i{bins zero={0};bins nonzero={['h1:$]};
	MIIPHY_phy_rxdv_i:coverpoint miiphy_tr.phy_rxdv_i{bins zero={0};bins nonzero={['h1:$]};
	MIIPHY_phy_rxer_i:coverpoint miiphy_tr.phy_rxer_i{bins zero={0};bins nonzero={['h1:$]};
	MIIPHY_phy_txd_o:coverpoint miiphy_tr.phy_txd_o{bins zero={0};bins nonzero={['h1:$]};
	MIIPHY_phy_txen_o:coverpoint miiphy_tr.phy_txen_o{bins zero={0};bins nonzero={['h1:$]};
	MIIPHY_RGMIIRXC_i:coverpoint miiphy_tr.RGMIIRXC_i{bins zero={0};bins nonzero={['h1:$]};
	MIIPHY_RGMIITXC_o:coverpoint miiphy_tr.RGMIITXC_o{bins zero={0};bins nonzero={['h1:$]};
	MIIPHY_phy_link_i:coverpoint miiphy_tr.phy_link_i{bins zero={0};bins nonzero={['h1:$]};
endgroup
