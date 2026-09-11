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
# E906 交叉工具链配置（bash 版，对齐 SourceMe 的 bash 语法）
# 用法：
#   source sw/setup/setup_env.sh                    # 使用默认路径
#   source sw/setup/setup_env.sh /path/to/bin       # 指定工具链 bin 目录

TOOL_EXTENSION_DEFAULT=/tools/riscv/riscv64-elf-x86_64/bin

if [ -n "$1" ]; then
    TOOL_EXTENSION="$1"
elif [ -z "$TOOL_EXTENSION" ]; then
    TOOL_EXTENSION="$TOOL_EXTENSION_DEFAULT"
fi

export TOOL_EXTENSION

echo "Toolchain path(\$TOOL_EXTENSION):"
echo "    $TOOL_EXTENSION"

if [ -x "$TOOL_EXTENSION/riscv64-unknown-elf-gcc" ]; then
    echo "  -> riscv64-unknown-elf-gcc: FOUND"
else
    echo "  -> riscv64-unknown-elf-gcc: NOT FOUND"
    echo "     (请把 TOOL_EXTENSION 指到服务器上 T-Head 工具链的 bin 目录,"
    echo "      或用参数覆盖: source sw/setup/setup_env.sh /path/to/bin)"
fi
