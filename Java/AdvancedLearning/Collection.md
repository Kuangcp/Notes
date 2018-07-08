`目录 start`
 
- [集合](#集合)
    - [集合继承和实现关系](#集合继承和实现关系)
        - [继承关系](#继承关系)
        - [实现关系](#实现关系)
    - [Iterator](#iterator)
    - [【Map】](#map)
    - [【List】](#list)
    - [【Set】](#set)
    - [Hash](#hash)

`目录 end` |_2018-07-08_| [码云](https://gitee.com/gin9) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 集合
> 重要的知识点，面试必问，使用频率也很高

## 集合继承和实现关系
### 继承关系
### 实现关系
- Collection接口
    - List接口  _内容允许重复_
        - ArrayList
        - LinkedList _也实现了Queue接口_
        - Vector
    - Set接口 _内容不允许重复_
    - Queue接口 _队列接口_
    - SortedSet接口 _单值排序接口_

- Map接口
    - HashMap接口 _无序, key不重复_
    - HashTable接口 _无序, key不重复_
    - TreeMap接口 _按key排序, key不重复_
    - IdentityMap接口 _key可重复_
    - WeakHashMap接口 _弱引用Map集合_

## Iterator
> 迭代器


## 【Map】

## 【List】

## 【Set】
- Set是无序的，但是StringRedisTemplate的对象操作返回的set竟然是有序的
    - 因为有一个类是SortSet，顾名思义，所以是有序的，要继续多学习和使用Java原生的集合对象了

> [3分钟搞掂Set集合](https://segmentfault.com/a/1190000014391402?utm_source=channel-hottest)

## Hash
- [HashMap 实现原理](http://www.importnew.com/27043.html)