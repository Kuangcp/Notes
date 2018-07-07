`目录 start`
 
- [Gradle](#gradle)
    - [书籍](#书籍)
    - [发行版本列表](#发行版本列表)
    - [安装使用](#安装使用)
        - [SDKMAN方式](#sdkman方式)
        - [Chocolate](#chocolate)
        - [命令行选项](#命令行选项)
        - [守护进程](#守护进程)
        - [Docker安装](#docker安装)
    - [配置镜像源](#配置镜像源)
    - [build.gradle](#buildgradle)
        - [dependency](#dependency)
        - [常用插件](#常用插件)
        - [统一依赖管理](#统一依赖管理)
        - [配置Gradle包管理器 Wrapper](#配置gradle包管理器-wrapper)
    - [setting.gradle](#settinggradle)
        - [Gradle多模块的构建](#gradle多模块的构建)
    - [Gradle进阶知识](#gradle进阶知识)
        - [Gradle 构建块](#gradle-构建块)
        - [task的依赖关系](#task的依赖关系)
        - [终结器 task](#终结器-task)
        - [Groovy的POGO类管理配置文件上的版本号](#groovy的pogo类管理配置文件上的版本号)
        - [增量式构建特性](#增量式构建特性)
        - [task 的inputs 和 outputs](#task-的inputs-和-outputs)
    - [编写和使用自定义task](#编写和使用自定义task)
    - [声明task规则](#声明task规则)
    - [代码目录结构](#代码目录结构)
- [Gradle 自动测试](#gradle-自动测试)
    - [单元测试](#单元测试)
        - [使用JUnit](#使用junit)
        - [使用其他框架 TestNG Spock](#使用其他框架-testng-spock)
    - [配置测试执行](#配置测试执行)
- [部署](#部署)
    - [War包](#war包)
    - [Jar包](#jar包)
    - [上传至构建仓库](#上传至构建仓库)
    - [构建Docker镜像](#构建docker镜像)
        - [第二种插件方式](#第二种插件方式)
- [多语言编程](#多语言编程)
    - [处理javascript](#处理javascript)
        - [压缩javascript](#压缩javascript)
        - [Java 和 Groovy的联合编译](#java-和-groovy的联合编译)
        - [Java 和 Scala](#java-和-scala)
    - [Jenkin 使用](#jenkin-使用)
        - [下载安装和配置](#下载安装和配置)

`目录 end` |_2018-07-07_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************

# Gradle
> [官方 guide](https://gradle.org/guides/?q=JVM)

**个人看法**
> [参考: Gradle在大型Java项目上的应用](www.infoq.com/cn/articles/Gradle-application-in-large-Java-projects)

**优缺点**
> 相关博客 [Gradle大吐槽](https://blog.csdn.net/MCL529/article/details/79341706)

> 优点  
1. 相对于Maven, 配置文件简洁了很多, 所以才入坑学习使用的
2. 对于一些需要自定义的任务,因为核心为Groovy,所以实现能力高
	- 例如:将一个SpringBoot项目构建成一个镜像,并tag上当前构建的镜像为release,然后删除旧有容器,使用新的镜像启动容器

> 缺点  
1. 内存占用巨大,存在内存泄露问题, 以至于在IDEA上不敢使用自动导入, 不然每动一下build.gradle 就会卡半天, 8G内存都不够用!!
2. 编译速度慢, 如果和Maven进行对比, 编译速度和资源占用确实慢
3. 

********************
## 书籍
> [Gradle in Action 中译](http://www.jb51.net/books/527811.html) `如果没有一点Groovy基础, 阅读自定义Task等一些高自定义的地方还是比较困惑`

## 发行版本列表
> [官方网址](http://services.gradle.org/) 有各个版本的下载以及版本发行说明
> 似乎版本越高，内存占用越大， 从4.7降级回了4.2

_4.6_
> [发行说明](https://docs.gradle.org/4.6/release-notes.html?_ga=2.214014495.909415461.1519975016-498617321.1519975016#dependency-constraints-for-transitive-dependencies) | `支持Junit5, 还有解决依赖冲突的一种声明式方式`


## 安装使用
> 和maven使用同一个本地库 只要加上 M2_HOME 环境变量即可, 值和 MAVEN_HOME 一样, 并没有用

### SDKMAN方式
- 先安装sdkman
- 使用Bash运行`curl -s "https://get.sdkman.io" | bash`
- `sdk install gradle` 即可安装

### Chocolate
- windows 上安装 chocolate
- PowerShell中运行 `wr https://chocolatey.org/install.ps1 -UseBasicParsing | iex`
- 若操作系统默认禁止执行脚本，执行一次`set-executionpolicy remotesigned`后脚本顺利执行
- Chocolatey在安装包的时候，默认路径是按照系统的默认路径来的，如果想修改安装路径可以这样处理：
1. 执行“开始/运行”命令（或者WIN + R），输入“regedit”，打开注册表。
2. 展开注册表到下面的分支[HKEY＿LOCAL＿MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion]，在右侧窗口中找到名为“ProgramFilesDir”的字符串，双击把数值“C:\Program Files”修改为“D：\ProgramFiles”，确定退出后,即可更改常用软件的安装路径了。

### 命令行选项
- `gradle 构建文件中的task名`： 直接运行task
- `-b，--build-file test.gradle` 指定运行脚本文件
- `--offline` 离线模式
- `-P ,--project-prop`:配置参数 -Pmyprop=value
- `-i,--info` : 打印info级别的输出
- `-s,--stacktrace`: 输出错误栈
- `-q,--quiet`:减少构建出错时打印的错误信息
- `tasks` : 输出所有建立的task
- `properties` : 输出所有可用的配置属性

### 守护进程
- 命令加上 `--daemon`就会开启一个守护进程，只会开启一次，
- 守护进程会在空闲3小时后销毁
- 手动关闭 `gadle --stop `
- 构建时不采用守护进程 `--no--daemon`

### Docker安装
> [Docker 文档](https://docs.docker.com/samples/library/gradle/)

****************************
## 配置镜像源
**阿里云**
> [参考博客: 配置Gradle的镜像为阿里云镜像](https://tvzr.com/change-the-mirror-of-gradle-to-aliyun.html)

当前项目的 _build.gradle_
```Groovy
repositories {
    // maven库
    def cn = "http://maven.aliyun.com/nexus/content/groups/public/"
    def abroad = "http://central.maven.org/maven2/"
    // 先从url中下载jar若没有找到，则在artifactUrls中寻找
    maven {
        url cn
        artifactUrls abroad
    }
}
```

或者 _全局配置 ~/.gradle/init.gradle_
```Groovy
allprojects{
    repositories {
        def ALIYUN_REPOSITORY_URL = 'http://maven.aliyun.com/nexus/content/groups/public'
        def ALIYUN_JCENTER_URL = 'http://maven.aliyun.com/nexus/content/repositories/jcenter'
        all { ArtifactRepository repo ->
            if(repo instanceof MavenArtifactRepository){
                def url = repo.url.toString()
                if (url.startsWith('https://repo1.maven.org/maven2')) {
                    project.logger.lifecycle "Repository ${repo.url} replaced by $ALIYUN_REPOSITORY_URL."
                    remove repo
                }
                if (url.startsWith('https://jcenter.bintray.com/')) {
                    project.logger.lifecycle "Repository ${repo.url} replaced by $ALIYUN_JCENTER_URL."
                    remove repo
                }
            }
        }
        maven {
        	url ALIYUN_REPOSITORY_URL
            url ALIYUN_JCENTER_URL
        }
    }
}
```
***************************************
## build.gradle
_一个简单示例_
```groovy
   task helloworld{
      doLast {
         printf 'Hello World!'
      }
   }
   // 或者是 使用 << 代表doLast：
   task helloworld<<{
      println 'Hello world!'
   }
```
-  运行：`gradle -q helloworld`

### dependency
- 和Maven用的是同一种方式 三个基本坐标
- 本地依赖 `compile files('lib/ojdbc-14.jar')` 相对的根目录是src同级目录
- 但是依赖的类别要多于Maven
    - compile
    - testCompile
    - runtime
    - provide

### 常用插件
- lombok
    - `compile 'org.projectlombok:lombok:1.16.16'`

- maven 
    - `apply plugin: "maven"` 然后就能执行 install等命令了
    - gradle 4.8 用不了 [需要这种方式](https://blog.csdn.net/mxw2552261/article/details/78640338)
- shadowJar 含依赖进行打包
- docker 提供Docker操作
    - `apply plugin: 'docker'`
    - buildscript dependencies 中添加`classpath('se.transmode.gradle:gradle-docker:1.2')`

### 统一依赖管理
新建一个文件 _dependency.gradle_
```groovy
ext {
    ver = [
            junit     : '4.12',
    ]
    libs = [
            "junit"          : "junit:junit:$ver.junit",
    ]
}
```
- 在 build.gradle 中引入 `apply from: 'dependency.gradle'`
- 使用依赖时 只需 `compile libs['junit']`即使在子模块中也是如此使用


### 配置Gradle包管理器 Wrapper
> 在使用IDE生成项目的时候，可以选择gradle的执行目录，可以选`gradle wrapper` 也可以选自己下载解压的完整包
> 如果使用的不是这个wrapper，那么别人在下载项目后，运行gradle命令就要先安装gradle，使用wrapper更好
```groovy
   task wrapper(type: Wrapper){
      gradleVersion = '1.7'
      distributionUrl = '限定访问内网的URL'
      distributionPath = '包装器被解压缩放的相对路径'
   }
```
- 运行 gradle wrapper 一次即可开始使用包装器的脚本来构建项目了
- 生成gradle包管理器：`gradle wrapper --gradle-version 2.0`

## setting.gradle
> 项目的配置信息, 一般存在这个文件的时候, Gradle就会认为当前目录是作为一个完整的根项目的, 并在当前目录添加 .gradle 目录  
> 一般默认内容为 `rootProject.name = ''`

### Gradle多模块的构建
> [完整示例 JavaBase](https://github.com/Kuangcp/JavaBase)`统一配置依赖, 管理多模块` 

_setting.gradle_
```groovy
    rootProject.name = 'JavaBase'
    include('java-io', 'java-test')
```
_父项目的build.gradle_
```groovy
// 避免中文报错, 应该旧版本需要
[compileJava, compileTestJava, javadoc]*.options*.encoding='UTF-8'

allprojects {
    apply plugin: 'java'
    group 'com.github.kuangcp'
    sourceCompatibility=1.8
    targetCompatibility=1.8
    repositories {
        mavenLocal()
        mavenCentral()
    }
}
```
_如果要添加一个项目也简单_
1. 直接新建一个目录 test
1. 目录下新建空的文件 build.gradle
1. 在根项目的 setting.gradle 中的include 加入 test (可以和文件夹不同名, build.gradle配置下就行了, 建议同名)
1. gradle build 整个项目, 就完成了
1. 最后就是手动的新建项目结构

***************

以下是以往的经验, 存在错误: 
_目录结构_
- RedisClient
    - Core
    - Website
    
``` groovy
    rootProject.name = 'RedisClient'
    include 'Core','Website'
``` 
- 如果只是同级的目录，就直接新建，无需配置，引用类时添加下依赖即可，但是这样只能运行，不能打包构建
- [有关多模块的构建详情参考这里](https://github.com/Kuangcp/GradleIntegrationMultipleModules)
- [参考更为规范的多项目构建](https://github.com/someok/gradle-multi-project-example)
    - 依赖另一个模块的代码 `compile project(":redis_core")` 


********************************
## Gradle进阶知识
> [davenkin的学习仓库](https://github.com/davenkin/gradle-learning)
> [个人学习Gradle的记录仓库](https://github.com/Kuangcp/LearnGradle)

### Gradle 构建块
- 三个基本块 project task property， 使用DDD（领域驱动设计）
- 一个真实的项目包含多个project 而 Project又包含多个task ，task之间通过依赖来确保执行顺序
- build.gradle 和 pom.xml 作用是一致的，但是gradle可以使用一份源码 构建出多种想要的目标程序
- gradle 也方便构建多模块项目

### task的依赖关系
```groovy
   version = '0.1-SNAPSHOT'
   task first {
   	println 'First Run !'
   }
   task second {
   	println 'Second Run !'
   }
   task printVersion (dependsOn:[second,first]){
   	doLast {
   		println "Version : $version"
   		logger.quiet "Version : $version"
   	}
   }
   task third <<{
	println 'Third Run!'
   }
   third.dependsOn('printVersion')
```

- 如果把second的定义放在First前面，就会先运行second
- 这个例子就说明了，被依赖方的运行，不是按照声明的顺序，而是定义的顺序
    - （因为依赖是只要被依赖方执行即可，和顺序关系不是很大）
- 还可以使用SLF4J的logger实现
    - 日志级别 DEBUG,ERROR,INFO,TRACE,WARN ,还有QUIET...
- 如果 是 `gradle -b tasksL.gradle -q third` 就会运行所有的task，因为这是最后一层依赖
    - 如果 是`gradle -b tasksL.gradle -q printVersion` 就会只运行 printVersion 如果整个文件有编译错误也是不运行的

### 终结器 task
```Groovy
   task f<<{println 'first'}
   task s<<{println 'second'}
   f.finalizedBy s
   //当运行 gradle f 就会自动触发 s
   //如果gradle s 就和f没有任何关系了
```
### Groovy的POGO类管理配置文件上的版本号
- [taskL.gradle](https://github.com/Kuangcp/LearnGradle/blob/master/demo/tasksL.gradle)
-  gradle -b tasksL.gradle -q printVersion
-  虽然只是 运行了这个task 但是读取文件的task也被自动调用了
-  因为Gradle的构建生命周期阶段如下: 初始化、配置和执行 读取文件就属于配置阶段
	- **注意** : 项目的每一次构建都会运行属于配置阶段的代码，即使你只是运行了 gradle tasks

***************************

### 增量式构建特性
- 如果Java源文件与最后一次运行的构建不同的话，运行 `compileJava task` 将充分提高构建的性能

### task 的inputs 和 outputs
- 流程 : inputs -> |task| -> outputs
- gradle通过比较两个task的inputs和outputs来决定task是否最新
    - 如果inputs和outputs没有改变 就不会执行该task
    - 输入和输出可以是，一个文件，多个文件，一个目录，一个property属性
- [示例代码:turnVersion.gradle](https://github.com/Kuangcp/LearnGradle/blob/master/demo/turnVersion.gradle)
    - makeRealeseVersion : 将一个项目的版本切换为发布版本 
    - IOReleaseVersion : 通过inputs/outputs来添加增量式构建支持 
        - 发现并不能得到书上的预期效果，书上是说改动了properties文件才会让这个task运行，没有改就会说 up-to-date
        - 但是实际得到的是，改动了properties或者是构建文件都会引起task运行，两者都不改动就不会运行task，而且不会有输出提示up-to-date，要自己手动logger

***************

## 编写和使用自定义task
- 自定义task包含两个组件：
    - 自定义的task类，封装了逻辑行为，也被称为任务类型
    - 真实的task 提供了用于配置行为的task类所暴露的属性值

- 这个task就是做到了改配置文件，确保是RELEASE版本
```Groovy
//先要实例化version属性对象的存在
   version = new ProjectVersion(0,1,true)
   //继承DefaultTask类型的自定义task类
   class ReleaseVersionTask extends DefaultTask{
    @Input Boolean release
    @OutputFile File destFile
    ReleaseVersionTask(){
        group = 'versioning'
        description = 'Make Project a release version'

    }
    //task的行为逻辑
    @TaskAction
    void start (){
        project.version.release = true;
        ant.propertyfile(file:destFile){
            entry(key:'release',type:'string',operation:'=',value:'true')
        }
        println "$project.version"
    }
}
//version的POGO类
class ProjectVersion{
    Integer major
	Integer minor
    Boolean release
    ProjectVersion (Integer major ,Integer minor){
		this.major = major
		this.minor = minor
	}
    ProjectVersion (Integer major ,Integer minor,Boolean release){
		this(major,minor)
		this.release = release
	}
    @Override
    String toString(){
        "$major.$minor${release?'-RELEASE':'-SNAPSHOT'}"
    }
}
//真实的task，用来操作自定义类暴露的几个属性
//使用命令来运行，本质是运行真实的task但是行为逻辑在自定义类中编写
//gradle -b UserDefineTask.gradle -q makeReleaseVersion
//如果要改动一些数据可以直接更改暴露的task而不用去改自定义的task类
task makeReleaseVersion(type:ReleaseVersionTask){
    release = 'true'
    destFile = file('version.properties')
}
```

## 声明task规则
```groovy
   //All used property must define and initial first
   version = new ProjectVersion(0,1,true)
   ext.versionFile = file('version.properties')
   class ProjectVersion{
       Integer major
   	Integer minor
       Boolean release
       ProjectVersion (Integer major ,Integer minor){
   		this.major = major
   		this.minor = minor
   	}
       ProjectVersion (Integer major ,Integer minor,Boolean release){
   		this(major,minor)
   		this.release = release
   	}
       @Override
       String toString(){
           "$major.$minor${release?'-RELEASE':'-SNAPSHOT'}"
       }
   }
   // task规则的定义
   tasks.addRule("Pattern: increment<Classifier>Version - Increment the project version classifier." ){
   //根据预定义模式来检查task的名称
    String taskName -> if(taskName.startsWith('increment') && taskName.endsWith('Version')){
        //根据符合命名模式的task动态添加一个doLast的方法
        task(taskName)<<{
         //从完整的task名称中提取类型字符串，
         //字面意思是将字符串中increment和Version两个串去除掉然后转小写再赋值
            String classifier = (taskName - 'increment' - 'Version').toLowerCase()
            String currentVersion = version.toString()
            switch (classifier){
                case 'major':++version.major
                    break
                case 'minor':++version.minor
                    break
                default : throw new GradleException("Invalid version type '$classifier' . Allow types :['Major','Minor']")
            }
            String newVersion = version.toString()
            logger.info "Increment $classifier project version: $currentVersion -> $newVersion"
            ant.propertyfile(file:versionFile){
                entry(key:classifier,type:'int',operation:'+',value:1)
            }
        }
    }
}
```
- 运行 `gradle -b RulesTask.gradle -q incrementMinorVersion`就可以增加版本号了，就是一个动态的执行命令的机制
    - 使用 incrementMajorVersion就可以增加主版本号
- 如果运行 `gradle -b RulesTask.gradle -q tasks` 就会得到一个具体的tasks的组Rules

## 代码目录结构

- **groovy 在以下目录，Java在main.java的目录下，一般别人直接放在src下，buildSrc好像没有普及使用**

```
    - build.gradle
    - buildSrc
        - src
            - main
                - groovy
                    - com
                        - myth
                            - test
                                - ProjectVersion.groovy
                - java
    - src
    - version.properties
```
 
********
测试优于业务逻辑实行

*******

# Gradle 自动测试
> 凡是依赖于本地环境的测试，使用完就注释Test注解，还有那些会CRUD，影响到数据的测试方法也是
> 以防以后线上测试通不过 打包失败, 

- 跳过测试 `gradle build -x test`


## 单元测试
### 使用JUnit
> [使用Junit4](/MyBlog/how-to-use-junit.md)

### 使用其他框架 TestNG Spock
## 配置测试执行

********************
# 部署
## War包

## Jar包
- Gradle默认是只会打包源码，并不会打包依赖（为了更方便依赖的作用）
    - [shadow插件官网文档](http://imperceptiblethoughts.com/shadow/)
- 添加 `apply plugin: "maven"` 然后就能和mvn install 一样的执行 gradle install 了

## 上传至构建仓库
> 特别注意使用gpg, 如果按这下面的一堆文档跟着做的话你要保证你的gpg小于等于2.0版本, 不然就卡在这里了

> [参考项目 ](https://github.com/haiyangwu/sonatype)
> [参考](https://www.jianshu.com/p/49c926589f41)
> [官方文档](http://central.sonatype.org/pages/gradle.html)
> [参考博客](http://blog.csdn.net/h3243212/article/details/72374363#%E9%81%87%E5%88%B0%E7%9A%84%E9%97%AE%E9%A2%98)
> [最简单的方式就是利用码云等平台创建私服 ](https://blog.csdn.net/kcp606/article/details/79675590)

## 构建Docker镜像
> [用 Docker、Gradle 来构建、运行、发布一个 Spring Boot 应用](http://www.importnew.com/24671.html)

_build.gradle_
```groovy
    apply plugin: 'docker'
    buildscript {
        ext {
            springBootVersion = '2.0.1.RELEASE'
        }
        repositories {
            mavenCentral()
        }
        dependencies {
            classpath("org.springframework.boot:spring-boot-gradle-plugin:${springBootVersion}")
            classpath('se.transmode.gradle:gradle-docker:1.2')
        }
    }
    task buildDocker(type: Docker, dependsOn: build) {
        //设置自动上传的话，命名就不能乱取了，仓库名/镜像名：tag
    //    push = true
        // 跳过测试
        test.enabled=false
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
_Dockerfile_
```dockerfile
    FROM frolvlad/alpine-oraclejdk8:slim
    VOLUME /tmp
    # 配置通配符是为了不受版本影响
    ADD weixin*.war app.war
    # ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.war"]
    ENTRYPOINT ["java","-jar","/app.war"]
```
- `gradle buildDocker` 即可构建镜像
- 运行 `docker run --name web --link postgre:db -p 5678:8889 -it 镜像` 注意其中要关联PostgreSQL的容器

### 第二种插件方式
> [参考  通过Gradle使用Docker部署 Spring Boot项目](https://www.jianshu.com/p/7571fa3b394c)



**************

# 多语言编程
## 处理javascript
### 压缩javascript
- 调用Google Closure Compiler 的task 来压缩javascript文件 将所有的javascript压缩成一个javascript文件
- 执行该task  gradle :web :taskname
- 执行之后就能得到一个优化的js文件，现在就要在页面中修改原来的js引用

### Java 和 Groovy的联合编译
- src 下 main 下 java 和groovy 的一个目录结构，直接编译就会发生Java无法依赖groovy的类
- 错误：需要配置 ` sourceSets.main.java.srcDirs=[]` ` sourceSets.main.groovy.srcDirs=['src/main/java','src/main/groovy']`
    - 正确： `sourceSets.main.java.srcDirs=['src/main/java','src/main/groovy']` 上面的会报错
- 配置好后就能把groovy当普通Java类直接使用了

************

### Java 和 Scala
-  联合双向编译 Java和scala
- ` sourceSets.main.scala.srcDirs` ` sourceSets.main.groovy.srcDirs=['src/main/java','src/main/scala']`
- 那么问题来了，如果是有了java groovy scala 呢怎么配置编译，直接就加上就好了嘛？


## Jenkin 使用
### 下载安装和配置
- 官网下载war包后，直接使用Java命令运行 或者放在web容器中运行
- 配置下载插件（位置在C盘用户目录下， 其实第一次运行后也是会解压在.jenkin 目录下 插件就在plugin目录下）
- 

