`目录 start`
 
- [【Linux系统】](#linux系统)
    - [【系统管理】](#系统管理)
        - [【发行版之别】](#发行版之别)
        - [【桌面环境之别】](#桌面环境之别)
        - [【文件管理器之别】](#文件管理器之别)
        - [【终端模拟器之别】](#终端模拟器之别)
        - [软件源列表](#软件源列表)
        - [【用户管理】](#用户管理)
        - [【用户组管理】](#用户组管理)
    - [【软件管理】](#软件管理)
        - [安装命令](#安装命令)
        - [基础系统软件](#基础系统软件)
            - [文本查看](#文本查看)
    - [安装Linux发行版](#安装linux发行版)
        - [【常见问题】](#常见问题)
            - [终端错误提示音](#终端错误提示音)
            - [Ubuntu与Windows10时间相差8小时的解决](#ubuntu与windows10时间相差8小时的解决)
            - [终端开启慢](#终端开启慢)
            - [命令找不到](#命令找不到)
            - [Deepin的NVIDIA驱动问题](#deepin的nvidia驱动问题)
        - [【Tips】](#tips)
            - [一行执行多条命令](#一行执行多条命令)
            - [让命令在后台运行](#让命令在后台运行)
                - [关闭ssh回话不能运行](#关闭ssh回话不能运行)
                - [关闭ssh回话仍能运行](#关闭ssh回话仍能运行)
            - [修改主机名](#修改主机名)
    - [终端快捷键](#终端快捷键)

`目录 end` *目录创建于2018-02-07* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# 【Linux系统】
> 只是记录了debian系的Linux, 不过也是大同小异

## 【系统管理】
> sudo 其实是软件 早该意识到的，所有的命令都是可执行文件

### 【发行版之别】
- [更多](/Linux/Release_Experience.md)

### 【桌面环境之别】
- gnome 占用资源中等，个人对该桌面不感冒
- xfce 占用资源少，操作类似于xp
- kde 功能强大，占用资源中等
    - [知乎 KDE如何配置得漂亮大气？](https://www.zhihu.com/question/54147372)
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

> [更多可安装终端](https://gitee.com/kcp1104/codes/gca14wtqvm67l9j5r0deb56#Terminals.md)

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
    - `chmod 777 /etc/sudoers`  然后直接`sudo visudo`就是调用vi来打开文件的简写
        - 找不到文件说明没有安装sudo -> root用户 `apt install sudo `
    - 添加一行 `kuang  ALL=(ALL:ALL)ALL` Centos:`kuang   ALL=(ALL)       ALL`
    - `chmod 440 /etc/sudoers`
        - `rwx 对应一个三位的二进制数， 1/0 表示开关`
- 查看是否设置成功 ： `groups username`
- 删除用户以及对应的home目录：`sudo deluser username --remove-home` 

*****
- _切换用户_ `su` 
- `su -l username` 当前用户的环境下登录用户（当成一个程序一样可以退出登录）

*****
- _修改密码_ `passwd`
    - `passwd user`
    - `echo "root:caishi" | chpasswd` 如果是普通用户就是 sudo chpasswd
*****
- _修改相关信息_ `usermod` 
```
    -d, --home HOME_DIR           用户的新主目录
    -e, --expiredate EXPIRE_DATE  设定帐户过期的日期为 EXPIRE_DATE
    -f, --inactive INACTIVE       过期 INACTIVE 天数后，设定密码为失效状态
    -g, --gid GROUP               强制使用 GROUP 为新主组
    -G, --groups GROUPS           新的附加组列表 GROUPS
    -a, --append GROUP            将用户追加至上边 -G 中提到的附加组中，并不从其它组中删除此用户
    -l, --login LOGIN             新的登录名称
    -L, --lock                    锁定用户帐号
    -m, --move-home               将家目录内容移至新位置 (仅于 -d 一起使用)
    -p, --password PASSWORD       将加密过的密码 (PASSWORD) 设为新密码
    -R, --root CHROOT_DIR         chroot 到的目录
    -s, --shell SHELL             该用户帐号的新登录 shell
    -U, --unlock                  解锁用户帐号
```
> [所有参数说明](https://gitee.com/kcp1104/codes/gca14wtqvm67l9j5r0deb56#usermod.md)

******
- `passwd 选项 用户名` 更改口令(密码)
    - `-l 锁定口令，禁用账号`  `-u 口令解锁` `-d 账号无口令` `-f 强迫用户下次登录时修改口令`
    - 当前用户 `passwd` 就是修改当前用户口令 超级用户就可以命令后接用户名，修改任意用户

******
- pwcov 注：同步用户从/etc/passwd 到/etc/shadow
- pwck 注：pwck是校验用户配置文件/etc/passwd 和/etc/shadow 文件内容是否合法或完整;
- pwunconv 注：是pwcov 的立逆向操作，是从/etc/shadow和 /etc/passwd 创建/etc/passwd ，然后会删除 /etc/shadow 文件;
- finger 注：查看用户信息工具
- id 注：查看用户的UID、GID及所归属的用户组
- chfn 注：更改用户信息工具
- visudo 注：visodo 是编辑 /etc/sudoers 的命令;也可以不用这个命令，直接用vi 来编辑 /etc/sudoers 的效果是一样的;

### 【用户组管理】
> [相关总结网页](http://www.runoob.com/linux/linux-user-manage.html)

- 修改用户至指定组 `sudo usermod -G 用户组 用户`
- _显示用户所在组_ `groups`
    - 缺省是当前用户, 若指定即输出指定用户的用户组
- _添加用户组_ `groupadd`
    - 缺省参数 就是新建用户组
    - `-g GID` 指定新用户组的组标识号GID 
    - `-o` 一般和g共用 表示新用户组的GID可以与系统已有用户组的GID相同。

- _删除用户组_ `groupdel` 

- `groupmod 选项 用户组`
    - -g GID 为用户组指定新的组标识号。
    - -o 与-g选项同时使用，用户组的新GID可以与系统已有用户组的GID相同。
    - -n 新用户组 将用户组的名字改为新名字

- grpck 检查`/etc/group`文件是否正确
- grpconv 注：通过/etc/group和/etc/gshadow 的文件内容来同步或创建/etc/gshadow ，如果/etc/gshadow 不存在则创建;
-  注：通过/etc/group 和/etc/gshadow 文件内容来同步或创建/etc/group ，然后删除gshadow文件

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

### 基础系统软件
#### 文本查看
cat more less nl 


*****************************************************
## 安装Linux发行版
- 下载指定的镜像包，使用对应的刻录软件刻录U盘(Windows就是软碟通,Linux没怎么用过,只用过深度的U盘启动盘制作工具挺好的)
- 进入U盘安装模式，分区：
    - 分配 1/5 的 `/` ext4
    - 分配 3/5 的 `/home` ext4
    - 分配 500-1000m 的 `/boot/efi` fat32格式
- 如果是双系统:
    - 如果新手直接全部` / `就行了，再加个交换分区 
    - 如果为了日后重装系统方便,那么分两个区 `/` 和 `/home`
        - 这样的话,就建议大量软件使用解压版,这样重装系统带来的影响最小,那么`/home`就要分大一点
        - 例如我: `/`只用了22G `/home`用了40G

> 新手的话特别注意不要随意用sudo然后更改配置文件，容易导致系统crash（除非你明确的知道这个更改操作的作用）

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
- 检查 .bashrc 文件 看是否有可疑脚本,
    -  这次就是因为sdkman的原因导致巨慢,那上次搞得我新建用户,重装系统是什么原因呢?

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

- Centos上which并不是命令, 而是别名!
    - `which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'`

**************
#### 让命令在后台运行
> [原博客](https://www.ibm.com/developerworks/cn/linux/l-cn-nohup/)

- 命令后接 & （只是让进程躲到当前终端的后台去了 hup信号仍然影响）

`nohup， disown, screen, setid `
- 运行的命令不因 用户注销，网络中断等因素而中断
    - 让进程对hup信号免疫 nohup disown
    - 让进程在新的会话中运行 setid screen

##### 关闭ssh回话不能运行
> 1.没有使用任何修饰原有命令  
> 2.只在原有命令后加&

##### 关闭ssh回话仍能运行
- 使用`nohup`就能屏蔽hup信号，默认输出到 nohup.out `nohup 命令 &`
    - 将所有输出重定向到空设备  `nohup 命令>/dev/null 2>&1`
    - 例如 在当前目录后台打开文件管理器 `(dde-file-manager . &) >/dev/null 2>&1`

- `(命令 &)` 屏蔽了hup信号

*************
#### 修改主机名
- `sudo hostname linux` 重启终端即可看到修改
- 但是重启电脑会恢复原有名字修改如下文件永久： `sudo gedit /etc/hostname` 也许需要更改`/etc/hosts`
- 立即生效,也要重新登录 `hostname -F /etc/hostname `

*************************
## 终端快捷键

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

