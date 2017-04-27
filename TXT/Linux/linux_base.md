# Linux 系统
## Catalog
- [软件管理](#软件管理)
    - [安装命令](#安装命令)
- [网络管理](#网络管理)
    - [端口占用](#查看端口占用情况)
- [文件管理](#文件管理)
    - [创建快捷方式](#创建桌面快捷方式)
    - [文本编辑器](#文本编辑器)


## 软件管理
### 安装命令
- 1,deb 安装deb包
	- ` sudo  dpkg  -i  *.deb`
-  2,apt-get
	- `sudo apt-get install xxx`
- 3,make install 源代码安装
	    //1.解压缩
		`tar -zxf nagios-4.0.2.tar.gz ` 
		//2.进入目录
		`cd nagios-4.0.2`
		//3.配置
		`./configure --prefix=/usr/local/nagios  `   
		//4.编译
		`make all`
		//5.安装
		`make install && make install-init && make install-commandmode && make install-config`
		
- 1，以root权限打开文件管理
	-  `sudo nautilus`
- 2，查看已安装的应用
	- `dpkg --list`
- 3,彻底卸载应用
	- `sudo apt-get --purge remove 应用名`
- 4，只卸载程序，保留配置文件
	- `sudo apt-get remove 应用名`

*********************
## 网络管理
#### 查看端口占用情况
- `lsof -i`:端口号 用于查看某一端口的占用情况，比如查看8000端口使用情况，`lsof -i:8000`
- `netstat -tunlp |grep` 端口号，用于查看指定的端口号的进程情况
    - 例如： `netstat -tunlp |grep 8000`
    - `-t` (tcp) 仅显示tcp相关选项
    - `-u` (udp)仅显示udp相关选项
    - `-n` 拒绝显示别名，能显示数字的全部转化为数字
    - `-l` 仅列出在Listen(监听)的服务状态
    - `-p` 显示建立相关链接的程序名
- [扫描端口的Python](https://github.com/Kuangcp/Notes/blob/master/Python/net/netstatus.py)
- Ubuntu与Windows10时间相差8小时的解决
    - `timedatectl set-local-rtc true `
- 查询端口占用的pid 三种：
    - `netstat -aonp |grep "^[a-z]\+[ ]\+0[ ]\+0[ ]\+[0-9\.]\+:80[ ]\+"|awk -F" "   {'print $0'}`
    - `netstat -aonp |grep ":80[ ]\+"|awk -F" "   {'print $0'}`
    - `sudo netstat -aonp |grep ":6379[ ]\+"|awk -F" "   {'print $0'}`
    - 杀掉：
    - `sudo kill -9 pid`

## 文件管理
#### 创建桌面快捷方式
```
	[Desktop Entry] #每个desktop文件都以这个标签开始，说明这是一个Desktop Entry文件
	Version = 1.0 #标明Desktop Entry的版本（可选）
	Name = Firefox #程序名称（必须），这里以创建一个Firefox的快捷方式为例
	GenericName = Web Browser #程序通用名称（可选）
	Comment = A Web Browser #程序描述（可选）
	Exec = firefox %u #程序的启动命令（必选），可以带参数运行,当下面的Type为Application，此项有效
	Icon = firefox #设置快捷方式的图标（可选）
	Terminal = false #是否在终端中运行（可选），当Type为Application，此项有效
	Type = Application #desktop的类型（必选），常见值有“Application”和“Link”
	Categories = GNOME;Application;Network; #注明在菜单栏中显示的类别（可选）
```
#### 文本编辑器
##### sublime 
- 如果出现小bug，就直接删除 ～.config 下的 sublime文件夹注意注册证书拷出来
- 

