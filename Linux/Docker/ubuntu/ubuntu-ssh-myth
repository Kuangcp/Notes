FROM ubuntu:16.04

#  apt-utils wget curl htop 
# 镜像源列表是 16.04的代号 还是失败了


RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak;\
    echo "deb http://mirrors.aliyuncs.com/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list;\
    echo "deb http://mirrors.aliyuncs.com/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list;\
    echo "deb http://mirrors.aliyuncs.com/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list;\
    echo "deb http://mirrors.aliyuncs.com/ubuntu/ xenial-proposed main restricted universe multiverse" >> /etc/apt/sources.list;\
    echo "deb http://mirrors.aliyuncs.com/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list;\
    echo "deb-src http://mirrors.aliyuncs.com/ubuntu/ xenial main restricted universe multiverse" >> /etc/apt/sources.list;\
    echo "deb-src http://mirrors.aliyuncs.com/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list;\
    echo "deb-src http://mirrors.aliyuncs.com/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list;\
    echo "deb-src http://mirrors.aliyuncs.com/ubuntu/ xenial-proposed main restricted universe multiverse" >> /etc/apt/sources.list;\
    echo "deb-src http://mirrors.aliyuncs.com/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list;\
    apt-get update; \
    apt-get install -y openssh-server;\
    echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config ;\
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config ;\
    useradd -ms /bin/bash mythos;\
    service ssh restart; \
    echo "root:caishi" | chpasswd;\
    echo "mythos:jiushi" | chpasswd;

USER mythos
WORKDIR /home/mythos


EXPOSE 22
# 入口点这里总是失败，启动成功然后退出了
# ENTRYPOINT /usr/sbin/sshd start
