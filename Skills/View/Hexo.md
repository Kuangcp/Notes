`目录 start`
 
- [配置Hexo的Github博客](#配置hexo的github博客)
        - [安装node](#安装node)
    - [安装 hexo](#安装-hexo)
            - [配置文件](#配置文件)
            - [新建文章](#新建文章)

`目录 end` *目录创建于2018-01-14*
****************************************
# 配置Hexo的Github博客
> 参考 [博客](http://stonebegin.com/hexo+github.html) | [部署Hexo](http://letus.club/2016/04/04/deploy-hexo-and-change-theme/)

TODO 在docker中下拉笔记仓库, 然后构建, 然后推送到github的page上

### 安装node 

#### 解压方式
- [官网下载](https://nodejs.org/en/)
- 解压后在`bin`目录中将 两个文件都建立 软连接到 `/usr/local/bin/` 目录下
- 执行 `node --version` 和 `npm -v` 查看是否配置成功
- 

## 安装 hexo
- `npm install -g hexo`
- 新建一个目录然后初始化 `hexo init` 
- 根据md生成静态资源文件 `hexo generate` ` hexo g`
- 本地试运行 `hexo server` ` hexo s`
- 清除静态文件` hexo clean`
- 发布到远程 `hexo deploy` `hexo d`


### 配置文件
- 当前目录下的`_config.yml`是主配置文件

- Site 部分
    - subtitle: 对自己的描述或者对网站的描述
    - description: 对网站的描述，提供给搜索引擎看的
    - author: 作者
    - language: 中文是zh-CN
    - timezone: 不填就好，系统自己会计算时区
- URL
    - url: 填写你自己网站的域名
    - root: 如果你的网站首页就在你github仓库的根目录下，则不用修改，否则改成你网站首页所在目录即可。
    - 后面默认。
- Extensions
    - theme 填写`/thems`文件夹下的`主题文件夹名字` [官方主题](https://hexo.io/themes/)    
    - 选好对应的主题只要 `git clone` 在`/themes`文件夹下即可
    - 例如 next主题 [官方使用文档](http://theme-next.iissnan.com/getting-started.html)
    
- Deployment
    - type: git
    - repo: 仓库URL
    - branch: master 分支，一般是master

> [更多发布方式](https://hexo.io/docs/deployment.html)   
 
### 新建文章
- `hexo new "postName" #postName是文章的名字`    
    - 文章的开头具有 时间，标题，分类， 标签等信息
- 然后生成，发布 `hexo g` `hexo d`

