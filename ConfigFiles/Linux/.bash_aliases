# Myth Define Alias
alias K.h=' cd ~/Application/shell/python && python3 show_alias_help.py' #获取帮助文档
alias Kalias="gedit ~/.bash_aliases" # 打开alias设置文件
alias Kalias.update="source ~/.bashrc" # 重新加载bash配置文件，刷新alias
alias ll='ls -l' # ls -l 简写
alias lla='ls -la' # ls -a简写
alias py='python3' # python3简写
alias py2='python' # python2简写
alias bell='sudo rmmod pcspkr' # 临时关闭终端响铃


# Java
alias Kgit.redis='cd ~/IdeaProjects/TestRun/MythRedis/' #Redis客户端项目
alias Kgit.javaToolKit='cd ~/IdeaProjects/SpringBoot/JavaToolKit/' # Java工具包项目
alias Kgit.javaBase='cd ~/IdeaProjects/SpringBoot/JavaBase' #Java基础项目

# Python
alias Kgit.python.learning='cd ~/PycharmProjects/PythonMythLearn/learning' #python学习项目
alias Kgit.python.pygames='cd ~/PycharmProjects/PythonMythLearn/pygames' #python pygame学习项目

# Other
alias Kgit.images='cd ~/Pictures/ImageRepo' # 图片仓库

# notes
alias Kgit.notes='cd ~/Documents/Notes/Code_Notes/' #笔记仓库
alias Kgit.io='cd ~/Documents/Notes/Kuangcp.github.io/' #githubpage项目


# Directory
alias Kdir.redis='cd ~/Application/Database/redis-3.2.8' # redis目录


# Application
alias Kredis.client='./start_client.sh' #开启本地redis client
alias Kredis.server='./start_server.sh' #开启本地redis server
alias Kredis.81='./redis-cli -h 120.25.203.47 -p 6381' #连接远程redis 6381
alias Kredis.80='./redis-cli -h 120.25.203.47 -p 6380' #连接远程redis 6380
alias Kredis.79='./redis-cli -h 120.25.203.47 -p 6379' #连接远程redis 6379
alias Kredis.78='./redis-cli -h 120.25.203.47 -p 6378' #连接远程redis 6378
alias Kssh='ssh -p 22 kuang@120.25.203.47' #ssh登录服务器
alias Kmysql='mysql -u myth -p' #myth用户连接MySQL 
alias Krepos=' cd ~/Application/shell/python && python3 repos.py' #检查所有仓库状态的脚本

