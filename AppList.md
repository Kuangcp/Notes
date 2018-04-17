`目录 start`
 
- [工具软件](#工具软件)
    - [IDE](#ide)
    - [SDK](#sdk)
    - [VCS](#vcs)
    - [网络](#网络)
        - [穿透工具](#穿透工具)
        - [抓包工具](#抓包工具)
        - [Web服务器](#web服务器)
        - [镜像](#镜像)
    - [安全](#安全)
        - [授权](#授权)
        - [压力测试](#压力测试)
        - [构建工具](#构建工具)
    - [文档处理](#文档处理)
        - [UML](#uml)
        - [Log文件](#log文件)
    - [异步](#异步)
    - [响应式](#响应式)
    - [Database](#database)
    - [前端](#前端)
        - [富文本编辑器](#富文本编辑器)
    - [模拟器](#模拟器)
    - [Other](#other)
- [安卓手机](#安卓手机)
    - [Google](#google)

`目录 end` |_2018-04-16_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 工具软件

## IDE
- [IDEA](https://www.jetbrains.com/idea/)
    - [lanyus](http://blog.lanyus.com/6.html)
- [Eclipse](http://www.eclipse.org/)
    - [中科大eclipse镜像源](http://mirrors.ustc.edu.cn/eclipse/technology/epp/downloads/release/)

****************************
## SDK
- [Springboot下载地址](https://github.com/spring-projects/spring-boot/releases)
- [openjdk](http://openjdk.java.net/)`开源的JDK, 个人曾经遇到内存泄露(Docker环境)`
- [oracle-jdk英文版页面](http://www.oracle.com/technetwork/java/javase/downloads/index.html) `更新的快`
    - [oracle-jdk中文版页面](http://www.oracle.com/technetwork/cn/java/javase/downloads/index.html) `很少维护的中文页面而已,有很多错漏,英文版最好`

**************************
## VCS
- [SVN](https://subversion.apache.org/)
    - [submin](https://supermind.nl/submin/)`SVN管理的Web界面`
- [git](https://git-scm.com/) `最好用的vcs`

_自建Git服务_
- [gogs](https://github.com/gogits/gogs) `自建git服务器`
- [gitea](https://github.com/go-gitea/gitea) `gogs加强`
    - [docker安装](https://docs.gitea.io/zh-cn/install-with-docker/)


***************
## 网络
### 穿透工具
- [lanproxy](https://github.com/ffay/lanproxy) `将局域网个人电脑、服务器代理到公网的内网穿透工具`
- [ngrok](https://ngrok.com/)`随机域名到穿透到内网 eg: ngrok http 8080`
- [frp](https://diannaobos.com/frp/)`自己服务器外网到内网穿透`
    - [下载地址](https://file.diannaobos.com/frp_releases/)[使用帮助](https://diannaobos.com/post/470.html)

### 抓包工具
- [whistle](https://github.com/avwo/whistle) `nodejs 平台的抓包工具`
- [fiddler](https://www.telerik.com/fiddler)`windows平台抓包工具`
- [charles](https://www.charlesproxy.com/)`跨平台收费`
    - [咳咳](http://charles.iiilab.com/)

### Web服务器
- [tomcat](http://tomcat.apache.org/)`Apache基金会`
- [jetty](https://www.eclipse.org/jetty/)`Eclipse基金会`
- [undertow](https://github.com/undertow-io/undertow) `轻量高可用` 

### 镜像
> [浙大镜像工具](https://github.com/aploium/zmirror)

## 安全
### 授权
- [jwt](https://jwt.io)`JSON WEB TOKEN`

### 压力测试
- [jmeter](http://jmeter.apache.org/download_jmeter.cgi) `apache 下的开源压测工具`
- [ab](https://httpd.apache.org/docs/2.4/programs/ab.html) `apt安装这个包即可apache2-utils` 

### 构建工具
- [Maven](http://maven.apache.org/)
- [Gradle官方下载地址](http://services.gradle.org/distributions/)
    - [gradle-tomcat-plugin](https://github.com/bmuschko/gradle-tomcat-plugin)`gradle中tomcat插件`
- [sbt](https://github.com/sbt/sbt)

## 文档处理
- [Gitbook](https://github.com/GitbookIO/gitbook)
    - [gitbook-use](https://github.com/zhangjikai/gitbook-use)`Gitbook的使用`
- [pandoc](https://github.com/jgm/pandoc) `一个文档格式转换的软件，markdown docx`
- [retext](https://github.com/retext-project/retext)`markdown书写软件`
- [API文档管理](http://doclever.cn/controller/index/index.html)

### UML
- [免费UML软件统计 博客](http://blog.csdn.net/s464036801/article/details/8469166)
- [bouml](http://www.bouml.fr/download.html#Debian) `官方网站下载`
- [argouml](http://argouml.tigris.org/) `argouml官网`

### Log文件
> 方便的查看Log文件
- [otroslogviewer](https://github.com/otros-systems/otroslogviewer)
- [chainsaw](http://logging.apache.org/chainsaw/2.x/)
- [vigilog](http://vigilog.sourceforge.net/index.html)

*******************
## 异步
- [dwr](http://directwebremoting.org/dwr/index.html)`Js调用Java方法并拿到返回值`

## 响应式
- [vertx](http://vertx.io/)`构建响应式应用程序`

****************************
## Database
- [sssdb](https://github.com/ideawu/ssdb) `键值对数据库`
- [MySQL官方下载地址](https://dev.mysql.com/downloads/mysql/)
    - [Mysql-Font](https://github.com/NilsHoyer/MySQL-Front) `连接Mysql的客户端`
    - [HeidiSQL](https://github.com/HeidiSQL/HeidiSQL)`十分好用`
- [sqlectron](https://github.com/sqlectron/sqlectron-gui) `简单直观的数据库图形化软件`

*******************************
## 前端
- [Framework7](http://framework7.cn/)`开发类似ios7的web应用（HTML）`
- [Bootstrap](https://v3.bootcss.com/getting-started/)
- [LayUI](http://www.layui.com/)
- [Hotkeys](https://github.com/jaywcjlove/hotkeys)`前端捕获按键输入,可以用来设置快捷键`
- [socket.io](https://socket.io)`基于nodejs的socket技术`
- [h-ui](http://h-ui.net/)

### 富文本编辑器
- [wangeditor](http://www.wangeditor.com/)`富文本编辑器`
- [ckeditor](https://ckeditor.com/)`开源中国在用的富文本编辑器`
    - [github地址](https://github.com/ckeditor/ckeditor-dev)


## 模拟器
- [genymotion](https://www.genymotion.com/) `安卓模拟器`

## Other
- [crash](http://www.crashub.org/)`Java中的Shell环境`


# 安卓手机

## Google
> [google安装器](http://www.goplaycn.com/)