#!/system/bin/sh
#post-fs-data 模式
# 这个阶段是阻塞的。启动过程在执行完成之前暂停，或者经过 10 秒。
# 脚本在挂载任何模块之前运行。这允许模块开发人员在安装模块之前动态调整其模块。
# 这个阶段发生在 Zygote 启动之前，这几乎意味着 Android 中的所有内容
# !!!!警告：使用将死锁引导过程！请改用。
# setpropresetprop -n <prop_name> <prop_value>
########################
#
# 仅在必要时在此模式下运行脚本。
# 请不要硬编码/magisk/modname/...;相反，请使用$MODDIR/...
# 这将使您的脚本兼容，即使Magisk以后改变挂载点
MODDIR=${0%/*}

# 此脚本将在post-fs-data模式下执行
