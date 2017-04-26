# IDEA 使用笔记

## 常识
-  project 就是一个工作空间，一个Module就是一个项目
- 新建一个empty项目可以作为一个工作空间，放很多module,新建的时候不要选中任何目录，*选中JRE库*，再菜单栏点击File然后new，不然项目结构很乱
- 一个项目一个空间也是可以的，就是跨项目查看代码会有点麻烦，而且每个项目的配置文件都是不一样的，同样的配置可能要配置很多遍

## 常用技巧
### 导出为可运行的JAR包
- File -> project structure ->artifact 里面设置好 引入的库，设置Main类，引用的jar包的相对classpath
- Build artifact -> Build

## IDEA快捷键
### 使用类eclipse快捷键
### IDEA快捷键
- Ctrl Alt L 快速格式化代码
- 这时我们只需敲Ctrl+Shift+Enter就能自动补全末尾的字符。而且不只是括号，例如敲完if/for时也可以自动补上{}花括号。

- Alt+回车 导入包,自动修正
- Ctrl+N 查找类
Ctrl+Shift+N 查找文件
Ctrl+Alt+L 格式化代码

Ctrl+Alt+O 优化导入的类和包
Alt+Insert 生成代码(如get,set方法,构造函数等)
Ctrl+E或者Alt+Shift+C 最近更改的代码
Ctrl+R 替换文本

Ctrl+F 查找文本
Ctrl+Shift+Space 自动补全代码
Ctrl+空格 代码提示

Ctrl+Alt+Space 类名或接口名提示

Ctrl+P 方法参数提示

Ctrl+Shift+Alt+N 查找类中的方法或变量

Alt+Shift+C 对比最近修改的代码

Shift+F6 重构-重命名
Ctrl+Shift+先上键
Ctrl+X 删除行
Ctrl+D 复制行
Ctrl+/ 或 Ctrl+Shift+/ 注释（// 或者/*...*/ ）
Ctrl+J 自动代码
Ctrl+E 最近打开的文件

Ctrl+H 显示类结构图

Ctrl+Q 显示注释文档
Alt+F1 查找代码所在位置
Alt+1 快速打开或隐藏工程面板

Ctrl+Alt+ left/right 返回至上次浏览的位置
Alt+ left/right 切换代码视图

Alt+ Up/Down 在方法间快速移动定位

Ctrl+Shift+Up/Down 代码向上/下移动。

F2 或Shift+F2 高亮错误或警告快速定位

代码标签输入完成后，按Tab，生成代码。

选中文本，按Ctrl+Shift+F7 ，高亮显示所有该文本，按Esc高亮消失。

Ctrl+W 选中代码，连续按会有其他效果

选中文本，按Alt+F3 ，逐个往下查找相同文本，并高亮显示。

Ctrl+Up/Down 光标跳转到第一行或最后一行下

Ctrl+B 快速打开光标处的类或方法

最常用快捷键
1.Ctrl＋E，可以显示最近编辑的文件列表
2.Shift＋Click可以关闭文件
3.Ctrl＋[或]可以跳到大括号的开头结尾
4.Ctrl＋Shift＋Backspace可以跳转到上次编辑的地方
5.Ctrl＋F12，可以显示当前文件的结构
6.Ctrl＋F7可以查询当前元素在当前文件中的引用，然后按F3可以选择
7.Ctrl＋N，可以快速打开类
8.Ctrl＋Shift＋N，可以快速打开文件
9.Alt＋Q可以看到当前方法的声明
10.Ctrl＋W可以选择单词继而语句继而行继而函数
11.Alt＋F1可以将正在编辑的元素在各个面板中定位
12.Ctrl＋P，可以显示参数信息
13.Ctrl＋Shift＋Insert可以选择剪贴板内容并插入
14.Alt＋Insert可以生成构造器/Getter/Setter等
15.Ctrl＋Alt＋V 可以引入变量。例如把括号内的SQL赋成一个变量
16.Ctrl＋Alt＋T可以把代码包在一块内，例如try/catch
17.Alt＋Up and Alt＋Down可在方法间快速移动
下面的不是很有用
18.在一些地方按Alt＋Enter可以得到一些Intention Action，例如将”==”改为”equals()”
19.Ctrl＋Shift＋Alt＋N可以快速打开符号
20.Ctrl＋Shift＋Space在很多时候都能够给出Smart提示
21.Alt＋F3可以快速寻找
22.Ctrl＋/和Ctrl＋Shift＋/可以注释代码
23.Ctrl＋Alt＋B可以跳转到抽象方法的实现
24.Ctrl＋O可以选择父类的方法进行重写
25.Ctrl＋Q可以看JavaDoc
26.Ctrl＋Alt＋Space是类名自动完成
27.快速打开类/文件/符号时，可以使用通配符，也可以使用缩写
28.Live Templates! Ctrl＋J
29.Ctrl＋Shift＋F7可以高亮当前元素在当前文件中的使用
30.Ctrl＋Alt＋Up /Ctrl＋Alt＋Down可以快速跳转搜索结果
31.Ctrl＋Shift＋J可以整合两行
32.Alt＋F8是计算变量值
IntelliJ IDEA使用技巧一览表
在使用 InelliJ IDEA 的过程中，通过查找资料以及一些自己的摸索，发现这个众多 Java 程序员喜欢的 IDE 里有许多值得一提的小窍门，如果能熟练的将它们应用于实际开发过程中，相信它会大大节省你的开发时间，而且随之而来的还会有那么一点点成就感：） Try it ！
1 、写代码时用 Alt-Insert （ Code|Generate… ）可以创建类里面任何字段的 getter 与 setter 方法。
<?xml:namespace prefix = v ns = "urn:schemas-microsoft-com:vml" />
2 、右键点击断点标记（在文本的左边栏里）激活速查菜单，你可以快速设置 enable/disable 断点或者条件它的属性。
3 、 CodeCompletion （代码完成）属性里的一个特殊的变量是，激活 Ctrl-Alt-Space 可以完成在或不在当前文件里的类名。如果类没有引入则 import 标志会自动创建。
4 、使用 Ctrl-Shift-V 快捷键可以将最近使用的剪贴板内容选择插入到文本。使用时系统会弹出一个含有剪贴内容的对话框，从中你可以选择你要粘贴的部分。
5 、利用 CodeCompletion （代码完成）属性可以快速地在代码中完成各种不同地语句，方法是先键入一个类名地前几个字母然后再用 Ctrl-Space 完成全称。如果有多个选项，它们会列在速查列表里。
6 、用 Ctrl-/ 与 Ctrl-Shift-/ 来注释 / 反注释代码行与代码块。
-/ 用单行注释标记（“ //… ”）来注释 / 反注释当前行或者选择地代码块。而 Ctrl-Shift-/ 则可以用块注释标记（“ /*…*/ ”）把所选块包围起来。要反注释一个代码块就在块中任何一个地方按 Ctrl-Shift-/ 即可。
7 、按 Alt-Q （ View|Context Info ）可以不需要移动代码就能查看当前方法地声明。连续按两次会显示当前所编辑的类名。
8 、使用 Refactor|Copy Class… 可以创建一个所选择的类的“副本”。这一点很有用，比如，在你想要创建一个大部分内容都和已存在类相同的类时。
9 、在编辑器里 Ctrl-D 可以复制选择的块或者没有所选块是的当前行。
10 、 Ctrl-W （选择字）在编辑器里的功能是先选择脱字符处的单词，然后选择源代码的扩展区域。举例来说，先选择一个方法名，然后是调用这个方法的表达式，然后是整个语句，然后包容块，等等。
11 、如果你不想让指示事件细节的“亮球”图标在编辑器上显示，通过按 Alt-Enter 组合键打开所有事件列表然后用鼠标点击它就可以把这个事件文本附件的亮球置成非活动状态。
这样以后就不会有指示特殊事件的亮球出现了，但是你仍然可以用 Alt-Enter 快捷键使用它。
12 、在使用 CodeCompletion 时，可以用逗点（ . ）字符，逗号（，）分号（；），空格和其它字符输入弹出列表里的当前高亮部分。选择的名字会随着输入的字符自动输入到编辑器里。
13 、在任何工具窗口里使用 Escape 键都可以把焦点移到编辑器上。
Shift-Escape 不仅可以把焦点移到编辑器上而且还可以隐藏当前（或最后活动的）工具窗口。
F12 键把焦点从编辑器移到最近使用的工具窗口。
14 、在调试程序时查看任何表达式值的一个容易的方法就是在编辑器中选择文本（可以按几次 Ctrl-W 组合键更有效地执行这个操作）然后按 Alt-F8 。
15 、要打开编辑器脱字符处使用的类或者方法 Java 文档的浏览器，就按 Shift-F1 （右键菜单的 External JavaDoc ）。
要使用这个功能须要把加入浏览器的路径，在“ General ”选项中设置（ Options | IDE Settings ），另外还要把创建的 Java 文档加入到工程中（ File | Project Properties ）。
16 、用 Ctrl-F12 （ View | File Structure Popup ）键你可以在当前编辑的文件中快速导航。
这时它会显示当前类的成员列表。选中一个要导航的元素然后按 Enter 键或 F4 键。要轻松地定位到列表中的一个条目，只需键入它的名字即可。
17 、在代码中把光标置于标记符或者它的检查点上再按 Alt-F7 （右键菜单中的 Find Usages… ）会很快地查找到在整个工程中使用地某一个类、方法或者变量的位置。
18 、按 Ctrl-N （ Go to | Class… ）再键入类的名字可以快速地在编辑器里打开任何一个类。从显示出来的下拉列表里选择类。
同样的方法你可以通过使用 Ctrl-Shift-N （ Go to | File… ）打开工程中的非 Java 文件。
19 、要导航代码中一些地方使用到的类、方法或者变量的声明，把光标放在查看项上再按 Ctrl-B 即可。也可以通过按 Ctrl 键的同时在查看点上单击鼠标键调转到声明处。
20 、把光标放到查看点上再按 Ctrl-Alt-B 可以导航到一个抽象方法的实现代码。
21 、要看一个所选择的类的继承层次，按 Ctrl-H （ Browse Type Hierarchy ）即可。也可以激活编辑器中的继承关系视图查看当前编辑类的继承关系。22 、使用 Ctrl-Shift-F7 （ Search | Highlight Usages in File ）可以快速高亮显示当前文件中某一变量的使用地方。按 Escape 清除高亮显示。
23 、用 Alt-F3 （ Search | Incremental Search ）在编辑器中实现快速查查找功能。
在“ Search for: ”提示工具里输入字符，使用箭头键朝前和朝后搜索。按 Escape 退出。
24 、按 Ctrl-J 组合键来执行一些你记不起来的 Live Template 缩写。比如，键“ it ”然后按 Ctrl-J 看看有什么发生。
25 、 Introduce Variable 整合帮助你简化代码中复杂的声明。举个例子，在下面的代码片断里，在代码中选择一个表达式：然后按 Ctrl-Alt-V 。
26 、 Ctrl-Shift-J 快捷键把两行合成一行并把不必要的空格去掉以匹配你的代码格式。
27 、 Ctrl-Shift-Backspace （ Go to | Last Edit Location ）让你调转到代码中所做改变的最后一个地方。
多按几次 Ctrl-Shift-Backspace 查看更深的修改历史。
28 、用 Tools | Reformat Code… 根据你的代码样式参考（查看 Options | IDE Setting | Code Style ）格式化代码。
使用 Tools | Optimize Imports… 可以根据设置（查看 Options | IDE Setting | Code Style | Imports ）自动“优化” imports （清除无用的 imports 等）。
29 、使用 IDEA 的 Live Templates | Live Templates 让你在眨眼间创建许多典型代码。比如，在一个方法里键入
再按 Tab 键看有什么事情发生了。
用 Tab 键在不同的模板域内移动。查看 Options | Live Templates 获取更多的细节。
30 、要查看一个文件中修改的本地历史，激活右键菜单里的 Local VCS | Show History… 。也许你可以导航不同的文件版本，看看它们的不同之处再回滚到以前的任何一个版本吧。
使用同样的右键菜单条目还可以看到一个目录里修改的历史。有了这个特性你就不会丢失任何代码了。
31 、如果要了解主菜单里每一个条目的用途，把鼠标指针移到菜单条目上再应用程序框架的底部的状态栏里就会显示它们的一些简短描述，也许会对你有帮助。
32 、要在编辑器里显示方法间的分隔线，打开 Options | IDE Settings | Editor ，选中“ Show method separators ”检查盒（ checkbox ）。
33 、用 Alt-Up 和 Alt-Down 键可以在编辑器里不同的方法之间快速移动。
34 、用 F2/Shift-F2 键在高亮显示的语法错误间跳转。
用 Ctrl-Alt-Down/Ctrl-Alt-Up 快捷键则可以在编译器错误信息或者查找操作结果间跳转。
35 、通过按 Ctrl-O （ Code | Override Methods… ）可以很容易地重载基本类地方法。
要完成当前类 implements 的（或者抽象基本类的）接口的方法，就使用 Ctrl-I （ Code | Implement Methods… ）。
36 、如果光标置于一个方法调用的括号间，按 Ctrl-P 会显示一个可用参数的列表。
37 、要快速查看编辑器脱字符处使用的类或方法的 Java 文档，按 Ctrl-Q （在弹出菜单的 Show Quick JavaDoc 里）即可。
38 、像 Ctrl-Q （ Show Quick JavaDoc 显示简洁 Java 文档）， Ctrl-P （ Show Parameter Info 显示参数信息）， Ctrl-B （ Go to Declaration 跳转到声明）， Shift-F1 （ External JavaDoc 外部 Java 文档）以及其它一些快捷键不仅可以在编辑器里使用，也可以应用在代码完成右键列表里。
39 、 Ctrl-E （ View | Recent Files ）弹出最近访问的文件右键列表。选中文件按 Enter 键打开。
40 、在 IDEA 中可以很容易地对你的类，方法以及变量进行重命名并在所有使用到它们的地方自动更正。
试一下，把编辑器脱字符置于任何一个变量名字上然后按 Shift-F6 （ Refactor | Rename… ）。在对话框里键入要显示地新名字再按 Enter 。你会浏览到使用这个变量地所有地方然后按“ Do Refactor ”按钮结束重命名操作。
41 、要在任何视图（ Project View 工程视图， Structure View 结构视图或者其它视图）里快速
选择当前编辑地部分（类，文件，方法或者字段），按 Alt-F1 （ View | Select in… ）。
42 、在“ new ”字符后实例化一个已知类型对象时也许你会用到 SmartType 代码完成这个特性。比如，键入
再按 Ctrl-Shift-Space ：
43 、通过使用 SmartType 代码完成，在 IDEA 中创建接口的整个匿名 implementation 也是非常容易的，比如，对于一些 listener （监听器），可以键入
Component component;
component.addMouseListener(
new <caret is here>
);
然后再按 Ctrl-Shift-Space 看看有什么发生了。
44 、在你需要设置一个已知类型的表达式的值时用 SmartType 代码完成也很有帮助。比如，键入
String s = ( <caret is here>
再按 Ctrl-Shift-Space 看看会有什么出现。
45 、在所有视图里都提供了速查功能：在树里只需键入字符就可以快速定位到一个条目。
46 、当你想用代码片断捕捉异常时，在编辑器里选中这个片断，按 Ctrl-Alt-T （ Code | Surround with… ）然后选择“ try/catch ”。它会自动产生代码片断中抛出的所有异常的捕捉块。在 Options | File Templates | Code tab 中你还可以自己定制产生捕捉块的模板。
用列表中的其它项可以包围别的一些结构。
47 、在使用代码完成时，用 Tab 键可以输入弹出列表里的高亮显示部分。
不像用 Enter 键接受输入，这个选中的名字会覆盖掉脱字符右边名字的其它部分。这一点在用一个方法或者变量名替换另一个时特别有用。
48 、在声明一个变量时代码完成特性会给你显示一个建议名。比如，开始键入“ private FileOutputStream ”然后按 Ctrl-Space 


