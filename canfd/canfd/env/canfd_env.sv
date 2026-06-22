`ifndef _CANFD_ENV_SV_
`define _CANFD_ENV_SV_

class canfd_env extends uvm_env;

    canfd_config             canfd_cfg;
    canfd_event              canfd_evt;
    canfd_virtual_sequencer  canfd_vseqr;
    canfd_scoreboard         canfd_scb;

    // UVC Agents
    canphy_agent             canphy_agt;     // CAN PHY (总线侧)
    axi4lite_agent           axi4lite_agt;   // AXI4-Lite (主机侧)

    `ifdef REG_MODEL
        canfd_reg_block  RegModel;
    `endif

    `uvm_component_utils(canfd_env)

    function new(string name="canfd_env", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_full_name(), "build_phase begin", UVM_LOW)

        canfd_cfg   = canfd_config::type_id::create("canfd_cfg", this);
        canfd_evt   = canfd_event::type_id::create("canfd_evt", this);
        canfd_vseqr = canfd_virtual_sequencer::type_id::create("canfd_vseqr", this);
        canfd_scb   = canfd_scoreboard::type_id::create("canfd_scb", this);

        canphy_agt   = canphy_agent::type_id::create("canphy_agt", this);
        axi4lite_agt = axi4lite_agent::type_id::create("axi4lite_agt", this);

        uvm_config_db#(canfd_config)::set(null, "", "canfd_config", canfd_cfg);
        uvm_config_db#(canfd_event)::set(null, "", "canfd_event", canfd_evt);

        `ifdef REG_MODEL
            RegModel = canfd_reg_block::type_id::create("RegModel", this);
            RegModel.build();
            uvm_config_db#(canfd_reg_block)::set(this, "*", "RegModel", RegModel);
        `endif

        `uvm_info(get_full_name(), "build_phase end", UVM_LOW)
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info(get_full_name(), "connect_phase begin", UVM_LOW)

        // Monitor → Scoreboard 数据流 (方向感知)
        canphy_agt.canphy_mon.mon_analysis_port.connect(canfd_scb.canphy_analysis_fifo.analysis_export);
        canphy_agt.canphy_mon.mon_tx_analysis_port.connect(canfd_scb.canphy_tx_analysis_fifo.analysis_export);
        canphy_agt.canphy_mon.mon_rx_analysis_port.connect(canfd_scb.canphy_rx_analysis_fifo.analysis_export);
        axi4lite_agt.axi4lite_mon.mon_analysis_port.connect(canfd_scb.axi4lite_analysis_fifo.analysis_export);

        // Virtual Sequencer → 子 Sequencer
        canfd_vseqr.canphy_seqr   = canphy_agt.canphy_seqr;
        canfd_vseqr.axi4lite_seqr = axi4lite_agt.axi4lite_seqr;

        `uvm_info(get_full_name(), "connect_phase end", UVM_LOW)
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        `ifdef REG_MODEL
            RegModel.lock_model();
            `uvm_info(get_type_name(), "Register Model locked.", UVM_MEDIUM)
        `endif
    endfunction

endclass

`endif
