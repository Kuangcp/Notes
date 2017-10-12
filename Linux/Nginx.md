# Nginx

## Nginx的安装

### 命令安装
- 安装`sudo apt install nginx`
- 启动服务 `sudo nginx`或者`sudo /etc/init.d/nginx start`
- 关闭 `sudo nginx -s quit` 或者 `sudo /etc/init.d/nginx stop`




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
## 配置使用
### 基础配置

- 修改默认配置文件 `/etc/nginx/nginx.conf`
- 或者更好的就是在 `/etc/nginx/conf.d/`下新建 *.conf 文件，文件名任意
`该配置文件配置了服务器反向代理，80端口上：/路径的请求转发到9991端口 /myth转发到7898端口 `
```
upstream xxxuthus {
  server 127.0.0.1:9991;
}
upstream youhui {
  server 127.0.0.1:7898;
}

server {
  listen 80;
  server_name 1.1.1.1;

  location / {
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_set_header X-Nginx-Proxt true;

    proxy_pass http://xxxuthus;
    proxy_redirect off;
  }
 location /myth{
  proxy_pass http://youhui;
  proxy_redirect off;
 }

}}
```
- 测试配置文件`sudo nginx -t`
- 重启sudo `nginx -s reload`

## 学习使用
- [实验楼课程](https://www.shiyanlou.com/courses/95)