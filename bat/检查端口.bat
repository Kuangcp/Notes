chcp 936
@echo off
rem rem 将所有端口的相关信息写入 文本文件中去
rem rem 新建文件，会覆盖之前的文件
echo=>test.txt
rem rem 追加到文件中去
netstat -a -n >> test.txt
type test.txt | find "3306" && echo "已经开启了Mysql"
 rem rem dir >> test.txt
pause