#Spring Boot 框架

## 安装Spring Boot
- 安装SDKMAN
    - 使用git bash运行  `curl -s get.sdkman.io | bash`
    - `source "/Users/{yourname}/.sdkman/bin/sdkman-init.sh" `根据实际目录去运行
    - spring --version

- idea 中新建Spring init设置名字，选择构建工具，选择好起步依赖web jpa h2 thymeleaf 就可以了
- 得到的项目中有俩个类，一个是引导入口类，一个是测试类
- 新建一个 Controller 并且新建视图对应的HTML
- **注意 controller类要和引导类同包或子包**

[起点项目]()

## 安全模块
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

## 数据库模块


## 测试模块
- 可以使用MockMvc来测试Controller层的代码
- 可以使用MockMvc的SpringSecurity支持来测试安全模块
- 使用 WebIntegraionTest 测试运行中的Web容器
	- 启动嵌入式的Servlet容器来进行测试，下断言
- 使用随机端口启动服务器 配置local.server.port=0
- 使用Selenium来测试HTML页面，模拟浏览器的动作，查看系统运行状态
