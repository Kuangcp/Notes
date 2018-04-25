`目录 start`
 
- [网络](#网络)
    - [基础](#基础)
        - [ISO七层模型和TCP/IP五层模型](#iso七层模型和tcpip五层模型)
        - [TCP和UDP](#tcp和udp)
        - [网络延迟](#网络延迟)
            - [TTFB](#ttfb)
        - [URL](#url)
    - [Web安全](#web安全)
    - [HTTP](#http)
        - [HTTP的返回码](#http的返回码)
        - [HTTP的缓存](#http的缓存)
        - [Session和Cookie](#session和cookie)
        - [HTTP1.1 和 HTTP2](#http11-和-http2)
        - [HTTPS](#https)
            - [HSTS](#hsts)
        - [CORS](#cors)
    - [Websocket](#websocket)
        - [WSS](#wss)

`目录 end` |_2018-04-25_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 网络

## 基础
> [码农翻身:小白科普：从输入网址到最后浏览器呈现页面内容，中间发生了什么？](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665514196&idx=1&sn=ca26d258fcc4a35fc6d9a539b7d71dd7&chksm=80d67c97b7a1f58198b2e6ae436f73c677c0df4c05c2a8a4aad2b9e2d523da57dd5cd3d0a8ee&mpshare=1&scene=1&srcid=0122nnRpNb6OvRJubkSfKfsZ&pass_ticket=%2B%2FAmfhAaNv2sKw6192eqEL9hoW%2F6BrLxlzHIsKC0k6lPQsM4%2FFo08R%2FZowzw3821#rd) | 
> [码农翻身:我是一个路由器](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513173&idx=1&sn=6ec5281b12ed5195070fa4df22383595&scene=21#wechat_redirect) | 
> [码农翻身:我是一个网卡](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513160&idx=1&sn=d938db4f1a2d62514b57e92fd8d3d749&scene=21#wechat_redirect)

### ISO七层模型和TCP/IP五层模型
ISO制定的OSI参考模型的过于庞大、复杂招致了许多批评。与此对照，由技术人员自己开发的TCP/IP协议栈获得了更为广泛的应用。
> [参考博客: 对比](https://www.cnblogs.com/qishui/p/5428938.html)

### TCP和UDP
[参考博客: 区别](http://www.cnblogs.com/bizhu/archive/2012/05/12/2497493.html)

### 网络延迟
> [如何彻底解决「网络延迟」这个问题？](https://www.zhihu.com/question/34689035)

- [MOBA类游戏是如何解决网络延迟同步的？](https://www.zhihu.com/question/36258781)
- [状态同步与帧同步](http://www.cnblogs.com/sevenyuan/p/5283265.html)

#### TTFB
> `Time to first byte` 网络请求被发起到从服务器接收到第一个字节这段时间，它包含了 TCP连接时间，发送HTTP请求时间和获得响应消息第一个字节的时间。

### URL
> [维基百科](https://en.wikipedia.org/wiki/URL) | [百度百科](https://baike.baidu.com/item/URL)

*******************************
## Web安全
> [完整的系统化信息](/Skills/CS/WebSecurity.md)

**************************
## HTTP
> HyperText Transfer Protocol 超文本传输协议

### HTTP的返回码
> [完整列表 ](/FrontEnd/ResponseCode.md)

### HTTP的缓存

### Session和Cookie

### HTTP1.1 和 HTTP2
> 目前大多国内厂商默认的还是1.1, aws和google使用了2 而且2一般也都会使用上https

HTTP2的特点:
1. 无阻塞的Multiplexing请求队列 _可以异步加载CSS和JS_
2. server端可以push资源给client端

[参考博客: HTTP/2](http://www.hollischuang.com/archives/2066)

### HTTPS
> [SSL/TSL](/Skills/CS/WebSecurity.md#ssl和tsl)

#### HSTS
> HTTP Strict Transport Security 强制让客户端使用HTTPS进行通信

### CORS
> 跨域

> [mozilla CORS](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS)
> [阮一峰 跨域资源共享 CORS 详解](http://www.ruanyifeng.com/blog/2016/04/cors.html)
> [CORS详解.md](https://github.com/hstarorg/HstarDoc/blob/master/%E5%89%8D%E7%AB%AF%E7%9B%B8%E5%85%B3/CORS%E8%AF%A6%E8%A7%A3.md)
**********************************
## Websocket
> 本质就是TCP的简单封装, 不像HTTP那样应答模式, 一次连接后就保持全双工模式

1. 单一的TCP连接, 采用全双工模式通信
2. 对代理, 防火墙和路由器透明
3. 无头部信息, Cookie, 身份验证
4. 无安全开销
5. 通过 ping/pong 帧 保持链路激活
6. 服务器可以主动传递消息给客户端, 不需要客户端轮询

### WSS
