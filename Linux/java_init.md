# 安装好deepin后配置Java开发环境

- [安装好deepin后配置Java开发环境](#%E5%AE%89%E8%A3%85%E5%A5%BDdeepin%E5%90%8E%E9%85%8D%E7%BD%AEjava%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83)
    - [配置JDK](#%E9%85%8D%E7%BD%AEjdk)
    - [配置MySQL](#%E9%85%8D%E7%BD%AEmysql)
    - [配置Redis](#%E9%85%8D%E7%BD%AEredis)
        - [如果要运行make test](#%E5%A6%82%E6%9E%9C%E8%A6%81%E8%BF%90%E8%A1%8Cmaketest)
        - [使用make install安装redis并作为一个服务来使用](#%E4%BD%BF%E7%94%A8makeinstall%E5%AE%89%E8%A3%85redis%E5%B9%B6%E4%BD%9C%E4%B8%BA%E4%B8%80%E4%B8%AA%E6%9C%8D%E5%8A%A1%E6%9D%A5%E4%BD%BF%E7%94%A8)
        - [绿色安装 redis](#%E7%BB%BF%E8%89%B2%E5%AE%89%E8%A3%85redis)
        - [docker安装redis](#docker%E5%AE%89%E8%A3%85redis)

## 配置JDK
### 解压方式
- [下载地址](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
- 打开配置文件 ： `sudo gedit /etc/profile`

```
	export JAVA_HOME= 真实目录例如： /home/mythos/Code/java/jdk1.8.0_131
    export JRE_HOME=${JAVA_HOME}/jre
	export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
	export PATH=${JAVA_HOME}/bin:$PATH
```

- `sudo update-alternatives --install /usr/bin/javac javac /home/mythos/Code/java/jdk1.8.0_131/bin/javac 300`
- `sudo update-alternatives --install /usr/bin/java java /home/mythos/Code/java/jdk1.8.0_131/bin/java 300`
- 并且运行最后两句命令是为了指定默认的jdk，因为系统预装了openJdk 本来想直接使用环境变量引用，但是由于没有重启？ 所以环境变量暂时未生效

### sdkman方式 
> jdk不推荐使用sdkman安装，这里的jdk是开源版估计，会少包 认准这个版本才是完整的(Oracle Corporation 25.131-b11)

- 安装sdkman `curl -s "https://get.sdkman.io" | bash`

```
    Looking for a previous installation of SDKMAN...
    Looking for unzip...
    Not found.
    Please install unzip on your system using your favourite package manager.
    Restart after installing unzip.

```

- 遇到这种提示就是需要安装zip `sudo apt install zip` 然后重新执行命令
- 执行脚本：`source "/home/kuang/.sdkman/bin/sdkman-init.sh"` 或者重启终端就可以使用 `sdk` 了
- 查看sdkman 版本 ：`sdk version`
- 查看可用版本 `sdk list java ` 
- 不指定版本就是安装最新版 `sdk install java` 
- 指定默认版本 `sdk default java 8u131-zulu`
- 验证是否成功：`java -version`

********************************


## 配置MySQL
- 更新列表` sudo apt-get update `
- 安装MySQL `sudo apt-get install mysql-server mysql-client`
- 检查服务是否已经开启 ： `sudo netstat -tap | grep mysql `
  - （启动显示cp 0 0 localhost.localdomain:mysql *:* LISTEN - ）
- 启动服务 ： `sudo /etc/init.d/mysql restart `
- 查看编码 ： `show variables like 'character_set_%`
- 打开配置文件： `sudo gedit /etc/mysql/mysql.conf.d/mysqld.cnf`
- `[mysqld]`块下添加一行： `character-set-server=utf8`
- 重启MySQL ：`sudo systemctl restart mysql`
- 再次查看编码确认是utf8

### 使用docker安装mysql
- [官方文档](https://hub.docker.com/_/mysql/)

**************************************
## 配置Redis
### 如果要运行make test
新建文件夹运行，然后就可以将该目录删除

```
    wget http://downloads.sourceforge.net/tcl/tcl8.6.1-src.tar.gz
    sudo tar xzvf tcl8.6.1-src.tar.gz  -C /usr/local/
    cd  /usr/local/tcl8.6.1/unix/
    sudo ./configure
    sudo make
    sudo make install
```

### 使用make install安装redis并作为一个服务来使用

```
    官网下载解压后，进入解压目录：

    cd redis-***
    make
    sudo make install
    下载配置文件和init启动脚本：
    wget https://github.com/ijonas/dotfiles/raw/master/etc/init.d/redis-server
    sudo mv redis-server /etc/init.d/redis-server
    sudo chmod +x /etc/init.d/redis-server
    sudo mv redis.conf /etc/redis.conf
    初始化用户和日志路径
    sudo useradd redis
    sudo mkdir -p /var/lib/redis
    sudo mkdir -p /var/log/redis
    sudo chown redis.redis /var/lib/redis
    sudo chown redis.redis /var/log/redis
    设置开机自动启动，关机自动关闭
    sudo update-rc.d redis-server defaults
    Redis操作：
    sudo /etc/init.d/redis-server start
    sudo /etc/init.d/redis-server restart
    sudo /etc/init.d/redis-server stop
    退出失败？？？？ 
    尚未解决，于是卸载两遍后，使用绿色方式2017-04-28 10:53:32
    
```

### 绿色安装 redis
- 只要下载源码包，解压
- 在解压根目录执行 `make`
- 打开src目录 复制以下文件
    - `redis-server`
    - `redis-cli`
    - `redis-benchmark` ：性能测试工具，测试redis的读写性能
    - 解压根目录的 `redis.conf`
- 随意新建一个目录，将四个文件拷过来，就可以直接运行了
- `./redis-server redis.conf`
- 再配置下启动脚本就很方便了 
    - deepin终端可以配置快捷键 `Alt+<`和`Alt+>`分别启动服务端和客户端

`客户端脚本`

```
    basepath=$(cd `dirname $0`; pwd)
    $basepath/redis-cli
```

`服务端脚本`

```
    basepath=$(cd `dirname $0`; pwd)
    $basepath/redis-server $basepath/redis.conf
```

### docker安装redis
- [docker-install-redis](https://github.com/Kuangcp/Notes/blob/master/TXT/Linux/Docker.md)


*********************************
> 系统装完后kcp用户的组： kcp lp sudo users netdev lpadmin scanner sambashare docker

## 问题以及解决方案：
##### Picked up _JAVA_OPTIONS: -Dawt.useSystemAAFontSettings=gasp
- 原因是linux自带的OpenJDK影响了安装的java
    - `sudo mv /etc/profile.d/java-awt-font-gasp.sh /etc/profile.d/java-awt-font-gasp.sh.bak`
    - 重启或注销即可

`QQ:`
- `sudo apt-get install deepin-crossover deepinwine-qq`
- [安装QQ](https://www.findhao.net/easycoding/1748)


### 联想G4070 安装 deepin 15.4.1 显卡兼容失败（15.4还能正常用）
- 因为合上盖子休眠就会导致打开电脑直接死机， 找了半天原因是驱动问题， 安装nvidia-driver 即可解决、
- 手残，按到关闭窗口特效后，就无法打开了，各种用着不爽， 然后重装了最新版系统，然后就装驱动，重启就不能开特效了。。。。。

