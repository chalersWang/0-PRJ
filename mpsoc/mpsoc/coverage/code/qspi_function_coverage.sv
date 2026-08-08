//CDV: Coverage Drive Verify
covergroup FeatureListNum_QSPI with function sample(qspi_trans qspi_tr);
	//function code
	QSPI_QSPI_CS0N_o:coverpoint qspi_tr.QSPI_CS0N_o{bins zero={0};bins nonzero={['h1:$]};
	QSPI_QSPI_CS1N_o:coverpoint qspi_tr.QSPI_CS1N_o{bins zero={0};bins nonzero={['h1:$]};
	QSPI_QSPI_CS2N_o:coverpoint qspi_tr.QSPI_CS2N_o{bins zero={0};bins nonzero={['h1:$]};
	QSPI_QSPI_CS3N_o:coverpoint qspi_tr.QSPI_CS3N_o{bins zero={0};bins nonzero={['h1:$]};
	QSPI_inoutQSPI_DAT0:coverpoint qspi_tr.inoutQSPI_DAT0{bins zero={0};bins nonzero={['h1:$]};
	QSPI_inoutQSPI_DAT1:coverpoint qspi_tr.inoutQSPI_DAT1{bins zero={0};bins nonzero={['h1:$]};
	QSPI_inoutQSPI_DAT2:coverpoint qspi_tr.inoutQSPI_DAT2{bins zero={0};bins nonzero={['h1:$]};
	QSPI_inoutQSPI_DAT3:coverpoint qspi_tr.inoutQSPI_DAT3{bins zero={0};bins nonzero={['h1:$]};
	QSPI_QSPI_SCLK_o:coverpoint qspi_tr.QSPI_SCLK_o{bins zero={0};bins nonzero={['h1:$]};
endgroup
