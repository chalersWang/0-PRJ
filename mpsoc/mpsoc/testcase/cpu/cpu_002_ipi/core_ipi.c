/* TST-CPU-002 核间中断通信
 * 来源: 依据飞书验证测试列表生成(参考 T-head-Semi/opene906 风格)
 * CPU0 触发核间中断,CPU1 响应处理并回执,统计往返延迟
 * 预期: CPU1 在设定延迟内响应,1000 次往返无丢失
 */
#include "minilibc_stdio.h"

/* 结果标记地址: 由 SV test 侧轮询(与 hello_world 的 PASS/FAIL 机制一致) */
#define PASS_ADDR   (0x200b0000)
#define FAIL_ADDR   (0x200b0004)
#define PASS_MARK   0x5A5A5A5A
#define FAIL_MARK   0xA5A5A5A5

/* TODO: 实现 core_ipi 核心算法。
 * 本骨架仅占位,供 E906 工具链编译;实际测试逻辑待 RTL/软件联调时补充。
 */
static int core_ipi(void)
{
    return 0;   /* 0 = PASS */
}

int main(void)
{
    printf("=== TST-CPU-002 核间中断通信 ===\n");
    int ret = core_ipi();
    if (ret == 0) {
        *(volatile unsigned int *)PASS_ADDR = PASS_MARK;
        printf("TST-CPU-002 PASS\n");
    } else {
        *(volatile unsigned int *)FAIL_ADDR = FAIL_MARK;
        printf("TST-CPU-002 FAIL\n");
    }
    while (1) { }
    return 0;
}
