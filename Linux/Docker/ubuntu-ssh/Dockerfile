FROM ubuntu
MAINTAINER Pavel Doomkin

ENV DEBIAN_FRONTEND noninteractive

ADD ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN apt-get update; \
    apt-get install -y apt-utils debconf-utils iputils-ping wget curl mc htop ssh; \
    apt-get clean; \
    locale-gen en_US.UTF-8; update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8; \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config; \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd; \
    chmod 700 /root/.ssh; chmod 600 /root/.ssh/authorized_keys; \
    sed -i 's/^exit 0/service ssh start\nexit 0/' /etc/rc.local

EXPOSE 22
CMD /etc/rc.local; bash
