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

********

`分支的处理的一次实验 2017-10-21 23:57:34`
- `git fetch --all` 获取远程所有分支（新分支）
- `git pull --all` 获取所有分支最新提交 这个就会自动合并？？？越来越不理解了

- dev-test 分支进行修改，然后提交一次，然后push 
- master： `git merge --no-ff dev-test` 进行合并，就会在分支图上得到一个环
    - master 分支本地会多出2个提交

- dev-test 进行修改，然后1次提交，push
- master : `git pull origin dev-test ` 执行merge命令就会提示没有可以合并的修改。
    - 这是为什么？？？？

##### 最终方案？
- dev-test 进行修改提交1次
- master 进行修改，提交一次
    - `git merge --no-ff dev-test` 然后 就有了两个提交，然后push （得到了dev-test的改动）
- dev-test 分支 
    - `git pull origin master` 获取到master改动的代码 不需要再次merge
- `只要master不pull 分支代码， 那么分支图就不会乱`
    - 或者说所有的分支不要在merge之前pull代码就不会乱，一定要先merge 再pull， 谁发起的merge，谁就是主分支将对方合并进来

##### 最终方案
- 开发人员提交完后，主分支管理人员，切换到开发人员的分支上然后 `git pull 开发人员分支`，然后切换回主分支上 `git merge --no-ff 开发人员分支`（填写注释）
    - 然后开发人员分支上执行 `git merge master` 然后推送 `git push`
    - 然后通知开发人员下拉 其开发分支即可