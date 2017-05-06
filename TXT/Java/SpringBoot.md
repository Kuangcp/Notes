# Spring Boot 框架
## 安装Spring Boot
- 安装SDKMAN
    - 使用git bash运行  `curl -s get.sdkman.io | bash`
    - `source "/Users/{yourname}/.sdkman/bin/sdkman-init.sh" `根据实际目录去运行
    - spring --version

- idea 中新建Spring init设置名字，选择构建工具，选择好起步依赖web jpa h2 thymeleaf 就可以了
- 得到的项目中有俩个类，一个是引导入口类，一个是测试类
- 新建一个 Controller 并且新建视图对应的HTML
- *注意 controller类要和引导类同包或子包*
- [起点项目]()
***************************************

## IDEA 新建一个Springboot web项目并使用Gradle构建
-  安装sdkman 包管理器 或者chocolatey
-  使用包管理器来安装 gradle groovy Springboot
-  安装好Gradle 3.0+
-  new Module 选initial那个，选好需要的模块 web，jdbc mysql mybabtis freemake redis Security 
-  指定项目基本信息，选择Gradle Project war
- 新建一个application.yml 文件，配置数据库连接数据

`配置文件 application.yml`
```
	spring:
  profiles:
    active: development //选用开发模式
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

    #server:
    #  port: 8443
    #  ssl:
    #    key-store: classpath:key/keystore.p12
    #    key-store-password: kuang1104
    #    keyStoreType: PKCS12
    #    keyAlias: tomcat

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

`build.gradle`

```
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
    配置main
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

***************************************

## Springboot集成SpringSecurity
- 添加依赖
```
   <dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-security</artifactId>
	</dependency>
```

```
   @Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired
  private ReaderRepository readerRepository;


  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http
      .authorizeRequests()
        .antMatchers("/").access("hasRole('READER')")//要求登陆者进入根目录必须具有 READER 的角色
        .antMatchers("/**").permitAll()//其他页面开放了权限
      .and()
      .formLogin()
        .loginPage("/login")//登录表单的路径
        .failureUrl("/login?error=true");
  }
  
  @Override
  protected void configure(
              AuthenticationManagerBuilder auth) throws Exception {
    auth
      .userDetailsService(new UserDetailsService() {//定义自定义的UserDetailService
        @Override
        public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
          UserDetails userDetails = readerRepository.findOne(username);
          if (userDetails != null) {
            return userDetails;
          }
          throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
      });
  }

}
```

```
   public interface ReaderRepository extends JpaRepository<Reader, String> {
   }
```
```
        //登录实体类
       @Entity
    public class Reader implements UserDetails {

      private static final long serialVersionUID = 1L;

      @Id
      private String username;
      
      private String fullname;
      private String password;
      
      public String getUsername() {
        return username;
      }
      
      public void setUsername(String username) {
        this.username = username;
      }
      
      public String getFullname() {
        return fullname;
      }
      
      public void setFullname(String fullname) {
        this.fullname = fullname;
      }
      
      public String getPassword() {
        return password;
      }
      
      public void setPassword(String password) {
        this.password = password;
      }

      //授予READER权限
      @Override
      public Collection<? extends GrantedAuthority> getAuthorities() {
        return Arrays.asList(new SimpleGrantedAuthority("ROLE_READER"));
      }

      //不过期
      @Override
      public boolean isAccountNonExpired() {
        return true;
      }

      //不加锁
      @Override
      public boolean isAccountNonLocked() {
        return true;
      }

      //不禁用
      @Override
      public boolean isCredentialsNonExpired() {
        return true;
      }

      //可用
      @Override
      public boolean isEnabled() {
        return true;
      }

    }
```

******************************

## 数据库模块
### JPA_SQL
1.引入依赖
2.继承接口，打好实体类的注解
3.自动注入直接使用

- jpa是声明特定方法的接口，让jpa来实现并自动注入，如果是没有的方法，就可以使用@Query注解
    - 默认使用的是HQL（HQL是基于类的所以使用的是类的名字不是表的名字），可以设置下使用原生SQL
#### 数据库上的事务支持


### JPA_NoSQL
#### JPA关于redis的使用

*************************

## Springboot的测试模块
- 可以使用MockMvc来测试Controller层的代码
- 可以使用MockMvc的SpringSecurity支持来测试安全模块
- 使用 WebIntegraionTest 测试运行中的Web容器
	- 启动嵌入式的Servlet容器来进行测试，下断言
- 使用随机端口启动服务器 配置local.server.port=0
- 使用Selenium来测试HTML页面，模拟浏览器的动作，查看系统运行状态


***************************
## Web模块
### REST的使用
1.添加依赖
```
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-rest</artifactId>
    </dependency>
```
2.引入自动配置类
```
    @Configuration
    public class RestConfiguration extends RepositoryRestMvcConfiguration {
        @Override
        public RepositoryRestConfiguration config() {
            return super.config();
        }
        // 还可以重写Config开头的方法
    }
```
3.配置repository的名字例如：
```
    @RepositoryRestResource(path = "book")
    public interface BookDao extends JpaRepository<Book,Long>{
```
4.启动应用，控制台有如下输出

- ![示例图片]()
- 可以清楚的看到有关路径的使用方法
    - GET 查询单个 /repo/id 成功：200 失败404
    - GET查询所有 /repo 成功200 失败404
    - POST 新增 /repo json数据发送 成功 201 失败404
    - DELETE 删除 /repo/id json数据 成功204 失败404
    - PUT更新 /repo/id json 更新成功200 没有该id就插入201 失败404（使用主键自动增长就不会遇到404）

*************************************
## 部署
### war
部署为war必须的类
```
    public class ServletInitializer extends SpringBootServletInitializer {

        @Override
        protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
            return application.sources(DemoApplication.class);
        }

    }
```

### jar




