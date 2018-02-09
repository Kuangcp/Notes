`目录 start`
 
- [学习Shell](#学习shell)
    - [shell类别](#shell类别)
    - [Tips](#tips)
    - [执行](#执行)
    - [输入输出](#输入输出)
        - [输入](#输入)
        - [输出](#输出)
            - [彩色输出](#彩色输出)
    - [变量](#变量)
        - [变量作用域](#变量作用域)
    - [数据类型](#数据类型)
        - [整型数值](#整型数值)
        - [字符串](#字符串)
        - [数组](#数组)
    - [结构](#结构)
        - [参数读取](#参数读取)
        - [判断](#判断)
            - [if](#if)
            - [case](#case)
        - [循环](#循环)
    - [函数](#函数)
    - [工具](#工具)
        - [jq](#jq)
        - [shyaml](#shyaml)

`目录 end` *目录创建于2018-02-09* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# 学习Shell
> 首先语法不像别的语言可读性好，比如Python，然后方言众多，学习比Python2，3还恶心  
> [Shell 编程之语法基础](https://linuxtoy.org/archives/shell-programming-basic.html) | [Shell 编程之执行过程](https://linuxtoy.org/archives/shell-programming-execute.html)

## shell类别
- sh
  - 大多Linux都支持的shell类别
- bash
- zsh
  - 十分现代化 [配置oh my zsh](https://segmentfault.com/a/1190000004695131)
- dash
  - 它主要是为了执行脚本而出现，而不是交互，它速度更快，但功能相比bash要少很多，语法严格遵守POSIX标准
  - 速度确实要快,输入上的交互确实交互不了
- fish

- [linux shell dash&bash](http://blog.csdn.net/zengqiang1/article/details/61916697)

## Tips

- 获取当前shell脚本的绝对路径 `basepath=$(cd `dirname $0`; pwd)`
- 正则：`expr match "$i" ".*变更"`
- 命令嵌套 只要在 命令中用 两个反引号 `` 将子命令包住即可

*******************
## 执行
- [source命令](http://blog.csdn.net/xiaolang85/article/details/7861441) | [点和source命令](http://www.cnblogs.com/my_life/articles/4323528.html)

- 文件头部 `#!/bin/sh`表示要使用sh解释器来执行, 可以替换成bash dash
  -  只要该文件具有执行权限就可以直接运行了 `./a.sh` 或者绝对路径

**********************
## 输入输出

### 输入
### 输出

#### 彩色输出
> [参考博客,比较详细](http://blog.csdn.net/magiclyj/article/details/72637666)

- 红色 `\033[0;31m`
- 绿色 `\033[0;32m`
- 黄色 `\033[0;33m`
- 靛色 `\033[0;34m`
- 紫色 `\033[0;35m`
- 蓝色 `\033[0;36m`
- 白色 `\033[0;37m`
- 默认 `\033[0m`


## 变量
### 变量作用域
> 比Python的作用域更加恶心

## 数据类型
### 整型数值

- 自增：
  - ((a++))
  - ``` i=`expr $i + 1`;```
  - let i+=1;
  - i=$[$i+1];
  - i=$(( $i + 1 ))

`简易循环`
```sh
  for j in $(seq 1 5)
  do
    echo $j
  done
```
```sh
    i=1
    while [ "$i" -le 10 ];do
        echo $i
        i=$(($i+1))
    done
```
************
### 字符串
- [字符串截取](https://www.2cto.com/os/201305/208219.html) | [Blog:变量字符串截取](http://www.jb51.net/article/56563.htm) | [Shell正则](http://man.linuxde.net/docs/shell_regex.html)

```sh
  vars=${1%%#*} # 截取#左边
  vars=${vars#*cd} # 截取cd右边
  vars=${vars%\'*} # 截取 右边引号 之左
```

`获取命令的输出`
- 使用  保存结果的变量名=`需要执行的linux命令` 这种方式来获取命令的输出时，注意的情况总结如下：
- 1）保证反单引号内的命令执行时成功的，也就是所命令执行后$?的输出必须是0，否则获取不到命令的输出
- 2）即便是命令的返回值是0，也需要保证结果是通过标准输出来输出的，而不是标准错误输出，否则需要重定向
- 因此我们推荐使用  保存结果的变量名=`需要执行的linux命令 2>&1 `的方式来获取命令的执行结果。

- 输出变量时: `$var`会丢失换行和空格 `"$var"`不会

`字符串的包含问题`
```sh
  isGithub=`expr match "$line" ".*"$2`
  # 简单的就是使用grep
  isGithub=`echo $line | grep "github" `
  
  # return 0 is $1 is substring of $2, otherwise 1
  strIsSubstring(){
      local x=1
      case "$2" in
          *$1*) x=0;;
      esac
      echo $x
  }
```

`求长`
- `${#var}`

************************
### 数组


*********************
## 结构
### 参数读取
- [参考博客](http://www.cnblogs.com/FrankTan/archive/2010/03/01/1634516.html)`命令行选项 参数处理`
- 脚本退出运行 `exit 0`
- 得到脚本所在的目录 basepath=$(cd \`dirname $0\`; pwd) 或者 path=\`pwd\`


### 判断
#### if
- [参考博客](http://www.cnblogs.com/276815076/archive/2011/10/30/2229286.html)

#### case

```sh
  case $content in 
    -h|h)
      echo "help"
    ;;
    *)
      echo "前面全部不匹配才会执行"
    ;;
  esac
```
### 循环
- [参考博客](http://www.cnblogs.com/fhefh/archive/2011/04/15/2017233.html)

*****************
## 函数
> Shell的函数只能返回整型数据类型

```sh
  simple(){
    echo "simple"
  }
```


*********************************
## 工具
> [更多工具](/Skills/Soft_Manual.md#终端工具)

### jq
> [官方网址](https://stedolan.github.io/jq/#) `sudo apt install jq 即可`

- 看了半小时, 对于复杂的JSON格式,根本没有办法, 不像Python一样把那些{} [] 当成对象,而是简单的数据结构,随意嵌套
  - 反观之,真是棒棒的一个脚本了!!!

### shyaml
> [参考](https://linuxtoy.org/archives/shyaml.html)