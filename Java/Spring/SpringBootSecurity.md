`目录 start`
 
- [Springboot集成SpringSecurity](#springboot集成springsecurity)
    - [Demo](#demo)
        - [快速上手-初步入门：](#快速上手-初步入门)
            - [创建单用户单角色的安全控制](#创建单用户单角色的安全控制)
            - [多用户多角色的实现思路](#多用户多角色的实现思路)
                - [每个身份都使用一个登录实体类](#每个身份都使用一个登录实体类)
                - [另一种思路：](#另一种思路)
    - [实现细节](#实现细节)
        - [关于注解的几种使用方式](#关于注解的几种使用方式)
            - [@Secured](#@secured)
            - [@RolesAllowed](#@rolesallowed)
            - [SpringSecurity3.0 开始提供了 SpEL表达式](#springsecurity30-开始提供了-spel表达式)
        - [保护方法应用](#保护方法应用)

`目录 end` *目录创建于2018-01-14*
****************************************
# Springboot集成SpringSecurity
## Demo
### 快速上手-初步入门：
#### 创建单用户单角色的安全控制
- 添加依赖
```xml
   <dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-security</artifactId>
	</dependency>
```

```java
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
        auth.userDetailsService(new UserDetailsService() {//定义自定义的UserDetailService
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
`Repository类`
```java
   public interface ReaderRepository extends JpaRepository<Reader, String> {}
```
```java
    //登录实体类
    @Entity
    public class Reader implements UserDetails {
      private static final long serialVersionUID = 1L;
      @Id
      private String username;
      private String fullname;
      private String password;
      //省略setget
      //授予READER权限
      @Override
      public Collection<? extends GrantedAuthority> getAuthorities() {
        return Arrays.asList(new SimpleGrantedAuthority("ROLE_READER"));
      }
      //不过期
      @Override
      public boolean isAccountNonExpired() { return true;}
      //不加锁
      @Override
      public boolean isAccountNonLocked() {return true;}
      //不禁用
      @Override
      public boolean isCredentialsNonExpired() {return true;}
      //可用
      @Override
      public boolean isEnabled() { return true;}
    }
```

*************************

#### 多用户多角色的实现思路
- 使用多个实体类（实现了UserDetails接口），一个权限类，再一个多对多连接，就得到了多用户，多权限的控制
- 在页面上加上角色的判断来控制数据显示，业务操作等功能

- 根据书上案例代码，可以得出结论，用户表，角色表，用户角色关联表，用户表是可以多张的，角色公用一张即可，然后关联表也对应的多张，就能实现具体的业务需求
    - 例如：一个网上在线阅读书城，作家和读者以及编辑，网站后台管理员等角色的不同权限对应的页面甚至页面上细分的各个模块
    
- `Author` `Admin` `Reader` 三个类
`继承了UserDetails接口的实体类的配置`
```java
    //配置多对多的关系，用户和角色（权限）之间的关系,是通用的改下属性名即可
    @ManyToMany(cascade = {CascadeType.REFRESH},fetch = FetchType.EAGER)
    private List<AllRoles> roles ;
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
        List<AllRoles> roles = this.getRoles();
        for(AllRoles role:roles){
            auths.add(new SimpleGrantedAuthority(role.getRole_name()));
        }
        return auths;
    }
    // 登录的用户名，如果属性不是叫username，就要重写，返回应该的用户名属性就是了
    @Override
    public String getUsername() { return this.reader_name;}
    @Override
    public boolean isAccountNonExpired() {return true;}
    @Override
    public boolean isAccountNonLocked() {return true;}
    @Override
    public boolean isCredentialsNonExpired() {return true;}
    @Override
    public boolean isEnabled() {return true;}
```
##### 每个身份都使用一个登录实体类
- 然后使用不同的dao层查询，显然的实体类登录查询的效率及其低且不易扩展
- 设置好`spirng.jpa.hibernate.ddl-auto=update`
- 第一次运行还会有没有实体对应的表这样的提示,说明了他正在根据多对多映射创建实体表，也体现了这个多种用户模式下需要实体等量的连接表
- 所以这个是要查询多张表了
    - （除非UserDetailService接口的loadUserByUsername能收到表类别的参数）
    - 也可以考虑使用一个字符串，然后用`特殊字符`把类型放进去，然后正则取出来
    - 登录页面就需要自定义一个函数进行拼接（或者使用校验来拼接？）
      
##### 另一种思路：
- 使用一个登录用户表（序列id，用户名，密码，用户编码（对应多张表））
- 角色表（序列id，用户编码，角色） 
这样的话扩展就只要加表，使用同一个主键生成策略就可以了

- 思考：
    - 其实这个安全框架使用的是角色控制，而不是权限控制，目前的了解，达不到Oracle那样的权限加角色控制

******************************************************************

## 实现细节
### 关于注解的几种使用方式
#### @Secured 
- 这是基于Spring特定的注解
#### @RolesAllowed 
- JSR-250的@RolesAllowed Java标准定义的注解，与上面的注解是差不多的
- 但是都是有局限性，只能判断请求是否有权限，不能进行更多的自定义判断
#### SpringSecurity3.0 开始提供了 SpEL表达式
`需要先配置这个配置类，后面的注解才会生效`
```java
    @Configuration
    @EnableGlobalMethodSecurity(prePostEnabled = true)
    public class MethodSecurityConfig extends GlobalMethodSecurityConfiguration{}
```

- `@PreAuthorize` 方法调用前，基于表达式的计算结果来限制方法的访问
- `@PostAuthorize` 允许方法调用，如果表达式是false 抛出安全异常
- `@PostFilter` 允许方法调用，按照表达式来过滤方法的结果
- `@PreFilter` 允许方法调用，必须进入方法前过滤输入值

- 方法调用前验证权限，示例:
    - `@PreAuthorize("hasRole('ROLE_ADMIN')")` 只允许该权限的用户访问
    - 方法入参user，限定读者用户的text长度小于140，或者是作家用户无限制
    - `@PreAuthorize("(hasRole('ROLE_READER') and #user.text.length()<=140 ) or hasRole('ROLE_AUTHOR')") `
- 方法调用之后验证权限，示例;
    - `@PostAuthorize("returnObject.spitter.username == principal.username")`
    - public Spittle getSpittleById(long id){} 
    - 保护方法，只有当返回的对象就是当前登录的用户时，才返回，不然抛出安全异常
`以上是保护方法的调用，但是有时候保护的是数据的输入输出：`
- 过滤方法的输入输出
    - 事后对方法的返回值进行过滤
        - `@PreAuthorize("hasAnyRole({'ROLE_ADMIN','ROLE_USER'})")`
        - `@PostFilter("hasRole('ROLE_ADMIN') || filterObject.user.username == principal.name")`
        - `public List<User> getUsers(){}`
        - 该示例就是限制了如果是管理员可以获取到所有数据，普通用户只能看到自己
        - 但是这种实现是不好的，只是一个例子，只获取自己，重载方法加个id参数就好了，上面的实现，把数据全拿出来再判断，性能上。。。
    - 事先对方法的参数进行过滤
        - `@PreAuthorize("hasAnyRole({'ROLE_ADMIN','ROLE_USER'})")`
        - `@PreFilter("hasRole('ROLE_ADMIN') || targetObject.user.username == principal.name")`
        - `public void deleteUsers(){List<User> users}`
        - 示例实现了传入一个集合，要删除的用户，但是当前用户只能删除自己，管理员才能删除集合里所有的用户
    - 定义许可计算器
        - `@PreFilter("hasPermission(targetObject,'delete')")` 用户是否有权限删除目标对象？
        - 使用了自定义的计算器类来实现这个判断，表达式简洁，但是自定义类不好写
        - 实现PermissionEvaluator接口，新建hasPermission方法，功能就是判断是否有权限，其实就是对比目标对象是不是当前用户
        - 创建好类后，重载GlobalMethodSecurityConfiguration配置类的createExpressionHalder方法，注册进去
        - `DefaultMethodSecurityExperssionHandler ex = new De...();`
        - `ex.setPermissionEvaluator(new 自定义类);`
        - `return ex;`
    
    
### 保护方法应用
- @Secured 注解限制方法调用

## 社交登录
> [SpringForAll社区:Spring Security源码分析（三）：Spring Social实现QQ社交登录 ](https://mp.weixin.qq.com/s?__biz=MzU0MDEwMjgwNA==&mid=2247484230&idx=1&sn=358f684bd122888270730f2b102ee1b2&chksm=fb3f1abdcc4893ab9dc400a44edfe7a9d483c070b78db1d81f70c4a3d7870d113d9287d81b0f&mpshare=1&scene=1&srcid=0121kLxdu4ezkmeJAoJcdMZ1&pass_ticket=LGmo8DCbLhUXTV%2FDVv1W9SyGxNSXxxYLrKODVeXD8f3lkWt2HnMB5b7racYt5W6V#rd)  
> [SpringForAll社区:Spring Security 源码分析（四）：Spring Social实现微信社交登录 ](https://mp.weixin.qq.com/s?__biz=MzU0MDEwMjgwNA==&mid=2247484233&idx=1&sn=1e84ffd8c9169db56a0d48ccb31bc842&chksm=fb3f1ab2cc4893a4263799c466d73ee67971ce9deb22a91b8ae8e968621679de3bce83a2c558&mpshare=1&scene=1&srcid=0121cjpvaOeB0nktdOSQNitj&pass_ticket=LGmo8DCbLhUXTV%2FDVv1W9SyGxNSXxxYLrKODVeXD8f3lkWt2HnMB5b7racYt5W6V#rd)

