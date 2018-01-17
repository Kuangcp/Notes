`目录 start`
 
- [JavaSE](#javase)
    - [【语法】](#语法)
        - [判断](#判断)
        - [循环](#循环)
    - [【线程】](#线程)
    - [【String】](#string)
    - [【集合】](#集合)
        - [【Map】](#map)
        - [【List】](#list)
        - [【Set】](#set)
    - [【IO】](#io)
    - [【类文件和反射】](#类文件和反射)
    - [【自定义注解】](#自定义注解)
        - [【元注解】](#元注解)
    - [【JDBC】](#jdbc)
    - [【Net】](#net)
- [【常用接口】](#常用接口)
- [【Tips】](#tips)
    - [打包](#打包)
        - [命令打包出一个可执行jar](#命令打包出一个可执行jar)
- [编程习惯](#编程习惯)
    - [接口定义](#接口定义)
    - [日志规范](#日志规范)
    - [异常处理](#异常处理)
    - [配置文件](#配置文件)
- [常用工具项目](#常用工具项目)

`目录 end` *目录创建于2018-01-15*
****************************************
# JavaSE
> Java基础 根基

*********
## 【语法】
### 判断
- if
- switch

### 循环
- while
- for each循环里面 `for(item:list){}` list对象如果是一个对象的方法返回的，那么只会调用一次

### 用户输入输出
- `System.out.println("")` 输出并换行
    - print() 输出, 行末不换行
    - printf() 格式化输出, 和C语法类似

*******
## 【线程】
- [线程基础学习笔记](/Java/AdvancedLearning/Thread.md)
    - [代码](https://github.com/Kuangcp/JavaBase/tree/master/src/main/java/com/threads) `项目`

- [并发笔记](/Java/AdvancedLearning/Concurrents.md)
    - [代码](https://github.com/Kuangcp/JavaBase/tree/master/src/main/java/com/concurrents)

******
## 【String】
- 常见编码转换
    - 一般Windows文件默认编码：`str = new String(str.getBytes("iso8859-1"), "gb2312"); ` 
    - properties文件中获取中文 `str = new String(str.getBytes("utf-8"), "utf-8");`

******
## 【集合】
### 【Map】

### 【List】

### 【Set】
- Set是无序的，但是StringRedisTemplate的对象操作返回的set竟然是有序的
    - 因为有一个类是SortSet，顾名思义，所以是有序的，要继续多学习和使用Java原生的集合对象了

*******    
## 【IO】
- [IO流的相关学习](https://github.com/Kuangcp/JavaBase/tree/master/src/main/java/com/io)

- maven格式路径，会从resources下获取文件例如 /a.xml
- `InputStream is = this.getClass().getResourceAsStream(path);`
    - 读取properties文件 ：`new Properties().load(is);`
    - 按行读取文件 `BufferedReader bf = new BufferedReader(new InputStreamReader(is));`

**************
- jar读取外部配置文件
```java
Properties properties = new Properties();
File file = new File("something.properties");
FileInputStream fis = new FileInputStream(file);
properties.load(fis);
System.out.println(properties.getProperty("v"));
fis.close();
``` 
- 只要配置文件和打包的jar同级即可

*************
## 【类文件和反射】
- [类与字节码笔记](/Java/AdvancedLearning/ClassFile.md)
    - [代码](https://github.com/Kuangcp/JavaBase/tree/master/src/main/java/com/classfile) `项目`


*********
## 【自定义注解】
### 【元注解】

************
## 【JDBC】
- 基础的批量操作SQL ` pstmt.executeBatch(); //批量执行`

*************
## 【Net】
- 得到URL文件的输入流
    - `new URL(url).openStream()`

- 使用Linux编程开启web容器时`java.net.SocketException: 权限不够`
    - [参考博客](http://www.xuebuyuan.com/1432737.html)
    - 快速解决，不使用小于1024的端口即可，或者提权
   

*****************************************************
# 版本更迭
## Java7
    语法糖:数字中的下划线
    新的语言小特性:TWR(try with resources)
    类文件格式的变化:注解
    JVM的新特性: 动态调用
- | Switch 支持 String
- | 二进制的实例化 原本是`int x = Integer.parseInt("1010100", 2);`7之后`int x = 0b110110;`
- | 数字下划线 `10_0100__1000__0011`
- | 异常处理
    - 允许异常的`或`操作 `catch(IOException | NullPointException e)`
    - final关键字: `catch (final Exception e){throw e;}` 抛出后的是原异常类型的异常而不是Exception
- | TWR(try with resources)
```java
    // 从URL下载文件, 其中的资源都会自动关闭
    // 但是要注意发生异常后,资源也不会自动关闭, 所以确保TWR生效,正确的用法是为各个资源声明独立变量.
    try(OutputStream out = new FileOutputStream(file);
        InputStream is = url.openStream()
    ){
        byte[] buf = new byte[1024];
        int len; 
        while ((len = is.read(buf)) > 0){
            out.write(buf, 0, len);
        }
    }
```
- 另一个好处就是改善了错误跟踪的能力, 能够更准确地跟踪堆栈中的异常, 在Java7之前,处理资源时抛出的异常经常会被覆盖,TWR也可能会出现这种情况.
```java
    try((InputStream in = getNullStream())){
        in.available();
    }
```
- 在这种改进后的跟踪堆栈中能看到提示, 其中的NullPointException是能够抛出来看到的.没有被隐藏

> 目前TWR特性依靠一个接口来实现 AutoCloseable. TWR的try从句中出现的资源类都必须实现这个接口. Java7中大部分资源类都修改过  
> 但不是所有的资源类都采用了这项技术, JDBC是已经具备了这个特性. _官方提倡尽量采用TWR替代原有的方式_  

- | 钻石语法: 泛型右部直接`<>`不用写类型变量
- | 简化变参方法调用:
    - `HashMap<String, String>[] array = new HashMap<>[2];` 不允许创建已知类型的泛型数组
    - 只能这样写 `HashMap<String, String> array = new HashMap[2];`
        - 这样的编写也只是一个敷衍, 编译器会警告: 可以将array定义为HashMap<String, String>数组,但是又不能创建这个类型的实例. 所以这里只是将原始类型实例化了放进去.
    - 现在能够这样编写: `public static <T> Collection<T> doSomething(T... entries){}`

## Java8
Lambda
Stream

## Java9
模块化

*****************************************************
# 【常用接口】
`Comparable接口`
- 此接口强行对实现它的每个类的对象进行整体排序。此排序被称为该类的自然排序，类的`compareTo`方法被称为它的自然比较方法。实现此接口的对象列表或数组可以通过`Collections.sort` 和`Arrays.sort`进行自动排序。
- 实现此接口的对象可以用作有序映射表中的键或有序集合中的元素，无需指定比较器。强烈推荐（虽然不是必需的）使`自然排序`与 `equals` 一致。
- 所谓`与equals一致`是指对于`类C` 的每一个 `e1 和 e2` 来说，当且仅当 `(e1.compareTo((Object)e2)==0)`与 `e1.equals((Object)e2)` 具有相同的布尔值时，类 C 的自然排序才叫做与 equals 一致 。
- 接口指定实现的方法 ：`int compareTo(T o)` 比较此对象与指定对象的顺序。如果该对象`小于、等于或大于`指定对象，则分别返回`负整数、零或正整数`。
- 强烈推荐 (x.compareTo(y)==0) == (x.equals(y)) 这种做法，但不是 严格要求这样做。一般来说，任何实现 Comparable 接口和违背此条件的类都应该清楚地指出这一事实。
    - 推荐如此阐述：“注意：此类具有与 equals 不一致的自然排序。”

*****************************    
# 【Tips】
## 打包
### 命令打包出一个可执行jar
- `javac -d *.java `编译文件
- `jar -cvf hello.jar com/test/*.*` 打包字节码成jar
- `jar -cvfm hello.jar mainfest *.*` 打包成可执行jar
    - 其中：`mainfest` 文本文件： `Main-Class: com.test.Main` 冒号后一定要有空格，文件最后一行一定留空行

- 运行jar包中指定的类`java -cp clojure.jar clojure.main`
    - 多个jar运行 `java -cp jline-0.9.94.jar;clojure.jar jline.ConsoleRunner clojure.main`


********************   
# 编程习惯

## 接口定义
- 先有统一的接口定义规范，然后有AOP实现。先有思想再有技术。
- 现在知道为什么要返回统一的一个ResultBean了：
    - 为了统一格式
    - 为了应用AOP
    - 为了包装异常信息

## 日志规范

## 异常处理
- 所以，我对开发人员的要求就是，绝大部分场景，不允许捕获异常，不要乱加空判断。只有明显不需要关心的异常，如关闭资源的时候的io异常，可以捕获然后什么都不干，其他时候，不允许捕获异常，都抛出去，到controller处理。空判断大部分时候不需要，你如果写了空判断，你就必须测试为空和不为空二种场景，要么就不要写空判断。
- 强调，有些空判断是要的，如：参数是用户输入的情况下。但是，大部分场景是不需要的（我们的IT系统里面，一半以上不需要），如参数是其它系统传过来，或者其他地方获取的传过来的，99.99%都不会为空，你判断来干嘛？就抛一个空指针到前台怎么啦？何况基本上不会出现。
- 总结：
    - 开发组长定义好异常，异常继承RuntimeException。
    - 不允许开发人员捕获异常。（异常上对开发人员就这点要求！异常都抛出到controller上用AOP处理）
    - 后台（如队列等）异常一定要有通知机制，要第一时间知道异常。
    - 少加空判断，加了空判断就要测试为空的场景！


## 配置文件
千万业务代码里面不要和读取配置的代码耦合在一起。切记！


# 常用工具项目

cap 图片验证码框架
jwt token项目

oken项目

