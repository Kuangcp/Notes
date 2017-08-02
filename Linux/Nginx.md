# Nginx

## Nginx的安装

## 命令安装
- 安装`sudo apt install nginx`
- 启动服务`sudo /etc/init.d/nginx start`
- 关闭`sudo /etc/init.d/nginx stop`
- 配置文件 `/etc/nginx/nginx.conf`

### 编译安装

- 下载 nginx，pcre，zlib，openssl 的压缩包
- 进入解压根目录（按实际情况配置） 
`配置各个包`
```
    ./configure --sbin-path=/usr/local/nginx/nginx \
    --conf-path=/usr/local/nginx/nginx.conf \
    --pid-path=/usr/local/nginx/nginx.pid \
    --with-http_stub_status_module \
    --with-http_ssl_module \
    --with-pcre=/home/kuang/pcre-8.20 \
    --with-openssl=/home/kuang/openssl \
    --with-zlib=/home/kuang/zlib-1.2.11
```


