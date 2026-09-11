`ifndef _ESC_SEQUENCER_SV_
`define _ESC_SEQUENCER_SV_

class esc_sequencer extends uvm_sequencer#(esc_trans);

	`uvm_component_utils(esc_sequencer)

	function new(string name="esc_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
