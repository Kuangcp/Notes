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
    - `ps` 查看当前执行中的程序
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

## 工具

### curl

- 格式化返回的json：`curl xxxx|python -m json.tool `

