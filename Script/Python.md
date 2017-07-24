# Python学习
## 简介
### 关于Python2.7与3.5的使用
## 基础数据类型
- 数值类型
    - 整数 各种进制 `0 八` `0x 十六` `0b 二`
    - 浮点数 `1.2e2` `13.34e-2`
    - 复数  `3+4j` `0.1-0.5j`
- 布尔型
    - 0或0.0 看成false
    - `""` `''` false
    - () [] {} false
- 字符串
    - 单引号 双引号 单行字符串
    - 三引号 多行字符串
- 空值 None
*****************
- 算术运算符优先级 `** / // % +`
    - // 取整数部分除法
    - ** 幂运算
- 位运算符
    - `<< >>` 左右移 ` & | `且或 `^  ~` 按位异或 按位翻转 
- 转移字符：
    - \a 响铃
    - \b  退格 backspace
    - \000  空
    - \f   换页
    - \  续行符（行尾）
## 基础语法
- 单行注释：`#` 多行注释：''' '''
- 空行的重要性，代码段之间有空行，Python之禅

************
## 输入输出
#### 读取命令行参数
> [参考博客](http://www.sharejs.com/codes/python/6121)
`只有输入参数，没有选项`
```
    import sys
    print("脚本名：", sys.argv[0])
    for i in range(1, len(sys.argv)):
        print("参数", i, sys.argv[i])
```
`python tree.py hi op ` 结果>> `脚本名 tree.py 参数1 hi 参数2 op`

`有选项`
`getopt.getopt(args, options[, long_options])`
```
    import sys, getopt
    opts, args = getopt.getopt(sys.argv[1:], "hi:o:")
    for op, value in opts:
    
```
- sys.argv[1:]为要处理的参数列表，sys.argv[0]为脚本名，所以用sys.argv[1:]过滤掉脚本名。
- "hi:o:": 当一个选项只是表示开关状态时，即后面不带附加参数时，在分析串中写入选项字符。当选项后面是带一个附加参数时，在分析串中写入选项字符同时后面加一个":"号。所以"hi:o:"就表示"h"是一个开关选项；"i:"和"o:"则表示后面应该带一个参数。
- 调用getopt函数。函数返回两个列表：opts和args。opts为分析出的格式信息。args为不属于格式信息的剩余的命令行参数。opts是一个两元组的列表。每个元素为：(选项串,附加参数)。如果没有附加参数则为空串''。
getopt函数的第三个参数[, long_options]为可选的长选项参数，上面例子中的都为短选项(如-i -o)
长选项格式举例:
--version
--file=error.txt
让一个脚本同时支持短选项和长选项
getopt.getopt(sys.argv[1:], "hi:o:", ["version", "file="])

### 序列
`序列通用操作（包含：字符串，列表，元组）`
- `​索引`，从左至右：`0,1,2...n` 从右至左：`-1,-2...-n`
- `切片`（截取序列的部分） `temp[:]` 返回一个副本
    - `temp[2:4]`就是`[2,4)` 
    - `temp[1:]`1到最后 `temp[-3:]` *[-3,-1]*
    - `temp[:4]` *[0,4)* `temp[:-3]` *[0,-3]*
- `加 `：lista+listb 直接连接
- `乘`：lista*4
- `判断是否存在`：`in` `not int`
- len() 
- min() max() sum()要求元素全是数值

*****
【列表】
- 元素可包含 字符串，浮点，整型，列表，布尔
- 操作：
    - 增加 + ，`append()/extend()`尾部加入元素/列表  `insert(index, "")` 元素插入到任意位置,其后元素后移
    - 检索 count() in 
    - 删除 ：`del list[2] `/ `remove("apple")` /`pop(index) index为空指最后一个`
    - 永久性排序：sort() a-z ` sort(reverse=True) z-a` 列表全是字符串才可
    - 临时性排序：sorted() 也可以使用上面的参数   列表全是字符串才可
    - 永久性的逆序列表:reverse() 

*****
【元组】
- 元组和列表类似但是元组是创建不可更改的 
    - 和列表相比，相同点：按定义的顺序排序，负索引一致，可以使用分片
    - 不同点：元组使用的是()，不能增加删除元素，没有index方法但是有in，可以在字典中作为键列表不可以，
    - 由于具有写保护，代码安全，操作速度略快列表
- 操作：
    - 访问： 和列表一样的索引和分片，
    - 连接：+ 连接得到新的元组
    - 删除：del 删除整个元组

*****
【字符串】
- str() 将对象转化成字符串 （注：Python中不能像Java一样字符串和数值直接+）
- repr() 注意和str()的区别
- `r"d:\python27\"` r前缀表示转义字符看成普通字符
- 因为Python字符串实现是类似字符数组，`temp = "python" temp[0]` 结果：p `temp.index("p")` 结果是：0
- 操作：
    - `index('s')` 找到s字符的下标
    - `find('s',[start,end])` 找s的下标，只有一个整数参数则是start
    - `replace('s','v')` 替换
    - `count('sd')` 计数
    - `split('')` 正则切分 空参数默认是空格
    - `join('')` 列表转化成字符串的方法
    - `cmp(str1,str2)` 比较两个字符串是否相等
    - `+`  进行拼接 可以拼接字符串 列表
    - `a in b` 判断a是否在b里存在
    - `*` 重复序列  例如 `print "-"*20` 就会输出20个 - 
    - `b = "www.github.com" `  `c = b.split(".")` `"#".join(c)` 实现了将字符串的 . 换成了#
    - `"i am %s %d" % ("python",67)  `%s %d %f 和C语言一样占位符
        - 新的方式 `"i am {0} {1} ..".format(23,"ret")`  
        - 或者`"i am {name} {age} ..".format(age=23,name="ret")`
        - 字典方式 
    - `title()` 首字母大写 

****
字符串，列表，元组相互转换：
- 字符串-列表 ： list("python")
- 字符串-元组：tuple("python")
- 列表或元组-字符串 join(obj) 参数是列表或元组类型，其元素只能是字符串类型


***************************************
#### 字符串编码问题(python 2问题)：

- encode("utf-8") str -> bytes
- decode() bytes -> str

```
    # coding:utf-8
    unicode_str = unicode('使用',encoding='utf-8')
    print unicode_str.encode('utf-8')
```

```
    import codecs
    codecs.open('filename',encoding='utf-8')
```
- 因为文件不是UTF8：`UnicodeDecodeError: 'utf-8' codec can't decode byte 0xb9 in position 2: invalid start byte `

*************************************
### 字典（键值对）
- 通过用空间来换取时间，与列表相比，键的增加不影响查找插入速度，需要占用大量内存 
- 特性：
    - 值是可以是任意的，甚至是字典嵌套
    - 键必须不可变，只能由 数值，字符串，元组，不能用列表
- 操作：
    - 定义字典 dict={}
    - 添加 ： dict['a'] = 2323 
    - 返回所有key：keys() 
    - 查询是否有这个键 ：has_key() 
    - get() keys() values() 
    - 转化元组并返回 ：items() 
    - 删除指定键：del() `del dict['name']` 
    - 删除所有：clear() 
    - 删除指定键并返回值 ：pop() 
    - 合并另一个字典：update() 
    - in 
- 嵌套
    - 字典套列表 `{'d':['we','e']}` 
    - 列表套字典，当成普通类型包含即可
    - 字典套字典

***********

### 基本运行结构
- 输入输出
    - input("") 默认当成字符串输入 数值：int() 强转一下
    - print("")      
- 选择：
    - if elif else
- for循环：
    - `for in ` `while ` 例如：`for i in range(1,10,2):`  范围 [1,10) 增量为2
    - pass 语句，当某个子句没有任何操作，，用pass保持程序结构完整性 不影响下一句 不像continue
- while 循环;
    - `while True:`` while ‘2’ in nums:`` while num<2:`  
    - `while 列表: ` 直到列表为空退出循环

```
    if (b==0) and (a==1) :
        pass
        print("pass")
    else:
        print("Hi")
```

*****************************************
### 函数

- 形参赋值传递方式
    - 按位置 `就是直接用看起来和Java一样，但不是按类型和位置，只是位置`
    - 按指定名称 调用的时候 `create(name='df')`
    - 缺省默认值（参数缺省之后，调用可以不传这个参数，否则必须要传） `def create(name='df')`
    - 列表类型，不想形参改变实参 传递副本过去即可 `list[:]`
    - `以下两种情况（* 和 **），都必须放在形参列表的最后 (两者同时使用时：* 只能在 ** 前 )`
    - 多个实参 `create(age, *name)` `create(12, 's','d')`
        - 所以这是名为name的元组 不能指定没有的名称 错误：create(12，d=2, 2,3,4)
    - 多个指定名称实参 `create(age, **name)` `create(12, name='d', lo=23)` 必须要指定名称 这是名为name的键值对字典
        - 错误：create(12,d=23,3,3,3)

    - 注意：
        - `def hi(name, age=0, *names, **s)` `hi('d', 23,34, d=6) ` age会被赋值23
        - `def hi(name, *names, age=0, **s)` `hi('d', 23,34, d=6)` 这样写age就不会赋值，除非指定名称 age=23
- 返回值
    - 返不返回 看需求

- 将函数写在一个py文件里，然后导入 `import 文件名`，名曰导入模块
    -  还可以加别名 `import creat as fun` 给模块加别名
    -  导入指定的函数 `from create import create_aliens, type_button` 多个就，分隔 同理 as给函数加别名 * 通配所有

************************************
### 类
`Python 不存在多态，存在鸭子类型` [博客介绍](http://blog.csdn.net/shangzhihaohao/article/details/7065675)
- 写在一个py文件里，默认构造器，可以加参数 `def __init__(self):`
- 类属性只要在任何的方法，构造器中`self`为前缀声明过的
- self 代表了自身引用 类似Java的this
- 特别不舒服 __init__ 这种命名 不像Java的构造函数重载，这个就是后面覆盖前面定义的__init__ 不管形参列表
    - 就是说不能多个构造函数的书写了。。。

- 导入和函数一样 注意继承中类的依赖
#### 继承
父类定义要在子类之前，
使用父类构造器
    - 2.× `super(子类名, self).__init__(参数)`
    - 3.× `super().__init__(参数)`

重写父类方法：只需要定义一个和父类方法同名的方法即可，因为没有多态，覆盖时形参不作考虑    
### 文件
- 注意路径，Windows系统中要使用反斜杠 \ 
  最简单：`file = open('')` 只读打开
  `使用with来操作 好处是Python自动关闭文件`
```
    with open('filename') as name: 
        name.read()
```
- 为写打开新文本文件只读 `file = open('a.txt','w+'[,coding='utf-8'])` 打开删空
- `file.write('')`
- 使用os模块
    - `os.rename('filename1','filename2') ` mv 
    - `os.remove('filename.py')` rm
    - `os.listdir(path)` ls 
    - `os.getcwd()` pwd
    - `os.makedirs(r'path')` mkdir
    - `os.chdir('')` 改变一个目录
    - `os.rmdir('')` 删除该目录，前提是空目录
- os.path模块
    - abspath('') 获取绝对路径
    - exists('')
    - isdir('')
    - isfile('') 
    - islink('')
    - getsize()

- shutil模块
    - dir() 复制单个文件
    - shultil.copytree(r'',r'') 复制目录树 

`b 表示字节流（二进制文件） 不加表示字符流（文本文件）`

|方式   |意义   |当存在   |当不存在   |
|:-----:|:-----:|:------:|:-----:|
|r   |只读打开   |打开   |返回空指针 |
|w   |只写打开新  |打开删空 |新建打开  |
|a   |追加打开   |打开   |新建打开  |
|r+  |读打开可写  |打开   |返回空指针  |
|w+  |写打开新可读 |打开删空 |新建打开  |
|a+  |追加打开可读 |打开   |新建打开  |
|rb  |只读打开   |打开   |返回空指针 |
|wb  |只写打开新  |打开删空 |新建打开  |
|ab  |追加打开   |打开   |新建打开  |
|rb+ |读打开可写  |打开   |返回空指针 |
|wb+ |写打开新可读 |打开删空 |新建打开  |
|ab+ |追加打开可读 |打开   |新建打开  |

`json `
```
    alien = {'color': 'green', 'age': '23'}
    files = 'a.json'
    with open(files, 'w') as o:
        json.dump(alien, o)
```
json.dump()持久化 和 load() 装载
### 异常
```
    try:
        print(5/0)
    except ZeroDivisionError:
        print("0 不能做除数")
    else:
        print("成功")
```
- 基本具有 `try except else` 块 else是当try成功就执行else 有异常就执行 except
- 也可以在块中写 pass 意思是不做处理

### 测试
- 文件名test开头就当做是测试类，不会直接运行
- 类继承 unittest.TestCase, 所有test_开头的方法都将自动运行
- 断言 self.assertEqual assertNotEquals assertIn(item, list)
- 直接运行 unittest.main()
- 输出结果，`. 测试通过` `E 测试运行错误` `F 测试断言不通过`
### GUI

### 数据库
#### MySQL
- python3环境下： `sudo apt install python3-mysqldb`



### 网络编程

### 绘图 matplotlib
`python 3.5 安装`
sudo apt install python3-matplotlib 
sudo apt install python3.5-dev python3.5-tk tk-dev
sudo apt install libfreetype6-dev g++


### Django
`python3.5 建立虚拟环境`
- `sudo apt install python3-venv`
- 在某目录 `python3 -m venv first_env`
- 激活环境 `source first_env/bin/activate`
    - 停用环境 `deactivate`
- 安装Django `pip install Django`
- 创建项目 `django-admin.py startproject first_pro . `
    - `ls first_pro`查看到创建的默认文件
- 创建SQLite数据库 `python manage.py migrate`    
- 启动项目`python3 manage.py runserver`


************
## 代码风格
- 一行只写一句
- 表达式尽量不要省略括号，有助于理解
- 函数的行数不要超过100行
- 尽量使用系统函数
- 尽量使用局部变量，不要使用全局
- 循环，分支，最好不要超过5层
- 尽量减少否定的条件语句
- 对输入的数据进行合法性检查

`巨坑: tab和空格不能混用,如果你复制别人的代码是tab,自己敲空格,就会缩进错误!!!!, 天灭tab空格保平安, 要不是kate编辑器显示了tab字符,找半天都不知道错在哪`
********
## 常见函数

- `id()` 查看内存地址
- `help(方法名)` 展示方法的说明文档
- `dir(对象)` 展示对象的方法API

## 常见库
- import codecs 编码
- import os 

## QT
在Terminal中输入:sudo apt-get install qt4-dev-tools qt4-doc qt4-qtconfig qt4-demos qt4-designer

    qt4-dev-tools 中包括了Qt Assistant,Qt Linguist,Qt Creator
    qt4-doc 这个是帮助文档
    qt4-qtconfig Qt的配置工具,这个装好默认好
    qt4-demos 官方的一些Demo
    qt4-designer 可视化窗体设置工具


## pygame
### 安装
*python2 安装 pygame*
- `sudo apt install python-pygame`
  *python3 安装 pygame*
- `sudo apt install python3-dev mercurial`
- `sudo apt install libsdl-image1.2-dev libsdl2-dev libsdl-ttf2.0-dev`
  *安装一些声音的功能*
- `sudo apt install libsdl-mixer1.2-dev libimportmidi-dev`
- `sudo apt install libswscale-dev libsmpeg-dev libavformat-dev libavcode-dev`
- `sudo apt install python-numpy`
  *执行这个安装pygame 如果必要换成 pip3*
- `pip install --user hg+http://bitbucket.org/pygame/pygame`
  *我使用上面的方式安装报错，使用这个完成了安装*
- `sudo pip install pygame`
*********
`检验是否安装成功`
- `import pygame ` 查看版本 `pygame.ver`

