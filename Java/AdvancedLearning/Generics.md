# 泛型
> Java8上的泛型 

## 入门
>泛型程序设计划分为三个熟练级别 基本级别就是仅仅使用泛型类,典型的是像ArrayList这样的集合--不必考虑他们的工作方式和原因,大多数人会停留在这个级别.直到出现了什么问题. 当把不同的泛型类混合在一起的时候,或是对类型参数一无所知的遗留代码进行对接时,可能会看到含糊不清的错误消息.如果这样的话,就需要系统的进行学习Java泛型来系统地解决问题.  
> 泛型类可以看作普通类的工厂  -- Java核心技术卷 2004(1.5)  

### 简单使用
-  [简单泛型类示例](https://github.com/Kuangcp/JavaBase/blob/master/src/main/java/com/generic/simple/Pair.java)

> 类型变量使用大写的一个字母这是代表: E 集合的元素类型 KV 表示表的关键字和值的类型 T U S 等就表示任意类型

#### 类型擦除
- 不同于C++的泛型,C++是将模板类组合出来的生成一个新的类,Java则是进行类型擦除,然后再类型强转
- 例如 `public static <T extends Comparable> T min (T[] list)`
    - 擦除后就只剩下一个方法 `public static Comparable min(Comparable[] list)`
-  [泛型类擦除示例](https://github.com/Kuangcp/JavaBase/blob/master/src/main/java/com/generic/simple/DateInterval.java)

- 例如该方法签名 `public static  <T extends Comparable & Serializable> T getMax(T[]list)`
    - 限制了必须是实现了两个接口的类才能使用, 估计为了少创关键字所以使用的是extends关键字来表示T要实现两个接口
    - 同样的可以加在类的签名上,进行限制类的泛型类型 `public class Pair <T extends Comparable>{} `

> 在Java的继承中,可以根据需要拥有多个接口超类型,但限定中至多只有一个类,如果用一个类作为限定,他必须是限定列表中的第一个

#### 约束和局限性
- 不能使用基本类型实例化类型参数 
    - 也就是说没有`Pair<double>`只有`Pair<Double>`
    - 因为类型擦除后Object并不能放double的值, 但是这样做与Java语言中基本类型的独立状态相一致.
    - 当包装器类型(wrapper type)不能接受替换时,可以使用独立的类和方法处理他们 TODO 理解
- 运行时类型查询只适用于原始类型
- 不能抛出也不能捕获泛型类实例
- 参数化类型的数组不合法
- 不能实例化类型变量(T)
- 泛型类的静态上下文中类型变量无效
- 注意泛型擦除后的冲突