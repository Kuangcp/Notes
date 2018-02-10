`目录 start`
 
- [JavaScript](#javascript)
    - [数据类型](#数据类型)
        - [字符串](#字符串)
    - [JSON](#json)
    - [常用功能小模块](#常用功能小模块)
        - [输入校验](#输入校验)
    - [事件](#事件)
        - [鼠标](#鼠标)
            - [滚轮](#滚轮)
    - [常用库和框架](#常用库和框架)
        - [Jquery](#jquery)
            - [form插件](#form插件)

`目录 end` *目录创建于2018-02-10* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# JavaScript

## 数据类型
> 虽然是弱类型,但还是要注意一下


### 字符串
- 字符串转码:
    - [参考博客:JS字符串相关转码函数](http://www.cnblogs.com/xcsn/archive/2013/05/15/3079373.html)



**********************
## JSON
> [json 数据 添加 删除 排序](http://blog.51yip.com/jsjquery/1583.html)

- 直接点引用属性或者a['b']的方式
    - 迭代集合:自带foreach循环 `data.forEach(function(value){})`

```js
    var array = {
        "a": "abc",
        "b": [1, 2, 3, 4, 5, 6],
        "c": 3,
        "d": {
            "name": "james",
            "age": 28
        },
        "e": null,
        "f": true
    };

    //遍历array方式1
    for (var x in array) {
        if (typeof array[x] == 'object' && array[x] != null) {
            for (var y in array[x]) {
                console.log(">>key = " + y + " value = " + array[x][y]);
            }
        } else {
            console.log("key = " + x + " value = " + array[x]); // 非array object
        }
    }
```
## 常用功能小模块
### 输入校验

- [Blog:关于Input的输入校验](http://yuncode.net/code/c_5039bb4a3fccf28)`数字,字母汉字等限制`


## 事件


### 鼠标

#### 滚轮
> [JavaScript 鼠标滚轮事件](https://www.web-tinker.com/article/20037.html)



## 常用库和框架
- lozad.js 懒加载

### Jquery
> jquery有是slim版, 这个是没有ajax的精简版

- 事件绑定 `$('#Button').on('click', function(){})`
- 在HTML的DOM上绑定数据:设置 `data-*` 属性 然后jq拿到元素直接调用 `$(this).data('id')`拿到值就可以避免函数传值
#### form插件
```js
// 使用jquery 的 form插件进行异步提交
$(".submit").on('click', function () {
        console.log('dfs')
        // var jk = $("#contents").submit()
        var options = {
            // target:'#contents', //后台将把传递过来的值赋给该元素
            url:'../teacher/topic/add', //提交给哪个执行
            type:'POST',
            success: function(data){
                console.log(data)
            } //显示操作提示
        };
        $('#contents').ajaxSubmit(options);
    })
```