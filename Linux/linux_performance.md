# Linux 性能分析和管理

## 常用工具
### 运行状况信息
- `uptime ` 执行结果
    - 系统当前时间 主机已运行时间 用户连接数 1,5,15,分钟的系统平均负载
- `cat /proc/loadavg ` 执行结果
    - 1,5,15分钟的平均负载 当前运行的进程/总进程 最近一个启动的进程的id
- 表示单核:平均负载0.7以下是安全的,大于就需要优化了,多核的情况就是 0.7*N(核心数)

### 内存情况
`free`
- 直接运行得到的就是内存情况,默认是kb为单位,可以指定 -b -m -g (后两种不推荐,因为向下取整的特性,出来的数据有点诡异,)
    - -h 人类可读形式 推荐,能快速看到大略,精准的话还是用 -b
- 运行结果解析:
    - 注意: 如果是新版的free, shared 那一栏总是为0, 因为shared本就是说明进程共享内存容量,
        - free认为不能显示数有效信息, 就抛弃了这个指标,总是显示为0
    - buffers,cached:
        - buffers 是为了写时,解决内存和硬盘巨大速度差存在的缓冲区(块设备IO相关的缓存页)
        - cache 是为了读时,为了尽量减少内存从硬盘读数据的次数,缓冲区(普通文件相关的缓存页)
        - cached 就是cache内存区域已经使用量
    - 空闲内存, 已使用, buffers, cached 共同构成了整个内存容量
    - used 含cache, buffer的内存使用量, free空闲内存, available 可用内存
    
- 设置交换分区:可以单独建立一个分区,也可以使用交换文件,
    - 交换文件的设置在[Linux_file](/Linux/linux_file.md)中,
    - 分区的设置就不多讲了, 主要是fdisk

### 性能监测
#### vmstat
- 最初是设计为查看虚拟内存的,现在用于性能监测
- `vmstat 1 4` 输出信息,间隔1s 共4次 特别注意第一行数据是指开机以来的平均值,后面的才是当前值
    - 输出内容:
    - procs 区域:
        - r 进程运行队列中的进程个数
        - b 处于不可中断的睡眠状态的进程个数
    - memory 区域:
        - swpd 虚拟内存使用量
        - free 空闲内存,不含buffer cache
        - buff 
        - cache
    - swap 区域:
        - si 每秒从交换分区写入内存的量
        - so 每秒从内存写入交换分区的量
    - io 区域:
        - bi 每秒从块设备读取的块数量
        - bo 每秒向块设备写入的块数量
    - system 区域:
        - in 每秒中断数(含时钟中断)
        - cs 每秒上下文切换次数
    - cpu 区域:
        - us 用户进程 cpu消耗时间百分比
        - sy 内核进程 cpu消耗百分比
        - id cpu空闲状态时间百分比
        - wa IO等待消耗时间百分比
        - st 虚拟管理程序占用时间百分比

- 更多参数用法:
    - `-a` 输出中,原来的 buff 和cache 被 inact 和 active 取代了
        - inact (inactive memory) 非活跃内存, 一段时间没有使用的内存(优先置换到交换分区的内存)
        - active 活跃内存, 正在被使用的内存
    - `-f` 查看启动以来创建的fork(或者称为task)总数
    - `-m` 展示内存 slabinfo
    - `-s` 展示内存指标以及系统事件
    - `-d` 展示各磁盘的统计信息
    - `-p /dev/sda1` 展示某一特定分区的 IO信息

- ![p135](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p135.jpg)
- ![p136](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p136.jpg)

#### mpstat
> 对多处理器的统计, 和iostat同属于systat软件下,可能需要手动安装

- `mpstat -P ALL 1 1` 查询所有CPU信息,后两个参数是和vmstat一样的,如果只看0号CPU 就ALL改成0即可
    - 运行结果:
        - %user 用户进程 %
        - %nice 进程降级时CPU %
        - %sys 内核进程 %
        - %iowait 等待IO的CPU时间 %
        - %irq 处理系统中断 %
        - %soft 软件中断 %
        - %steal 虚机管理程序占用的 CPU %
        - %guest 运行虚拟处理器占用的CPU %
        - %idle CPU空闲时间
- 参数        
    - `-I ` 值可选, SUM CPU ALL 
    - 分别表示 CPU总的中断数, 展示每一个CPU的中断数 SUM和CPU数据综合展示

#### top
> 感觉 htop 就是基于这个开发的, 使用htop更简单些, 这个强大但是好多参数

#### iostat
- 执行`iostat`输出信息:
    - 第一部分, 系统信息
    - 第二部分, CPU信息
    - 第三部分, 磁盘信息
- 参数:
    - -d 只显示磁盘信息,不显示CPU信息
    - -k 统计使用KB为单位
    - 最后两个数值参数和vmstat一样 例如`iostat -d -k 1 3`
    - 输出结果:
        - tps: 每秒进程的IO读写请求总数
        - KB_read/s, KB_wrtn/s 每秒读取,写入的字节数单位KB
        - KB_read, KB_wrtn 写入读取的总数
    - 同样的, 第一行数据是系统启动到现在的统计结果 `-y` 可以去除第一行
    - -x 显示更多信息

- ![p162](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p162.jpg)   
- ![p163](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p163.jpg)
- ![p164](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p164.jpg)


### 进程管理
#### pidof
- 查询ssh服务启动的进程的pid `pidof sshd`
- 找出shell脚本执行的pid, `pidof -x 脚本文件名`
- -s 只显示一个pid, 有的软件会有多个进程,就有多个pid
- 忽略指定的pid `-o pid`
- ![p167](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p167.jpg)

#### sar
- 默认持续执行除非Ctrl C退出,指定参数后就和vmstat一样 `sar 2 3` 
- 输出到指定文件中: `-o filename` 注意这个不是文本结构,是特殊的结构化方式, 查看需要 `sar -f filename`
- 多核的支持:`sar -P ALL 1 1 ` 与mpstat 大致相同
- 指定结束时间 `-e 18:00:00` 一般和 -o -f一起用
    - 搭配 -o 指定存储结束的时间点
    - 搭配 -f 指定从文件读取的数据的结束时间点

- 查看网络信息 -n 参数有: DEV EDEV SOCK FULL

- ![p172](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p172.jpg)
- ![p173](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p173.jpg)
- ![p174](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p174.jpg)
- ![p175](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p175.jpg)
- ![p176](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Book/Linux_DaPeng_mingling100/p176.jpg)

#### lsof
> 这个命令使用时最好是 sudo或者root用户, 不然就会警告说显示信息不完全

- 查看打开标准错误输出的进程 `lsof -d 3`
- 查看打开某文件的进程 `lsof filename `
- 通过进程查询打开的文件 `ps aux | grep mysqld` `sudo lsof -p pid` 就能看到mysql服务打开的文件了
- 查看某一用户打开的文件 `sudo lsof -u username`
- 端口占用查询 ` `

#### fuser
#### kill
- 杀掉指定id（需要sudo） `kill -9 pid`
- 杀掉指定名字 不需要sudo `killall -9 name`

