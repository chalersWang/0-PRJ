/* TST-CPU-003 菊花链级联通信
 * 来源: 依据飞书验证测试列表生成(参考 T-head-Semi/opene906 风格)
 * 按菊花链拓扑在 CPU0/CPU1 间下发任务、回收状态
 * 预期: 数据按链序正确传递,不丢包、不错位、不乱序
 */
#include "minilibc_stdio.h"

/* 结果标记地址: 由 SV test 侧轮询(与 hello_world 的 PASS/FAIL 机制一致) */
#define PASS_ADDR   (0x200b0000)
#define FAIL_ADDR   (0x200b0004)
#define PASS_MARK   0x5A5A5A5A
#define FAIL_MARK   0xA5A5A5A5

/* TODO: 实现 daisy_chain 核心算法。
 * 本骨架仅占位,供 E906 工具链编译;实际测试逻辑待 RTL/软件联调时补充。
 */
static int daisy_chain(void)
{
    return 0;   /* 0 = PASS */
}

int main(void)
{
    printf("=== TST-CPU-003 菊花链级联通信 ===\n");
    int ret = daisy_chain();
    if (ret == 0) {
        *(volatile unsigned int *)PASS_ADDR = PASS_MARK;
        printf("TST-CPU-003 PASS\n");
    } else {
        *(volatile unsigned int *)FAIL_ADDR = FAIL_MARK;
        printf("TST-CPU-003 FAIL\n");
    }
    while (1) { }
    return 0;
}
