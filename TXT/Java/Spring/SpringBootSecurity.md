## Springboot集成SpringSecurity
### 创建单用户单角色的安全控制
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

      //省略setget

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

*********************************************

### 多用户多角色的实现思路
- 使用多个实体类（实现了UserDetails接口），一个权限类，再一个多对多连接，就得到了多用户，多权限的控制
- 在页面上加上角色的判断来控制数据显示，业务操作等功能

- 根据书上案例代码，可以得出结论，用户表，角色表，用户角色关联表，用户表是可以多张的，角色公用一张即可，然后关联表也对应的多张，就能实现具体的业务需求
    - 例如：一个网上在线阅读书城，作家和读者以及编辑，网站后台管理员等角色的不同权限对应的页面甚至页面上细分的各个模块
    
- `Author` `Admin` `Reader` 三个类
`继承了UserDetails接口的实体类的配置`
```
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
    public String getUsername() {
        return this.reader_name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
```

- 设置好`spirng.jpa.hibernate.ddl-auto=update`
- 第一次运行还会有这样的提示,说明了他正在根据多对多映射创建表，也体现了这个多种用户模式下需要实体等量的连接表

```
    Table not found: admin
    Table not found: admin
    Table not found: admin_roles
    Table not found: admin_roles
    Table not found: all_roles
    Table not found: all_roles
    Table not found: author
    Table not found: author
    Table not found: author_roles
    Table not found: author_roles
    Table not found: reader
    Table not found: reader
    Table not found: reader_roles
    Table not found: reader_roles
```
