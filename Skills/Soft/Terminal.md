`目录 start`
 
- [Terminal](#terminal)
    - [终端模拟器对比](#终端模拟器对比)
    - [工具](#工具)
        - [效率工具](#效率工具)
            - [Autojump](#autojump)
            - [tmux](#tmux)
            - [notes](#notes)
            - [todo.txt-cli](#todotxt-cli)
        - [文本操作](#文本操作)
            - [xclip](#xclip)
        - [文件操作](#文件操作)
            - [zssh](#zssh)
        - [分享](#分享)
            - [asciinema](#asciinema)

`目录 end` |_2018-07-08_| [码云](https://gitee.com/gin9) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# Terminal
> 终端模拟器是吸引我放弃习惯的Windows而转投Linux怀抱的主要原因

## 终端模拟器对比
> 列举出系统可安装终端 `sudo apt search terminal | grep -E terminal.+amd64`

- `qterminal` 可定制标签页位置以及透明度，很简洁,挺好用,但是不能内容和窗体大小自适配, 0.7.1已没有这个bug, 还是很好用的模拟器, 但是多标签的时候, 会有内存泄露
- `mate-terminal` 和gnome-terminal 基本配置什么的几乎一样，只是标题栏简洁一丢丢，如果使用选择即复制,那么在跨标签页复制粘贴有bug
- `gnome-terminal` 很简洁，但是多标签时，标签栏太大,标签页底部有白边
- `sakura` 外观上和前两个几乎一样，标签页可以更简洁，但是设置不好调, 而且不能自定义快捷键
- `deepin-terminal` 功能很多，主题很多，功能最为强大，但是字体可以选的很少
- `terminator` 可以定制背景图片，但是在我这deppin系统里有bug，多标签是假的，命令全是在共享的，不能用。。
- `tmux` 运维必备软件，入门有些繁琐
- `tilda` 内嵌于桌面上, 小命令方便, 需要查看文件就不方便了

> [更多可安装终端](https://gitee.com/kcp1104/codes/gca14wtqvm67l9j5r0deb56#Terminals.md)

************************
## 工具
### 效率工具
> 提高工作和开发效率

#### Autojump
> 统计cd 目录，方便目录跳转

- `apt install autojump` 设置为自动运行 `echo '. /usr/share/autojump/autojump.sh' >> ~/.bashrc`
    - `j -v` 查看安装版本
    - `j --stat` 查看统计信息
    - `j --help`
    - `jo code` 打开code文件夹
    - `jco c` 打开子目录
- `ls -l ~/.local/share/autojump/` 统计信息的目录，清除就相当于卸载重装了

#### tmux
> 好用的管理会话的软件

> [tmux 入门](http://blog.jobbole.com/87278/)

`入门使用`
- 新建会话 `tmux new -s test`
- 断开会话但是后台运行 `ctrl-b d`
- 连接会话 `tmux a -t test`

- `tmux new -s myth`  新建一个窗口 
- `Ctrl B`  再 `C`  新建一个窗口 `Ctrl B` `数字键`切换指定窗口
- 连接远程服务器，运行一个阻塞命令
    - `Ctrl B` `D` 可以合上电脑（休眠）
    - `tmux ls` 显示所有 `tmux a -t myth` 连上指定名字的就继续了

#### notes
> 管理笔记
> [Github](https://github.com/pimterry/notes)

#### todo.txt-cli
> 终端内的 todo 
> [Github](https://github.com/todotxt/todo.txt-cli)

*************
### 文本操作
#### xclip
> 便捷的文本复制
- `cat README.md | xclip -sel clip` 将文件复制到剪贴板

***********
### 文件操作
#### zssh
> 便捷的文件传输

- [参考博客](http://blog.csdn.net/ygm_linux/article/details/32321729)

***********
### 分享
#### asciinema
> 终端录制工具

- 执行 `asciinema`或`asciinema rec` 即可开始录制
- 要注册就运行 `asciinema auth` 进入输出的网址，填邮箱和名字即可（每次登录都要这样。或者使用邮件来确认，麻烦ing）

