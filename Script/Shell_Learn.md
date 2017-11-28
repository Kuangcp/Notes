# 学习Linux Shell

## shell 类别
sh
bash
zsh
dash

### tmux 
- `tmux new -s myth`  新建一个窗口 
- `Ctrl B`  再 `C`  新建一个窗口 `Ctrl B` `数字键`切换指定窗口
- 连接远程服务器，运行一个阻塞命令
    - `Ctrl B` `D` 可以合上电脑（休眠）
    - `tmux ls` 显示所有 `tmux a -t myth` 连上指定名字的就继续了

- 获取当前shell绝对路径 `basepath=$(cd `dirname $0`; pwd)`
## 数据类型
### 字符串
- [字符串截取](https://www.2cto.com/os/201305/208219.html)


`获取命令的输出`
- 使用  保存结果的变量名=`需要执行的linux命令` 这种方式来获取命令的输出时，注意的情况总结如下：
- 1）保证反单引号内的命令执行时成功的，也就是所命令执行后$?的输出必须是0，否则获取不到命令的输出
- 2）即便是命令的返回值是0，也需要保证结果是通过标准输出来输出的，而不是标准错误输出，否则需要重定向
- 因此我们推荐使用  保存结果的变量名=`需要执行的linux命令 2>&1 `的方式来获取命令的执行结果。


- $var 会丢失换行 "$var"才不会

## 结构
### 参数读取
- [参考博客](http://www.cnblogs.com/FrankTan/archive/2010/03/01/1634516.html)`命令行选项 参数处理`
- 脚本退出运行 `exit 0`
- 得到脚本所在的目录 `basepath=$(cd `dirname $0`; pwd)`

### 判断
#### if
- [参考博客](http://www.cnblogs.com/276815076/archive/2011/10/30/2229286.html)

### 循环
- [参考博客](http://www.cnblogs.com/fhefh/archive/2011/04/15/2017233.html)
