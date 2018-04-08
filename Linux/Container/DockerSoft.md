`目录 start`
 
- [使用Docker安装软件](#使用docker安装软件)
    - [个人相关镜像](#个人相关镜像)
- [系统](#系统)
    - [Ubuntu-ssh](#ubuntu-ssh)
    - [alpine-ssh](#alpine-ssh)
    - [Centos-ssh](#centos-ssh)
- [语言环境](#语言环境)
    - [Java](#java)
- [数据库](#数据库)
    - [PostgreSQL](#postgresql)
    - [Oracle](#oracle)
    - [MySQL](#mysql)
    - [Redis](#redis)
- [持续集成](#持续集成)
    - [flow.ci](#flowci)
    - [Jenkins](#jenkins)
- [工具](#工具)
    - [数据协议工具](#数据协议工具)
        - [Protobuf](#protobuf)
    - [git服务器](#git服务器)
        - [简易git-daemon](#简易git-daemon)
        - [Gogs](#gogs)
        - [Gitea](#gitea)
    - [在线IDE](#在线ide)
        - [Coding平台的WebIDE](#coding平台的webide)

`目录 end` |_2018-04-08_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# 使用Docker安装软件
> [如何创建尽可能小的Docker容器教程](http://www.open-open.com/lib/view/open1419760974078.html)

## 个人相关镜像
`百度云`
- alpine配置好ssh `hub.baidubce.com/mythos/alpine-ssh:1.0` 
- redis的alpine版镜像 `hub.baidubce.com/mythos/redis-alpine:1211` 
- idea的注册机 `hub.baidubce.com/mythos/idea-register:1.0`
- protobuf的编译环境以及2.5的源码在内 `hub.baidubce.com/mythos/protoc-alpine-src:2.5` 
    - protobuf 的 Alpine 的 2.5版本 `hub.baidubce.com/mythos/protoc-alpine:2.5` 
    - protobuf 的 Ubuntu 的 2.5版本 `hub.baidubce.com/mythos/protoc:2.5`
    - protobuf 的 Alpine 的 3.5.1版本 `hub.baidubce.com/mythos/protoc-alpine:3.5.1`

***********************************
# 系统
## Ubuntu-ssh
- 最为简单的是：`docker run  -i -t --name ubuntu17 -p 34433:22 ubuntu /bin/bash`
    - 为这些软件预留端口 `ssh tomcat mysql postgresql mysql oracle nginx reids`
    - 直接跑一个Ubuntu出来,预留出要用的端口，容器运行不会退出
    - 进终端之后就 `apt update` 才能安装软件，现在才知道这个命令的重要性
- 现在的问题是：能不能在已经运行的容器中添加端口映射？？要是用到途中发现端口少了就麻烦了，解决方法可以是commit成镜像再跑出一个容器出来，
- 最好是一个服务（应用）一个容器

**********
TODO  日后更新, Dockerfile现在还有bug
- 自己写构建文件，安装相应的软件 
```Dockerfile
    FROM ubuntu
    MAINTAINER kuangcp myth.kuang@gmail.com
    ENTRYPOINT echo "Welcome login server by ssh"
    ENV DEBIAN_FRONTEND noninteractive

    ADD id_rsa.pub /root/.ssh/authorized_keys

    RUN apt-get update; \
        apt-get install -y apt-utils debconf-utils iputils-ping wget curl mc htop ssh; \ 
        chmod 700 /root/.ssh; \
        chmod 600 /root/.ssh/authorized_keys; \
        service ssh start; \ 
    EXPOSE 22
```
- `docker build . -t myth:ssh`
- `docker run -d -t --name myth -p 8989:22 myth:ssh`
- `docker start myth`

## alpine-ssh
- [alpine-ssh](/Linux/Docker/alpine/alpine-ssh) 
    - 也可以使用百度云镜像 `docker pull hub.baidubce.com/mythos/alpine-ssh:1.0`

## Centos-ssh
- [centos-ssh](https://github.com/jingniao/centos-ssh)

*******************************
# 语言环境
## Java
- 基础镜像：
    - [官方镜像](https://hub.docker.com/_/java/)

**********************************
# 数据库
## PostgreSQL
- [Docker 安装 PostgreSQL](/Database/Postgresql.md)

## Oracle
- [社区文档](https://hub.docker.com/r/wnameless/oracle-xe-11g/)`简单粗暴`

## MySQL
- [官方文档](https://hub.docker.com/_/mysql/)
- `docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag`
- 挂载自定义配置文件 主要是配置编码 以及设定时区
    - `docker run --name mysql-5.6 -v 配置文件目录:/etc/mysql/conf.d  -e MYSQL_ROOT_PASSWORD=mythos1104 -e TZ=Asia/Shanghai -p 3360:3306 -d mysql:5.6`
- 连接`mysql -h 127.0.0.1 -P 3360 -uroot -pmythos1104`

## Redis
> [官方镜像地址](https://hub.docker.com/_/redis/)

- 获取镜像：`docker pull redis ` 如果使用`redis:alpine`镜像可以更小，但是稳定就。。
- 运行默认配置的容器：`docker run --name test-redis -d redis`
- 使用本地配置文件启动redis容器
- `sudo docker run -v /myredis/conf/redis.conf:/usr/local/etc/redis/redis.conf --name myredis redis redis-server /usr/local/etc/redis/redis.conf`
- port-redis容器的端口映射：`sudo docker run -d -p 6379:6379 --name port-redis redis` 左本机右容器

*****************************************
# 持续集成
## flow.ci
- [flow.ci](https://github.com/flowci/docker) 可以学习compose

## Jenkins
- `sudo docker pull jenkins` 下拉镜像
- `sudo docker run --name myjenkins -p 8080:8080 -p 50000:50000 -v /home/kcp/docker/jenkins:/var/jenkins_home jenkins` 构建容器
- 确保目录是开放了权限的 直接 `chmod 777 jenkins` 了事
- 然后就是正常的容器的启动关闭了

****************************
# 工具
## 数据协议工具
### Protobuf
1. 创建一个Ubuntu/alpine 容器运行起来
1. 下载 https://github.com/google/protobuf/releases
2. 安装 g++ make 
4. 编译安装下载的源码 进入目录 `./configure --prefix=/usr && make && make check && make install` 


## git服务器
### 简易git-daemon
> 基于git-daemon构建一个Docker镜像, 跑起来直接做git服务器 | [学习使用git-daemon命令](/Linux/Git_Action.md)

```sh
    # 创建一个挂载了本地文件夹的git仓库，并关联到nginx，目录结构和上文一致
    docker run --name git-repos -it -v /home/kuang/Repository/:/root/Repository/ --link mynginx:mynginx alpine
    # 进入容器
    docker exec -it git-repos ash
    # 安装git
    apk update
    apk add git git-daemon
    #　启动服务
    git daemon --export-all --base-path="/root/Repository" --port=55443
```
### Gogs
### Gitea
- [docker 安装 gitea](https://docs.gitea.io/en-us/install-with-docker/) `gitea是一个自助git服务，基于git`
- [gitea配置文件说明](https://docs.gitea.io/zh-cn/config-cheat-sheet/)

## 在线IDE
### Coding平台的WebIDE
