//CDV: Coverage Drive Verify
covergroup FeatureListNum_GPIO with function sample(gpio_trans gpio_tr);
	//function code
	GPIO_inoutb_pad_gpio_porta:coverpoint gpio_tr.inoutb_pad_gpio_porta{bins zero={0};bins nonzero={['h1:$]};
	GPIO_inoutb_pad_gpio_portb:coverpoint gpio_tr.inoutb_pad_gpio_portb{bins zero={0};bins nonzero={['h1:$]};
endgroup
