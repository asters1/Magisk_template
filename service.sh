#!/system/bin/sh
# -late_start服务模式
#   此阶段是非阻塞的。脚本与启动过程的其余部分并行运行。
#   这是运行大多数脚本的推荐阶段。
########################
#
# 请不要硬编码/magisk/modname/...;相反，请使用$MODDIR/...
# 这将使您的脚本兼容，即使Magisk以后改变挂载点
MODDIR=${0%/*}

# 该脚本将在设备开机后作为延迟服务启动
