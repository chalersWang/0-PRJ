#/*Copyright 2020-2021 T-Head Semiconductor Co., Ltd.
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#*/
#
# 用例: memset —— 内存置位(memset),统计 CPU cycles
# 编译: source ../../sw/setup/setup_env.sh 后,在本目录执行:
#   make          = 编译 kcore0 + kcore1 (默认)
#   make kcore0   = 仅编译 CPU0, 产物在 kcore0/
#   make kcore1   = 仅编译 CPU1, 产物在 kcore1/
FILE             = memset
CPU_ARCH_FLAG_0 ?= e906f
CPU_ARCH_FLAG_1 ?= nodsp
SW_LIB           = ../../sw/lib
include $(SW_LIB)/Makefile
