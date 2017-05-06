# 【Redis的使用】
## 【windows上的基本配置】
- 注册为服务
	- redis-server --service-install redis.windows.conf --loglevel verbose
- 使用cmder
	- cmd 中运行 `E:/redis/redis-server.exe E:/redis/redis.windows.conf`
- 配置密码
	- requirepass redis1104
	- 客户端登录 auth redis1104
##【Java使用redis配置】
[Java使用Redis：详见此处末尾](https://github.com/Kuangcp/Notes/blob/master/TXT/Java/EE.md)
****************************
## redis配置

```
   ` daemonize `      #是否以后台daemon方式运行
   ` pidfile   `      #pid文件位置
    `port      `      #监听的端口号
    `timeout   `      #请求超时时间 默认为300(秒)
    `loglevel   `     #log信息级别  有4个可选值，debug，verbose（默认值），notice，warning
    `logfile    `     #log文件位置
    `databases `      #开启数据库的数量
   ` save * *   `     #保存快照的频率，第一个*表示多长时间，第三个*表示执行多少次写操作。在一定时间内执行一定数量的写操作时，自动保存快照。可设置多个条件。
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
	
	
	

	
### Run Configuration	
- *slaveof*
    - `redis-server --port 9999 --slaveof 127.0.0.1 6379` 启动一个9999端口作为6379的从服务器进行同步
    - 或者服务启动后执行 `slaveof host port`（如果已经是从服务器，就丢去旧服务器的数据集，转而对新的主服务器进行同步）
    - 从服务变成主服务 `slaveof no one` (同步的数据集不会丢失，迅速替换主服务器)
- *loglevel*
    - `./redis-server /etc/redis/6379.conf --loglevel debug	`
	
	
	
	
	
