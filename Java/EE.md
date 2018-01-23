`目录 start`
 
- [JavaEE](#javaee)
    - [1.【JSP/Servlet】](#1jspservlet)
    - [2.【几大框架简述】](#2几大框架简述)
    - [3.【Hibernate基础配置】](#3hibernate基础配置)
        - [3.1【JDBC 和 Hibernate 比较】](#31jdbc-和-hibernate-比较)
            - [3.1.1【配置流程】如果后续需要添加表的话，就这个顺序](#311配置流程如果后续需要添加表的话就这个顺序)
        - [3.2 Hibernate必须JAR：【Hibernate 3.6】](#32-hibernate必须jarhibernate-36)
        - [3.3 编写数据库表对应框架持久层的对象：](#33-编写数据库表对应框架持久层的对象)
        - [3.4 编写hibernate.cfg.xml文件 一般在src目录下](#34-编写hibernatecfgxml文件-一般在src目录下)
        - [3.5日志文件的配置：](#35日志文件的配置)
        - [3.6 SessionFactory 和 Session 比较：](#36-sessionfactory-和-session-比较)
        - [3.7 OID的作用：](#37-oid的作用)
        - [3.8 【id 生成策略】：](#38-id-生成策略)
        - [3.9 【非普通类型】](#39-非普通类型)
    - [4.【Hibernate对象的关联配置】](#4hibernate对象的关联配置)
        - [4.1 一对多的配置](#41-一对多的配置)
            - [**注意 ：**](#注意-)
        - [4.2【多对多的配置】](#42多对多的配置)
            - [4.2.1 学生方 配置](#421-学生方-配置)
            - [4.2.2 课程方 配置](#422-课程方-配置)
        - [4.3 【一对一的配置】](#43-一对一的配置)
        - [4.4【使用多对一的技巧】](#44使用多对一的技巧)
            - [4.4.1.添加记录：](#441添加记录)
            - [4.4.2.删除记录](#442删除记录)
        - [4.5 【继承关系的配置】 分两种，一般使用前者：](#45-继承关系的配置-分两种一般使用前者)
        - [4.6.【Hibernate 异常】](#46hibernate-异常)
            - [4.6.1 could not find a getter for](#461-could-not-find-a-getter-for)
            - [4.6.2 个人总结：](#462-个人总结)
        - [4.7.【Hibernate对象的状态】](#47hibernate对象的状态)
            - [4.7.1 Session的方法。](#471-session的方法)
            - [4.7.2 特别注意：](#472-特别注意)
    - [7 【Mybatis】](#7-mybatis)
        - [7.1 xml文件配置：](#71-xml文件配置)
            - [主配置文件：](#主配置文件)
                - [操作配置文件：](#操作配置文件)
        - [7.2 导入JAR包：](#72-导入jar包)
        - [7.3 创建SqlSessionFactory类 内容：](#73-创建sqlsessionfactory类-内容)
            - [maven Spring-mybaits 配置](#maven-spring-mybaits-配置)
                - [**SessionFactory类，使用Spring注入一个工厂类，然后使用本地线程组，节省Session开销**](#sessionfactory类使用spring注入一个工厂类然后使用本地线程组节省session开销)
        - [7.4 流程控制](#74-流程控制)
            - [foreach 循环语句](#foreach-循环语句)
                - [collection 有 arry list map 几种 还有item是必写，其他的是可选的](#collection-有-arry-list-map-几种-还有item是必写其他的是可选的)
            - [if 判断语句:](#if-判断语句)
            - [set 方便书写update语句](#set-方便书写update语句)
            - [choose 相当于switch语句](#choose-相当于switch语句)
                - [$和的区别：](#$和的区别)
    - [8.【Spring】](#8spring)
        - [8.1 基本JAR包：](#81-基本jar包)
                - [maven配置Spring包](#maven配置spring包)
        - [8.2 Spring技巧](#82-spring技巧)
            - [8.2.1 获取Spring已有的Context环境](#821-获取spring已有的context环境)
                - [【在JSP或Servlet中】](#在jsp或servlet中)
            - [Spring 和 ServletContextList](#spring-和-servletcontextlist)
        - [8.3 注解方式：](#83-注解方式)
            - [8.3.1 Application.xml中配置头部分](#831-applicationxml中配置头部分)
            - [8.3.2 常用的注解：](#832-常用的注解)
        - [8.4 xml方式：](#84-xml方式)
        - [8.5 IOC / DI：控制反转](#85-ioc--di控制反转)
        - [8.6 AOP：](#86-aop)
            - [8.6.1 基本概念](#861-基本概念)
            - [8.6.2 基本配置](#862-基本配置)
            - [8.6.3 JDBC](#863-jdbc)
            - [8.6.4 注意](#864-注意)
        - [8.7 Spring-Websocket 配置](#87-spring-websocket-配置)
                - [maven配置jar环境](#maven配置jar环境)
        - [8.0 xml方式和注解方式的比较：](#80-xml方式和注解方式的比较)
            - [1 Spring AOP还是完全用AspectJ？](#1-spring-aop还是完全用aspectj？)
            - [2 Spring AOP中使用@AspectJ还是XML？](#2-spring-aop中使用@aspectj还是xml？)
            - [3 混合切面类型](#3-混合切面类型)
    - [9 【SpringMVC】](#9-springmvc)
        - [9.1 必要JAR包：](#91-必要jar包)
        - [9.2 实现逻辑](#92-实现逻辑)
        - [9.3 controller的配置](#93-controller的配置)
            - [9.3.1类型转换（也可以使用Hibernate的convert）](#931类型转换（也可以使用hibernate的convert）)
                - [SpringMVC的内置代理](#springmvc的内置代理)
                - [Hibernate的covert包](#hibernate的covert包)
            - [Controller层的异常处理（一般处理自定义异常）](#controller层的异常处理（一般处理自定义异常）)
            - [拦截器机制](#拦截器机制)
            - [视图解析](#视图解析)
            - [上传下载](#上传下载)
            - [JSON的解析](#json的解析)
    - [10.【SSH框架的整合】](#10ssh框架的整合)
    - [11.【SSM框架的整合】](#11ssm框架的整合)
    - [12.【Redis的使用】](#12redis的使用)
        - [12.1 【Java 使用 redis 配置】](#121-java-使用-redis-配置)

`目录 end` *目录创建于2018-01-14*
****************************************
# JavaEE

*******************
## 2.【几大框架简述】
* MVC设计模式：
    * M
        * hibernarte （相应操作的SQL语句由Hibernate框架生成）
        * mybatis（SQL用户根据需要去写的）
        * JPA 和Hibernate是相同的内核，由Hibernate派生而来
    * C
        * struts1.x
        * struts2.x
        * springmvc  
        * spring  模块的整合
    * V:
        视图层
- **再度理解** Dao service模式的概念
    * dao : 基础单笔业务的功能模块
    * service : 将单个的dao组合一起，得到复杂的业务逻辑
    * 如果要实现AOP或者规范化，dao和service分别要有接口的存在（为了多态，代理，严谨）


*************************************************************************************   
## 3.【Hibernate基础配置】
### 3.1【JDBC 和 Hibernate 比较】
* JDBC
    *   使用其简洁精悍，最快，但是使用时接收数据以及多方面的比较麻烦
* Hibernate
    *   单表操作是很便捷的，但是涉及到多表复杂操作时比较麻烦

#### 3.1.1【配置流程】如果后续需要添加表的话，就这个顺序
- **1 :**  先有数据库和表，建立cfg.xml文件配置好数据库的基本参数
- **2 :**  使用工具建立POJO持久类
- **3 :**  导入Hibernate所必需JAR包，最好使用Myeclipse的配置，自己导包总有一堆错误
- **4 :**  使用MyEclipse自动创建hbm.xml文件，还有各种文件。配置好hbm文件里关于表间关系的映射，或者在Myeclipse配置时手动选择
- **5 :**  配置好DAO类中事务开启和关闭，以及各种所必需的配置，若表没有设立主键，那么POJO类需要继承自动生成的抽象类（含有主键）
- **6 :**  调用DAO或者自己的Utils类，通过Hibernate来操作数据库

### 3.2 Hibernate必须JAR：【Hibernate 3.6】
- required目录下所有JAR都要导入
- jpa的JAR包（做注解用）
- 日志包：
    - slf4j-api-* .jar  该包是一个日志接口，需要一个JAR包的实现：
    - slf4j-log4j12.jar 该包是转换的JAR包
    - log4j-1.2.11.jar  实现的JAR包
- 数据库驱动包  mysql-connector-java-5.1.7-bin.jar
- 在src同级目录下新建一个lib目录，把JAR包复制进去，然后右击将jar文件  Add to build path 加入到类搜索路径里

### 3.3 编写数据库表对应框架持久层的对象：
- 使用自己的工具类创建到对应的包下，或者用相关工具生成，类型要自己多加注意

### 3.4 编写hibernate.cfg.xml文件 一般在src目录下
- 数据库连接属性 驱动，url，用户名，密码
- 数据库方言 
- 辅助配置
- POJO类配置文件的映射
- etc/hibernate.properties里可以看到更多配置，数据库连接池，SQL优化等
- 在：project/core/src/main/resources/org/hibernate/下有各种dtd文件，
    - 可以为eclipse的xml配置自动提示功能
### 3.5日志文件的配置：
    在etc下复制log4j.properties到src下，就可以了，本人ssh下复制log4j.xml就可以了

### 3.6 SessionFactory 和 Session 比较：
* 【SessionFactory】 
>   重量级容器：消耗大量资源，不能有太多实例,二级缓存
    通常将该工厂类是单例模式，一个工厂类实例表示一个数据库
    所以Hibernate一般是不能跨数据库来做事务操作。但是EJB和JPA可以实现
    >> 这个配置选项：
    hibernate.hbm2ddl.auto create-drop 在一个数据库中创建，然后使用完关闭实例时就删除所有建立的表
    hibernate.hbm2ddl.auto create 清除数据库的表及数据，重新创建表
    hibernate.hbm2ddl.auto update 更改配置文件，能够在数据库进行操作（更新，建立）
    hibernate.hbm2ddl.auto validate

* 【session】
>   轻量级的容器，一级缓存
    是非线程安全的对象

### 3.7 OID的作用：
> 在Hibernate中唯一标识对象的属性，每个实体都是必须要有OID的

### 3.8 【id 生成策略】：
* assigned：要求用户去手动指定对象的OID；该对象ID的类型可以是任意的
* identity：MySQL的自动生成
* native：数据类型是数值型，id的生成策略为数据库底层自增长（数据库自己去决定使用哪种方式，MySQL用identity，Oracle用序列等）
* sequence：Oracle数据库推荐，数值型（Long）
* seqhilo oracle :推荐使用的策略，使用序列来搭配高低机制
* uuid.hex :32位字符
* uuid:
* hilo：类型为数值型（long） [实际开发中推荐使用]
>   id = hi+lo (高位和低位进行组合)
    sessionFactory实例化，高位就会加一，生成算法是：hi*(max lo +1)+lo;
    `<generator class="hilo" >`
    `<param name="table">stu_hilo</param>`
    `<!-- 放高值的表名 最好是一个对象对应于一个高低值的表避免了并发-->`
    `<param name="cloumn">next_hi</param>`
    `<!-- 高的值放在表的哪个字段 -->`
    `<param name="max_lo">100</ param>`
    `<!-- 每个轮回值的上限是多少 虚拟机启动频繁就设小一些，避免编码的浪费-->`
    `</generator>`

### 3.9 【非普通类型】
* Set集合：

```xml
    <set name="Nos" table="表">
        <key column="外码"></key><!-- 外码 是必须的 -->
        <element column="号码" type="string"/>
    </set>
```
* List集合:

```xml
    <list>
            <key></key>
            <index></index>
            <element></element>
    </list>
```
* 查询列 属性：
`<property name="" formula="(select sum() from 选修表 as u where u.id=id)"></property>`

****************************************************************
## 4.【Hibernate对象的关联配置】
### 4.1 一对多的配置
* 注意：一定要两个都有oid的情况才能配置一对多的映射,不能是依赖于另一个主键类
* 一方：

```xml
    <set name="" [cascade=""]> 
        <key column="这是外键"></key>
        <one-to-many class="多方的类"></one-to-many>
    </set>

```
* 多方：
`<many-to-one name="" class="一方的类" column="外键，key要一致" />`
* 双向的关联，会有update的SQL语句的执行来维护关系，影响效率
* 多方维护：一方中set标签加inverse="true"一方就不会维护，代码一定要多方执行set**(*)
* 一方维护：一方代码一定要执行**.add*()

####  **注意 ：**
- 1.在一的一方，修改xml文件，添加一个set 属性，表示 多方 的一个集合
```xml
<set name="类中属性名（集合）" inverse="true">
    <key>< column name="数据库列名"/></key>
    <one-to-many class="多方类路径"/>
</set>
```
- 2.在一的一方，修改POJO持久类文件，添加一个hashset，用来存储多方，添加setget方法，名字就是配置文件里添加的那个名字 注意修改构造器

- 3.在多的一方，修改xml文件，置换掉那个外键，换成many-to-one标签，里面写上外键的列
`<many-to-one name="类中属性名（对象）" class="一方的类路径" column="数据库中列名"></many-to-one>`

- 4.在多的一方，修改POJO持久类文件，添加一个一方的对象添加setget方法，名字就是配置文件里添加的那个名字  注意修改构造器
    * 一方的set集合中有inverse属性，多方是没有的，Hibernate中inverse是和外键对应的，一方配置了inverse是false，一方就不会维护关系（外键），一般是给多方维护，因为效率高
    * cascade是对象和对象之间的操作，和外键没有关系
    * 处于持久化状态的对象在Session中，客户端不需要做Session的save/update 操作，Hibernate会自动的去检查处于持久化的对象的状态的属性是否发生改变，改变了就发送update语句。
        * 如果该对象是一方，在一的一方映射文件中有cascade=all时，Hibernate内部还会检查该持久化对象关联的集合，对此集合进行update操作，但是该操作和外键没有关系，只有当通过多方建立关系后，才能使外键有值。
    

### 4.2【多对多的配置】

* 关系在第三方表中，和两张表本身没有关系
* 多对多维护关系，谁都能维护关系（效率是一样的）维护一般是在页面上进行的
* table 是多对多的中间表（存放了一个关系）
* key中的column一般是填当前配置文件中的id
* 多对多的配置是需要两个外键的
* 如果使用了反转并使用了级联，就只会保存实体，但是关系是没有维护的（就是不会插入到第三方表），和一对多一样的（一对多是外键列没有值）。
* ！！如果双方都级联了，必须要有一方inverse，不然会有重复维护的错误发生

#### 4.2.1 学生方 配置
```xml
    <set name="students" table="student_course">
        <key column="cid"></key>
        <many-to-many class="Student" column="stu_id"></many-to-many>
    </set>
```
#### 4.2.2 课程方 配置

```xml
    <set name="courses" table="student_course">
        <key column="stu_id"></key>
        <many-to-many class="Course" column="cid"></many-to-many>
    </set>
```

***********************************

### 4.3 【一对一的配置】
* 单向
    只要配置单向的配置文件添加：
    `<many-to-one name=""class="映射的类" column="数据库字段" unique="true"></many-to-one>`
* 双向
    * 一方 甲：
    `<many-to-one name="" class="乙方类"column="数据库字段" unique="true"></many-to-one>`
    * 一方 乙：
    `<one-to-one name="" class="甲方类" property-ref="甲方配置的标签的name"></one-to-one>`

********************
### 4.4【使用多对一的技巧】
#### 4.4.1.添加记录：
    1.1.当需要添加一个多方时，一看成课程，多看成成绩。当然的首先得有相关课程，再添加成绩记录。
    1.2.那就先实例化一个课程对象，配置好信息
    1.3.实例化多个成绩实例，再 课程对象.get**Set().add(成绩对象); 将成绩对象添加到集合中，
    1.4.session.save(课程对象)；
注意：既然实现了这样的操作，那就说明了在实例化成绩的时候，不需要指定课程的值，那就需要添加一个构造器
#### 4.4.2.删除记录
    2.1.如果删除一方，那就会将一删除，如果没有配置级联，就会将多方的外键置空，不会删除多方表
    2.2.如何通过一方修改多方的一条
            把一方的set中的要修改的一条，（查找之前需要对象 = session.load(对象.class,主键名)将多方的数据加载进来）
            注意多方不能有空列必须指定一个默认值（是和构造器有关么？）
            再查找出来，修改再update，新增也是如此增加多的一方的时候，就是在一方的set中新增一条记录，多方的操作都体现在了一方那里

*****************************************
### 4.5 【继承关系的配置】 分两种，一般使用前者：
```xml
    <!-- 将子类插入到父类的配置文件 需要使用key来关联的-->
        <joined-subclass name="cn.hibernate.extend.Student" table="extend_student">
            <key column="id"></key>
            <property name="sru_id" type="long"></property>
        </joined-subclass>
    <!--
        union是相当于将父类的所有属性复制到子类里，是共享父类的OID，
        所以父类的OID是不能和子类的OID重复的
        不然 查询的时候就会报错,
        所以就需要改父类的主键生成策略是高低值（或者是手动set），可以手动配置高低值的表的生成
    -->
        <union-subclass name="cn.hibernate.extend.Student" table="union_student">
            <property name="sru_id" type="long"></property>
        </union-subclass>
```
*******************************************************
### 4.6.【Hibernate 异常】
#### 4.6.1 could not find a getter for
    原因：1 可能真的没写get方法，或者get方法不合规范 setget方法中不允许两个连续大写字母
         2 *.hmb.xml文件中的属性名和pojo持久类中属性名不一致（一定不能在表名中添加下划线）
         3 方法名写错（基本不可能，都是自动生成的）
        
#### 4.6.2 个人总结：
    当使用了没有 主键的表，使用Myeclipse自动创建配置文件，使用自己的Table2Class来生成POJO持久类，
    就要继承对应的自动创建的抽象类，因为没有主键的表默认是将所有列看成一个主键，并且还会有添加一个id属性，
    这样也说明还有一点就是，这种表的字段不能有叫做id的列

    是不是可以不用手动去使用那个类，好像这里自动生成的一切都有，

    自动生成会生成：
        对应POJO的抽象类，hbm配置文件，以及默认的几个类，HibernateSessionFactory，IBaseHibernateDao，
        对应的Dao（添加的时候默认是没有使用事务，所以需要手动修改）,添加，删除，都是依据主键的，
        至少要初始化主键，当然还得满足数据库的要求

### 4.7.【Hibernate对象的状态】
> 主要是对象内存和Session中的状态区别，而不是Session和数据库

-  `临时态`：刚实例化对象。对象在数据库中不存在，Session中也不存在
-  `游离态`：刚实例化的对象，但是该对象手动指定了OID并且OID在数据库中已经存在，并且是没有绑定Session的（特殊的临时态）
    * 保存两个有关联关系的对象，update时，如果配置文件中配置了级联，就会一起保存，一般建议在一方级联
-  `持久态`：该对象在数据库中存在，该对象绑定在Session（一级缓存）中
-  `删除态`：session.delete(对象)，删除后对象从数据库和Session中都移除了，但是OID还在内存中。
    * 游离态delete后就成了删除态
    * 持久态delete后就成了删除态

#### 4.7.1 Session的方法。
- save
- update
- delete 
- saveOrUpdate 由入参的OID来自动选择是要save还是update
- merge 形参：临时态的对象。形参和Session没有任何关系，返回对象Object2（持久化对象），所以在Session关闭的时候Object2的更改会同步到数据库中
- get 将数据库中指定对象获取为持久态，查不到就是返回null
- load 懒加载。使用代理对象，延迟加载。用到了别的属性就去查数据库。查不到就抛异常
- flush 刷新Session
- evict 定点清除 将指定的对象从Session中移除，变成游离态
- clear 全部清除 
- close

#### 4.7.2 特别注意：
* 一个对象（内存）不能存在于多个Session中，一个存，一个改的情况是会错误的
* 但是数据库中同一条记录可以实例化为多个对象（内存），那么这些对象（内存）放在不同的Session中是可以的

* get：
    * 只延迟加载有外键关联的那部分属性，没有使用就不会查询，只有用到了才会查询
    * 多方：立即加载就要在配置文件中将对应的属性中添加 fetch="join"
    * 一方：配置文件中set标签 加上lazy="false"（两条SQL），再添加 fetch="join"后就只有一条SQL语句，但是这个一方是不能做分页查询的
* load：
    * 在你确定OID是一定有的时候使用load提高效率，但是实际开发过程中用的少，因为实际上没有这么确定。

* 懒加载如果Session关闭了或者是对象游离态。就会有懒加载初始化的异常

******************************************************

## 7 【Mybatis】
### 7.1 xml文件配置：
- 创建mybatis-config.xml文件
    - 该文件是主配置文件，配置了sessionFactory
- 创建generatorConfig.xml文件
    - 是各种操作的配置，一个操作对应一个SQL的配置

#### 主配置文件：
```xml
    <?xml version="1.0" encoding="UTF-8" ?>
    <!DOCTYPE configuration
    PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-config.dtd">

    <configuration>
    <!-- 配置别名 为了方便配置操作文件--> 
    <typeAliases> 
        <typeAlias type="cn.mybatis.test.Human" alias="Human" />  
    </typeAliases> 
       
    <!-- 配置环境变量 --> 
    <environments default="development">
        <environment id="development">
            <transactionManager type="JDBC"/>
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://localhost:3306/test?characterEncoding=UTF-8"/>
                <property name="username" value="root"/>
                <property name="password" value="123456"/>
            </dataSource>
        </environment>
    </environments>
    <!-- 配置mappers --> 
    <mappers> 
        <mapper resource="cn/mybatis/test/HumanDao.xml" />  
    </mappers> 
    </configuration>
    
```
##### 操作配置文件：
```xml
    <?xml version="1.0" encoding="UTF-8" ?> 
    <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd"> 
    <mapper namespace="cn.mybatis.test"> 
        <!-- 按id查询 -->
        <select id="queryUsersById" parameterType="Human" resultType="Human">  
            <!-- useCache="false" -->
            <![CDATA[ 
          select * from inserts t where t.id=#{id}
          ]]>  
        </select>  
        <!-- 查询全部 -->
        <select id="queryUsers" resultType="Human">
            select * from inserts
        </select>
        <!-- 插入记录 -->    
        <insert id="insertUser" parameterType="Human" >
        <!-- 该字段是必须要在数据库中自增长的
            可能会有并发问题
            useGeneratedKeys="true" keyProperty="id"
            所以用查询方式好点， 写语句就不要考虑主键了
         -->
            <selectKey resultType="int" keyProperty="id">
                select LAST_INSERT_ID()
            </selectKey>
            insert into inserts (name) values(#{name})
        </insert>
        <!-- 删除记录 -->
        <delete id="deleteUser" parameterType="String">
            delete from inserts where id=#{id}
        </delete>
        <!-- 更新记录 -->
        <update id="updateUserById" parameterType="Human">
            update inserts set name=#{name} where id=#{id}
        </update>
    </mapper> 
```
### 7.2 导入JAR包：
- **核心包**
- mybatis-3.4.1.jar 主包
- dom4j-1.6.1.jar 日志记录
- log4j-1.2.15.jar
- slf4j-api-1.5.8.jar
- slf4j-log4j12.jar

### 7.3 创建SqlSessionFactory类 内容：
```java
    private static SqlSessionFactory sessionFactory;
    static{
        try {
            String resource = "cn/mybatis/test/mybatis-config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("获取Session失败");
        }
    }
    
    /**
     * 获取Session
     * @return
     */
    public static SqlSession getSession(){
        SqlSession session = null;
        session = sessionFactory.openSession();
        return session;
    }
```

#### maven Spring-mybaits 配置
- 使用Spring自动注入对象,方便别名和SessionFactory的管理
- pom引入必须的JAR包就可以了

```xml
      <!--基本属性-->
      <bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
           <property name="driverClass" value="${driver}"/>
           <property name="jdbcUrl" value="${url}"/>
           <property name="user" value="${username}"/>
           <property name="password" value="${password}"/>
           <property name="initialPoolSize" value="${initialSize}"/>
           <property name="maxPoolSize" value="${maxSize}"/>
       </bean>
       <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
           <property name="dataSource" ref="dataSource"/>
           <!--操作配置文件的路径-->
           <property name="mapperLocations" value="classpath:bean/*.xml"/>
           <!--bean的路径，进行别名的自动扫描-->
           <property name="typeAliasesPackage" value="com.book.bean"/>
       </bean>
       <bean id="mybatisSessionFactory" class="com.book.dao.MybatisSessionFactory">
           <property name="sessionFactory" ref="sqlSessionFactory"/>
       </bean>
       <!--定义数据源-->
       <tx:annotation-driven transaction-manager="transactionManager" />
       <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
           <property name="dataSource" ref="dataSource"/>
       </bean>
```

#####  **SessionFactory类，使用Spring注入一个工厂类，然后使用本地线程组，节省Session开销**

```java

    @Component
    public class MybatisSessionFactory {
       @Autowired
       private  SqlSessionFactory sessionFactory;
       // 日志
       private static org.slf4j.Logger Log = LoggerFactory.getLogger(MybatisSessionFactory.class);
       //使用本地线程组能避免不必要的Session开支，加强性能
       private static final ThreadLocal<SqlSession> THREAD_LOCAL = new ThreadLocal<SqlSession>();
       /**
        * 获取Session
        * @return
        */
       public  SqlSession getSession(){
           SqlSession session = (SqlSession)THREAD_LOCAL.get();
           if(session==null ){
               session = this.sessionFactory.openSession();
               THREAD_LOCAL.set(session);
           }
           Log.info("__获取了一个Session__"+session);
           return session;
       }
       /*
           关闭连接
        */
       public void closeSession(){
           SqlSession session = (SqlSession)THREAD_LOCAL.get();
           THREAD_LOCAL.set(null);
           if(session!=null){
               session.close();
           }
       }
       public  SqlSessionFactory getSessionFactory() {
           return sessionFactory;
       }
       public  void setSessionFactory(SqlSessionFactory sessionFactory) {
           this.sessionFactory = sessionFactory;
       }
    }
```

### 7.4 流程控制

#### foreach 循环语句
```xml
    <foreach collection="param_list 自定义的话就是Map中的key，或者使用 @Param("")来指定 " item="params" index="currentIndex 当前索引"  separator="循环分隔符" open="在循环前加上字符" close="循环结束后加上字符">
        ${params}
    </foreach>
```
##### collection 有 arry list map 几种 还有item是必写，其他的是可选的
#### if 判断语句:
- `<if test=""></if>`

#### set 方便书写update语句
- `<set><if test="col!=null">col=#{col},</if></set>`

> mybatis会自动去除多余的逗号，但是每一行书写要写逗号

#### choose 相当于switch语句
- `<choose><when test=""></when></choose>`

#### $和#的区别：
- \$ 会有SQL注入的漏洞，#则没有
- 使用$ 是SQL进行String的拼接，使用#是preparstatement的预处理然后注入
- 使用#的时候出现这个问题
2017-01-22 11:16:11.046 [main] DEBUG myth.book.getAll_Param_BookType - ==>  Preparing: select * from book_type where ? and ? and 1=1; 
2017-01-22 11:16:11.136 [main] DEBUG myth.book.getAll_Param_BookType - ==> Parameters:  book_type<10 (String),  'father_type='2 (String)
- 条件不能使用数值，
    条件是单独使用时也是String但是是有效的

*********************************************************

## 8.【Spring】
### 8.1 基本JAR包：
- aspectjtools.jar
- com.springsource.org.aopalliance-1.0.0.jar
- com.springsource.org.apache.commons.logging-1.1.1.jar
- spring-aop-3.2.6.RELEASE.jar
- spring-aspects-3.2.6.RELEASE.jar
- spring-beans-3.2.6.RELEASE.jar
- spring-context-3.2.6.RELEASE.jar
- spring-core-3.2.6.RELEASE.jar
- spring-expression-3.2.6.RELEASE.jar

****

##### maven配置Spring包

```xml
      <properties>
       <spring.version>4.1.7.RELEASE</spring.version>
      </properties>
      .....
      <!-- 核心 -->
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-core</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-beans</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-context</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-aop</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-websocket</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-messaging</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <!-- dao层框架 -->
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-jdbc</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-tx</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-web</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-webmvc</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <!-- Spring test 相关依赖 -->
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-test</artifactId>
         <version>${spring.version}</version>
       </dependency> 
```

### 8.2 Spring技巧
#### 8.2.1 获取Spring已有的Context环境
##### 【在JSP或Servlet中】

```
    ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(config.getServletContext());

```

#### Spring 和 ServletContextList
- 想要启动Tomcat之后，初始化运行一些方法，把数据从数据库拿出放入redis中，然后使用了ServletContextListener
    - 然后还是按照往常一样的使用Spring自动注入的便利，来使用service层获取数据，但是忽略了启动顺序
    - **context-param -> listener -> filter -> servlet**
    - 所以在启动这个初始化方法的时候，其实Spring的环境是还没有加载的，所以没有扫描，也就没有了自动注入，也就有了空指针异常
    - 所以要使用如下方法得到Spring的Context（上下文），获取bean，再操作
  
```java
    public void contextInitialized(ServletContextEvent event) { 
        ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
        ....
    }
``` 

### 8.3 注解方式：

#### 8.3.1 Application.xml中配置头部分
```xml
    头部分要添加Context
    <?xml version="1.0" encoding="UTF-8"?>
    <beans xmlns="http://www.springframework.org/schema/beans"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns:context="http://www.springframework.org/schema/context"
         xsi:schemaLocation="http://www.springframework.org/schema/beans
             http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
             http://www.springframework.org/schema/context
             http://www.springframework.org/schema/context/spring-context-3.0.xsd">
        <!-- 对使用了注解的包进行扫描 -->
        <context:component-scan base-package="cn.spring.aop"></context:component-scan>
    </beans>
```
>**【注意】**只需要这个配置文件就可以使用注解来使用Spring框架

#### 8.3.2 常用的注解：
- @Component([value=]"id") 不写则默认是当前类名
- @Resource([value=]"id")
- @Autowried 根据类型自动注入（只对单例起作用）
- @Qualifier("id") 自动注入后的进一步精确（多个的情况：）
- @Aspect 注明是切面类
- @Before("execution(public void com.wjt276.dao.impl.UserDaoImpl.save(com.wjt276.model.User))") 和xml方式的before对应

### 8.4 xml方式：
- 只用到bean的头，主要配置内容：`<bean><property></property></bean>`

```xml
       <!-- 一般而言，bean都是单实例的 -->
    <bean id="person" class="cn.spring.entity.Person"> 
        <property name="name" value="myth"/>
        <property name="addr" value="vol"/>
    </bean>
    
    <bean id="construct" class="cn.spring.entity.ConstructorEntity">
    <!-- 如果是不同的类型的参数 顺序可以随意，但是数据类型一样的话就要严格按顺序了-->
        <constructor-arg type="java.lang.String" value="String_1"></constructor-arg>
        <!-- 注意引用类型是要写全路径，基本数据类型是可以直接写小写 -->
        <constructor-arg type="int" value="2"></constructor-arg>
        <!-- <constructor-arg type="java.lang.String" value="String_2"></constructor-arg> -->
    </bean>
    <bean id="TestConstruct" class="cn.spring.entity.TestConstruct">
        <property name="entity" ref="construct"></property>
    </bean>
    
    <!-- 加载属性文件 -->
    <bean id="property_config" class="org.springframework.beans.factory.config.PreferencesPlaceholderConfigurer">
        <property name="locations">
            <list>
                <value>cn/spring/entity/db.properties</value>
            </list>
        </property>
    </bean>
    <!-- 测试获取属性文件 -->
    <bean id="show_db" class="cn.spring.entity.TestProperties">
        <!-- 特别注意大小写问题 -->
        <property name="driver" value="${driver}"/>
        <property name="username" value="${username}"/>
        <property name="password" value="${password}"/>
        <property name="url" value="${url}"/>
    </bean>

```

### 8.5 IOC / DI：控制反转
- DI 译为依赖注入 所有的bean都在IOC容器中（单例的）多例的不在该容器中进行管理
- 通过注入 可以注入基本属性 对象属性，集合属性，构造器，properties等
- 不采用Spring的IOC容器使用Java基础来实现：
   - **静态代理** 
       - 针对每个具体类分别编写代理类
       - 针对一个接口编写一个代理类
   - **动态代理**
       - 针对一个方面编写一个InvocationHandler，然后借用JDK反射包中的Proxy类为各种接口动态生成相应的代理类 

### 8.6 AOP：
```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <beans xmlns="http://www.springframework.org/schema/beans"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xmlns:context="http://www.springframework.org/schema/context"
     xmlns:aop="http://www.springframework.org/schema/aop"
     xsi:schemaLocation="http://www.springframework.org/schema/beans
         http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
         http://www.springframework.org/schema/context
         http://www.springframework.org/schema/context/spring-context-3.0.xsd
         http://www.springframework.org/schema/aop
         http://www.springframework.org/schema/aop/spring-aop-3.0.xsd">
         </beans>

```

- 方法级别的添加代理，Servlet中的过滤器也类似（但是那个是类级别的）

#### 8.6.1 基本概念

- JoinPoint  切入面、连接点、切入点（所有方法）
- PointCut 切点（特殊的连接点，需要增强的连接点）
- Advice 增强（切入点的逻辑，待添加的功能）
- Aspect 切面（切点和增强的合集）
- Target 目标对象（被增强的实例）
- Weave 织入（增强切点的过程）
- Proxy 代理（增强后的类，一般是使用了代理类） 装饰器模式
- Introduction 引介（为类添加属性和方法） 用的较少因为破坏了OOP思想

#### 8.6.2 基本配置
```xml
    <!-- 基本类 提供切点 -->
    <bean id="student" class="cn.spring.aop.Student"></bean>
    <!-- 增强部分 -->
    <bean id="adder" class="cn.spring.aop.NewDeal"></bean>
    <!-- 使用aop的自动提示也要配置上面的头文件声明 -->
    <aop:config>
        <!--aspect表示切面 ref 标明增强方法的类来源 -->
        <aop:aspect id="myAop" ref="adder">
            <!-- execution 是表达式（正则一样的功能）匹配的是具体的切点 -->
            <aop:pointcut expression="execution(* cn.spring.aop.Student.run(..))" id="needAdd"/>
            <!-- 织入 的过程 将增强和切入点结合 -->
            <aop:before method="add" pointcut-ref="needAdd"/>
            <aop:after method="af" pointcut-ref="needAdd"/>
            <aop:around method="around" pointcut-ref="needAdd"/>
        </aop:aspect>
    </aop:config>

```

#### 8.6.3 JDBC
Spring中有封装的关于JDBC操作的类 JDBCSupport 只要传入datasource对象即可

#### 8.6.4 注意
- 要注意环绕的写法 public void around(ProceedingJoinPoint m)throws Throwable{
- [Spring AOP中的around](https://www.oschina.net/code/snippet_246557_9205)
- 然后在test类中直接getBean（基类）但是实际上是获取到的是装饰好的代理对象
- [Spring AOP配置(转)](http://blog.csdn.net/yuqinying112/article/details/7335416)
- [aop:config详解](http://www.cnblogs.com/yangy608/archive/2010/11/14/1876833.html)
- 善用debug 调试看是否获取到的是代理对象 $proxy

> 在Spring的配置文件中，所有的切面和通知器都必须定义在 <aop:config> 元素内部。 一个application context可以包含多个 <aop:config>。 一个 <aop:config> 可以包含pointcut，advisor和aspect元素（注意它们必须按照这样的顺序进行声明）。 

### 8.7 Spring-Websocket 配置

##### maven配置jar环境

```xml

      <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-websocket</artifactId>
         <version>${spring.version}</version>
       </dependency>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-messaging</artifactId>
         <version>${spring.version}</version>
       </dependency>
    
```

- java代码: 
    - (handle.java)[] (systemHandle.java)[]
- js代码: 
    - (socket.js)[]

### 8.0 xml方式和注解方式的比较：

- 当你确定切面是实现一个给定需求的最佳方法时，你如何选择是使用Spring AOP还是AspectJ，以及选择 Aspect语言（代码）风格、@AspectJ声明风格或XML风格？
- 这个决定会受到多个因素的影响，包括应用的需求、 开发工具和小组对AOP的精通程度。
- **个人理解**：使用bean的时候使用注解，AOP使用xml方式，更直观

#### 1 Spring AOP还是完全用AspectJ？

做能起作用的最简单的事。Spring AOP比完全使用AspectJ更加简单，因为它不需要引入AspectJ的编译器／织入器到你开发和构建过程中。 
如果你仅仅需要在Spring bean上通知执行操作，那么Spring AOP是合适的选择。如果你需要通知domain对象或其它没有在Spring容器中 
管理的任意对象，那么你需要使用AspectJ。如果你想通知除了简单的方法执行之外的连接点（如：调用连接点、字段get或set的连接点等等）， 
也需要使用AspectJ。

当使用AspectJ时，你可以选择使用AspectJ语言（也称为“代码风格”）或@AspectJ注解风格。 
如果切面在你的设计中扮演一个很大的角色，并且你能在Eclipse中使用AspectJ Development Tools (AJDT)， 那么首选AspectJ语言 :- 
因为该语言专门被设计用来编写切面，所以会更清晰、更简单。如果你没有使用 
Eclipse，或者在你的应用中只有很少的切面并没有作为一个主要的角色，你或许应该考虑使用@AspectJ风格 
并在你的IDE中附加一个普通的Java编辑器，并且在你的构建脚本中增加切面织入（链接）的段落。

#### 2 Spring AOP中使用@AspectJ还是XML？

如果你选择使用Spring AOP，那么你可以选择@AspectJ或者XML风格。总的来说，如果你使用Java 5， 我们建议使用@AspectJ风格。
显然如果你不是运行在Java 5上，XML风格是最佳选择。XML和@AspectJ 之间权衡的细节将在下面进行讨论。

XML风格对现有的Spring用户来说更加习惯。它可以使用在任何Java级别中（参考连接点表达式内部的命名连接点，虽然它也需要Java 5） 
并且通过纯粹的POJO来支持。当使用AOP作为工具来配置企业服务时（一个好的例子是当你认为连接点表达式是你的配置中的一部分时， 
你可能想单独更改它）XML会是一个很好的选择。对于XML风格，从你的配置中可以清晰的表明在系统中存在那些切面。

XML风格有两个缺点。第一是它不能完全将需求实现的地方封装到一个位置。DRY原则中说系统中的每一项知识都必须具有单一、无歧义、权威的表示。 
当使用XML风格时，如何实现一个需求的知识被分割到支撑类的声明中以及XML配置文件中。当使用@AspectJ风格时就只有一个单独的模块 -切面- 
信息被封装了起来。 第二是XML风格同@AspectJ风格所能表达的内容相比有更多的限制：仅仅支持"singleton"切面实例模型，并且不能在XML中组合命名连接点的声
明。 例如，在@AspectJ风格中我们可以编写如下的内容：

```java
       @Pointcut(execution(* get*())) 
       public void propertyAccess() {} 
       @Pointcut(execution(org.xyz.Account+ *(..)) 
       public void operationReturningAnAccount() {} 
       @Pointcut(propertyAccess() && operationReturningAnAccount()) 
       public void accountPropertyAccess() {}

```

在XML风格中能声明开头的两个连接点：

```xml
      <aop:pointcut id="propertyAccess" expression="execution(* get*())"/> 
      <aop:pointcut id="operationReturningAnAccount"  expression="execution(org.xyz.Account+ *(..))"/>

```

但是不能通过组合这些来定义accountPropertyAccess连接点

@AspectJ风格支持其它的实例模型以及更丰富的连接点组合。它具有将将切面保持为一个模块单元的优点。 还有一个优点就是@AspectJ切面能
被Spring AOP和AspectJ两者都理解 - 所以如果稍后你认为你需要AspectJ 的能力去实现附加的需求，
那么你非常容易转移到基于AspectJ的途径。总而言之，我们更喜欢@AspectJ风格只要你有切面 去做超出简单的“配置”企业服务之外的事情。

#### 3 混合切面类型

我们完全可以混合使用以下几种风格的切面定义：使用自动代理的@AspectJ 风格的切面，schema-defined <aop:aspect> 的切面，
和用 <aop:advisor> 声明的advisor，甚至是使用Spring 1.2风格的代理和拦截器。
由于以上几种风格的切面定义的都使用了相同的底层机制，因此可以很好的共存。

*******************

## 9 【SpringMVC】
- 一般使用注解方式更方便书写
### 9.1 必要JAR包：
- Spring的核心JAR包
- spring-web-3.2.6.RELEASE.jar
- spring-webmvc-3.2.6.RELEASE.jar
- spring-webmvc-portlet-3.2.6.RELEASE.jar

### 9.2 实现逻辑

- 核心类是DispatchServlet 由它来接收各种请求
- 发出request请求，到controller解析器，得到Model和view等的名字
- 发送到controller执行，返回view名字
- 发送到视图解析器
- 执行视图返回到dispatchServlet

### 9.3 controller的配置
- 类：
   - @Controller
   - @RequestMapping("/WebApplicationRootURL")
- 方法
    - @RequestMapping("/ActionURL")
        - @RequestMapping("/action/{id}") 方法要使用(@PathVariable("id") String id)
    - @ResponseBody 返回对象，自动解析成JSON

#### 9.3.1类型转换（也可以使用Hibernate的convert）

```xml
    <mvc:annotation-driven conversion-service="conversionService" />
    <!--配置ConversionService -->
    <bean id="conversionService"
        class="org.springframework.context.support.ConversionServiceFactoryBean">
        <property name="converters">
            <set>
                <ref bean="DateConverter" />
            </set>
        </property>
    </bean>
```


##### SpringMVC的内置代理

##### Hibernate的covert包

#### Controller层的异常处理（一般处理自定义异常）

```java
    处理所有接收到的的异常
    @ControllerAdvice
    public class ExceptionHandle{
    @EXceptionHandler({Exception.class})
    public ModelAndView dealException(Exception e){
        ModelAndView view = new ModelAndView("exception";
        Exception e = new Exception("错误信息");
        view.addObject("",e.getMessage());
        return view;
    }
    
```

#### 拦截器机制

```xml
    implements HandleInterceptor 有三个方法
    
    preHandle 返回true就继续往后，false就被拦截
    PostHandle 在渲染视图之前，
    afterCompletion 渲染视图之后调用，释放资源
    
    
    配置文件，需要配置：
    ？如果这个路径大于springmvc拦截的路径？
      <mvc:interceptors>
       <mvc:interceptor>
           <bean class=""></bean>
           <mvc:mapping path="/**"/>
       </mvc:interceptor>
```
#### 视图解析
```java
    ModelAndView view = ModelAndView("index"); 
    使用这种写法是进入配置好的视图解析器，进行路径的拼接然后转发
    ModelAndView("redirect:/l/login.jsp");
    就是使用重定向方式，注意路径要写全，因为不会拼接
 ```
 
 
#### 上传下载
jar包：
- common-upload
- common-io

---
配置文件

---

#### JSON的解析
- 第三方的JSON工具包：
    - jsonlib
    - jackson ： 三个包 annotion core databind
    - gson

- 发送JSON
    - 只要有返回值，方法前加上这个注解就会自动返回JSON格式的数据而不是对象
    - @responseBody
    - @ReqeustMapping("")
- 接收JSON 
    - 参数前 也加上@equestBody 就可以把JSON数据转成对象

********************

## 10.【SSH框架的整合】


## 11.【SSM框架的整合】


## 12.【Redis的使用】

### 12.1 【Java 使用 redis 配置】
> [Java使用Redis](/Database/Redis.md#Java使用Redis)�置】
> [Java使用Redis](/Database/Redis.md#Java使用Redis)se/Redis.md#Java使用Redis)�置】
> [Java使用Redis](/Database/Redis.md#Java使用Redis)用Redis)is)