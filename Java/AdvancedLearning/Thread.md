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


- 当调用 Thread.join() 时，调用线程将阻塞，直到目标线程完成为止。 

## 线程的意义
## 线程的生命周期
> [参考博客](https://segmentfault.com/a/1190000005006079) [Blog: 线程详解](http://www.cnblogs.com/riskyer/p/3263032.html)

### 创建
创建线程有三种创建方式： 继承，实现接口，实例化匿名内部方法。[示例代码](https://github.com/Kuangcp/JavaBase/blob/master/src/main/java/com/threads/HowToCreateThread.java)

### 控制
### 销毁