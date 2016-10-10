chcp 936
@echo off
net start "VMAuthdService"
net start "VMnetDHCP"
net start "VMware NAT Service"
net start "VMUSBArbService"
start "" "C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe"
pause
