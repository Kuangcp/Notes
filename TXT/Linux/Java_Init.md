# 安装好deepin后配置Java开发环境

## 配置JDK
- 打开配置文件 ： `sudo gedit /etc/profile`
```
	export JAVA_HOME=/opt/jvm/jdk1.8.0_102
    export JRE_HOME=${JAVA_HOME}/jre
	export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
	export PATH=${JAVA_HOME}/bin:$PATH
	sudo update-alternatives --install /usr/bin/javac javac /opt/jvm/jdk1.8.0_102/bin/javac 300
	sudo update-alternatives --install /usr/bin/java java /opt/jvm/jdk1.8.0_102/bin/java 300
	
```
- 并且运行最后两句命令是为了指定jdk版本

## 配置MySQL
- 更新列表` sudo apt-get update `
- 安装MySQL `sudo apt-get install mysql-server mysql-client`
- 检查服务是否已经开启 ： `sudo netstat -tap | grep mysql `
	- （启动显示cp 0 0 localhost.localdomain:mysql *:* LISTEN - ）
- 启动服务 ： `sudo /etc/init.d/mysql restart `
- 查看编码 ： `show variables like 'character_set_%`
- 打开配置文件： `sudo gedit /etc/mysql/mysql.conf.d/mysqld.cnf`
- [mysqld]块下添加一行： `character-set-server=utf8`
- 重启MySQL ：`sudo systemctl restart mysql`
- 再次查看编码确认是utf8

## 配置redis
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
    
```
