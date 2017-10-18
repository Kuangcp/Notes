# 持续集成
> 使用jenkins 结合gradle docker ，一键上传代码之后自动构建得到镜像

- 使用bitbucket配置私有仓库，在hub上配置docker文件的目录，进行构建，这样就会得到一个可用的镜像
    - 源码是过去了，构建呢，这是个问题，可以使用Jenkins么？