# 常用的工具软件


## 在Linux上操作压缩文件的命令
> Linux默认自带ZIP压缩，最大支持4GB压缩，RAR的压缩比大于4GB.

### tar 归档 打包

`tar`
`这五个是独立的命令，压缩解压都要用到其中一个，可以和别的命令连用但只能用其中一个。`
- c: 打包 压缩
- x：解压
- t：查看内容 不解压
- r：向压缩归档文件末尾追加文件
- u：更新原压缩包中的文件

***
`下面的参数是根据需要在压缩或解压档案时可选的。`
- z：有gzip属性的
- j：有bz2属性的
- Z：有compress属性的
- v：显示所有过程
- O：将文件解开到标准输出

***
- `-v 可选` 将压缩或解压的过程输出
- `-f 是必须的,-f: 使用档案名字，切记，这个参数是最后一个参数，后面只能接文件或目录`

***
- `tar -rf all.tar *.gif`这条命令是将所有.gif的文件增加到all.tar的包里面去。
- `tar -uf all.tar logo.gif`这条命令是更新原来tar包all.tar中logo.gif文件，
- `tar -tf all.tar` 这条命令是列出all.tar包中所有文件，
- `tar -xf all.tar` 这条命令是解出all.tar包中所有文件，
    - `-u`是表示更新文件的意思。
    - `-r`是表示增加文件的意思。
    - `-t`是列出所有文件的意思
    - `-x`是解压的意思
    - `-p` 保留绝对路径符
 
- 保留文件属性和跟随链接， -p 保留属性 -h 备份的源文件而不是链接本身
    - `tar -cphf etc.tar /etc`

********************
#### 压缩
- tar -cvf a.tar *.txt
    - z tar.gz
    - j tar.bz2
    - Z tar.Z
    - J tar.xz

- `tar -cvf jpg.tar *.jpg` //将所有jpg打包成tar.jpg 
- `tar -czf jpg.tar.gz *.jpg `  //将所有jpg打包成jpg.tar后 生成gzip压缩的包，命名为jpg.tar.gz
- `tar -cjf jpg.tar.bz2 *.jpg `//将所有jpg打包成jpg.tar后 生成bzip2压缩的包，命名为jpg.tar.bz2
- `tar -cZf jpg.tar.Z *.jpg ` //将所有jpg打包成jpg.tar后 生成umcompress压缩的包，命名为jpg.tar.Z

******
- `rar a jpg.rar *.jpg` //rar格式的压缩，需要先下载rar for linux

******
- `zip jpg.zip *.jpg` //zip格式的压缩，需要先下载zip for linux
- `zip -r file.zip code/*` 压缩code目录下所有文件
    - `-q 终端不输出` `-o 输出文件`  `-r 表示递归` `-l 兼容Windows的换行符`
    - -e 加密 

#### 解压
- `tar -xvf file.tar` //解压 tar包
- `tar -xzvf file.tar.gz` //解压tar.gz
- `tar -xjvf file.tar.bz2`   //解压 tar.bz2
- `tar -xZvf file.tar.Z `  //解压tar.Z

***
- `unrar e file.rar` //解压rar

***
- `unzip file.zip `//解压zip
    - -q 终端不输出 -d 指定目录 -l 查看不解压 -O 指定编码


#### 总结
```
    *.tar 用 tar -xvf 解压
    *.gz 用 gzip -d或者gunzip 解压
    *.tar.gz和*.tgz 用 tar -xzf 解压
    *.bz2 用 bzip2 -d或者用bunzip2 解压
    *.tar.bz2用tar -xjf 解压
    *.Z 用 uncompress 解压
    *.tar.Z 用tar -xZf 解压
    *.rar 用 unrar e解压
    *.zip 用 unzip 解压
```

*******************************************************************
## 包管理
### sdkman的使用 
`安装`
- 安装sdkman `curl -s "https://get.sdkman.io" | bash`
- 遇到提示zip 就是需要安装zip `sudo apt install zip` 然后重新执行命令
- 执行脚本：`source "/home/kuang/.sdkman/bin/sdkman-init.sh"` 或者重启终端就可以使用 `sdk` 了
- 查看sdkman 版本 ：`sdk version`

`使用`
> [详情见官网](http://sdkman.io/usage.html)

- 查看所有 `sdk list`
    - 查看某sdk的版本 `sdk list java ` 
- 不指定版本就是安装最新版 `sdk install java` 
- 指定默认版本 `sdk default java 8u131-zulu`
- 开始使用指定版本(for the current shell only) `sdk use scala 2.12.1`
- 查看当前版本 `sdk current java`
- 验证是否成功：`java -version`
- 移除 `sdk uninstall scala 2.11.6`

### 文件结构展示 tree 命令

***************************
## 文件管理器
> 有单窗口，双列，命令，简洁轻量，笨重完整 各种各样的选择

- `nautilus` Gnome默认 挺好用，但是不能自动挂载分区
- `deepin-filemanager` deepin默认，较为方便，但是打开手机会卡根本打不开
- `pcmanfm` 左边侧栏目录树 会同步nautilus的配置`5m`
- `rox-filer` 特别小，单击打开，迅速定位文件，适合找东西用
- `thunar` 解决了nautilus的缺点，内存也很省 `21M`
- `dolphin` 多标签页，目录树方式查看
- `nemo` mint默认的，功能齐全，会同步nautilus的配置，同样有目录树而且是两边都有 `21M`
- `tuxcmd` Tux Commander 双列，小，直接的目录树，学习成本高点 `2M`

## 文本编辑器
### Ghex
- 十六进制文件编辑器

### Kate KWrite(Kate的轻量版)
- [安装markdown预览插件](https://github.com/antonizoon/kate-markdown)
- 码Python也挺方便，也有常用快捷键，自动提示，终端整合，而且是自动切目录

### Geany
- 码c 方便

### sublime 
- 如果出现小bug，就直接删除 ～.config 下的 sublime文件夹注意注册证书拷出来
- 还是挺好的，小巧，但是中文硬伤 用来阅读代码比较合适

### VSCode
- 码笔记，码Python 比较方便，目录树，预览，整合终端

### vi/vim
- `i` 进入编辑
- `:wq` 保存退出，注意是英文的 `:`才可以退出

### gedit
- 安装markdown预览插件 

### Moediter Typora CuteMarkEd 
- 书写单个md文件方便，美观，没有目录树是硬伤

### Vim
> [Vim 学习笔记](./Linux/vim.md)

************
## 浏览器
### FireFox
- 分为正式版， beta， Nightly
- 如果要配置多个火狐在电脑上 终端中 `./firefox -P` 就会进入配置文件的编辑，新建一个就好了，之后就用新建的打开该火狐`./firefox -P name`
- 如果要同时开多个火狐 加上`--no-remote`参数，但是我这个deepin不要诶，但是Ubuntu mint加上也没有用

### Chrome
- 的确快，就是内存占用高

### Vivaldi
- 感觉采用的是chrome内核，做的更漂亮了，而且是内置了很多常用插件，的确很方便，相比于chrome更符合国内使用



