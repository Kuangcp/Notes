`目录 start`
 
    - [IDEA 新建一个Springboot web项目并使用Gradle构建](#idea-新建一个springboot-web项目并使用gradle构建)
            - [配置文件](#配置文件)
                - [构建文件](#构建文件)

`目录 end` *目录创建于2018-01-14*
****************************************
## IDEA 新建一个Springboot web项目并使用Gradle构建
- `Windows平台下：安装sdkman 包管理器 或者chocolatey`
- `使用包管理器来安装 groovy Springboot`
- 上面都是可选的，然后安装好Gradle 3.0+
- new Module 选initial那个，选好需要的模块 web，jdbc mysql mybabtis freemake redis Security 下一步
- 指定项目基本信息，选择Gradle Project war 下一步
- 新建一个`application.yml` 文件，配置数据库连接数据

#### 配置文件
`配置文件 application.yml`
```yml
	spring:
  profiles:
    active: development # 选用开发模式
  thymeleaf:
    cache: false
  datasource:
      url: jdbc:mysql://localhost/test
      username: root
      password: mysql1104
      dbcp2:
        driver-class-name: com.mysql.jdbc.Driver
        max-conn-lifetime-millis: 30000
        max-idle: 10
        max-total: 100
        min-idle: 6
        max-wait-millis: 10000
    logging:
      level:
        root: info
    # 开发模式相关的配置
    ---

    spring:
      profiles: development

    logging:
      level:
        root: info
        org:
          springframwork:
            security: debug
      path: classpath:/logs/
      file: Demo.log

    # 发行时采用的配置信息
    ---
    spring:
      profiles: production

    logging:
      level:
        root: warn
        org:
          springframwork:
            security: warn
      path: classpath:logs/
      file: Demo.log
```

- 也可以将上面的开发部分，上线部分的配置创建两个配置文件 `application-dev.properties` 和 `application-prod.properties`
- 在主配置文件`application.yml`中指明
```yml
    spring:
      profiles:
        active: dev或者是prod
      datasource:
        driver-class-name: com.mysql.jdbc.Driver
        url: jdbc:mysql://127.0.0.1:3306/test
        username: root
        password: mysql1104
      jpa:
        hibernate:
          ddl-auto: update
        show-sql: true
      mvc:
        favicon:
          enabled: true
      thymeleaf:
        cache: false
      jackson:
        serialization: true
      data:
        rest:
          base-path: /rest
    server:
      context-path: /myth
```
`application-dev.properties` 文件
```conf
    # Servlet contain
    server.port=8888
    server.session.timeout=300

    # Log Config
    logging.file=log/myth.log
    logging.level.root=info
    logging.level.root.org.springframework.security=debug

    # MVC Config
    spring.mustache.enabled=true
    spring.mustache.prefix=classpath:/templates/
    spring.mustache.view-names=.html
            
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
***********************************

##### 构建文件

`build.gradle`
```groovy
	buildscript {
	ext {
		springBootVersion = '1.5.1.RELEASE'
	}
	repositories {
		mavenCentral()
	}
	dependencies {
		classpath("org.springframework.boot:spring-boot-gradle-plugin:${springBootVersion}")
	    }
    }

    apply plugin: 'java'
    apply plugin: 'idea'
    apply plugin: 'org.springframework.boot'
    apply plugin: 'war'

    version = '0.0.1-SNAPSHOT'
    sourceCompatibility = 1.8

    repositories {
	    mavenCentral()
    }

    configurations {
	    providedRuntime
    }

    dependencies {

	    compile('org.springframework.boot:spring-boot-starter-data-redis')
	    compile('org.springframework.boot:spring-boot-starter-freemarker')
	    compile('org.springframework.boot:spring-boot-starter-jdbc')
	    compile('org.mybatis.spring.boot:mybatis-spring-boot-starter:1.2.0')
	    compile('org.springframework.boot:spring-boot-starter-security')
	    compile('org.springframework.boot:spring-boot-starter-web')
	    runtime('mysql:mysql-connector-java')
	    providedRuntime('org.springframework.boot:spring-boot-starter-tomcat')
	    testCompile('org.springframework.boot:spring-boot-starter-test')
    }
    sourceSets.main.java.srcDirs=['src/main/java','src/main/groovy']
    //配置main
    jar{
	    manifest{
		    attributes 'Main-Class' : 'com.myth.MythApplication'
	    }
    }

```
- 新建一个 groovy包和java并列，目的是使用groovy简洁的构建实体对象简化代码
- 要将groovy和java 共同编译 就要加入`sourceSets.main.java.srcDirs=['src/main/java','src/main/groovy']`
- 然后使用gradle内置的bootrun即可运行项目，切换模式可以看到控制台的输出信息，没有错误即可
- 如果想要打包出来运行，就配置一个manifest 配置一个main类，就可以使用java -jar 命令运行war包了


`如果要放在tomcat等web容器中运行，就要和Application同级目录下新建该类`
```java
  public class ServletInitializer extends SpringBootServletInitializer {
      @Override
      protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
          return application.sources(DemoApplication.class);
      }
  }
```


