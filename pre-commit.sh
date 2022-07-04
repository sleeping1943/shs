# 此脚本用于在commit代码前，增加版本号
# 使用当前目录下版本文件version.ver
# version.ver 格式如下:
# version_major:1
# version_minor:0
# version_latest:2
#
#!/usr/bin/sh

#最大小版本数,大于此数字则次版本+1
MAX_VERSION=100

#没有version.ver文件,直接退出
if [ ! -e $PWD/version.ver ]; then
    echo "$PWD/version.ver is not exists!!"
    exit -1
fi

ver_major=$(grep "major" $PWD/version.ver | awk -F= '{print $2}')
ver_minor=$(grep "minor" $PWD/version.ver | awk -F= '{print $2}')
ver_latest=$(grep "latest" $PWD/version.ver | awk -F= '{print $2}')

echo "ver_major:$ver_major"
echo "ver_minor:$ver_minor"
echo "ver_latest:$ver_latest"

new_ver_major=$ver_major
new_ver_minor=$ver_minor
new_ver_latest=$ver_latest

new_ver_latest=$((new_ver_latest+1))
if [ $new_ver_latest -gt $MAX_VERSION ]; then
    new_ver_minor=$((new_ver_minor+1))
    new_ver_latest=1
fi

echo "new_ver_major:$new_ver_major"
echo "new_ver_minor:$new_ver_minor"
echo "new_ver_latest:$new_ver_latest"

echo "开始更新version.ver中的版本号..."
#修改version.ver内容为新的版本号
sed -i -e "s/version_major=[0-9].*/version_major=$new_ver_major/g" $PWD/version.ver
sed -i -e "s/version_minor=[0-9].*/version_minor=$new_ver_minor/g" $PWD/version.ver
sed -i -e "s/version_latest=[0-9].*/version_latest=$new_ver_latest/g" $PWD/version.ver

echo "更新完成,修改后版本号为:"
cat $PWD/version.ver
echo ""
echo "更新version.ver文件到git然后commit..."
git add version.ver
#git commit -m "更新version.ver文件"
echo "更新version.ver完成,开始commit..."
echo ""

