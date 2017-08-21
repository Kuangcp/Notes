# Groovy
- Groovy 具有的Java所没有的语言特性 ：
    - 函数字面值（闭包）
    - 对集合的一等支持
    - 对正则表达式的一等支持
    - 对XML处理的一等支持 （一等表示内置，不需要调用类库）
- Groovy处理XML和循环遍历集合的方式要比Java简洁
- Groovy性能：如果你需要注重性能，Groovy不是一个好的选择，Groovy的对象都派生于GroovyObject，Groovy的方法都不是直接调用的而是反射执行的。虽然有invokedynamic关键字进行优化
    - 一些重活还是调用Java类库好些，毕竟是互通互用的，调用groovyserv类库能提高性能
## 安装配置
- [安装sdkman](./Linux/usually_app.md)
- `sdk install groovy`

- 新建文件 `println "Hello World!"` 然后 `groovy 文件`
    - 或者`groovy -e "println 'Hello World!'"`
    
## Groovy基础
> 作为一个脚本语言，和Python Ruby Smalltalk语法相似

- groovyc groovy 类似于 javac 和 java

### Groovy特性

#### 默认导入
#### 数字处理
#### 变量，动态和静态类型，作用域
#### 列表和映射语法

`注意：`
- 一个文件定义了文件同名class 类（默认加上public） 就不能当脚本运行
    - 因为作为一个脚本文件运行的时候，是创建一个与文件同名的类 并且 继承了 groovy.lang.Script 将你写的语句封装起来
    - 当你显式的定义了同名类 也会隐性继承于Groovy超类 groovy.lang.GroovyObject 类似与Java的Object，就会当一个正常的类文件，不能写脚本了
- def 方法不能命名为 run,如果有线程的存在

***************
- 输出：`println()` `print()` `printf()`

### Java调用Groovy
> [参考博客](http://www.tuicool.com/articles/i6raAv)


