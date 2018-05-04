`目录 start`
 
- [LayUI](#layui)
    - [使用](#使用)
        - [模块化](#模块化)
        - [非模块化](#非模块化)
    - [组件](#组件)
        - [Layer](#layer)
        - [树形](#树形)

`目录 end` |_2018-05-05_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
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

## 组件

### Layer
> [layer组件](http://layer.layui.com/?alone) 十分强大
> [layer 移动版](http://layer.layui.com/mobile/api.html)

### 树形
> [基于layui树形菜单写的树形列表（treetable）](https://segmentfault.com/a/1190000011812724)



