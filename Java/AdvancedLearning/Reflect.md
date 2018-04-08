`目录 start`
 
- [反射](#反射)

`目录 end` |_2018-04-08_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 反射

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