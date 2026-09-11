`ifndef _UC_SEQUENCER_SV_
`define _UC_SEQUENCER_SV_

class uc_sequencer extends uvm_sequencer#(uc_trans);

	`uvm_component_utils(uc_sequencer)

	function new(string name="uc_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
