`目录 start`
 
- [Maven](#maven)
    - [1.安装](#1安装)
        - [1.1.Maven常用命令](#11maven常用命令)
        - [1.2.setting.xml配置](#12settingxml配置)
    - [2.maven配置](#2maven配置)
        - [2.1.eclipse中配置](#21eclipse中配置)
        - [2.2.配置插件](#22配置插件)
        - [2.3.配置文件的详解](#23配置文件的详解)
    - [3.maven概念](#3maven概念)
    - [4.maven的依赖](#4maven的依赖)
        - [4.1.处理项目间依赖方法](#41处理项目间依赖方法)
        - [4.2.依赖冲突](#42依赖冲突)
        - [4.3.继承](#43继承)
        - [4.4.构建](#44构建)
            - [4.4.1.打包成可执行 jar](#441打包成可执行-jar)
            - [4.4.2.war包当jar使用](#442war包当jar使用)
            - [4.4.3.关于使用git和idea多模块的项目的构建](#443关于使用git和idea多模块的项目的构建)
    - [5.使用maven新建Web3.0项目](#5使用maven新建web30项目)
        - [5.1.添加web容器](#51添加web容器)
            - [5.1.2.Jetty](#512jetty)
            - [5.1.3.Tomcat](#513tomcat)
        - [5.2.加入Servlet的API包](#52加入servlet的api包)
    - [6.常用插件](#6常用插件)
        - [6.1.lombok](#61lombok)
    - [7.构建工具对比](#7构建工具对比)
        - [7.1.Maven和Ant的区别一](#71maven和ant的区别一)
        - [7.2.Maven的优势](#72maven的优势)
    - [发布构件](#发布构件)

`目录 end` *目录创建于2018-01-22* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# Maven
> [官网](https://maven.apache.org/) | [官网手册](https://maven.apache.org/guides/) | [http://takari.io/ 在线练习网](http://takari.io/)

## 1.安装
* 下载zip包解压，将bin目录配置至PATH（最好是配置HOME然后引用）
* 修改conf下53行的setting标签，指定本地仓库的路径
* 在eclipse或Myeclipse中add，并采用自己的setting文件



### 1.1.Maven常用命令
> mvn [插件]:[目标] [参数]
> mvn [阶段]

* mvn archetype:generate ：创建 Maven 项目
    * -DgroupId=组织名/公司网址的反写+项目名
    * -DartifactId=项目名-模块名
    * -Dversion=版本号
    * -Dpackage=代码所在的包
* mvn compile ：编译源代码
* mvn test-compile ：编译测试代码
* mvn test ： 运行应用程序中的单元测试
* mvn site ： 生成项目相关信息的网站
* mvn clean ：清除目标目录中的生成结果
* mvn package ： 依据项目生成 jar 文件
* mvn install ：在本地 Repository 中安装 jar
* mvn deploy：将jar包发布到远程仓库
* mvn eclipse:eclipse ：生成 Eclipse 项目文件

```
    mvn install:install-file -Dfile=D:\mvn\spring-context-support-3.1.0.RELEASE.jar\
     -DgroupId=org.springframework -DartifactId=spring-context-support\
     -Dversion=3.1.0.RELEASE -Dpackaging=jar

```
*****
### 1.2.setting.xml配置

## 2.maven配置
### 2.1.eclipse中配置
- 高版本自带maven，需要注意的是eclipse的JRE环境目录要选择jdk下的JRE

### 2.2.配置插件
> [插件地址](http://maven.apache.org/plugins/index.html)

### 2.3.配置文件的详解
```xml
      <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
     <!--当前pom的版本号-->
     <modelVersion>4.0.0</modelVersion>
   
     <groupId>反写的公司名+项目名</groupId>
     <artifactId>项目名+模块名</artifactId>
     <!--
         第一个 0 是大版本号
         第二个 0 是分支版本号
         第三个 0 是小版本号
         snapshot 快照
         alpha 内部测试
         beta 公测
         Release 稳定
         GA 正式发布
     -->
     <version>0.0.1-SNAPSHOT</version>
     <!--jar war zip pom-->
     <packaging>jar</packaging>
     <!--项目描述名-->
     <name>test</name>
     <!--项目地址-->
     <url>http://maven.apache.org</url>
     <!--项目描述-->
     <description></description>
     <developers></developers>
     <licenses></licenses>
     <orgnazation></orgnazation>
     <!--依赖-->
     <dependencies>
       <dependency>
         <groupId>junit</groupId>
         <artifactId>junit</artifactId>
         <version>3.8.1</version>
         <!--
            test 表明这个构件只在junit  中可以被引用
            compile 默认的
            provided 只在编译中引用
            runtime 编译和运行都有效
         -->
         <scope>test</scope>
         <!--设置依赖是否可选，默认是false-->
         <optional></optional>
         <!--排除依赖传递列表-->
         <exclusions></exclusions>
       </dependency>
     </dependencies>
     <dependencyManagement>
     </dependencyManagement>
     <build>
      <plugins>
         <!-- 构件三要素 -->
      </plugins>
     </build>
     <!--继承-->
     <parent></parent>
     <modules>
         <module></module>
     </modules>
```

配置:源码package成JAR包：(pom.xml中配置)
`<packaging>jar</packaging>`

## 3.maven概念
- 坐标：三个标签唯一的标识了项目
- 仓库：jar包的集合目录
    - 本地仓库
    - 远程仓库

## 4.maven的依赖
### 4.1.处理项目间依赖方法
项目A依赖B
A项目 pom.xml中配置依赖 （构件三要素）
B项目 先clean package
      然后build 的 install
A 项目 compile

### 4.2.依赖冲突
- 依赖路径短优先
   - 1 A->B->C->X(jar文件)
   - 2 A->C->X(jar文件)
   - 会选择 2 中的X的jar版本
- 先声明的优先

### 4.3.继承
> 新建一个项目作为父项目  
> 然后在需要引用父项目的子项目pom文件中, 加上parent 标签里面写上 父项目的三要素

### 4.4.构建
#### 4.4.1.打包成可执行 jar
```xml
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-assembly-plugin</artifactId>
        <version>2.3</version>
        <configuration>
            <appendAssemblyId>false</appendAssemblyId>
            <descriptorRefs>
                <descriptorRef>jar-with-dependencies</descriptorRef>
            </descriptorRefs>
            <archive>
                <manifest>
                    <mainClass>cn.zhouyafeng.itchat4j.main.TulingRobot</mainClass>
                    <mainClass>cn.zhouyafeng.itchat4j.main.MyTest</mainClass>
                </manifest>
            </archive>
        </configuration>
        <executions>
            <execution>
                <id>make-assembly</id>
                <phase>package</phase>
                <goals>
                    <goal>assembly</goal>
                </goals>
            </execution>
        </executions>
    </plugin>
```
- 多个main的情况下运行指定的main `java -cp example03-1.0-SNAPSHOT.jar cn.zhouyafeng.itchat4j.main.TulingRobot`

#### 4.4.2.war包当jar使用
- Springboot项目能够

- [通过Maven构建打包Spring boot，并将config配置文件提取到jar文件外](http://lib.csdn.net/article/java/65574)


*****************
#### 4.4.3.关于使用git和idea多模块的项目的构建
`.gitignore文件` 没有特别的地方
```conf
    .idea/
    *.iml
    target/
```
`父项目pom文件`
``` xml
    <groupId>com.github.kuangcp</groupId>
    <artifactId>Modules</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>pom</packaging>
    <modules>
        <module>repository</module>
        <module>service</module>
        <module>website</module>
    </modules>
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <java.version>1.8</java.version>
    </properties>
    ```
    `子项目pom文件`
    ```xml
    <artifactId>website</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <parent>
        <groupId>com.github.kuangcp</groupId>
        <artifactId>Modules</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>
```
- 子项目编译打包各自独立，怎么整合成一个

*************************

## 5.使用maven新建Web3.0项目
> [网络maven仓库](http://mvnrepository.com/)

- 新建maven 选择webapp 然后输入三要素
- 但是因为模板默认的是web2.3，所以要手动修改成3.0
- 1. pom文件中添加插件 编译部分
```xml
    <plugin>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.0</version>
        <configuration>
            <source>1.8</source>
            <target>1.8</target>
        </configuration>
    </plugin>
```
- 2.navigator目录模式下 修改相关文件，把2.3改成3.0
- 3.eclipse中右击改动Facets 然后maven-update一下就可以了

### 5.1.添加web容器
#### 5.1.2.Jetty
- http://mvnrepository.com/ 里找到想要的版本，加入即可
特别注意 NIO的原因，静态文件在服务器启动的时候不能更改，需要找到maven仓库下的org/eclipse/jettyjetty-webapp/ 
下的jar包中的default配置文件，把useFileBuffer标签的 true 改成false

```xml
<plugin>
    <groupId>org.mortbay.jetty</groupId>
    <artifactId>jetty-maven-plugin</artifactId>
    <version>8.1.16.v20140903</version>
    <!-- <groupId>org.apache.tomcat.maven</groupId> <artifactId>tomcat6-maven-plugin</artifactId> 
        <version>2.2</version> -->
    <executions>
        <execution>
            <!-- 在打包成功后使用jetty:run来运行 -->
            <phase>package</phase>
            <goals>
                <goal>run</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <stopKey>stop</stopKey>
        <stopPort>9999</stopPort>
        <scanIntervalSeconds>1</scanIntervalSeconds>
        <contextXml>${project.basedir}/src/main/resources/jetty-context.xml</contextXml>
        <webApp>
        <!--这里配置主机后的目录，现在表示根目录，最好加上项目名例如： /Project -->
            <contextPath>/</contextPath>
        </webApp>
        <connectors>
            <connector implementation="org.eclipse.jetty.server.nio.SelectChannelConnector">
                <port>80</port>
                <maxIdleTime>60000</maxIdleTime>
            </connector>
        </connectors>
    </configuration>
</plugin>

```
- 部署成功后，使用jetty:run 即可运行起服务器

#### 5.1.3.Tomcat
- 去Tomcat官网 找到maven plugins进入找到想要的版本即可

```xml
<plugin>
    <groupId>org.apache.tomcat.maven</groupId>
    <artifactId>tomcat6-maven-plugin</artifactId>
    <version>2.2</version>
    <executions>
        <execution>
            <!-- 在打包成功后使用tomcat6:deploy来运行 -->
            <phase>package</phase>
            <goals>
                <goal>run</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <!-- 注意此处的url -->
        <url>http://localhost:8080/manager/text</url>
        <server>tomcat6</server> <!-- 此处的名字必须和setting.xml中配置的ID一致 -->
        <path>/mavenProject</path> <!-- 此处的名字是项目发布的工程名 -->
    </configuration>
</plugin>
```
- 部署完成后 tomcat7:deploy 运行服务器

### 5.2.加入Servlet的API包
```xml
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>3.0.1</version>
        <scope>provided</scope>
	</dependency>
```

## 6.常用插件
### 6.1.lombok
> 极大的简化了bean的代码量

```xml
    <dependency>
        <groupId>org.projectlombok</groupId>
        <artifactId>lombok</artifactId>
        <version>1.16.10</version>
        <scope>provided</scope>
    </dependency>
```

****************************

## 7.构建工具对比
> [码农翻身:小李的Build之路(上)](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513207&idx=1&sn=cbfad70e656fc50c4fff18678a282b95&scene=21#wechat_redirect) | [码农翻身:小李的Build之路(下)](https://mp.weixin.qq.com/s?__biz=MzAxOTc0NzExNg==&mid=2665513212&idx=1&sn=280647b0c6cd265f85590f64d3216bee&scene=21#wechat_redirect) `这个小故事讲述了ant到maven的演化`

### 7.1.Maven和Ant的区别一

1. ant脚本是可以直接运行在maven中的。maven和ant最大的差别就是在于maven的编译以及所有的脚本都有一个基础，就是POM（project object model）。这个模型定义了项目的方方面面，然后各式各样的脚本在这个模型上工作，而ant完全是自己定义，显然maven更胜一筹。

2. maven对所依赖的包有明确的定义，如使用那个包，版本是多少，一目了然。而ant则通常是简单的inclde 所有的jar。导致的最终结果就是，你根本无法确定JBoss中的lib下的common－logging 是哪个版本的，唯一的方法就是打开 META－INF 目录下MANIFEST.MF。

3. maven是基于中央仓库的编译，即把编译所需要的资源放在一个中央仓库里，如jar，tld，pom，等。当编译的时候，maven会自动在仓库中找到相应的包，如果本地仓库没有，则从设定好的远程仓库中下载到本地。这一切都是自动的，而ant需要自己定义了。这个好处导致的结果就是，用maven编译的项目在发布的时候只需要发布源码，小得很，而反之，ant的发布则要把所有的包一起发布，显然maven又胜了一筹。

4. maven有大量的重用脚本可以利用，如生成网站，生成javadoc，sourcecode reference，等。而ant都需要自己去写。

5. maven目前不足的地方就是没有象ant那样成熟的GUI界面，不过mavengui正在努力中。目前使用maven最好的方法还是命令行，又快又方便

### 7.2.Maven的优势

- 协同开发的基本规范，为大家提供方便的协作的模式，能增加代码的复用，提高生产率。
- 提供方便，规范化的打包方法，是公司完成自动构建系统的核心部分，能帮助提高敏捷开发的效率(敏捷开发提倡尽早集成)。
- 减少冗余，减少出错的可能。
- 中心资源库管理，能减低源码库的大小，中心资源库可以统一定期备份。
- 目录结构规范，让开发者从一个maven项目过度到另一maven项目很容易。
- 大量的开源项目使用了maven。

## 发布构件
> [将项目发布到 maven 中央仓库踩过的坑](http://blog.csdn.net/h3243212/article/details/72374363)