`ifndef _MPSOC_VIRTUAL_SEQUENCER_SV_
`define _MPSOC_VIRTUAL_SEQUENCER_SV_

class mpsoc_virtual_sequencer extends uvm_sequencer;

	mpsoc_config    sct_cfg;

	sysctrl_sequencer         sysctrl_seqr;
	jtag_sequencer         jtag_seqr;
	uart_sequencer         uart_seqr;
	gpio_sequencer         gpio_seqr;
	qspi_sequencer         qspi_seqr;
	switch_sequencer         switch_seqr;
	miiphy_sequencer         miiphy_seqr;
	efuse_sequencer         efuse_seqr;

	//You can add some parameters that you want to pass through the json table here;
	rand bit[1:0]aa;
	string       bb;
	`uvm_component_utils_begin(mpsoc_virtual_sequencer)

		`uvm_field_object(sysctrl_seqr,UVM_ALL_ON);
		`uvm_field_object(jtag_seqr,UVM_ALL_ON);
		`uvm_field_object(uart_seqr,UVM_ALL_ON);
		`uvm_field_object(gpio_seqr,UVM_ALL_ON);
		`uvm_field_object(qspi_seqr,UVM_ALL_ON);
		`uvm_field_object(switch_seqr,UVM_ALL_ON);
		`uvm_field_object(miiphy_seqr,UVM_ALL_ON);
		`uvm_field_object(efuse_seqr,UVM_ALL_ON);

		//parameters of json
		`uvm_field_int(aa,UVM_ALL_ON);
		`uvm_field_string(bb,UVM_ALL_ON);

	`uvm_field_utils_end

	function new(string name="mpsoc_virtual_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	/*
	//build_phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//`uvm_info(get_full_name(),"build_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"build_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//connect_phase
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//`uvm_info(get_full_name(),"connect_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"connect_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//end_of_elaboration_phase
	virtual function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		//`uvm_info(get_full_name(),"end_of_elaboration_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"end_of_elaboration_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//start_of_simulation_phase
	virtual function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		//`uvm_info(get_full_name(),"start_of_simulation_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"start_of_simulation_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//run_phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		//`uvm_info(get_full_name(),"run_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"run_phase end ...",UVM_LOW)
	endtask

	*/

	/*
	//extract_phase
	virtual function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		//`uvm_info(get_full_name(),"extract_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"extract_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//check_phase
	virtual function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		//`uvm_info(get_full_name(),"check_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"check_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//report_phase
	virtual function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		//`uvm_info(get_full_name(),"report_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"report_phase end ...",UVM_LOW)
	endfunction
	*/

	/*
	//final_phase
	virtual function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		//`uvm_info(get_full_name(),"final_phase begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"final_phase end ...",UVM_LOW)
	endfunction
	*/

endclass

`endif

