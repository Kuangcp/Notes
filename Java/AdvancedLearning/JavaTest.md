`目录 start`
 
- [有关Java的测试](#有关java的测试)
    - [单元测试](#单元测试)
    - [实现方案](#实现方案)
        - [使用JunitTest](#使用junittest)
            - [Idea上Junit的使用](#idea上junit的使用)
            - [Assert](#assert)
        - [Mock框架](#mock框架)
            - [DBUnit](#dbunit)
    - [感悟](#感悟)

`目录 end` |_2018-04-08_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 有关Java的测试
> [测试的基础理论](/Skills/Base/Test.md)

## 单元测试
> 单元测试(unit testing)，是指对软件中的最小可测试单元进行检查和验证。

****************
## 实现方案
### 使用JunitTest
> [官网](https://junit.org/junit4/) | [如何上手Junit](/MyBlog/how-to-use-junit.md) | [如何上手Junit5](/MyBlog/how-to-use-junit5.md)

- Before Test 执行顺序：
    - Before在Test之前执行是毋庸置疑的，但是如果有多个Before的话，按定义的先后逆序执行，也就是说AB顺序定义，BA顺序执行
    - `注意` Before的执行顺序不是平常想的那样，如果你有一个共享的对象，需要在两个Before中完成初始化，是办不到的，必然空指针

- 遇到的问题:
    - 如果在加了Test注解的方法中像Main方法一样的去开多个子线程对象并运行起来,并不会得到想要的结果
    - 这几个线程都是开了就立马关闭了,而且也是正常的退出码 0 
    - 原因:

#### Idea上Junit的使用
_可以使用TestMe插件_
- Ctrl Shift T 生成测试类 结合Mockit可以更好的模拟测试环境

#### Assert
> 断言 是程序员假定程序在某种情况下的状态情况，如果不是预期断言的情况就会抛出异常

- Assert.assertEquals(a,b) 断言两个对象是相等的
- assert(expression) 断言表达式为真

**************
### Mock框架
> 2017-06-21 14:36:54 对mock的使用很迷，还是需要稳定心态慢慢看文档才能理解
> [JMockit官方文档](http://www.vogella.com/tutorials/Mockito/article.html#testing-with-mock-objects)
- [入门博客](http://blog.csdn.net/chjttony/article/details/17838693)

#### DBUnit
> 基于Junit的一个数据库测试框架, 方便测试dao层

## 感悟

