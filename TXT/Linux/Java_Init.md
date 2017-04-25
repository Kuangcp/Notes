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

