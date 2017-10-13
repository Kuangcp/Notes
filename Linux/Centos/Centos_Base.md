# Centos
> 主流服务器

## 安装
### docker安装
> [hub的官方镜像](hub.docker.com/_/centos/)

- `docker pull centos` 得到镜像，然后跑起来即可
    - `cat /etc/redhat-release` 查看当前centos版本（适用于redhat centos） [参考博客](www.cnblogs.com/hitwtx/archive/2012/02/13/2349742.html)

- docker 中 centos7systemctl命令失效的解决方案：
	- `docker run --name centos2 --privileged  -ti -e "container=docker"  -v /sys/fs/cgroup:/sys/fs/cgroup  centos  /usr/sbin/init`

## 基础命令
> 采用的是yum rpm 管理包

