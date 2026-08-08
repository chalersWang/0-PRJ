`ifndef _GPIO_SEQUENCER_SV_
`define _GPIO_SEQUENCER_SV_

class gpio_sequencer extends uvm_sequencer#(gpio_trans);

	`uvm_component_utils(gpio_sequencer)

	function new(string name="gpio_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
