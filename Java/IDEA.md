`目录 start`
 
- [IDEA 使用笔记](#idea-使用笔记)
    - [常识](#常识)
    - [常用技巧](#常用技巧)
        - [导出为可运行的JAR包 普通Java项目](#导出为可运行的jar包-普通java项目)
        - [Springboot热加载](#springboot热加载)
        - [个人IDEA配置](#个人idea配置)
    - [IDEA快捷键](#idea快捷键)
        - [使用内置类eclipse快捷键系列](#使用内置类eclipse快捷键系列)
        - [IDEA原生快捷键系列](#idea原生快捷键系列)
            - [【正在使用】](#正在使用)
                - [IntelliJ IDEA使用技巧一览表](#intellij-idea使用技巧一览表)

`目录 end` *目录创建于2018-01-14*
****************************************

# IDEA 使用笔记

## 常识
-  project 就是一个工作空间，一个Module就是一个项目
- 新建一个empty项目可以作为一个工作空间，放很多module,新建的时候不要选中任何目录，*选中JRE库*，再菜单栏点击File然后new，不然项目结构很乱
- 一个项目一个空间也是可以的，就是跨项目查看代码会有点麻烦，而且每个项目的配置文件都是不一样的，同样的配置可能要配置很多遍

## 常用技巧
### 导出为可运行的JAR包 普通Java项目
- File -> project structure ->artifact 里面设置好 引入的库，设置Main类，引用的jar包的相对classpath
- Build artifact -> Build
- Maven或者Gradle的话直接就能得到，不过也要配置一下main

### Springboot热加载
> 每个project都是一个新的工作区，所以要重新配置

- Ctrl Shift A 快捷搜索 automatically 在Build下的 Compiler，打开自动构建 *很重要*
    - 以前遇到的各种不能热加载的问题就是这个引起的！！
- Ctrl Shift A 快捷搜索 Registry 进入后找到 compiler.automake.allow.when.app.running 勾选
- 加入devtools依赖

### 个人IDEA配置
- 字体Fira Code Retina 14 0.9

## IDEA快捷键
### 使用内置类eclipse快捷键系列
### IDEA原生快捷键系列

#### 【正在使用】

- Alt Enter 自动修复
- Ctrl Q 显示doc
- Ctrl B 显示定义处
- Ctrl Alt B 显示实现处
- Ctrl Shift T 自动创建JunitTest
- Ctrl W 选中代码
- Ctrl E 最近文件
- Ctrl N 快速搜索Java文件 
    - Ctrl Shift N 搜索所有文件
    - Ctrl Shift Alt N 按类名首字母搜索
- Ctrl Space 智能补全
    - Ctrl Shift Space 结合上下文补全
- Ctrl Alt ←/→ 后退/前进 至光标的上一个位置
- Ctrl Shift F7 高亮显示光标所在元素所有出现过的地方

    - 


`coding`
- C O 选择要重写的方法
- C L 选择要实现的方法 
- A Insert 选择要自动完成的setget构造器等


********

- Ctrl Alt L 快速格式化代码 
- 这时我们只需敲Ctrl+Shift+Enter就能自动补全末尾的字符。
    - 而且不只是括号，例如敲完if/for时也可以自动补上{}花括号。
- Alt+回车 在错误地方自动导包/自动修正
- Ctrl+N 查找类
- Ctrl+Shift+N 查找文件
- Ctrl+Alt+L 格式化代码
- Ctrl+Alt+O 优化导入的类和包
- Alt+Insert 生成代码(如get,set方法,构造函数等)
- Ctrl+E或者Alt+Shift+C 最近更改的代码
- Ctrl+R 替换文本
- Ctrl+F 查找文本
- Ctrl+Shift+Space 自动补全代码
- Ctrl+空格 代码提示
- Ctrl+Alt+Space 类名或接口名提示
- Ctrl+P 方法参数提示
- Ctrl+Shift+Alt+N 查找类中的方法或变量
- Ctrl+Shift+Alt+? 进行一些设置，找到编译自动部署，就能热加载
- Alt+Shift+C 对比最近修改的代码
- Shift+F6 重构-重命名
- Ctrl+Shift+先上键
- Ctrl+X 剪切行
- Ctrl+D 复制行到下一行
- Ctrl+/ 或 Ctrl+Shift+/ 注释（// 或者/*...*/ ）
- Ctrl+J 自动代码
- Ctrl+E 最近打开的文件
- Ctrl+H 显示类结构图
- `Ctrl+Q` 显示注释文档 或者 Alt+鼠标中键
- 
- Alt+F1 查找代码所在位置
- Alt+1 快速打开或隐藏工程面板
- Ctrl+Alt+ left/right 返回至上次浏览的位置
- Alt+ left/right 切换代码视图
- Alt+ Up/Down 在方法间快速移动定位
- Ctrl+Shift+Up/Down 代码向上/下移动。
- F2 或Shift+F2 高亮错误或警告快速定位
- 
- 代码标签输入完成后，按Tab，生成代码。
- 
- 选中文本，按Ctrl+Shift+F7 ，高亮显示所有该文本，按Esc高亮消失。
- 
- Ctrl+W 选中代码，连续按会有其他效果
- 
- 选中文本，按Alt+F3 ，逐个往下查找相同文本，并高亮显示。
- 
- Ctrl+Up/Down 光标跳转到第一行或最后一行下
- 
- Ctrl+B 快速打开光标处的类或方法
- 
- 最常用快捷键
- 1.Ctrl＋E，可以显示最近编辑的文件列表
- 2.Shift＋单击标签页 可以关闭文件
- 3.`Ctrl＋[`或`]`可以跳到大括号的开头结尾
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
- 下面的不是很有用
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

##### IntelliJ IDEA使用技巧一览表
- 在使用 InelliJ IDEA 的过程中，通过查找资料以及一些自己的摸索，发现这个众多 Java 程序员喜欢的 IDE 里有许多值得一提的小窍门，如果能熟练的将它们应用于实际开发过程中，相信它会大大节省你的开发时间，而且随之而来的还会有那么一点点成就感：） Try it ！
- 1 、写代码时用 Alt-Insert （ Code|Generate… ）可以创建类里面任何字段的 getter 与 setter 方法。
- <?xml:namespace prefix = v ns = "urn:schemas-microsoft-com:vml" />
- 2 、右键点击断点标记（在文本的左边栏里）激活速查菜单，你可以快速设置 enable/disable 断点或者条件它的属性。
- 3 、 CodeCompletion （代码完成）属性里的一个特殊的变量是，激活 Ctrl-Alt-Space 可以完成在或不在当前文件里的类名。如果类没有引入则 import 标志会自动创建。
- 4 、使用 Ctrl-Shift-V 快捷键可以将最近使用的剪贴板内容选择插入到文本。使用时系统会弹出一个含有剪贴内容的对话框，从中你可以选择你要粘贴的部分。
- 5 、利用 CodeCompletion （代码完成）属性可以快速地在代码中完成各种不同地语句，方法是先键入一个类名地前几个字母然后再用 Ctrl-Space 完成全称。如果有多个选项，它们会列在速查列表里。
- 6 、用 Ctrl-/ 与 Ctrl-Shift-/ 来注释 / 反注释代码行与代码块。
- -/ 用单行注释标记（“ //… ”）来注释 / 反注释当前行或者选择地代码块。而 Ctrl-Shift-/ 则可以用块注释标记（“ /*…*/ ”）把所选块包围起来。要反注释一个代码块就在块中任何一个地方按 Ctrl-Shift-/ 即可。
- 7 、按 Alt-Q （ View|Context Info ）可以不需要移动代码就能查看当前方法地声明。连续按两次会显示当前所编辑的类名。
- 8 、使用 Refactor|Copy Class… 可以创建一个所选择的类的“副本”。这一点很有用，比如，在你想要创建一个大部分内容都和已存在类相同的类时。
- 9 、在编辑器里 Ctrl-D 可以复制选择的块或者没有所选块是的当前行。
- 10 、 Ctrl-W （选择字）在编辑器里的功能是先选择脱字符处的单词，然后选择源代码的扩展区域。举例来说，先选择一个方法名，然后是调用这个方法的表达式，然后是整个语句，然后包容块，等等。
- 11 、如果你不想让指示事件细节的“亮球”图标在编辑器上显示，通过按 Alt-Enter 组合键打开所有事件列表然后用鼠标点击它就可以把这个事件文本附件的亮球置成非活动状态。
- 这样以后就不会有指示特殊事件的亮球出现了，但是你仍然可以用 Alt-Enter 快捷键使用它。
- 12 、在使用 CodeCompletion 时，可以用逗点（ . ）字符，逗号（，）分号（；），空格和其它字符输入弹出列表里的当前高亮部分。选择的名字会随着输入的字符自动输入到编辑器里。
- 13 、在任何工具窗口里使用 Escape 键都可以把焦点移到编辑器上。
- Shift-Escape 不仅可以把焦点移到编辑器上而且还可以隐藏当前（或最后活动的）工具窗口。
- F12 键把焦点从编辑器移到最近使用的工具窗口。
- 14 、在调试程序时查看任何表达式值的一个容易的方法就是在编辑器中选择文本（可以按几次 Ctrl-W 组合键更有效地执行这个操作）然后按 Alt-F8 。
- 15 、要打开编辑器脱字符处使用的类或者方法 Java 文档的浏览器，就按 Shift-F1 （右键菜单的 External JavaDoc ）。
- 要使用这个功能须要把加入浏览器的路径，在“ General ”选项中设置（ Options | IDE Settings ），另外还要把创建的 Java 文档加入到工程中（ File | Project Properties ）。
- 16 、用 Ctrl-F12 （ View | File Structure Popup 
- 
