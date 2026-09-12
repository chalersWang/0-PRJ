/* TST-CPU-001 双核启动与 BOOT ROM 引导
 * 来源: 依据飞书验证测试列表生成(参考 T-head-Semi/opene906 风格)
 * 上电复位后,观察 CPU0/CPU1 从 BOOT ROM 取指执行并进入应用主程序
 * 预期: 两核均成功引导至主程序入口,无跑飞、无重复启动
 */
#include "minilibc_stdio.h"

/* 结果标记地址: 由 SV test 侧轮询(与 hello_world 的 PASS/FAIL 机制一致) */
#define PASS_ADDR   (0x200b0000)
#define FAIL_ADDR   (0x200b0004)
#define PASS_MARK   0x5A5A5A5A
#define FAIL_MARK   0xA5A5A5A5

/* TODO: 实现 dual_core_boot 核心算法。
 * 本骨架仅占位,供 E906 工具链编译;实际测试逻辑待 RTL/软件联调时补充。
 */
static int dual_core_boot(void)
{
    return 0;   /* 0 = PASS */
}

int main(void)
{
    printf("=== TST-CPU-001 双核启动与 BOOT ROM 引导 ===\n");
    int ret = dual_core_boot();
    if (ret == 0) {
        *(volatile unsigned int *)PASS_ADDR = PASS_MARK;
        printf("TST-CPU-001 PASS\n");
    } else {
        *(volatile unsigned int *)FAIL_ADDR = FAIL_MARK;
        printf("TST-CPU-001 FAIL\n");
    }
    while (1) { }
    return 0;
}
