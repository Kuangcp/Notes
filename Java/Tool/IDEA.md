`目录 start`
 
- [IDEA 使用笔记](#idea-使用笔记)
    - [常识](#常识)
    - [常用技巧](#常用技巧)
        - [Tomcat的使用](#tomcat的使用)
        - [导出为可运行的JAR包 普通Java项目](#导出为可运行的jar包-普通java项目)
        - [Springboot热加载](#springboot热加载)
        - [Debug](#debug)
    - [常用配置](#常用配置)
        - [个人IDEA配置](#个人idea配置)
    - [IDEA快捷键](#idea快捷键)
        - [使用内置类eclipse快捷键系列](#使用内置类eclipse快捷键系列)
        - [IDEA原生快捷键系列](#idea原生快捷键系列)
        - [个人习惯](#个人习惯)
    - [插件](#插件)
    - [启动配置](#启动配置)

`目录 end` |_2018-05-22_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************

# IDEA 使用笔记
> [学生授权申请方式](https://sales.jetbrains.com/hc/zh-cn/articles/207154369) | [click](http://idea.lanyus.com/)
> [rover12421博客](http://ju.outofmemory.cn/feed/2608/?page=1) | [IDEA主题](http://www.riaway.com/index.php)

## 常识
-  project 就是一个工作空间，一个Module就是一个项目
- 新建一个empty项目可以作为一个工作空间，放很多module,新建的时候不要选中任何目录，*光标选中JRE库*，再菜单栏点击File然后new，
    - 不然项目结构很乱, 会在光标停留的文件夹下新建module
- 一个项目一个空间也是可以的，就是跨项目查看代码会有点麻烦，而且每个项目的IDEA的配置都是不一样的，同样的配置可能要配置很多遍

- 在新版中提供的load unload 模块功能,必须要重启idea, 才能让maven生效 emmm
## 常用技巧
### Tomcat的使用
> 直接配置解压的即可, 然后Idea会在 用户目录下的Idea主目录中配置一个专门放Tomcat的配置和日志等文件, 和原Tomcat进行了隔离, 这样就不会影响到该Tomcat.


### 导出为可运行的JAR包 普通Java项目
- File -> project structure ->artifact 里面设置好 引入的库，设置Main类，引用的jar包的相对classpath
- Build artifact -> Build
- Maven或者Gradle的话直接就能得到，不过也要配置一下main

### Springboot热加载
> 每个project都是一个新的工作区，所以要重新配置 | [howto-hotswapping](https://docs.spring.io/spring-boot/docs/current/reference/html/howto-hotswapping.html)

- Ctrl Shift A 快捷搜索 automatically 在Build下的 Compiler，勾选 `Build project automatically` 自动构建
    -  (如果旁边有提示说不会在运行和debug执行, 那么就要勾选并行)  `Compile independent modules in parallel`
- Ctrl Shift A 快捷搜索 Registry 进入后找到 compiler.automake.allow.when.app.running 勾选
- 加入devtools依赖 | [DevTools的官方文档](https://docs.spring.io/spring-boot/docs/current/reference/html/using-boot-devtools.html#using-boot-devtools)

*********************************
### Debug
> debug还是比较强大的, 会在行末显示这一行的变量值

- [在Intellij IDEA中使用Debug](http://www.cnblogs.com/chiangchou/p/idea-debug.html)

_横排的八个按钮_
> `Show Execution Point (Alt + F10)`：如果你的光标在其它行或其它页面，点击这个按钮可跳转到当前代码执行的行。  
> `Step Over (F8)`：步过，一行一行地往下走，如果这一行上有方法不会进入方法。  
> `Step Into (F7)`：步入，如果当前行有方法，可以进入方法内部，一般用于进入自定义方法内，不会进入官方类库的方法，如第25行的put方法。  
> `Force Step Into (Alt + Shift + F7)`：强制步入，能进入任何方法，查看底层源码的时候可以用这个进入官方类库的方法。  
> `Step Out (Shift + F8)`：步出，从步入的方法内退出到方法调用处，此时方法已执行完毕，只是还没有完成赋值。  
> `Drop Frame (默认无)`：回退断点，后面章节详细说明。  
> `Run to Cursor (Alt + F9)`：运行到光标处，你可以将光标定位到你需要查看的那一行，点击按钮,代码会运行至光标行，而不需要打断点。  
> `Evaluate Expression (Alt + F8)`：计算表达式，后面章节详细说明。  

_竖向的七个按钮_
> Rerun 'xxxx'：重新运行程序，会关闭服务后重新启动程序。
> Update 'tech' application (Ctrl + F5)：更新程序，一般在你的代码有改动后可执行这个功能。而这个功能对应的操作则是在服务配置里，如图2.3。
> Resume Program (F9)：恢复程序，比如，你在第20行和25行有两个断点，当前运行至第20行，按F9，则运行到下一个断点(即第25行)，再按F9，则运行完整个流程，因为后面已经没有断点了。
> Pause Program：暂停程序，启用Debug。目前没发现具体用法。
> Stop 'xxx' (Ctrl + F2)：连续按两下，关闭程序。有时候你会发现关闭服务再启动时，报端口被占用，这是因为没完全关闭服务的原因，你就需要查杀所有JVM进程了。
> View Breakpoints (Ctrl + Shift + F8)：查看所有断点，后面章节会涉及到。
> Mute Breakpoints：哑的断点，选择这个后，所有断点变为灰色，断点失效，按F9则可以直接运行完程序。再次点击，断点变为红色，有效。如果只想使某一个断点失效，可以在断点上右键取消Enabled

*************************
## 常用配置
- 依次找到配置项: `File->settings->Editor->File and Code Templates->`
    - 如果自己要每个文件都单独设置头部, 就依次点击Class Interface Enum ...进行设置
        - [参考博客](https://segmentfault.com/q/1010000005997550)
    - 如果要统一设置 就点击Includes标签, 选择File Header

_例如修改为如下_
```java
/**
 * Created by https://github.com/kuangcp
 * @author kuangcp
 * @date ${DATE}  ${TIME}
 */
```
### 个人IDEA配置
> [导出的配置jar](https://github.com/Kuangcp/Configs/tree/master/Idea)
- 字体Fira Code Retina 14 0.9

************************
## IDEA快捷键
### 使用内置类eclipse快捷键系列
> 设置中 keymap 选择eclipse系列即可

### IDEA原生快捷键系列
> 默认配置的是Idea原生


- 这时我们只需敲Ctrl+Shift+Enter就能自动补全末尾的字符。
    - 而且不只是括号，例如敲完if/for时也可以自动补上{}花括号。
- Ctrl+空格 代码提示
- Ctrl+Alt+Space 类名或接口名提示
- Ctrl+P 方法参数提示
- Ctrl+/ 或 Ctrl+Shift+/ 注释（// 或者/*...*/ ）
- Alt+F1 查找代码所在位置
- 选中文本，按Ctrl+Shift+F7 ，高亮显示所有该文本，按Esc高亮消失。
- 选中文本，按Alt+F3 ，逐个往下查找相同文本，并高亮显示。
- Ctrl+Up/Down 光标跳转到第一行或最后一行下
- Ctrl+B 快速打开光标处的类或方法的`声明或调用`
    - Ctrl Alt B 查看抽象类或接口的实现方法

最常用快捷键

- 1.Ctrl＋E，可以显示最近编辑的文件列表
- 2.Shift＋单击标签页 可以关闭文件
- 4.Ctrl＋Shift＋Backspace可以跳转到上次编辑的地方
- 5.Ctrl＋F12，可以显示当前文件的结构
- 6.Ctrl＋F7可以查询当前元素在当前文件中的引用，然后按F3可以选择
- 7.Ctrl＋N，可以快速打开类
- 8.Ctrl＋Shift＋N，可以快速打开文件
- 9.Alt＋Q可以看到当前方法的声明
- 10.Ctrl＋W可以选择单词继而语句继而行继而函数
- 11.Alt＋F1可以将正在编辑的元素在各个面板中定位
- 12.Ctrl＋P，可以显示参数信息
- 13.Ctrl＋Shift＋Insert可以选择剪贴板内容并插入
- 14.Alt＋Insert可以生成构造器/Getter/Setter等
- 15.Ctrl＋Alt＋V 可以引入变量。例如把括号内的SQL赋成一个变量
- 16.Ctrl＋Alt＋T可以把代码包在一块内，例如try/catch
- 17.Alt＋Up and Alt＋Down可在方法间快速移动

- Shift-Escape 不仅可以把焦点移到编辑器上而且还可以隐藏当前（或最后活动的）工具窗口。
下面的不是很有用

- 18.在一些地方按Alt＋Enter可以得到一些Intention Action，例如将”==”改为”equals()”
- 19.Ctrl＋Shift＋Alt＋N可以快速打开符号
- 20.Ctrl＋Shift＋Space在很多时候都能够给出Smart提示
- 21.Alt＋F3可以快速寻找
- 22.Ctrl＋/和Ctrl＋Shift＋/可以注释代码
- 23.Ctrl＋Alt＋B可以跳转到抽象方法的实现
- 24.Ctrl＋O可以选择父类的方法进行重写
- 25.Ctrl＋Q可以看JavaDoc
- 26.Ctrl＋Alt＋Space是类名自动完成
- 27.快速打开类/文件/符号时，可以使用通配符，也可以使用缩写
- 28.Live Templates! Ctrl＋J
- 29.Ctrl＋Shift＋F7可以高亮当前元素在当前文件中的使用
- 30.Ctrl＋Alt＋Up /Ctrl＋Alt＋Down可以快速跳转搜索结果
- 31.Ctrl＋Shift＋J可以整合两行
- 32.Alt＋F8是计算变量值

- 14 、在调试程序时查看任何表达式值的一个容易的方法就是在编辑器中选择文本（可以按几次 Ctrl-W 组合键更有效地执行这个操作）然后按 Alt-F8 。
- 15 、要打开编辑器脱字符处使用的类或者方法 Java 文档的浏览器，就按 Shift-F1 （右键菜单的 External JavaDoc ）。
- 要使用这个功能须要把加入浏览器的路径，在“ General ”选项中设置（ Options | IDE Settings ），另外还要把创建的 Java 文档加入到工程中（ File | Project Properties ）。

### 个人习惯
> 从eclipse风格脱离而来和原生Idea快捷键结合, 自己修改的风格 在 [个人配置文件夹下找到导入即可](#个人idea配置)

- Alt Enter 自动修复
- Ctrl Q 显示doc
- Ctrl B 显示定义处或者调用处
- Ctrl Shift T 自动创建JunitTest
- Ctrl Shift F7 高亮显示光标所在元素所有出现过的地方
- Ctrl Alt L 快速格式化代码 
- Ctrl+Alt+O 优化导入的类和包

_file_
- Ctrl W 选中代码
- Ctrl E 最近文件打开
- Alt+Shift+C 最近更改的文件
- Ctrl N 快速搜索Java文件 
    - Ctrl Shift N 搜索所有文件
    - Ctrl Shift Alt N 按类名首字母搜索
- Alt+ left/right 左右切换打开的文件

_coding_
- Ctrl Shift V 显示最近的粘贴板记录
- Ctrl O 选择要重写的方法
- Ctrl L 选择要实现的方法 
- Alt+Insert 生成代码(如get,set方法,构造函数等)
- Shift+F6 重构-重命名
- Ctrl+X 剪切行
- Ctrl+D 复制行到下一行 `个人习惯这个是删除一行, Y才是复制`
- Ctrl+Q 显示注释文档 或者 Alt+鼠标中键
- Ctrl+Shift+Space 智能提示代码的补全
- Ctrl+Shift+上/下键 代码上/下移动 `光标在一行上就是移动一行, 在代码块的首行就是移动整个代码块`
- Ctrl+J 代码片段
- Ctrl Space 智能补全
    - Ctrl Shift Space 结合上下文补全
- Ctrl+W 选中代码，连续按会有其他效果

_jump_
- Alt+ Up/Down 在方法间快速移动定位
- Ctrl Alt ←/→ 后退/前进 至光标的上一个位置
- F2 或 Shift+F2 高亮错误或警告快速定位
- Ctrl＋[ 或 ]可以跳到大括号的开头结尾

_search_
- Ctrl+N 查找类
- Ctrl+Shift+N 查找文件
- Ctrl+R 替换文本
- Ctrl+F 查找文本
- Ctrl+Shift+Alt+N 全项目查找: 类中的方法或变量

_view_
- Ctrl+H 显示类结构图
- Ctrl＋F12，可以显示当前文件的结构 `或者直接Alt S`
- Alt A , 显示目录结构
- Alt R , 显示运行窗口
- Alt D , 显示debug窗口
- Alt T , 显示TODO的窗口 | `Ctrl +/-` 全部显示和折叠 TODO
- Alt G , 显示Gradle窗口
- Alt M , 显示Maven窗口
- Alt . , 显示数据库工具窗口

> 在任一工具窗口, 按`ESC`都会让焦点回到编辑器 `Shift ESC` 就能关闭工具窗口并让焦点回到编辑器
> 以上的窗口都是默认显示小bar的, 我为了窗口更大就设置为了默认隐藏, 如果想显示, 可以双击Alt, 在第二下按住不动, 鼠标就能进行点击了  

_setting_
- Ctrl Shift A 搜索设置项的位置
- Ctrl+Shift+Alt+? 进行一些设置，找到编译自动部署，就能热加载

_tips_
- 代码标签输入完成后，按Tab或者Enter，生成代码。

*********************
## 插件
- Alibaba Java Code Guidelineshuo
    - 阿里巴巴的代码规范插件
    - [《阿里巴巴Java开发规约》IDEA插件与Eclipse插件使用指南](https://zhuanlan.zhihu.com/p/30191998)

- TestMe
    - 快速创建测试类

- lombok
    - 插件商店中搜索 lombok 安装重启idea即可
    - 配置 Build,Execution > Compiler > Annotation Processors 勾选上即可使用lombok的注解
- Jrebel
    - 热部署插件, 需要付费
    
- GoogleTranslation
    - Ctrl Alt 1 快速翻译选中的单词和语句

## 启动配置
> [官网文档](https://www.jetbrains.com/help/idea/increasing-memory-heap.html)
> [IntelliJ IDEA 内存优化最佳实践](http://blog.oneapm.com/apm-tech/426.html)

