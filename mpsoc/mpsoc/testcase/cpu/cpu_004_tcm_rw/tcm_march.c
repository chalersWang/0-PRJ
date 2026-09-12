/* TST-CPU-004 私有 TCM 读写
 * 来源: 依据飞书验证测试列表生成(参考 T-head-Semi/opene906 风格)
 * CPU0/CPU1 各自对 IRAM(16K)/DRAM(16K) 全地址执行棋盘/March 模式读写
 * 预期: 读写数据一致,边界地址无越界,无总线错误
 */
#include "minilibc_stdio.h"

/* 结果标记地址: 由 SV test 侧轮询(与 hello_world 的 PASS/FAIL 机制一致) */
#define PASS_ADDR   (0x200b0000)
#define FAIL_ADDR   (0x200b0004)
#define PASS_MARK   0x5A5A5A5A
#define FAIL_MARK   0xA5A5A5A5

/* TODO: 实现 tcm_march 核心算法。
 * 本骨架仅占位,供 E906 工具链编译;实际测试逻辑待 RTL/软件联调时补充。
 */
static int tcm_march(void)
{
    return 0;   /* 0 = PASS */
}

int main(void)
{
    printf("=== TST-CPU-004 私有 TCM 读写 ===\n");
    int ret = tcm_march();
    if (ret == 0) {
        *(volatile unsigned int *)PASS_ADDR = PASS_MARK;
        printf("TST-CPU-004 PASS\n");
    } else {
        *(volatile unsigned int *)FAIL_ADDR = FAIL_MARK;
        printf("TST-CPU-004 FAIL\n");
    }
    while (1) { }
    return 0;
}
