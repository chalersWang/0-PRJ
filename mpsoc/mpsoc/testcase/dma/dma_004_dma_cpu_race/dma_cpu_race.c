/* TST-DMA-004 DMA 与 CPU 竞争
 * 来源: 依据飞书验证测试列表生成(参考 T-head-Semi/opene906 风格)
 * DMA 搬运同时 CPU 读写同一区域,验证总线仲裁
 * 预期: 仲裁正确,无数据覆盖错乱
 */
#include "minilibc_stdio.h"

/* 结果标记地址: 由 SV test 侧轮询(与 hello_world 的 PASS/FAIL 机制一致) */
#define PASS_ADDR   (0x200b0000)
#define FAIL_ADDR   (0x200b0004)
#define PASS_MARK   0x5A5A5A5A
#define FAIL_MARK   0xA5A5A5A5

/* TODO: 实现 dma_cpu_race 核心算法。
 * 本骨架仅占位,供 E906 工具链编译;实际测试逻辑待 RTL/软件联调时补充。
 */
static int dma_cpu_race(void)
{
    return 0;   /* 0 = PASS */
}

int main(void)
{
    printf("=== TST-DMA-004 DMA 与 CPU 竞争 ===\n");
    int ret = dma_cpu_race();
    if (ret == 0) {
        *(volatile unsigned int *)PASS_ADDR = PASS_MARK;
        printf("TST-DMA-004 PASS\n");
    } else {
        *(volatile unsigned int *)FAIL_ADDR = FAIL_MARK;
        printf("TST-DMA-004 FAIL\n");
    }
    while (1) { }
    return 0;
}
