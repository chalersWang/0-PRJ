备忘录
袁总，今日进展如下
1、ET1100
（1）进展：hold/setup min corner下基本OK
（2）问题：
① hold/setup min corner下 asyn8/16 读写ram数据是X态
② setup max corner 回归没有跑完，估计digital模式下一直没有进入OP状态，看log有大量时序违例
（3）重新提回归，明日更新进展
2、ET1200（total=7*3=21,pass=5+5+3=13,fail=2+2+4）
（1）进展：问题还是GPO 2bit错误（待定位）
（2）问题：setup max corner下 10模式ebus case错误（待定位）
