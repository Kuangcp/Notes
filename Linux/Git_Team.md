## Git团队开发

### 介绍关于git在多人协作的使用
> [原博客](http://nvie.com/posts/a-successful-git-branching-model/)

`主要的分支`
- master 稳定发行分支
- dev 开发分支
`开发上的分支`
- fixbug
- feature
- 

### 本地和远程
- 指定本地开发分支和远程的绑定关系 `git branch --set-upstream dev origin/dev` master同理

- [分支图复杂的一个项目](https://github.com/Netflix/eureka/network) `只是演示分支的复杂度`


### 小规模团队使用码云的总结
- 在码云上创建私有仓库，然后管理成员，将开发者一一邀请进来，然后这时候就有了一个问题：
    - 所有的开发者都具有master的所有权限，所以这时候就会很容易出现冲突
    - 管理员， 新建若干分支：`git branch 分支` `git push --all` 
    - 对应的开发者克隆项目，然后 `git fetch origin 对应的分支` `git checkout 分支` 就可以开始工作了
    - 然后各个开发者 ｀git push｀ 就行了
    - 管理员需要 `git fetch origin 分支`针对每个分支进行拉取，然后选择合并，集中处理冲突

