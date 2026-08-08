`ifndef _MIIPHY_SEQUENCER_SV_
`define _MIIPHY_SEQUENCER_SV_

class miiphy_sequencer extends uvm_sequencer#(miiphy_trans);

	`uvm_component_utils(miiphy_sequencer)

	function new(string name="miiphy_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
