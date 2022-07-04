#此脚本用于查看项目程序脚本以及程序是否运行
#!/bin/sh

EXE_NAME=acv-jjn-target
SH_NAME=jktbivr
EXE_STATE=$(ps -ef | grep $EXE_NAME | grep -v 'grep')
SH_STATE=$(ps -ef | grep $SH_NAME | grep -v 'grep')

#直接!$EXE_STATE会报警告说:参数太多
if [ -z "$EXE_STATE" ]; then
    echo -e "\033[31m$EXE_NAME is not running!\033[0m"
else
    echo -e "\033[32m$EXE_NAME is running!\033[0m"
fi

if [ -z "$SH_STATE" ]; then
    echo -e "\033[31m$SH_NAME is not running!\033[0m"
else
    echo -e "\033[32m$SH_NAME is running!\033[0m"
fi
