`目录 start`
 
- [数据库模块](#数据库模块)
    - [SQL](#sql)
        - [连接池](#连接池)
            - [c3p0](#c3p0)
            - [druid](#druid)
        - [JPA_SQL](#jpa_sql)
            - [自定义查询](#自定义查询)
                - [HQL](#hql)
                - [原生SQL](#原生sql)
            - [Mysql](#mysql)
            - [映射关系](#映射关系)
        - [Restful设计](#restful设计)
            - [【特别注意】](#特别注意)
        - [Jpa数据分页](#jpa数据分页)
        - [数据库上的事务支持](#数据库上的事务支持)
    - [NoSQL](#nosql)
        - [JPA_NoSQL](#jpa_nosql)
            - [JPA关于Redis的使用](#jpa关于redis的使用)
            - [关于StringRedisTemplate的方法使用](#关于stringredistemplate的方法使用)

`目录 end` *目录创建于2018-01-14*
****************************************
# 数据库模块
> 主要是采用的JPA，极大的缩减了代码量，但是要注意不要过度依赖框架，丧失了基本的能力

## SQL
### 连接池
#### c3p0
- [参考博客](http://www.cnblogs.com/520playboy/p/7526252.html)

#### druid
- [druid连接池的配置](http://makaidong.com/L_Sail/1/40930_11573921.html)

*******************
### JPA_SQL
> 连接池:默认是tomcat-jdbc连接池

- [Blog: 原生SQL的写法](http://blog.csdn.net/Amy_Queen/article/details/72454099)

#### 自定义查询
##### HQL
- 使用Hibernate语法模式,将对象和数据库的表看成一个实体,方便书写SQL,但是在Controller层和Service层
    - 进行写代码的时候,参数的传递全是实体对象,要不停的new,这样真的没问题么(当有各种复杂的关联关系的时候,单个对象的CURD基本没有什么问题)
    - `TODO` 所以还不如直接写原生SQL! 那么JPA就真的没有使用的必要性了,直接用Mybatis结合插件生成自动的CRUD的代码,这样更为轻量
    - 待后续使用后再回来填坑

##### 原生SQL

- 涉及到数据的修改,就要加上前两个前缀,查询就直接写Query注解即可
```java
@Modifying
@Transactional
@Query(value = "update a set b=?1", nativeQuery = true)
```

*************************
#### Mysql
- 1.引入依赖
```groovy
	compile('org.springframework.boot:spring-boot-starter-data-jpa')
	compile('org.springframework.boot:spring-boot-starter-jdbc')
	runtime('mysql:mysql-connector-java')
```
- 2.继承接口，打好实体类的注解 @Entity 

- 3.*切记 属性名不能使用下划线（数据库风格）不然写声明方法就会报错，jpa只是看下划线前半部分，会说找不到属性*
    - jpa在创建表时会把驼峰命名改成数据库风格的形式

- 4.jpa是声明特定方法的接口，让jpa来实现并自动注入，如果是没有的方法，就可以使用@Query注解
    - 默认使用的是HQL（HQL是基于类的所以使用的是类的名字不是表的名字），可以设置下使用原生SQL

#### 映射关系
`一对多`
- 一方的配置是当前类的id，多方则按基本ER的规则来，直接采用的是外键的名字
```java
    // 一方
public class TestOne{
    @Id
    private String testOneId;
    @OneToMany
    @JoinColumn(name = "testOneId")//这个名字可以重复，最终会有一个随机码生成
    private Set<TestMany> testManySet;
}
    // 多方
public class TestMany {    
    @Id
    private String testManyId;
    @ManyToOne
    @JoinColumn(name = "testOneId")
    private TestOne testOneId;
}
```
*************

`多对多`

*************
### Restful设计
- 1.添加依赖

```xml
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-rest</artifactId>
    </dependency>
```
- 2.引入自动配置类

```java
    @Configuration
    public class RestConfiguration extends RepositoryRestMvcConfiguration {
        @Override
        public RepositoryRestConfiguration config() {
            return super.config();
        }
        @Override
        public ProfileResourceProcessor profileResourceProcessor(RepositoryRestConfiguration config) {
            // 设置rest根目录是应用路径下的路径 : localhost:8080/rest
            config.setBasePath("/rest");
            // 允许输出id
            config.exposeIdsFor(Goods.class);
            return super.profileResourceProcessor(config);
        }
    }
```
- 3.配置repository的名字例如：（只要配置repository就能用REST了）

```java
    @RepositoryRestResource(path = "book")
    public interface BookDao extends JpaRepository<Book,Long>{}
```

- 4.启动应用，控制台有如下输出
![输出](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Java/Spring/output.png)

- 所有路径的使用方法：
    - `GET` 查询单个 `/repo/id` 成功：200 失败404
    - `GET` 查询所有 `/repo` 成功200 失败404
    - `POST` 新增 `/repo` json数据发送 成功 201 失败404
    - `DELETE` 删除 `/repo/id` json数据 成功204 失败404
    - `PUT` 更新 `/repo/id` json 更新成功200 没有该id就插入201 失败404（使用主键自动增长就不会遇到404）

#### 【特别注意】
- rest得到的数据没有id
    - 添加配置 `config.exposeIdsFor(Goods.class);` 即可查看到id [参考博客](http://tommyziegler.com/how-to-expose-the-resourceid-with-spring-data-rest/)

### Jpa数据分页
> [参考博客](https://www.tianmaying.com/tutorial/spring-jpa-page-sort)

- 分页 page 从0开始 size是个数 sort可以不需要（如果本来就是id排序就没必要了） 
    - 原理就是 预编译SQL然后查询总数，然后再执行 必须有两条SQL执行
- 查询的结果不包含实体的id属性

### 数据库上的事务支持
- JPA对所有默认方法都开启了事务支持，查询类事务默认启用readOnly=true

****************
## NoSQL
### JPA_NoSQL
#### JPA关于Redis的使用
`配置连接信息`
```conf
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
    # 连接超时时间（毫秒）0不超时
    spring.redis.timeout=0
```

`在一个配置类中复制如下代码即可使用 StringRedisTemplate RedisTemplate 的实例`
```java
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
`两个对象的简单使用`
```java
    stringRedisTemplate.opsForValue().set("aaa", "hello");
    String result = stringRedisTemplate.opsForValue().get("aaa");
    //获取所有
    Set<String> keysList =  stringRedisTemplate.keys("*");
    for(String temp :keysList){
        log.info(temp);
    }
```
- 以上配置的template都是只是建立在最简单的键值对上，String-String，所以对象使用的是json来存储
- 但是使用的时候如同使用MySQL一样，是ORM框架自动处理数据的转换

#### 关于StringRedisTemplate的方法使用
- 常见数据类型的中间对象
    - opsForValue() 操作简单键值对数据
        - hasKey()
    - opsForHash() 操作含有hash的数据
    - opsForList() 操作含有list的数据
    - opsForZSet() 操作含有zset（有序）的数据
        - range()方法返回指定范围的数据 Java中Set类型的（诡异的是顺序保持了一致）
    - opsForSet() 操作含有set的数据

- 设置超时时间
    - `redisTemplate.expire("max",tempTime,TimeUnit.SECONDS);`

