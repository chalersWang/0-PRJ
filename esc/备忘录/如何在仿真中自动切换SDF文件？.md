如何在仿真中自动切换SDF文件？
在标准的 Verilog 仿真流程中，无法直接在一次仿真运行中“热切换”SDF 文件（即不能先反标 shift.sdf，跑一半卸载掉，再反标 slow_capture.sdf）。
这是因为 SDF 的反标（Annotate）是在仿真开始前的初始化阶段完成的，它直接修改了单元内部的延迟参数。一旦仿真开始（$run），这些延迟数据就被固化了。
要在仿真中实现“Shift 用 Fast SDF，Capture 用 Slow SDF”的效果，通常有以下三种主流的解决方案：
方案一：分段仿真 + 检查点（最推荐，精度高）
这是目前工业界验证 Stuck-at 时序最常用的方法。利用仿真器的 Save/Restore 功能，将一次长仿真拆分为两段独立的物理运行过程。
操作流程：
第一阶段 (Shift)：
加载 shift.sdf (Fast/Best)。
编译并启动仿真。
运行 Shift 过程，直到即将进入 Capture 的前一刻。
使用 $save("checkpoint.db") 保存仿真状态，然后退出。
第二阶段 (Capture)：
重新编译仿真（这次加载 slow_capture.sdf / Slow/Worst）。
启动仿真时，使用 -restore checkpoint.db (VCS) 或类似命令恢复状态。
此时，电路的状态（寄存器值、信号电平）与第一阶段结束时完全一致，但底层的时序延迟参数已经变成了 Slow Corner。
继续运行 Capture 阶段的时钟。
优点：时序最准确，完全符合物理现实（Shift 是快路径，Capture 是慢路径）。 缺点：需要仿真器支持 Checkpoint 功能（通常需要 License），且流程稍微繁琐。

方案二：条件延迟选择（代码级修改，无需重跑）
如果你不想分段跑仿真，可以在 RTL 或门级网表中修改代码，通过控制信号动态选择不同的延迟路径。这通常用于功能验证而非严格的时序签核。
原理： 在关键路径上插入多路选择器（Mux），根据 scan_en 信号选择是使用“快延迟”还是“慢延迟”。
SystemVerilog 示例：

// 伪代码示例
wire delayed_data_fast;
wire delayed_data_slow;

// 实例化两个不同延迟的缓冲器（或者使用 specify 块控制）
buf #(.DELAY(1)) u_fast (.in(data), .out(delayed_data_fast)); // 模拟 Fast SDF
buf #(.DELAY(10)) u_slow (.in(data), .out(delayed_data_slow)); // 模拟 Slow SDF

// 根据 scan_en 选择延迟
// Shift 模式 (scan_en=1): 选 fast，防止 Hold 违例导致仿真报错
// Capture 模式 (scan_en=0): 选 slow，模拟 Setup 违例风险
assign final_data = scan_en ? delayed_data_fast : delayed_data_slow;
注意：在实际门级仿真中，这通常通过编写复杂的 specify 块或使用带有 if (condition) 的 SDF 条件反标来实现，而不是改 RTL。
优点：一次编译，一次运行，波形连续。 缺点：设置极其复杂，且很难精确对应到真实的工艺角（Real Silicon 不会动态变工艺角，这只是行为级模拟）。

方案三：保守策略（只用 Slow SDF）
在很多非签核级的回归测试中，为了省事，工程师会全程只加载 slow_capture.sdf。
逻辑如下：
对于 Capture：Slow SDF 是正确的，能检测 Setup 违例。
对于 Shift：Slow SDF 会导致信号变慢。
结果：Shift 阶段几乎不可能出现 Hold 违例（因为数据跑得慢，正好满足 Hold 时间）。虽然 Shift 速度变慢了，不符合实际 ATE 的高速移位场景，但对于验证“逻辑功能是否正确”通常是可接受的。
警告：这种方法漏掉了 Shift 阶段的 Hold Time 检查。如果你的项目对时序要求严格，必须使用方案一补充一个 Fast SDF 的仿真来专门抓 Hold 违例。
总结建议
如果你是做功能调试：直接用 slow_capture.sdf 跑完全程即可，忽略 Shift 阶段的时序不准确性。
如果你是做签核/交付：必须使用 方案一（分段仿真）。先跑 Fast SDF 确认无 Hold 违例，再跑 Slow SDF 确认无 Setup 违例。
