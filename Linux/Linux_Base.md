`目录`
- [【Linux系统】](#linux系统)
    - [【系统管理】](#系统管理)
        - [【发行版之别】](#发行版之别)
        - [【桌面环境之别】](#桌面环境之别)
        - [【文件管理器之别】](#文件管理器之别)
        - [【终端模拟器之别】](#终端模拟器之别)
        - [【用户管理】](#用户管理)
        - [【用户组管理】](#用户组管理)
    - [【软件管理】](#软件管理)
        - [安装命令](#安装命令)
    - [安装Linux发行版](#安装linux发行版)
        - [【常见问题】](#常见问题)
            - [终端错误提示音](#终端错误提示音)
            - [Ubuntu与Windows10时间相差8小时的解决](#ubuntu与windows10时间相差8小时的解决)
            - [终端开启慢](#终端开启慢)
            - [命令找不到](#命令找不到)
        - [【Tips】](#tips)
            - [一行执行多条命令](#一行执行多条命令)
            - [让命令在后台运行](#让命令在后台运行)
                - [关闭ssh回话不能运行](#关闭ssh回话不能运行)
                - [关闭ssh回话仍能运行](#关闭ssh回话仍能运行)
            - [修改主机名](#修改主机名)
            - [字符雨](#字符雨)
    - [快捷键](#快捷键)
    
# 【Linux系统】
## 【系统管理】
> sudo 其实是软件 早该意识到的，所有的命令都是可执行文件

### 【发行版之别】
- debain 挺老的发行版
- ubuntu 建立在debain之上，许多人入门的系统
- ubuntu mint 个人喜欢这个系统
- fedora redhat的试验场 不太感冒
- openSUSE 
- freeBSD 
- Solaris 
- Alpine 特别小，在docker中使用有优势，但是坑多
- centos 
- arch 滚动发行，包管理机制优秀
- deepin 建立在debain上的国产操作系统，简洁美观使用方便，就是没有特别稳定
- mageia 
- gentoo 入门难度大，适合资深玩家，据说是特能折腾的系统，处于鄙视链顶端

### 【桌面环境之别】
- gnome 占用资源中等，个人对该桌面不感冒
- xfce 占用资源少，操作类似于xp
- kde 功能强大，占用资源中等
- dde deepin设计的桌面环境，小bug略多，但是美观操作方便

***************************
### 【文件管理器之别】
> 有单窗口，双列，命令，简洁轻量，笨重完整 各种各样的选择

- `nautilus` Gnome默认 挺好用，但是不能自动挂载分区
- `deepin-filemanager` deepin默认，较为方便，但是打开手机会卡根本打不开
- `pcmanfm` 左边侧栏目录树 会同步nautilus的配置`5m`
- `rox-filer` 特别小，单击打开，迅速定位文件，适合找东西用
- `thunar` 解决了nautilus的缺点，内存也很省 `21M`
- `dolphin` 多标签页，目录树方式查看
- `nemo` mint默认的，功能齐全，会同步nautilus的配置，同样有目录树而且是两边都有 `21M`
- `tuxcmd` Tux Commander 双列，小，直接的目录树，学习成本高点 `2M`

*******************************
### 【终端模拟器之别】
- `qterminal` 可定制标签页位置以及透明度，很简洁,挺好用
- `mate-terminal` 和gnome-terminal 基本配置什么的几乎一样，只是标题栏简洁一丢丢，跨标签页复制粘贴有bug
- `gnome-terminal` 很简洁，但是多标签时，标签页太大
- `sakura` 外观上和前两个几乎一样，标签页可以更简洁，但是设置不好调
- `deepin-terminal` 功能很多，主题很多，功能最为强大，但是字体可以选的很少
- `terminator` 可以定制背景图片，但是在我这deppin系统里有bug，多标签是假的，命令全是在共享的，不能用。。
- `tmux` 运维必备软件，入门有些繁琐

```
搜索到的终端模拟器：
  terminology 0.7.0-1+deb8u1build0.16.04.1
  lxterminal 0.2.0-1ubuntu0.1
  xvt 2.1-20.1ubuntu1
  xiterm+thai 1.10-2
  xfce4-terminal 0.6.3-2ubuntu1
  vala-terminal 1.3-6
  termit 2.10.0-2-gb8280ed-1
  terminator 0.98-1
  terminal.app 0.9.8-1+nmu1build2
  stterm 0.5+20140606+gitc2fd275-1
  sakura 3.3.4-2
  rxvt-unicode-lite 9.21-1build1
  rxvt-unicode-256color 9.21-1build1
  rxvt-unicode 9.21-1build1
  rxvt-ml 1:2.7.10-6
  rxvt 1:2.7.10-6
  roxterm 3.3.2-1
  qterminal 0.6.0+20160104-1
  pterm 0.67-2
  mrxvt-mini 0.5.4-1.2
  mrxvt-cjk 0.5.4-1.2
  mrxvt 0.5.4-1.2
  mlterm-tiny 3.5.0-1build1
  mlterm 3.5.0-1build1
  lilyterm 0.9.9.4+git20150208.f600c0-3
  kterm 6.2.0-46.1build1
  konsole 4:15.12.3-0ubuntu1
  guake 0.8.4-1
  evilvte 0.5.1-1
  eterm 0.9.6-4
  aterm 1.0.1-8
  xterm 322-1ubuntu1
  mate-terminal 1.18.1-1+sonya
  gnome-terminal 3.18.3-linuxmint2
请您明确地选择安装其中一个。
```
### 软件源列表
- [参考博客 阿里云的软件源](https://hacpai.com/article/1482807364546?p=1&m=0)
- [wiki-源列表说明](http://wiki.ubuntu.com.cn/%E6%BA%90%E5%88%97%E8%A1%A8)


**************************************
### 【用户管理】
- 添加用户 `sudo adduser username` 
    - 对比 `useradd`只是新建一个用户不会创建主目录
- 添加到sudo组 ，使用命令更安全：`sudo gpasswd -a $USER sudo` 但是要注销或者重启才生效貌似
- 或者：添加用户到用户组：`adduser user group`
    -  或者：使用修改文件的方式：（不推荐） 但是在docker中跑Ubuntu新建用户时很有用，也可以不用动文件，添加进组是有效的，看情况吧
    - `chmod 777 /etc/sudoers` 
        - 找不到文件说明没有安装sudo -> root用户 `apt install sudo `
    - 添加一行 `kuang  ALL=(ALL:ALL)ALL`
    - `chmod 440 /etc/sudoers`
        - `rwx 对应一个三位的二进制数， 1/0 表示开关`
- 查看是否设置成功 ： `groups username`
- 删除用户以及对应的home目录：`sudo deluser username --remove-home` 

*****
- `su username` 切换用户
- `su -l username` 当前用户的环境下登录用户（当成一个程序一样可以退出登录）

- 修改密码：
    - `passwd user`
    - `echo "root:caishi" | chpasswd` 如果是普通用户就是 sudo chpasswd
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

- `groupmod 选项 用户组`
    - -g GID 为用户组指定新的组标识号。
    - -o 与-g选项同时使用，用户组的新GID可以与系统已有用户组的GID相同。
    - -n 新用户组 将用户组的名字改为新名字

******************
## 【软件管理】
### 安装命令
- 1,deb 安装deb包
	- ` sudo  dpkg  -i  *.deb`
- 2,apt-get
	- `sudo apt-get install xxx`
- 若不能添加私有源ppa：
    - debain：`  `
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

### 【常见问题】
#### 终端错误提示音
- 临时关闭：`rmmod pcspkr` 临时开启：`modprobe pcspkr`
- 编辑 `/etc/inputrc`，找到`#set bell-style none`这一行，去掉前面的注释符号

`下面的方法不敢试`
- 对于Debian/Ubuntu系统，使用root身份执行：
    - `sudo echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist`
- 对于CentOS/Redhat/RHEL/Fedora系统，使用root身份执行：
    - `echo "alias pcspkr off" >> /etc/modprobe.conf `

#### Ubuntu与Windows10时间相差8小时的解决
- `timedatectl set-local-rtc true `


#### 终端开启慢 
- 检查 .bashrc 文件, 这次就是因为sdkman的原因导致巨慢,那上次是什么原因呢?

#### 命令找不到
- `sudo找不到` 就安装 sudo
- locale-gen 安装locales 使用`locale-gen --purge`命令进行更新编码

#### Deepin的NVIDIA驱动问题
- [论坛博客](https://bbs.deepin.org/forum.php?mod=viewthread&tid=132312)
    - `sudo apt-get install bumblebee-nvidia nvidia-driver nvidia-settings`

*****************************************************
### 【Tips】
> man help 后接使用的命令，就可以得到用户手册和帮助文档

#### 一行执行多条命令 
- ` && ` 第2条命令只有在第1条命令成功执行之后才执行 根据命令产生的退出码判断是否执行成功（0成功，非0失败）
- `|| ` 执行不成功（产生了一个非0的退出码）时，才执行后面的命令
- ` ; ` 顺序执行多条命令，当;号前的命令执行完（不管是否执行成功），才执行;后的命令。 
- ` & `  并行执行命令，没有顺序

- [tty 虚拟终端等概念](https://www.ibm.com/developerworks/cn/linux/l-cn-termi-hanzi/)

**************
#### 让命令在后台运行
> [原博客](https://www.ibm.com/developerworks/cn/linux/l-cn-nohup/)

- 命令后接 & （只是让进程躲到当前终端的后台去了 hup信号仍然影响）

- 运行的命令不因 用户注销，网络中断等因素而中断
    - 让进程对hup信号免疫 nohup disown
    - 让进程在新的会话中运行 setid screen

##### 关闭ssh回话不能运行

##### 关闭ssh回话仍能运行
`nohup， disown, screen, setid `
- 使用`nohup`屏蔽hup信号 后台运行，输出到nohup.out `nohup 命令 &`
    - 修改重定向文件  `nohup 命令>/dev/null 2>&1`
- `(命令 &)` 屏蔽了hup信号

*************

#### 修改主机名
- `sudo hostname linux` 重启终端即可看到修改
- 但是重启电脑会恢复原有名字修改如下文件永久： `sudo gedit /etc/hostname` `/etc/hosts`
- 立即生效,也要重新登录 `hostname -F /etc/hostname `

#### 字符雨
- `sudo apt-get update;sudo apt-get install cmatrix` 然后 运行 cmatrix

*************************
## 快捷键
- 终端：
    - `Ctrl L` 清屏，Mysql也适用
    - `Ctrl ；` 显示最近五条剪贴板内容

```
Ctrl + d       删除一个字符，相当于通常的Delete键（命令行若无任何字符，则相当于exit；处理多行标准输入时也表示EOF ）
Ctrl + h       退格删除一个字符，相当于通常的Backspace键
Ctrl + u       删除光标之前到 行首 的字符
Ctrl + k       删除光标之前到 行尾 的字符
Ctrl + c       取消当前行输入的命令，相当于Ctrl + Break
Ctrl + a       光标移动到行首（Ahead of line），相当于通常的Home键
Ctrl + e       光标移动到行尾（End of line）
Ctrl + f       光标向前(Forward)移动一个字符位置
Ctrl + b       光标往回(Backward)移动一个字符位置
Ctrl + l       清屏，相当于执行clear命令
Ctrl + p       调出命令历史中的前一条（Previous）命令，相当于通常的上箭头
Ctrl + n       调出命令历史中的下一条（Next）命令，相当于通常的下箭头
Ctrl + r       显示：号提示，根据用户输入查找相关历史命令（reverse-i-search）
```

- htop 终端的任务管理器显示
- lsof 便捷的查看端口情况
- ps | clorm 20 30 `colrm`删除输出的20 到30 列
- w | uptime 查看启动情况
- wc -l 统计行数
