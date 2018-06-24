`目录 start`
 
- [为何要使用测试](#为何要使用测试)
- [如何使用Junit](#如何使用junit)
    - [在Maven项目中](#在maven项目中)
    - [编码规范](#编码规范)
    - [常用注解](#常用注解)
        - [Rule注解的使用](#rule注解的使用)
    - [断言的使用](#断言的使用)
    - [参数化测试](#参数化测试)
    - [测试套件](#测试套件)
    - [分类测试](#分类测试)

`目录 end` |_2018-06-25_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 为何要使用测试
1. 帮助理解需求
    - 单元测试应该反映Use Case，把被测单元当成黑盒测试其外部行为。
1. 提高实现质量
    - 单元测试不保证程序做正确的事，但能帮助保证程序正确地做事，从而提高实现质量。
1. 测试成本低
    - 相比集成测试、验收测试，单元测试所依赖的外部环境少，自动化程度高，时间短，节约了测试成本。
1. 反馈速度快
    - 单元测试提供快速反馈，把bug消灭在开发阶段，减少问题流到集成测试、验收测试和用户，降低了软件质量控制的成本。
1. 利于重构
    - 由于有单元测试作为回归测试用例，有助于预防在重构过程中引入bug。
1. 文档作用
    - 单元测试提供了被测单元的使用场景，起到了使用文档的作用。
1. 对设计的反馈
    - 一个模块很难进行单元测试通常是不良设计的信号，单元测试可以反过来指导设计出高内聚、低耦合的模块。

***********************
_JUnit_
- 主要的三个特性： 
    - 用于测试预期结果和异常的断言， assertEquals()
    - 设置和 _拆卸_ 通用测试数据的能力， @Before @After
    - 运行测试套件的测试运行器

_一个基本的JUnit测试_
- @Before 标记方法， 测试运行前准备测试数据
- @After 标记方法， 测试运行完成后拆卸测试数据
- @Test 测试方法 例如：预期的异常`@Test(expected=NullPointException.class)`

# 如何使用Junit
## 在Maven项目中
> [参考项目](https://github.com/zhuifengshen/Junit4Demo)

_添加依赖_
```xml
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.11</version>
    <scope>test</scope>
</dependency>
```

_例如该项目结构_
```
├── pom.xml
└── src
    ├── main
    │   └── java
    │       └── com
    │           └── github
    │               └── kuangcp
    │                   └── Caculate.java
    └── test
        └── java
            └── com
                └── github
                    └── kuangcp
                        ├── AssertTest.java
                        └── CaculateTest.java
```

> 如果是Idea然后使用快捷键Ctrl Shift T即可自动创建测试类  

## 编码规范
- 手动创建则一般按照规范是:
    1. 包结构要和被测试类保持一致
    2. 创建一个Java类, 命名为被测试类名字后加上Test
    3. 测试具体的方法: test加上方法名
    4. 所有测试方法返回类型必须为void且无参数
    5. 测试方法里一般使用断言进行测试, 更为直观

*****************
## 常用注解
- [参考博客: JUnit4使用教程-快速入门](http://blog.csdn.net/chenleixing/article/details/44259453) | [参考博客: JUnit4单元测试入门教程](https://www.jianshu.com/p/7088822e21a3):
    1. @Test : 测试方法，测试程序会运行的方法,可设置参数
        - (expected=XXException.class) 期望该测试方法应该抛出某异常
        - (timeout=xxx) 限制该测试方法的执行时间, 超时视为失败
    2. @Ignore : 被忽略的测试方法
    3. @Before: 每一个测试方法之前运行
    4. @After : 每一个测试方法之后运行
    5. @BeforeClass: 所有测试开始之前运行, 在测试类还没有实例化就已经加载所以需要static修饰
    6. @AfterClass: 所有测试结束之后运行, 

### Rule注解的使用
> 也可以使用 `@Rule` 来规定测试类中所有测试方法  
```java
    @Rule 
    public Timeout timeout = new Timeout(1000);
```

*********************
## 断言的使用
> 使用 Hamcrest 工具能让断言更为简洁强大

1. 直接使用关键字 assert, 例如 `assert a == null`
2. 静态导入 `import static org.junit.Assert.*`, 使用其大量工具方法, 完整方法请查看源码
    - `assertNull(java.lang.Object object)` 检查对象是否为空 
    - `assertNotNull(java.lang.Object object)` 检查对象是否不为空 
    - `assertEquals(double expected, double actual, double delta)` 检查 指定精度 的double值是否相等 
    - `assertNotEquals(double expected, double actual, double delta)` 检查 指定精度 的double值是否不相等
    - `assertFalse(boolean condition)` 检查条件是否为假 
    - `assertTrue(boolean condition)` 检查条件是否为真 
    - `assertSame(java.lang.Object expected, java.lang.Object actual)` 检查两个对象引用是否引用同一对象（即地址是否相等） 
    - `assertNotSame(java.lang.Object unexpected, java.lang.Object actual)` 检查两个对象引用是否不引用统一对象(即地址不等) 
    - `assertArrayEquals(Object[] a, Object[] b)` 检查两个数组是否相等
    - `assertThat(T, Matcher<? super T>)` 检查泛型是否匹配
    - `fail(String string)` 依据入参并宣告测试失败


```java
public class AssertTest {
    @Test
    public void testEquals(){
        String a = "hi";
        String b = "hi";
        // 使用assert关键字
        assert a.equals(b);
        // 使用Assert类的静态工具方法
        assertEquals(a, b);
        assert a == b;
        assertSame(a, b);
        // 因为trim 调用了SubString方法， 而这个方法是返回一个new的字符串
        String c = "h"+"i".trim();
        assertEquals(a, c);
        assertSame(a, c);
    }
    @Test
    public void testFail(){
        fail();
        fail("测试失败");
    }
}

```

## 参数化测试
> Junit 4 参数化测试 允许通过变化范围的参数值来测试方法 | 个人认为: 将测试方法的入参集合数据和测试行为分离开, 简化书写逻辑

1. 对测试类添加注解 `@RunWith(Parameterized.class)`
2. 将需要使用变化范围参数值测试的参数定义为私有变量；
3. 使用上一步骤声明的私有变量作为入参，创建构造函数；
4. 创建一个使用`@Parameterized.Parameters`注解的公共静态方法，它将需要测试的各种变量值通过集合的形式返回；
5. 使用定义的私有变量定义测试方法；

```java
// 1
@RunWith(Parameterized.class)
public class CaculateTest {
    // 2
    private double numA;
    private double numB;
    // 3
    public CaculateTest(double numA, double numB) {
        this.numA = numA;
        this.numB = numB;
    }
    // 4
    @Parameterized.Parameters
    public static Collection<Object[]> data(){
        Object[][] data = new Object[][]{
                {2, 4},
                {3, 5}
        };
        return Arrays.asList(data);
    }
    // 5
    @Test
    public void testAdd() throws Exception {
        Caculate caculate = new Caculate();
        double result = caculate.add(numA, numB);
        System.out.println("input "+numA+" + "+numB+" = "+result);
        assert result != 0;
    }
    // 别的方法也是可以一样的使用, 而且所有的测试方法都受到了影响 都会迭代多次
    @Test
    public void testDevide(){
        double result = caculate.devide(numA, 3);
        System.out.println("input "+numA+" + "+3+" = "+result);
        assert result != 0;
    }
}
```
> 最后执行testAdd 测试方法的结果是: 将data方法返回的数据迭代执行testAdd, 

## 测试套件
> Junit 4允许通过使用测试套件类批量运行测试类 | 批量执行测试类, 组装为一个套件,一起执行

- 在当前测试类上加上如下注解: 
    - `@RunWith(Suite.class)` 
    - `@SuiteClasses(TestClass1.class, TestClass2.class)`
- 那么在执行当前测试的时候会依次执行注解中那些测试类

```java
@RunWith(Suite.class)
@Suite.SuiteClasses({AnnotationTest.class, EvenNumberCheckerTest.class})
public class SuiteTest {
}
```
_注意最好不要在该测试类中书写测试方法, 因为运行不了, 但是如果写了, 直接运行该测试类却又不会受影响_

## 分类测试
>　[参考博客](http://blog.csdn.net/wanghantong/article/details/28897103) |  [JUnit4--- @Annotation注解总结](http://blog.csdn.net/neven7/article/details/42836413)


