`ifndef _TIM_SEQUENCER_SV_
`define _TIM_SEQUENCER_SV_

class tim_sequencer extends uvm_sequencer#(tim_trans);

	`uvm_component_utils(tim_sequencer)

	function new(string name="tim_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
