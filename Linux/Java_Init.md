`目录 start`
 
- [在Linux上配置Java环境](#在linux上配置java环境)
    - [配置JDK](#配置jdk)
        - [解压方式](#解压方式)
        - [sdkman方式](#sdkman方式)
    - [配置其他sdk](#配置其他sdk)
    - [配置MySQL](#配置mysql)
    - [配置Redis](#配置redis)
        - [如果要运行make test](#如果要运行make-test)
    - [问题以及解决方案：](#问题以及解决方案)
        - [Picked up _JAVA_OPTIONS: -Dawt.useSystemAAFontSettings=gasp](#picked-up-_java_options--dawtusesystemaafontsettings=gasp)
        - [联想G4070 安装 deepin 15.4.1 显卡兼容失败（15.4还能正常用）](#联想g4070-安装-deepin-1541-显卡兼容失败（154还能正常用）)

`目录 end` *目录创建于2018-01-14*
****************************************
# 在Linux上配置Java环境
## 配置JDK
### 解压方式
- [下载地址](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

- 打开配置文件 ： `sudo gedit /etc/profile`
```
export JAVA_HOME= 绝对路径例如： /home/kcp/Application/sdk/jdk1.8.0_131
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
- `sudo update-alternatives --install /usr/bin/java java /home/kcp/Application/sdk/jdk1.8.0_131/bin/java 300`
- `sudo update-alternatives --install /usr/bin/java java /home/kcp/Application/sdk/jdk1.8.0_131/bin/java 300`

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
- 遇到这种提示就是需要安装zip `sudo apt install zip unzip` 然后重新执行命令
- 执行脚本：`source "/home/kuang/.sdkman/bin/sdkman-init.sh"` 或者重启终端就可以使用 `sdk`命令了
- 查看sdkman 版本 ：`sdk version`
- 查看可用版本 `sdk list java` 
- 不指定版本就是安装最新版 `sdk install java` 
- 指定默认版本 `sdk default java 8u131-zulu`
- 验证是否成功：`java -version`

*************
## 配置其他sdk
- 下载压缩包然后解压到统一的文件夹下，建立一个软链接current在文件夹里，
- 然后配置 .bashrc 或者 别名文件，这样的话，更改版本只要更改软链接就可以了
```sh
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
> [安装MySQL](/Database/MySQL.md)

**************************************
## 配置Redis
> [安装Redis](/Database/Redis.md)

### 如果要运行make test
新建文件夹运行，然后就可以将该目录删除

```sh
    wget http://downloads.sourceforge.net/tcl/tcl8.6.1-src.tar.gz
    sudo tar xzvf tcl8.6.1-src.tar.gz  -C /usr/local/
    cd  /usr/local/tcl8.6.1/unix/
    sudo ./configure
    sudo make
    sudo make install
```

**************
## 问题以及解决方案：
### Picked up _JAVA_OPTIONS: -Dawt.useSystemAAFontSettings=gasp
- 原因是linux自带的OpenJDK影响了安装的java
    - `sudo mv /etc/profile.d/java-awt-font-gasp.sh /etc/profile.d/java-awt-font-gasp.sh.bak`
    - 重启或注销即可

`QQ:`
- `sudo apt-get install deepin-crossover deepinwine-qq`
- [安装QQ](https://www.findhao.net/easycoding/1748)

### 联想G4070 安装 deepin 15.4.1 显卡兼容失败（15.4还能正常用）
- 因为合上盖子休眠就会导致打开电脑直接死机， 找了半天原因是驱动问题， 安装nvidia-driver nvidia-setting bumblebee-nvidia 即可解决、
- 手残，按到关闭窗口特效后，就无法打开了，各种用着不爽， 然后重装了最新版系统，然后就装驱动，重启就不能开特效了。。。。。
