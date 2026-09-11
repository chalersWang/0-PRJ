`ifndef _SECURITY_SEQUENCER_SV_
`define _SECURITY_SEQUENCER_SV_

class security_sequencer extends uvm_sequencer#(security_trans);

	`uvm_component_utils(security_sequencer)

	function new(string name="security_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
