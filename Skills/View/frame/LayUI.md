# LayUI

## 使用

### 模块化
> 写法稍微复杂了些,但是提高了页面加载速度

引入核心文件:
```html
<link rel="stylesheet" href="../layui/css/layui.css"/>
<script src="../layui/layui.js"></script>
```
使用layer模块:
```js
layui.use(['layer'], function(){
    var layer = layui.layer;
    layer.msg('Hello World');
});
```


### 非模块化
