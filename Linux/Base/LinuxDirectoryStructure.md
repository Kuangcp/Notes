`目录 start`
 
- [Linux 目录结构](#linux-目录结构)
    - [/root](#root)
    - [/home](#home)
    - [/proc](#proc)
    - [/etc](#etc)
        - [/etc/alternatives](#etcalternatives)
        - [使用](#使用)
        - [查看发行版](#查看发行版)
        - [查看系统所有用户信息](#查看系统所有用户信息)
    - [/tmp](#tmp)

`目录 end` |_2018-08-04_| [码云](https://gitee.com/gin9) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104) | [cnblogs](http://www.cnblogs.com/kuangcp)
****************************************
# Linux 目录结构
> Linux 系统目录结构的大致分布以及说明

## /root
> root用户的默认用户目录

## /home
> 非root用户的默认用户目录  

## /proc
> 进程的目录, 一个个进程实际上是一个个目录, 使用进程号作为目录名

## /etc
> 系统以及应用的配置目录

### /etc/alternatives
alternative是可选项的意思.
首先，因为依赖关系的存在，一个软件包在系统里面可能出现新旧版本并存的情况.
在以前，要想用旧版本作为默认值就必须要手动修改配置文件，有些软件比较简单，有些却要修改很多文件，甚至一些相关软件的配置文件也要相应修改。

update-alternatives 命令就是操作的这个目录, 实现的步骤往往是在该目录建立一个软链接, 然后又从这里建立软链接到 /usr/bin 下, 实现将命令加入到 PATH 中的目的

- [ ] 学习

### 使用
> 具体配置文件的使用

### 查看发行版
`cat /etc/issue` 通用
`cat /etc/redhat-release` redhat系

_查看内核版本_
`cat /proc/version`
`uname -a`

### 查看系统所有用户信息
> /etc/passwd 包含了用户,用户组,用户home目录 shell类型等信息  
> 看第三个参数:500以上的,就是后面建的用户了.其它则为系统的用户.


## /tmp
> 应用缓存目录, 在使用时存放缓存文件, 在计算机重启后就会被清理 

- 在安装Linux时如果没有明确的分区, 就会属于 / 分区, 那么就要给 / 留有足够的大小, 不然 /tmp 分区不足会导致应用运行异常
- 例如 Tomcat 在运行时就需要使用, 然后Deepin的截图也会将截图缓存到该目录下 ...

