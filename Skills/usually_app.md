# 常用的工具软件

## 【包管理】
### 使用sdkman
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

## 【服务管理】
### oneinstack
> [官方文档](https://oneinstack.com/install/)

- `apt -y install wget screen curl python`
- 下载源码：
    - `wget http://aliyun-oss.linuxeye.com/oneinstack-full.tar.gz` #阿里云经典网络下载
    - `wget http://mirrors.linuxeye.com/oneinstack-full.tar.gz` #包含源码，国内外均可下载
    - `wget http://mirrors.linuxeye.com/oneinstack.tar.gz` #不包含源码，建议仅国外主机下载
- `tar xzf oneinstack-full.tar.gz`
- `cd oneinstack` #如果需要修改目录(安装、数据存储、Nginx日志)，请修改options.conf文件
- `screen -S oneinstack` #如果网路出现中断，可以执行命令`screen -R oneinstack`重新连接安装窗口
- `sudo ./install.sh` #注：请勿sh install.sh或者bash install.sh这样执行


***************************
## 【文件管理器】
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
## 【终端模拟器】
- `qterminal` 可定制标签页位置以及透明度，很简洁
- `mate-terminal` 和gnome-terminal 基本配置什么的几乎一样，只是标题栏简洁一丢丢，跨标签页复制粘贴有bug
- `gnome-terminal` 很简洁，但是多标签时，标签页太大
- `sakura` 外观上和前两个几乎一样，标签页可以更简洁，但是设置不好调
- `deepin-terminal` 功能很多，主题很多，功能最为强大，但是字体可以选的很少
- `terminator` 可以定制背景图片，但是在我这deppin系统里有bug，多标签是假的，命令全是在共享的，不能用。。


虚拟软件包 x-terminal-emulator 由下面的软件包提供：
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
  aterm-ml 1.0.1-8
  aterm 1.0.1-8
  xterm:i386 322-1ubuntu1
  xterm 322-1ubuntu1
  mate-terminal:i386 1.18.1-1+sonya
  mate-terminal 1.18.1-1+sonya
  gnome-terminal:i386 3.18.3-linuxmint2
  gnome-terminal 3.18.3-linuxmint2
请您明确地选择安装其中一个。

**************************************
## 【工具】
### Autojump
> 统计cd 目录，方便目录跳转

- `apt install autojump` 设置为自动运行 `echo '. /usr/share/autojump/autojump.sh' >> ~/.bashrc`
    - `j -v` 查看安装版本
    - `j --stat` 查看统计信息
    - `j --help`
    - `jo code` 打开code文件夹
    - `jco c` 打开子目录
- `ls -l ~/.local/share/autojump/` 统计信息的目录，清除就相当于卸载重装了

### asciinema
- 终端录制工具 执行 `asciinema`或`asciinema rec` 即可开始录制
- 要注册就运行 `asciinema auth` 进入输出的网址，填邮箱和名字即可（每次登录都要这样。或者使用邮件来确认，麻烦ing）

### qgit
- git查看仓库的图形化界面

**************************************
## 【文本编辑器】
### Ghex
- 十六进制文件编辑器

### Kate/KWrite(Kate的轻量版)
- [安装markdown预览插件](https://github.com/antonizoon/kate-markdown)
- 码Python也挺方便，也有常用快捷键，自动提示，终端整合，而且是自动切目录

### Geany
- 码C 编译方便 有Ctag辅助

### Sublime 
- 如果出现小bug，就直接删除 ～.config 下的 sublime文件夹注意注册证书拷出来
- 还是挺好的，小巧，但是中文硬伤 用来阅读代码比较合适

### VSCode
- 码笔记，码Python 比较方便，目录树，预览，整合终端


### Gedit
- 安装markdown预览插件 

### Moediter Typora CuteMarkEd 
- 书写单个md文件方便，美观，没有目录树是硬伤

### Vi/Vim
> [Vim 学习笔记](/Linux/vim.md)

### Nano
- 模式没有vi系列复杂，使用简单，安装占用小

### fte-terminal
- 文件树浏览，快速打开文件进行修改是比较方便的

************
## 【IDE】
### Idea

### eclipse


****************
## 【浏览器】
### FireFox
- 分为正式版， beta， Nightly
- 如果要配置多个火狐在电脑上 终端中 `./firefox -P` 就会进入配置文件的编辑，新建一个就好了，之后就用新建的打开该火狐`./firefox -P name`
- 如果要同时开多个火狐 加上`--no-remote`参数，但是我这个deepin不要诶，但是Ubuntu mint加上也没有用

### Chrome
- 的确快，就是内存占用高

### Vivaldi
- 感觉采用的是chrome内核，做的更漂亮了，而且是内置了很多常用插件，的确很方便，相比于chrome更符合国内使用

*****************
## 【平台】
### Github
`github仓库 URL规则`
- 目录：
    - https://github.com/用户/项目/tree/分支/相对根目录的目录
- 文本文件：
    -  https://github.com/用户/项目/blob/分支/文件目录
- 二进制文件，例如图片：
    -  https://raw.githubusercontent.com/用户/项目/分支/文件目录
- 例如同仓库下的这个文件`/Linux/Docker.md` 可以直接这样写，方便调用，最好最前面不要加`.`这个表示当前目录的 加了反而会有问题
`md文件 目录规则（页内跳转）`
- `[](#标题名)` 即可，注意标题名不可有空格，`【Name】`看成Name 忽略这个符号


### 百度开发平台
### 腾讯微信公众号
### 图灵机器人
