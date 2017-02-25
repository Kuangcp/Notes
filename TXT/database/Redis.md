# 【Redis的使用】

##【Java 使用 redis 配置】
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
-  redis 使用后要使用close关闭
-  redis 事务 exec释放事务

### jedis遇到的异常
- Invocation of init method failed; nested exception is java.lang.NoSuchMethodError: org.springframework.core.serializer.support.DeserializingConverter
- 版本对不上，要Spring和Spring-data-redis 和 redis和commons-lang3对应
- 目前是 4.1.7 + 1.6.0 + 2.9.0 + 3.3.2 编译通过了

## redis命令行常规使用

### 常用的数据结构
- 字符串
	- get 
	- set
	- del 
	
- 列表 (类似队列)
	- rpush 右入队列，末端
	- lpush 左
	- lrange 获取范围 0，-1 表示获取全部
	- lindex 获取指定index的元素
	- lpop 左出队列
	- rpop
	
- 集合 (类似无序的Set)
	- sadd 
	- smembers 获取某Set所有元素
	- sismember 查询某Set是否含某元素，返回类型是 0 1
	- srem 删除指定Set中指定元素
	
- 散列 ( 类似Map 嵌套，一个内置的微型redis)
	- hget
	- hset
	- hgetall 获取某散列所有k-v
	- hdel 删除散列中指定k
	- hincrby 自增
	
- 有序集合(键是member成员，值是score分值必须是浮点数)
	- zadd 将一个给定分值的成员添加到有序集合里
	- zrange 根据元素在有序集合中的位置，从有序集合中获取多个元素
		- zrange name 0 -1 withscores 获取所有并获取分值
		- zrange name 2 30 withscores 
	- zrevrange 从大到小排序的获取集合元素
	- zrangebyscore 获取有序集合在给定范围中的所有元素
		- zrangebyscore name 0 200 withscores 
	- zrem
	- zincrby 自增
	- zinterstore 进行集合之间的并集（可以看作是多表连接）