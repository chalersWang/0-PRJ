# =============================================================================
# mpsoc 验证环境顶层 Makefile —— 在一级目录直接执行,无需 cd build
#
#   make comp TC=<uvm_test_name>   # 编译 (vhdlan + vlogan + vcs) -> build/<TC>/
#   make sim  TC=<uvm_test_name>   # 仿真 -> build/<TC>/
#   make clean TC=<uvm_test_name>  # 清理该用例产物 -> 删除 build/<TC>/
#
#   底层编译/仿真命令与内网一致(见 build/Makefile);每个 case 的所有产物统一生成在
#   build/<TC>/ 下(不区分 comp/sim 子目录)。
#   <uvm_test_name> 即 UVM test 类名,例如 mpsoc_demo_test。
# =============================================================================
TC ?=

ifeq ($(strip $(TC)),)
$(error TC is required, e.g. "make comp TC=mpsoc_demo_test")
endif

ifeq ($(strip $(VERIFY_HOME)),)
$(error VERIFY_HOME is not set, please run "source SourceMe" first)
endif

export VERIFY_HOME

.PHONY: comp sim clean

# 委托到 build/Makefile(cd build 执行,与内网手动流程一致;VCS 中间文件也落在 build/)
comp sim:
	$(MAKE) -C build $@ TC=$(TC)

clean:
	rm -rf $(VERIFY_HOME)/build/$(TC)
