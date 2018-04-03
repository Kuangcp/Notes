`目录 start`
 
- [基础语法](#基础语法)
    - [结构](#结构)
        - [判断](#判断)
        - [循环](#循环)
    - [用户输入输出](#用户输入输出)
- [数据类型](#数据类型)
    - [基础数据类型](#基础数据类型)
    - [包装类型](#包装类型)
        - [String](#string)
    - [自定义类](#自定义类)
    - [类型强转](#类型强转)
- [类的结构](#类的结构)
    - [修饰符](#修饰符)
        - [权限修饰符](#权限修饰符)
        - [其他](#其他)
    - [属性](#属性)
    - [方法](#方法)
- [POJO](#pojo)
    - [VO](#vo)
    - [PO](#po)
    - [TO](#to)
    - [BO](#bo)
    - [POJO](#pojo)
    - [DAO](#dao)
- [关键字](#关键字)

`目录 end` |_2018-04-03_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 基础语法

## 结构
### 判断
- if
- switch

### 循环
- while
- for each循环里面 `for(item:list){}` list对象如果是一个对象的方法返回的，那么只会调用一次

## 用户输入输出
- `System.out.println("")` 输出并换行
    - print() 输出, 行末不换行
    - printf() 格式化输出, 和C语法类似

***********************
# 数据类型

## 基础数据类型

## 包装类型
### String
> 该类是final修饰的, 原因:[知乎问题](https://www.zhihu.com/question/31345592)

- 常量池的实现

- 常见编码转换
    - 一般Windows文件默认编码：`str = new String(str.getBytes("iso8859-1"), "gb2312"); ` 
    - properties文件中获取中文 `str = new String(str.getBytes("utf-8"), "utf-8");`

## 自定义类
> 也就是内部类, 而且其域可以和其他常见类型一样, 作为类的成员, 也可作为方法的局部变量, 其中包含的各种变量的域都是按原规则生效的

## 类型强转
- Double -> int 直接(int)num;

******************
# 类的结构
## 修饰符
> [参考博客: java 权限修饰符](https://blog.csdn.net/yan8024/article/details/6426451)
### 权限修饰符
- `public`   公开访问
- `protect`  子类（可以是别的包下） / 包 （主要是包内）
- `缺省`      包 不能访问所修饰的对象的属性 只有public可以
- `private`  当前类或者内部类

### 其他
## 属性

## 方法
方法的签名: 

**************
# POJO
> [参考博客:  java的(PO,VO,TO,BO,DAO,POJO)解释](http://www.cnblogs.com/yxnchinahlj/archive/2012/02/24/2366110.html)

## VO
> (value object) 值对象
1. 使用new关键字创建的, 由GC回收的, 
2. VO是值对象, 业务对象, 存活在业务层的, 是业务逻辑使用的
    - 它存在的目的就是为数据提供一个生存的地方
3. VO的属性是根据当前业务的不同而不同的
    - 也就是说，它的每一个属性都一一对应当前业务逻辑所需要的数据的名称。

## PO
> (persistant object) 持久对象
1. PO则是向数据库中添加新数据时创建，删除数据库中数据时削除的。
    - 并且它只能存活在一个数据库连接中，断开连接即被销毁。
2. PO是持久化对象, 是有状态的, 每个属性代表其当前状态, 他是物理数据的对象表示
    - 使用它能够让我们的程序与物理数据解耦，并且可以简化对象数据与物理数据之间的转换。
3. PO的属性是跟数据库表的字段一一对应的。
4. PO对象需要实现序列化接口

> 首先说PO和VO吧，它们的关系应该是相互独立的，一个VO可以只是PO的部分，也可以是多个PO构成，同样也可以等同于一个PO（当然我是指他们的属性）。
正因为这样，PO独立出来，数据持久层也就独立出来了，它不会受到任何业务的干涉。又正因为这样，业务逻辑层也独立开来，它不会受到数据持久层的影响，业务层关心的只是业务逻辑的处理，至于怎么存怎么读交给别人吧！
不过，另外一点，如果我们没有使用数据持久层，或者说没有使用hibernate，那么PO和VO也可以是同一个东西，虽然这并不好。
## TO
> (transfer Object) 数据传输对象
- 在应用程序不同tie(关系)之间传输的对象
## BO
> (business object) 业务对象
- 从业务模型的角度看,见UML元件领域模型中的领域对象。封装业务逻辑的java对象,通过调用DAO方法,结合PO,VO进行业务操作。
- 它装满了业务逻辑的处理，在业务逻辑复杂的应用中有用。
## POJO
> (plain ordinary java object) 简单无规则java对象
- 纯的传统意义的java对象。就是说在一些Object/Relation Mapping工具中，能够做到维护数据库表记录的persisent object完全是一个符合Java Bean规范的纯Java对象，没有增加别的属性和方法。我的理解就是最基本的Java Bean，只有属性字段及setter和getter方法！
## DAO
> (data access object) 数据访问对象
- 通常和PO结合使用，DAO中包含了各种数据库的操作方法

*************************
# 关键字
>  Java关键字和保留字
```
abstract class    extends implements null      strictfp     true
assert   const    false   import     package   super        try
boolean  continue final   instanceof private   switch       void
break    default  finally int        protected synchronized volatile
byte     do       float   interface  public    this         while
case     double   for     long       return    throw
catch    else     goto    native     short     throws
char     enum     if      new        static    transient
```
