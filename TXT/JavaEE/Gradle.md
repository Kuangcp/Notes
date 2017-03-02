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

## build.gradle
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

- 动态任务定义和任务链 

```
   task startSession<<{
   	chant()
   }
   def chant(){
   	printf 'print ant info '
   }
   3.times {
   	task "yayGradle$it" << {
   		printf 'Gradle rocks'
   	}
   }
   yayGradle0.dependsOn startSession
   yayGradle2.dependsOn yayGradle1, yayGradle0
   task groupTherapy(dependsOn:yayGradle2)
```

## 配置包管理器
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
- 

