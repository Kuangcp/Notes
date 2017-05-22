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
输入输出

- python2 raw_input() 输入字符串 input() 输入数字

字符串

- str() 将对象转化成字符串 （注：Python中不能像Java一样字符串和数值直接+）
- repr() 注意和str()的区别
- r"d:\python27\" r前缀表示转义字符看成普通字符
- 因为Python字符串实现是类似字符数组，`temp = "python" temp[0]` 结果：p `temp.index("p")` 结果是：0

字符串基本操作：

- 切片： `temp[:]` 复制(引用的同一个内存对象) `temp[2:4]`就是[2,4) `temp[1:]`1到最后
- cmp(str1,str2) 比较两个字符串是否相等


- `+`  进行拼接 可以拼接字符串 列表
- `a in b` 判断a是否在b里存在
- `*` 重复序列  例如 print "-"*20 就会输出20个 - 
- `b = "www.github.com" `  `c = b.split(".")` `"#".join(c)` 实现了将字符串的 . 换成了#
- `"i am %s %d" % ("python",67)  `%s %d %f 和C语言一样占位符
  - 新的方式 `"i am {0} {1} ..".format(23,"ret")`  或者`"i am {name} {age} ..".format(age=23,name="ret")`
  - 字典方式 

编码问题(python 2问题)：

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

列表：

- ​



## 常见函数

- id() 查看内存地址
- help(方法名) 展示方法的说明文档
- dir(对象) 展示对象的方法API

## 常见库

