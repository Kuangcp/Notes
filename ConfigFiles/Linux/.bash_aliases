# Myth Define Alias
# ln -s /home/kcp/Documents/Notes/Notes/ConfigFiles/Linux/.bash_aliases .bash_aliases
alias K.h=' python3 ~/Application/Script/python/show_alias_help.py' #获取帮助文档
alias Kalias="gedit ~/.bash_aliases" # 打开alias设置文件
alias Kalias.update="source ~/.bashrc" # 重新加载bash配置文件
alias ll='ls -l' # ls -l 简写
alias lla='ls -la' # ls -a 简写
alias gy='groovy' #groovy简写
alias py='python3' # python3 简写
alias py2='python' # python2 简写
alias bell='sudo rmmod pcspkr' # 临时关闭终端响铃


# Git__Java
alias Kg.redis='cd ~/IdeaProjects/TestRun/MythRedis/' #Redis客户端项目
alias Kg.javatoolkit='cd ~/IdeaProjects/BaseLearn/JavaToolKit/' # Java工具包项目
alias Kg.javabase='cd ~/IdeaProjects/BaseLearn/JavaBase' #Java基础项目

# Git__Python
alias Kg.python.learn='cd ~/PycharmProjects/PythonMythLearn/' #python学习项目

# Git__Other
alias Kg.images='cd ~/Pictures/ImageRepo' # 图片仓库
alias Kg.notes='cd ~/Documents/Notes/Notes/' #笔记仓库
alias Kg.io='cd ~/Documents/Notes/Kuangcp.github.io/' #githubpage项目
alias Kg.script='cd ~/Application/Script/' # 实用脚本


# Directory
alias Kd.redis='cd ~/Application/Database/redis-3.2.8' # redis目录
alias Kd.tomcat8-5='cd ~/Videos/apache-tomcat-8.5.14' # tomcat目录,activiti使用
alias Kd.tomcat.image='cd ~/Videos/apache-tomcat-image/apache-tomcat-8.5.14/bin' # tomcat目录 image,以及io 展示
alias Kd.hexo='cd ~/hexo' # hexo目录
alias Kd.linux='cd /media/kcp/Myth/Linux' # F盘下Linux目录


# Application
alias Kredis.client='./client_start.sh' #开启本地redis client
alias Kredis.server='./server_start.sh' #开启本地redis server
alias Kredis.81='./redis-cli -h 120.25.203.47 -p 6381' #连接远程redis 6381
alias Kredis.80='./redis-cli -h 120.25.203.47 -p 6380' #连接远程redis 6380
alias Kredis.79='./redis-cli -h 120.25.203.47 -p 6379' #连接远程redis 6379
alias Kredis.78='./redis-cli -h 120.25.203.47 -p 6378' #连接远程redis 6378

alias Kssh='ssh -p 22 kuang@120.25.203.47' #ssh登录服务器
alias Kssh.docker='ssh -p 11223 kcp@localhost' #ssh登录docker中的Ubuntu
alias Kdocker.ubuntu='docker exec -it ubuntu16 bash' # 进入ubuntu16终端 11223:22 11224:8080 11225:6379
alias Kmysql='mysql -u myth -p' #myth用户连接MySQL 
alias Krepos='python3  ~/Application/Script/python/check_repos.py' #检查所有仓库状态的脚本
alias Kdesktop='sudo python3 ~/Application/Script/python/create_desktop.py' # 创建一个desktop文件

