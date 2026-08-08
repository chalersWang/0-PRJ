//CDV: Coverage Drive Verify
covergroup FeatureListNum_JTAG with function sample(jtag_trans jtag_tr);
	//function code
	JTAG_i_pad_jtg_nrst_b:coverpoint jtag_tr.i_pad_jtg_nrst_b{bins zero={0};bins nonzero={['h1:$]};
	JTAG_i_pad_jtg_tclk:coverpoint jtag_tr.i_pad_jtg_tclk{bins zero={0};bins nonzero={['h1:$]};
	JTAG_i_pad_jtg_tdi:coverpoint jtag_tr.i_pad_jtg_tdi{bins zero={0};bins nonzero={['h1:$]};
	JTAG_i_pad_jtg_tms:coverpoint jtag_tr.i_pad_jtg_tms{bins zero={0};bins nonzero={['h1:$]};
	JTAG_i_pad_jtg_trst_b:coverpoint jtag_tr.i_pad_jtg_trst_b{bins zero={0};bins nonzero={['h1:$]};
	JTAG_o_pad_jtg_tdo:coverpoint jtag_tr.o_pad_jtg_tdo{bins zero={0};bins nonzero={['h1:$]};
endgroup
