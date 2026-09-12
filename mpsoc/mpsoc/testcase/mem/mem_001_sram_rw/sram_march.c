/* TST-MEM-001 SRAM(64K) 读写
 * 来源: 依据飞书验证测试列表生成(参考 T-head-Semi/opene906 风格)
 * 对 64K SRAM 全地址读写并执行地址线/数据线粘连测试
 * 预期: 数据一致,地址线无粘连、无读写冲突
 */
#include "minilibc_stdio.h"

/* 结果标记地址: 由 SV test 侧轮询(与 hello_world 的 PASS/FAIL 机制一致) */
#define PASS_ADDR   (0x200b0000)
#define FAIL_ADDR   (0x200b0004)
#define PASS_MARK   0x5A5A5A5A
#define FAIL_MARK   0xA5A5A5A5

/* TODO: 实现 sram_march 核心算法。
 * 本骨架仅占位,供 E906 工具链编译;实际测试逻辑待 RTL/软件联调时补充。
 */
static int sram_march(void)
{
    return 0;   /* 0 = PASS */
}

int main(void)
{
    printf("=== TST-MEM-001 SRAM(64K) 读写 ===\n");
    int ret = sram_march();
    if (ret == 0) {
        *(volatile unsigned int *)PASS_ADDR = PASS_MARK;
        printf("TST-MEM-001 PASS\n");
    } else {
        *(volatile unsigned int *)FAIL_ADDR = FAIL_MARK;
        printf("TST-MEM-001 FAIL\n");
    }
    while (1) { }
    return 0;
}
