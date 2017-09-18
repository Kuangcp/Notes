# 使用Docker安装软件
`目录`
- [使用Docker安装软件](#%E4%BD%BF%E7%94%A8docker%E5%AE%89%E8%A3%85%E8%BD%AF%E4%BB%B6)
    - [安装redis](#%E5%AE%89%E8%A3%85redis)
    - [安装 Jenkins](#%E5%AE%89%E8%A3%85jenkins)
    - [安装 PostgreSQL](#%E5%AE%89%E8%A3%85postgresql)
    - [安装 Oracle](#%E5%AE%89%E8%A3%85oracle)
    - [安装 MySQL](#%E5%AE%89%E8%A3%85mysql)
    - [Docker中构建一个可外登录的完整单一Ubuntu](#docker%E4%B8%AD%E6%9E%84%E5%BB%BA%E4%B8%80%E4%B8%AA%E5%8F%AF%E5%A4%96%E7%99%BB%E5%BD%95%E7%9A%84%E5%AE%8C%E6%95%B4%E5%8D%95%E4%B8%80ubuntu)
    - [创建一个alpine的ssh](#%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AAalpine%E7%9A%84ssh)

*****

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
- [Docker 安装 PostgreSQL](/Database/Postgresql.md)

## 安装 Oracle
- [社区文档](https://hub.docker.com/r/wnameless/oracle-xe-11g/)

## 安装 MySQL
- [官方文档](https://hub.docker.com/_/mysql/)
- `docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag`

## Docker中构建一个可外登录的完整单一Ubuntu
- 最为简单的是：`docker run  -i -t --name ubuntu17 -p 34433:22 ubuntu /bin/bash`
    - 为这些软件预留端口 `ssh tomcat mysql postgresql mysql oracle nginx reids`
    - 直接跑一个Ubuntu出来,预留出要用的端口，容器运行不会退出
    - 进终端之后就 `apt update` 才能安装软件，现在才知道这个命令的重要性
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

## 创建一个alpine的ssh
- [alpine-ssh](/Linux/Docker/alpine/Docerfile)


