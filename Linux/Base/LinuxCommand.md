`目录 start`
 
- [系统常用基础命令](#系统常用基础命令)
    - [time](#time)
    - [grep](#grep)
    - [定时任务crontab](#定时任务crontab)
- [实用的工具](#实用的工具)

`目录 end` |_2018-04-17_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 系统常用基础命令

## time
- bash内置简易time `time` 和 /usr/bin/time `\time`
    - `\time -v ls -al`
## grep
> egrep [相关网页](http://man.linuxde.net/grep)

- 正则 `grep -E "[1-9]+"` 注意` [] 和 ()`的区别 `[]` 是里面单个字符 `()`是里面的全部

## 定时任务crontab
> [参考博客](http://www.cnblogs.com/taosim/articles/2007056.html)


# 实用的工具
- htop _终端里的任务管理器_
- strace -p PID _查看系统调用_
- ps | clorm 20 30 `colrm` _删除输出的20 到30 列_
- w | uptime _查看启动情况_
- wc -l file _统计文件行数_
- last _查看Linux登录信息_
    - last -n 5 最近五次登录

- cmatrix _装13,字符雨_
 
- xsel 
    - `cat a.md | xsel -b` _将文件所有内容复制到剪贴板_
- logkeys 记录键盘输入 [Github](https://github.com/kernc/logkeys)

- expect [用于自动输入密码](http://www.cnblogs.com/iloveyoucc/archive/2012/05/11/2496433.html)