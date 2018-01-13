`目录 start`
 
- [Tips](#tips)
- [注意：](#注意)
- [JavaAPI总结:](#javaapi总结)
    - [一、String、StringBuffer、StringBuilder](#一、string、stringbuffer、stringbuilder)
    - [二、集合类](#二、集合类)
    - [三、包装类](#三、包装类)
    - [四、System类](#四、system类)
    - [五、Runtime类](#五、runtime类)
    - [六、日期对象](#六、日期对象)

`目录 end` *目录创建于2018-01-14*
****************************************

# Tips

- 线程中使用旗帜布尔变量来终止线程
	- 加上volatile关键字来声明变量
 	- join方法是让其他线程等待调用join方法的那个线程结束
- 互斥和同步：
	- 互斥：synchronized
	- 同步 wait()  notify() notifyall()
* 命令行输入set显示系统环境变量。
* vector 运行效率低一些，主要多线程中用
* System.gc();调用系统垃圾回收，但不保证一定执行。
* System.out.print(obj)默认打印对象地址，除非重写了toString()方法。
* System.in.read()返回int值，不是byte.
* StringBuffer中的size方法返回里面的字符数 
* =是地址赋值。k=m是地址赋值，new是新建值。String a="b"等价于a=new String("b");
* Hashset只能添加一种类的对象，不同类将被默认排斥并不报错
* java中存在字面量(字符常量)，多个变量共享重复的值。==比较变量的地址。
* 静态属性是多个对象共用的空间，并且不需要实例化对象。
* 静态方法中只允许使用静态属性。静态块在类加载时调用，先于构造运行。
* 子类属性不覆盖父类属性。
* 关于访问修饰符，默认为同包可访问.
* 实例变量（类的属性）自动初始化，局部变量不。
* 创建对象步骤：分配空间、初始化属性、构造方法。
* 传参方法：简单类型是按值（副本）传递，对象类型按引用（地址）传递。
* default :本类＋同包类可见（默认）；protected:本类＋同包＋不同包的子类
* 继承：子类不继承。子类没有指定调用父类的哪一个构造方法，那么就会默认super()。
* 多态：指的是编译时的类型变化，而运行时类型不变。在方法重载的情况下，参数类型决定于编译时类型。重载又叫编译时多态，覆盖又称运行时多态。
* 静态方法：可被覆盖，但不存在多态概念。
* 静态属性：被调用时，会加载类。
* Comparator中，用元素的类的comparaTo方法代替手动返回0、1。
* Map.Entry是Map的内部接口。
* 创建集合对象时养成实现Comparable接口，覆盖hashCode，equals,compareTo方法的习惯。
* 常量：构造方法对final赋值时，构造前的默认值失效。当final修饰实例变量时，实例变量不会自动初始化为0。
	* 即private和static方法默认均为final方法。
- string：str = “abc”，b="abc"，来创建一个对象时，则系统会先在串池中寻找有没有“abc”这个字符串。如果有则直接将对象指向串池中对应的地址，如果没有则在串池中创建一个	
	- “abc”字符串。对于str=”1”+”2”+”3”＋”4”，产生：12 123 1234会在串池中产生多余对象，在时间和空间上造成相当大的浪费。用 StringBuffer(线程安全的) 或者 StringBuilder（线程不安全的）,在运行的时间上快2个数量级。
- Object:equals方法判断对象的值是否相等。但前提是类中覆盖了equals方法。Object类中的equals方法判断的是地址。
- String类已经覆盖了equals方法了，所以我们能使用equals来判断String对象的值是否相等。

int      与  str
```
	Integer 到 String 	i.toString()
	Integer 到 int 		i.intValue()
	String  到 int 		Integer.parseInt(str)
	String  到 Integer	Integer.getInteger(str)
	int	到 String 	Integer.toString(i)
	int 	到 Integer 	new Integer(a)
```

- 找不到或无法加载主类：最前面加分号。
- 应该先添加元素再创建迭代器。
- 假设整型变量x的当前值为2，则复合赋值语句x/=x+1执行后x值为多少？
	- 答案为0.

****
# 注意：
	0.button改名用button.setLabel("")。
	1。set不允许重复元素
	根目录：“cd\”
	子目录：“cd 完整路径”
	切换盘：“盘符：”
	2.
	3.自定义类的静态方法的使用格式：包名.类名.方法
	4.引入自定义包格式：import 包名.*;
	5.keyTyped事件不识别键码。setFocusable()几乎设置窗口获得焦点性。
	6.
	7.关于String类型的equals和==，前者对比内容，后者对比地址
	8.
	9.createNewFile() 必须有异常处理
	10.file使用中，需要捕获IOException;新建file对象若在语句块里面，会变成局部变量，catch会报错
	11.带参数命令行输入格式 java T5 D：/t.java
	12.内部类（事件）使用的函数的形参和外部类的成员变量要用final修饰符。
	13.String[]默认值为null 
	14.内部类定义在局部时，不可以被成员修饰符修饰，可以直接访问外部类中的成员，不可以访问所在局部中的变量，智能访问被final修饰的局部变量。
	15。
	16.局部内部类不能定义静态成员
	17.双击打开jar可执行文件制作步骤：1.源文件头部写包名；2.编译文件到指定文件夹：javac -d 新目录名 源文件；3.源文件夹封装为JAR包；4.检查运行环境
	19.编译文件到d:\he文件夹下的文件夹m中：源文件头部声明包名为m,然后命令：javac -d d:\he k.java
	20.文件夹封装为jar包：jar -cvf 目标文件 源文件夹
	21.添加更新文件：jar -cvfm 目标文件 -C 更新文件 源文件夹
	22.先设置框体的属性，后画图
	23.窗口关闭事件要用windowClosing 函数，不用window Closed函数。
	24.图形画在调用getGraphics()的组件上。
	25.基本数据类型转换为字符串用基本数据类型类toString方法。
	26.内部类访问外部类成员变量：outer.this.x
	27.start,sleep,wait,notify,用线程自定义方法结束线程以取代过时的stop方法。
	28.为线程命名，最终必须要调用super()；每个线程实例有局部变量存储空间
	29.如果让线程实例共享线程成员变量，或多实例+static 修饰成员变量，或多个线程单实例。详见Bank4_28。
	30.自动整型拆装箱中，值在一个字节内的数不重复开辟空间，超过127就开辟新空间。
	31.多线程需要synchronized处理共享代码，以规避安全问题。有时synchronized可以修饰函数，简化了封装体
	32.同处理需要保证多线程使用的是同一个锁。而且，要注意synchronised的位置，必须保证一次只让位给一个线程。
	33.注意同步修饰的代码范围。注意同步函数被静态修饰后，使用的锁是Class.
	34.Runnable的作用：1，避免单继承的局限性。2.实现synchronized的同步处理。
	35.懒汉单例设计模式代码。
```java
class LazyMan{
	public static LazyMan single=null;
	public static LazyMan getInstance(){
		if(single==null){
			synchronized(LazyMan.class){
				if(single==null){
					single=new LazyMan();
					return single;
				}
				else return single;
			}			
		}
		else return single;
	}
}
```
	36.死锁代码。
	37.线程间通信要注意加锁，以及锁的唯一性。等待和唤醒必须是同一个锁。
	38.枚举是vector的特有的取出元素方式。
	39.可以用==比较arrayList元素值。
	40.关闭线程时，要考虑线程是否已经是开启状态
	41.ResultSet获取数据，要按照列的数据类型读取数据，不然会读取失败。
	42.frame需要一直获取键盘事件时，要设置button为isFocusable(false);
	43.在if下，try catch是整体，算一条语句，


******
	string a=*.substring(int );
	lastIndexOf(int)
*****
	参加黑马前需要掌握的基础：
	第一部分：语法，常量和变量，变量，函数，运算符，程序流程控制，数组。
	第二部分：对象，面向对象，类与对象。
	第三部分：API、Eclipse，IO，反射、代理和泛型。
	第四部分：多线程，网络编程，正则表达式。
	第五部分：HTML（DIV+CSS），JavaScript。
********
fileWriter中，write后务必要flush，最后要close。\r\n是换行。
格式化时间。
readline读取文本数据后要增添一句newline.
异常信息输出到日志文件。
字符匹配，切割，替换，替换注意("(.)\\1+","$1")，其中()是重用的意思，小数点代表任意字符。将两个以上的重复字符变为一个）。
泛型：明确了集合元素的唯一类型，避免应用时的强转。
可变参数。public void show(String name,int...arr){}其实是一种数组参数的简写形式。另类参数放在最前面。

使用Date类时候，要注明使用的是java.util.Date还是java.sql.Date.
Calendar是抽象类，要通过getInstance()方法实例化。
一般和静态方法可以加Synchronized锁,但锁会降低运行效率。
在程序中判定一个条件是否成立，WHILE 比IF 严密：WHILE 会防止程序饶过判断条件而造成越界。suspend（）是将一个运行时状态进入阻塞状态（注意不释放锁标记）。恢复状态的时候用resume()。Stop()
指释放全部。
这几个方法上都有Deprecated 标志，说明这个方法不推荐使用。
一般来说，主方法main()结束的时候线程结束，可是也可能出现需要中断线程的情况。对于多线程一般
每个线程都是一个循环，如果中断线程我们必须想办法使其退出。
如果主方法main()想结束阻塞中的线程（比如sleep 或wait）
那么我们可以从其他进程对线程对象调用interrupt()。用于对阻塞（或锁池）会抛出例外Interrupted。
可知Vector 较ArrayList 方法的区别就是Vector 所有的方法都有Synchronized。所以Vector 更为安全。Hashtable 较HashMap 也是如此。
File f=new File(“11.txt”);//创建一个名为11.txt 的文件对象
f.CreateNewFile(); //真正地创建文件
f.CreateMkdir()：创建目录

	5．对于命令：File f2=new file(“d:\\abc\\789\\1.txt”)
	这个命令不具备跨平台性，因为不同的OS 的文件系统很不相同。
	如果想要跨平台，在file 类下有separtor()，返回锁出平台的文件分隔符。
	File.fdir=new File(File.separator);
	String str=”abc”+File.separator+”789”;
	使用文件下的方法的时候一定注意是否具备跨平台性。
	I/O学习种常范的两个错误：1。忘了flush
	2．没有加换行。
	Serializable接口没有任何的方法，为标记接口。序列化中最有用的方法：
	（1）writeObject(Object b)
	（2）readObject();该方法返回的是读到的一个对象，但不会以返回null而是IOException来表示读到文件末尾。
	6． 序列化一个对象并不一定会序列化该对象的父类对象
	7． 瞬间属性（临时属性）不参与序列化过程。
	8． 所有属性必须都是可序列化的，特别是当有些属性本身也是对象的时候，要尤其注意这一点。序列化的集合就要求集合中的每一个元素都是可序列化的。
	9． 用两次序列化把两个对象写到文件中去（以追加的方式），和用一次序列化把两个对象写进文件的大小是不一样的。因为每次追加时都会要在文件中加入一个开始标记和结束标记。所以对于对象的序列化不能以追加的方式写到文件中。
	10/-3=1；
   
 **************
 
# JavaAPI总结:
API： application programming interface应用程序编程接口 

## 一、String、StringBuffer、StringBuilder
1、String类是字符串常量
2、String池：String s = "abc" 和String s = new String("abc")的区别
3、String类的常用方法：charAt、indexOf、toCharArray、substring、split、compareTo、equals
4、StringBuffer：字符串容器，长度可变，一般用于字符串的增减删的操作。reverse方法反向
String s = "abc"; s = s + "xxx";//String长度不可变，因为是常量
5、StringBuilder线程不安全，StringBuffer线程安全

## 二、集合类
```
|-Iterable：实现增强for循环
|--Collection:单列，按照一种或多种规则来存储一系列元素
|---List:有序，允许有重复元素
|----AbstractList：抽象类，实现了iterator方法。
|-----ArrayList：数组实现，查找块，增删慢
|-----Vector：和ArrayList一样，只是线程安全
|-----LinkedList：链表实现，查找慢，增删块
|---Set：无序，不允许有重复元素
|----HashSet：通过哈希算法保证元素不重复，对象要正确重写equals和hashCode方法

|----TreeSet：通过树状结构保证元素不重复，两种方式
 1、按照元素的自然顺序进行排序，前提是元素具备比较功能，实现了Comparable接口的compareTo方法
 2、在构造TreeSet实例时，传入一个比较器，实现Comparator接口的compare方法
 
|-Map：保存的是键值对应关系，其中键不允许有重复，可以通过keySet方法拿到一个包含所有键的Set
  再调用get(key)方法通过键拿到value
|--HashMap:通过HashSet的原理保证键不重复。
---HashTable：同步，线程安全
|--TreeMap：通过TreeSet的原理保证键不重复
|--Properties：用于读取配置文件，不需要声明泛型，因为键和值都只能为String类型。
 list方法将集合中的配置项输出到一个打印流
 load方法将一个输入流中的配置项存到集合中
Jdk1.5新特性泛型，减少集合存元素时错误发生的几率。
Jdk1.5出现Iterable，为了实现增强for循环  for(元素类型  变量：集合或数组)
```
工具类：
Collections：集合工具类，sort、binarySearch、reverse
Arrays：数组工具类，sort。。。。


## 三、包装类
1、Integer x = 0;x = x + 1; 装箱-拆箱-装箱（jdk1.5）
2、Interger.parseInt(String)将字符串转为int型

## 四、System类
1、System类的常用方法：gc()垃圾回收、exit(0)终止程序、currentTimeMillis()获得自1970年1月1日零时
 以来的毫秒数、getProperty方法获得系统属性。
2、两个静态成员变量：in和out
in：标准输入流，InputStreamReader类型
out：标准打印流，PrintStream类型

## 五、Runtime类
表示运行时，exec方法，在后台新开启一个窗口运行命令，是当前窗口的子窗口，继承所有窗口属性

## 六、日期对象
1、Date：大部分方法已过时，用new Date()创建日期对象表示当前时间
2、DateFormat：将日期格式化，抽象类
-  DateFormat df = DateFormat.getInstance(); 
	-  String dateStr = df.format(new Date);
-  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	- sdf.format(new Date());
3、Calendar对象：
 Calendar c = Calendar.getInstance();
可以将类中定义的常量当做参数传入get和set方法来获得和设置时间。
add方法，增加时间值，具体增加哪一项，就看传入的常量，调用完此方法，时间对象就被改变了。
 
 
 
