# 【网络管理】

## DNS
- 域名和资源转换的服务
- 解析域名的顺序一般是， 先在本机找，找不到去找上连DNS服务器， 然后根域DNS服务器
     - 这时候就有了几种方式，递归， 迭代， 递归加迭代（为了减轻全球13台根的压力）
     - 假设是访问这个域名 scs.bupt.edu.cn （bupt.三级 机构域名， edu 二级行业域名， cn 一级国家域名）
     - 递归： 本机->上连->根->cn->edu.cn->bupt.deu.cn 然后得到解析结果后，递归返回到上连，上连DNS服务器会进行缓存该结果，再返回本机
     - 迭代：本机->上连，上连->根，根->cn cn->edu.cn, edu.cn->bupt.deu.cn 最终返回了结果 到上连
     - 递归加迭代， 区别在于，先迭代根， 得到下级一级服务器节点后，下级就是递归的入口和出口

- 授权和非授权， 还是上面那个URL， 其他的都不是授权的， 只有离URL最近的DNS才是授权的 即 `bupt.deu.cn`
  `nslookup ` 强大的调试DNS工具
- nslookup - 8.8.8.8 进入循环模式， 方便调试 8.8.8.8 是Google开放的DNS 备选 8.8.4.4
    - 结果解释：Non-authoritative answer: 表示这是从缓存得到的结果，不一定准确
    - Server：上连DNS服务器的IP， Address：`上连DNS的IP#端口` 通常是53
    - canonical name 即CNAME 别名
      `dig` 比nslookup更强大 Domain Information Groper
- 例如：`dig +tcp @8.8.8.8 www.baidu.com` 采用TCP进行DNS通信（默认UDP）
    - ＋short 精简输出
    - +nocmd+nocomment+nostat 输出最核心内容

## IPv4 和 IPv6
- IPv4 只有32bit IPv6 有128bit

`IPv6`
- 零省略 ：如果有一位是 000C 可以直接写C
- 零压缩 ：如果FE04:0:0:0:0:0:0:DA 写成 FE::DA

### 【Tips】
#### 【查看端口占用情况】

`netstat 工具` 更好用的 iproute2往下翻

- `先安装lsof` `lsof -i:端口号` 用于查看某一端口的占用情况，缺省端口号显示全部

- `netstat -tunlp |grep 端口号` 用于查看指定的端口号的进程情况
    - `-t` (tcp) 仅显示tcp相关选项
    - `-u` (udp)仅显示udp相关选项
    - `-n` 拒绝显示别名，能显示数字的全部转化为数字
    - `-l` 仅列出在Listen(监听)的服务状态
    - `-p` 显示建立相关链接的程序名

- [扫描端口的Python](https://github.com/Kuangcp/Notes/blob/master/Python/net/netstatus.py)


- 查询端口占用的pid 三种：
    - `netstat -aonp |grep "^[a-z]\+[ ]\+0[ ]\+0[ ]\+[0-9\.]\+:80[ ]\+"|awk -F" "   {'print $0'}`
    - `netstat -aonp |grep ":80[ ]\+"|awk -F" "   {'print $0'}`
    - `sudo netstat -aonp |grep ":6379[ ]\+"|awk -F" "   {'print $0'}`
    - `sudo kill -9 pid` 杀掉指定pid
    - `ps -aux` 查看当前执行中的程序
- `netstat -antlp | grep 127.0.0.1` 

***************************
## 工具
### 常用命令工具
> 参考书籍 《Linux 大棚命令百篇》

#### ping
- ping URL Linux是默认无休止的
    - -c 次数
    - -q 安静模式 不输出
    - -s 默认64字节， 可以指定大小
    - -t 设定 TTL值，Linux默认是64或255 经过一个路由器就会减一
    - -i 每次ping的时间间隔 默认1s root用户才可以设置 0.2 以下
    - -f 暴力尽可能大量包的传送 至少每秒100个
    - 注意：得到的结果中的 mdev 表示ICMP包的RTT偏离平均值的程度，mdev 越大表示网速不稳定 Linux有，mac下叫stddev win系列没有

### curl
- 不输出，重定向到*黑洞*  ` curl -s -o /dev/null URL`
- 格式化返回的json：`curl xxxx|python -m json.tool `

### iproute2
> 代替 netstat 的强大工具

`替代方案`

|   用途    | net-tool |     iproute2     |
| :-----: | :------: | :--------------: |
| 地址和链路配置 | ifconfig | ip addr, ip link |
|   路由表   |  route   |     ip route     |
|  ARP表   |   arp    |     ip neigh     |
|  VLAN   | vconfig  |     ip link      |
|   隧道    | iptunnel |    ip tunnel     |
|   组播    | ipmaddr  |     ip maddr     |
|   统计    | netstat  |        ss        |

`ss`
- 查看网络连接统计 `ss -s`
- 查看打开的端口 `ss -l`
- 查看打开的端口以及进程pid `ss -pl`
- 查看所有socket连接 `ss -a`

- 隧道术： 网络协议的数据包被封装在另一种网络协议的数据包之中 `这是VPN的技术理论基础`

`net-tools 和 iproute 对应关系`

|      作用      |               net-tools用法                |                iproute2用法                |
| :----------: | :--------------------------------------: | :--------------------------------------: |
|  展示本机所有网络接口  |                 ifconfig                 |              ip link [show]              |
| 开启/停止某个网络接口  |          ifconfig ech0 up/down           |           ip link up/down eth0           |
| 给网络接口设置/删除IP | ipconfig eth0 10.0.0.0.1/24 / ifconfig eth0 0 |   ip addr add/del 10.0.0.1/24 dev eth0   |
| 显示某个网络接口的IP  |              ifconfig eth0               |          ip addr show dev eth0           |
|    显示路由表     |                 route -n                 |              ip route show               |
|   添加删除默认网关   | route add/del default gw 192.168.1.2 eth0 | ip route default via 192.168.1.2 eth0 / ip route replace default via 192.168.1.2 dev eth0 |
|    添加ARP     |  arp -s 192.168.1.100 00:0c:29:c5:5a:ed  | ip neigh add 192.168.1.100 lladdr 00:0c:29:c5:5a:ed dev eth0 |
|    删除ARP     |           arp -d 192.168.1.100           |   ip neigh del 192.168.1.100 dev eth0    |
|   展示套接字状态    |                netstat -l                |                  ss -l                   |

- 默认网关： 如果主机找不到准发规则， 就把数据包发给默认的网关
- 增加/删除一条路由规则 `ip route add/del 192.168.2.0/24 via 192.168.1.254`

### tcpdump
- `tcpdump -i eth0 -nn -X 'port 53' -c 1` root用户才有运行权限
    - -i 指定监听的网络接口（网卡）
    - -nn 将协议号或端口号，显示数字，而不是名称例如：21 而不显示 FTP
    - -X 将协议头和包内容完整的显示出来
    - port 53 过滤，只显示53端口相关的包
    - -c 抓包的数量
    - -e 输出以太网帧头部信息输出 （能看到mac地址）
    - -l 输出变为行缓冲
    - -t 输出不打印时间戳
    - -v 输出更详细信息
    - -F 指定过滤表达式所在的文件
    - -w 将流量保存到文件中
    - -r 读取raw packets 文件

- 列出可以选择的抓包对象 `tcpdump -D`（USB设备也能抓？）

### netcat
- 开始监听端口 ： `nc -l 11044`
    - 建立连接 `nc 127.0.0.1 11044` 任一方退出nc 就终止了连接

- 端口扫描 `nc -z -v -n -w 2 127.0.0.1 20-33`
    - 扫描22-33端口，
    - -z 一旦连接立马断开，不发送接收任何数据
    - -v 输出详细信息
    - -n 直接使用IP地址，不适用域名服务器来查询其域名
    - -w 设置连接超时时间 s
    - -u 使用UDP 默认缺省则是TCP
- 连接开放的端口 `nc -v host port`

- 传输文件 （相同的还有 ftp scp）
    - 服务端开启端口，准备好发送的文件 `nc -v -l 12345 < temp_out.md`
    - 客户端：`nc -v -n host port > temp_in.md`
    - 单次连接，传输完毕自动断开 服务端也可以是接收文件，将`< >`互换即可
    - 没有进度提示。。。。

- 传输文件夹 
    - 服务端 `tar -cvPf - /root/book/ | nc -l 12345`
    - 客户端 `nc -n host port | tar -xvPf -`
    - 这是未压缩的， 压缩再加上参数即可 例如 `gzip -czvPf -xzvPf`

### rsync 
> 同步 个人倾向于称为本地远程， 书籍上是称为 源端 目的端

- 同步到 `rsync file user@host:path` 上， 是将这里的file文件覆盖远程的目录下的file文件，不像git那样
    - 同步当前目录 将file 换成 \`ls\`
    - -t 不加该参数：不会同步文件的修改时间，采用的`quick check策略`。使用后：让修改时间也同步，如果修改时间一致，就不同步（它不考虑文件内容，这是个坑）。
    - -I 就能解决上面的问题，每个文件都进行同步，代价是速度慢
    - -v 输出更多信息 v可以多个，v越多输出的日志信息也越多
    - -r 文件夹递归同步，这种是采用`上面的I策略`的
    - -l 同步软链接文件，默认是忽略该类文件的
    - -L 同步软链接文件及其目标文件
    - -z 压缩数据，提高传输速度
    - -p 缺省该参数时，如果远程没有该文件，权限会和本地的文件一致， 如果远程已经有该文件，权限和本地的不同， 那么命令不作更改。使用参数后，就会让权限尽力保持一致
    - -a 这个命令等价于 -rlptgoD 归档选项，采用递归方式，尽可能保持各方面的一致，但是不能同步硬链接，得加上 `-H`

- 只要文件不一样，就会触发同步，该命令确保远程的是和本地的一致，本地的直接覆盖远程的   
- 只要rsync命令对本地有读权限，对远程有写权限，就能确保目录是一致的
- rsync只能以登录远程的账号来创建文件，它不可能将文件的组信息，用户信息也一致，除非是root用户可以做到

`其他特别参数`

- --delete 如果本地没有该文件 远程就会删掉
    - --delete-exclude 删除远程指定的文件
    - --delete-after 默认是先清理远程文件再同步，使用该选项就相反了先同步再删除需要删除文件
- --exclude 排除掉某些文件不同步 可以使用多次
    - --excule-from 如果要排除的文件很多，可以将文件名放在一个文本文件里，然后使用该选项读取该文件
- --partial 断点续传 可以简写-P
- --progress 显示传输进度信息


### wget

> 特性和优势：支持 HTTP HTTPS FTP协议
>
> - 能够跟踪 HTML 和 XHTML 即可以下载整站，但是注意wget会不停的去下载HTML中的外链，无休无止
> - 遵守 robots.txt 标准的工具
> - 支持慢速网路和不稳定的下载，当下载失败就会不断重试，直到下载成功
> - 支持断点续传

- wget 配置文件 `/etc/wgetrc` `~/.wgetrc` 两个文件配置wget的默认行为

****************************

## 【常用网络服务】
### 邮件服务器 postfix devecot
### FTP 服务器
- `sudo apt-get install vsftpd -y`
- `sudo systemctl start vsftpd.service`
- 创建用户 `sudo useradd -d /home/uftp -s /bin/bash uftp`
- 设置密码 `sudo passwd uftp`
- 删除掉 pam.d 中 vsftpd，因为该配置文件会导致使用用户名登录 ftp 失败：`sudo rm /etc/pam.d/vsftpd`
- 限制用户 uftp 只能通过 FTP 访问服务器，而不能直接登录服务器 `sudo usermod -s /sbin/nologin` uftp
- 修改配置文件 `sudo chmod a+w /etc/vsftpd.conf`

`/etc/vsftpd.conf `
```
    # 限制用户对主目录以外目录访问
    chroot_local_user=YES
    # 指定一个 userlist 存放允许访问 ftp 的用户列表
    userlist_deny=NO
    userlist_enable=YES
    # 记录允许访问 ftp 用户列表
    userlist_file=/etc/vsftpd.user_list
    # 不配置可能导致莫名的530问题
    seccomp_sandbox=NO
    # 允许文件上传
    write_enable=YES
    # 使用utf8编码
    utf8_filesystem=YES
```
- 新建文件 sudo touch /etc/vsftpd.user_list
- 修改权限 `sudo chmod a+w /etc/vsftpd.user_list`
- 添加用户名 `uftp`
- 设置用户目录只读 `sudo chmod a-w /home/common`
- 新建公共目录 设置权限 `mkdir /home/common/public && sudo chmod 777 -R /home/common/public`
- 重启服务 `sudo systemctl restart vsftpd.service`

```
     ~$ sudo mkdir /home/common
     ~$ sudo touch /home/common/welcome.txt
     ~$ sudo useradd -d /home/common -s /bin/bash common
     ~$ sudo passwd common
     ~$ sudo rm /etc/pam.d/vsftpd
     ~$ sudo usermod -s /sbin/nologin common
     ~$ sudo chmod a+w /etc/vsftpd.conf
     ~$ sudo vim /etc/vsftpd.conf
     ~$ sudo vim /etc/vsftpd.user_list
     ~$ sudo chmod a-w /home/common
     ~$ sudo mkdir /home/common/public && sudo chmod 777 -R /home/common/public
     ~$ sudo systemctl restart vsftpd.service
```

******************************
#### 【SSH 的使用】
##### 1.安装软件
`客户端安装软件`
- `sudo spt-get install openssh-client`
- 生成密钥对 `ssh-keygen` 可以设置密码，为了方便也可以全部采用默认

`服务端安装软件`
- 安装：`sudo apt-get install openssh-server`
- 启动：`sudo /etc/init.d/ssh start` 或者 `service ssh start` 
- 更改配置文件修改默认端口 `/etc/ssh/sshd_config`
- 查看对否启动sshd`ps -e |grep ssh`
- 关闭服务 `/etc/init.d/ssh stop`

##### 2.复制粘贴建立连接关系的方法
`客户端`
- 进入.ssh文件夹下 `gedit id_rsa.pub` 然后复制该公钥内容
    - 或者 `cat ~/.ssh/id_rsa.pub | xclip -sel clip` 将文件复制到剪贴板
- 在各种平台服务上添加这个公钥即可免密登录
  `服务器端`
- 进入.ssh文件夹下 `sudo vim authorized_keys` 粘贴客户端公钥内容
- 更改文件权限 `sudo chmod 600 authorized_keys` 确保 其 group和other位没有 w 权限

##### 2.【更简单的做法 推荐！！！】
- 两方安装好软件 客户端生成好了秘钥对之后
- 直接运行`ssh-copy-id "username@host"` 输密码就可以了
    - 指定端口 `ssh-copy-id ”-p port username@host“`
- 客户端登录 `ssh -p22 username@ip`
*******************************************

#### 【vpn】
##### shadowsocks
`服务端`
- 安装服务端`sudo pip install shadowsocks`
- 启动服务`sudo ssserver -p 443 -k sd -m aes-256-cfb`     
- 后台运行`sudo ssserver -p 443 -k sd -m aes-256-cfb --user nobodu -d start`
- 停止 `sudo ssserver -d stop`
- 日志 `sudo less /var/log/shadowsocks.log`

`客户端`
- `sudo vim /etc/ss.json` 
```
    { 
	    "server":"127.0.0.1",
	    "server_port":443,
	    "localport":1080,
	    "password":"password",
	    "timeout":600,
	    "method":"aes-256-cfb"
    }
```
- `sslocal -c /etc/ss/json`
- 设置代理是1080端口即可


