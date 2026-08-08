`ifndef _SYSCTRL_SEQUENCER_SV_
`define _SYSCTRL_SEQUENCER_SV_

class sysctrl_sequencer extends uvm_sequencer#(sysctrl_trans);

	`uvm_component_utils(sysctrl_sequencer)

	function new(string name="sysctrl_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
