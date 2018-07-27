`目录 start`
 
- [系统常用基础命令](#系统常用基础命令)
    - [输入输出](#输入输出)
        - [重定向](#重定向)
    - [time](#time)
    - [date](#date)
    - [grep](#grep)
    - [定时任务crontab](#定时任务crontab)
        - [定时执行脚本](#定时执行脚本)
- [实用的工具](#实用的工具)
    - [终端工具](#终端工具)
    - [图形化工具](#图形化工具)
        - [剪贴板管理](#剪贴板管理)

`目录 end` |_2018-07-27_| [码云](https://gitee.com/gin9) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 系统常用基础命令

## 输入输出

### 重定向
- 输出重定向  `> a.log 2>&1`表示为将2也输出到标准输出
    - 2是错误输出
    - 1是标准输出

## time
> 可以用于计算命令运行消耗的时间

- bash内置简易time `time` 和 /usr/bin/time `\time`
    - `\time -v ls -al`
## date
> 获取日期和时间 `date +%Y_%m_%d_%H:%M:%S`

- 获取前一天日期 `date --date='1 day ago' -R`
- 将秒时间戳转换为日期 `date --date='@1524738626'`

## grep
> egrep [相关网页](http://man.linuxde.net/grep)

- 正则 `grep -E "[1-9]+"` 注意` [] 和 ()`的区别 `[]` 是里面单个字符 `()`是里面的全部

## 定时任务crontab
> [参考博客 shell定时任务crontab](http://www.cnblogs.com/taosim/articles/2007056.html)
`minute hour day-of-month month-of-year day-of-week commands  `

### 定时执行脚本 
> 脚本中的操作最好都使用绝对路径

*******************************************

# 实用的工具
## 终端工具
- htop _终端里的任务管理器_
- strace -p PID _查看系统调用_
- ps | clorm 20 30 `colrm` _删除输出的20 到30 列_
- w | uptime _查看启动情况_
- wc -l file _统计文件行数_
- last _查看Linux登录信息_
    - last -n 5 最近五次登录

- cmatrix _装13,字符雨_
- stty -a 查看键映射
- xsel 
    - `cat a.md | xsel -b` _将文件所有内容复制到剪贴板_
- logkeys 记录键盘输入 [Github](https://github.com/kernc/logkeys)

- expect [用于自动输入密码](http://www.cnblogs.com/iloveyoucc/archive/2012/05/11/2496433.html)

- autojump  `方便跳转目录`  *shrc 中要有 : `. /usr/share/autojump/autojump.sh`  

- [WTF](https://wtfutil.com/posts/overview/) | [Github Repo](https://github.com/senorprogrammer/wtf)
    - 丰富的功能, 一个方便的终端控制面板

- md5sum 报文摘要算法 Message-Digest Algorithm 5 的实现 
    - `md5sum file` 计算出md5值
    - `md5sum -c file.md5` file 和 file.md5 在同一目录下, 执行这个命令就是检查md5是否匹配, 确保文件的完整性和正确性

## 图形化工具
### 剪贴板管理
> [参考博客: 面向 Linux 的 10 款最佳剪贴板管理器](https://linux.cn/article-7329-1.html)

- CopyQ 比较好用

> [参考博客: 这9个Linux命令非常危险 请大家慎用](https://www.jb51.net/LINUXjishu/498660.html)

> [参考博客: 关于 Linux 你可能不是非常了解的七件事](https://linux.cn/article-8934-1.html)