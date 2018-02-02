`目录 start`
 
- [问题解决方案](#问题解决方案)
    - [终端](#终端)
    - [IDE](#ide)
        - [IDEA](#idea)
    - [Docker](#docker)
        - [内存高占用](#内存高占用)
    - [Linux](#linux)
        - [Deepin](#deepin)
            - [输入法](#输入法)
                - [fcitx](#fcitx)
            - [Flash](#flash)

`目录 end` *目录创建于2018-02-02* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
`目录`
- [问题解决博客](#问题解决博客)
    - [IDE](#ide)
        - [IDEA](#idea)
    - [Docker](#docker)
        - [内存高占用](#内存高占用)
    - [Linux](#linux)
        - [Deepin](#deepin)
            - [输入法](#输入法)
                - [fcitx](#fcitx)
            - [Flash](#flash)

*********************
# 问题解决方案
## 终端
- 误触 Ctrl+S
    - 终端会出现无响应状态，一般按下 Ctrl Shift C 即可解除

## IDE
### IDEA
- [调整参数，解决CPU满载](https://intellij-support.jetbrains.com/hc/en-us/articles/206544869)
    - [同样的](https://intellij-support.jetbrains.com/hc/en-us/articles/207241235)


## Docker
### 内存高占用
- 明明是一样的docker配置，构建出来的镜像按道理也应该是一样的，所以运行出来的容器也应该是一样的才对，但是结果却是两倍的差别
    - 优化jvm？
- 修改基础镜像？

## Linux 
### Deepin

- [FAQ](https://bbs.deepin.org/forum.php?mod=viewthread&tid=146921&extra=page%3D1)


#### 输入法
##### fcitx
- fcitx单核满载:三种（搜狗拼音导致）
    - 杀掉，fcitx -r
    - 先把进程杀掉再fcitx-autostart &
    - fcitx再fcitx-qimpanel 
`相关网页：`
- [某引擎搜索结果页](https://ausdn.com/s/ubuntu+cpu+fcitx)| [几种方式](https://www.findhao.net/res/786)| [卸载搜狗安装拼音](http://tieba.baidu.com/p/3863217434)
- [知乎问题](https://www.zhihu.com/question/19839748) | [ubuntu论坛](http://forum.ubuntu.com.cn/viewtopic.php?f=122&t=173730&p=1299087) | [ubuntu论坛](http://forum.ubuntu.com.cn/viewtopic.php?f=8&t=194486&start=0)

- 输入法没有显示打字窗口
    - 直接杀掉 sogou-qimpanel 然后点击图标进行启动

#### Flash
- 点击[官网下载地址](https://get.adobe.com/cn/flashplayer/)下载,然后解压,
- 将文件复制进火狐插件目录:`sudo cp libflashplayer.so  /usr/lib64/mozilla/plugins`
- 添加其他用户可执行权限`chmod 755 /usr/lib64/mozilla/plugins/libflashplayer.so`
