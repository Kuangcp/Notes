`目录 start`
 
- [Java8](#java8)
    - [Optional](#optional)
    - [Funcational](#funcational)
    - [Lambda](#lambda)
    - [Stream](#stream)
    - [集合](#集合)
    - [时间处理](#时间处理)
        - [Instant](#instant)
        - [LocalDateTime](#localdatetime)

`目录 end` |_2018-08-10_| [码云](https://gitee.com/gin9) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104) | [cnblogs](http://www.cnblogs.com/kuangcp)
****************************************
# Java8
> [doc: Java8](https://docs.oracle.com/javase/8/)  
> [Java8 JDK Readme](http://www.oracle.com/technetwork/java/javase/jdk-8-readme-2095712.html) | [Jre8 Readme](http://www.oracle.com/technetwork/java/javase/jre-8-readme-2095710.html)`有说明哪些是JRE运行不必要的文件`  

> [Java8 tools](https://docs.oracle.com/javase/8/docs/technotes/tools/)`介绍目录 bin/* 下的工具`

## Optional
## Funcational

> [参考  Java8函数接口实现回调及Groovy闭包的代码示例](http://www.cnblogs.com/lovesqcc/p/6083759.html)
> [Function接口 – Java8中java.util.function包下的函数式接口](http://ifeve.com/jjava-util-function-java8/)

- 常用函数接口主要有:
    - Consumer (接收单参数无返回值的函数或lambda表达式)， 方法是 void accept(T t);
    - BiConsumer (接收双参数无返回值的函数或 lambda表达式)，方法是 void accept(T t, U u) ;
    - Function (接收单参数有返回值的函数或lambda表达式)， 方法是 R apply(T t);
    - BiFunction (接收双参数有返回值的函数或lambda表达式)，方法是 R apply(T t, U u);
    - Predicate （接收单参数返回布尔值的函数或lambda表达式），方法是 boolean test(T t);
    - Supplier (无参数返回值的函数或 lambda)， 方法是 T get();
- 接受原子类型参数的函数接口，这里不一一列举了。可参考 java8 package java.util.function;

- 为什么要使用 Function 以及闭包呢？
    - 在语法上比定义回调接口、创建匿名类更加简洁；
    - 尝试使用新的语言特性，理解多样化的编程思想，提升编程表达能力。

## Lambda
> [参考博客: 级联 lambda 表达式的函数重用与代码简短问题](http://www.techug.com/post/java-lambda.html)

- [ ] 排序
> [参考博客: Java8：Lambda表达式增强版Comparator和排序](http://www.importnew.com/15259.html)
## Stream
> [参考博客: Java 8 中的 Streams API 详解](https://www.ibm.com/developerworks/cn/java/j-lo-java8streamapi/)

## 集合
_集合的Lambda迭代方式_
- [参考博客: List、Map的循环迭代](http://blog.csdn.net/xf_87/article/details/53931207)

## 时间处理

### Instant 
- [ ] 暂时没有学会怎么用上

### LocalDateTime
> 方便的新时间处理类, 用于替代Date

```java
    // LocalDateTime 获取毫秒以及秒  也可以手动指定中国的时区 ZoneOffset.of("+8")
    ZonedDateTime zonedDateTime = refreshTime.atZone(ZoneOffset.systemDefault());
    Instant instant = zonedDateTime.toInstant();
    long seconds = instant.getEpochSecond(); 
    long millis = instant.toEpochMilli();
    Date date = Date.from(instant);
```