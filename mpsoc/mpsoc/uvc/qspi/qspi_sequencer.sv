`ifndef _QSPI_SEQUENCER_SV_
`define _QSPI_SEQUENCER_SV_

class qspi_sequencer extends uvm_sequencer#(qspi_trans);

	`uvm_component_utils(qspi_sequencer)

	function new(string name="qspi_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
