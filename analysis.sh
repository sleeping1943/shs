#此脚本用于统计程序崩溃重启次数,输入数据为record.txt,recrod.txt每行格式为date的记录时间
#每行格式为: 2022年 07月 04日 星期一 15:52:38 CST
#!/bin/sh

RECORDS=$(cat record.txt | awk '{print $6,$7,$8,$9}' | uniq -c | awk '{print $2$3$4 "崩溃了["$1"]次"}')
#echo $RECORDS
for line in $RECORDS
do
    echo -e "\033[31m$line\033[0m"
done
