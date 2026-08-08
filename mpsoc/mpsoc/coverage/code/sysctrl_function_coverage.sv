//CDV: Coverage Drive Verify
covergroup FeatureListNum_SYSCTRL with function sample(sysctrl_trans sysctrl_tr);
	//function code
	SYSCTRL_i_pad_clk:coverpoint sysctrl_tr.i_pad_clk{bins zero={0};bins nonzero={['h1:$]};
	SYSCTRL_i_pad_rst_b:coverpoint sysctrl_tr.i_pad_rst_b{bins zero={0};bins nonzero={['h1:$]};
	SYSCTRL_i_pad_boot_mode:coverpoint sysctrl_tr.i_pad_boot_mode{bins zero={0};bins nonzero={['h1:$]};
	SYSCTRL_i_pad_host_if_mode:coverpoint sysctrl_tr.i_pad_host_if_mode{bins zero={0};bins nonzero={['h1:$]};
	SYSCTRL_i_pad_bypass_secure:coverpoint sysctrl_tr.i_pad_bypass_secure{bins zero={0};bins nonzero={['h1:$]};
	SYSCTRL_o_pad_pn_sync:coverpoint sysctrl_tr.o_pad_pn_sync{bins zero={0};bins nonzero={['h1:$]};
	SYSCTRL_i_pad_test_mode:coverpoint sysctrl_tr.i_pad_test_mode{bins zero={0};bins nonzero={['h1:$]};
endgroup
