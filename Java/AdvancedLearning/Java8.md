`目录 start`
 
- [Java8](#java8)
    - [Optional](#optional)
    - [Funcational](#funcational)
    - [Lambda](#lambda)
    - [集合](#集合)

`目录 end` |_2018-07-08_| [码云](https://gitee.com/gin9) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# Java8

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


## 集合
_集合的Lambda迭代方式_
- [参考博客: List、Map的循环迭代](http://blog.csdn.net/xf_87/article/details/53931207)
