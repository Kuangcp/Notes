`目录 start`
 
- [Markdown](#markdown)
    - [Github](#github)

`目录 end` *目录创建于2018-01-22* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# Markdown
> [markup](https://github.com/github/markup)`各种标记性文本格式`

**************
## Github
> [比较全面的Github格式 GFM](https://github.com/guodongxiaren/README)



_目录规则（页内跳转）_

- `[](#标题名)` 不需要编码
- `【Name】`看成Name 忽略这对符号 
    - 同理还有  `/` 中英文的 逗号 句号 冒号 小数点 问号
- 空格会变成 - 

****
_文件内容_
- 一行显示上 58列 就要换行
- 行末加上两个空格即是换行, 直接回车键换行是没有用的
- *todo* 未完成 `[ ]` 已完成 `[X]`
- 列表的折叠写法
```
    ### Demo
    <details>
    <summary>查看全部</summary>
    * [`chunk`](#chunk)
    </details>
```

*****
_md文件的头属性_
```
    ---
    title: 泛型
    tags: Java, 泛型
    ---
```