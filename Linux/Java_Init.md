`目录`
- [安装好deepin后配置Java开发环境](#安装好deepin后配置java开发环境)
    - [配置JDK](#配置jdk)
        - [解压方式](#解压方式)
        - [sdkman方式](#sdkman方式)
    - [配置其他sdk](#配置其他sdk)
    - [配置MySQL](#配置mysql)
        - [使用docker安装mysql](#使用docker安装mysql)
    - [配置Redis](#配置redis)
        - [如果要运行make test](#如果要运行maketest)
        - [使用make install安装redis并作为一个服务来使用](#使用makeinstall安装redis并作为一个服务来使用)
        - [绿色安装 redis](#绿色安装redis)
        - [docker安装redis](#docker安装redis)

# 安装好deepin后配置Java开发环境
> oneinstack

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
- 让修改立即生效`source /etc/profile`
`或者修改 .bash_aliases`
```
JAVA_HOME=/home/kcp/Application/sdk/jdk1.8.0_131
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
```
- source ~/.bash_aliases

- *一定要执行*: 指定默认的jdk，因为系统预装了openJdk 
- `sudo update-alternatives --install /usr/bin/javac javac /home/mythos/Code/java/jdk1.8.0_131/bin/javac 300`
- `sudo update-alternatives --install /usr/bin/java java /home/mythos/Code/java/jdk1.8.0_131/bin/java 300`

### sdkman方式 
> jdk不推荐使用sdkman安装，这里的jdk是开源版估计，会少包 认准这个版本才是完整的(Oracle Corporation 25.131-b11)
> 但是最近出了一个oracle的版本貌似是完整的，因为有个同意协议的过程 `sdk install java 8u144-oracle`

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

## 配置其他sdk

- 下载压缩包然后解压到统一的文件夹下，建立一个软链接current在文件夹里，
- 然后配置 .bashrc 或者 别名文件，这样的话，更改版本只要更改软链接就可以了
```
SDK_DIR=/home/kcp/.sdkman/candidates
GRADLE_HOME=$SDK_DIR/gradle/current
GRAILS_HOME=$SDK_DIR/grails/current
GROOVY_HOME=$SDK_DIR/groovy/current
KOTLIN_HOME=$SDK_DIR/kotlin/current
SCALA_HOME=$SDK_DIR/scala/current
export PATH=$PATH:$GRADLE_HOME/bin:$GRAILS_HOME/bin:$GROOVY_HOME/bin:$SCALA_HOME/bin:$KOTLIN_HOME/bin
```
********************************

## 配置MySQL
- 更新列表` sudo apt-get update `
- 安装MySQL `sudo apt-get install mysql-server mysql-client`
- 检查服务是否已经开启 ： `sudo netstat -tap | grep mysql `
  - （启动显示cp 0 0 localhost.localdomain:mysql *:* LISTEN - ）
- 启动服务 ： `sudo /etc/init.d/mysql restart `
- 查看编码 ： `status` 或者 `show variables like 'character_set_%`
- 打开配置文件： `sudo gedit /etc/mysql/mysql.conf.d/mysqld.cnf`
    - `[mysqld]`块下添加一行： `character-set-server=utf8`
    - 如果要允许远程访问，就注释掉 `bind-address`
- 重启MySQL ：`sudo systemctl restart mysql`

*************
- 5.7.18 全是utf8， 5.7.19 客户端以及连接就变成了拉丁，不知道会不会有问题,,不能输入中文？！！！！
    -  [mysql] 下添加 `default-character-set=utf8` [mysql]没有就加在mysqld前面

- 如果是服务器要配置远程访问 就 bind-address=服务器IP
    - 确保skip-networking被删除或者屏蔽，否则不支持TCP/IP 访问

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

### 绿色安装Redis
- 只要下载源码包，解压
- 在解压根目录执行 `make`
- 打开src目录 复制以下文件
    - `redis-server`
    - `redis-cli`
    - `redis-benchmark` ：性能测试工具，测试redis的读写性能
    - 根目录的 `redis.conf`
- 随意新建一个目录，将四个文件拷过来，就可以直接运行了
- `./redis-server redis.conf`

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
- [docker-install-redis](/Linux/Docker.md)


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
- 因为合上盖子休眠就会导致打开电脑直接死机， 找了半天原因是驱动问题， 安装nvidia-driver nvidia-setting bumblebee-nvidia 即可解决、
- 手残，按到关闭窗口特效后，就无法打开了，各种用着不爽， 然后重装了最新版系统，然后就装驱动，重启就不能开特效了。。。。。

