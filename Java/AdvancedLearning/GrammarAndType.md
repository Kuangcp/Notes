`目录 start`
 
- [基础语法](#基础语法)
    - [结构](#结构)
        - [判断](#判断)
        - [循环](#循环)
    - [用户输入输出](#用户输入输出)
- [数据类型](#数据类型)
    - [基础数据类型](#基础数据类型)
    - [包装类型](#包装类型)
        - [String](#string)

`目录 end` *目录创建于2018-01-22* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# 基础语法

## 结构
### 判断
- if
- switch

### 循环
- while
- for each循环里面 `for(item:list){}` list对象如果是一个对象的方法返回的，那么只会调用一次

## 用户输入输出
- `System.out.println("")` 输出并换行
    - print() 输出, 行末不换行
    - printf() 格式化输出, 和C语法类似

***********************
# 数据类型

## 基础数据类型

## 包装类型
### String
- 常见编码转换
    - 一般Windows文件默认编码：`str = new String(str.getBytes("iso8859-1"), "gb2312"); ` 
    - properties文件中获取中文 `str = new String(str.getBytes("utf-8"), "utf-8");`


*************************
# 关键字

