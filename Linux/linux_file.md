## 【文件管理】
### 基本命令
-` rm` 删除` -f `空目录` -rf `有文件也强制删除
- `true > a.txt ` 清空文件内容
- rzsz:
    - 上传下载文件的工具 sudo apt install lrzsz
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
************
#### 【查看文件大小】du 和 df 命令 
- `df -h ` 查看挂载文件系统信息
- `du -sh` 文件夹 查看总大小
- `du --max-depth` 一级子目录使用情况
    du -sm * | sort -n //统计当前目录大小 并安大小 排序
    du -sk * | sort -n
    du -sk * | grep guojf //看一个人的大小
    du -m | cut -d "/" -f 2 //看第二个/ 字符前的文字
    查看此文件夹有多少文件 /*/*/* 有多少文件
    du xmldb/
    du xmldb/*/*/* |wc -l
    40752
    
-  `wc [-lmw] ` 参数说明： -l :多少行-m:多少字符 -w:多少字
    - cat mul.sh | wc -l
    - wc -l mul.sh
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
### 文本编辑器
#### sublime 
- 如果出现小bug，就直接删除 ～.config 下的 sublime文件夹注意注册证书拷出来
- 
#### vi/vim
- `i` 进入编辑
- `:wq` 保存退出，注意是英文的 `:`才可以退出

#### gedit
- 安装markdown预览插件 

************************

#### `cat ~/.ssh/id_rsa.pub | xclip -sel clip` 将文件复制到剪贴板
- `桌面快捷方式图标文件`
```
    [Desktop Entry]
    Exec=/home/mythos/Application/Story/Story-writer
    Icon=/home/mythos/Application/Story/Story-writer.png
    Type=Application
    Terminal=false
    Name=Story
    GenericName=Story
    Categories=Story
    Name[en_US]=Story
    GenericName[en_US.UTF-8]=Story
    Name[zh_CN]=Story
``` 
