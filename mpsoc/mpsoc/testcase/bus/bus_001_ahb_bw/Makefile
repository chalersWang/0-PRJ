#/*Copyright 2020-2021 T-Head Semiconductor Co., Ltd.
#Licensed under the Apache License, Version 2.0.
#*/
#
# 用例: TST-BUS-001 AHB 总线带宽
# 编译: source ../../sw/setup/setup_env.sh 后,在本目录执行:
#   make          = 编译 kcore0 + kcore1 (默认)
#   make kcore0   = 仅编译 CPU0, 产物在 kcore0/
#   make kcore1   = 仅编译 CPU1, 产物在 kcore1/
FILE             = bus_001_ahb_bw
CPU_ARCH_FLAG_0 ?= e906f
CPU_ARCH_FLAG_1 ?= nodsp
SW_LIB           = ../../sw/lib
include $(SW_LIB)/Makefile
