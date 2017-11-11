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

### Docker安装并做反向代理
`docker run --name youhuigo -d -p 80:80 -v /home/kuang/nginx/conf/:/etc/nginx/conf.d/:ro --link you:web nginx`
```
upstream youhui {
  server 172.17.0.4:8888;
}

server {
  listen 80;
  server_name youhui;

  location / {
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_set_header X-Nginx-Proxt true;

    proxy_pass http://youhui;
    proxy_redirect off;
  }
}
```
***************
## 配置使用
### 基础配置
> [知乎专栏](https://zhuanlan.zhihu.com/p/24524057)

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

}
```
- 测试配置文件`sudo nginx -t`
- 重启sudo `nginx -s reload`

- [nginx搭建https服务](http://www.cnblogs.com/tintin1926/archive/2012/07/12/2587311.html)

#### 配置https
- 先签发证书
```sh
############ 证书颁发机构
# CA机构私钥
openssl genrsa -out ca.key 2048
# CA证书
openssl req -x509 -new -key ca.key -out ca.crt
############ 服务端
# 生成服务端私钥
openssl genrsa -out server.key 2048
# 生成服务端证书请求文件
openssl req -new -key server.key -out server.csr
# 使用CA证书生成服务端证书  关于sha256，默认使用的是sha1，在新版本的chrome中会被认为是不安全的，因为使用了过时的加密算法。
openssl x509 -req -sha256 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 3650 -out server.crt    
# 打包服务端的资料为pkcs12格式(非必要，只是换一种格式存储上一步生成的证书) 生成过程中，需要创建访问密码，请记录下来。
openssl pkcs12 -export -in server.crt -inkey server.key -out server.pkcs12
```

```
upstream youhui {
  server 127.0.0.1:8888;
}

server {
  listen 443;
  server_name wx.jjyouhuigo.com;
  ssl on;
  ssl_certificate  /home/youhuigo/https/server.crt;
  ssl_certificate_key  /home/youhuigo/https/server.key;

  location / {
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_set_header X-Nginx-Proxt true;

    proxy_pass https://youhui;
    proxy_redirect off;
  }
}

```

### 问题
- 文件上传报错413 http{}中添加 `client_max_body_size 80M;`

## 学习使用
- [实验楼课程](https://www.shiyanlou.com/courses/95)

