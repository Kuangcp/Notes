# 网络编程
## Socket
> 作为网络编程的抽象概念，用于描述IP地址和端口，表示打开了一个网络连接，一个socket绑定到一个端口上
> 基于Socket的编程，需要知道目标计算机的IP地址，端口，以及协议类型

### 基于TCP

### 基于UDP

## 邮件

## Web工具
- `pip3 install httpie` 我的用不了，奇怪？？ 这个`sudo apt install httpie`才能用
    - `http --json URL` 格式化输出json
    - URL会转小写。。。
- `curl URL|python -m json.tool ` 格式化输出JSON

# 爬虫
### 安装所需模块

`解析HTML`
- bs4 ：`sudo pip3 install bs4`
- lxml :`sudo pip3 install lxml`
