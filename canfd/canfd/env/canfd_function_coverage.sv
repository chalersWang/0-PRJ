`ifndef _CANFD_FUNCTION_COVERAGE_SV_
`define _CANFD_FUNCTION_COVERAGE_SV_

// 功能覆盖率收集 — 按 VFP 验证功能点定义
`ifdef COVERAGE_CANPHY
    `include "canphy_function_coverage.sv"
`endif
`ifdef COVERAGE_AXI4LITE
    `include "axi4lite_function_coverage.sv"
`endif

`endif
