`目录 start`
 
- [SpringMVC](#springmvc)
    - [MVC思想](#mvc思想)
    - [API](#api)
    - [配置](#配置)
    - [使用](#使用)
        - [自定义拦截器](#自定义拦截器)
        - [Q&A](#q&a)

`目录 end` *目录创建于2018-01-14*
****************************************

# SpringMVC

## MVC思想
> [参考博客](http://blog.csdn.net/besley/article/details/8479943)
![图](https://raw.githubusercontent.com/Kuangcp/ImageRepos/master/Tech/Model/mvc.png)

## API 
> [简洁的API设计](http://www.csdn.net/article/2013-05-02/2815115-stop-designing-fragile-web-api)

## 配置
> 如果引入了别的模板引擎就不需要配置解析器，不然就要配

- 没有用模板引擎，配置前后缀 没有用什么原因？？？ classpath:/templates/  .html

- [较完善的入门博客](https://www.tianmaying.com/tutorial/spring-mvc-quickstart)

## 使用
> 在Springboot框架中，static templates 文件夹下分别代表了tomcat管理的静态文件和MVC负责跳转的HTML文件或JSP文件
> 在static中对于路径的使用一定要带上应用路径，而在templates中就只要写相对路径即可


### 自定义拦截器
- [相关博客](http://www.jianshu.com/p/f14ed6ca4e56)|[相关博客](http://blog.csdn.net/catoop/article/details/50501696)

`定义拦截器类`
```java
public class MythInterceptor extends HandlerInterceptorAdapter{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Long startTime = System.currentTimeMillis();
        request.setAttribute("startTime",startTime);
        return true;// true就继续跳转，false就停止
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        long startTime = (Long)request.getAttribute("startTime");
        request.removeAttribute("startTime");
        Long endTime = System.currentTimeMillis();
        log.info(request.getRequestURL()+"发起请求耗时:[ "+ (endTime - startTime) +"  ms]");
    }
}
```
`配置MVC的配置类`
```java
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter{
    //自定义拦截器bean
    @Bean
    public MythInterceptor mythInterceptor(){
        return new MythInterceptor();
    }
    //注册拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //拦截器的URL正则
        registry.addInterceptor(mythInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
    // 自定义错误页面 需要放在静态资源下面
    @Bean
    public EmbeddedServletContainerCustomizer containerCustomizer() {
        return (container -> {
            ErrorPage error401Page = new ErrorPage(HttpStatus.FORBIDDEN, "/500.html");
            ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/404.html");
            ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.html");
            container.addErrorPages(error401Page, error404Page, error500Page);
        });
    }
}
```



### Q&A
URL 中带了 jsessionid 参数，导致页面各种问题
- 一种原因：禁用cookie导致的
- 最终解决： chrome中在设置里清除localhost的所有cookie和缓存

- [解决问题参考博客](https://yq.aliyun.com/articles/101169)
- [jsessionid的作用](http://sxsoft.blog.163.com/blog/static/190412229200911103116773)
