// =============================================
// VHDL Design File List (vhdl.f)
// =============================================
// Purpose: VHDL设计代码文件列表
// VCS mixed-language flow: 将VHDL RTL / 第三方IP放在这里
//
// VCS 自动根据扩展名(.vhd/.vhdl)识别VHDL文件
// 仿真脚本在检测到vhdl.f存在时自动添加 -vhdl 编译选项
//
// Usage:
//   设置VHDL源码搜索路径
//   -vhdl -work <library_name>:<dir>
//   添加VHDL文件
//   <path_to_vhdl_file>.vhd
//   <path_to_vhdl_file>.vhdl
//
// Example:
//   -vhdl -work my_lib:${VERIFY_HOME}/../rtl/vhdl
//   ${VERIFY_HOME}/../rtl/vhdl/canfd_core.vhd
//   ${VERIFY_HOME}/../rtl/vhdl/canfd_arbiter.vhd
//   ${VERIFY_HOME}/../rtl/vhdl/canfd_bsp.vhd
// =============================================

// 空文件 - 有VHDL设计文件时取消下面注释并添加文件路径
//-vhdl -work canfd_lib:${VERIFY_HOME}/../rtl/vhdl

// +incdir+${VERIFY_HOME}/../rtl/vhdl
// ${VERIFY_HOME}/../rtl/vhdl/canfd_top.vhd
