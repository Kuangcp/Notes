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

```
    `daemonize `      #是否以后台daemon方式运行
    `pidfile   `      #pid文件位置
    `port      `      #监听的端口号
    `timeout   `      #请求超时时间 默认为300(秒)
    `loglevel   `     #log信息级别  有4个可选值，debug，verbose（默认值），notice，warning
    `logfile    `     #log文件位置
    `databases `      #开启数据库的数量
    `save * *   `     #保存快照的频率，第一个*表示多长时间，第三个*表示执行多少次写操作。在一定时间内执行一定数量的写操作时，自动保存快照。可设置多个条件。
    `rdbcompression`  #是否使用压缩
    `dbfilename `     #数据快照文件名（只是文件名，不包括目录）
    `dir   `          #数据快照的保存目录（这个是目录）
    `appendonly `     #是否开启appendonlylog，开启的话每次写操作会记一条log，这会提高数据抗风险能力，但影响效率。
    `appendfsync `    #appendonlylog如何同步到磁盘（三个选项，分别是每次写都强制调用fsync、每秒启用一次fsync、不调用fsync等待系统自己同步）
   ` vm-enabled   `   #是否使用虚拟内存，默认值为no
    `vm-swap-file  `  #虚拟内存文件路径，默认值为/tmp/redis.swap，不可多个Redis实例共享
    `vm-max-memory  ` #将所有大于vm-max-memory的数据存入虚拟内存,无论vm-max-memory设置多小,所有索引数据都是内存存储的(Redis的索引数据就是keys),也就是说,当vm-max-memory设置为0的时候,其实是所有value都存在于磁盘。默认值为0
   ` vm-page-size`    #设置虚拟内存的页大小，如果你的value值比较大，比如说你要在value中放置博客、新闻之类的所有文章内容，就设大一点，如果要放置的都是很小的内容，那就设小一点
    `vm-pages  `      #设置交换文件的总的page数量，需要注意的是，page table信息会放在物理内存中，每8个page就会占据RAM中的1个byte。总的虚拟内存大小 ＝ vm-page-size * vm-pages
    `vm-max-threads`  #设置VM IO同时使用的线程数量。因为在进行内存交换时，对数据有编码和解码的过程，所以尽管IO设备在硬件上本上不能支持很多的并发读写，但是还是如果你所保存的vlaue值比较大，将该值设大一些，还是能够提升性能的
    `glueoutputbuf`   #把小的输出缓存放在一起，以便能够在一个TCP packet中为客户端发送多个响应，具体原理和真实效果我不是很清楚。所以根据注释，你不是很确定的时候就设置成yes
    `hash-max-zipmap-entries` #在redis 2.0中引入了hash数据结构。当hash中包含超过指定元素个数并且最大的元素没有超过临界时，hash将以一种特殊的编码方式（大大减少内存使用）来存储，这里可以设置这两个临界值
    `hash-max-zipmap-value`   #hash中一个元素的最大值
    `activerehashing`         #开启之后，redis将在每100毫秒时使用1毫秒的CPU时间来对redis的hash表进行重新hash，可以降低内存的使用。当使用场景中，有非常严格的实时性需要，不能够接受Redis时不时的对请求有2毫秒的延迟的话，把这项配置为no。如果没有这么严格的实时性要求，可以设置为yes，以便能够尽可能快的释放内存
    `slaveof <masterip> <masterport>` #当本机为从服务时，设置主服务的IP及端口（注释）
    `masterauth <master-password>`    #当本机为从服务时，设置主服务的连接密码（注释）
    `requirepass foobared `           #连接密码（注释）
   ` maxclients `                     #最大客户端连接数，默认不限制（注释）
   ` maxmemory `                      #设置最大内存，达到最大内存设置后，Redis会先尝试清除已到期或即将到期的Key，当此方法处理后，任到达最大内存设置，将无法再进行写入操作。（注释）
```
`精简版配置文件`
```
    daemonize yes
    pidfile /var/run/redis.pid
    port 6379
    timeout 315360000
    loglevel notice
    logfile /data/redis_logs/redis.log
    databases 16
    save 3600 10000
    save 86400 1
    rdbcompression yes
    dbfilename dump.rdb
    dir /data/redis/
    appendonly no
    appendfsync everysec
    vm-enabled no
    vm-swap-file /tmp/redis.swap
    vm-max-memory 0
    vm-page-size 32
    vm-pages 134217728
    vm-max-threads 4
    glueoutputbuf yes
    hash-max-zipmap-entries 64
    hash-max-zipmap-value 512
    activerehashing yes
```
## redis命令行常规使用
### 常用的数据类型操作
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
	- sadd 添加一个对象`asdd key member`
	- smembers 获取某Set所有元素 `smembers key`
	- sismember 查询某Set是否含某元素，返回类型是 0 1 `sismember key member`
	- srem 删除指定Set中指定元素 `srem key member`
	
- 散列 (类似Map 嵌套，一个内置的微型redis)
	- hget
	- hset
	- hgetall 获取某散列所有k-v
	- hdel 删除散列中指定k
	- hincrby 自增
	
- 有序集合(键是member成员，值是score分值必须是浮点数)
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
- `TTL key ` 查看键剩余过期时间（生存时间）
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
- `ttl key` 查看剩余存活时间 -1表示永久 -2表示没有该key

##### 列表 操作
- `rpush key val val val `右/尾添加元素 lpush是左/头
- `rpop key` 从list右/尾端中删除元素返回元素值 没有了就返回null
- 阻塞式的列表弹出命令(block) 队列很有用
    - blpop
    - brpop
    - bpoplpush
    - brpoplpush
- `lrange key 0 -1` 取指定长度的list -1表示全部
-  `ltrim key 0 2` 截取当前的list
- `lindex key offset`   返回偏移量为offset的元素

##### 集合
##### 散列	

**********************
	
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
	
