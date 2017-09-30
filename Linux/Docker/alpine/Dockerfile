# docker build -t alpine-ssh .
# 运行容器 docker create --name sshd -p 8989:22 alpine-ssh
# 建议构建运行后修改口令 docker exec -it sshd passwd
FROM alpine
MAINTAINER mythos "kuang.myth@foxmail.com"

RUN apk update
RUN apk add openssh-server \
        && ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
        && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
        && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
        && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key \
        && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

RUN echo "root:caishi" | chpasswd

EXPOSE 22
ENTRYPOINT /usr/sbin/sshd -D