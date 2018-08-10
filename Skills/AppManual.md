`目录 start`
 
- [软件使用记事](#软件使用记事)
    - [【包管理】](#包管理)
        - [使用sdkman](#使用sdkman)
    - [【服务管理】](#服务管理)
        - [oneinstack](#oneinstack)
- [【常用工具】](#常用工具)
    - [网络工具](#网络工具)
        - [nmap](#nmap)
        - [apache benchmark](#apache-benchmark)
    - [日常工具](#日常工具)
        - [输入法](#输入法)
            - [搜狗输入法](#搜狗输入法)
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
            - [快捷键](#快捷键)
        - [Sublime](#sublime)
            - [快捷键](#快捷键)
            - [crack](#crack)
        - [VSCode](#vscode)
            - [快捷键](#快捷键)
            - [代码片段](#代码片段)
            - [插件](#插件)
            - [实践](#实践)
        - [Gedit](#gedit)
        - [小书匠](#小书匠)
        - [Moeditor|Typora|CuteMarkEd](#moeditor|typora|cutemarked)
        - [Cmd](#cmd)
    - [终端中的文本编辑器](#终端中的文本编辑器)
        - [Vi/Vim](#vivim)
        - [Nano](#nano)
        - [fte-terminal](#fte-terminal)
    - [在线编辑器](#在线编辑器)
    - [【IDE】](#ide)
        - [Idea](#idea)
        - [eclipse](#eclipse)
    - [【浏览器】](#浏览器)
        - [FireFox](#firefox)
            - [开发版本](#开发版本)
            - [必备插件](#必备插件)
            - [配置](#配置)
        - [seamonkey](#seamonkey)
        - [Chrome](#chrome)
            - [主题](#主题)
        - [Vivaldi](#vivaldi)
    - [绘图工具](#绘图工具)
        - [在线版](#在线版)
        - [安装版](#安装版)
    - [安全工具](#安全工具)
        - [gpg](#gpg)

`目录 end` |_2018-08-09_| [码云](https://gitee.com/gin9) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104) | [cnblogs](http://www.cnblogs.com/kuangcp)
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
> 一键配置环境 [官方文档](https://oneinstack.com/install/)

![配图](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Linux/install_oneinstack.png)
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
    - -n `最简单直接的参数`

### apache benchmark
> 压力测试工具

- 测试本机超过100连接报错 104: 
    - [Blog:解决问题](http://www.cnblogs.com/archoncap/p/5883723.html)

************************************
## 日常工具
### 输入法
#### 搜狗输入法
> 唯一一个大厂支持Linux 

- Ctrl Alt B 显示/关闭 特殊字符面板

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
> 基于前者进行开发，十分简洁，有着和sublime的外观和速度，没有他的功能强大但也没有他的烦心bug！ 但是自己定制时难度有点大
> [官方手册](https://foicica.com/textadept/manual.html)

- Github 地址[textadept](https://github.com/rgieseke/textadept/)
- 主题仓库 [textadept-themes](https://github.com/rgieseke/textadept-themes) 
_个人配置_
```lua
    if not CURSES then ui.set_theme('base16-solarized-light') end
    ui.set_theme('light', {font = 'Monospace', fontsize = 13})
    -- print(ui.size)
    -- for k,v in ipairs(ui.size) do
    -- print(k,v)
    -- end
    ui.size = {[1] = 800, [2] = 650}
```

#### 快捷键
> Alt Shift 列编辑  


### Sublime 
> [常用配置](https://segmentfault.com/a/1190000002596724)

- 如果出现小bug，就直接删除 ～.config 下的 sublime文件夹注意注册证书拷出来
- 中文不兼容解决方法： 3143版本号下：
    - 搜索安装插件 ChineseLocalizations 就能汉化 
    - 修改配置文件 添加`"font_face": "DeJaVu Sans Mono",` 就解决了字体错位的问题
    - 保存为项目来切换管理更为方便
- 主题安装 Boxy Theme 以及  A File Icon 就能切换多种主题了 [参考博客](https://www.zhihu.com/question/46266742)
- [配置C/C++开发环境](http://www.cnblogs.com/flipped/p/5836002.html)

**关闭自动检查升级**
- setting 中 "update_check":false
#### 快捷键
> [参考博客: Sublime Text 3 快捷键](http://www.cnblogs.com/roadone/p/7745641.html)
> [sublime的常用快捷键](http://www.cnblogs.com/kristen-zou/p/7641158.html)

#### crack
> [3143码](https://gitee.com/kcp1104/codes/89xfugn5dwoyr23vchikb54#sublime-3143-Key)

- [参考博客](http://www.cnblogs.com/hollow/p/6496469.html)
- [3143 1](https://fatesinger.com/100121) | [3143 2](https://fatesinger.com/100227) | [3176](https://fatesinger.com/100237) 

************************************

### VSCode

> [官网](https://code.visualstudio.com/) 码笔记，码Python 比较方便，目录树，预览，整合终端  | [中文手册](https://jeasonstudio.gitbooks.io/vscode-cn-doc/)

1. 其所有用户自定义配置都缓存在此目录 `~/.config/Code/User/`
1. vscode 书写 markdown [官方文档](https://code.visualstudio.com/Docs/languages/markdown)


#### 快捷键
> [快捷键官方PDF说明](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf)

- `Ctrl P` 快速命令
    - 直接输入文件名就是搜文件
    - `>` 作为前缀则等同 `Ctrl Shift P`
    - `#` 作为前缀则等同 `Ctrl T`
- `Ctrl T ` 搜索打开所有Markdown文件的所有标题
- `Ctrl Shift P ` 执行命令
- `Ctrl+K Ctrl+S` 设置用户快捷键  Keyboard Shortcuts
- `Ctrl Shift C `在当前打开的文件夹下打开系统默认终端
- `Ctrl Space` 智能提示 变量,代码片段... **需要注意这个快捷键和Windows以及Linux上切换输入法快捷键有冲突,修改即可**
- `Alt Shift` 列编辑

> [参考博客: 快捷键大全](https://blog.csdn.net/crper/article/details/54099319)
> [参考博客: VS Code 使用小技巧](https://zhuanlan.zhihu.com/p/22880087)

#### 代码片段
> 配置地点 文件-首选项-用户代码片段 可以新建一个代码片段  
> 默认是放在用户的配置目录下 `~/.config/Code/User/snippets/`

- [参考博客: VS Code 折腾记 - (6) 基本配置/快捷键定义/代码片段的录入（snippet）](https://juejin.im/post/58aeeca22f301e006cf65c8b)
- [巧用VScode“用户代码片段”来提高效率](https://www.dogxu.cn/2017/06/10/vscode-snippet/)
    - 然后自定义一下insert snippet的快捷键,就很方便使用了 个人配置为`Ctrl L`, **其实 直接 Ctrl Space 直接提示就行了**
    - 注意,每次修改片段配置文件,都需要重启Vscode才会生效最新修改...emm

#### 插件
**美化**
1. vscode-icons
1. Material Icon Theme
1. One Dark Pro
1. snazzy operator

**工具**
1. Beautify
1. Auto Rename Tag
1. Todo Tree 
1. GitLens `方便查看更改`

#### 实践
> [参考博客: 用Git在Visual Studio Code内进行版本控制[指导]](https://sdk.cn/news/4041)
> [参考博客: 使用vscocd进行python开发 ](http://www.cnblogs.com/bloglkl/archive/2016/08/23/5797805.html)

***********************************
### Atom
> Github 推出的编辑器 [淘宝Mirror](https://npm.taobao.org/mirrors/atom)

1. 配置apm命令镜像 
`~/.atom/.atomrc`
```
registry=https://registry.npm.taobao.org/
strict-ssl=false
```
1. 或者直接clone 进行安装 在`~/.atom/packages`下clone仓库, 然后 apm install 

************************************
### Gedit
> [Github地址](https://github.com/GNOME/gedit)

- 安装markdown预览插件 `该插件早已经停止维护了，还是只用来简单的查看修改文件就好了`

******************************

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

### Moeditor|Typora|CuteMarkEd 
> [Moeditor](https://github.com/Moeditor/Moeditor)

- 书写单个md文件方便，美观，没有目录树侧栏是硬伤, 但是typora 导出很强大

*****************************

### Cmd
> [官网](https://www.zybuluo.com/cmd/)

*************************************
## 终端中的文本编辑器
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
> [更多](/Java/Tool/IDEA.md)

### eclipse

【eclipse EE Mars】
* 这里的Tomcat是使用了你所导入的必要执行文件，但是运行的必要配置文件在eclipse Server项目里另有一份
* 而且运行时也是使用这份配置文件，这样的结果是可以使用一份Tomcat目录，在eclipse配置运行多个Tomcat
* 但是奇怪的是 访问不了Tomcat主页即：localhost:8080 所以也就不能管理Tomcat 查看运行状态

资源下载 archive.eclipse.org/eclipse/downloads/ 

*********************************************
## 【浏览器】
### FireFox
> [所有桌面版](https://www.mozilla.org/zh-CN/firefox/channel/desktop/) | [所有正式版](https://www.mozilla.org/en-US/firefox/releases/)
> [正式版本和夜更新版FTP下载地址](http://ftp.mozilla.org/pub/firefox) | [所有开发者版本](http://ftp.mozilla.org/pub/devedition/releases/)

`57为全新的Quantum版本， 因为插件标准的缘故和之前的56版本插件不兼容`

- 分为 正式版， beta， Nightly 开发版 
- 如果要配置多个火狐在电脑上 终端中 `./firefox -P` 就会进入配置文件的编辑（关闭所有火狐的情况下）
    - 新建一个就好了，之后就用新建的打开该火狐`./firefox -P name`
    - 如果要同时运行多种版本的火狐 加上`--no-remote`参数，但是我这个deepin不要诶，只要配置不同即可，但是Ubuntu mint加上也没有用

- 火狐和Chrome都支持在控制台的网络中直接右击一个请求然后复制, 就可以出来复制成cURL命令的选项, 比较好用

> [火狐性能优化贴](https://www.xzcblog.com/post-47.html)

#### 开发版本
> [开发者版本链接](https://www.mozilla.org/zh-CN/firefox/developer/) | [开发工具](https://firefox-dev.tools/)  
> [使用说明文档](https://developer.mozilla.org/zh-CN/docs/Tools?utm_source=devtools&utm_medium=tabbar-menu)

**************************************************
#### 必备插件
> [开发自己的插件](https://github.com/Kuangcp/LearnWebExtension)

- `Saka Key` 快捷键神器 大幅度脱离鼠标 [官方文档](https://key.saka.io/)
    1. 浏览器默认: 脱离输入框焦点 _Esc_ | 切换标签 _ctrl-Tab_  _shift-ctrl-Tab_ | 关闭标签 _ctrl-w_
    1. 滑动: 下滑 `d/j` 上滑 `s/k `
        - 上下滑半屏幕 `Shift d/s` | 上下滑全屏 `Shift j/k` 
        - 滑到底/顶 `Shift-g` / `gg`
        - 滑左/右 `alt-s or alt-k` / `alt-d or alt-j`
    1. 缩放: 放大/缩小 `z/shift-z` | 重置大小 `shift-alt-z`
    1. 前进/后退: `cc/vv` | 跳上级URL `uu` | 跳URL域名 `u shift-u`
    1. 标签页: 新建 `t` | 恢复关闭 `shift t` | 复制 `b`
        - 关闭 `xx` | 关闭其他 `x shift x` | 关闭左边 `x [` | 关闭右边 `x ]`
        - 刷新 `rr` | 刷新全部标签 `r shift r` | 深度刷新 `shift r shift r `
        - 切换: 左右 `q/w` 或者 `[/]` | 第一个/最后一个 `1/0`或者`shift-q`/`shift-w or 0 `
        - 移动: 左右 `i/o` 或者 `shift-[` / `shift-]` 第一个/最后一个 `shift-i/shift-o` 或者 `alt-[/alt-]`
        - 静音: `m` 静音所有标签 `shift-m`
    1. 窗口: 新建 `n` | 新建隐私 `shift n`
    1. 页面上所有页面链接 `ff` _神操作_ [文档](https://key.saka.io/tutorial/clicking_and_link_hints)
    1. 传递快捷键即绕过插件的事件监听 `;` [文档](https://key.saka.io/tutorial/pass_keys)
        - 比如要在网页上敲英文的时候,就需要每次都要输入分号,才能绕过监听, 真是麻烦
    1. [剪贴板](https://key.saka.io/tutorial/clipboard): 复制当前页面的URL:`yy`
        - 当前标签页打开链接 `yf`| 后台打开 `yb` | 新窗口打开 `yn` | 隐私窗口 `y shift-n`

1. `FoxyTab`
1. `New Tab Tools` 新建标签页的自定义工具 有一定bug
1. `cliget` 能将下载中的任务转化为 curl wget命令 牛
1. `eolinker` 接口测试工具
1. `Simple Tab Groups` 58版本有bug
1. `rester` rest客户端工具
1. `Download all Images`下载图片
1. `octotree` github 目录查看
1. `Web Developer` 各种Web调试开发工具
1. `One Tab` tab归组,十分好用
1. `Remove Cookies Button`
1. `围脖是个好图床哟` 方便的图床,但是要登录微博
1. `滴答清单` 全平台可使用
1. `Auto Reload Tab` 定时自动刷新标签页
1. `轻灵划译` 即刻翻译, 多种平台

#### 配置
> 主要是 about:config 

1. 此地址使用了一个通常用于网络浏览以外的端口 
    1. 地址栏 : `about:config` 
    1. 右键新建字符串 `network.security.ports.banned.override` 
    1. 输入值 81,88,98 也可以是 6000-6005, 省事就 0-65535(不建议)
*********************
### seamonkey
> Mozilla基金会另一个项目 [seamonkey](https://www.seamonkey-project.org/) 亮点在于内置IRC

****************************************
### Chrome
- 的确快,几乎没有各种兼容和诡异问题，就是内存占用高, 还有就是主题被墙,fq才能配置好

#### 主题
1. Aero Trans Brushed Metal Theme
1. Material Dark
1. Morpheon Dark
1. 炭黑+銀色金屬
1. Modern Flat
************

### Vivaldi
- 感觉采用的是chrome内核，做的更漂亮了，而且是内置了很多常用插件，的确很方便，相比于chrome更符合国内使用

***********************************************
## 绘图工具
### 在线版
- [processon](https://www.processon.com/)

### 安装版
*****************
## 安全工具
### gpg
> [参考博客](http://www.ruanyifeng.com/blog/2013/07/gpg.html)

常用参数
```
gpg --list-key
    --gen-key
```
- 生成的过程, 输入相关的提示信息, 最后输完密码后需要输入随机字符, 就也是按照提示, 但是1.4是正常的, 其他的直接假死,不是很理解这种操作


