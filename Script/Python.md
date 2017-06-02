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
单行注释：`#` 多行注释：`''' '''`
空行的重要性，代码段之间有空行

************
### 输入输出

- python2 raw_input() 输入字符串 input() 输入数字

### 序列
序列通用操作（字符串，列表，元组）
- `​索引`，从左至右：`0,1,2...n` 从右至左：`-1,-2...-n`
- `切片`（截取序列的部分） `temp[:]` 返回一个副本
    - `temp[2:4]`就是`[2,4)` 
    - `temp[1:]`1到最后 `temp[-3:]` *[-3,-1]*
    - `temp[:4]` *[0,4)* `temp[:-3]` *[0,-3]*
- `加 `：lista+listb 直接连接
- `乘`：lista*4
- `判断是否存在`：`in` `not int`
- len() min() max() sum()要求元素全是数值
*****
列表：
- 元素可包含 字符串，浮点，整型，列表，布尔
- 操作：
    - 增加 + ，`append()/extend()`尾部加入元素/列表  `insert(index, "")` 元素插入到任意位置,其后元素后移
    - 检索 count() in 
    - 删除 ：`del list[2] `/ `remove("apple")` /`pop(index) index为空指最后一个`
    - 永久性排序：sort() a-z ` sort(reverse=True) z-a` 列表全是字符串才可
    - 临时性排序：sorted() 也可以使用上面的参数   列表全是字符串才可
    - 永久性的逆序列表:reverse() 
*****
元组：
- 元组和列表类似但是元组是创建不可更改的 
    - 和列表相比，相同点：按定义的顺序排序，负索引一致，可以使用分片
    - 不同点：元组使用的是()，不能增加删除元素，没有index方法但是有in，可以在字典中作为键列表不可以，
    - 由于具有写保护，代码安全，操作速度略快列表
- 操作：
    - 访问： 和列表一样的索引和分片，
    - 连接：+ 连接得到新的元组
    - 删除：del 删除整个元组
*****
字符串：
- str() 将对象转化成字符串 （注：Python中不能像Java一样字符串和数值直接+）
- repr() 注意和str()的区别
- r"d:\python27\" r前缀表示转义字符看成普通字符
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
    - `*` 重复序列  例如 print "-"*20 就会输出20个 - 
    - `b = "www.github.com" `  `c = b.split(".")` `"#".join(c)` 实现了将字符串的 . 换成了#
    - `"i am %s %d" % ("python",67)  `%s %d %f 和C语言一样占位符
        - 新的方式 `"i am {0} {1} ..".format(23,"ret")`  或者`"i am {name} {age} ..".format(age=23,name="ret")`
        - 字典方式 
    - title() 首字母大写 
**************
字符串，列表，元组相互转换：
- 字符串-列表 ： list("python")
- 字符串-元组：tuple("python")
- 列表或元组-字符串 join(obj) 参数是列表或元组类型，其元素只能是字符串类型

#### 编码问题(python 2问题)：

- encode("utf-8")
- decode()

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

### 字典（键值对）
- 通过用空间来换取时间，与列表相比，键的增加不影响查找插入速度，需要占用大量内存 
- 特性：
    - 值是可以是任意的，甚至是字典嵌套
    - 键必须不可变，只能由 数，字符串，元组，不能用列表
- 操作：
    - keys() 返回所有key
    - has_key() 查询是否有这个键 
    - get() keys() values() 显然的
    - items() 转化元组并返回
    - del() `del dict['name']` 删除指定键
    - clear() 删除所有
    - pop() 删除指定键并返回值
    - update() 合并另一个字典
    - in 
  
***********
### 基本运行结构
- 选择：
    - if elif else
- 循环：
    - `for in ` `while ` 例如：`for i in range(1,10,2):`[1,10) 增量为2
    - pass 语句，当某个子句没有任何操作，，用pass保持程序结构完整性 不影响下一句 
```
    if (b==0) and (a==1) :
        pass
        print("pass")
    else:
        print("Hi")
```
### 函数

### 类
### 文件
- 为写打开新文本文件只读 `file = open('a.txt','w+'[,coding='utf-8'])` 打开删空
- `file.write('')`
`使用with来操作`
```
    with open('filename') as name: 
        name.read()
```
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
### GUI
### 绘图
### 数据库
### 网络编程
### 异常

### Django

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
## 常见函数

- `id()` 查看内存地址
- `help(方法名)` 展示方法的说明文档
- `dir(对象)` 展示对象的方法API

## 常见库
- import codecs 编码
- import os 


## pygame
### 安装
`python2 安装 pygame`
- `sudo apt install python-pygame`
`python3 安装 pygame`
- `sudo apt install python3-dev mercurial`
- `sudo apt install libsdl-image1.2-dev libsdl2-dev libsdl-ttf2.0-dev`
`安装一些声音的功能`
- `sudo apt install libsdl-mixer1.2-dev libimportmidi-dev`
- `sudo apt install libswscale-dev libsmpeg-dev libavformat-dev libavcode-dev`
- `sudo apt install python-numpy`
`执行这个安装pygame 如果必要换成 pip3`
- `pip install --user hg+http://bitbucket.org/pygame/pygame`
`个人安装报错，使用这个完成了安装`
- `sudo pip install pygame`
*********
`检验是否安装成功`
- `import pygame ` 查看版本 `pygame.ver`

