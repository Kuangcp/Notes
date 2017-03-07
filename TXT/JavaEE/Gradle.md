# Gradle
## 安装配置
- 先安装sdkman
- 使用Bash运行`curl -s "https://get.sdkman.io" | bash`
- `sdk install gradle` 即可安装

- windows 上安装 chocolate
- PowerShell中运行 `wr https://chocolatey.org/install.ps1 -UseBasicParsing | iex`
- 若操作系统默认禁止执行脚本，执行一次`set-executionpolicy remotesigned`后脚本顺利执行
Chocolatey在安装包的时候，默认路径是按照系统的默认路径来的，如果想修改安装路径可以这样处理：

1. 执行“开始/运行”命令（或者WIN + R），输入“regedit”，打开注册表。

2. 展开注册表到下面的分支[HKEY＿LOCAL＿MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion]，在右侧窗口中找到名为“ProgramFilesDir”的字符串，双击把数值“C:\Program Files”修改为“D：\ProgramFiles”，确定退出后,即可更改常用软件的安装路径了。

## 命令行选项
- gradle 加构建文件中的task名，直接运行task
- -b,--build-file test.gradle 指定运行哪一个文件
- --offline 离线模式
- -P ,--project-prop:配置参数 -Pmyprop=value
- -i,--info : 打印info级别的输出
- -s,--stacktrace: 输出错误栈
- -q,--quiet:减少构建出错时打印的错误信息
- tasks : 输出所有建立的task
- properties : 输出所有可用的配置属性

### 守护进程
- 命令加上 --daemon就会开启一个守护进程，只会开启一次，
- 守护进程会在空闲3小时后销毁
- 手动 gadle --stop
- 构建时不采用守护进程 --no--daemon

## 第一个 build.gradle
```
   task helloworld{
      doLast {
         printf 'Hello World!'
      }
   }
   或者是 使用 << 代表doLast：
   task helloworld<<{
      println 'Hello world!'
   }
   
```
-  运行：`gradle -q helloworld`


## 配置Gradle包管理器
```
   task wrapper(type: Wrapper){
      gradleVersion = '1.7'
      distributionUrl = '限定访问内网的URL'
      distributionPath = '包装器被解压缩放的相对路径'
   }
```
- 运行 gradle wrapper 一次即可开始使用包装器的脚本来构建项目了


## Gradle进阶知识

### Gradle 构建块
- 三个基本块 project task property， 使用DDD（领域驱动设计）
- 一个真实的项目包含多个project 而 Project又包含多个task ，task之间通过依赖来确保执行顺序
- build.gradle 和 pom.xml 作用是一致的，但是gradle可以使用一份源码 构建出多种想要的目标程序
- gradle 也方便构建多模块

### task 的依赖

```
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
```
   task f<<{println 'first'}
   task s<<{println 'second'}
   f.finalizedBy s
   当运行 gradle f 就会自动触发 s
   如果gradle s 就和f没有任何关系了
```
### Groovy的POGO类管理配置文件上的版本号
- [taskL.gradle](https://github.com/Kuangcp/LearnGradle/blob/master/demo/tasksL.gradle)
-  gradle -b tasksL.gradle -q printVersion
-  虽然只是 运行了这个task 但是读取文件的task也被自动调用了
-  因为Gradle的构建生命周期阶段如下: 初始化、配置和执行 读取文件就属于配置阶段
	- **注意** : 项目的每一次构建都会运行属于配置阶段的代码，即使你只是运行了 gradle tasks

****

## 增量式构建特性
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

## 编写和使用自定义task

 
