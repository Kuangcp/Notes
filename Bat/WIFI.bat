@echo off
chcp 936
echo 请输入操作对应的代码:开启/关闭 1/2
set /p action=Action :  
if "%action%"=="1" goto OPEN
if "%action%"=="2" goto COLOSE

REM REM 开启Oracle服务
:OPEN
echo ++ 启动WIFI
netsh wlan set hostednetwork mode=allow ssid=GitHub key=git1234567
netsh wlan start hostednetwork
netsh wlan show hostednetwork
goto end

:OPEN
echo ++ 关闭WIFI
netsh wlan stop hostednetwork
goto end

:end
pause
