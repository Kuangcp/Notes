# 学习Linux Shell

## shell 类别
sh
bash
zsh
dash
### tmux 
- `tmux new -s myth`  新建一个窗口 
- `Ctrl B`  再 `C`  新建一个窗口 `Ctrl B` `数字键`切换指定窗口
- 连接远程服务器，运行一个阻塞命令
    - `Ctrl B` `D` 可以合上电脑（休眠）
    - `tmux ls` 显示所有 `tmux a -t myth` 连上指定名字的就继续了

- 获取当前shell绝对路径 `basepath=$(cd `dirname $0`; pwd)`

## 结构

### 循环
- [参考博客](http://www.cnblogs.com/fhefh/archive/2011/04/15/2017233.html)
