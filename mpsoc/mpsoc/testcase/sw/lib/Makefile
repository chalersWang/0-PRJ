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
# 共享编译规则（就地编译版）：
#   供 testcase/cpu/<case>/Makefile 通过 `include` 复用。
#   每个用例目录内就地生成 .o/.elf/.hex/.pat/.bin，与 C 源 + SV case 同目录。
#
# 用例 Makefile 需预先设置（可被命令行覆盖）：
#   FILE             = <目标名>                 # 必填
#   CPU_ARCH_FLAG_0 ?= e906f                    # e906 / e906f / e906d
#   CPU_ARCH_FLAG_1 ?= nodsp                    # nodsp / dsp
#   SW_LIB           = ../../sw/lib             # 本文件所在目录（相对 case 目录）
#   TOOL_EXTENSION  ?= /tools/riscv/riscv64-elf-x86_64/bin

# 显式指定默认目标:否则 make 无参数时会默认构建第一个显式目标 ${FILE}.elf,
# 而不会走 all 的完整链(elf→hex→pat→obj→bin)
.DEFAULT_GOAL := all

# ---- 交叉工具链 ----
TOOL_EXTENSION ?= /tools/riscv/riscv64-elf-x86_64/bin
CC       = $(TOOL_EXTENSION)/riscv64-unknown-elf-gcc
AS       = $(TOOL_EXTENSION)/riscv64-unknown-elf-as
LINK     = $(TOOL_EXTENSION)/riscv64-unknown-elf-ld
OBJDUMP  = $(TOOL_EXTENSION)/riscv64-unknown-elf-objdump
OBJCOPY  = $(TOOL_EXTENSION)/riscv64-unknown-elf-objcopy
CONVERT  = $(SW_LIB)/../bin/Srec2vmem

# ---- 库路径与头文件 ----
CLIB    = $(SW_LIB)/clib
NEWLIB  = $(SW_LIB)/newlib_wrap
INCLUDE = -I$(CLIB) -I$(NEWLIB)

# ---- 源文件（用例目录 + 库目录，经 vpath 定位）----
vpath %.c . $(CLIB) $(NEWLIB)
vpath %.s . $(SW_LIB)
vpath %.S . $(SW_LIB)

CSRC    = $(notdir $(wildcard *.c $(CLIB)/*.c $(NEWLIB)/*.c))
sSRC    = $(notdir $(wildcard *.s $(SW_LIB)/*.s))
SSRC    = $(notdir $(wildcard *.S $(SW_LIB)/*.S))

OBJECTS = $(CSRC:%.c=%.o) $(sSRC:%.s=%.o) $(SSRC:%.S=%.o)

# ---- arch / abi 标志（对齐 T-Head smart_run 原版）----
FLAG_ABI   =
FLAG_MARCH = -mtune=e906
#CPU_ARCH_FLAG_0 => CPU Arch: e906, e906f, e906d
#CPU_ARCH_FLAG_1 => DSP: dsp, nodsp
ifeq (${CPU_ARCH_FLAG_1}, nodsp)
  ifeq (${CPU_ARCH_FLAG_0}, e906f)
    FLAG_MARCH += -march=rv32imafc
    FLAG_ABI   = -mabi=ilp32f
  else
    ifeq (${CPU_ARCH_FLAG_0}, e906d)
      FLAG_MARCH += -march=rv32imafdc
      FLAG_ABI   = -mabi=ilp32d
    else
      FLAG_MARCH += -march=rv32imac
      FLAG_ABI   = -mabi=ilp32
    endif
  endif
else
  ifeq (${CPU_ARCH_FLAG_0}, e906f)
    FLAG_MARCH += -march=rv32imafcpzp64
    FLAG_ABI   = -mabi=ilp32f
  else
    ifeq (${CPU_ARCH_FLAG_0}, e906d)
      FLAG_MARCH += -march=rv32imafdcpzp64
      FLAG_ABI   = -mabi=ilp32d
    else
      FLAG_MARCH += -march=rv32imacpzp64
      FLAG_ABI   = -mabi=ilp32
    endif
  endif
endif

CFLAGS     = ${FLAG_MARCH} ${FLAG_ABI} -O2
LINKFLAGS  = -T$(SW_LIB)/linker.lcf -nostartfiles ${FLAG_MARCH} ${FLAG_ABI}
LINKLIBS   = -lc -lgcc
OBJDUMPFLAGS = -S -Mnumeric
HEXFLAGS   = -O srec

INST_HEX = ${FILE}_inst.hex
DATA_HEX = ${FILE}_data.hex
FILE_HEX = ${FILE}.hex

INST_PAT = inst.pat
DATA_PAT = data.pat
FILE_PAT = case.pat

# ---- 编译规则 ----
%.o : %.c
	${CC} -c ${CFLAGS} ${INCLUDE} -o $@ $<

%.o : %.s
	${CC} -c ${CFLAGS} ${INCLUDE} -o $@ $<

%.o : %.S
	${CC} -c ${CFLAGS} ${INCLUDE} -o $@ $<

${FILE}.elf : ${OBJECTS} $(SW_LIB)/linker.lcf
	${CC} ${LINKFLAGS} ${LINKLIBS} ${OBJECTS} -o $@ -lm

${FILE}.obj : ${FILE}.elf
	${OBJDUMP} ${OBJDUMPFLAGS} $< > $@

${FILE}.bin : ${FILE}.elf
	${OBJCOPY} -O binary $< $@

${FILE}.hex : ${FILE}.elf
	${OBJCOPY} ${HEXFLAGS} $< ${INST_HEX} -j .text* -j .rodata* -j .eh_frame*
	${OBJCOPY} ${HEXFLAGS} $< ${DATA_HEX} -j .data* -j .bss -j .COMMON
	${OBJCOPY} ${HEXFLAGS} $< $@

${FILE}.pat : ${FILE}.hex
	rm -f *.pat
	${CONVERT} ${INST_HEX} ${INST_PAT}
	${CONVERT} ${DATA_HEX} ${DATA_PAT}
	${CONVERT} ${FILE_HEX} ${FILE_PAT}

# ---- 目标 ----
.PHONY : all clean
all : ${FILE}.pat ${FILE}.hex ${FILE}.elf ${FILE}.obj ${FILE}.bin

clean :
	rm -rf *.o *.pat *.obj *.hex *.elf *.bin
