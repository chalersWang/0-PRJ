`ifndef _I2C_SEQUENCER_SV_
`define _I2C_SEQUENCER_SV_

class i2c_sequencer extends uvm_sequencer#(i2c_trans);

	`uvm_component_utils(i2c_sequencer)

	function new(string name="i2c_sequencer",uvm_component parent=null);
		super.new(name,parent);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

endclass

`endif
