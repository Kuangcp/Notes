`目录 start`
 
- [如何使用Junit](#如何使用junit)
    - [在Maven项目中](#在maven项目中)

`目录 end` |_2018-03-14_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 如何使用Junit

## 在Maven项目中
_添加依赖_
```xml
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.11</version>
    <scope>test</scope>
</dependency>
```

_例如该项目结构_
```
└── src
    ├── main
    │   ├── java
    │   │   └── com
    │   │       └── kuangcp
    │   │           └── mythpoi
    │   │               ├── excel
    │   │               │   ├── ExcelExport.java
    │   │               │   ├── ExcelImport.java
    └── test
        └── java
            └── com
                └── kuangcp
                    └── mythpoi
                        ├── excel
                        │   ├── ExcelExportTest.java
                        │   └── ExcelImportTest.java
```

> 如果是Idea然后使用快捷键Ctrl Shift T即可自动创建测试类  

- 手动创建则一般按照规范是:
    - 包结构要和被测试类保持一致
    - 创建一个Java类, 命名为被测试类名字后加上Test
    - 测试具体的方法: test加上方法名
    - 测试方法里一般使用断言进行测试, 更为直观

- Junit
    - 只需要在一个普通方法上打上@Test注解, 该方法即可当成main方法直接运行
    - 并且注解分为 Before After Test, 顾名思义, Before就是在所有Test执行前执行, After反之

```java
/**
 * Created by https://github.com/kuangcp on 18-2-23  下午9:54
 * @author kuangcp
 */
public class ExcelImportTest {
    @Test
    public void testImportExcel(){
        List<Employee> result = ExcelImport.importExcel("/home/kcp/test/employee.xls", Employee.class);
        result.forEach(item -> {
            System.out.println(item.toString());
        });
        assert result.size() == 6;
    }
}
```


