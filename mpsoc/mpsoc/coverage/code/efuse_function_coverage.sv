//CDV: Coverage Drive Verify
covergroup FeatureListNum_EFUSE with function sample(efuse_trans efuse_tr);
	//function code
	EFUSE_o_efuse_dout:coverpoint efuse_tr.o_efuse_dout{bins zero={0};bins nonzero={['h1:$]};
	EFUSE_i_efuse_pgm:coverpoint efuse_tr.i_efuse_pgm{bins zero={0};bins nonzero={['h1:$]};
	EFUSE_i_efuse_sclk:coverpoint efuse_tr.i_efuse_sclk{bins zero={0};bins nonzero={['h1:$]};
	EFUSE_i_efuse_cs:coverpoint efuse_tr.i_efuse_cs{bins zero={0};bins nonzero={['h1:$]};
	EFUSE_i_efuse_wr:coverpoint efuse_tr.i_efuse_wr{bins zero={0};bins nonzero={['h1:$]};
endgroup
