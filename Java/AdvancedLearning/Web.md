# Java Web
## 1.【JSP/Servlet】

### Servlet
### Jsp

### Tips
- 1、JSP页面上的SQL标签以及EL标签是优先于文件头的那些JavaServlet语句运行的，所以要保证非法进入页面时重定向的问题
- 2、如果想要获取异常来据此返回参数到页面弹窗提示，那么就要对一层层的方法调用，进行查找，所有的try catch 块 都要检查
    - 因为一般我的习惯就是把异常当场就处理了，而要实现这个要求就必须将异常层层上抛！！！！
* 3、中文乱码问题：
    - **接收**
        - 使用get方法，需要转换成gbk :`newString(s.getBytes("ISO-88511-1","gbk");`
        - post方法需要转换成UTF-8
    - **回应** 均使用UTF-8

*  4、查询数据： 使用set集合，查询对象是否存在，使用contians
*  5、Servlet 是单例多线程的
*  6、**eclipse中将java项目转成web项目**
    *  经常在eclipse中导入web项目时，出现转不了项目类型的问题，导入后就是一个java项目，有过很多次经历，今天也有同事遇到类似问题，就把这个解决方法记下来吧，免得以后再到处去搜索。 
    **解决步骤**： 
  
-  1、进入项目目录，可看到.project文件，打开。 
-  2、找到`<natures>...</natures>`代码段。 
-  3、在第2步的代码段中加入如下标签内容并保存： 
 
``` xml
    <nature>org.eclipse.wst.common.project.facet.core.nature</nature>
    <nature>org.eclipse.wst.common.modulecore.ModuleCoreNature</nature> 
    <nature>org.eclipse.jem.workbench.JavaEMFNature</nature> 

``` 
- 4、在eclipse的项目上点右键，刷新项目。 
- 5、在项目上点右键，进入属性（properties） 
- 6、在左侧列表项目中点击选择“Project Facets”，在右侧选择“Dynamic Web Module”和"Java"，点击OK保存即可。
