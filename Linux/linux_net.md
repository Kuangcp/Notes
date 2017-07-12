## 【网络管理】

#### 查看端口占用情况
- `先安装lsof` `lsof -i:端口号` 用于查看某一端口的占用情况，缺省端口号显示全部

- `netstat -tunlp |grep 端口号` 用于查看指定的端口号的进程情况
    - `-t` (tcp) 仅显示tcp相关选项
    - `-u` (udp)仅显示udp相关选项
    - `-n` 拒绝显示别名，能显示数字的全部转化为数字
    - `-l` 仅列出在Listen(监听)的服务状态
    - `-p` 显示建立相关链接的程序名
    
- [扫描端口的Python](https://github.com/Kuangcp/Notes/blob/master/Python/net/netstatus.py)


- 查询端口占用的pid 三种：
    - `netstat -aonp |grep "^[a-z]\+[ ]\+0[ ]\+0[ ]\+[0-9\.]\+:80[ ]\+"|awk -F" "   {'print $0'}`
    - `netstat -aonp |grep ":80[ ]\+"|awk -F" "   {'print $0'}`
    - `sudo netstat -aonp |grep ":6379[ ]\+"|awk -F" "   {'print $0'}`
    - `sudo kill -9 pid` 杀掉指定pid
    - `ps -aux` 查看当前执行中的程序
- `netstat -antlp | grep 127.0.0.1` 

#### SSH登录
##### 客户端配置
- `sudo spt-get install openssh-client`
- `ssh-keygen` 可以设置密码，为了方便也可以全部采用默认
- 进入.ssh文件夹下 `gedit id_rsa.pub` 然后复制该公钥内容
- 或者 `cat ~/.ssh/id_rsa.pub | xclip -sel clip` 将文件复制到剪贴板
- 在各种平台服务上添加这个公钥即可免密登录

##### 服务端配置
- 安装：`sudo apt-get install openssh-server`
- 启动：`sudo /etc/init.d/ssh start` 或者 `service ssh start` 查看对否启动sshd`ps -e |grep ssh`
- 进入.ssh文件夹下 `sudo vim authorized_keys` 粘贴客户端公钥内容
- 更改文件权限 `sudo chmod 600 authorized_keys`
- 客户端登录 `ssh -p22 username@ip`
*******************************************
#### vpn
##### shadowsocks
`服务端`
- 安装服务端`sudo pip install shadowsocks`
- 启动服务`sudo ssserver -p 443 -k sd -m aes-256-cfb`     
- 后台运行`sudo ssserver -p 443 -k sd -m aes-256-cfb --user nobodu -d start`
- 停止 `sudo ssserver -d stop`
- 日志 `sudo less /var/log/shadowsocks.log`

`客户端`
- `sudo vim /etc/ss.json` 
```
    { 
	    "server":"127.0.0.1",
	    "server_port":443,
	    "localport":1080,
	    "password":"password",
	    "timeout":600,
	    "method":"aes-256-cfb"
    }
```
- `sslocal -c /etc/ss/json`
- 设置代理是1080端口即可

## 工具

### curl

- 格式化返回的json：`curl xxxx|python -m json.tool `

### 邮件服务器 postfix devecot

### FTP 服务器
- `sudo apt-get install vsftpd -y`
- `sudo systemctl start vsftpd.service`
- 创建用户 `sudo useradd -d /home/uftp -s /bin/bash uftp`
- 设置密码 `sudo passwd uftp`
- 删除掉 pam.d 中 vsftpd，因为该配置文件会导致使用用户名登录 ftp 失败：`sudo rm /etc/pam.d/vsftpd`
- 限制用户 uftp 只能通过 FTP 访问服务器，而不能直接登录服务器 `sudo usermod -s /sbin/nologin` uftp
- 修改配置文件 `sudo chmod a+w /etc/vsftpd.conf`

`/etc/vsftpd.conf `
```
    # 限制用户对主目录以外目录访问
    chroot_local_user=YES

    # 指定一个 userlist 存放允许访问 ftp 的用户列表
    userlist_deny=NO
    userlist_enable=YES

    # 记录允许访问 ftp 用户列表
    userlist_file=/etc/vsftpd.user_list

    # 不配置可能导致莫名的530问题
    seccomp_sandbox=NO

    # 允许文件上传
    write_enable=YES

    # 使用utf8编码
    utf8_filesystem=YES
```
- 新建文件 sudo touch /etc/vsftpd.user_list
- 修改权限 `sudo chmod a+w /etc/vsftpd.user_list`
- 添加用户名 `uftp`
- 设置用户目录只读 `sudo chmod a-w /home/common`
- 新建公共目录 设置权限 `mkdir /home/common/public && sudo chmod 777 -R /home/common/public`
- 重启服务 `sudo systemctl restart vsftpd.service`

```
     ~$ sudo mkdir /home/common
     ~$ sudo touch /home/common/welcome.txt
     ~$ sudo useradd -d /home/common -s /bin/bash common
     ~$ sudo passwd common
     ~$ sudo rm /etc/pam.d/vsftpd
     ~$ sudo usermod -s /sbin/nologin common
     ~$ sudo chmod a+w /etc/vsftpd.conf
     ~$ sudo vim /etc/vsftpd.conf
     ~$ sudo vim /etc/vsftpd.user_list
     ~$ sudo chmod a-w /home/common
     ~$ sudo mkdir /home/common/public && sudo chmod 777 -R /home/common/public
     ~$ sudo systemctl restart vsftpd.service
```
