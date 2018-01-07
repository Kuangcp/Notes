`目录`
 
- [常用的工具软件](#常用的工具软件)
    - [【国内的资源镜像站】](#国内的资源镜像站)
    - [三方库](#三方库)
    - [IDE](#ide)
    - [SDK](#sdk)
    - [Plugin](#plugin)
    - [Tools](#tools)
        - [文档处理](#文档处理)
        - [压力测试](#压力测试)
        - [UML](#uml)
        - [抓包工具](#抓包工具)
        - [异步](#异步)
        - [响应式](#响应式)
    - [Database](#database)
    - [前端](#前端)
    - [【包管理】](#包管理)
        - [使用sdkman](#使用sdkman)
    - [【服务管理】](#服务管理)
        - [oneinstack](#oneinstack)
- [【常用工具】](#常用工具)
    - [网络工具](#网络工具)
        - [nmap](#nmap)
    - [终端工具](#终端工具)
        - [xclip](#xclip)
        - [zssh](#zssh)
        - [Autojump](#autojump)
        - [.git-prompt.sh](#git-promptsh)
        - [asciinema](#asciinema)
        - [tmux](#tmux)
        - [apache benchmark](#apache-benchmark)
    - [其他工具](#其他工具)
        - [输入法](#输入法)
        - [qgit](#qgit)
        - [convert](#convert)
        - [todo.txt](#todotxt)
            - [todo.txt-cli](#todotxt-cli)
    - [【文本编辑器】](#文本编辑器)
        - [Ghex](#ghex)
        - [Kate/KWrite(Kate的轻量版)](#kate/kwrite(kate的轻量版))
        - [Geany](#geany)
        - [scite](#scite)
        - [textadept](#textadept)
        - [Sublime](#sublime)
        - [VSCode](#vscode)
        - [Gedit](#gedit)
        - [小书匠](#小书匠)
        - [Moediter Typora CuteMarkEd](#moediter-typora-cutemarked)
        - [Vi/Vim](#vi/vim)
        - [Nano](#nano)
        - [fte-terminal](#fte-terminal)
    - [【IDE】](#ide)
        - [Idea](#idea)
            - [插件](#插件)
                - [lombok](#lombok)
        - [eclipse](#eclipse)
    - [【浏览器】](#浏览器)
        - [FireFox](#firefox)
            - [必备插件](#必备插件)
        - [Chrome](#chrome)
        - [Vivaldi](#vivaldi)

*目录创建于2018-01-06*
****************************************
# 常用的工具软件
## 【国内的资源镜像站】
- [网易](http://mirrors.163.com/)`下载系统是 *-cd 的文件`
- [清华大学](https://mirrors.tuna.tsinghua.edu.cn/)
- [中国科学技术大学](mirrors.ustc.edu.cn)`各大Linux发行版以及一些开源软件`
- [阿里云](https://mirrors.aliyun.com/)
- [Linux运维派](https://mirrors-wan.geekpie.org/)
- [sourceforge](https://sourceforge.net/directory/system-administration/osdistro/livecd/os:linux/)`Linux发行版列表`

## 三方库
- [Eclipse Collections](http://www.eclipse.org/collections/)`更丰富的集合操作`

*******************
## IDE
- [IDEA](https://www.jetbrains.com/idea/)
- [Eclipse](http://www.eclipse.org/)
    - [中科大eclipse镜像源](http://mirrors.ustc.edu.cn/eclipse/technology/epp/downloads/release/)

**************
## SDK
- [Springboot下载地址](https://github.com/spring-projects/spring-boot/releases)
- [openjdk](http://openjdk.java.net/)
- [oracle-jdk](http://www.oracle.com/technetwork/cn/java/javase/downloads/index.html)

*****
## Plugin
- [gradle-tomcat-plugin](https://github.com/bmuschko/gradle-tomcat-plugin)`gradle中tomcat插件`


************
## Tools
- [开源中国在线工具](http://tool.oschina.net/)
- [Maven](http://maven.apache.org/)`不多说,上车`
- [Gradle官方下载地址](http://services.gradle.org/distributions/)
- [git](https://git-scm.com/) `最好用的vcs`
- [genymotion](https://www.genymotion.com/) `安卓模拟器`
- [ngrok](https://ngrok.com/)`随机域名到穿透到内网 eg: ngrok http 8080`
- [frp](https://diannaobos.com/frp/)`自己服务器外网到内网穿透`
    - [下载地址](https://file.diannaobos.com/frp_releases/)[使用帮助](https://diannaobos.com/post/470.html)

- [gogs](https://github.com/gogits/gogs) `自建git服务器`
- [gitea](https://github.com/go-gitea/gitea) `gogs加强`
    - [docker安装](https://docs.gitea.io/zh-cn/install-with-docker/)
- [jwt](https://jwt.io)`JSON WEB TOKEN`

### 文档处理
- [pandoc](https://github.com/jgm/pandoc) `一个文档格式转换的软件，markdown docx`

### 压力测试
- [jmeter](http://jmeter.apache.org/download_jmeter.cgi) `apache 下的开源压测工具`
- [ab](https://httpd.apache.org/docs/2.4/programs/ab.html) `apt安装这个包即可apache2-utils` 

### UML
- [免费UML软件统计 博客](http://blog.csdn.net/s464036801/article/details/8469166)
- [bouml](http://www.bouml.fr/download.html#Debian) `官方网站下载`
- [argouml](http://argouml.tigris.org/) `argouml官网`

### 抓包工具
- [whistle](https://github.com/avwo/whistle) `nodejs 平台的抓包工具`
- [fiddler](https://www.telerik.com/fiddler)`windows平台抓包工具`
- [charles](https://www.charlesproxy.com/)`跨平台收费`
    - [咳咳](http://charles.iiilab.com/)

### 异步
- [dwr](http://directwebremoting.org/dwr/index.html)`Js调用Java方法并拿到返回值`

### 响应式
- [vertx](http://vertx.io/)`构建响应式应用程序`

*****
## Database
- [sssdb](https://github.com/ideawu/ssdb) `键值对数据库`
- [Mysql-Font](https://github.com/NilsHoyer/MySQL-Front) `连接Mysql的客户端`
- [sqlectron](https://github.com/sqlectron/sqlectron-gui) `简单直观的数据库图形化软件`

## 前端
- [Framework7](http://framework7.cn/)`开发类似ios7的web应用（HTML）`
- [Bootstrap](https://v3.bootcss.com/getting-started/)
- [LayUI](http://www.layui.com/)
- [Hotkeys](https://github.com/jaywcjlove/hotkeys)`前端捕获按键输入,可以用来设置快捷键`
- [socket.io](https://socket.io)`基于nodejs的socket技术`
- [h-ui](http://h-ui.net/)
- [wangeditor](http://www.wangeditor.com/)`富文本编辑器`

***************************************************
***************************************************
## 【包管理】
### 使用sdkman
> 但是总会莫名其妙的冒出问题，sdk命令掉线始终连不上网，终端打开巨慢

`安装`
- 安装sdkman `curl -s "https://get.sdkman.io" | bash` 遇到提示zip 就是需要安装zip `sudo apt install zip` 然后重新执行命令
- 执行脚本：`source "/home/kuang/.sdkman/bin/sdkman-init.sh"` 或者重启终端就可以使用了，查看sdkman 版本:`sdk version`
`使用`
- [官网文档](http://sdkman.io/usage.html)
- 查看所有 `sdk list`
    - 查看某sdk的版本 `sdk list java ` 
- 不指定版本则默认安装最新版 `sdk install java` 安装指定版本 `sdk default java 8u131-zulu`
- 开始使用指定版本(for the current shell only) `sdk use scala 2.12.1`
- 查看当前版本 `sdk current java`
- 验证是否成功：`java -version`
- 移除 `sdk uninstall scala 2.11.6`

******************
## 【服务管理】
### oneinstack
> 一键配置环境

- [官方文档](https://oneinstack.com/install/)

- `apt -y install wget screen curl python`
- 下载源码：
    - `wget http://aliyun-oss.linuxeye.com/oneinstack-full.tar.gz` #阿里云经典网络下载
    - `wget http://mirrors.linuxeye.com/oneinstack-full.tar.gz` #包含源码，国内外均可下载
    - `wget http://mirrors.linuxeye.com/oneinstack.tar.gz` #不包含源码，建议仅国外主机下载
- `tar xzf oneinstack-full.tar.gz`
- `cd oneinstack` #如果需要修改目录(安装、数据存储、Nginx日志)，请修改options.conf文件
- `screen -S oneinstack` #如果网路出现中断，可以执行命令`screen -R oneinstack`重新连接安装窗口
- `sudo ./install.sh` #注：请勿sh install.sh或者bash install.sh这样执行

******************
# 【常用工具】
> 基本是Linux工具，因为主力是用Linux

## 网络工具
### nmap
> 端口扫描 [参考博客](http://aaaxiang000.blog.163.com/blog/static/2063491220113284325531/)

- 扫描`nmap <param> IP`
    - -sP
    - -sT
    - -sR


**********
## 终端工具
### xclip
> 便捷的文本复制
- `cat README.md | xclip -sel clip` 将文件复制到剪贴板

***********
### zssh
> 便捷的文件传输

- [参考博客](http://blog.csdn.net/ygm_linux/article/details/32321729)

********
### Autojump
> 统计cd 目录，方便目录跳转

- `apt install autojump` 设置为自动运行 `echo '. /usr/share/autojump/autojump.sh' >> ~/.bashrc`
    - `j -v` 查看安装版本
    - `j --stat` 查看统计信息
    - `j --help`
    - `jo code` 打开code文件夹
    - `jco c` 打开子目录
- `ls -l ~/.local/share/autojump/` 统计信息的目录，清除就相当于卸载重装了

********


************************************
### asciinema
> 终端录制工具

- 执行 `asciinema`或`asciinema rec` 即可开始录制
- 要注册就运行 `asciinema auth` 进入输出的网址，填邮箱和名字即可（每次登录都要这样。或者使用邮件来确认，麻烦ing）

***********************************
### tmux
> 好用的管理会话的软件

- [tmux 入门](http://blog.jobbole.com/87278/)
`入门使用`
- 新建会话 `tmux new -s test`
- 断开会话但是后台运行 `ctrl-b d`
- 连接会话 `tmux a -t test`

- `tmux new -s myth`  新建一个窗口 
- `Ctrl B`  再 `C`  新建一个窗口 `Ctrl B` `数字键`切换指定窗口
- 连接远程服务器，运行一个阻塞命令
    - `Ctrl B` `D` 可以合上电脑（休眠）
    - `tmux ls` 显示所有 `tmux a -t myth` 连上指定名字的就继续了

### apache benchmark
> 压力测试工具

- 测试本机超过100连接报错 104: 
    - [Blog:解决问题](http://www.cnblogs.com/archoncap/p/5883723.html)

************************************
## 其他工具

### 输入法
- [rime](http://rime.im/) `用过一下子有莫名其妙的bug就卸载了`

### qgit
- git查看仓库的图形化界面

***********************************
### convert
- [参考博客](http://blog.csdn.net/mybelief321/article/details/9969949)
- 将图片转换成指定大小 这是保持比例的 `convert -resize 600X600 src.jpg dst.jpg` 中间是字母X
- 如果不保持比例，就在宽高后加上感叹号 
- 可以只指定高度，那么宽度会等比例缩放 `convert -resize 400 src.jpg dst.jpg`

### todo.txt
> [官网](http://todotxt.org/) 一个简约的 TODO 软件

#### todo.txt-cli
> 终端中的TODO 

- [todo.txt-cli](https://github.com/todotxt/todo.txt-cli)

**************************************
## 【文本编辑器】
### Ghex
- 十六进制文件编辑器

************************************
### Kate/KWrite(Kate的轻量版)
- [安装markdown预览插件](https://github.com/antonizoon/kate-markdown)
- 码Python也挺方便，也有常用快捷键，自动提示，终端整合，而且是自动切目录

*********************************
### Geany
- 码C 编译方便 有Ctag辅助

### scite
> 简洁的编辑器，可配置挺多，打开速度快

### textadept
> 基于前者进行开发，十分简洁，有着和sublime的外观和速度，没有他的强大但也没有他的bug！
> [官方手册](https://foicica.com/textadept/manual.html)

- Github 地址[textadept](https://github.com/rgieseke/textadept/)
- 主题仓库 [textadept-themes](https://github.com/rgieseke/textadept-themes) 棒！

**********************************
### Sublime 
- 如果出现小bug，就直接删除 ～.config 下的 sublime文件夹注意注册证书拷出来
- 还是挺好的，小巧，但是中文硬伤 用来阅读代码比较合适
- 中文不兼容解决方法： 3143版本号下：
    - 搜索安装插件 ChineseLocalizations 就能汉化 
    - 修改配置文件 添加`"font_face": "DeJaVu Sans Mono",` 就解决了字体错位的问题
    - 保存为项目来切换管理更为方便
- [参考博客](http://www.cnblogs.com/hollow/p/6496469.html) | [3143码](https://gitee.com/kcp1104/codes/89xfugn5dwoyr23vchikb54)
- 主题安装 Boxy Theme 以及  A File Icon 就能切换多种主题了 [参考博客](https://www.zhihu.com/question/46266742)
- [sublime的常用快捷键](http://www.cnblogs.com/kristen-zou/p/7641158.html)
- [配置C/C++开发环境](http://www.cnblogs.com/flipped/p/5836002.html)

************************************
### VSCode
- 码笔记，码Python 比较方便，目录树，预览，整合终端
- [快捷键](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf)
    - Ctrl P 快速打开
    - Ctrl Shift P 命令模式
    - Ctrl+K Ctrl+S 设置快捷键 Keyboard Shortcuts
- [使用vscocd进行python开发](http://www.cnblogs.com/bloglkl/archive/2016/08/23/5797805.html)


************
### Gedit
- 安装markdown预览插件 `早已经停止维护了，还是只用来简单的查看修改文件就好了`

### 小书匠
- [在线使用](http://markdown.xiaoshujiang.com/)[github地址](https://github.com/suziwen/markdownxiaoshujiang)
- 本来是很合适的，


************
### Moediter Typora CuteMarkEd 
- 书写单个md文件方便，美观，没有目录树是硬伤

************
### Vi/Vim
> [Vim 学习笔记](/Linux/vim.md)

************
### Nano
- 模式没有vi系列复杂，使用简单，安装占用小


************
### fte-terminal
- 文件树浏览，快速打开文件进行修改是比较方便的

******************************
## 【IDE】
### Idea
#### 插件
##### lombok
- 插件商店中搜索 lombok 安装重启idea即可
- 配置 Build,Execution > Compiler > Annotation Processors 勾选上即可使用lombok的注解
### eclipse


*********************************************
## 【浏览器】
### FireFox
- 分为 正式版， beta， Nightly 开发版 `因为那个插件标准的缘故 56 和 57 插件不共享`
- 如果要配置多个火狐在电脑上 终端中 `./firefox -P` 就会进入配置文件的编辑（关闭所有火狐的情况下）
    - 新建一个就好了，之后就用新建的打开该火狐`./firefox -P name`
- 如果要同时开多个火狐 加上`--no-remote`参数，但是我这个deepin不要诶，但是Ubuntu mint加上也没有用

- [开发者版本链接](https://www.mozilla.org/zh-CN/firefox/developer/)

**************************************************
#### 必备插件
- `FoxyTab`
- `New Tab Tools` 新建标签页的Tool
- `cliget` 能将下载中的任务转化为 curl wget命令
- `eolinker` 接口测试工具
- `Simple Tab Groups` 
- `rester` rest客户端工具
- `Download all Images`下载图片
- `octotree` github 目录查看
- `Web Developer` 各种Web调试开发工具
- `One Tab` tab归组
- `Remove Cookies Button`

****************************************
### Chrome
- 的确快，就是内存占用高

************
### Vivaldi
- 感觉采用的是chrome内核，做的更漂亮了，而且是内置了很多常用插件，的确很方便，相比于chrome更符合国内使用

***********************************************
