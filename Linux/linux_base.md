# 【Linux 系统】
## 【系统管理】
> sudo 其实是软件 早该意识到的，所有的命令都是可执行文件

### 【用户管理】
- 添加用户 `sudo adduser username` 对比 `useradd`只是新建一个用户不会创建主目录
- 添加到sudo组 ，使用命令更安全：`sudo gpasswd -a $USER sudo` 但是要注销或者重启才生效貌似
    -  使用修改文件的方式：（不推荐） 但是在docker中跑Ubuntu新建用户时很有用，也可以不用动文件，添加进组是有效的，看情况吧
    - `chmod 777 /etc/sudoers` 找不到文件说明没有安装sudo root用户 `apt install sudo `
    - 添加 ：`kuang  ALL=(ALL:ALL)ALL`
    - `chmod 440 /etc/sudoers`
    - `rwx 对应一个三位的二进制数， 1/0 表示开关`
- 查看是否设置成功 ： `groups username`
- 删除用户以及对应的home目录：`sudo deluser username --remove-home` 

*****
- `su username` 切换用户
- `su -l username` 当前用户的环境下登录用户（当成一个程序一样可以退出登录）

- `usermod` 修改相关信息
    - `-s 更改shell环境`
    - `-g 更改用户组`
    - `-l 新用户名`

******
- `passwd 选项 用户名` 更改口令(密码)
    - `-l 锁定口令，禁用账号`  `-u 口令解锁` `-d 账号无口令` `-f 强迫用户下次登录时修改口令`
    - 当前用户 `passwd` 就是修改当前用户口令 超级用户就可以命令后接用户名，修改任意用户

### 【用户组管理】
> [相关总结网页](http://www.runoob.com/linux/linux-user-manage.html)

- 修改用户所在组 `sudo usermod -G sudo username`

- 添加用户组：` groupadd 选项 用户组`
    - `-g GID` 指定新用户组的组标识号GID 
    - `-o` 一般和g共用 表示新用户组的GID可以与系统已有用户组的GID相同。
- 删除用户组：`groupdel` 
- groupmod 选项 用户组
    - -g GID 为用户组指定新的组标识号。
    - -o 与-g选项同时使用，用户组的新GID可以与系统已有用户组的GID相同。
    - -n 新用户组 将用户组的名字改为新名字


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

*****************************************************
## 安装Linux发行版
- 下载指定的镜像包，使用对应的刻录软件刻录U盘
- 进入U盘安装模式，分区：
    - 分配 1/5 的 `/` ext4
    - 分配 3/5 的 `/home` ext4
    - 分配 500-1000m 的 `/boot/efi` fat32格式
- 如果是要双系统，直接全部` / `就行了，再加个交换分区    
- 特别注意不要随意用sudo 更改配置文件，容易导致系统crash（除非你明确的知道这个更改的作用）

******************************************************
### 【Q&A】
> 个人使用的一些方便的操作和配置

### 【常见问题】
##### ubunbu/deepin错误提示音
- 临时关闭：`rmmod pcspkr` 临时开启：`modprobe pcspkr`
- 编辑 `/etc/inputrc`，找到`#set bell-style none`这一行，去掉前面的注释符号

`下面的方法不敢试`
- 对于Debian/Ubuntu系统，使用root身份执行：
    - `sudo echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist`
- 对于CentOS/Redhat/RHEL/Fedora系统，使用root身份执行：
    - `echo "alias pcspkr off" >> /etc/modprobe.conf `

##### Ubuntu与Windows10时间相差8小时的解决
- `timedatectl set-local-rtc true `

##### 终端开启慢 
- 检查 .bashrc 文件, 这次就是因为sdkman的原因导致巨慢,那上次是什么原因呢?

*****************************************************
### 【Tips】
> man help 后接使用的命令，就可以得到用户手册和帮助文档

#### 一行执行多条命令 
- ` && ` 第2条命令只有在第1条命令成功执行之后才执行 根据命令产生的退出码判断是否执行成功（0成功，非0失败）
-  `|| ` 执行不成功（产生了一个非0的退出码）时，才执行后面的命令
-  ` ; ` 顺序执行多条命令，当;号前的命令执行完（不管是否执行成功），才执行;后的命令。 
- `&`
- `|`



**************
#### 让命令在后台运行
> [原博客](https://www.ibm.com/developerworks/cn/linux/l-cn-nohup/)

- 命令后接 & （只是让进程躲到当前终端的后台去了 hup信号仍然影响）

- 运行的命令不因 用户注销，网络中断等因素而中断
    - 让进程对hup信号免疫 nohup disown
    - 让进程在新的会话中运行 setid screen

##### 关闭ssh回话不能运行
##### 关闭ssh回话仍能运行

- 使用`nohup`屏蔽hup信号 后台运行，输出到nohup.out `nohup 命令 &`
    - 修改重定向文件  `nohup 命令>/dev/null 2>&1`
- `(命令 &)` 屏蔽了hup信号

*************

#### 修改主机名
- `sudo hostname linux` 重启终端即可看到修改
- 但是重启电脑会恢复原有名字修改如下文件永久： `sudo gedit /etc/hostname` `/etc/hosts`

## 快捷键
- 终端：
    - `Ctrl L` 清屏，Mysql也适用 但是没有clear命令干净彻底
    - `Ctrl ；` 显示最近五条剪贴板内容
    - Ctrl backspace 删除单词
- htop 终端的任务管理器显示
- lsof 便捷的查看端口情况
