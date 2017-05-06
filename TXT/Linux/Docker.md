# Docker
## 目录 
- [Docker](#docker)
    - [简介](#%E7%AE%80%E4%BB%8B)
    - [个人理解](#%E4%B8%AA%E4%BA%BA%E7%90%86%E8%A7%A3)
    - [docker安装与卸载](#docker%E5%AE%89%E8%A3%85%E4%B8%8E%E5%8D%B8%E8%BD%BD)
        - [通过deb文件方式来安装：](#%E9%80%9A%E8%BF%87deb%E6%96%87%E4%BB%B6%E6%96%B9%E5%BC%8F%E6%9D%A5%E5%AE%89%E8%A3%85%EF%BC%9A)
        - [开始安装](#%E5%BC%80%E5%A7%8B%E5%AE%89%E8%A3%85)
        - [卸载docker](#%E5%8D%B8%E8%BD%BDdocker)
    - [常规使用](#%E5%B8%B8%E8%A7%84%E4%BD%BF%E7%94%A8)
        - [镜像命令](#%E9%95%9C%E5%83%8F%E5%91%BD%E4%BB%A4)
        - [容器命令](#%E5%AE%B9%E5%99%A8%E5%91%BD%E4%BB%A4)
        - [Dockerfile使用](#dockerfile%E4%BD%BF%E7%94%A8)
            - [使用入门案例](#%E4%BD%BF%E7%94%A8%E5%85%A5%E9%97%A8%E6%A1%88%E4%BE%8B)
            - [RUN命令](#run%E5%91%BD%E4%BB%A4)
        - [.dockerignore文件的使用](#dockerignore%E6%96%87%E4%BB%B6%E7%9A%84%E4%BD%BF%E7%94%A8)
    - [安装redis](#%E5%AE%89%E8%A3%85redis)

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
## docker安装与卸载
###### 通过deb文件方式来安装：
- [点击选择文件](https://download.docker.com/linux/debian/dists/)
- 进去后选择debain的版本，deepin15.4 的版本是stretch 然后pool/stable/amd64/选版本即可 
- 例如：[Deepin 15.4直接点这里](https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/)
###### 开始安装
- `sudo dpkg -i deb文件`
- 测试安装成功 `sudo docker run hello-world`

###### 卸载docker
- `sudo apt-get purge docker-ce`
- `sudo rm -rf /var/lib/docker`

**************************************

## 常规使用
- 如果出现命令执行失败，可以登录docker的控制台直接执行 `boot2docker ssh`
#### 镜像命令
- 搜索 ： `docker search 镜像名`
- 安装 ： `docker pull 镜像名`
- 查看 ： `docker images`
- 删除 ：`docker rmi image-id`
#### 容器命令
- 运行：`docker run --name conrainer-name -d image-name`
    - --name 后配置容器名字
    - -d image 名字
- 

### Dockerfile使用
##### 使用入门案例
- 新建目录然后 `touch Dockerfile` `gedit Dockerfile` 输入如下文本
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
- `docker run --name ContainerName -d repository/tag` 新建容器来运行镜像

***************************
- Dockerfile是一个`镜像`的表示，可以通过Dockerfile来描述构建镜像的步骤，且可以自动构建一个容器
- 所有的 Dockerfile 命令格式都是: `INSTRUCTION arguments` 
- 最好在运行这个配置文件的时候新建一个空目录目录下放dockerfile，不要使用根目录，不然全部的东西都传到守护进程里去了
    - 因为生成过程的第一件事是将整个上下文 (递归) 发送到守护进程。
- 同样的可以使用`.dockerignore`文件来忽略不要上传的文件
- `docker build` 
    - `-f` 指向任意位置的文件进行配置 `docker build -f /path/to/a/Dockerfile .`
    - 您使用docker构建的-f标志指向文件系统中任何位置的Dockerfile。
    - `-t`如果构建成功 可以指定保存新镜像的repository和tag (多个的话就多个 -t就行了，例如 `docker build -t shykes/myapp:1.0.2 -t shykes/myapp:latest .`)
#### RUN命令
### .dockerignore文件的使用
- .dockerignore文件是依据 Go的PathMatch规范来的，使用和.gitignore类似

************************************

## 安装redis
- 获取镜像：`docker pull redis `
- 运行默认配置的容器：`docker run --name test-redis -d redis`
- 使用本地配置文件启动redis容器
- `sudo docker run -v /myredis/conf/redis.conf:/usr/local/etc/redis/redis.conf --name myredis redis redis-server /usr/local/etc/redis/redis.conf`
- 查看当前运行的容器：`docker ps `
    - 查看所有容器 ：`docker ps -a`
- 停止容器：`docker stop 容器name或id`
- 启动容器：`docker start 容器name或id`
- port-redis容器的端口映射：`sudo docker run -d -p 6379:6379 --name port-redis redis`
- 删除容器：`docker rm 容器id`
    - 删除所有容器：`docker rm ${docker -a -q}`
- 容器日志：`docker logs 容器name或id`
- 登录容器：`docker exec -it 容器name或id bash `

************************

- docker pull wnameless/oracle-xe-11g
- docker pull mongo
- docker pull cloudesire/activemq
- docker pull rabbitmq
- socker pull rabbitmq:3-management





