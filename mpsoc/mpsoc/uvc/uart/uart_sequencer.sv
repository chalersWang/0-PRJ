`ifndef _UART_SEQUENCER_SV_
`define _UART_SEQUENCER_SV_

class uart_sequencer extends uvm_sequencer#(uart_trans);

	`uvm_component_utils(uart_sequencer)

	function new(string name="uart_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
