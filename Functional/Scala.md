# Scala

## 安装
- 通过sdkman安装，或者下载解压配置环境变量 [sdkman使用](/Skills/usually_app.md)

## 基础了解
`特性`
- Scala语言的精炼，包括类型推断的能力
- match 表达式， 以及模式和case类等相关概念
- Scala的并发，采用消息和acto机制，而不是像Java代码那样用老旧机制的锁机制

`简洁的基础语法`
- 类的定义和类的构造方法是同一个东西。Scala中可以有其他的辅助构造方法，
- 类默认是公开的，所以没必要加上public关键字
- 方法的返回类型是通过类型推断确定的，但要在定义的方法的def从句中用等号高数编译器做类型推断
- 如果方法体只是一条语句或表达式， 那就没有必要用大括号括起来
- Scala不像Java一样有原始类型。数字类型也是对象


*******************************
```
object HelloWorld {
    def main(args:Array[String]){
        val hello = "Hello World!"
        println(hello)
    }
}
```
`针对这个简单示例的语法特性`
- 关键字object声明这个类是单例类
- main方法 缺省了关键字 public static 
- 不必声明hello的类型，编译器会自行推断
- 无需声明main方法的返回类型 编译器会自动设为 Unit 等价于Java中的void
- 和Java Groovy不一样的是，变量的类型在变量之后
- 方括号 [] 表示泛型，所以类型参数的表示方法是Array[String] 不是 String[]
- Array是纯正的泛型
- 集合类型必须指明泛型 不能像Java那样声明生类型（指不带类型参数的泛型类或接口。）
    - 例如泛型类 Box<T> 创建其参数化类型时要指明类型参数的真实类型 Box<Integer>intBox = new Box<>(); 
    - 如果忽略了类型参数，Box rawBox = new Box();则是创建了一个生类型
- 分号绝对是可选的
- val 就相当于Java中的final变量，用于声明一个不可变量
- Scala应用程序的初始入口总是在Object中


`match表达式`
- 最简单的match用法跟Java的switch差不多，但是match表达力更强
```
var transFer = args(0) match{
    case "one" => "1"
    case "Two" => "2"
    case _ => "Error: '"+args(0)+"' "
}
println(transFer)
```
- 从语言的纯粹性来看，Scala语法比Java更清晰，也更正规：
    - 默认case 不需要另外一个不同的关键字
    - 单个case 不会像Java那样进入下一个case，所以也就不需要break
- 关键字var 用来声明一个可变（非final）变量。没有必要尽量不要使用它
- 数组用圆括号访问 argvs(0) 就是main方法的第一个参数
- 默认case 就是case _
- Scala支持间接方法调用，所以可以把args(0).match({...}) 写成 args(0) match({...})

```
def autoType(obj: Any) = obj match{
    case s: String => s.length
    case i: Int  => 4
    case _:   => -1
}
```
- 这个方法以一个未知类型值为参数，然后用模式分别处理String Int类型的值

`case类`
- match 表达式的最强用法之一就是和case类（可以看成是枚举概念面向对象的扩展）相结合
- 例如一个 温度过高发出警告的例子：
    - `case class TemperatureAlarm(temp: Double)` 这一行就定义个一个有效的case类，相比于Java简化了很多
    - `var alarm = TemperatureAlarm(99.9)` 创建case实例不需要关键字 new
    - 这进一步强化了case类是类似于 参数化枚举类型 或某种形式的值类型的观点
- Scala中的相等：Scala认为Java用 == 表示引用相等是个错误。所以在Scala中，== 和 equals是一样的，如果需要判断引用相等，可以用 ===
    - case类 equals 方法只有在两个实例的所有参数值都一样时才会返回true
- caes类和构造器模式非常合

`actor`
- Scala选择actor机制来实现并发编程。提供了一个异步并发模型，通过在代码单元间传递消息实现并发。这种并发模型比Java提供的基于锁的机制，默认共享的并发模型更易用，不过Scala的底层模型也是JVM


## 适合Scala使用的场景

### Scala和Java的比较
- ![比较Scala和Java]()
该表主要对这两种语言的主要差异做了汇总，语言的表皮层是指该语言关键字的数量和开发人员用它干活必须掌握的独立语言结构的数量











