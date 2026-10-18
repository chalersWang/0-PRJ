// ============================================================================
// 文件    : sdram_env.svh
// 功能    : SDRAM 验证环境（UVM env）
//           例化 sdram_agent（active/passive 由 cfg 决定）。
//           预留 scoreboard 接口：连接 agent.mon.ap 即可做数据比对。
// ============================================================================

class sdram_env extends uvm_env;

  `uvm_component_utils(sdram_env)

  sdram_config cfg;
  sdram_agent  agt;

  // ---- 可选挂件 -------------------------------------------------------------
  // uvm_scoreboard / coverage collector 等由用户在子类中连接
  // uvm_analysis_imp / uvm_tlm_fifo 示例：
  // uvm_tlm_fifo #(sdram_seq_item) mon_fifo;
  // function void connect_phase(...);
  //   agt.mon.ap.connect(mon_fifo.analysis_export);
  // endfunction

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(sdram_config)::get(this, "", "sdram_config", cfg))
      `uvm_fatal(get_type_name(), "sdram_config (sdram_config) not found in config_db")

    agt = sdram_agent::type_id::create("agt", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

endclass
