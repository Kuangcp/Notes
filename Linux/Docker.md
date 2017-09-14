# Docker
## 目录 
- [Docker](#docker)
    - [简介](#简介)
    - [个人理解](#个人理解)
    - [安装与卸载](#安装与卸载)
        - [通过deb文件安装](#通过deb文件安装)
        - [卸载](#卸载)
    - [常规使用](#常规使用)
        - [镜像命令](#镜像命令)
        - [容器命令](#容器命令)
        - [Dockerfile](#Dockerfile)
            - [使用入门案例](#使用入门案例)
            - [RUN命令](#RUN)
        - [.dockerignore文件的使用](#dockerignore文件的使用)
    - [安装redis](#安装redis)
    - [Docker中构建一个Ubuntu](Docker中构建一个Ubuntu)

*****************************************
## 简介
- `Docker 是一个开源的应用容器引擎` 理解为加强版虚拟机
- 让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。
********************************************

## 个人理解
- docker中的容器是动态的，随时创建和销毁，只有镜像是持久化的
- 而且容器是一个虚拟出来的功能完备的Linux操作系统可以进行登录运行命令
- `docker images`来得到所有的本地镜像名，使用`docker run --name {name} -d {image-name} `以某容器来启动某个镜像
- 然后`docker ps`查看运行状况

***************************************
## 安装与卸载
> [daocloud安装帮助](http://get.daocloud.io/#install-docker)

### 【Linux】
#### 通过命令安装
`snap`
- 安装snap `sudo apt install snapd`
- 查看适用于当前系统的包：`snap install find`
- 安装： `snap install docker`

`apt`
- `sudo apt install docker.io`

#### 通过deb文件安装
- [点击选择文件](https://download.docker.com/linux/debian/dists/)
- 进去后选择debain的版本，deepin15.4 的版本是stretch 然后pool/stable/amd64/选版本即可 
- 例如：[Deepin 15.4直接点这里](https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/)
- `这两种方式装的是同一个版本号` 
- 双击或者`sudo dpkg -i deb文件`
- 测试安装成功 `sudo docker run hello-world`

#### 不加sudo执行docker命令
- 如果没有docker组，添加组 `sudo groupadd docker `
- 将当前用户加入用户组 `sudo gpasswd -a $USER docker`
    - 或者?? ：`sudo usermod -aG docker $USER` 会有问题
- 然后重新注销登录

#### 卸载
- `sudo apt-get purge docker-ce`
- `sudo rm -rf /var/lib/docker`

### 【Windows】
- [参考博客](http://www.cnblogs.com/linjj/p/5606687.html)
- [官方toolbox 下载](https://www.docker.com/products/docker-toolbox)
- 然后双击安装，勾选上virtualbox 记住cpu要开虚拟化
- 安装完成后就会有三个图标在桌面上，然后进入Docker Quickstart Terminal后 `docker run hello-world` 有正常输出即可

**************************************

## 常规使用
- 如果出现命令执行失败，可以登录docker的控制台直接执行 `boot2docker ssh`
- 可以将镜像看成真正运行的程序，容器就是具体的一些配置，所以镜像是可以重复利用，容器出问题删掉就是了

#### 基础命令
- 登录hub.docker ：`docker login ` 或者 `docker login -u username -p password`

#### 镜像命令
- 搜索 ： `docker search 镜像名`
- 安装 ： `docker pull 镜像名`
- 查看 ： `docker images`
- 删除 ： `docker rmi 镜像名`

#### 容器命令
`docker run `
- 根据镜像运行一个指定名称的容器 `docker run -d --name conrainer-name image-name touch a.md` ，如果镜像本地没有会自动pull
    - --name 配置容器名字
    - -d detach后台启动程序
    - -i 交互模式运行容器(标准输入和标准输出) `docker run  -i -t ubuntu /bin/bash`
    - -t 容器启动后进入其命令行
    - -v 将本地文件夹建立映射到容器内 `-v 本机:容器`
    - -p 端口映射 左本机右容器 `-p 80:8080` 如果相同就直接 `-p 22`
    - -f 文件？
    - --env name="tanky" 设置环境变量
    - --memory 限制最大内存
    - --cpu-shares 设置CPU的相对权重，只在link之间容器的权重比例
    - --cpuset-cpus 限制只能运行在某标号的CPU上
    - --user -u 限制用户
    - --cap-drop 去除能力
    - --link 链接其他容器
    - -rm 容器退出就自动删除

********************
`docker create`
> [官方文档](https://docs.docker.com/engine/reference/commandline/create)

- docker create 是创建一个容器，不会运行，docker run是运行命令在一个新容器里

- 查看当前运行的容器：`docker ps `
    - 查看所有容器 ：`docker ps -a`

- 停止容器：`docker stop 容器name或id`
- 启动容器：`docker start 容器name或id`
    - -i 交互模式，也可以进入终端

- 删除容器：`docker rm 容器id`
    - 删除所有容器：`docker rm ${docker -a -q}`
- 容器日志：`docker logs 容器name或id`
- 登录容器：`docker exec -it 容器name或id bash `

`docker commit `
- `docker commit 容器id 镜像name` 将容器为id的当前容器 保存为name镜像
- 

### 跨容器依赖

TODO

*******************************************
### Dockerfile
#### 使用入门案例
- `mkdir test && cd test && touch Dockerfile ` 输入如下文本
```
    #随意写的
    FROM redis
    MAINTAINER Mythos
    ENV DIRPATH /path
    WORKDIR $DIRPATH/$DIRNAME
    RUN pwd
```
- `docker build .` 如果成功则会得到一个没有名字的镜像
    - `docker build -t repository/tag .` 给镜像指定名字
    - 如果文件名是`Dockerfile` 使用 `.` 否则就是文件名
- 创建镜像成功后 `docker run --name ContainerName -d repository/tag` 新建容器来运行镜像

***************************
#### Dockerfile命令理解
- Dockerfile是一个`镜像`的表示，可以通过Dockerfile来描述构建镜像的步骤，且可以自动构建一个容器
- 所有的 Dockerfile 命令格式都是: `INSTRUCTION arguments` 
- 最好在运行这个配置文件的时候新建一个空目录目录下放dockerfile，不要使用根目录，不然全部的东西都传到守护进程里去了
    - 因为生成过程的第一件事是将整个上下文 (递归) 发送到守护进程。
- 同样的可以使用`.dockerignore`文件来忽略不要上传的文件
- `docker build` 
    - `-f` 指向任意位置的文件进行配置 `docker build -f /path/to/a/Dockerfile .`
    - `-t`如果构建成功 可以指定保存新镜像的repository和tag (多个的话就多个 -t就行了，例如 `docker build -t shykes/myapp:1.0.2 -t shykes/myapp:latest .`)

##### FROM 
> 基于某镜像构建,这是整个文件的第一条指令，一定是基于某镜像构建的，如果是空镜像就使用特殊的 FROM scratch

- `FROM image`
- `FROM image:tag`

##### MAINTAINER
- 留开发者名字 例如 `MAINTAINER kuangcp myth.kuang@gmail.com`

##### RUN
- `RUN command` command是shell `/bin/sh -c` 命令 例如 `RUN apt update`  
- `RUN ["executable", "param1", "param2" ... ]`

##### ENTRYPOINT
- `容器入口点` 命令设置在容器启动时执行命令 一般用来做初始化容器，或者运行持久软件
- `ENTRYPOINT echo "Welcome!"` 那么每次启动容器都有这个输出
- `ENTRYPOINT cmd param1 param2 ...`
- `ENTRYPOINT ["cmd", "param1", "param2"...]`

##### USER
- 限定了当前镜像的默认用户，如果在这个镜像上的容器需要安装软件就会需要提权，就要至少创建额外的两个层，层限制是42,
    - 更好的方法是在基础镜像中创建用户和用户组，然后在完成构建时再设置默认的用户
- 指定 mysql 的运行用户 `ENTRYPOINT ["mysql", "-u", "daemon"]`
- 更好的方式是：
```
    ENTRYPOINT ["memcached"]
    USER daemon
```

##### EXPOSE
- 创建一个层，对外开放端口 例如 EXPOSE 22


##### ENV
- 设置环境变量 `ENV <key> <value>`
- 设置了后，后续的RUN命令都设置了后，后续的RUN命令都可以使用可以使用

##### LABEL
- 用来定义键值对，只能出现一次，相当于是一个内置的配置文件

##### COPY
- copy ["./log", "${APPROOT}"]
- 类似于entrypoint，同样的copy也支持Shell和exec格式，但是如果任何一个参数包含了空格，就必须要使用exec。

##### ADD
- 相当于copy命令
- `ADD <src> <dest>` 
    - src 是Dockerfile的相对目录，可以是本地也可以是远程URL
    - dest 容器中的绝对路径

##### VOLUME
- `VOLUME ["<mountpoint>"]` `VOLUME ["/data"]` 创建挂载点 用于共享目录

##### WORKDIR
- `WORKDIR /path/to/workdir`
- 配置RUN, CMD, ENTRYPOINT 命令设置当前工作路径，如果目录不存在就新建
- 可以设置多次，如果是相对路径，则相对前一个 WORKDIR 命令
    - 例如：`WORKDIR /a WORKDIR b WORKDIR c RUN pwd` 其实是在 /a/b/c 下执行 pwd
    
##### CMD
`三种格式`
- CMD ["executable","param1","param2"] (like an exec, preferred form)
- CMD ["param1","param2"] (as default parameters to ENTRYPOINT)
- CMD command param1 param2 (as a shell)
- `一个Dockerfile里只能有一个CMD，如果有多个，只有最后一个生效。`

##### ONBUILD
- 注入下游镜像。如果生成的镜像是作为另一个镜像的基础镜像，则该指令定义了需要被执行的那些指令

******************************************
#### 案例
- [docker-wordpress-nginx](https://github.com/eugeneware/docker-wordpress-nginx)
- [rails-meets-docker](https://github.com/gemnasium/rails-meets-docker)

- [官方文档 dockerfile](https://www.docker.io/learn/dockerfile/)
- [官方文档 builder](http://docs.docker.io/reference/builder/)

`打包软件 最新版git`
```
FROM ubuntu
MAINTAINER "youtemail"
RUN apt-get update
RUN apt-get install -ysoftware-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update && apt-get install -y git
ENTRYPOINT ["git"]
```
- 构建镜像`docker build -t git:new .`
- 将镜像容器化执行命令后自动删除容器`docker run --rm git:new`
- 注意其运行环境是容器内，不是宿主机，入口点的命令运行完了就退出了，不能当成宿主机上的git使用，只能说是听个响
    - 所以不可能说在容器中安装软件然后在宿主机上交互运行

### dockerignore文件的使用
- .dockerignore文件是依据 Go的PathMatch规范来的，使用和.gitignore类似

### 使用启动脚本和多进程容器

## Docker-Compose
> 声明式环境，管理多容器依赖

## Docker-Machine
> 创建一个docker集群环境 [官方文档安装](https://docs.docker.com/machine/install-machine)

Error with pre-create check: "VBoxManage not found. Make sure VirtualBox is installed and VBoxManage is in the path
Error with pre-create check: "This computer doesn't have VT-X/AMD-v enabled. Enabling it in the BIOS is mandatory"

## Docker-Swarm

***************************************************
## 轻量镜像
frolvlad/alpine-oraclejdk8   slim
postgres                     alpine
alpine

## 安装redis
- 获取镜像：`docker pull redis `
- 运行默认配置的容器：`docker run --name test-redis -d redis`
- 使用本地配置文件启动redis容器
- `sudo docker run -v /myredis/conf/redis.conf:/usr/local/etc/redis/redis.conf --name myredis redis redis-server /usr/local/etc/redis/redis.conf`
- port-redis容器的端口映射：`sudo docker run -d -p 6379:6379 --name port-redis redis` 左本机右容器


## 安装 Jenkins
- `sudo docker pull jenkins` 下拉镜像
- `sudo docker run --name myjenkins -p 8080:8080 -p 50000:50000 -v /home/kcp/docker/jenkins:/var/jenkins_home jenkins` 构建容器
- 确保目录是开放了权限的 直接 `chmod 777 jenkins` 了事
- 然后就是正常的容器的启动关闭了

## 安装 PostgreSQL
- [Docker 安装 PostgreSQL](https://github.com/Kuangcp/Notes/blob/master/Database/Postgresql.md)

## 安装 Oracle

************************

- docker pull wnameless/oracle-xe-11g
- docker pull mongo
- docker pull cloudesire/activemq
- docker pull rabbitmq
- docker pull rabbitmq:3-management
- docker pull jenkins


## Docker中构建一个可外登录的完整单一Ubuntu
- 最为简单的是：`docker run  -i -t --name ubuntu17 -p 34433:22 ubuntu /bin/bash`
    - 为这些软件预留端口 `ssh tomcat mysql postgresql mysql oracle nginx reids`
    - 直接跑一个Ubuntu出来,预留出要用的端口，容器运行不会退出
    - 进终端之后就 `apt update` 才能安装软件，现在才知道这个命令的重要性
- 特点：
    - 这个Ubuntu root用户直接用，新建用户用不了sudo，重启？不可以

- 现在的问题是：能不能在已经运行的容器中添加端口映射？？要是用到途中发现端口少了就麻烦了，解决方法可以是commit成镜像再跑出一个容器出来，
- 最好是一个服务（应用）一个容器


****************
- 自己写构建文件，安装相应的软件
```
    FROM ubuntu
    MAINTAINER kuangcp myth.kuang@gmail.com
    ENTRYPOINT echo "Welcome login server by ssh"

    ENV DEBIAN_FRONTEND noninteractive

    ADD id_rsa.pub /root/.ssh/authorized_keys

    RUN apt-get update; 
    RUN apt-get install -y apt-utils debconf-utils iputils-ping wget curl mc htop ssh; 
    RUN chmod 700 /root/.ssh; chmod 600 /root/.ssh/authorized_keys;
    RUN service ssh start

    EXPOSE 22
```
- `docker build . -t myth:ssh`
- `docker run -d -t --name myth -p 8989:22 myth:ssh`
- `docker start myth`



