`目录 start`
 
- [网络](#网络)
    - [安全](#安全)
        - [SYNFlood攻击](#synflood攻击)

`目录 end` *目录创建于2018-01-14*
****************************************
# 网络

## 安全
### SYNFlood攻击
> 洪水攻击 [参考博客](http://xfocus.net/articles/200106/208.html) SYN Flood是当前最流行的DoS（拒绝服务攻击）与DDoS（分布式拒绝服务攻击）的方式之一，这是一种利用TCP协议缺陷，发送大量伪造的TCP连接请求，从而使得被攻击方资源耗尽（CPU满负荷或内存不足）的攻击方式。<br/>
> [参考博客](http://www.cnblogs.com/popduke/p/5823801.html)

- Linux:
    - 修改文件 `sudo vim /etc/sysctl.conf `
    - 将注释取消 修改值: `net.ipv4.tcp_syncookies = 0`
    - 就能提高并发总量,但是并发量还是不能提高
```conf
    net.ipv4.tcp_syncookies = 0  
    #此参数是为了防止洪水攻击的，但对于大并发系统，要禁用此设置
    net.ipv4.tcp_max_syn_backlog=1024
    #参数决定了SYN_RECV状态队列的数量，一般默认值为512或者1024，即超过这个数量，系统将不再接受新的TCP连接请求，一定程度上可以防止系统资源耗尽。可根据情况增加该值以接受更多的连接请求。
    net.ipv4.tcp_tw_recycle=0
    #参数决定是否加速TIME_WAIT的sockets的回收，默认为0。
    net.ipv4.tcp_tw_reuse=0
    #参数决定是否可将TIME_WAIT状态的sockets用于新的TCP连接，默认为0。
    net.ipv4.tcp_max_tw_buckets
    #参数决定TIME_WAIT状态的sockets总数量，可根据连接数和系统资源需要进行设置。 
```
