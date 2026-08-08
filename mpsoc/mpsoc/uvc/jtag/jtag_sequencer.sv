`ifndef _JTAG_SEQUENCER_SV_
`define _JTAG_SEQUENCER_SV_

class jtag_sequencer extends uvm_sequencer#(jtag_trans);

	`uvm_component_utils(jtag_sequencer)

	function new(string name="jtag_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
