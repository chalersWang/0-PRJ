`ifndef _SWITCH_SEQUENCER_SV_
`define _SWITCH_SEQUENCER_SV_

class switch_sequencer extends uvm_sequencer#(switch_trans);

	`uvm_component_utils(switch_sequencer)

	function new(string name="switch_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
