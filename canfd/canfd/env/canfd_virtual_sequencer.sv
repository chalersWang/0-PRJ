`ifndef _CANFD_VIRTUAL_SEQUENCER_SV_
`define _CANFD_VIRTUAL_SEQUENCER_SV_

class canfd_virtual_sequencer extends uvm_sequencer;

    canfd_config    sct_cfg;

    canphy_sequencer     canphy_seqr;
    axi4lite_sequencer   axi4lite_seqr;

    `uvm_component_utils_begin(canfd_virtual_sequencer)
        `uvm_field_object(canphy_seqr,   UVM_ALL_ON)
        `uvm_field_object(axi4lite_seqr, UVM_ALL_ON)
    `uvm_field_utils_end

    function new(string name="canfd_virtual_sequencer", uvm_component parent=null);
        super.new(name, parent);
    endfunction

endclass

`endif
