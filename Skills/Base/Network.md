`目录 start`
 
- [网络](#网络)
    - [基础](#基础)
        - [ISO七层模型和TCP/IP五层模型](#iso七层模型和tcpip五层模型)
        - [TCP和UDP](#tcp和udp)
    - [HTTP](#http)
        - [HTTP的错误码](#http的错误码)
        - [HTTP的缓存](#http的缓存)
        - [Session和Cookie](#session和cookie)
        - [HTTP1.1 和 HTTP2](#http11-和-http2)
    - [Websocket](#websocket)
    - [安全](#安全)
        - [SYNFlood攻击](#synflood攻击)
        - [CSRF](#csrf)

`目录 end` |_2018-03-26_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 网络

## 基础
> [码农翻身:小白科普：从输入网址到最后浏览器呈现页面内容，中间发生了什么？](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665514196&idx=1&sn=ca26d258fcc4a35fc6d9a539b7d71dd7&chksm=80d67c97b7a1f58198b2e6ae436f73c677c0df4c05c2a8a4aad2b9e2d523da57dd5cd3d0a8ee&mpshare=1&scene=1&srcid=0122nnRpNb6OvRJubkSfKfsZ&pass_ticket=%2B%2FAmfhAaNv2sKw6192eqEL9hoW%2F6BrLxlzHIsKC0k6lPQsM4%2FFo08R%2FZowzw3821#rd) | [码农翻身:我是一个路由器](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513173&idx=1&sn=6ec5281b12ed5195070fa4df22383595&scene=21#wechat_redirect) | [码农翻身:我是一个网卡](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513160&idx=1&sn=d938db4f1a2d62514b57e92fd8d3d749&scene=21#wechat_redirect)

### ISO七层模型和TCP/IP五层模型
ISO制定的OSI参考模型的过于庞大、复杂招致了许多批评。与此对照，由技术人员自己开发的TCP/IP协议栈获得了更为广泛的应用。
> [参考博客: 对比](https://www.cnblogs.com/qishui/p/5428938.html)

### TCP和UDP
[参考博客: 区别](http://www.cnblogs.com/bizhu/archive/2012/05/12/2497493.html)


**************************
## HTTP
> HyperText Transfer Protocol 超文本传输协议

### HTTP的错误码
> [完整解释](https://github.com/Kuangcp/Notes/blob/master/Skills/View/ResponseCode.md)

### HTTP的缓存

### Session和Cookie

### HTTP1.1 和 HTTP2
> 目前大多国内厂商默认的还是1.1, aws和google使用了2 而且2一般也都会使用上https

HTTP2的特点:
1. 无阻塞的Multiplexing请求队列 _可以异步加载CSS和JS_
2. server端可以push资源给client端

[参考博客: HTTP/2](http://www.hollischuang.com/archives/2066)

**********************************
## Websocket
> 本质就是TCP的简单封装, 不像HTTP那样应答模式, 一次连接后就保持全双工模式

1. 单一的TCP连接, 采用全双工模式通信
2. 对代理, 防火墙和路由器透明
3. 无头部信息, Cookie, 身份验证
4. 无安全开销
5. 通过 ping/pong 帧 保持链路激活
6. 服务器可以主动传递消息给客户端, 不需要客户端轮询

*******************************
## 安全
### SYNFlood攻击
> 洪水攻击 [参考博客](http://xfocus.net/articles/200106/208.html) SYN Flood是当前最流行的DoS（拒绝服务攻击）与DDoS（分布式拒绝服务攻击）的方式之一，这是一种利用TCP协议缺陷，发送大量伪造的TCP连接请求，从而使得被攻击方资源耗尽（CPU满负荷或内存不足）的攻击方式。  
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
### CSRF
> [博客:CSRF漏洞的原理](https://www.zhuyingda.com/blog/b5.html)
