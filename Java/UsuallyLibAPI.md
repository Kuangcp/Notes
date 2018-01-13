`目录 start`
 
- [常用库的常见API](#常用库的常见api)
    - [Guava](#guava)
        - [介绍](#介绍)
            - [Guava的使用](#guava的使用)
    - [lombok](#lombok)
        - [lombok的安装及其使用](#lombok的安装及其使用)
        - [maven引入](#maven引入)
        - [gradle引入](#gradle引入)
    - [jackson](#jackson)

`目录 end` *目录创建于2018-01-14*
****************************************
# 常用库的常见API

## Guava

### 介绍
Guava工程包含了若干被Google的 Java项目广泛依赖 的核心库，例如：集合 [collections] 、缓存 [caching] 、原生类型支持 [primitives support] 、
并发库 [concurrency libraries] 、通用注解 [common annotations] 、字符串处理 [string processing] 、I/O 等等。 所有这些工具每天都在被Google的工程师应用在产品服务中。

```
    com.google.common.annotations
    com.google.common.base
    com.google.common.collect
    com.google.common.io
    com.google.common.net
    com.google.common.primitives
    com.google.common.util.concurrent

```

```
    [Google Guava] 7-原生类型
    [Google Guava] 12-数学运算
    [Google Guava] 排序: Guava强大的”流畅风格比较器”
    [Google Guava] 2.1-不可变集合
    [Google Guava] 10-散列
    [Google Guava] 9-I/O
    [Google Guava] 1.2-前置条件
    [Google Guava] 4-函数式编程
    [Google Guava] 6-字符串处理：分割，连接，填充
    [Google Guava] 1.1-使用和避免null
    [Google Guava] 8-区间
    [Google Guava] 2.4-集合扩展工具类
    [Google Guava] 1.3-常见Object方法    @Bean
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
    google Guava包的ListenableFuture解析
    [Google Guava] 11-事件总线
```

#### Guava的使用


***************************************************

## lombok
### lombok的安装及其使用
- 直接在IDEA的默认插件中心搜索lombok然后点安装即可
- lombok 注解：
- lombok 提供的注解不多，可以参考官方视频的讲解和官方文档。
- Lombok 注解在线帮助文档：http://projectlombok.org/features/index.
- 常用的 lombok 注解：
    - `@Data` ：注解在类上；提供类所有属性的 getting 和 setting 方法，此外还提供了equals、canEqual、hashCode、toString 方法
        - 功能上被包含于`Data注解`
        - `@Setter`：注解在属性上；为属性提供 setting 方法
        - `@Getter`：注解在属性上；为属性提供 getting 方法
    - `@Log4j` ：注解在类上；为类提供一个 属性名为log 的 log4j 日志对象
    - `@NoArgsConstructor`：注解在类上；为类提供一个无参的构造方法
    - `@AllArgsConstructor`：注解在类上；为类提供一个全参的构造方法

### maven引入
```
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.16.10</version>
            <scope>provided</scope>
        </dependency>
```
### gradle引入
```
        buildscript {
          repositories {
            maven {
              url "https://plugins.gradle.org/m2/"
            }
          }
          dependencies {
            classpath "info.robotbrain.gradle.lombok:lombok-gradle:1.1"
          }
        }

        apply plugin: "info.robotbrain.lombok"
```


********************
## jackson
- [注解的讲解](http://blog.csdn.net/sdyy321/article/details/40298081)