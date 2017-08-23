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

************
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
