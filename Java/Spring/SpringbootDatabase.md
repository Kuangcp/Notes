## 数据库模块
> 主要是采用的JPA，极大的缩减了代码量，但是要注意不要过度依赖框架，丧失了基本的能力

### JPA_SQL
1.引入依赖
2.继承接口，打好实体类的注解
3.自动注入直接使用
4.*切记 属性名不能使用下划线（数据库风格）不然写声明方法就会报错，jpa只是看下划线前半部分，会说找不到属性*
jpa在创建表时会把驼峰命名改成数据库风格的形式

- jpa是声明特定方法的接口，让jpa来实现并自动注入，如果是没有的方法，就可以使用@Query注解
    - 默认使用的是HQL（HQL是基于类的所以使用的是类的名字不是表的名字），可以设置下使用原生SQL
#### 数据库上的事务支持
- JPA对所有默认方法都开启了事务支持，查询类事务默认启用readOnly=true

### JPA_NoSQL
#### JPA关于redis的使用
`配置连接信息`
```
    # REDIS (RedisProperties)
    # Redis数据库索引（默认为0）
    spring.redis.database=0
    # Redis服务器地址
    spring.redis.host=127.0.0.1
    # Redis服务器连接端口
    spring.redis.port=6379
    # Redis服务器连接密码（默认为空）
    spring.redis.password=
    # 连接池最大连接数（使用负值表示没有限制）
    spring.redis.pool.max-active=8
    # 连接池最大阻塞等待时间（使用负值表示没有限制）
    spring.redis.pool.max-wait=-1
    # 连接池中的最大空闲连接
    spring.redis.pool.max-idle=8
    # 连接池中的最小空闲连接
    spring.redis.pool.min-idle=0
    # 连接超时时间（毫秒）
    spring.redis.timeout=0
```


`在一个配置类中引入以下代码即可直接使用`
```
    @Bean
    public RedisTemplate<Object,Object> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<Object,Object> template = new RedisTemplate<>();
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer<>(Object.class);
        template.setConnectionFactory(factory);
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(om);
        // 值序列化采用 jackson2JsonRedisSerializer
        template.setValueSerializer(jackson2JsonRedisSerializer);
        // 键序列化采用 StringRedisSerializer
        template.setKeySerializer(new StringRedisSerializer());
        template.afterPropertiesSet();
        return template;
    }

    @Bean
    StringRedisTemplate template(RedisConnectionFactory connectionFactory) {
        return new StringRedisTemplate(connectionFactory);
    }
``` 
`使用`
```
    stringRedisTemplate.opsForValue().set("aaa", "hello");
    String result = stringRedisTemplate.opsForValue().get("aaa");
    //获取所有
    Set<String> keysList =  stringRedisTemplate.keys("*");
    for(String temp :keysList){
        log.info(temp);
    }
```
- 以上配置的template都是只是建立在最简单的键值对上，String-String，所以对象使用的是json来存储
- 但是使用的时候如同使用MySQL一样

#### 关于StringRedisTemplate的方法使用
- opsForValue() 操作简单键值对数据
- opsForHash() 操作含有hash的数据
- opsForList() 操作含有list的数据
- opsForZSet() 操作含有zset（有序）的数据
- opsForSet() 操作含有set的数据









