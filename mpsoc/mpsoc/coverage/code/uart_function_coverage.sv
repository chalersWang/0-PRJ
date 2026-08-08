//CDV: Coverage Drive Verify
covergroup FeatureListNum_UART with function sample(uart_trans uart_tr);
	//function code
	UART_i_pad_uart0_sin:coverpoint uart_tr.i_pad_uart0_sin{bins zero={0};bins nonzero={['h1:$]};
	UART_o_pad_uart0_sout:coverpoint uart_tr.o_pad_uart0_sout{bins zero={0};bins nonzero={['h1:$]};
endgroup
