# Git系统化学习基础
## Git常用命令
#### 【git commit】
- `git commit -am "init" `: a git库已有文件的修改进行添加, m 注释
    - `git add * ` 如果有新建立文件就要add 后面就不要a参数了 `git commit -m ""`
    - 如果只是修改文件没有新建 `git commit -am ""`
- `git commit ` 会自动进入VI编辑器
    - 第一行：用一行文字简述提交的更改内容
    - 第二行：空行
    - 第三行：记述更改的原因和详细内容
    - 使用下面方法关闭退出

#### 【git remote】

- `git remote add origin URL地址` 添加远程关联仓库 不唯一，可以关联多个
- `git remote set-url origin URL地址` 修改关联仓库 可以不叫origin
- `git remote rm URL` 删除和远程文档库的关系
- `git remote rename origin myth` 更改远程文档库的名称
- `git ls-remote` 输出所有关联的remote库 还会输出库的分支
- `git remote -v` 输出push和pull的URL
- `git push 远程URL的名称 --delete 分支名称` 删除远程库某分支

#### 【fork 相关操作】
- fork之后，想要更新原作者的分支：`git remote add 名称 原作者URL`
- 拉取更新 ：`git fetch 名称`

#### 【git push】
- 出现RPC failed; result=22, HTTP code = 411 的错误
    - 就是因为一次提交的文件太大，需要改大缓冲区 例如改成500m
    - git config http.postBuffer 524288000

#### 【git merge】
`配置mergetool工具：`
- `git config --global merge.tool kdiff3`
- `git config --global mergetool.kdiff3.cmd "'D:/kdiff3.exe' \"\$BASE\" \"\$LOCAL\" \"\$REMOTE\" -o \"\$MERGED\""`
- `git config --global mergetool.prompt false`
- `git config --global mergetool.kdiff3.trustExitCode true`
- `git config --global mergetool.keepBackup false`

****************************

- 简单的与master合并 `git merge master `
- `git merge--no-ff feature-D` 将当前分支与分支feature-D 合并
- 如果遇到冲突：
    - `git mergetool` 使用工具进行分析冲突文件方便修改
    
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
- `git ls-files` 列出文件列表
- `git ls-files | xargs wc -l` 计算文件中程序代码行数 通过工具：`xargs` `wc`
- `git ls-files | xargs cat | wc -l` 计算行数总和

#### 【git tag】

******************************

## CVS工具的区别以及优缺点
### Git
### SVN
