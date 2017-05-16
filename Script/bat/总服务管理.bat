@echo off
REM REM 设定dos窗口的编码
chcp 936
cls
:redo
set /a con=1 
rem rem 清除之前的缓存值

echo +++++++++++++++++  功能列表  ++++++++++++++++++++++++
echo +
echo +    11  :   打开服务中心
echo +    12  :   开启 Oracle 服务
echo +    13  :   开启 Tomcat 7.07
echo +    14  :   开启 VMWare 服务
echo +
echo +    21  :   关闭 VMWare 服务
echo +    22  :   关闭 Oracle 服务
echo +    23  :   关闭 Tomcat 7.07
echo +    0  :   退出程序
echo +
echo +++++++++++++++++  功能列表  ++++++++++++++++++++++++


echo 请输入操作对应的代码:
set /p action=Action :  
if "%action%"=="12" goto NO
if "%action%"=="22" goto CO
if "%action%"=="14" goto NV
if "%action%"=="21" goto CV
if "%action%"=="11" goto NS
if "%action%"=="0" goto EX
if "%action%"=="13" goto TR
if "%action%"=="23" goto TS
rem rem 不满足上述所有的参数才执行下面的代码：
cls 
echo ## ！
echo ## ！！
echo ## ！！！
echo ## ！！！！   《请输入有效的命令》
echo ## ！！！
echo ## ！！
echo ## ！

goto redo

echo +++++++++++++++++ 多个标号区  +++++++++++++++++++++++
REM REM 开启Oracle服务
:NO
echo ++ 启动 Oracle 服务
net start "OracleServiceORCL"
net start "OracleOraDb11g_home1TNSListener"
goto end

REM REM 关闭Oracle服务
:CO
echo 关闭 Oracle 服务
net stop "OracleOraDb11g_home1TNSListener"
net stop "OracleServiceORCL"
goto end

:NV
echo ++开启 VMWare 服务
net start "VMAuthdService"
net start "VMnetDHCP"
net start "VMware NAT Service"
net start "VMUSBArbService"
goto end 

:CV
echo ++关闭 VMWare 服务
net stop "VMAuthdService"
net stop "VMnetDHCP"
net stop "VMware NAT Service"
net stop "VMUSBArbService"
goto end 

:NS
echo ++打开服务中心
start "myth" "services.msc"
goto end 

:TR
echo ++tomcat startup
net start "Tomcat7"
goto end 


:TS
echo ++tomcat stop
net stop "Tomcat7"
goto end 

:end
set /a action="myth" 
rem rem 清除之前的缓存值
set /p con=输入 c 继续 否则直接退出 ： 
cls
if "%con%"=="c" goto redo
exit

:EX 
exit