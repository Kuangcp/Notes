`目录 start`
 
- [代码托管平台](#代码托管平台)
    - [Gitee](#gitee)
        - [URL规则](#url规则)
    - [Github](#github)
        - [URL规则](#url规则)
        - [MarkDown规则](#markdown规则)
    - [Gitea](#gitea)
        - [自建](#自建)
- [综合开发平台](#综合开发平台)
    - [华为云](#华为云)
    - [阿里云](#阿里云)
    - [百度开发平台](#百度开发平台)
        - [CCE](#cce)
        - [BAE](#bae)
        - [其他平台](#其他平台)
    - [腾讯](#腾讯)
        - [微信公众号](#微信公众号)
- [智能机器人平台](#智能机器人平台)
    - [图灵机器人](#图灵机器人)
- [消息推送](#消息推送)
    - [极光推送](#极光推送)
    - [GoEasy](#goeasy)
- [文档](#文档)
    - [文档托管](#文档托管)
- [测试平台](#测试平台)
- [培训](#培训)

`目录 end` *目录创建于2018-01-22* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************

# 代码托管平台
## Gitee
> 码云,国内的github

### URL规则
- HTTPS & SSH
    - `HTTPS:` https://gitee.com/kcp1104/MythRedisClient.git
    - `SSH:` git@gitee.com:kcp1104/MythRedisClient.git

***********************************
## Github
> 全球范围的网站

### URL规则
> github仓库的URL规则

- HTTP & SSH
    - `SSH:` git@github.com:Kuangcp/Script.git
    - `HTTPS:` https://github.com/Kuangcp/Script.git

- 目录：
    - https://github.com/用户/项目/tree/分支/相对根目录的目录
- 文本文件：
    -  https://github.com/用户/项目/blob/分支/文件目录
- 二进制文件，例如图片：
    -  https://raw.githubusercontent.com/用户/项目/分支/文件目录
- 例如同仓库下的这个文件`/Linux/Docker.md` 可以直接这样写，方便调用，最好最前面不要加`.`这个表示当前目录的 

### MarkDown规则
> [更多详情>>](/Skills/Document/MarkDown.md#github)

*********************************************
## Gitea
> [官网](https://gitea.io/zh-cn/) 

### 自建
- 使用docker安装比较简单
    - 配置数据库，一定要是外网的。或者容器互联

`/data/gitea/conf/app.ini` 要修改的配置，都是改成对外的配置
```conf
ROOT_URL         = http://git.kuangcp.top/
DOMAIN           = git.kuangcp.top
SSH_PORT         = 10022
SSH_DOMAIN       = kuangcp.top
```

********************************************************
# 综合开发平台
## 华为云
- [CSE微服务相关文档](http://support.huaweicloud.com/devg-cse/cse_03_summary.html)

## 阿里云


## 百度开发平台

***************
### CCE
> 容器引擎 -> [入门必看](https://cloud.baidu.com/doc/CCE/GettingStarted.html)

- 比阿里的好用

****************
### BAE
> 应用引擎，简单的说就是一个提供了环境，你只需上传打包好的可执行文件就可以运行起来了

- 短期使用收费没有很高，十分灵活，就是前期学习入门 配置略麻烦。适合演示使用，例如毕设。
    - 并且还提供一定免费额度的 MySQL Redis MongoDb （只能BAE的内网访问）
    - 还有自动测试

*******************
### 其他平台
- [百度脑图](http://naotu.baidu.com/)`在线思维导图创作`

*******************************************************
## 腾讯
### 微信公众号
`2017-12-21 21:41:43`
- 不说了反正都是Shit一样的接口设计和返回值  希望会变好，碰过就不想再弄了！！！

****************************************************
# 智能机器人平台
## 图灵机器人

************************************************ 
# 消息推送
## 极光推送
> [官网](https://www.jiguang.cn/) `做Android IOS的消息推送和短信等推送`

## GoEasy
- [示例](http://goeasy.io/cn/started)

*********************************
# 文档
## 文档托管
- [看云](https://www.kancloud.cn/dashboard)

************************************************************
# 测试平台
- [自动API测试](https://www.eolinker.com/#/index)
- [吆喝科技](http://www.appadhoc.com/)`A/B测试 灰度上线`

# 培训
- [咕泡](http://www.gupaoedu.com/)`看起来很有深度, 就是有点贵`

