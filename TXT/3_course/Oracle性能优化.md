# 1.Oracle的体系结构

## 因为太详细，但是没有一个给出各个模块之间的关系，显得特别凌乱，所以还要参考大二下的书

## 内存讲解
	理解计算机的基本知识
	
## Oracle服务器  = 实例+进程
## Oracle实例
- 有5个必须的后台进程：SMON PMON DBWR LGWR CKPT

## 数据库的文件：
- 控制文件
- 重做日志文件
- 数据文件
- 初始化参数文件
- 密码文件
- 归档重做日志文件


## 与实例的连接
- 输入用户名和密码，就是一个用户进程，通过用户进程连接服务器进程，再连接到Oracle数据库上
- 一个用户可以同时拥有多个会话（用一套帐号登录多次）

## 连接方式
- 基于主机 本地模式
- 客户端 - 服务器模式
- 客户端 - 应用服务器 - 服务器

## 一个服务器进程就拥有单独的不共享的PGA 程序全局区
- 排序区
- Cursor状态区
- 会话信息区
- 堆栈区

## 共享池
- 库高速缓存区（存放共享的SQL代码） LRU（least recently used）
- 数据字典高速缓存区

### 数据库高速缓冲区
### 内存缓冲区顾问
### 重做日志缓冲区
### 大池和Java池
### 内存缓冲区



***********************************************
# 2.

# 3.Oracle实例的管理
## 初始化参数文件
- pfile 静态参数文件（文本文件） 文件名： initSID.ora
- spfile 动态参数文件（二进制文件）文件名：spfileSID.ora

#### 内容 ：

### 静态参数文件 （文本文件）

### 动态参数文件 （二进制文件）
 
## 3.6 启动数据库
startup **[force]**[restrict]**[pfile=文件名]**
[ **open[recover][database]** | mount | **nomount**]
## 3.7 将数据库设为限制模式（杀死普通用户，利于维护）
startup restrict 限制模式的启动
alter system enable restricted session 将已运行的实例切换成限制模式
alter system kill session 杀死用户进程

## 3.9 关闭数据库的四种方式：
- A shutdown abort 强制停库，启动需要做数据库恢复
- I shutdown immediate 中断事务，中断会话，关闭文件，启动需要恢复事务
- T shutdown transactional 中断会话，等待事务关闭，关闭文件
- N shutdown normal 等待会话，事务关闭，关闭文件


# 4 数据字典和控制文件
## 数据字典简介
- 数据字典是一组只读的系统表（AUD$开头的是可修改的），数据字典中存放了有关数据库和数据库对象的信息

## 数据字典中存放的信息
- 数据库的逻辑结构和物理结构
- 所有数据库对象定义的信息
- 所有数据库对象的磁盘空间分配的信息
- Oracle用户名
- 每个用户被授予的权限和角色
- 完整性约束的信息
- 列的默认值
- 审计信息

## 数据字典部分使用
- user_tables 
- all_tables
- user_catalog / cat

## 动态视图(v$开头)
- 

## 移动控制文件的示例
- 查看当前位置： select * from v$controlfile;
- 修改数据库的参数文件映射到目标地址：alter system set contro_files='路径1','路径2' scope=spfile;
- 停库 shutdown immediate
- 使用命令复制 host copy '原地址' '目标地址' 或者直接快捷键
- 启动数据库，再查看控制文件的位置

# 5.重做日志文件
## 5.2 重做日志组
- Oracle至少需要两个重做日志文件组（每个组最少一个重做日志文件）
- 重做日志写进程只能同时写一个组，写是循环写的
    - 写满一个就切换下一个，写满的这个组就会复制到归档日志里保存
    - 称为两级日志结构

## 5.5 获取重做日志的信息
- 重做日志组：
- select group#,sequence#,members,bytes,status,archived from v$log;
- 重做日志组成员：
- select group#,status,type,member from v$logfile;

****************
## 5.11 重做日志应用示例
- select * from v$logfile; 查看日志的状态

#### 1.添加重做日志组
- alter database add logfile('F:\DB\Oracle\Data\Log\REDO04A.log','F:\DB\Oracle\Data\Log\REDO04B.log')size 10m;

#### 2.重建原有的group 3（不活动状态）
- alter database drop logfile group 3;
- alter database add logfile group 3('F:\DB\Oracle\Data\Log\REDO03A.log',
'F:\DB\Oracle\Data\Log\REDO03B.log','F:\DB\Oracle\Data\Log\REDO03C.log')size 15m;

#### 3.强制切换日志组 将当前组（group 1）多切换几次成inactive状态时再删除
alter system switch logfile;

#### 4.操作原本的当前组，删除group 1 再添加1 不能修改1
- alter database drop logfile group 1;
- alter database add logfile group 1('F:\DB\Oracle\Data\Log\REDO01A.log',
'F:\DB\Oracle\Data\Log\REDO01B.log','F:\DB\Oracle\Data\Log\REDO01C.log')size 15m;

***************************************************



