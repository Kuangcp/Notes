# JavaSE
> Java基础 根基

*********
## 【语法】
### 判断
### 循环
- for each循环里面 `for(item:list){}` list对象如果是一个对象的方法返回的，那么只会调用一次

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
   
*********************
## 【常用接口】
`Comparable接口`
- 此接口强行对实现它的每个类的对象进行整体排序。此排序被称为该类的自然排序，类的`compareTo`方法被称为它的自然比较方法。实现此接口的对象列表或数组可以通过`Collections.sort` 和`Arrays.sort`进行自动排序。
- 实现此接口的对象可以用作有序映射表中的键或有序集合中的元素，无需指定比较器。强烈推荐（虽然不是必需的）使`自然排序`与 `equals` 一致。
- 所谓`与equals一致`是指对于`类C` 的每一个 `e1 和 e2` 来说，当且仅当 `(e1.compareTo((Object)e2)==0)`与 `e1.equals((Object)e2)` 具有相同的布尔值时，类 C 的自然排序才叫做与 equals 一致 。
- 接口指定实现的方法 ：`int compareTo(T o)` 比较此对象与指定对象的顺序。如果该对象`小于、等于或大于`指定对象，则分别返回`负整数、零或正整数`。
- 强烈推荐 (x.compareTo(y)==0) == (x.equals(y)) 这种做法，但不是 严格要求这样做。一般来说，任何实现 Comparable 接口和违背此条件的类都应该清楚地指出这一事实。
    - 推荐如此阐述：“注意：此类具有与 equals 不一致的自然排序。”

*****************************    
## 【Tips】
#### 命令打包出一个可执行jar
- `javac -d *.java `编译文件
- `jar -cvf hello.jar com/test/*.*` 打包字节码成jar
- `jar -cvfm hello.jar mainfest *.*` 打包成可执行jar
    - 其中：`mainfest` 文本文件： `Main-Class: com.test.Main` 冒号后一定要有空格，文件最后一行一定留空行

- 运行jar包中指定的类`java -cp clojure.jar clojure.main`
    - 多个jar运行 `java -cp jline-0.9.94.jar;clojure.jar jline.ConsoleRunner clojure.main`


********************   
## 编程习惯

### 接口定义
- 先有统一的接口定义规范，然后有AOP实现。先有思想再有技术。
- 现在知道为什么要返回统一的一个ResultBean了：
    - 为了统一格式
    - 为了应用AOP
    - 为了包装异常信息

### 日志规范

### 异常处理
- 所以，我对开发人员的要求就是，绝大部分场景，不允许捕获异常，不要乱加空判断。只有明显不需要关心的异常，如关闭资源的时候的io异常，可以捕获然后什么都不干，其他时候，不允许捕获异常，都抛出去，到controller处理。空判断大部分时候不需要，你如果写了空判断，你就必须测试为空和不为空二种场景，要么就不要写空判断。
- 强调，有些空判断是要的，如：参数是用户输入的情况下。但是，大部分场景是不需要的（我们的IT系统里面，一半以上不需要），如参数是其它系统传过来，或者其他地方获取的传过来的，99.99%都不会为空，你判断来干嘛？就抛一个空指针到前台怎么啦？何况基本上不会出现。
- 总结：
    - 开发组长定义好异常，异常继承RuntimeException。
    - 不允许开发人员捕获异常。（异常上对开发人员就这点要求！异常都抛出到controller上用AOP处理）
    - 后台（如队列等）异常一定要有通知机制，要第一时间知道异常。
    - 少加空判断，加了空判断就要测试为空的场景！


### 配置文件
千万业务代码里面不要和读取配置的代码耦合在一起。切记！


## 常用工具项目

cap 图片验证码框架

