# =============================================================================
# mpsoc 验证环境顶层 Makefile —— 在 VERIFY_HOME 一级目录直接执行,无需 cd 进构建目录
#
#   make comp TC=<uvm_test_name>   # 编译 -> build/<TC>/ (simv 等编译产物)
#   make sim  TC=<uvm_test_name>   # 仿真 -> build/<TC>/ (sim.log 与 simv 同目录)
#   make clean TC=<uvm_test_name>  # 清理 -> 删除 build/<TC>/
#
#   <uvm_test_name> 即 UVM test 类名,例如 mpsoc_demo_test / per_003_uart_loopback_test
# =============================================================================
TC ?=

ifeq ($(strip $(TC)),)
$(error TC is required, e.g. "make comp TC=mpsoc_demo_test")
endif

include run/Makefile
