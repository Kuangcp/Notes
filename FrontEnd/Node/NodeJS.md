`目录 start`
 
- [NodeJs](#nodejs)
    - [安装](#安装)
    - [配置](#配置)
        - [使用淘宝的镜像](#使用淘宝的镜像)
    - [使用](#使用)

`目录 end` |_2018-04-08_| [码云](https://gitee.com/kcp1104) | [CSDN](http://blog.csdn.net/kcp606) | [OSChina](https://my.oschina.net/kcp1104)
****************************************
# NodeJs

## 安装
1. [官网下载](https://nodejs.org/en/)
2. 进入解压的 `bin目录` 将所有个文件建立软链接到 `/usr/local/bin/` 目录下
3. 执行 node --version 和 npm -v 查看是否配置成功


## 配置
### 使用淘宝的镜像
> [官网](http://npm.taobao.org/)

1. 临时使用 `npm --registry https://registry.npm.taobao.org install express`
2. 永久使用 `npm config set registry https://registry.npm.taobao.org`
3. 通过cnpm使用 `npm install -g cnpm --registry=https://registry.npm.taobao.org` _emmm, 为什么我就配置不成功_

> 查看配置是否成功: `npm config get registry`

## 使用

> [Hexo](/Skills/View/Hexo.md)