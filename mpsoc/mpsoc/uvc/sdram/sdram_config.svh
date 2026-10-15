// ============================================================================
// 文件    : sdram_config.svh
// 功能    : SDRAM UVC 配置对象
//           - is_active : UVM_ACTIVE（含 driver+sequencer）/ UVM_PASSIVE（仅 monitor）
//           - 时序参数（供 driver/monitor 使用）
// ============================================================================

class sdram_config extends uvm_object;

  `uvm_object_utils(sdram_config)

  // ---- 组件开关 ------------------------------------------------------------
  uvm_active_passive_enum is_active = UVM_ACTIVE;

  // ---- 接口（由 env/test 注入）---------------------------------------------
  virtual sdram_if vif;

  // ---- 时序参数（与 sdram_model 参数一致）----------------------------------
  int cl        = 3;    // CAS 延迟
  int bl        = 4;    // 突发长度
  int tRCD      = 3;    // ACT->RD/WR
  int tRP       = 3;    // PRE->ACT
  int tINIT     = 8;    // 上电稳定周期
  int numInitRef = 8;   // 上电刷新次数
  int tRC       = 7;    // ACT->ACT
  int tXSR      = 7;    // 自刷新退出 NOP

  // ---- 日志控制 ------------------------------------------------------------
  bit print_cmd = 1;    // 打印命令

  function new(string name = "sdram_config");
    super.new(name);
  endfunction

  function string convert2string();
    return $sformatf("is_active=%s cl=%0d bl=%0d tRCD=%0d tRP=%0d tINIT=%0d numInitRef=%0d",
                     is_active.name(), cl, bl, tRCD, tRP, tINIT, numInitRef);
  endfunction

endclass
