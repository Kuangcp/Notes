`目录 start`
 
- [Zsh](#zsh)
    - [为什么要使用](#为什么要使用)
    - [安装](#安装)
    - [配置](#配置)
        - [oh-my-zsh](#oh-my-zsh)
            - [主题](#主题)

`目录 end` *目录创建于2018-02-07* | 更多: [CSDN](http://blog.csdn.net/kcp606) | [oschina](https://my.oschina.net/kcp1104) | [码云](https://gitee.com/kcp1104) 
****************************************
# Zsh
## 为什么要使用
> 知乎:[mac 装了 oh my zsh 后比用 bash 具体好在哪儿？](https://www.zhihu.com/question/29977255)
> [终极 Shell——ZSH](https://zhuanlan.zhihu.com/mactalk/19556676)

## 安装
> debian系 `apt install zsh`  

## 配置
> [某人的配置](https://github.com/lilydjwg/dotzsh)

### oh-my-zsh
> [官网](https://ohmyz.sh/)
> [参考博客进行安装](https://segmentfault.com/a/1190000004695131)

- 然后进行配置我自己的环境,将bash的配置迁移过来, 对应的 [配置文件](https://github.com/Kuangcp/Configs/tree/master/Linux)
- 为了在控制台的左边提示符添加时间:
```sh
    PS1="${ret_status}%{$fg[cyan]%}%D{%I:%m:%S} %c%{$reset_color%}$(git_prompt_info)"
    # 其实大部分内容都是 直接 echo $PS1 得到的
    # 然后在中间加了个 %D{%I:%m:%S} 显示时分秒
```
> 骚操作的是我找到两个帖子,在两个平台上,提的问题和回答的答案一模一样, 但是,,提问者和回答者另有其人, -> [云栖问答](https://yq.aliyun.com/ask/31670/)|[SegmentFault](https://segmentfault.com/q/1010000005104916)  
> 当然也有可能是同一个人在两个平台上提问题,然后有个人复制回答了, 不管怎样,回答对于目前版本来说是错的, %M不被zsh识别要%m才是分钟

> 然后时间正常了,emmmm,但是分支显示不出来了, 先这样吧, 看看主题

#### 主题
> [官网主题列表](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes) 
- 自带主题:
    - 个人偏好 amuse clean wedisagree, muse也还好,就是没时间

_额外安装_
> [额外主题列表](https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes)

- powerlevel9k
    - [官方文档](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh)
    - `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
    - `powerlevel9k/powerlevel9k`

- Bullet Train 
    - [安装步骤](https://github.com/caiogondim/bullet-train.zsh#for-oh-my-zsh-users)

- Maglev
    - [Github地址](https://github.com/caiogondim/maglev)