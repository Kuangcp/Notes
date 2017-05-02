# Docker 
## 简介
- `Docker 是一个开源的应用容器引擎` 理解为加强版虚拟机
- 让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。
********************************************
### 个人理解
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

*********************

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
- Dockerfile是一个镜像的表示，可以通过Dockerfile来描述构建镜像的步骤，并自动构建一个容器
- 所有的 Dockerfile 命令格式都是: `INSTRUCTION arguments`
- 最好在运行这个配置文件的时候新建一个空目录，不要使用根目录，不然全部的东西都传到守护进程里去了
- 同样的可以使用.dockerignore文件来忽略不要上传的文件
- docker build 
    - -f 指向任意位置的文件进行配置 `docker build -f /path/to/a/Dockerfile .`
    - -t 
#### RUN

### 安装 redis
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

docker pull wnameless/oracle-xe-11g
docker pull mongo
docker pull cloudesire/activemq
docker pull rabbitmq
socker pull rabbitmq:3-management













