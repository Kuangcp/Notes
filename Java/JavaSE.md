# JavaSE 知识点梳理
`目录`
- [【线程】](#线程)
- [【常用接口】](#常用接口)

## 【类文件和反射】
- [类文件详细](https://github.com/Kuangcp/JavaBase/tree/master/src/main/java/com/classfile)

## 【线程】
- [线程基础学习](https://github.com/Kuangcp/JavaBase/tree/master/src/main/java/com/threads)
- [concurrent并发包常用类的学习](https://github.com/Kuangcp/JavaBase/tree/master/src/main/java/com/concurrents)


## 【String】
- 常见编码转换
    - 一般Windows文件默认编码：`str = new String(str.getBytes("iso8859-1"), "gb2312"); ` 
    - properties文件中获取中文 `str = new String(str.getBytes("utf-8"), "utf-8"); `
    
## 【IO】
- [IO流的相关学习](https://github.com/Kuangcp/JavaBase/tree/master/src/main/java/com/io)

- maven格式路径，会从resources下获取文件例如 /a.xml
- `InputStream is = this.getClass().getResourceAsStream(path);`
    - 读取properties文件 ：`new Properties().load(is);`
    - 按行读取文件 `BufferedReader bf = new BufferedReader(new InputStreamReader(is));`

**************
- jar读取外部配置文件
```
Properties properties = new Properties();
File file = new File("something.properties");
FileInputStream fis = new FileInputStream(file);
properties.load(fis);
System.out.println(properties.getProperty("v"));
fis.close();
``` 
- 只要配置文件和打包的jar同级即可

## 【JDBC】
- 基础的批量操作SQL ` pstmt.executeBatch(); //批量执行`

## 【Net】
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

