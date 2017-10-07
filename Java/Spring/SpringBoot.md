# SpringBoot
## 目录

*****
## 安装SpringBootCLI
- 安装SDKMAN
    - 使用git bash运行  `curl -s get.sdkman.io | bash`
    - `source "/Users/{yourname}/.sdkman/bin/sdkman-init.sh" `根据实际目录去运行
    - spring --version

- *注意：所有`Controller`类要和`*Application`类 *同包或子包*


## Springboot的测试模块
- 可以使用MockMvc来测试Controller层的代码
- 可以使用MockMvc的SpringSecurity支持来测试安全模块
- 使用 WebIntegraionTest 测试运行中的Web容器
	- 启动嵌入式的Servlet容器来进行测试，下断言
- 使用随机端口启动服务器 配置local.server.port=0
- 使用Selenium来测试HTML页面，模拟浏览器的动作，查看系统运行状态

*****
## 配置文件
> [配置文件的使用](http://www.itwendao.com/article/detail/391009.html)
## Web模块

### 上传下载文件
> 第一种直接上传到应用的webroot或者resources目录下，第二种上传到数据库中，第三种使用ftp。

- [Springboot上传文件](http://www.cnblogs.com/studyCenter/p/6665171.html)

***************************************
## 项目部署
### 生成指定文件
#### war
- 部署为war必须的类，一般在创建项目时选war就会自动生成，选jar就要手动添加
```
    public class ServletInitializer extends SpringBootServletInitializer {

        @Override
        protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
            return application.sources(DemoApplication.class);
        }

    }
```
- maven： `mvn war` 即可
- gradle: `gradle war` 然后 `gradle bootRepackage` 即可

#### jar
- 没有特殊的配置，打包即用
    - maven: `mvn package` 即可生成可执行的jar
    - gradle:`gradle jar` 然后 `gradle bootRepackage` 也生成可执行jar

### 构建docker镜像
> 方便监控应用状态，cpu 内存 流量

#### gradle结合docker
`build.gradle`
```
apply plugin: 'docker'
task buildDocker(type: Docker, dependsOn: build) {
    push = true
    applicationName = jar.baseName
    dockerfile = file('src/main/docker/Dockerfile')
    doFirst {
        copy {
            from war
            into stageDir
        }
    }
}
```
`Dockerfile`
```
FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD weixin-1.0.0.war app.war
ENTRYPOINT ["java","-jar","/app.war"]
```