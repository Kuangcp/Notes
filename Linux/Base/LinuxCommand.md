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

`目录 end` |_2018-06-01_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
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
> 获取日期和时间

- 获取前一天日期 `date --date='1 day ago' -R`

## grep
> egrep [相关网页](http://man.linuxde.net/grep)

- 正则 `grep -E "[1-9]+"` 注意` [] 和 ()`的区别 `[]` 是里面单个字符 `()`是里面的全部

## 定时任务crontab
> [参考博客 shell定时任务crontab](http://www.cnblogs.com/taosim/articles/2007056.html)
`minute hour day-of-month month-of-year day-of-week commands  `

### 定时执行脚本 
> 脚本中的操作最好都使用绝对路径

# 实用的工具
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