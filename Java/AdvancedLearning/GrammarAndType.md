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
- [关键字](#关键字)

`目录 end` |_2018-03-11_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
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
