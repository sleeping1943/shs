# shs
记录了一些常用的shell脚本

1、代码commit时，使用git钩子增加版本号:

- version.ver:存储定义版本号
- get_version.sh:增加并修改version.ver中的版本号
- pre-commit.sh:git commit时自动修改版本号并提交到git

2、统计崩溃信息,按行分析

- analysis.sh:分析record.txt按日统计崩溃次数,record,txt只记录date命令的日志

3、查询程序是否执行:
- status.sh

