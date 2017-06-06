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
    - 
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

#### SSH登录
##### 客户端配置
- `sudo spt-get install openssh-client`
- `ssh-keygen` 可以设置密码，为了方便也可以全部采用默认
- 进入.ssh文件夹下 `gedit id_rsa.pub` 然后复制该公钥内容
- 或者 `cat ~/.ssh/id_rsa.pub | xclip -sel clip` 将文件复制到剪贴板
- 在各种平台服务上添加这个公钥即可免密登录

##### 服务端配置
- 安装：`sudo apt-get install openssh-server`
- 进入.ssh文件夹下 `sudo vim authorized_keys` 粘贴客户端公钥内容
- 更改文件权限 `sudo chmod 600 authorized_keys`
- 客户端登录 `ssh -p22 username@ip`
*******************************************
## 【文件管理】
`自定义桌面快捷方式文件`
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
### 文本编辑器
#### sublime 
- 如果出现小bug，就直接删除 ～.config 下的 sublime文件夹注意注册证书拷出来
- 
#### vi/vim
- `i` 进入编辑
- `:wq` 保存退出，注意是英文的 `:`才可以退出

#### gedit
- 安装markdown预览插件 

************************
### 【常见问题】
##### ubunbu/deepin错误提示音
- 临时关闭：`rmmod pcspkr`临时开启：`modprobe pcspkr`
- 如果是使用bash，在`~/.bashrc`文件末尾添加如下（deepin无效）
```
    setterm -blength 0
    xset -b
```
`set bell-style none`
- 对于Debian/Ubuntu系统，使用root身份执行：
    - `sudo echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist`
- 对于CentOS/Redhat/RHEL/Fedora系统，使用root身份执行：
    - `echo "alias pcspkr off" >> /etc/modprobe.conf `

*************************
### cd 
- `cd - ` 跳转到上一个目录
- `cd !$` 把上个命令的参数作为cd参数使用。
- `cd //` 系统根目录

*********************************
### Tips
- `cat ~/.ssh/id_rsa.pub | xclip -sel clip` 将文件复制到剪贴板
- `桌面快捷方式图标文件`
```
    [Desktop Entry]
    Exec=/home/mythos/Application/Story/Story-writer
    Icon=/home/mythos/Application/Story/Story-writer.png
    Type=Application
    Terminal=false
    Name=Story
    GenericName=Story
    Categories=Story
    Name[en_US]=Story
    GenericName[en_US.UTF-8]=Story
    Name[zh_CN]=Story
```
- *rename命令的使用(基于perl)*
    - `rename "s/.html/.php/" * ` //把.html 后缀的改成 .php后缀
    - `rename "s/$/.txt/" *  `   //把所有的文件名都以txt结尾
    - `rename "s/.txt//" *  `   //把所有以.txt结尾的文件名的.txt删掉
    - `rename "s/AA/aa/" * `  //把文件名中的AA替换成aa
    - `rename "s/ - 副本/_bak/" *` 将文件`-副本`结尾改成`_bak`结尾
    
- `netstat -antlp | grep 127.0.0.1` 

*********************
- ssh认证
    - 只要在电脑上生成了秘钥对，之后在各个平台上复制公钥内容即可，是不是为方便就可以复制所需文件夹 `.ssh/`
    - 就能在任意电脑上连接，当然这是不安全的行为。。。。都把私钥公开了
    - 安全一点的就是重新生成秘钥对，然后添加到各个平台上去，不用了还可以删除
- `sudo spt-get install openssh-client`
- `ssh-keygen` 可以设置密码，为了方便也可以全部采用默认，为了安全就设置密码
- 进入.ssh文件夹下 `gedit id_rsa.pub` 然后复制该公钥内容即可
- 或者`cat ~/.ssh/id_rsa.pub | xclip -sel clip` 将文件复制到剪贴板
 
### 快捷键
- 终端：
    - `Ctrl L` 清屏，Mysql也适用
    - `Ctrl ；` 显示最近五条剪贴板内容
    - `Ctrl Shift Q/W`自定义的新建关闭标签页
**********

## 安装Linux发行版
- 下载指定的镜像包，使用对应的刻录软件刻录U盘
- 进入U盘安装模式，分区：
    - 分配 1/5 的 `/` ext4
    - 分配 3/5 的 `/home` ext4
    - 分配 500-1000m 的 `/boot/efi` fat32格式
- 特别注意不要随意用sudo 更改配置文件，容易导致系统crash（除非你明确的知道这个更改的作用）

