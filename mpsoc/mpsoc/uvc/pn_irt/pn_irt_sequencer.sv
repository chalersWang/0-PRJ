`ifndef _PN_IRT_SEQUENCER_SV_
`define _PN_IRT_SEQUENCER_SV_

class pn_irt_sequencer extends uvm_sequencer#(pn_irt_trans);

	`uvm_component_utils(pn_irt_sequencer)

	function new(string name="pn_irt_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
