`目录 start`
 
- [反射](#反射)

`目录 end` *目录创建于2018-02-23* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# 反射

_通过属性名得到对象属性的值_
```java
    PropertyDescriptor propertyDescriptor = new PropertyDescriptor(meta.getField().getName(), target);
    Method method = propertyDescriptor.getReadMethod();
    Object result = method.invoke(model);
```