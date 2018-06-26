`目录 start`
 
- [反射](#反射)
    - [获得类的方法](#获得类的方法)

`目录 end` |_2018-06-21_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 反射
> [ Java反射异常处理之InvocationTargetException ](https://blog.csdn.net/zhangzeyuaaa/article/details/39611467)


## 获取属性
_通过属性名得到对象属性的值_
```java
    PropertyDescriptor propertyDescriptor = new PropertyDescriptor(meta.getField().getName(), target);
    Method method = propertyDescriptor.getReadMethod();
    Object result = method.invoke(model);
```
或者如下方式更为简洁
```java
    // set
    A a = new A();
    Field field = a.getClass().getDeclaredField("x");
    field.setAccessible(true);
    field.set(a, 1);
    // get
    Field f = a.getClass().getDeclaredField("x");
    f.setAccessible(true);
    System.out.println(f.get(a));
```

## 获得方法

### 性能问题
> [参考博客: java反射的性能问题 ](http://www.cnblogs.com/zhishan/p/3195771.html)

