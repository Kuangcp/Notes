`目录 start`
 
- [部署运行](#部署运行)
    - [原始打包](#原始打包)
        - [命令打包出一个可执行jar](#命令打包出一个可执行jar)
        - [传统部署](#传统部署)
        - [Docker部署](#docker部署)

`目录 end` |_2018-03-14_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 部署运行

## 原始打包
### 命令打包出一个可执行jar
- `javac -d *.java `编译文件
- `jar -cvf hello.jar com/test/*.*` 打包字节码成jar
- `jar -cvfm hello.jar mainfest *.*` 打包成可执行jar
    - 其中：`mainfest` 文本文件： `Main-Class: com.test.Main` 冒号后一定要有空格，文件最后一行一定留空行

- 运行jar包中指定的类`java -cp clojure.jar clojure.main`
    - 多个jar运行 `java -cp jline-0.9.94.jar;clojure.jar jline.ConsoleRunner clojure.main`

### 传统部署
> 将生成的war放到tomcat的目录下即可

### Docker部署
> 以一个基础镜像,然后将war放进去构建成一个镜像, 然后推送到服务器上构建容器进行运行
