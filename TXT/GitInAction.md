# Tips:
* 1 、虽然在物理上本地仓库中所有文件是放在一起的，但是分支之间是互不能访问以及操作的
* 2 、在本地的每次commit都是有index的，上传到github可以不用那么频繁，反正都是有记录的
* 3、 在github上修改了项目后，或者以后是和别人一起开发，就要先git pull origin （master）将别人的分支和自己的分支都拉下来确保是最新，再进行git push -u origin master 才能正确提交代码，如果不pull，提交是注定失败的，还会扰乱分支图
* 4、在github上修改文件，容易引起编码的变化，这时候没有pull就修改文件再commit也是会在push的时候很麻烦，最好在本地修改文件
	最好是，在github上修改了就在本地pull之后再修改文件，万一出错了回退也简单
* 5、出现了冲突，从而无法自动merge：
```
		git pull 对方的分支
		git checkout 自己的分支
		git merge --no-ff 对方的分支
		git push （自己的源+分支）origin master
```

-  Windows下记住密码 ： 
    * 新建环境变量 HOME 值：`%USERPROFILE%`
    * 在C盘User下你的当前用户目录下新建` _netrc `文本文件： 
        * `machine https://github.com/Kuangcp/`
        * `login ***`
        * `password ***` 
    * 成功配置，测试便知
- Linux下记住密码：
	* `touch .git-credentials`
	* `vim .git-credentials`
	* 输入： ` http://{username}:{password}@github.com` 或者是https开头
	* `git config --global credential.helper store`
	* ~/.gitconfig 文件中多了以下内容即可
		* [credential]
		* helper = store

***************************************************************	

## 【目前使用git的方法】 

- 1.在GitHub上新建一个项目，不勾选初始化，复制下URL
- 2.在eclipse新建项目，git到本地某文件夹下
- 3 然后在eclipse里添加git remote
- 4.commit -》push 完成
- 5.打开Git Bash 使用命令行再查看一下，虽然有时候问题比较奇怪，但是一般不会有啥问题
- *执行了1、2步骤后：直接*

```
   	git remote add origin https://github.com/Kuangcp/StudentManager.git
   	git push -u origin master
   	=====或者：=====
   	echo "# StudentManager" >> README.md
   	git init
   	git add README.md
   	git commit -m "first commit"
   	git remote add origin https://github.com/Kuangcp/StudentManager.git
   	git push -u origin master
	
```
## 实验楼使用Github
- `git clone URL` 复制下来，默认是master
- `git branch 新分支名` 新建一个分支，切换过去，使用的就是这个新分支放代码
- `git push origin 新分支名` add commit 之后就push
- `git fetch origin 已有分支` 下拉别的分支代码
*************************************************
**************************************************

## 【git初始化】 
```
	$git config --global user.name " "
	$git config --global user.email " "
	$git config --global color.ui  auto 
```
## 【VI编辑器的使用】
- git 在pull或者合并分支的时候有时会遇到打开 VI编辑器 的状态  可以不管(直接下面3,4步)
`如果要输入解释的话就需要:`
```
	1.按键盘字母 i 进入insert模式
	2.修改最上面那行黄色合并信息,可以不修改
	3.按键盘左上角"Esc"
	4.输入`:wq`,按回车键即可 
	Ctrl + Z +Z 也能退出
```
## 【GitHub 】 
```
	【Markdown语法】: 
		@用户名， @组织名 ；#编号 会连接到该仓库对应的Issue编号 。
		通过 用户名/仓库名 #编号 来指定仓库的指定Issue
	【将Bash和GitHub绑定起来】：
		1.在GItHub上设置SSH key， 有一个即可
		2.$ssh-keygen -t rsa -C "Kuangchengping@outlook.com" 回车 
		3.设置密码 ad14293366
		4.测试SSH $ssh -T git@github.com  输入yes 输入 密码  ****
```	
### 【 .gitingnore 文件】 :
- `test.txt`  忽略该文件
- `*.html`  忽略所有HTML文件
- `*[o/a]`  忽略所有o和a后缀的文件
- `!foo.html`  不忽略该文件
- 示例文件
```
      # maven #
      target/
      
      # IDEA #
      .idea/
      *.iml
      out/
      # eclipse #
      bin/
      .settings/
      .metadata/
      .classpath
      .project
      Servers/
```

### 【建立本地仓库并关联到远程仓库：】
- 1.先在GitHub上创建一个仓库，不勾选README（不然添加远程仓库还得pull一下README文件才能push）
- 如果本地没有则 `mkdir 库名 `创建一个文件夹，最好和远程的库同名
- 2.在某本地项目根目录下运行 `Git Bash`
    - 2.1 `git init` 初始化（建立 `.git` 目录）
    - 2.2 `touch README.md`
    - 2.3 `git remote add origin master URL` 连上远程仓库
    - 2.4 `git push -u origin master` 输入用户名，密码（若因为没有上游节点就按提示输入命令建立初始节点即可）

### 【使用git daemon搭建本地简易Git Server】
- 先创建一个目录结构
- Repository
    - Project1
    - Project2
    - Project3
- 每个Project下都有`.git` 文件夹
- Repository目录下执行：`git daemon --export-all --base-path='/home/mythos/Code/test/' --port=8096`
    - `--export-all` 开放当前目录下所有项目
    - `--enable=receive-pack` 为了安全，默认是仓库不能被修改，添加这个参数就可以push了
    - `--base-path=''` 指定开放的基本目录（指定开放别的路径）
    - `--port=8096` 指定开放的端口
    - `--verbose` 启动看到的日志信息更多
    - ` &` 末尾加上表示后台运行，默认是阻塞了当前git bash命令行
- 运行起来后 使用`Ctrl+C`  退出这个程序，如果使用的是后台方式，则：
    - `ps`： 查看到pid 
    - `sudo kill -9 pid`： 杀掉指定pid
- 在别的目录下` git clone git://localhost:8096/Project1` 即可克隆

### 【HTTP访问Git Server】
- 安装Apache： Web服务器
- 配置Apache服务器的开放的目录以及Git的路径 
```
<Location /git>
    AuthType Basic 
    AuthName "GIT Repository" 
    AuthUserFile "/home/mythos/GitRemoteRepo/htpassed"
    Require valid-user
</Location>
```
- 切换到Apache的bin目录下：`htpasswd -cmb /home/mythos/GitRemoteRepo/htpsswd 账号名 密码`
- 到仓库目录下 `git init --bare 程序项目名称`
- `git clone http://localhost/git/程序项目名称` 输入用户名密码即可
#### 【配置 https】
- 切换到Apache主目录下 `bin\openssl genrsa -des3 -out server.key 2048 -config conf\openssl.cnf` 输入密码
- `bin\openssl req -new -key server.key -out server.csr -config conf\openssl.cnf` 输入之前密码
- `bin\openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt` 输入之前密码
- 把server.key 更名为server.key.old :`bin\openssl rsa -in server.key.old -out server.key`
- 将 server.key server.crt 移动到conf
- 修改 httpd.conf 去掉如下三行的注释 #
```
    LoadModule socache_shmcb_module..
    LoadModule ssl_module..
    Include conf/extra...
```
- 因为是自己建立的SSL证书 所以要去掉SSL验证 `git -c http.sslVerify=false clone URL `
- 或者直接改配置文件，省的每次输这么多 `git config http.sslVerify false`

#### 【使用SSH登录GitServer】

## 【基础命令】 

- `git touch file1 file2 ` 新建三个文件
- `echo "  ">>file1 ` 修改文件file1
- `git rm 文件名 ` ： 删除文件至缓存区
- `git commit -am " " `从缓存提交（切记要先 commit 才能 push）
- `git diff`  ： 查看当前工作树和暂存区的差别
- `git diff --cached `：查看缓存中文件修改的痕迹和对比 输入q 退出
- `git log --graph `：查看（图形化）提交日志 输入q退出
- `git banrch `分支名 ：创建新的分支
- `git branch -a`查看当前分支信息
- `git checkout -b`：创建一个分支，并立即切换
- `git checkout -b feature-D origin/feature-D` 新建一个分支来接收同步后面那个远程仓库的分支
- `git pull `：获取最新的远程仓库分支
- `git pull origin feature-D `：只把本地的feature-D分支更新到最新
- `git reset --hard 哈希值`：数据库的回滚操作似的
- `git reflog `  查看仓库的操作日志
- `git mv -k oldName  newName` :更改文件名字

```
	usage: git [--version] [--help] [-C <path>] [-c name=value]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]
```

****************************************
****************************************

## 【git reset常用方式】
### （1）：回滚add操作
```
	edit  (1)
		git add a.txt b.txt
		看邮件(2)
		git reset(3) 
		git pull URL
	1.1 编辑了两个文件并且添加到了index
	1.2 接收邮件，发现某人要你pull，有一些改变需要你merge 下来
	1.3 然而你已经把index给改变了，因为当前的index 和 HEAD commit不匹配了，但是你知道，即将pull的东西不会影响
		到a.txt 和 b.txt，因此你可以revert这两个文件的改变，revert后，那些改变依然在working directory中，因此需要执行git reset
	1.4 然后，执行了pull后 自动merge，两个文件依然在working directory中
```
#### （2）：回滚最近一次commit
```
	git commit ...
		git reset --soft HEAD^(1)
		edit (2)
		git commit -a -c ORIG_HEAD(3)
	2.1 当提交后，你发现提交的代码不完善，需要重新编辑一下，执行 1 语句让working directory和reset之前一样，不做改变
	2.2 对working tree下的文件做修改
	2.3 然后使用reset之前那次commit的注释等相关信息都重新提交，注意老的HEAD会被备份到文件.git/ORIG_HEAD中，命令中就是引用了这个老的相关信息
		-a 表示自动将所有的修改的和删除的文件都放进 stage area（理解为代码区，未被git跟踪的文件不受影响）
		-c 表示 拿已经提交的commit对象中的信息来做这次的提交
	这条命令就是，将所有更改的文件加入到stage area中，并使用上次的提交信息来提交
```
#### （3）：回滚最近几次的commit，并添加到一个新建的分支上去
```
		git branch myth/test (1)
		git reset --hard HEAD^3 (2)
		git checkout myth/test (3)
	3.1 你已经提交了好几个commit，但是觉得不够成熟和完善，不足以添加到master分支上，所以在当前HEAD创建一个新分支
	3.2 然后回滚掉最近三次提交（删除）
	3.3 切换到新分支上就能对代码进行润色了，等待之后的merge
```
#### （4）：永久删除最近几次
- `commit git reset --hard HEAD~3`
#### （5）：回滚merge和pull操作
```
		git pull URL (1)
		git reset --hard (2)
		git pull .topic/branch (3)
		git reset --hard ORIG_HEAD (4)
	5.1 从origin上拉下来一些更新，但是产生了许多冲突，暂时又没时间去解决这些冲突，所以想撤销pull操作，等待以后来pull
	5.2 由于pull操作产生了冲突，因此所有pull下来的改变尚未提交，仍然在stage area中，这种情况下 
		git reset --hard 与 git reset --hard HEAD 效果一样
			都是清除那些使index和working directory乱套的东西
	5.3 将topic/branch 合并到当前的branch，这次没有冲突，并且合并后的更改自动提交
	5.4 但是此时又觉得将topic/branch合并过来又太早了，决定回滚merge操作，执行4语句  之前有说过，git reset操作会备份一个ORIG_HEAD，
			pull和merge操作同样会，为了回滚操作
```
#### （6）：在被污染的working tree中回滚merge或者pull
```
		git pull (1)
		git reset --merge ORIG_HEAD (2)
	6.1 即使在本地已经更改了tree，导致了index的变化，也可以放心的pull，前提是你知道将要pull的内容不会覆盖你的working tree中的内容
	6.2 git pull 之后，你发现这次pull的有问题，想要撤销操作，如果使用git reset --hard ORIG_HEAD也可以，但是这会删除add的代码
			使用 git reset --merge ORIG_HEAD 就可以避免回滚操作时删除add的代码
```	
#### （7）：被中断的工作流程
```
在实际开发中经常出现这样的情形：你正在开发一个大的feature，此时来了一个紧急的BUG需要修复，但是目前在working tree 中的内容还不足以commit
		，但是又必须切换到另外的branch去 fix bug
		git checkout feature;
		码代码
		git commit -a -m "暂时中断OO" (1)
		git checkout master 
		修复bug
		git commit ;
		git checkout feature
		git reset --soft HEAD^ #go back to OO's state (2)
		git reset (3)
	7.1 属于临时提交。随便加点注释
	7.2 这次reset删除了OO的commit，并且把working tree设置成提交OO之前的状态
	7.3 此时，在index中仍然留有OO提交时所做的uncommit changes，git reset 将会清理index成为尚未提交时的状态，便于之后的工作
```
#### （8）：Reset 一个单独的文件
```
git reset -- a.txt (1)	
git commit -am "Commit files inindex"  (2)
		git add a.txt  (3)
	8.1 把文件单独从index中去除
	8.2 将index中的文件提交
	8.3 再次添加回文件
```
#### （9）：保留working tree 并且丢弃一些commit
```
	git tag start
		git checkout -b branch 1
		编写
		git commit .... (1)
		编写
		git checkout -b branch2 (2)
		git reset --keep start (3)
```
- 9.1 这次是把branch1中的改变提交了
- 9.2 此时发现，之前的提交不属于这个branch，此时你新建了branch2，并切换到了该branch上
- 9.3 此时你可以使用reset --keep 把在start之后的commit清除掉，但是保持了working tree的不变


