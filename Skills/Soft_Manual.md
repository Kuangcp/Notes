`目录 start`
 
- [软件使用记事](#软件使用记事)
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
        - [asciinema](#asciinema)
        - [tmux](#tmux)
        - [apache benchmark](#apache-benchmark)
    - [其他工具](#其他工具)
        - [输入法](#输入法)
            - [rime](#rime)
            - [小小输入法](#小小输入法)
        - [qgit](#qgit)
        - [convert](#convert)
        - [todo.txt](#todotxt)
            - [todo.txt-cli](#todotxt-cli)
    - [【文本编辑器】](#文本编辑器)
        - [Ghex](#ghex)
        - [Kate/KWrite(Kate的轻量版)](#katekwritekate的轻量版)
        - [Geany](#geany)
        - [scite](#scite)
        - [textadept](#textadept)
        - [Sublime](#sublime)
        - [VSCode](#vscode)
        - [Gedit](#gedit)
        - [小书匠](#小书匠)
        - [Moeditor Typora CuteMarkEd](#moeditor-typora-cutemarked)
    - [终端编辑器](#终端编辑器)
        - [Vi/Vim](#vivim)
        - [Nano](#nano)
        - [fte-terminal](#fte-terminal)
    - [在线编辑器](#在线编辑器)
    - [【IDE】](#ide)
        - [Idea](#idea)
            - [插件](#插件)
                - [lombok](#lombok)
        - [eclipse](#eclipse)
        - [MyEclipse](#myeclipse)
            - [【ALT 】：](#alt-)
            - [【CTRL】 ：](#ctrl-)
            - [【debug】](#debug)
    - [【浏览器】](#浏览器)
        - [FireFox](#firefox)
            - [必备插件](#必备插件)
        - [seamonkey](#seamonkey)
        - [Chrome](#chrome)
            - [主题](#主题)
        - [Vivaldi](#vivaldi)

`目录 end` *目录创建于2018-02-10* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# 软件使用记事
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
#### rime
- [rime](http://rime.im/) `用过一下子有莫名其妙的bug就卸载了`

#### 小小输入法
[小小输入法在Deepin上的使用](https://bbs.deepin.org/forum.php?mod=viewthread&tid=138500&highlight=%E5%B0%8F%E5%B0%8F%E8%BE%93%E5%85%A5%E6%B3%95)

### qgit
- git查看仓库的图形化界面

***********************************
### convert
- [参考博客](http://blog.csdn.net/mybelief321/article/details/9969949)
- 将图片转换成指定大小 这是保持比例的 `convert -resize 600X600 src.jpg dst.jpg` 中间是字母X
- 如果不保持比例，就在宽高后加上感叹号 
- 可以只指定高度，那么宽度会等比例缩放 `convert -resize 400 src.jpg dst.jpg`
- 还可以按百分比缩放

_批量修改_
> 如果没有 -path 语句，新生成的 png 文件将会覆盖原始文件 [参考博客](http://www.cnblogs.com/jkmiao/p/6756929.html)

- `mogrify -path newdir -resize 40X40 *.png` 把png图片全部转成40X40大小并放在新文件夹下
- `mogrify -path newdir -format png  *.gif` 将所有gif转成png放在新目录下

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

*********************************
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
> [官网](https://code.visualstudio.com/)

- 码笔记，码Python 比较方便，目录树，预览，整合终端
- [快捷键](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf)
    - Ctrl P 快速打开
    - Ctrl Shift P 命令模式
    - Ctrl+K Ctrl+S 设置快捷键 Keyboard Shortcuts
    - Ctrl Shift C 在当前打开的文件夹下打开系统默认终端
- [使用vscocd进行python开发](http://www.cnblogs.com/bloglkl/archive/2016/08/23/5797805.html)


************
### Gedit
> [Github地址](https://github.com/GNOME/gedit)

- 安装markdown预览插件 `早已经停止维护了，还是只用来简单的查看修改文件就好了`

### 小书匠
- [在线使用](http://markdown.xiaoshujiang.com/) | [github地址](https://github.com/suziwen/markdownxiaoshujiang)
- 本来是很合适的，但是对文件操作不干净，总有些bug不好用,文件闪退出错,终端不方便
    - 不适合编程适合写作,所支持的md的格式非常强大
- 快捷键
    - 加粗    `Ctrl + B` 
    - 斜体    `Ctrl + I` 
    - 引用    `Ctrl + Q`
    - 插入链接    `Ctrl + L`
    - 插入代码    `Ctrl + K`
    - 插入图片    `Ctrl + G`
    - 提升标题    `Ctrl + H`
    - 有序列表    `Ctrl + O`
    - 无序列表    `Ctrl + U`
    - 横线    `Ctrl + R`
    - 撤销    `Ctrl + Z`
    - 重做    `Ctrl + Y`

************
### Moeditor Typora CuteMarkEd 
> [Moeditor](https://github.com/Moeditor/Moeditor)

- 书写单个md文件方便，美观，没有目录树是硬伤

************
## 终端编辑器
### Vi/Vim
> [Github地址](https://github.com/vim/vim)  
> [Vim 学习笔记](/Linux/vim.md)

************
### Nano
- 模式没有vi系列复杂，使用简单，安装占用小

************
### fte-terminal
- 文件树浏览，快速打开文件进行修改是比较方便的

*****************
## 在线编辑器
_[stackedit.io](https://stackedit.io/)_
- [Github地址](https://github.com/benweet/stackedit/)

CMD编辑器
******************************
## 【IDE】
### Idea
#### 插件
##### lombok
- 插件商店中搜索 lombok 安装重启idea即可
- 配置 Build,Execution > Compiler > Annotation Processors 勾选上即可使用lombok的注解

### eclipse
【eclipse EE Mars】
* 这里的Tomcat是使用了你所导入的必要执行文件，但是运行的必要配置文件在eclipse Server项目里另有一份
* 而且运行时也是使用这份配置文件，这样的结果是可以使用一份Tomcat目录，在eclipse配置运行多个Tomcat
* 但是奇怪的是 访问不了Tomcat主页即：localhost:8080 所以也就不能管理Tomcat 查看运行状态

*********************
### MyEclipse
* 创建一个工作平台后，首先把编码改成UTF-8，自动更新去掉，加上独立的Tomcat
* 从github上下载项目，直接打开，注意编码就行，注意项目要将使用的额外的JAR包直接拖到
* webRoot下的lib下，再build 进PATH里，这样就不会出现JAR包缺失的问题了
* 在2016中的JSP使用gbk编码，js和css文件引入时要注明UTF-8编码

#### 【ALT 】：
. 运行
/ 助手
#### 【CTRL】 ：
+shift+O自动导包  
+shift+F 优化缩进


 * 使用export导出时带上resource选项，这样的话注释才会导出去了
 * 自动添加注释在 Java>Code Style>Code Templates下
#### 【debug】 
- 【F5】  Step into 跳入
- 【F6】  Step over 下一步
- 【F7】  Step return 跳出
- 【F8】  resume 恢复

*********************************************
## 【浏览器】
### FireFox
> [开发者版本链接](https://www.mozilla.org/zh-CN/firefox/developer/)

- 分为 正式版， beta， Nightly 开发版 `因为那个插件标准的缘故 56 和 57 插件不共享`
- 如果要配置多个火狐在电脑上 终端中 `./firefox -P` 就会进入配置文件的编辑（关闭所有火狐的情况下）
    - 新建一个就好了，之后就用新建的打开该火狐`./firefox -P name`
- 如果要同时开多个火狐 加上`--no-remote`参数，但是我这个deepin不要诶，但是Ubuntu mint加上也没有用

> 火狐和Chrome都支持在控制台的网络中直接右击一个请求然后复制, 就可以出来复制成cURL命令的选项, 比较好用

**************************************************
#### 必备插件
- `Saka Key` 快捷键神器 大幅度脱离鼠标 [官方文档](https://key.saka.io/)
    - 浏览器默认: 脱离输入框焦点 _Esc_ | 切换标签 _ctrl-Tab_  _shift-ctrl-Tab_ | 关闭标签 _ctrl-w_
    - 滑动: 下滑 `d/j` 上滑 `s/k `
        - 上下滑半屏幕 `Shift d/s` | 上下滑全屏 `Shift j/k` 
        - 滑到底/顶 `Shift-g` / `gg`
        - 滑左/右 `alt-s or alt-k` / `alt-d or alt-j`
    - 缩放: 放大/缩小 `z/shift-z` | 重置大小 `shift-alt-z`
    - 前进/后退: `cc/vv` | 跳上级URL `uu` | 跳URL域名 `u shift-u`
    - 标签页: 新建 `t` | 恢复关闭 `shift t` | 复制 `b`
        - 关闭 `xx` | 关闭其他 `x shift x` | 关闭左边 `x [` | 关闭右边 `x ]`
        - 刷新 `rr` | 刷新全部标签 `r shift r` | 深度刷新 `shift r shift r `
        - 切换: 左右 `q/w` 或者 `[/]` | 第一个/最后一个 `1/0`或者`shift-q`/`shift-w or 0 `
        - 移动: 左右 `i/o` 或者 `shift-[` / `shift-]` 第一个/最后一个 `shift-i/shift-o` 或者 `alt-[/alt-]`
        - 静音: `m` 静音所有标签 `shift-m`
    - 窗口: 新建 `n` | 新建隐私 `shift n`
    - 页面上所有页面链接 `ff` _神操作_ [文档](https://key.saka.io/tutorial/clicking_and_link_hints)
    - 传递快捷键即绕过插件的事件监听 `;` [文档](https://key.saka.io/tutorial/pass_keys)
        - 比如要在网页上敲英文的时候,就需要每次都要输入分号,才能绕过监听, 真是麻烦
    - [剪贴板](https://key.saka.io/tutorial/clipboard): 复制当前页面的URL:`yy`
        - 当前标签页打开链接 `yf`| 后台打开 `yb` | 新窗口打开 `yn` | 隐私窗口 `y shift-n`

- `FoxyTab`
- `New Tab Tools` 新建标签页的自定义工具 有一定bug
- `cliget` 能将下载中的任务转化为 curl wget命令 牛
- `eolinker` 接口测试工具
- `Simple Tab Groups` 58版本有bug
- `rester` rest客户端工具
- `Download all Images`下载图片
- `octotree` github 目录查看
- `Web Developer` 各种Web调试开发工具
- `One Tab` tab归组,十分好用
- `Remove Cookies Button`
- `围脖是个好图床哟` 方便的图床,但是要登录微博

### seamonkey
> Mozilla基金会另一个项目 [seamonkey](https://www.seamonkey-project.org/) 亮点在于内置IRC

****************************************
### Chrome
- 的确快，就是内存占用高, 还有就是主题被墙,fq才能配置好

#### 主题
- Aero Trans Brushed Metal Theme
- Material Dark
- Morpheon Dark
- 炭黑+銀色金屬
- Modern Flat
************

### Vivaldi
- 感觉采用的是chrome内核，做的更漂亮了，而且是内置了很多常用插件，的确很方便，相比于chrome更符合国内使用

***********************************************
