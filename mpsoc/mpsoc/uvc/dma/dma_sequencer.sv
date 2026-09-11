`ifndef _DMA_SEQUENCER_SV_
`define _DMA_SEQUENCER_SV_

class dma_sequencer extends uvm_sequencer#(dma_trans);

	`uvm_component_utils(dma_sequencer)

	function new(string name="dma_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
