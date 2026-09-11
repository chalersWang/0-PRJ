`ifndef _SPI_SEQUENCER_SV_
`define _SPI_SEQUENCER_SV_

class spi_sequencer extends uvm_sequencer#(spi_trans);

	`uvm_component_utils(spi_sequencer)

	function new(string name="spi_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
