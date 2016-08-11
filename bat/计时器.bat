chcp 936
@echo off

rem rem @echo 这是一个计时器的示例
rem rem set /p t=请输入时间:
rem rem ping -n %t% 127.0.0.1>nul
rem rem @echo 时间到
rem rem pause

for /L %%a in (
 59,-1,0
)do(
echo 60秒后运行
echo 还剩余 %%a 秒
ping -n 2 localhost 1>nul 2>nul
cls
)
echo 启动 
pause
