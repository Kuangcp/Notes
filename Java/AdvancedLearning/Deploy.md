`目录 start`
 
- [部署运行](#部署运行)
    - [可执行jar](#可执行jar)
        - [用命令手动打包](#用命令手动打包)
        - [Maven](#maven)
        - [Gradle](#gradle)
    - [打包war](#打包war)
    - [Docker部署](#docker部署)
        - [手动](#手动)
        - [Maven](#maven)
        - [Gradle](#gradle)

`目录 end` |_2018-07-31_| [码云](https://gitee.com/gin9) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 部署运行
> 传统的可执行jar, war 以及Docker镜像

## 可执行jar
### 用命令手动打包
> [关于MANIFEST.MF文件](https://blog.csdn.net/baileyfu/article/details/1808023)`这个文件很重要, 如果自己手动配置就需要编写该文件`
_MANIFEST.MF示例_
```yml
    Manifest-Version: 1.0
    Archiver-Version: Plexus Archiver
    Built-By: kcp
    Created-By: Apache Maven 3.5.3
    Build-Jdk: 1.8.0_152
    Main-Class: com.youaishujuhui.minigame.Main
```
- 编译文件        `javac -d *.java `
- 打包字节码成jar `jar -cvf hello.jar com/test/*.*` 
- 打包成可执行jar `jar -cvfm hello.jar mainfest *.*` 
    - 其中：`mainfest` 文本文件： `Main-Class: com.test.Main` 冒号后一定要有空格，文件最后一行一定留空行

- 运行jar包中指定的类`java -cp clojure.jar clojure.main`
    - 多个jar运行 `java -cp jline-0.9.94.jar;clojure.jar jline.ConsoleRunner clojure.main`
    - [参考博客: 用java –jar 命令运行Jar包](https://blog.csdn.net/paullinjie/article/details/53188943)

### Maven

**不依赖Jar的项目**
> [Demo项目](https://gitee.com/gin9/codes/ri4x8cut3awgh0e271lfb54) | [详情](/Java/Tool/Maven.md#31打包成可执行jar)

**依赖Jar的项目**
- [ ] 完善 Maven 含 Jar 打包可执行jar

### Gradle
> [参考博客: Building Java Applications](https://guides.gradle.org/building-java-applications/)

**不依赖Jar的项目**
1. 依据模板新建项目 `gradle init --type java-application` 
```groovy
// 主要是如下配置
plugins {
    // Apply the java plugin to add support for Java
    id 'java'
    // Apply the application plugin to add support for building an application
    id 'application'
}
// Define the main class for the application
mainClassName = 'App'
```
2. add this config to build.gradle
```groovy
    jar {
        manifest {
            attributes 'Main-Class': 'base.Main'
        }
    }
```
3. run : `gradle clean jar && java -jar file`   

**依赖Jar的项目**
> 有好几种插件可以实现 1.[shadow插件官网文档](http://imperceptiblethoughts.com/shadow/) 

- [ ] 完善 Gradle 含 Jar 打包可执行jar

*************************

## 打包war
> 最终将生成的war放到tomcat的webapps目录下即可

********************

## Docker部署
> 以一个基础镜像,然后将war放进去构建成一个镜像, 然后推送到服务器上构建容器进行运行

> [jib](https://github.com/GoogleContainerTools/jib)
> - 结合 Maven Gradle 方便的构建 Docker镜像

### 手动

### Maven

### Gradle


