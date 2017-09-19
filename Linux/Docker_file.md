`目录`
- [Dockerfile](#dockerfile)
    - [使用入门案例](#使用入门案例)
    - [【Dockerfile命令理解】](#dockerfile命令理解)
        - [FROM](#from)
        - [MAINTAINER](#maintainer)
        - [RUN](#run)
        - [CMD](#cmd)
        - [ENTRYPOINT](#entrypoint)
        - [USER](#user)
        - [EXPOSE](#expose)
        - [ENV](#env)
        - [LABEL](#label)
        - [ARG](#arg)
        - [COPY](#copy)
        - [ADD](#add)
        - [VOLUME](#volume)
        - [WORKDIR](#workdir)
        - [STOPSIGNAL](#stopsignal)
        - [ONBUILD](#onbuild)
            - [Dockerfile案例](#dockerfile案例)
            - [打包最新版git](#打包最新版git)

# Dockerfile
## 使用入门案例
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
## 【Dockerfile命令理解】
- Dockerfile是一个`镜像`的表示，可以通过Dockerfile来描述构建镜像的步骤，且可以自动构建一个容器
- 所有的 Dockerfile 命令格式都是: `INSTRUCTION arguments` 
- 最好在运行这个配置文件的时候新建一个空目录目录下放dockerfile，不要使用根目录，不然全部的东西都传到守护进程里去了
    - 因为生成过程的第一件事是将整个上下文 (递归) 发送到守护进程。
- 同样的可以使用`.dockerignore`文件来忽略不要上传的文件
- `docker build` 
    - `-f` 指向任意位置的文件进行配置 `docker build -f /path/to/a/Dockerfile .`
    - `-t`如果构建成功 可以指定保存新镜像的repository和tag (多个的话就多个 -t就行了，例如 `docker build -t shykes/myapp:1.0.2 -t shykes/myapp:latest .`)

### FROM 
> 基于某镜像构建,这是整个文件的第一条指令，一定是基于某镜像构建的，如果是空镜像就使用特殊的 FROM scratch

- `FROM image`
- `FROM image:tag`

### MAINTAINER
- 留开发者名字 例如 `MAINTAINER kuangcp myth.kuang@gmail.com`

### RUN
> 每条RUN命令在当前镜像的基础上执行指定命令，并提交为新的镜像，所以不要一条命令就一个RUN，避免层太多

- `RUN command` command是shell `/bin/sh -c` 命令 例如 `RUN apt update`  
- `RUN ["executable", "param1", "param2" ... ]`

### CMD
> 指定容器启动时默认执行的命令

- `三种格式`
    - `CMD ["executable","param1","param2"]` (like an exec, preferred form) `推荐`
    - `CMD ["param1","param2"]` (as default parameters to ENTRYPOINT)
    - `CMD command param1 param2` (as a shell)
- 一个Dockerfile里只能有一个CMD，如果有多个，只有最后一个生效。如果用户在docker run 中带了运行的命令，就会覆盖CMD命令

### ENTRYPOINT
- `容器入口点` 命令设置在容器启动时执行命令 一般用来做初始化容器，或者运行持久软件
- `ENTRYPOINT echo "Welcome!"` 那么每次启动容器都有这个输出
- `ENTRYPOINT cmd param1 param2 ...`
- `ENTRYPOINT ["cmd", "param1", "param2"...]`

### USER
- 限定了当前镜像的默认用户，如果在这个镜像上的容器需要安装软件就会需要提权，就要至少创建额外的两个层，层限制是42,
    - 更好的方法是在基础镜像中创建用户和用户组，然后在完成构建时再设置默认的用户
- 指定 mysql 的运行用户 `ENTRYPOINT ["mysql", "-u", "daemon"]`
- 更好的方式是：
```
    ENTRYPOINT ["memcached"]
    USER daemon
```

### EXPOSE
- 创建一个层，对外开放端口 例如 EXPOSE 22

### ENV
- 设置环境变量 `ENV <key> <value>`
- 设置之后的RUN命令都可以使用该环境变量，如果`docker run --env <key>=<value>`则会覆盖dockerfile中同名key的值

### LABEL
- 用来定义键值对，只能出现一次，相当于是一个内置的配置文件
- LABEL version="1.0"

### ARG
> 用来指定一些镜像中使用的参数，例如版本信息 

-  `ARG <name> [=<default value>]`
- 使用`docker build --build=-arg<name>=<value>` 来传入值

### COPY
- `copy <src> <dest>`
    - `copy ["./log", "${APPROOT}"]`

- 当复制本地目录时，推荐使用copy

### ADD
- 相当于copy命令
- `ADD <src> <dest>` 
    - src 是Dockerfile的相对目录，可以是本地也可以是远程URL
    - dest 容器中的绝对路径

### VOLUME
- `VOLUME ["<mountpoint>"]` `VOLUME ["/data"]` 创建挂载点 用于共享目录

### WORKDIR
- `WORKDIR /path/to/workdir`
- 配置RUN, CMD, ENTRYPOINT 命令设置当前工作路径，如果目录不存在就新建
- 可以设置多次，如果是相对路径，则相对前一个 WORKDIR 命令
    - 例如：`WORKDIR /a WORKDIR b WORKDIR c RUN pwd` 其实是在 /a/b/c 下执行 pwd

### STOPSIGNAL


### ONBUILD
- 注入下游镜像。如果生成的镜像是作为另一个镜像的基础镜像，则该指令定义了需要被执行的那些指令

******************************************
#### Dockerfile案例
- [alpine构建ssh](/Linux/Docker/alpine/Dockerfile)
- [docker-wordpress-nginx](https://github.com/eugeneware/docker-wordpress-nginx)
- [rails-meets-docker](https://github.com/gemnasium/rails-meets-docker)

- [官方文档 dockerfile](https://www.docker.io/learn/dockerfile/)
- [官方文档 builder](http://docs.docker.io/reference/builder/)

#### 打包最新版git
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
