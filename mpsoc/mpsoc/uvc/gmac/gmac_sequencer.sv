`ifndef _GMAC_SEQUENCER_SV_
`define _GMAC_SEQUENCER_SV_

class gmac_sequencer extends uvm_sequencer#(gmac_trans);

	`uvm_component_utils(gmac_sequencer)

	function new(string name="gmac_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
