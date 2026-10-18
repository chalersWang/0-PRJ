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
# 共享编译规则（就地编译版，双核 AMP 支持）：
#   供 testcase/cpu/<case>/Makefile 通过 `include` 复用。
#   每个用例分 kcore0/ kcore1/ 两个核目录，C 源置于对应目录内，
#   编译产物（.o/.elf/.hex/.pat/.bin）就地生成在各自的核目录。
#
# 用例 Makefile 需预先设置（可被命令行覆盖）：
#   FILE             = <目标名>                 # 必填
#   CPU_ARCH_FLAG_0 ?= e906f                    # e906 / e906f / e906d
#   CPU_ARCH_FLAG_1 ?= nodsp                    # nodsp / dsp
#   SW_LIB           = ../../sw/lib             # 本文件所在目录（相对 case 目录）
#   TOOL_EXTENSION  ?= /home/edatools/Xuantie/gcc/Xuantie-900-gcc-elf-newlib-x86_64-V2.6.2/bin
#
# 双核编译目标（由本文件统一提供）：
#   make            = 编译 kcore0 + kcore1（默认）
#   make kcore0     = 仅编译 CPU0, 产物生成在 kcore0/
#   make kcore1     = 仅编译 CPU1, 产物生成在 kcore1/
#   make kcore      = 编译 kcore0 + kcore1, 产物各自目录
#   make clean      = 清理两个核目录的产物

# 显式指定默认目标:make 无参数时默认编译双核(kcore0+kcore1)
.DEFAULT_GOAL := kcore

# ---- 双核支持:CORE 指定核目录 (kcore0/kcore1), 为空则就地编译 ----
ifneq ($(strip $(CORE)),)
  CORE_DIR   := $(CORE)
  OBJ_PREFIX := $(CORE)/
else
  CORE_DIR   := .
  OBJ_PREFIX :=
endif

# ---- 双核内存基址 (kcore0/kcore1, 经 --defsym 传入 linker.lcf) ----
ifeq ($(CORE), kcore0)
  IRAM_BASE = 0x0
  DRAM_BASE = 0x10000000
else ifeq ($(CORE), kcore1)
  IRAM_BASE = 0x20000000
  DRAM_BASE = 0x30000000
else
  IRAM_BASE = 0x0
  DRAM_BASE = 0x20000000
endif

DEFSYM_FLAGS = -Wl,--defsym=__iram_base=$(IRAM_BASE) -Wl,--defsym=__dram_base=$(DRAM_BASE)

# ---- 交叉工具链 ----
TOOL_EXTENSION ?= /home/edatools/Xuantie/gcc/Xuantie-900-gcc-elf-newlib-x86_64-V2.6.2/bin
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

# ---- 源文件（核目录 + 库目录，经 vpath 定位）----
vpath %.c $(CORE_DIR) $(CLIB) $(NEWLIB)
vpath %.s $(CORE_DIR) $(SW_LIB)
vpath %.S $(CORE_DIR) $(SW_LIB)

CSRC    = $(notdir $(wildcard $(CORE_DIR)/*.c $(CLIB)/*.c $(NEWLIB)/*.c))
sSRC    = $(notdir $(wildcard $(CORE_DIR)/*.s $(SW_LIB)/*.s))
SSRC    = $(notdir $(wildcard $(CORE_DIR)/*.S $(SW_LIB)/*.S))

OBJECTS = $(addprefix $(OBJ_PREFIX), $(CSRC:%.c=%.o) $(sSRC:%.s=%.o) $(SSRC:%.S=%.o))

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
LINKFLAGS  = -T$(SW_LIB)/linker.lcf -nostartfiles ${DEFSYM_FLAGS} ${FLAG_MARCH} ${FLAG_ABI}
LINKLIBS   = -lc -lgcc
OBJDUMPFLAGS = -S -Mnumeric
HEXFLAGS   = -O srec

# ---- 输出产物（置于核目录）----
ELF      = $(OBJ_PREFIX)$(FILE).elf
OBJ      = $(OBJ_PREFIX)$(FILE).obj
BIN      = $(OBJ_PREFIX)$(FILE).bin
HEX      = $(OBJ_PREFIX)$(FILE).hex
PAT      = $(OBJ_PREFIX)$(FILE).pat
INST_HEX = $(OBJ_PREFIX)$(FILE)_inst.hex
DATA_HEX = $(OBJ_PREFIX)$(FILE)_data.hex
INST_PAT = $(OBJ_PREFIX)inst.pat
DATA_PAT = $(OBJ_PREFIX)data.pat
FILE_PAT = $(OBJ_PREFIX)case.pat

# ---- 编译规则 ----
$(OBJ_PREFIX)%.o : %.c
	${CC} -c ${CFLAGS} ${INCLUDE} -o $@ $<

$(OBJ_PREFIX)%.o : %.s
	${CC} -c ${CFLAGS} ${INCLUDE} -o $@ $<

$(OBJ_PREFIX)%.o : %.S
	${CC} -c ${CFLAGS} ${INCLUDE} -o $@ $<

$(ELF) : $(OBJECTS) $(SW_LIB)/linker.lcf
	${CC} ${LINKFLAGS} ${LINKLIBS} $(OBJECTS) -o $@ -lm

$(OBJ) : $(ELF)
	${OBJDUMP} ${OBJDUMPFLAGS} $< > $@

$(BIN) : $(ELF)
	${OBJCOPY} -O binary $< $@

$(HEX) : $(ELF)
	${OBJCOPY} ${HEXFLAGS} $< $(INST_HEX) -j .text* -j .rodata* -j .eh_frame*
	${OBJCOPY} ${HEXFLAGS} $< $(DATA_HEX) -j .data* -j .bss -j .COMMON
	${OBJCOPY} ${HEXFLAGS} $< $@

$(PAT) : $(HEX)
	rm -f $(OBJ_PREFIX)*.pat
	${CONVERT} $(INST_HEX) $(INST_PAT)
	${CONVERT} $(DATA_HEX) $(DATA_PAT)
	${CONVERT} $(HEX) $(FILE_PAT)

# ---- 目标 ----
.PHONY : all clean kcore kcore0 kcore1
all : $(PAT) $(HEX) $(ELF) $(OBJ) $(BIN)

kcore : kcore0 kcore1

kcore0 :
	$(MAKE) CORE=kcore0 all

kcore1 :
	$(MAKE) CORE=kcore1 all

clean :
	rm -rf kcore0/*.o kcore0/*.pat kcore0/*.obj kcore0/*.hex kcore0/*.elf kcore0/*.bin
	rm -rf kcore1/*.o kcore1/*.pat kcore1/*.obj kcore1/*.hex kcore1/*.elf kcore1/*.bin
	rm -rf *.o *.pat *.obj *.hex *.elf *.bin
