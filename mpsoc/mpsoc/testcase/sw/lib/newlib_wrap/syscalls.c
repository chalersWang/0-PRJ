/*Copyright 2020-2021 T-Head Semiconductor Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

/*
 * newlib 裸机 syscall 桩 (retarget)。
 *
 * 本工程用 `-lc`(newlib) 链接, 但 vasprintf.c 用到了 malloc/free/strdup,
 * 它们会引用 newlib 的堆分配器, 而堆分配器最终调用 _sbrk 系统调用。
 * 若不提供 _sbrk 等 syscall, 链接阶段报:
 *     undefined reference to `_sbrk'  (collect2: ld returned 1 exit status)
 *
 * 本文件补齐 newlib 所需的全部 syscall, 随 newlib_wrap/*.c 被 Makefile
 * 通配自动编入链接, 无需改动 Makefile。
 *
 * 仿真结束/输出邮箱地址 0x6000fff8 与 crt0 的 __exit/__fail、fputc、sim_end 保持一致。
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <stddef.h>
#include <unistd.h>

/* 仿真结束/标准输出邮箱 (testbench 通过该地址捕获打印/结束码) */
#define SIM_MAILBOX ((volatile unsigned int *)0x6000fff8)

/*
 * 堆区: DRAM (0x10000000 .. 0x100c0000) 内,
 * .data/.bss/.COMMON 之后、__kernel_stack(0x100bfff8) 之前的空闲区。
 * 参见 linker_kcore0.lcf / linker_kcore1.lcf 的 MEMORY 定义。
 */
#define HEAP_BASE 0x10040000UL
#define HEAP_END  0x100b0000UL

static unsigned int heap_ptr = HEAP_BASE;

/* 堆增长: malloc/free/strdup 底层依赖, 也是本次链接失败的直接原因 */
void *_sbrk(ptrdiff_t incr)
{
    unsigned int old = heap_ptr;

    if (incr < 0 || old + (unsigned int)incr > HEAP_END) {
        return (void *)-1;   /* ENOMEM */
    }
    heap_ptr = old + (unsigned int)incr;
    return (void *)old;
}

/* 标准输出: 逐字节写到仿真邮箱 (与 fputc 的 32-bit 写入一致) */
int _write(int file, char *ptr, int len)
{
    int i;

    (void)file;
    for (i = 0; i < len; i++) {
        *SIM_MAILBOX = (unsigned int)(unsigned char)ptr[i];
    }
    return len;
}

/* 标准输入: 无输入源, 返回 0 表示 EOF */
int _read(int file, char *ptr, int len)
{
    (void)file;
    (void)ptr;
    (void)len;
    return 0;
}

/* 进程退出: 写结束码到仿真邮箱后挂起 (与 crt0 __exit 约定一致) */
void _exit(int status)
{
    *SIM_MAILBOX = (unsigned int)status;
    for (;;) {
        __asm__ volatile ("nop");
    }
}

/* ---- 以下为文件/进程类 syscall 的空实现 (本工程不使用) ---- */

int _close(int file)
{
    (void)file;
    return -1;
}

int _fstat(int file, struct stat *st)
{
    (void)file;
    st->st_mode = S_IFCHR;   /* 视为字符设备, 使 isatty 生效 */
    return 0;
}

int _isatty(int file)
{
    (void)file;
    return 1;
}

int _lseek(int file, int offset, int whence)
{
    (void)file;
    (void)offset;
    (void)whence;
    return 0;
}

int _getpid(void)
{
    return 1;
}

int _kill(int pid, int sig)
{
    (void)pid;
    (void)sig;
    return -1;
}
