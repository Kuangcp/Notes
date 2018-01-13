`目录 start`
 
- [Web安全](#web安全)
    - [HTTP](#http)
    - [安全](#安全)
        - [CSRF](#csrf)
            - [【JWT】](#jwt)

`目录 end` *目录创建于2018-01-14*
****************************************
# Web安全

## HTTP

HTTP 基础原理
[HTTP Basic](https://www.ntu.edu.sg/home/ehchua/programming/webprogramming/HTTP_Basics.html)




## 安全

关注常见的比如 XSS CSRF SQL注入 上传等问题的原理和修复方案。还有密码安全也基本上是面试必考点。

作为开发人员，需要详细了解安全问题的原理。 比如XSS的原理是因为用户将它的数据变成了代码，在页面中跑起来了，所以就可以为所欲为。 CSRF则是当用户不知情时，被黑客的网页通过图片、表单等请求时，用户的登录态（Cookies）在不知情的情况下会被发送到服务器，导致用户在不知情的情况下被利用身份。 点击支持则是网页被嵌入到了其他网站中，并通过视觉隐藏的方式引导用户进行一些不知情的操作。 上传导致的漏洞是因为用户的文件没有做好判断和处理，导致传上来的文件被当成程序执行了。 SQL注入是用户的数据被当成了表示SQL语义的部分，改变了原来的查询语句的语义，从而产生意料之外的结果。

反向代理服务器，构建在web服务器与 客户端之间，保护web服务器，服务器发送到客户端的请求被代理

### CSRF
> CSRF (Cross Site Request Forgery)，它讲的是你在一个浏览器中打开了两个标签页，其中一个页面通过窃取另一个页面的 cookie 来发送伪造的请求，因为 cookie 是随着请求自动发送到服务端的。

#### 【JWT】
- [Blog:通过使用JWT来防御CSRF](https://segmentfault.com/a/1190000003716037)
- [Blog:介绍JWT](blog.leapoahead.com/2015/09/06/understanding-jwt/)`其实JWT还经常用于设计用户认证和授权系统，甚至实现Web应用的单点登录。`
- [Blog:单点登录](http://blog.leapoahead.com/2015/09/07/user-authentication-with-jwt/)