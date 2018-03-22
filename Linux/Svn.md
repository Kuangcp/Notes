`目录 start`
 
- [SVN](#svn)
    - [安装](#安装)
        - [Linux](#linux)
    - [使用](#使用)
    - [查看](#查看)

`目录 end` |_2018-03-22_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# SVN
> 传统的中心化版本控制工具

## 安装
### Linux
_Ubuntu_
`sudo apt install subversion`

## 使用
[参考博客: linux-svn命令](http://blog.csdn.net/gexiaobaohelloworld/article/details/7752862) | [SVN常用命令](http://www.cnblogs.com/SanMaoSpace/p/5102878.html)  

- 下拉代码 `svn co URL`  
- 添加文件 `svn add * --force`  
- 将改动的文件提交到版本库 `svn ci -m “update“` 
    - 因为是中心化的仓库, 所以提交就是推送到总仓库了, 不像Git那样先提到到本地仓库, 然后推送至远程仓库
- 更新本地代码 `svn up`  
> svn update如果后面没有目录，默认将当前目录以及子目录下的所有文件都更新到最新版本

## 查看
> [查看最后修改的文件](https://java-er.com/blog/svn-last-files/)

- `svn log | less` 这样能更为方便和干净
