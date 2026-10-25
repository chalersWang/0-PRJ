// 顶层 TB 编译 filelist(引用各目录 filelist.f)
${VCS_HOME}/etc/uvm-1.2/uvm_pkg.sv

// 覆盖率/配置目录（无独立 filelist.f，+incdir 保留在顶层）
+incdir+${VERIFY_HOME}/cfg
+incdir+${VERIFY_HOME}/coverage
+incdir+${VERIFY_HOME}/coverage/code

-f ${VERIFY_HOME}/addrmap/filelist.f
-f ${VERIFY_HOME}/env/filelist.f
-f ${VERIFY_HOME}/reference/filelist.f
-f ${VERIFY_HOME}/regmodel/filelist.f
-f ${VERIFY_HOME}/sva/filelist.f
-f ${VERIFY_HOME}/tb/filelist.f
-f ${VERIFY_HOME}/uvc/filelist.f
-f ${VERIFY_HOME}/testcase/filelist.f
