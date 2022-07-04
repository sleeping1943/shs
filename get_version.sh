# 此脚本用于从version.ver文件获取版本
#!/usr/bin/sh

#没有version.ver文件,直接退出
if [ ! -e $CODE_PATH/version.ver ]; then
    echo "$CODE_PATH/version.ver is not exists!!"
    exit -1
fi

ver_major=$(grep "major" $CODE_PATH/version.ver | awk -F= '{print $2}')
ver_minor=$(grep "minor" $CODE_PATH/version.ver | awk -F= '{print $2}')
ver_latest=$(grep "latest" $CODE_PATH/version.ver | awk -F= '{print $2}')

echo "$ver_major.$ver_minor.$ver_latest"
