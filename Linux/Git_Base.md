`目录 start`
 
- [Git基础](#git基础)
    - [Git常用命令](#git常用命令)
            - [【Tips】](#tips)
            - [【git config】](#git-config)
            - [【git commit】](#git-commit)
            - [【git remote】](#git-remote)
            - [【fork 相关操作】](#fork-相关操作)
            - [【git push】](#git-push)
            - [【git rebase】](#git-rebase)
            - [【git log】](#git-log)
            - [【git tag】](#git-tag)
        - [分支操作](#分支操作)
            - [【git clone】](#git-clone)
            - [【git checkout】](#git-checkout)
            - [【git fetch】](#git-fetch)
            - [开发流程的常用分支操作](#开发流程的常用分支操作)
            - [【git merge】](#git-merge)
            - [【git grep 】](#git-grep-)
    - [CVS工具的区别以及优缺点](#cvs工具的区别以及优缺点)
        - [Git](#git)
        - [SVN](#svn)
    - [加强版 repos的使用](#加强版-repos的使用)

`目录 end` *目录创建于2018-01-14*
****************************************
# Git基础
## Git常用命令
> [中文教程](https://git-scm.com/book/zh/v2)
> [git-tips](https://github.com/521xueweihan/git-tips)`学习Git的仓库`

#### 【Tips】
- `git ls-files` 列出文件列表
    - `git ls-files | xargs wc -l` 计算文件中程序代码行数 通过工具：`xargs` `wc` (中文命名的文件编码问题无法计算行数)
    - `git ls-files | xargs cat | wc -l` 计算行数总和
        - `|` 表示前一个命令的输出作为下一个命令的输入 【流】

******
`清理仓库`
- 因为删除的文件是会留在仓库，以便以后恢复，这样的话仓库就会越来越大了
- `git gc` 清理，不知道有没有用
- 强制删除，并且从git索引中也去掉，相当于彻底删除 
    - [参考博客1 彻底删除](http://www.itwendao.com/article/detail/413282.html) 
    - [参考博客2 彻底删除](http://blog.csdn.net/meteor1113/article/details/4407209)
    - [参考博客3 删除大文件](http://www.gzhphb.com/article/78/784131.html)
    - [参考博客4 减小磁盘占用](http://zhongmingmao.me/2017/04/19/git-reduce/)
    - `git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch 文件的路径' --prune-empty --tag-name-filter cat -- --all`
    - `git push origin --force --all`
    - `git push origin --force --tags`
    - 使用`git rebase`来更新分支，而不是 `git merge` 不然文件又回来了

- 然而，因为这个笔记仓库，改动太多，之前加入的图片文件，删除之前也改动了名字，现在根本找不到文件了， 删除不了了，如果要减小仓库大小只能重建了
- 猜测他的文件都在 `.git/objects/pack/` 里留有备份

- 使用`git rm` 命令进行删除文件应该是会彻底删除文件的
****************
#### 【git config】
- `git config user.email ***`  和   `git config user.name ***` 这两个是必须的，
    - 如果想统一配置不想每个仓库单独配置就 `git config --global user.name` email同理
- `git config http.postBuffer 524288000` 设置缓存区大小为 500m
- `git config core.fileMode false` 忽略文件的mode变化，一般发生在文件的复制粘贴之后（跨系统?）

#### 【git commit】
- [官方文档](https://git-scm.com/docs/git-commit)
- `git commit -am "init" `: a git库已有文件的修改进行添加, m 注释
    - `git add * ` 如果有新建立文件就要add 再之后commit就不要a参数了 `git commit -m ""`
    - 如果只是修改文件没有新建 `git commit -am ""`
- `git commit ` 会自动进入VI编辑器
    - 第一行：用一行文字简述提交的更改内容
    - 第二行：空行
    - 第三行：记述更改的原因和详细内容
    - 使用下面方法关闭退出

#### 【git remote】
- [官方文档](https://git-scm.com/docs/git-remote)
- `git remote add name URL地址` 添加远程关联仓库 不唯一，可以关联多个一般默认有个origin
        - `git remote`  可以看到添加的远程URL的名字
- `git remote set-url name URL地址` 修改关联仓库 预定默认的叫origin
- `git remote rm URL` 删除和远程文档库的关系
- `git remote rename origin myth` 更改远程文档库的名称
- `git ls-remote` 输出所有关联的remote库 还会输出库的分支
- `git remote -v` 输出push和pull的URL
- `git push 远程URL的名称 --delete 分支名称` 删除远程库某分支
- `git remote show origin` 查看远程分支的状态

*******
- [删除，重命名远程分支](http://zengrong.net/post/1746.htm)

#### 【fork 相关操作】
- fork之后，想要更新原作者的分支：`git remote add 名称 原作者URL`
- 拉取更新 ：`git fetch 名称`

#### 【git push】
- 出现 `RPC failed; result=22, HTTP code = 411` 的错误
    - 就是因为一次提交的文件太大，需要改大缓冲区 例如改成500m  `git config http.postBuffer 524288000`
- 提交本地所有分支 `git push --all` pull 同理
- 第一次与远程建立连接 `git push -u origin master ` 、`git push --set-uptream master` 、`git push -all` 
    - 这几个都是可以的,最后那个简单, 还能将别的分支一起推上去

#### 【git rebase】

- 效果和merge差不多，但是分支图更清晰
- 与master合并：`git merge master` 换成 `git rebase master`
- 当遇到冲突：
    - `git rebase --abort` 放弃rebase
    - `git rebase --continue` 修改好冲突后继续

#### 【git log】

- `git log --author='A' `输出所有A开头的作者日志
- `git log 文件名 文件名` 输出更改指定文件的所有commit 要文件在当前路径才可
- `git log --after='2016-03-23 9:20' --before='2017-05-10 12:00' ` 输出指定日期的日志
- `git shortlog` 按字母顺序输出每个人的日志 加上`--numbered` 参数就是按提交数排序

#### 【git tag】
- [官方文档](https://git-scm.com/docs/git-tag/2.10.2)
- `git tag` 查看所有标签
- 新建一个标签并打上注释 `git tag -a v1.0.0 -m "初始版本"` 
- `git checkout tagname` 和切换分支一样的切换标签，但是标签只是一个镜像，不能修改
- 如果要在某tag上新建一个分支， `git checkout -b branchname tagname`
- `git show tagname` 展示标签注释信息
- 删除本地标签 `git tag -d tagname` 
- 由指定的commit打标签  `git tag -a v1.2.4 commit-id` 
- 提交指定的tag `git push origin tagname` （默认不会自动提交标签）
- 提交所有的tag `git push --tags` 

- 删除远程的tag `git push origin --delete tag <tagname>` 

******
### 分支操作
#### 【git clone】
- `git clone branchname URL` 克隆指定分支
- `git clone URL 目录` 克隆下来后更名为指定目录

#### 【git checkout】
- [官方文档](https://git-scm.com/docs/git-checkout)
- `git checkout 文件名 文件名` git会在索引中找文件，有就取出，没有就从最新的commit回找，取出第一个找到的版本，
    - 每个文件都是这样，也就是说如果有被删除的文件，是可以通过此来找回的
    - `git checkout . `取出文档库中所有文件的最新版本
- `git checkout commit 节点标识符或者标签 文件名 文件名。。。` 
    - 取出指定节点状态的某文件，而且执行完命令后，取出的那个状态会成为head状态，
    - 需要执行  `git reset HEAD` 来清除这种状态
- `git pull --all` 下拉远程所有的分支到本地

#### 【git fetch】
- `git fetch origin dev-test` 下拉远程的分支新建到本地（本地没有）

#### 开发流程的常用分支操作
- 一般的开发过程中会使用到三种临时分支（用完就删）和两个主分支 master develop
    - 功能分支 `feature-*` 
    - 预发布分支 `release`
    - 修复bug `fixbug`

*******
- `git checkout -b feature-x develop` 从develop的分支生成一个功能分支，并切换过去
- 完成功能后：`git checkout develop `
    - 合并： `git merge --no-ff feature-x`
    - 删除： `git branch -d feature-x`

*****
- `git checkout -b release-1.2 develop` 新建一个预发布分支
    - `git checkout master` 确认没有问题后 `git merge --no-ff release-1.2` 合并到master分支
    - `git tag -a 1.2` 打标签，这就是github上软件的版本控制
    - 没有问题后 合并到develop分支`git checkout develop` `git merge --no-ff release-1.2`
    - 删除预发布分支 `git branch -d release-1.2`

*****
- `git checkout -b fixbug-0.1 master` 新建修复bug的分支 
- `git checkout master ``git merge --no-ff fixbug-0.1 ``git tag -a 0.1.1` 修补结束后合并到master分支
- `git checkout develop` `　git merge --no-ff fixbug-0.1` 再合并到develop分支
- 删除分支 `git branch -d fixbug-0.1` 
- 删除远程没有本地有的分支`git fetch -p`

#### 【git merge】
- [官方文档](https://git-scm.com/docs/git-merge)
`配置mergetool工具：`
- `git config --global merge.tool kdiff3`
- `git config --global mergetool.kdiff3.cmd "'D:/kdiff3.exe' \"\$BASE\" \"\$LOCAL\" \"\$REMOTE\" -o \"\$MERGED\""`
- `git config --global mergetool.prompt false`
- `git config --global mergetool.kdiff3.trustExitCode true`
- `git config --global mergetool.keepBackup false`

*********

- `git merge develop `默认会直接将master分支指向Develop分支。(一条拐弯的线)
- `git merge--no-ff develop` 将当前master分支与分支Develop合并，在Master分支上生成一个新节点(有一个环的线)
    - 也就是说master将develop分支拉取下来然后合并 develop向master合并
- 如果遇到冲突：
    - `git mergetool` 使用工具进行分析冲突文件方便修改

#### 【git grep 】    
- 搜索文字 `git grep docker`
    - `-n`搜索并显示行号 
    - `--name-only` 只显示文件名，不显示内容
    - `-c` 查看每个文件里有多少行匹配内容(line matches):
    - 查找git仓库里某个特定版本里的内容, 在命令行末尾加上标签名(tag reference):  `git grep xmmap v1.5.0`
    - `git grep --all-match -e '#define' -e SORT_DIRENT` 匹配两个字符串
    

*************

## CVS工具的区别以及优缺点

### Git

### SVN


## 加强版 repos的使用


