`ifndef _CANFD_EnvTop_SV_
`define _CANFD_EnvTop_SV_

`include "uvm_macros.svh"

package canfd_EnvTop;

    import uvm_pkg::*;
    import canphy_UvcTop::*;
    import axi4lite_UvcTop::*;

    typedef class canfd_config;
    typedef class canfd_event;
    typedef class canfd_ref_model;
    typedef class canfd_scoreboard;
    typedef class canfd_virtual_sequencer;
    typedef class canfd_env;

    `include "canfd_config.sv"
    `include "canfd_event.sv"
    `include "canfd_ref_model.sv"
    `include "canfd_scoreboard.sv"
    `include "canfd_virtual_sequencer.sv"
    `include "canfd_env.sv"
    `include "canfd_reg_adapter.sv"
    `include "canfd_reg_block.sv"

endpackage

`endif
