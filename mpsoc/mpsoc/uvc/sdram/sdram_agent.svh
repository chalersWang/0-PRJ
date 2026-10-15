// ============================================================================
// 文件    : sdram_agent.svh
// 功能    : SDRAM 代理（UVM agent）
//           active  模式：sequencer + driver + monitor
//           passive 模式：仅 monitor（用于集成到控制器验证环境观察总线）
// ============================================================================

class sdram_agent extends uvm_agent;

  `uvm_component_utils(sdram_agent)

  sdram_config                       cfg;
  uvm_sequencer #(sdram_seq_item)    sqr;
  sdram_driver                       drv;
  sdram_monitor                      mon;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(sdram_config)::get(this, "", "sdram_config", cfg))
      `uvm_fatal(get_type_name(), "sdram_config (sdram_config) not found in config_db")

    mon = sdram_monitor::type_id::create("mon", this);
    if (cfg.is_active == UVM_ACTIVE) begin
      sqr = uvm_sequencer#(sdram_seq_item)::type_id::create("sqr", this);
      drv = sdram_driver::type_id::create("drv", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (drv != null)
      drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction

endclass
