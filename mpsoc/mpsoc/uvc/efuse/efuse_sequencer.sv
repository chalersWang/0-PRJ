`ifndef _EFUSE_SEQUENCER_SV_
`define _EFUSE_SEQUENCER_SV_

class efuse_sequencer extends uvm_sequencer#(efuse_trans);

	`uvm_component_utils(efuse_sequencer)

	function new(string name="efuse_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
