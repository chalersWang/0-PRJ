在stuck-at仿真时，shift.sdf和slow_capture.sdf应该如何加？
在进行 Stuck-at 测试的时序仿真时，shift.sdf 和 slow_capture.sdf 不能同时加载，也不能在同一个仿真过程中直接切换。
你需要将 Stuck-at 测试分为两个独立的阶段（Shift 阶段和 Capture 阶段）分别进行仿真。这是因为 SDF 文件中的时序数据是基于特定的工艺角（Process Corner）生成的，而 Shift 和 Slow Capture 关注的时序检查点不同。
以下是具体的操作步骤和原理：
核心原则：分阶段反标（Annotate）
Stuck-at 测试的流程通常是：Shift (Load) -> Capture -> Shift (Unload)。 为了验证时序是否满足要求，你需要针对这两个关键动作分别使用对应的 SDF 文件。
Shift 阶段：使用 shift.sdf
目的：验证扫描链（Scan Chain）在移位过程中的保持时间（Hold Time）。
SDF 选择：通常使用 Fast/Best 工艺角生成的 SDF（即你提到的 shift.sdf）。
原因：在 Shift 模式下，时钟频率通常较低，建立时间（Setup）一般不是问题。但由于数据在扫描链中快速传递，主要风险是前一级的数据太快到达，导致后一级触发器的 Hold 违例。Fast 工艺角对应最小延迟，最容易暴露 Hold 问题。
操作：
在仿真开始时，加载 shift.sdf。
运行仿真直到 Shift 过程结束（即所有测试向量 Load 完成，准备进入 Capture 之前）。
Capture 阶段：使用 slow_capture.sdf
目的：验证组合逻辑路径的建立时间（Setup Time）。
SDF 选择：必须使用 Slow/Worst 工艺角生成的 SDF（即你提到的 slow_capture.sdf）。
原因：Capture 阶段需要检测路径上的 Delay Fault（虽然 Stuck-at 主要测固定故障，但 Capture 脉冲仍需满足 Setup）。Slow 工艺角对应最大延迟，用来检查信号是否能在时钟沿到来前稳定下来。
操作：
关键点：标准的 Verilog 仿真器（如 VCS, Xcelium）通常不支持在仿真中途动态切换 SDF 文件来改变单元延迟。
解决方案：通常的做法是分段仿真或者重新运行 Capture 片段。
方法 A（推荐，严谨）：单独提取 Capture 阶段的激励进行仿真。重新初始化状态（或者从 Save/Restore checkpoint 恢复），加载 slow_capture.sdf，然后只跑 Capture 的那一拍或几拍时钟。
方法 B（宽松/功能验证）：如果你只是想看波形功能是否正确，而不纠结于极端的时序违例报告，有时工程师会直接在 Shift 阶段用 Fast SDF，然后在 Capture 阶段手动忽略 Hold 检查（如果工具支持），但这在签核（Sign-off）阶段是不允许的。
总结与建议流程
为了确保覆盖率并准确发现时序问题，建议采用以下流程：

常见误区提醒
不要混用：千万不要试图把 shift.sdf 和 slow_capture.sdf 的内容合并到一个文件中反标，因为同一个单元在 Fast 和 Slow 角下的延迟参数是冲突的。
LSCAP 特殊情况：如果你是在做 At-Speed 测试（如 LSCAP/Launch-Shift-Capture），时序要求更严，通常需要使用专门的 OCC（片上时钟控制器）模块产生的时钟，并且 SDF 的反标策略会更加复杂（可能涉及 Launch 和 Capture 时钟域的不同约束）。但对于纯 Stuck-at，上述“分两步走”是最稳妥的方法。
死循环问题：在 Capture 阶段，由于使用了 Slow SDF，如果组合逻辑路径延迟过大超过了时钟周期，可能会导致仿真器报出 Setup 违例（Timing Violation），这在仿真中是正常的现象（意味着芯片可能测不通），你需要检查这些违例是否导致了逻辑错误。
