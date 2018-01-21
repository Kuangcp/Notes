`目录 start`
 
- [Java性能调优](#java性能调优)
- [Web性能](#web性能)
    - [测试工具](#测试工具)
        - [ApacheBenchMark](#apachebenchmark)
    - [数据库性能](#数据库性能)
        - [MySQL](#mysql)
            - [主从复制以及读写分离](#主从复制以及读写分离)

`目录 end` *目录创建于2018-01-14*
****************************************
# Java性能调优
> [查看详情>>](/Java/JavaPerformance.md)

# Web性能

## 测试工具
### 压力测试
#### ApacheBenchMark
- 安装:`sudo apt install apache2-utils`
- 简单使用 `ab -c 并发数 -n 总请求数 URL`
    - 查看文档:`man ab` 或 `ab -h`

#### Jmeter
> 具有图形化客户端


## 数据库性能

### MySQL
#### 主从复制以及读写分离
- [读写分离博客](http://www.cnblogs.com/luckcs/articles/2543607.html)