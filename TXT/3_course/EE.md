##【JSP/Servlet 】
*	1、JSP页面上的SQL标签以及EL标签是优先于文件头的那些JavaServlet语句运行的，所以要保证非法进入页面时重定向的问题
*	2、如果想要获取异常来据此返回参数到页面弹窗提示，那么就要对一层层的方法调用，进行查找，所有的try catch 块 都要检查
		>因为一般我的习惯就是把异常当场就处理了，而要实现这个要求就必须将异常层层上抛！！！！
*	3、中文乱码问题：
		接收
			使用get方法，需要转换成gbk :new String(s.getBytes("ISO-88511-1","gbk");
			post方法需要转换成UTF-8
		回应 均使用UTF-8
####查询数据：
使用set集合，查询使用contians








##【框架】
MVC设计模式：
	* M
		* hibernarte （相应操作的SQL语句由Hibernate框架生成）
		mybatis（SQL用户根据需要去写的）
		JPA 和Hibernate是相同的内核，由Hibernate派生而来
	* C
		struts1.x
		struts2.x
		* springmvc  
		* spring  模块的整合
	* V:
		视图层

*************************************************************************************	
##【Hibernate】
####【JDBC 和 Hibernate 比较】
* JDBC
>	使用其简洁精悍，最快，但是使用时接收数据以及多方面的比较麻烦
* Hibernate
>	单表操作是很便捷的，但是涉及到多表复杂操作时比较麻烦

#####【配置流程】如果后续需要添加表的话，就这个顺序
  1  先有数据库和表，建立cfg.xml文件配置好数据库的基本参数
  2  使用工具建立POJO持久类
  3  导入Hibernate所必需JAR包，最好使用Myeclipse的配置，自己导包总有一堆错误
  4  使用MyEclipse自动创建hbm.xml文件，还有各种文件。配置好hbm文件里关于表间关系的映射，或者在Myeclipse配置时手动选择
  5  配置好DAO类中事务开启和关闭，以及各种所必需的配置，若表没有设立主键，那么POJO类需要继承自动生成的抽象类（含有主键）
  6  调用DAO或者自己的Utils类，通过Hibernate来操作数据库

####Hibernate必须JAR：【Hibernate 3.6】
		required目录下所有JAR都要导入
		jpa的JAR包（做注解用）
		日志包：
			slf4j-api-* .jar	该包是一个日志接口，需要一个JAR包的实现：
			slf4j-log4j12.jar	该包是转换的JAR包
			log4j-1.2.11.jar	实现的JAR包
		数据库驱动包  mysql-connector-java-5.1.7-bin.jar
	在src同级目录下新建一个lib目录，把JAR包复制进去，然后右击将jar文件  Add to build path 加入到类搜索路径里

####编写POJO持久层对应的对象：
	使用自己的工具类创建到对应的包下，或者能用IDE自动创建生成？

####编写hibernate.cfg.xml文件 一般在src目录下
	数据库连接属性 驱动，url，用户名，密码
	数据库方言 
	辅助配置
	POJO类配置文件的映射
	etc/hibernate.properties里可以看到更多配置，数据库连接池，SQL优化等

	在：project/core/src/main/resources/org/hibernate/下有各种dtd文件，
		可以为eclipse的xml配置自动提示功能
####日志文件的配置：
	在etc下复制log4j.properties到src下，就可以了，本人ssh下复制log4j.xml就可以了

#####SessionFactory 和 Session 比较：
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
>	轻量级的容器，一级缓存
	是非线程安全的对象

#####OID的作用： 在Hibernate中唯一标识对象的属性，每个实体都是必须要有OID的
####【id 生成策略】：
* assigned：要求用户去手动指定对象的OID；该对象ID的类型可以是任意的
* native：数据类型是数值型，id的生成策略为数据库底层自增长（数据库自己去决定使用那种方式）
* sequence：Oracle数据库推荐，数值型（Long）
* seqhilo oracle :推荐使用的策略，使用序列来搭配高低机制
* uuid.hex :32位字符
* uuid:
* hilo：类型为数值型（long） [实际开发中推荐使用]
>	id = hi+lo (高位和低位进行组合)
	sessionFactory实例化，高位就会加一，生成算法是：hi*(max lo +1)+lo;
    `<generator class="hilo" >`
	`<param name="table">stu_hilo</param>`
	`<!-- 放高值的表名 最好是一个对象对应于一个高低值的表避免了并发-->`
	`<param name="cloumn">next_hi</param>`
	`<!-- 高的值放在表的哪个字段 -->`
	`<param name="max_lo">100</ param>`
	`<!-- 每个轮回值的上限是多少 虚拟机启动频繁就设小一些，避免编码的浪费-->`
	`</generator>`

####【非普通类型】
* Set集合：

---
	<set name="Nos" table="表">
		<key column="外码"></key><!-- 外码 是必须的 -->
		<element column="号码" type="string"/>
	</set>
* List集合:

---
	<list>
			<key></key>
			<index></index>
			<element></element>
	</list>
* 查询列：
`<property name="" formula="(select sum() from 选修表 as u where u.id=id)"></property>`

****************************************************************
##【Hibernate关联配置】
###### 一对多的配置
* 注意：一定要两个都有oid的情况才能配置一对多的映射,不能是依赖于另一个主键类
* 一方：

---
	<set name="" [cascade=""]> 
		<key column="这是外键"></key>
		<one-to-many class="多方的类"></one-to-many>
	</set>
* 多方：
`<many-to-one name="" class="一方的类" column="外键，key要一致" />`
* 双向的关联，会有update的SQL语句的执行来维护关系，影响效率
* 多方维护：一方中set标签加inverse="true"一方就不会维护，代码一定要多方执行set**(*)
* 一方维护：一方代码一定要执行**.add*()

1.在一的一方，修改xml文件，添加一个set 属性，表示 多方 的一个集合
`<set name="类中属性名（集合）" inverse="true">`
	`<key>< column name="数据库列名"/></key>`
	`<one-to-many class="多方类路径"/>`
`</set>`

2.在一的一方，修改POJO持久类文件，添加一个hashset，用来存储多方，添加setget方法，名字就是配置文件里添加的那个名字 注意修改构造器

3.在多的一方，修改xml文件，置换掉那个外键，换成many-to-one标签，里面写上外键的列
`<many-to-one name="类中属性名（对象）" class="一方的类路径" column="数据库中列名"></many-to-one>`

4.在多的一方，修改POJO持久类文件，添加一个一方的对象添加setget方法，名字就是配置文件里添加的那个名字  注意修改构造器
* 一方的set集合中有inverse属性，多方是没有的，Hibernate中inverse是和外键对应的，一方配置了inverse是false，一方就不会维护关系（外键），一般是给多方维护，因为效率高
* cascade是对象和对象之间的操作，和外键没有关系
* 处于持久化状态的对象在Session中，客户端不需要做Session的save/update 操作，Hibernate会自动的去检查处于持久化的对象的状态的属性是否发生改变，改变了就发送update语句。
	* 如果该对象是一方，在一的一方映射文件中有cascade=all时，Hibernate内部还会检查该持久化对象关联的集合，对此集合进行update操作，但是该操作和外键没有关系，只有当通过多方建立关系后，才能使外键有值。
#####多对多的配置
* 关系在第三方表中，和两张表本身没有关系
* 多对多维护关系，谁都能维护关系（效率是一样的）维护一般是在页面上进行的
##### 一对一的配置
* 单向
	只要配置单向的配置文件添加：
	`<many-to-one name=""class="映射的类" column="数据库字段" unique="true"></many-to-one>`
* 多向
	* 一方 甲：
	`<many-to-one name="" class="乙方类"column="数据库字段" unique="true"></many-to-one>`
	* 一方 乙：
	`<one-to-one name="" class="甲方类" property-ref="甲方配置的标签的name"></one-to-one>`

********************
##【使用多对一的技巧】
###1.添加记录：
	1.1.当需要添加一个多方时，一看成课程，多看成成绩。当然的首先得有相关课程，再添加成绩记录。
	1.2.那就先实例化一个课程对象，配置好信息
	1.3.实例化多个成绩实例，再 课程对象.get**Set().add(成绩对象); 将成绩对象添加到集合中，
	1.4.session.save(课程对象)；
注意：既然实现了这样的操作，那就说明了在实例化成绩的时候，不需要指定课程的值，那就需要添加一个构造器
###2.删除记录
	2.1.如果删除一方，那就会将一删除，如果没有配置级联，就会将多方的外键置空，不会删除多方表
	2.2.如何通过一方修改多方的一条
			把一方的set中的要修改的一条，（查找之前需要对象 = session.load(对象.class,主键名)将多方的数据加载进来）
			注意多方不能有空列必须指定一个默认值（是和构造器有关么？）
			再查找出来，修改再update，新增也是如此增加多的一方的时候，就是在一方的set中新增一条记录，多方的操作都体现在了一方那里

*******************************************************
##【异常】
###could not find a getter for ...
	原因：1 可能真的没写get方法
		2 *.hmb.xml文件中的属性名和pojo持久类中属性名不一致（一定不能在表名中添加下划线）
		3 方法名写错（基本不可能，都是自动生成的）
		4 setget方法中不允许两个连续大写字母
###个人总结：
	当使用了没有主键的表，使用Myeclipse自动创建配置文件，使用自己的Table2Class来生成POJO持久类，
	就要继承对应的自动创建的抽象类，因为没有主键的表默认是将所有列看成一个主键，并且还会有添加一个id属性，
	这样也说明还有一点就是，这种表的字段不能有叫做id的列

	是不是可以不用手动去使用那个类，好像这里自动生成的一切都有，

	自动生成会生成：
		对应POJO的抽象类，hbm配置文件，以及默认的几个类，HibernateSessionFactory，IBaseHibernateDao，
		对应的Dao（添加的时候默认是没有使用事务，所以需要手动修改）,添加，删除，都是依据主键的，
		至少要初始化主键，当然还得满足数据库的要求

****************************************************************************************************************************************************************
##【Mybatis】
###xml文件配置：
	创建mybatis-config.xml文件
	创建generatorConfig.xml文件

###导入JAR包：
	核心包

###创建SqlSessionFactory类


##【Spring】


##【SpringMVC】


##【Hibernate】

##【Hibernate】

