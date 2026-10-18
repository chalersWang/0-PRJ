# Synopsys DesignWare VIP 封装层

本目录(`uvc/VIP/`)存放 **Synopsys DesignWare VIP(`svt_*` 系列)** 在本验证环境中的封装层,与 `uvc/` 下 19 个自研 UVC 并存、可交叉验证对比。

## 为什么单独建 VIP 目录

自研 UVC(`uvc/i2c/`、`uvc/spi/` …)是从零实现的轻量 UVC;Synopsys VIP 是商业协议库,自带 configuration/agent/sequence 等完整组件。二者 API 完全不同,故 VIP 封装独立放在 `VIP/` 下,通过 `svt_` 前缀与自研 UVC 区分。

## 目录结构

```
uvc/VIP/<name>/                 # <name> ∈ {i2c, spi, uart, axi, ahb, apb, gpio, wdt, timer, qspi, jtag}
├── svt_<name>_config.sv        # config 封装:继承 svt_<name>_configuration + 本环境控制字段
├── svt_<name>_agent.sv         # agent 封装:例化 svt master/slave agent,下发 config/interface
├── svt_<name>_sequence_lib.sv  # sequence 封装:base_sequence + demo_sequence
└── svt_<name>_UvcTop.svh       # package 定义(import svt_uvm_pkg + include 上述三件)
testcase/vip/svt_<name>_demo_test.sv   # 每 VIP 一个 demo case
```

## VIP 清单与分类

| 类别 | VIP | 内部例化的 Synopsys 子 agent |
|------|-----|------------------------------|
| 双 agent(master/slave) | i2c、spi、axi、ahb、apb | `svt_<name>_master_agent` + `svt_<name>_slave_agent` |
| 单 agent | uart、gpio、wdt、timer、qspi、jtag | `svt_<name>_agent` |

## 命名约定

- package / 类名统一 **`svt_` 前缀**:`svt_<name>_UvcTop`、`svt_<name>_config`。
- agent 封装类统一 **`_wrap` 后缀**(`svt_<name>_agent_wrap`):避免与 Synopsys 库同名 agent(`svt_uart_agent`、`svt_gpio_agent` …)冲突。
- config 封装类继承 `svt_<name>_configuration`,名称为 `svt_<name>_config`(与 Synopsys 的 `_configuration` 区分)。

## 依赖

- **`svt_uvm_pkg`**:Synopsys VIP 的 UVM 包,来自商业 VIP 库(`SourceMe` 中 `$DESIGNWARE_HOME` / `${LIB_PATH}`)。
- 编译时需 `+incdir+${XX_VIP_HOME}/include`、`+incdir+${XX_VIP_HOME}/vcs`(见 `filelist/vip.f`)。

> ⚠️ 本封装按 Synopsys DesignWare VIP 通用命名书写;**wdt/timer/qspi 的具体类名存在版本差异**(可能为 `svt_watchdog_*` / `svt_timers_*` / `svt_spi_flash_*`),且 agent 的 `config_db` key(`"cfg"`/`"vif"`)与 sequencer 属性名需以所装 VIP 的 databook 为准。

## 接入步骤(在服务器、VIP 库就绪后)

当前为**预留接入点**状态,以下 import/include 均以注释形式存在于对应文件,接入时取消注释即可:

1. **`env/mpsoc_EnvTop.svh`** —— 取消 `import svt_uvm_pkg::*;` 与各 `import svt_<name>_UvcTop::*;` 注释。
2. **`testcase/mpsoc_TestTop.svh`** —— 取消 `import svt_uvm_pkg::*;`、各 `import svt_<name>_UvcTop::*;` 及各 `include "testcase/vip/svt_<name>_demo_test.sv"` 注释。
3. **`filelist/vip.f`** —— 取消 `+incdir+${XX_VIP_HOME}/...` 与封装 `.sv` 的 include 注释,填实际 VIP 库路径。
4. **`tb/tb_top.sv`** —— 例化各 `svt_<name>_if` interface,并通过 `uvm_config_db` set 给测试(见文件内预留示例)。
5. **`testplan/<group>/test.json`** —— 添加 `"svt_<name>_demo_test": {"uvm_testname": "svt_<name>_demo_test"}` 以被回归发现。

## 验证

本地 macOS 无 Synopsys VIP 库、无 EDA 工具、DUT RTL 缺失,无法编译/仿真。当前以**静态核对**为主:目录结构、命名一致性(`svt_` 前缀 / `_wrap` 后缀)、接入点均为注释(不破坏现有编译)。
