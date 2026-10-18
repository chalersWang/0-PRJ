TC=demo
TEST_DIR:=${VERIFY_HOME}/build/${TC}
#DEBUG=DUMP_FSDB_FILE
DEBUG=
MY_FSDB_DUMP       ?= on

print:
	@echo " ============================================= "
	@echo "|  case : ${TC}                               "
	@echo "|  dir  : ${TEST_DIR}                         "
	@echo " ============================================= "

# 仅确保 case 目录存在（仿真/单步编译前调用，不删除已有产物）
prepare_dir:
	@mkdir -p ${TEST_DIR}

# 清理并重建 case 目录（编译前调用，保证全新编译）
clean_tc:
	@rm -rf ${TEST_DIR}
	@mkdir -p ${TEST_DIR}

#clean_all:
#   @rm -rf ${VERIFY_HOME}/build/*

clean:
	@rm -rf ${TEST_DIR}

.PHONY: prepare_dir clean_tc clean print

comp_vhdl: print prepare_dir
	cd ${TEST_DIR} && vhdlan \
	-full64 \
	-nc \
	-l compile_vhd.log \
	-kdb \
	-f ${VERIFY_HOME}/filelist/vhdl.f
#-reportstats

comp_verilog: print prepare_dir
	cd ${TEST_DIR} && vlogan \
	-full64 \
	-l compile_verilog.log \
	+v2k \
	-kdb \
	+define+DUMP_FSDB_FILE \
	-sverilog \
	-debug_access_all \
	-timescale=1ns/10ps \
	+notimingcheck +nospecify \
	+libext+.sv+.vp+.svh+.vlib \
	+systemverilogext+.svh \
	+define+SYNOPSYS_SV+NTB \
	+define+notiming \
	+define+functional \
	+define+${DEBUG} \
	-error=noMPD \
	+incdir+${VCS_HOME}/etc/uvm-1.2 \
	+define+TPGM_MIN=30 \
	+define+TPGM_MAX=50 \
	-ntb_opts uvm-1.2 \
	-f ${VERIFY_HOME}/filelist/rtl.f \
	-f ${VERIFY_HOME}/filelist/tb.f

comp: clean_tc comp_vhdl comp_verilog
	cd ${TEST_DIR} && vcs \
	-full64 \
	-kdb \
	+UVM_TESTNAME=${TC} \
	-y ./mylib_vhdl -v work.lib++ \
	-l elab.log \
	-o simv \
	-sverilog \
	+evalorder \
	+vcs+lic+wait \
	+lint=TFIPC-L +lint=PCWM \
	-timescale=1ns/10ps \
	-debug_region+cell+encrypt \
	+Marchive=1000 \
	+notimingcheck +nospecify \
	-top tb_top \
	-ntb_opts uvm-1.2 \
	+vcs+initreg+random \
	-P ${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab ${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a \
	+warn=noIAVCVF-W \
	+warn=noDRTZ

sim: prepare_dir
	cd ${TEST_DIR} && ./simv \
	+UVM_TESTNAME=${TC} \
	-l simulation.log \
	+UVM_VERBOSITY=UVM_MEDIUM \
	+UVM_TIMEOUT="1000000000ps,YES" \
	-debug_access=all \
	+fsdb+all \
	+vcs+ignorestop \
	+vcs+loopreport+2 \
	+vcs+loopdetect \
	+vcs+initreg+random \
	+warn=noTFIPC \
	-timescale=1ns/10ps
