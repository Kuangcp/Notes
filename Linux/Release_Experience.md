`目录 start`
 
- [Linux各个发行版本使用体验](#linux各个发行版本使用体验)
    - [基础知识](#基础知识)
    - [Debian系](#debian系)
        - [Debian](#debian)
        - [Ubuntu](#ubuntu)
        - [Ubuntu Mint](#ubuntu-mint)
        - [Deepin](#deepin)
        - [raspberry-pi](#raspberry-pi)
    - [arch系](#arch系)
    - [redhat系](#redhat系)
        - [Fedora](#fedora)
        - [Centos](#centos)
        - [openSUSE](#opensuse)
    - [FreeBSD](#freebsd)
    - [Solaris](#solaris)
    - [alpine](#alpine)
    - [Gentoo](#gentoo)
    - [Mageia](#mageia)

`目录 end` *目录创建于2018-02-05* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# Linux各个发行版本使用体验
> 一边用一边记录吧

## 基础知识
> 下载安装时要选平台 参考[相关博客](http://downtoearthlinux.com/posts/x86-i386-x86-64-x64-and-amd64-oh-my/)
    
    x86-64  =  64-bit  =  x64  =  amd64
    x86  =  32-bit  =  i386

_查看发行版_
- `lsb_release -a`  [查看更多方式](/Linux/Linux_File.md#查看发行版)

## Debian系
### Debian
> 很古老的系统 [官网](https://www.debian.org/index.zh-cn.html)

- 奇怪的是我在虚拟机装了好几个好几次装不上, 装完一登录就只有壁纸
### Ubuntu
> 很多人的入门系统

### Ubuntu Mint
> 该有的都有了, 个人比较喜欢

### Deepin

- 优点:
    - 界面美观,自带CrossOver深度家族的软件也挺好用,自定义命令的快捷键
- 缺点:
    - 基本是Linux的共性了,就是驱动问题, NVIDIA 显卡 因为驱动问题重装四五次系统,重启就不知道多少次了
    - 输入法现在这几天也在作妖 fcitxCPU占用高,输入窗口消失等问题
    - 蓝牙模块时隐时现

`遇到的bug记录`
- 2018-01-09 19:29:25 休眠结束系统卡死,然后重启输入法没有窗口,然后升级到最新重启还是没有,杀掉搜狗进程再启动解决

### raspberry-pi
- [树莓派桌面版下载](https://www.raspberrypi.org/downloads/raspberry-pi-desktop/) `分辨率不知道怎么调, 资源的消耗倒是低`

******************
## arch系
> 滚动发行，包管理机制优秀

- [打造完美的 Linux 桌面 — Arch Linux 2007.08-2 (1)](https://linuxtoy.org/archives/the-perfect-linux-desktop-arch-linux-2007-08-2-1.html)
    - [打造完美的 Linux 桌面 — Arch Linux 2007.08-2 (2)](https://linuxtoy.org/archives/the-perfect-linux-desktop-arch-linux-2007-08-2-2.html)
    - [打造完美的 Linux 桌面 — Arch Linux 2007.08-2 (3)](https://linuxtoy.org/archives/the-perfect-linux-desktop-arch-linux-2007-08-2-3.html)
    - [打造完美的 Linux 桌面 — Arch Linux 2007.08-2 (4)](https://linuxtoy.org/archives/the-perfect-linux-desktop-arch-linux-2007-08-2-4.html)
    


****************************
## redhat系
> 大厂支持
### Fedora
> redhat的试验场 不太感冒

### Centos
> 在阿里云上装了一个, 开机82M Centos7.4

### openSUSE
************************
## FreeBSD

*******************
## Solaris

**********************
## alpine
> 特别小，在docker中使用有优势，但是坑多

## Gentoo
> 入门难度大，适合资深玩家，据说是特能折腾的系统，处于鄙视链顶端

## Mageia
> [官网](http://www.mageia.org/zh-cn/)