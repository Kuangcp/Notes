@echo off
REM REM 设定dos窗口的编码
chcp 936
cls
:redo
set /a con=1 
rem rem 清除之前的缓存值

echo +++++++++++++++++  功能列表  ++++++++++++++++++++++++
echo +
echo +    ns  :   打开服务中心
echo +    no  :   开启 Oracle 服务
echo +    co  :   关闭 Oracle 服务
echo +    nv  :   开启 VMWare 服务
echo +    cv  :   关闭 VMWare 服务
echo +    ex  :   退出程序
echo +
echo +++++++++++++++++  功能列表  ++++++++++++++++++++++++


echo 请输入操作对应的命令:
set /p action=Action :  
if "%action%"=="no" goto NO
if "%action%"=="co" goto CO
if "%action%"=="nv" goto NV
if "%action%"=="cv" goto CV
if "%action%"=="ns" goto NS
if "%action%"=="ex" goto EX
rem rem 不满足上述所有的参数才执行下面的代码：
cls 
echo ## 请输入有效的命令 ！！！！！！！！
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

:end
set /a action="myth" 
rem rem 清除之前的缓存值
set /p con=输入 c 继续 否则直接退出 ： 
cls
if "%con%"=="c" goto redo
exit

:EX 
exit