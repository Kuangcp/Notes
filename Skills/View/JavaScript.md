# JavaScript

## 数据类型
> 虽然是弱类型,但还是要注意一下

### 字符串
- 字符串转码:
    - [参考博客:JS字符串相关转码函数](http://www.cnblogs.com/xcsn/archive/2013/05/15/3079373.html)

## 常用库和框架
- lozad.js 懒加载

### Jquery
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
## JSON
- 直接点引用属性
    - 迭代集合:自带foreach循环 `data.forEach(function(value){})`

## 常用功能小模块
### 输入校验

- [Blog:关于Input的输入校验](http://yuncode.net/code/c_5039bb4a3fccf28)`数字,字母汉字等限制`