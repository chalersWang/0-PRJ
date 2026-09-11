`ifndef _SDRAM_SEQUENCER_SV_
`define _SDRAM_SEQUENCER_SV_

class sdram_sequencer extends uvm_sequencer#(sdram_trans);

	`uvm_component_utils(sdram_sequencer)

	function new(string name="sdram_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
