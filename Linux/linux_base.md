# 【Linux 系统】
## Catalog
- [软件管理](#软件管理)
    - [安装命令](#安装命令)
- [网络管理](#网络管理)
    - [端口占用](#查看端口占用情况)
- [文件管理](#文件管理)
    - [创建快捷方式](#创建桌面快捷方式)
    - [文本编辑器](#文本编辑器)

*********************************
## 【系统管理】
### 【用户管理】
- 添加用户 `adduser username`
    - 添加到sudoers文件中才能使用sudo
    - chmod 777 /etc/sudoers
    - vi /etc/sudoers
    - kuang  ALL=(ALL:ALL)ALL
    - chmod 440 /etc/sudoers
- 更新密码：`passwd username`
- su user 切换用户
*********************************
## 【软件管理】
### 安装命令
- 1,deb 安装deb包
	- ` sudo  dpkg  -i  *.deb`
- 2,apt-get
	- `sudo apt-get install xxx`
	- 若不能添加私有源ppa：
	- debain：`sudo apt-get install software-properties-common`
	- Ubuntu `sudo apt-get install python-software-properties`
	- 例如：`sudo add-apt-repository ppa:dotcloud/lxc-docker `
	- 删除ppa `cd  /etc/apt/sources.list.d/` 打开该目录下文件把对应的ppa的一行注释掉或删掉就行了
- 3,make install 源代码安装
    - 1.解压缩 `tar -zxf nagios-4.0.2.tar.gz ` 
    - 2.进入目录 `cd nagios-4.0.2`
    - 3.配置 `./configure --prefix=/usr/local/nagios  ` 
    - 4.编译 `make all`
    - 5.安装 `make install && make install-init && make install-commandmode && make install-config`
- 查看已安装的应用
	- `dpkg --list`
- 彻底卸载应用
	- `sudo apt-get --purge remove 应用名`
- 只卸载程序，保留配置文件
	- `sudo apt-get remove 应用名`

**************************************
## 【文件管理】

**************************************

## 【网络管理】
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
    - `sudo kill -9 pid` 杀掉指定pid
    - `ps` 查看当前执行中的程序
- `netstat -antlp | grep 127.0.0.1` 

#### SSH登录
##### 客户端配置
- `sudo spt-get install openssh-client`
- `ssh-keygen` 可以设置密码，为了方便也可以全部采用默认
- 进入.ssh文件夹下 `gedit id_rsa.pub` 然后复制该公钥内容
- 或者 `cat ~/.ssh/id_rsa.pub | xclip -sel clip` 将文件复制到剪贴板
- 在各种平台服务上添加这个公钥即可免密登录

##### 服务端配置
- 安装：`sudo apt-get install openssh-server`
- 启动：`sudo /etc/init.d/ssh start` 或者 `service ssh start` 查看对否启动sshd`ps -e |grep ssh`
- 进入.ssh文件夹下 `sudo vim authorized_keys` 粘贴客户端公钥内容
- 更改文件权限 `sudo chmod 600 authorized_keys`
- 客户端登录 `ssh -p22 username@ip`
*******************************************

******************************************************

### Tips
> 个人使用的一些方便的操作和配置
### 【常见问题】
##### ubunbu/deepin错误提示音
- 临时关闭：`rmmod pcspkr`临时开启：`modprobe pcspkr`
- 编辑 `/etc/inputrc`，找到`#set bell-style none`这一行，去掉前面的注释符号

`下面的方法不敢试`
- 对于Debian/Ubuntu系统，使用root身份执行：
    - `sudo echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist`
- 对于CentOS/Redhat/RHEL/Fedora系统，使用root身份执行：
    - `echo "alias pcspkr off" >> /etc/modprobe.conf `

*****
### 【技巧】


#### 一行执行多条命令 
- ` && ` 第2条命令只有在第1条命令成功执行之后才执行 根据命令产生的退出码判断是否执行成功（0成功，非0失败）
-  `|| ` 执行不成功（产生了一个非0的退出码）时，才执行后面的命令
-  ` ; ` 顺序执行多条命令，当;号前的命令执行完（不管是否执行成功），才执行;后的命令。 
- `&`
- `|`


### 快捷键
- 终端：
    - `Ctrl L` 清屏，Mysql也适用
    - `Ctrl ；` 显示最近五条剪贴板内容
    - Ctrl backspace 删除单词
- htop 终端的任务管理器显示

*****************************************************

## 安装Linux发行版
- 下载指定的镜像包，使用对应的刻录软件刻录U盘
- 进入U盘安装模式，分区：
    - 分配 1/5 的 `/` ext4
    - 分配 3/5 的 `/home` ext4
    - 分配 500-1000m 的 `/boot/efi` fat32格式
- 特别注意不要随意用sudo 更改配置文件，容易导致系统crash（除非你明确的知道这个更改的作用）

