`目录 start`
 
- [IO操作的学习](#io操作的学习)
    - [Java IO简史](#java-io简史)
        - [Java1.0到1.3](#java10到13)
        - [Java1.4引入的NIO](#java14引入的nio)
        - [Java1.7的AIO](#java17的aio)
    - [关于普通IO的文件操作](#关于普通io的文件操作)
        - [读取配置文件](#读取配置文件)
    - [NIO](#nio)

`目录 end` |_2018-03-16_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# IO操作的学习
> - [个人代码:IO流的相关学习](https://github.com/Kuangcp/JavaBase/tree/master/src/main/java/com/io)

## Java IO简史
> [BIO NIO AIO演变](http://www.cnblogs.com/itdragon/p/8337234.html)

### Java1.0到1.3
### Java1.4引入的NIO
### Java1.7的AIO

## 关于普通IO的文件操作
### 读取配置文件
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

## NIO




