`目录 start`
 
- [Docker](#docker)
    - [简介](#简介)
    - [个人理解](#个人理解)
    - [学习资源](#学习资源)
    - [安装与卸载](#安装与卸载)
        - [【Linux】](#linux)
            - [通过命令安装](#通过命令安装)
            - [通过deb文件安装](#通过deb文件安装)
            - [不加sudo执行docker命令](#不加sudo执行docker命令)
            - [卸载](#卸载)
        - [【Windows】](#windows)
    - [相关博客](#相关博客)
    - [常规使用](#常规使用)
        - [Docker仓库](#docker仓库)
        - [【基础命令】](#基础命令)
            - [【镜像命令】](#镜像命令)
            - [【容器命令】](#容器命令)
                - [docker create](#docker-create)
                - [docker run](#docker-run)
                - [docker exec](#docker-exec)
                - [docker commit](#docker-commit)
        - [数据卷](#数据卷)
            - [数据卷容器](#数据卷容器)
        - [端口映射](#端口映射)
            - [容器互联](#容器互联)
        - [Dockerfile](#dockerfile)
        - [dockerignore文件的使用](#dockerignore文件的使用)
        - [使用启动脚本和多进程容器](#使用启动脚本和多进程容器)
    - [容器编排](#容器编排)
        - [Docker-Compose](#docker-compose)
        - [Docker-Machine](#docker-machine)
        - [Docker-Swarm](#docker-swarm)
    - [轻量镜像](#轻量镜像)

`目录 end` *目录创建于2018-02-10* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# Docker


*****************************************
## 简介
- `Docker 是一个开源的应用容器引擎` 理解为加强版虚拟机
- 让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。
********************************************

## 个人理解
- docker中的容器是动态的，随时创建和销毁，只有镜像是持久化的
- 而且容器是一个虚拟出来的功能完备的Linux操作系统可以进行登录运行命令
- `docker images`来得到所有的本地镜像名
    - 使用`docker run --name {name} -d {image-name} `新命名一个容器来启动某个镜像
    - 然后`docker ps`查看容器运行状况
- 镜像的命名：
    - 如果要push到仓库就要遵循这个规范，本地用就无所谓了，而且以后也可以取新的名字 `docker tag 原名 新名` 
    - 官方的hub： `用户名/镜像名：tag`
    - 非官方的例如阿里 `registry.cn-hangzhou.aliyuncs.com/myth/jdk8:alpine` jdk8是镜像名，前面的是仓库地址

## 学习资源
> [码云上Docke相关资源](https://gitee.com/explore/starred?lang=Docker)

- [docker-training 开源项目](https://gitee.com/dockerf/docker-training)
    - [第二课](https://gitee.com/dockerf/second)
- [Dockerfile集锦](https://gitee.com/kennylee/docker)
- [Oracle的Dockerfile仓库](https://github.com/oracle/docker-images)

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

`yum`
- `sudo yum install docker`
    - Ubuntu的话,Docker没有启动, 只要一执行Docker相关命令就会自动启动, 但是Centos要手动启动
    - `service docker start`  设置开机启动: `chkconfig docker on`

#### 通过deb文件安装
- [点击选择文件](https://download.docker.com/linux/debian/dists/)
- 进去后选择debain的版本，deepin15.4 的版本是stretch 然后pool/stable/amd64/选版本即可 
- 例如：[Deepin 15.4直接点这里](https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/)
- `这两种方式装的是同一个版本号` 
- 双击或者`sudo dpkg -i deb文件`
- 测试安装成功 `sudo docker run hello-world`

#### 不加sudo执行docker命令
> [官方文档](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user)

- 如果没有docker组，添加组 `sudo groupadd docker `
- 将当前用户加入用户组 `sudo gpasswd -a $USER docker`
    - 或者?? ：`sudo usermod -aG docker $USER` 会有问题
- 然后重新注销登录，或者退出会话重新登录即可

#### 卸载
- `sudo apt-get purge docker-ce`
- `sudo rm -rf /var/lib/docker`

### 【Windows】
- [参考博客](http://www.cnblogs.com/linjj/p/5606687.html)
- [官方toolbox 下载](https://www.docker.com/products/docker-toolbox)
- 然后双击安装，勾选上virtualbox 记住cpu要开虚拟化
- 安装完成后就会有三个图标在桌面上，然后进入Docker Quickstart Terminal后 `docker run hello-world` 有正常输出即可

## 相关博客
- [ 具有中国特色的docker折腾记（上）](http://blog.csdn.net/Raptor/article/details/18305299)
    - [ 具有中国特色的docker折腾记（下）](http://blog.csdn.net/raptor/article/details/18405569)

**************************************

## 常规使用
- 如果出现命令执行失败，可以登录docker的控制台直接执行 `boot2docker ssh`
- 可以将镜像看成真正运行的程序，容器就是具体的一些配置，所以镜像是可以重复利用，容器出问题删掉就是了

### Docker仓库
> 默认的Hub因为在国外所以慢而且不太稳定

- 时速云：
    - `sudo docker pull index.tenxcloud.com/<namespace>/<repository>:<tag>`
    - 下载后可以用别名 `docker tag index.tenxcloud.com/docker_library/node:lastest node:lastest`
    - 然后为了控制台干净可以直接将原来的长命名tag直接删除
- 阿里云：
    - [开发者平台](https://dev.aliyun.com/search.html)
    - 配置命名空间，仓库，然后使用文档的配置即可
- 百度云（推荐）：
    - [相关文档](https://cloud.baidu.com/doc/CCE/GettingStarted.html#.E9.95.9C.E5.83.8F.E4.BB.93.E5.BA.93)

- 在服务器上搭建私有仓库
    - 服务器上运行 并映射到本地目录 `docker run -d -p 5000:5000 -v /opt/data/registry:/tmp/registry registry`
    - 对服务器中docker已经有的镜像 设置别名 `docker tag 镜像 ip:port/名字`
    - docker push 别名
    - 查看服务器上仓库的镜像 `curl http://IP:5000/v1/search `
    - 这个需要SSL证书，所以要使用要么修改 docker daemon启动参数 要么手动生成SSL证书，或者申请真正SSL证书
        - 添加参数 DOCKER_OPTS="--insecure-registry ip:port" 重启docker服务

*********************
### 【基础命令】
- 登录hub.docker ：`docker login ` 或者 `docker login -u username -p password`
- 登录时速云：`sudo docker login index.tenxcloud.com`
- 登录百度云： `docker login --username=[username] hub.baidubce.com`

#### 【镜像命令】
- 搜索 ： `docker search 镜像名`
- 安装 ： `docker pull 镜像名`
- 查看所有 ： `docker images`
- 删除 ： `docker rmi 镜像名`
- 查看详细： `docker inspect [-f {{".Architesture"}}]`  -f 查看JSON格式的具体节点的数据值
- 查看历史：`docker history imagename`
- 添加标签（别名）： `docker tag originname newname`
- 导入导出：`docker save -o ubuntu.tar  ubuntu:14.04`
    - 导入： `docker load --input ubuntu.tar`或 `docker load < ubuntu.tar`
- 上传镜像： `docker push mythos/test:lastest`

#### 【容器命令】

- 查看当前运行的容器：`docker ps `
    - 查看所有容器 ：`docker ps -a`
    - 查看占用 :`docker ps -s`
- 查看所有容器的状态：`docker stats` 能看到正在运行的容器内存 cpu io net等信息
    - `-a` 所有容器
    - `--no-stream` 不阻塞标准输出流，只输出一次信息

- 停止容器：`docker stop 容器name`
- 重启容器：`docker restart 容器name`
- 启动容器：`docker start 容器name`
    - -i 交互模式，也可以进入终端

- 删除容器：`docker rm 容器name`
    - -f 强行停止正在运行的容器并删除 
    - -l 删除容器的连接，但是保留容器
    - -v 删除容器挂载的数据卷
    - 删除所有容器：`docker rm ${docker -a -q}`
    - 删除所有容器和挂载的目录：`docker system prune --volumes -f`
- 容器日志(终端所有输入输出)：`docker logs 容器name或id`
- 重命名 ： `docker rename origin new`

- 导入导出 （容器快照）：
    - 导出： `docker export -o test.tar 容器名` `docker export 容器name > test.tar`
    - 导入： `docker import [-c |--change=[]] [-m | --message=[]] file|URL - [repository]:[tag]`
    - -c | --change=[] 选项在导入的同时执行对容器就行修改的Dockerfile指令。

##### docker create
> [官方文档](https://docs.docker.com/engine/reference/commandline/create)

##### docker run 
- 等价于 docker create 再 docker start
- `docker run -d --name conrainer-name image-name touch a.md` ，如果镜像本地没有会自动pull
    - `--name` 配置容器名字
    - `-d` 后台启动程序
    - `-i` 交互模式运行容器(标准输入和标准输出) `docker run  -it ubuntu /bin/bash`
    - `-t` 容器启动后进入其命令行
    - `-v` 将本地文件夹建立映射到容器内 `-v 本机:容器`
    - `-p` 端口映射左本机右容器：`-p 44:22`主机容器端口相同就：`-p 22` 将容器所有EXPOSE的端口映射到宿主机随机端口`-P`
    - `-f` 文件？
    - `--env name="tanky"` 设置环境变量
    - `--memory` 限制最大内存
    - `--cpu-shares` 设置CPU的相对权重，只在link之间容器的权重比例
    - `--cpuset-cpus` 限制只能运行在某标号的CPU上
    - `--user` -u 限制用户
    - `--cap-drop` 去除能力
    - `--link` 链接其他容器
    - `--rm` 容器运行结束退出就自动删除该容器 注意和`-d`不能共存
    - `--restart=always` 设置该容器随dokcer 服务自启动
    - `--hostname 容器hostname` 指定容器的hostname
- 常用的参数    
    - `-e TZ="Asia/Shanghai"` 指定时区，可以解决时间不一致
    - `-v /etc/localtime:/etc/localtime:ro` 设置容器的时钟和宿主机一致，不一定有用
    
> `docker create` 是创建一个容器，不会运行，`docker run`是运行命令在一个新容器里

##### docker exec
- 登录容器：
    - `docker exec -it 容器name或id bash `
    - `docker attach 容器id` 这个命令虽然简单，但是退出会话就自动关闭了容器
- 这些选项不加就是默认值，加上短参数形式就是设为另一个值 如 -t
    - `-i `，`--interactive=ture|false` 打开标准输入接受用户输入命令
    - `--privileged=true|false` 是否给以最高权限
    - `-t`，`--tty=true|false` 是否分配伪终端
    - `-u`，`--user=""` 执行命令的用户或ID

- 使用 nsenter 连接到容器:
    - PID=${docker-pid 容器id}
    - nsenter --target $PID --mount --uts --ipc --net --pid

##### docker commit
- `docker commit 容器id 镜像name` 将容器为id的当前容器 保存为name镜像


*********************
### 数据卷
- 数据卷是一个可供容器使用的特殊目录，它将宿主机操作系统目录映射进容器 类似于 mount操作
    - 数据卷可以在容器之间共享重用
    - 数据卷内数据的修改会立马生效，无论是容器内操作还是本地操作
    - 对数据卷的更新不会影响镜像，解耦了应用和数据
    - 卷会一直存在，直到没有容器使用，才可以安全的卸载

- `docker run -v dir:dir[:ro]` 一般是创建容器时使用，和-p类似可以多个，左本机右容器 默认rw权限可以指定 ro只读
    - 可以将一个文件挂载为数据卷，但是文件夹更好，文件可能会有问题出现

#### 数据卷容器
- `docker run -it -v /test --name data ubuntu ` 运行一个挂载了数据卷的容器
- 引用数据卷容器 来挂载数据卷：`docker run -it --volumes-from data --name db1 ubuntu`
- 从已经挂载了数据卷容器的容器 来挂载数据卷：`docker run -it --volumes-from db1 --name db2 ubuntu`
- 使用 `--volumes-from` 参数所挂载数据卷的容器并不需要保持在运行状态
- 如果删除了挂载的容器，数据卷并不会自动删除，而是要在删除最后一个容器时 使用 `docker rm -v` 来声明删除容器并删除关联的数据卷

`利用数据卷容器来迁移数据`
- 备份：
    - `docker run --volumes-from data -v $(pwd):/backup --name worker ubuntu tar cvf /backup/backup.tar /data`
    - 先基于Ubuntu创建一个worker容器并引用了数据卷容器data，然后将当前目录作为数据卷挂载进去，并执行tar命令，打包到数据卷容器的目录下
    - 实现了将当前目录归档到数据卷容器下
- 恢复：
    - 创建一个带有数据卷的容器（目标容器）`docker run -v /data --name reuse ubuntu /bin/bash`
    - 解压当前目录的tar文件到数据卷容器中 `docker run --volumes-from reuse -v $(pwd):/backup busybox tar xvf /backup/backup.tar`
    - 这个就是实现了将本地的归档数据放到指定的容器内，如果要从数据卷容器中恢复到别的容器就只要挂载对应的数据卷容器然后进目录直接解压即可

**************************
### 端口映射
- 当不指定对应的参数容器默认不开放任何端口给外部，可以使用 -P -p 参数来开放
    - -P 随机映射一个 49000-49900 的端口到容器开放的端口
    - -p  `IP:HostPort:ContainerPort | IP::ContainerPort | HostPort:ContainerPort`
        - 映射到指定IP的指定端口`IP:HostPort:ContainerPort` 
        - 映射到指定IP的任意端口`IP::ContainerPort`
        - 映射到所有接口的地址的指定端口`HostPort:ContainerPort`
    - 还可以使用 udp来标记为udp类型 `docker run -d -p 127.0.0.1::5000/udp ubuntu apt update`
- 查看端口
    - 查看容器内5000对应的外端口 `docker port ubuntu17 5000`
    - 查看容器的具体信息 `docker inspect 容器id` 

#### 容器互联
> 让多个容器中应用快速安全交互的方式，特别注意这是双向互联的
> 特别容易出现锁，一个没有启动，其他的都启动不了 尝试？`sudo service docker restart`

- 例如: `创建一个MySQL容器供一个Ubuntu容器使用`
    - 创建MySQL容器 `docker run --name mysql2 -e MYSQL_ROOT_PASSWORD=ad -d mysql`
    - 创建Ubuntu容器 `docker run -d --name test --link mysql2:db ubuntu`
        - link参数说明 ：`--link name:alias` 在父容器中会以别名代称
    - docker会连接两个容器，而不用通过暴露端口来实现，web容器的host文件以及环境变量都会追加上mysql2的配置
    - 所以在Ubuntu容器中连接MySQL容器，首先得到IP就查看 `cat /etc/hosts` 中myslq容器别名为db值的IP地址 或者直接 `ping db` `apt install  inetutils-ping` `ifconfig就要安装net-tools`
    - 然后 `mysql -h IP -u root -pad` 即可连接上mysql

- 例如：`创建一个Nginx和一个Springboot搭建的web服务`
    - 构建Springboot应用镜像，构建应用容器 开放8888端口
    - 新建nginx容器：`docker run --name youhuigo -d -p 80:80 -v /home/kuang/nginx/conf/:/etc/nginx/conf.d/:ro --link you:web nginx`
- 配置文件：`一样的cat /etc/hosts 查看容器的IP`
```conf
upstream youhui {
  server 172.17.0.4:8888;
}

server {
  listen 80;
  server_name youhui;

  location / {
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_set_header X-Nginx-Proxt true;

    proxy_pass http://youhui;
    proxy_redirect off;
  }
}
```

***********************
### Dockerfile
>[Dockerfile文件学习](/Linux/Docker_file.md)

### dockerignore文件的使用
- .dockerignore文件是依据 Go的PathMatch规范来的，使用和.gitignore类似

### 使用启动脚本和多进程容器

******************************************************
## 容器编排
### Docker-Compose
> 声明式环境，管理多容器依赖

### Docker-Machine
> 创建一个docker集群环境 [官方文档安装](https://docs.docker.com/machine/install-machine)

Error with pre-create check: "VBoxManage not found. Make sure VirtualBox is installed and VBoxManage is in the path
Error with pre-create check: "This computer doesn't have VT-X/AMD-v enabled. Enabling it in the BIOS is mandatory"

### Docker-Swarm

***************************************************

## 轻量镜像
```
frolvlad/alpine-oraclejdk8   slim
postgres                     alpine
alpine
```
