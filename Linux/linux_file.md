## 【文件管理】
### 基本命令 

`rename命令的使用(基于perl)`
- `rename "s/.html/.php/" * ` //把.html 后缀的改成 .php后缀
- `rename "s/$/.txt/" *  `   //把所有的文件名都以txt结尾
- `rename "s/.txt//" *  `   //把所有以.txt结尾的文件名的.txt删掉
- `rename "s/AA/aa/" * `  //把文件名中的AA替换成aa
- `rename "s/ - 副本/_bak/" *` 将文件`-副本`结尾改成`_bak`结尾

`cd 命令的灵活使用`
- `cd - ` 跳转到上一个目录
- `cd !$` 把上个命令的参数作为cd参数使用。
- `cd //` 系统根目录 


`time`
- bash内置简易time `time` 和 /usr/bin/time `\time`
    - `\time -v ls -al`


`ls`
- i详情 a全部 l 列
    - 输出类型：d 目录 l 软链接 b 块设备 c 字符设备 s socket p 管道 - 普通文件
    - 输出权限信息：r 读权限 w 写权限 x 执行权限
    - rwx有三个，是因为 `拥有者，所属用户组 其他用户` 代表的rwx权限
    ![权限输出图](https://dn-anything-about-doc.qbox.me/linux_base/3-10.png/logoblackfont)
![权限计算图](https://dn-anything-about-doc.qbox.me/linux_base/3-14.png/logoblackfont)
    - `chmod 700 文件` 就是只设置拥有者具有读写权限
    - 加减权限操作 `chmod go-rw 文件` `g group` `o others` `u user` `+- 增减权限`
- `ls -ASsh` 显示所有文件大小， 便于阅读的形式输出
- `ls -dl 目录` 查看一个目录的完整属性


`chown`
- `chown [-R] 账号名称 文件或目录`
- `chown [-R] 账号名称:用户组名称 文件或目录`


`chgrp`
- 更改文件所属用户组 `chgrp group file`
    - -R 递归子目录
    

`file`
- file a.txt 查看文件类型
    - -i 输出文件的MIME类型
    - -F "#" 修改输出分隔符


`ln`
- `ln -s 文件或目录 link` 生成软链接（快捷方式）

`find`
- `find . -name "*.txt"` 查找当前目录的txt后缀的文件
- `sudo find / -name a.java` 全盘查找
- `find -type f -name README.md` 默认当前目录查找
    - d 文件夹 f 普通文件 l 符号链接文件 b 块设备 c 字符设备 p 管道文件 s 套接字

-` rm` 删除` -f `空目录` -rf `有文件也强制删除
- 清空文件内容 `true > a.txt ` 
- 安装上传下载文件的工具 `sudo apt install lrzsz`
- `cat ~/.ssh/id_rsa.pub | xclip -sel clip` 将文件复制到剪贴板

### 【磁盘管理】

- 创建一个空文件 `dd if=/dev/zero of=virtual.img bs=1M count=256` 查看大小 `du -h virtual.img`
- 将虚拟磁盘镜像格式化为指定的文件系统 `sudo mkfs.ext4 virtual.img`
- 查看支持的文件系统 `ls -l /lib/modules/$(uname -r)/kernel/fs`
- 挂载这个镜像到`/mnt`：`mount -o loop -t ext4 virtual.img /mnt`
- 只读方式挂载 `mount -o loop --ro virtual.img /mnt`
- 卸载挂载的磁盘 `sudo umount /mnt`

`dd`
- 

`mount`
- `mount [options] [source] [directory] `
- `mount [-o [操作选项]] [-t 文件系统类型] [-w|--rw|--ro] [文件系统源] [挂载点]`
- 查看已挂载信息 `mount`

`fdisk`
- 查看磁盘分区表信息 ：`sudo fdisk -l `
- 
##### 设置交换分区
- `free -h` 查看内存
- `dd if=/dev/zero of=/swapfile bs=1024k count=4096` 创建一个4g 交换文件
- `mkswap /swapfile` 格式化成交换文件的格式
- ` swapon /swapfile` 启用该文件作为交换分区的文件
- `/swapfile swap swap defaults 0 0` 写入`/etc/fstab`文件中，让交换分区的设置开机自启
- `sudo sysctl vm.swappiness=15` 临时修改重启注销失效， 查看：`cat /proc/sys/vm/swappiness`
- 永久修改：`/etc/sysctl.conf ` 文件中设置开始使用交换分区的触发值： `vm.swappiness=10`
    - 表示物理内存剩余`10%` 才会开始使用交换分区
- `建议，笔记本的硬盘低于 7200 转的不要设置太高的交换分区使用，大大影响性能，因为交换分区就是在硬盘上，频繁的交换数据`

#### 善用 ～/.bashrc 文件
`Alias`
```
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi
```
- 在`~/.bashrc`添加这段，然后在 `.bash_aliases` 文件中设置别名
    - 例如 ： `alias Kgit.notes='cd ~/Documents/Notes/Code_Notes/'` 
    - 更改文件后，想当前终端就生效就 `source ~/.bashrc` 不执行命令就重启终端即可

- 如我的文件 [.bash_aliases]()
*************
`自定义桌面快捷方式文件`
```
	[Desktop Entry] #每个desktop文件都以这个标签开始，说明这是一个Desktop Entry文件
	Version = 1.0 #标明Desktop Entry的版本（可选）
	Name = Firefox #程序名称（必须），这里以创建一个Firefox的快捷方式为例
	GenericName = Web Browser #程序通用名称（可选）
	Comment = A Web Browser #程序描述（可选）
	Exec = firefox %u #程序的启动命令（必选），可以带参数运行,当下面的Type为Application，此项有效
	Icon = firefox #设置快捷方式的图标（可选）
	Terminal = false #是否在终端中运行（可选），当Type为Application，此项有效
	Type = Application #desktop的类型（必选），常见值有“Application”和“Link”
	Categories = GNOME;Application;Network; #注明在菜单栏中显示的类别（可选）
```
- [示例文件](https://github.com/Kuangcp/Notes/tree/master/ConfigFiles/Linux/VSCode.desktop)
- 如要将快捷方式放在启动菜单内 将desktop文件放在 `/usr/share/applications/` 目录下即可

************
#### 【查看文件大小】du 和 df 命令 
`df -h ` 查看挂载文件系统信息

`du`
- `du -sh 目录` 查看磁盘占用总大小 h 自动搭配单位（human read ）
- `du --max-depth` 一级子目录使用情况
- du -sm * | sort -n //统计当前目录大小 并安大小 排序
- du -sk * | sort -n
- du -sk * | grep guojf //看一个人的大小
- du -m | cut -d "/" -f 2 //看第二个/ 字符前的文字
查看此文件夹有多少文件 /*/*/* 有多少文件
du xmldb/
du xmldb/*/*/* |wc -l
40752
    
`wc [-lmw] ` 参数说明： -l :多少行-m:多少字符 -w:多少字
- cat mul.sh | wc -l
- wc -l mul.sh
    
`ls`    
- `ls -hl ` 查看当前目录的各个文件或目录大小 h自动搭配单位

***********
#### 【文件操作】
- cp   `cp -ri 目录或正则 目录` 目录所有文件复制过去
    - a 该选项通常在拷贝目录时使用。它保留链接、文件属性，并递归地拷贝目录，其作用等于dpR选项的组合。
    - d 拷贝时保留链接。
    - f 删除已经存在的目标文件而不提示。
    - i 和f选项相反，在覆盖目标文件之前将给出提示要求用户确认。回答y时目标文件将被覆盖，是交互式拷贝。
    - p 此时cp除复制源文件的内容外，还将把其修改时间和访问权限也复制到新文件中。
    - r 若给出的源文件是一目录文件，此时cp将递归复制该目录下所有的子目录和文件。此时目标文件必须为一个目录名。
    - l 不作拷贝，只是链接文件。 
    

**********    
- mv `mv 目录或正则 目录` 移动
- I 交互方式操作。如果mv操作将导致对已存在的目标文件的覆盖，此时系统询问是否重写，要求用户回答y或n，这样可以避免误覆盖文件。
- f 禁止交互操作。在mv操作要覆盖某已有的目标文件时不给任何指示，指定此选项后，i选项将不再起作用。 
- rm  `rm -rf 目录` 不提示性删除
- f 忽略不存在的文件，从不给出提示。
- r 指示rm将参数中列出的全部目录和子目录均递归地删除。
- i 进行交互式删除。 



