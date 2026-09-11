`ifndef _WDT_SEQUENCER_SV_
`define _WDT_SEQUENCER_SV_

class wdt_sequencer extends uvm_sequencer#(wdt_trans);

	`uvm_component_utils(wdt_sequencer)

	function new(string name="wdt_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
