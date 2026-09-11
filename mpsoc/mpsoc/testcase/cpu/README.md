# CPU 软件测试（E906）

本目录存放需要 **E906 交叉编译** 的软件测试用例。每个用例一个子目录，内含 **C 程序 + SV case + 编译产物（elf/bin/pat）**，三者同目录。

## 目录约定

```
testcase/
├── sw/                             # 共享编译环境（工具链配置 + C库 + 编译规则 + 转换器）
│   ├── setup/                      #   TOOL_EXTENSION 工具链配置（setup_env.sh）
│   ├── lib/                        #   Makefile 编译规则 + linker.lcf + crt0.s + clib
│   └── bin/Srec2vmem               #   srec→pat 转换器
└── cpu/                            # CPU 软件测试，每个用例一个子目录
    ├── hello_world/
    │   ├── hello_world_main.c      # C 程序（来自 T-head-Semi/opene906）
    │   ├── hello_world_test.sv     # 配套 SV case（UVM test，待 RTL 接入）
    │   ├── Makefile                # 编译脚本（include 共享规则）
    │   └── 编译后生成：
    │       hello_world.elf         # ELF 可执行
    │       hello_world.bin         # 裸二进制（objcopy -O binary）
    │       inst.pat / data.pat     # 指令/数据 memory pattern（RTL $readmemh）
    │       hello_world.obj / .hex  # 反汇编 / srec 中间产物
    ├── memcp/                      # 内存拷贝（memcpy + cycles 统计）
    └── memset/                     # 内存置位（memset + cycles 统计）
```

共享编译环境在 `testcase/sw/`：`lib/Makefile` 编译规则、`lib/clib` 最小C库、
`lib/crt0.s` 启动代码、`lib/linker.lcf` 链接脚本、`bin/Srec2vmem` 转换器。

## 编译

1. 配置工具链路径（在 **Linux 服务器** 上，交叉编译器为 T-Head `riscv64-unknown-elf-*`）：

   ```bash
   source testcase/sw/setup/setup_env.sh                  # 默认 /tools/riscv/riscv64-elf-x86_64/bin
   # 或指定路径：
   source testcase/sw/setup/setup_env.sh /path/to/toolchain/bin
   ```

   （`SourceMe` 已自动 source 该脚本。）

2. 编译用例（在用例目录就地生成产物）：

   ```bash
   make -C testcase/cpu/hello_world CPU_ARCH_FLAG_0=e906f
   make -C testcase/cpu/memcp      CPU_ARCH_FLAG_0=e906f
   make -C testcase/cpu/memset     CPU_ARCH_FLAG_0=e906f
   ```

   - `CPU_ARCH_FLAG_0`：`e906`（rv32imac）/ `e906f`（rv32imafc，默认）/ `e906d`（rv32imafdc）
   - `CPU_ARCH_FLAG_1`：`nodsp`（默认）/ `dsp`（加 `pzp64` DSP 扩展）
   - 清理：`make -C testcase/cpu/hello_world clean`

## 编译产物链路

```
.c/.s ──gcc -c──▶ .o ──gcc -Tlinker.lcf -nostartfiles──▶ .elf
.elf ──objcopy -O srec──▶ _inst.hex / _data.hex ──Srec2vmem──▶ inst.pat / data.pat
.elf ──objcopy -O binary──▶ <name>.bin
```

## 新增用例

复制任一套目录为模板，改三处即可：

```bash
cp -r testcase/cpu/hello_world testcase/cpu/<new_case>
# 1) 放入你的 C 程序（替换 hello_world_main.c）
# 2) 改 Makefile 的 FILE = <new_case>
# 3) 把 hello_world_test.sv 改名并改写类名为 <new_case>_test
```

## SV case 接入 UVM（待 RTL 就绪）

当前 DUT 为 pad 级黑盒（E906 在 DUT 内部，`rtl.f` 为空，RTL 由设计团队提供），
因此各用例的 `*_test.sv` 暂 **未** include 进 UVM 编译，避免无 RTL 时编译报错。
待 RTL 与 memory 加载机制就绪后，按三步接入：

1. `filelist/tb.f` 追加：`+incdir+${VERIFY_HOME}/testcase/cpu/<case>`
2. `testcase/mpsoc_TestTop.svh` 追加：`` `include "<case>_test.sv" ``
3. 在 `*_test.sv` 的 `run_phase` 中：加载 `inst.pat`/`data.pat` 进 CPU 指令/数据
   memory → 释放复位启动 E906 → 轮询结果判断 PASS/FAIL。

## 来源与许可

- C 程序 / 编译脚本 / 库 / 转换器均来自 [T-head-Semi/opene906](https://github.com/T-head-Semi/opene906)（Apache-2.0），版权头保留。
- `testcase/sw/bin/Srec2vmem` 为 Linux x86_64 静态可执行文件，仅在 Linux 服务器上运行（macOS 本地无法执行）。
