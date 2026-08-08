`ifndef _MPSOC_SEQUENCE_LIB_SV_
`define _MPSOC_SEQUENCE_LIB_SV_

class mpsoc_virtual_seq_lib extends uvm_sequence;

	mpsoc_config     mpsoc_cfg;
	mpsoc_event      mpsoc_evt;

	`uvm_object_utils_begin(mpsoc_virtual_seq_lib)
	`uvm_object_utils_end

	`uvm_declare_p_sequencer(mpsoc_virtual_sequencer)

	function new(string name="mpsoc_virtual_seq_lib");
		super.new(name);
		mpsoc_cfg=new();
		mpsoc_evt=new();
		set_automatic_phase_objection(1);
	endfunction

	virtual task pre_body();
		`uvm_info(get_full_name(),"pre_body() begin ...",UVM_LOW)
		//mpsoc_virtual_sequencer  mseqr;
		//$cast(mseqr,m_sequencer);
		
		if(starting_phase !=null)
			starting_phase.raise_objection(this,"virtual sequence raise_objection");
		
		if(!uvm_config_db#(mpsoc_config)::get(null,get_full_name(),"mpsoc_config",mpsoc_cfg))
			`uvm_fatal(get_type_name(),"Can't get config object!")
		
		if(!uvm_config_db#(mpsoc_event)::get(null,get_full_name(),"mpsoc_event",mpsoc_evt))
			`uvm_fatal(get_type_name(),"Can't get event object!")
		
		`uvm_info(get_full_name(),"pre_body end ...",UVM_LOW)
	endtask

	virtual task body();
		//`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

	virtual task post_body();
		`uvm_info(get_full_name(),"post_body() begin ...",UVM_LOW)
		if(starting_phase!=null)
			starting_phase.drop_objection(this);
		
		`uvm_info(get_full_name(),"post_body end ...",UVM_LOW)
	endtask


	//your task or function
	`include "mpsoc_common_task_function.sv"

endclass

`endif
