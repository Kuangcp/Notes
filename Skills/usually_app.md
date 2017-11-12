# 常用的工具软件

## 【国内的资源镜像站】
- [网易](http://mirrors.163.com/)`下载系统是 *-cd`

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
## 【常用工具】
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

### tmux
> 好用的管理会话的软件

- [tmux 入门](http://blog.jobbole.com/87278/)
`入门使用`
- 新建会话 `tmux new -s test`
- 断开会话但是后台运行 `ctrl-b d`
- 连接会话 `tmux a -t test`

### convert
- [参考博客](http://blog.csdn.net/mybelief321/article/details/9969949)
- 将图片转换成指定大小 这是保持比例的 `convert -resize 600X600 src.jpg dst.jpg` 中间是字母X
- 如果不保持比例，就在宽高后加上感叹号 
- 可以只指定高度，那么宽度会等比例缩放 `convert -resize 400 src.jpg dst.jpg`

### .git-prompt.sh
> Bash下显示当前分支

- `wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh` 下载脚本
- `chmod +x ~/.git-prompt.sh` 赋予可执行权限
- 在 .bash_alases文件中添加
```sh
lightgreen='\[\033[1;32m\]'
lightcyan='\[\033[1;36m\]'
lightpurple='\[\033[1;35m\]'
yellow='\[\033[1;33m\]'
nocolor='\[\033[0m\]'
source ~/.git-prompt.sh
set_bash_prompt(){
    #PS1="[e[32m]u[e[m]@[e[33m]W[e[36m]$(__git_ps1 ' (%s)')[e[31m]$[e[m]"
    PS1="${lightcyan}\t${lightgreen}\w${lightpurple}$(__git_ps1 ' (%s)')${yellow} → \[\e[m\]"
}
PROMPT_COMMAND="set_bash_prompt; $PROMPT_COMMAND"
```

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
- 中文不兼容解决方法： 3143版本号下：
    - 搜索安装插件 ChineseLocalizations 就能汉化 
    - 修改配置文件 添加`"font_face": "DeJaVu Sans Mono",` 就解决了字体错位的问题
    - 保存为项目来切换管理更为方便
- [参考博客](http://www.cnblogs.com/hollow/p/6496469.html)
`3143 注册码`
```
—– BEGIN LICENSE —–
TwitterInc
200 User License
EA7E-890007
1D77F72E 390CDD93 4DCBA022 FAF60790
61AA12C0 A37081C5 D0316412 4584D136
94D7F7D4 95BC8C1C 527DA828 560BB037
D1EDDD8C AE7B379F 50C9D69D B35179EF
2FE898C4 8E4277A8 555CE714 E1FB0E43
D5D52613 C3D12E98 BC49967F 7652EED2
9D2D2E61 67610860 6D338B72 5CF95C69
E36B85CC 84991F19 7575D828 470A92AB
—— END LICENSE ——
```
- 主题安装 Boxy Theme 以及  A File Icon 就能切换多种主题了 [参考博客](https://www.zhihu.com/question/46266742)
- [sublime的常用快捷键](http://www.cnblogs.com/kristen-zou/p/7641158.html)

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

******************************
## 【IDE】
### Idea
#### 插件
##### lombok
- 插件商店中搜索 lombok 安装重启idea即可
- 配置 Build,Execution > Compiler > Annotation Processors 勾选上即可使用lombok的注解
### eclipse


********************
## 【浏览器】
### FireFox
- 分为 正式版， beta， Nightly
- 如果要配置多个火狐在电脑上 终端中 `./firefox -P` 就会进入配置文件的编辑（关闭所有火狐的情况下）
    - 新建一个就好了，之后就用新建的打开该火狐`./firefox -P name`
- 如果要同时开多个火狐 加上`--no-remote`参数，但是我这个deepin不要诶，但是Ubuntu mint加上也没有用

#### 必备插件
- FoxyTab
- New Tab Tools

### Chrome
- 的确快，就是内存占用高

### Vivaldi
- 感觉采用的是chrome内核，做的更漂亮了，而且是内置了很多常用插件，的确很方便，相比于chrome更符合国内使用

*****************************
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
