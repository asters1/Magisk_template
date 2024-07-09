######################################
#
# Magisk Module Template Config Script
# Magisk Module 模板配置脚本
#
######################################
#
# Instructions:
# 说明:
#
# 1. Place your files into system folder (delete the placeholder file)
# 将您的文件放入系统文件夹(删除占位符文件)
#
# 2. Fill in your module's info into module.prop
# 在module.prop中填写您的模块信息
#
# 3. Configure the settings in this file (config.sh)
# 在这个文件(config.sh)中配置设置
#
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 如果需要引导脚本，请将它们添加到common/post-fs-data.sh或common/service.sh中
#
# 5. Add your additional or modified system properties into common/system.prop
# 将附加或修改的系统属性添加到common/system.prop中
#
######################################
#
######################################
#
# Configs
#
######################################

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
SKIPMOUNT=false
#是否安装模块后自动关闭，改为faslse，安装后不会自动勾选启用

# Set to true if you need to load system.prop
PROPFILE=false
#是否使用common/system.prop文件

# Set to true if you need post-fs-data script
POSTFSDATA=false
#是否使用post-fs-data脚本执行文件

# Set to true if you need late_start service script
LATESTARTSERVICE=false
#是否在开机时候允许允许common/service.sh中脚本

######################################
#
# 安装消息
#
######################################

# Set what you want to show when installing your mod
# 设置安装你的mod时你想显示的内容

print_modname() {
	ui_print "*******************************"
	ui_print "     	Magisk Module:         "
	ui_print "For HMNote4X    By 小白杨"
	ui_print "*******************************"
}

######################################
# Replace list
######################################

# List all directories you want to directly replace in the system
# 列出系统中所有要直接替换的目录
#
# Check the documentations for more info about how Magic Mount works, and why you need this
# 查看文档以获得更多关于Magisk如何工作的信息，以及你为什么需要它

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will override the example above
# 在这里构造你自己的列表，它将覆盖上面的例子
#
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
# ！不要。如果你不需要替换任何东西，就把它拿掉，让它保持原样
#
REPLACE="

"
#添加您要精简的APP/文件夹目录
#例如：精简状态栏，找到状态栏目录为  /system/priv-app/SystemUI/SystemUI.apk
#转化加入:/system/priv-app/SystemUI
#（可以搭配高级设置获取APP目录）

######################################
# Permissions
#释放文件，普通shell命令
######################################
on_install() {
	ui_print "- 正在释放文件"
	unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

set_permissions() {
	# Only some special files require specific permissions
	# The default permissions should be good enough for most cases

	# Here are some examples for the set_perm functions:

	# set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
	# set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

	# set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
	# set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
	# set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
	# set_perm  $MODPATH/system/lib/libart.so       0       0       0644

	# The following is default permissions, DO NOT remove
	set_perm_recursive $MODPATH 0 0 0755 0644

	#设置权限，基本不要去动
}

######################################
#
# Custom Functions
#
######################################

# This file (config.sh) will be sourced by the main flash script after util_functions.sh
#该文件(config.sh)将由util_functions.sh之后的主flash脚本提供
#
# If you need custom logic, please add them here as functions, and call these functions in
#如果您需要自定义逻辑，请将它们作为函数添加到这里，并在中调用这些函数
#
# update-binary. Refrain from adding code directly into update-binary, as it will make it
#update-binary.避免将代码直接添加到update-binary文件
#
# difficult for you to migrate your modules to newer template versions.
# 您很难将您的模块迁移到更新的模板版本。
#
# Make update-binary as clean as possible, try to only do function calls in it.
# 使更新二进制尽可能整洁，尽量只在其中做函数调用。
