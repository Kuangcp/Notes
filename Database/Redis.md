# 【Redis的使用】
## 【windows上的基本配置】
- 注册为服务
	- `redis-server --service-install redis.windows.conf --loglevel verbose`
- 使用cmder
	- cmd 中运行 `E:/redis/redis-server.exe E:/redis/redis.windows.conf`
- 配置密码
	- `requirepass redis1104`
	- 客户端登录 `auth redis1104`
##【Java使用redis配置】
[Java使用Redis：详见此处末尾](https://github.com/Kuangcp/Notes/blob/master/TXT/Java/EE.md)
****************************
## redis配置
- [配置文件讲解](https://github.com/Kuangcp/Notes/blob/master/ConfigFiles/Database/redis/explain_redis.conf)
- [原始配置文件](https://github.com/Kuangcp/Notes/blob/master/ConfigFiles/Database/redis/redis.conf)
- `[×]使用ing`[简化配置文件](https://github.com/Kuangcp/Notes/blob/master/ConfigFiles/Database/redis/simple_redis.conf) 

## redis命令行常规使用
### 常用的数据类型操作
- 【`字符串`】
	- get 
	- set
	- del 
	
- 【`列表 (类似队列)`】
	- rpush 右入队列，末端
	- lpush 左
	- lrange 获取范围 0，-1 表示获取全部
	- lindex 获取指定index的元素
	- lpop 左出队列
	- rpop
	
- 【`集合 (类似无序的Set)`】
	- sadd 添加一个对象`asdd key member`
	- smembers 获取某Set所有元素 `smembers key`
	- sismember 查询某Set是否含某元素，返回类型是 0 1 `sismember key member`
	- srem 删除指定Set中指定元素 `srem key member`
	
- 【`散列 (类似Map 嵌套，一个内置的微型redis)`】
	- hget
	- hset
	- hgetall 获取某散列所有k-v
	- hdel 删除散列中指定k
	- hincrby 自增
	
- 【`有序集合(键是member成员，值是score分值必须是浮点数)`】
	- zadd 将一个给定分值的成员添加到有序集合里
	- zrange 根据元素在有序集合中的位置，从有序集合中获取多个元素
		- zrange name 0 -1 withscores 获取所有并获取分值
		- zrange name 2 30 wi thscores 
	- zrevrange 从大到小排序的获取集合元素
	- zrangebyscore 获取有序集合在给定范围中的所有元素
		- zrangebyscore name 0 200 withscores 
	- zrem
	- zincrby 自增
	- zinterstore 进行集合之间的并集（可以看作是多表连接）
	 	
##### 过期策略
- `expire key seconds` 设置键的过期时间
- `PTTL/TTL key ` 查看键剩余过期时间（生存时间） ms/s
    -  -1表示永久 -2表示没有该key
- 

*******************
### 各数据类型的高级操作
##### 字符串 操作
- 字符串就是字节组成的序列 可以放字节串，整数，浮点数
- `set key newval nx `存在则set失败
- `set key newval xx `不存在则set失败
- 存入的String能被解析为数值 就能使用 incr incrby decr decrby 
- `incr` 是原子操作即并发的情况下不会有脏读(可用于主键生成策略)
- `getset key val`  set新值，get旧值
- `mset mget `
	- `mset key val key val` 
	- `mget key key key` 返回值组成的数组
- `exists key` 有该值就返回1否则0
- `del key` 返回1被删除，0 key不存在
- `type key` 返回值的类型
- `expire key secondes` 设置或改变超时时间，精度是秒或毫秒
	- `set key val ex secondes` set时设置超时时间
- `persist key` 去除超时时间


##### 列表 操作
- `rpush key val val val `右/尾添加元素 lpush是左/头
- `rpop key` 从list右/尾端中删除元素返回元素值 没有了就返回null
- 阻塞式的列表弹出命令(block) `队列很有用`
    - `blpop`
    - `brpop`
    - `bpoplpush`
    - `brpoplpush` 阻塞式先右弹再左进
- `lrange key 0 -1` 取指定长度的list -1表示全部
-  `ltrim key 0 2` 截取当前的list
- `lindex key offset`   返回偏移量为offset的元素

##### 集合 操作
##### 散列	 操作

*****************************************************************
	
### Run Configuration	
- *slaveof*
    - `redis-server --port 9999 --slaveof 127.0.0.1 6379` 启动一个9999端口作为6379的从服务器进行同步
    - 或者服务启动后执行 `slaveof host port`（如果已经是从服务器，就丢去旧服务器的数据集，转而对新的主服务器进行同步）
    - 从服务变成主服务 `slaveof no one` (同步的数据集不会丢失，迅速替换主服务器)
- *loglevel*
    - `./redis-server /etc/redis/6379.conf --loglevel debug	`
### 数据安全和性能
#### 持久化策略
#### 复制
#### 事务	
	
	
## 【Redis的使用】
### 作为日志记录
### 作为网站统计数据
### 存储配置信息
### 自动补全
- 搜索建议
### 构建锁
### 任务队列
- 发送邮件
### 订阅发送结构
### 【Java 使用 redis 配置】
- maven依赖(Spring 4.1.7)：
```xml
    <dependency>
        <groupId>org.springframework.data</groupId>
        <artifactId>spring-data-redis</artifactId>
        <version>1.6.0.RELEASE</version>
    </dependency>

    <dependency>
        <groupId>redis.clients</groupId>
        <artifactId>jedis</artifactId>
        <version>2.9.0</version>
        <type>jar</type>
    <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>org.apache.commons</groupId>
        <artifactId>commons-lang3</artifactId>
        <version>3.3.2</version>
    </dependency>
```
- Spring配置文件 
```xml
    <!--
        加载redis配置文件 
        如果已经加载了一个文件，那么第一个就要写这个配置项，
        <property name="ignoreUnresolvablePlaceholders" value="true"/>
        第二个要加 后面的配置 
        不然就只会加载前面那个文件
    -->
    <context:property-placeholder location="classpath:redis.properties" ignore-unresolvable="true"/>
    <!-- redis连接池的配置 -->
      <bean id="jedisPoolConfig" class="redis.clients.jedis.JedisPoolConfig">
          <property name="maxActive" value="${redis.pool.maxActive}"/>
          <property name="maxIdle" value="${redis.pool.maxIdle}"/>
          <property name="minIdle" value="${redis.pool.minIdle}"/>
          <property name="maxWait" value="${redis.pool.maxWait}"/>
          <property name="testOnBorrow" value="${redis.pool.testOnBorrow}"/>
          <property name="testOnReturn" value="${redis.pool.testOnReturn}"/>
      </bean>
      
      <!-- redis的连接池pool，不是必选项：timeout/password  -->
      <bean id = "jedisPool" class="redis.clients.jedis.JedisPool">
          <constructor-arg index="0" ref="jedisPoolConfig"/>
          <constructor-arg index="1" value="${redis.host}"/>
          <constructor-arg index="2" value="${redis.port}" type="int"/>
          <constructor-arg index="3" value="${redis.timeout}" type="int"/>
          <constructor-arg index="4" value="${redis.password}"/>
      </bean>
```

- java 实际测试
- [JedisUtilsTest.java](https://github.com/Kuangcp/Maven_SSM/blob/master/src/test/java/redis/JedisUtilTest.java)

#### redis 使用后要disconnect释放连接
#### redis 事务 exec释放事务

### jedis遇到的异常
- Invocation of init method failed; nested exception is java.lang.NoSuchMethodError: org.springframework.core.serializer.support.DeserializingConverter
- 版本对不上，要Spring和Spring-data-redis 和 redis和commons-lang3对应
- 目前是4.1.7 + 1.6.0 + 2.9.0 + 3.3.2 编译通过了	

### SpringBoot使用Redis
[SpringBoot配置Redis](https://github.com/Kuangcp/Notes/blob/master/TXT/Java/Spring/SpringBootDatabase.md)	
	
