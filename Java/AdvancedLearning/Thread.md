`目录 start`
 
- [线程的基础学习](#线程的基础学习)
    - [TODO](#todo)
    - [线程的意义](#线程的意义)
    - [线程的生命周期](#线程的生命周期)
        - [创建](#创建)
        - [控制](#控制)
        - [销毁](#销毁)

`目录 end` *目录创建于2018-01-14*
****************************************
# 线程的基础学习

## TODO
- [ ] 线程的多种创建方式
- [ ] 线程池的创建方式
- [ ] 线程的状态转化


## 基础
- [码农翻身:编程世界的那把锁](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513653&idx=1&sn=e30c18c0c1780fb3ef0cdb858ee5201e&chksm=80d67af6b7a1f3e059466302c2c04c14d097c1a5de01cf986df84d4677299542f12b974dfde3&scene=21#wechat_redirect) | [码农翻身:加锁还是不加锁，这是一个问题 ](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513692&idx=1&sn=ef2416a4bb96d64db77e32d5b4c7967e&chksm=80d67a9fb7a1f3898e513cc1d9e96841610bb84aed2dc24cab2d403e74e317e3c447e45e7611&scene=21#wechat_redirect)

## 线程的意义
## 线程的生命周期
> [参考博客](https://segmentfault.com/a/1190000005006079) | [Blog: 线程详解](http://www.cnblogs.com/riskyer/p/3263032.html)


### 创建
- 创建线程有三种创建方式： 继承，实现接口，实例化匿名内部方法。[示例代码](https://github.com/Kuangcp/JavaBase/blob/master/src/main/java/com/threads/HowToCreateThread.java)

### 控制
- 当调用 `Thread.join()` 时，_调用线程_将阻塞，直到_目标线程_完成为止。 

### 销毁