`目录 start`
 
- [SVN](#svn)
    - [服务端安装](#服务端安装)
        - [svnadmin使用](#svnadmin使用)
        - [备份和恢复](#备份和恢复)
            - [远程](#远程)
    - [客户端安装](#客户端安装)
        - [Linux](#linux)
        - [使用](#使用)
        - [查看](#查看)

`目录 end` |_2018-04-18_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# SVN
> 传统的中心化版本控制工具,能够精确控制每个目录的权限  
> [SVN中文网](http://www.svn.org.cn) [Subversion 与版本控制 书籍](http://svnbook.red-bean.com/)

## 服务端安装
### svnadmin使用
[参考 建立一个仓库](http://www.cnblogs.com/xkops/p/5457935.html)
`svnadmin create /yc/svn/rep-ops`

### 备份和恢复
> [SVN版本库的备份、还原、移植（初级篇、中级篇和高级篇）](https://blog.csdn.net/windone0109/article/details/2908133)  
> [svn备份一般采用三种方式](https://blog.csdn.net/beyondlpf/article/details/54138865)

1. 备份 svndump /svn/repos > a.dump
2. 恢复 svnadmin load /svn/repos < a.dump

#### 远程
> [详细文档](http://svnbook.red-bean.com/en/1.7/svn.ref.svnrdump.html#svn.ref.svnrdump.sw.incremental)
> | [问题的解决](https://www.saas-secure.com/svn-hosting/svn-dump-restore.html#svn-remote-backup-restore)
> | [参考](https://www.saas-secure.com/svn-hosting/svn-dump-restore.html)

1. 增量备份 `svnrdump dump http://192.168.10.200/svn/test/ --username kuangchengping --password 123456 -r 3:4 --incremental > b4.dump`
2. 恢复 `svnrdump load http://192.168.10.200/svn/test/ --username kuangchengping --password 123456 < b4.dump`

## 客户端安装
### Linux
_Ubuntu_
`sudo apt install subversion`

### 使用
> [参考博客: linux-svn命令](http://blog.csdn.net/gexiaobaohelloworld/article/details/7752862) | [SVN常用命令](http://www.cnblogs.com/SanMaoSpace/p/5102878.html)
> | [Linux下SVN客户端使用教程（全）](https://blog.csdn.net/qq_27968607/article/details/55253997)  

- 下拉代码 `svn co URL`  
- 添加文件 
    - svn add file , 或者 *.java 当前目录下java文件, 或者 文件夹, 一般使用文件夹好点也就src目录
    - 强制添加所有文件`svn add * --force`  
- 将改动的文件提交到版本库 `svn ci -m “update“` 
    - 因为是中心化的仓库, 所以提交就是推送到总仓库了, 不像Git那样先提到到本地仓库, 然后推送至远程仓库
- 更新本地代码 `svn up`  
> svn update如果后面没有目录，默认将当前目录以及子目录下的所有文件都更新到最新版本

### 查看
> [查看最后修改的文件](https://java-er.com/blog/svn-last-files/)  
> | [svn历史版本对比以及还原到历史版本](http://www.cnblogs.com/simonote/articles/3086717.html)

- `svn log | less` 这样能更为方便和干净
- `svn cat -r 版本号 文件` 输出某个版本的某文件(文件必须在本地存在)
- `svn diff -r 版本号:版本号 文件` 对比两个版本的某文件
