`目录 start`
 
- [SringBoot2](#sringboot2)
    - [Web模块](#web模块)
        - [Web容器](#web容器)
            - [Tomcat](#tomcat)
            - [Jetty](#jetty)
        - [跨域](#跨域)

`目录 end` |_2018-04-28_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# SringBoot2
> 变化比较大 [官方说明对比1所更改的文档](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-2.0-Migration-Guide)

[spring boot 2.0 半月的实战_阶段性总结1](https://blog.csdn.net/freexyxyz/article/details/79003438)
[SpringBoot2.0 jpa多数据源配置 ](https://blog.csdn.net/tianyaleixiaowu/article/details/78905149)
[Springboot2.0 升级（Gradle工程) ](https://my.oschina.net/tangdu/blog/1625336)
[使用精简版jdk9在docker上运行springboot2 ](https://my.oschina.net/go4it/blog/1623004)

## Web模块
### Web容器
#### Tomcat 
> org.springframework.boot:spring-boot-starter-web 依赖中默认包含了Tomcat

#### Jetty
> [Spring Boot – Configure Jetty Server](https://howtodoinjava.com/spring/spring-boot/configure-jetty-server/)

### 跨域
> [SpringBoot2的跨域配置](https://blog.csdn.net/kcp606/article/details/80036420)
> 最终是采用的Nginx进行反向代理，将后台服务放在前台服务子路径下

