`目录 start`
 
- [Mysql](#mysql)
    - [安装](#安装)
        - [Ubuntu安装配置MySQL](#ubuntu安装配置mysql)
        - [Docker安装](#docker安装)
    - [图形化客户端](#图形化客户端)
    - [基本数据类型](#基本数据类型)
        - [decimal](#decimal)
        - [LongBlob](#longblob)
        - [1.mysql常用命令集合](#1mysql常用命令集合)
            - [1.1【自增长】](#11自增长)
            - [1.2【主键约束的修改】](#12主键约束的修改)
            - [1.3【修改表名】](#13修改表名)
            - [1.4【定界符】](#14定界符)
            - [1.5【已有表数据，新建表】](#15已有表数据新建表)
            - [1.6【查看所有连接状态】](#16查看所有连接状态)
            - [1.7【查看表的状态】](#17查看表的状态)
            - [1.8【关于时间 】](#18关于时间-)
                - [1.8.1【常用函数】](#181常用函数)
                - [1.8.2【获取当前时间与i个月之间的天数】](#182获取当前时间与i个月之间的天数)
                - [1.8.3 【datetime 和 timestamp 区别】](#183-datetime-和-timestamp-区别)
            - [1.9 【插入外码】](#19-插入外码)
    - [2.【变量】](#2变量)
    - [3.【基本流程语法】](#3基本流程语法)
    - [4.【触发器】](#4触发器)
        - [4.1【创建单语句的触发器】](#41创建单语句的触发器)
        - [4.2【创建多语句的触发器】](#42创建多语句的触发器)
        - [4.3【NEW 和 OLD关键字】](#43new-和-old关键字)
    - [5.【存储过程】](#5存储过程)
        - [基本结构示例：](#基本结构示例)
    - [6. 【函数】](#6-函数)
        - [【简单示例】](#简单示例)
    - [7.【异常】](#7异常)
    - [8.【用户管理】](#8用户管理)
        - [查看](#查看)
        - [创建](#创建)
        - [修改](#修改)
        - [【授权】](#授权)
    - [mysql命令行参数](#mysql命令行参数)
    - [mysql命令行实例](#mysql命令行实例)
        - [常用五类约束](#常用五类约束)
        - [mysql正确卸载](#mysql正确卸载)
        - [数据类型](#数据类型)
        - [常见函数](#常见函数)

`目录 end` *目录创建于2018-01-21*
****************************************

# Mysql

## 安装
### Ubuntu安装配置MySQL
- 更新列表` sudo apt-get update `
- 安装MySQL `sudo apt-get install mysql-server mysql-client`
- 检查服务是否已经开启 ： `sudo netstat -tap | grep mysql `
  - （启动显示cp 0 0 localhost.localdomain:mysql *:* LISTEN - ）
- 启动服务 ： `sudo /etc/init.d/mysql restart `
- 查看编码 ： `status` 或者 `show variables like 'character_set_%`
`配置`
- 打开配置文件： `sudo gedit /etc/mysql/mysql.conf.d/mysqld.cnf`
    - `[mysqld]`下添加一行： `character-set-server=utf8`
    - `[client]`下添加 `efault-character-set = utf8`
    - 如果要允许远程访问，就注释掉 `bind-address`
    - 如果是服务器要配置远程访问 就 bind-address=服务器IP
    - 确保skip-networking被删除或者屏蔽，否则不支持TCP/IP 访问
`重启`
- 重启MySQL ：`sudo systemctl restart mysql`

### Docker安装
>[Docker安装MySQL](/Linux/Container/Container/Docker_Soft.md)

- [博客：Mysql有没有必要Docker化](http://www.infoq.com/cn/articles/can-mysql-run-in-docker?utm_campaign=rightbar_v2&utm_source=infoq&utm_medium=articles_link&utm_content=link_text)

## 图形化客户端
> windows上就直接 MySQL-Font HeidiSQL Linux就终端了..虽然wine也能装这俩

- [10个Mysql图形客户端](http://www.linuxidc.com/Linux/2015-01/111421.htm)

***********
## 基本数据类型
###  decimal 
-  The declaration syntax for a DECIMAL column is DECIMAL(M,D). The ranges of values for the arguments are as follows:
   - M is the maximum number of digits (the precision). It has a range of 1 to 65.
   - D is the number of digits to the right of the decimal point (the scale). It has a range of 0 to 30 and must be no larger than M. 
- 在MySQL 3.23 及以后的版本中，DECIMAL(M, D) 的取值范围等于早期版本中的DECIMAL(M + 2, D) 的取值范围。 - 1、当插入的整数部分的值超过了其表示范围后就直接忽略了小数部分的值，并以最大值填充。 
- 2、当整数部分合法，小数部分多余的位数，直接截断。

### LongBlob
- 这种数据类型可以直接把图像文件存到数据库中！

创建UTF8编码数据库 `CREATE DATABASE `test2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci`

### 1.mysql常用命令集合
#### 1.1【自增长】
- 【创建表时设置自增长，并设置起始值】
    - create table cc( id int auto_increment,name varchar(20),primary key(id) ) auto_increment=1000;
- 【设置已有字段自增长】 
    - alter table test MODIFY id INT UNSIGNED AUTO_INCREMENT;
- 【自增长的修改】 
    - alter table test auto_increment=10； 注意只能改的比当前的值大，不可以改的比当前小
- 【自增长字段溢出】
    - 设置自动增长的列，只能是int类型（包含了各种int），当出现了溢出就可以改成bigint 但是如果有外键约束，可能就会更改失败，还不如删库重建，实在太大了就删约束再建约束

#### 1.2【主键约束的修改】
alter table 表名  add constraint (PK_表名) primary key (j,k,l); 关于一些约束条件constraint好像没有起到作用比如 check
#### 1.3【修改表名】
rename table table1 to table2; 	切记不可随便修改表名，改了就要修改相应的 外键，触发器，函数，存储过程！！！
#### 1.4【定界符】
delimiter 任意字符除了转义字符：\
#### 1.5【已有表数据，新建表】
create table temp as select * from test;
#### 1.6【查看所有连接状态】
show processlist  如果是普通用户，只能查看自己当前的连接状态
#### 1.7【查看表的状态】
show table status like 'assitant' 可以看到当前自动增长的id当前值 dev.mysql.com/downloads/mysql/#downloads

*****
#### 1.8【关于时间 】
##### 1.8.1【常用函数】
- **NOW()**函数以 'YYYY-MM-DD HH:MM:SS' 返回当前的日期时间，可以直接存到**DATETIME**字段中。
- **CURDATE()**以’YYYY-MM-DD’的格式返回今天的日期，可以直接存到**DATE**字段中。
- **CURTIME()**以’HH:MM:SS’的格式返回当前的时间，可以直接存到**TIME**字段中。
   - 例：insert into tablename (fieldname) values (now())
   - insert into data values ('Myth','4','2016-03-10',curtime());//年月日，时间
   - select datediff(curdate(), date_sub(curdate(), interval i month)); 
- 一般函数是不能作为 default默认值的，使用只能在插入修改数据时使用
##### 1.8.2【获取当前时间与i个月之间的天数】
- 问题：假设当前是5月19 且（提前月份）i=1 就是计算从4月19到今天的天数
    - 解答：

```
      -- 时间格式的简单操作：
      select DATE_FORMAT(produceDate, '%Y') as yeahr from historybarcodesort
         where DATE_FORMAT(produceDate, '%Y')='2013'
      select date_format('1997-10-04 22:23:00','%y %M %b %D %W %a %Y-%m-%d %H:%i:%s %r %T');
          显示结果：97 October Oct 4th Saturday Sat 1997-10-04 22:23:00 10:23:00 PM 22:23:00
      -- 查询指定时间：
      get_date = "2006-12-07"
      SELECT count(*) FROM t_get_video_temp Where DATE_FORMAT(get_date, '%Y-%d')='2006-07';
      SELECT count(*) FROM t_get_video_temp Where get_date like '2006%-07%';
```
##### 1.8.3 【datetime 和 timestamp 区别】

```
      - 问题：为什么 5.5的环境下运行两句命令得到不同的结果（5.6不会有错误）
      -- 没错误
      creata table test1(one_time timestamp not null default current_timestamp,two_time timestamp);
      -- 报错：Incorrect table definition; there can be only one TIMESTAMP column with CURRENT_TIMESTAMP in DEFAULT or ON UPDATE clause
      create table test2(one_time timestamp,two_time timestamp not null default current_timestamp);
      或者 将timestamp 改成datetime 也不会有错，那么问题来了 区别是什么？
      -- 上面报错原因不明，大意是只能有一个timestamp的列有默认值
      
```

**DATETIME、DATE 和 TIMESTAMP 区别：**
- **DATETIME** 类型可用于需要同时包含日期和时间信息的值。MySQL 以 'YYYY-MM-DD HH:MM:SS' 格式检索与显示 DATETIME 类型。
    - 支持的范围是 '1000-01-01 00:00:00' 到 '9999-12-31 23:59:59'。
    - (“支持”的含义是，尽管更早的值可能工作，但不能保证他们均可以。)
- **DATE** 类型可用于需要一个日期值而不需要时间部分时。MySQL 以 'YYYY-MM-DD' 格式检索与显示 DATE 值。
    - 支持的范围是 '1000-01-01' 到 '9999-12-31'。

- **TIMESTAMP** 列类型提供了一种类型，通过它你可以以当前操作的日期和时间自动地标记 Insert 或Update 操作。
    - 如果一张表中有多个 TIMESTAMP 列，只有第一个被自动更新。


>“完整”TIMESTAMP格式是14位，但TIMESTAMP列也可以用更短的显示尺寸创造
最常见的显示尺寸是6、8、12、和14。
你可以在创建表时指定一个任意的显示尺寸，但是定义列长为0或比14大均会被强制定义为列长14
列长在从1～13范围的奇数值尺寸均被强制为下一个更大的偶数。

>列如：
定义字段长度 强制字段长度
TIMESTAMP(0) -> TIMESTAMP(14)
TIMESTAMP(15)-> TIMESTAMP(14)
TIMESTAMP(1) -> TIMESTAMP(2)
TIMESTAMP(5) -> TIMESTAMP(6)

>所有的TIMESTAMP列都有同样的存储大小，
使用被指定的时期时间值的完整精度（14位）存储合法的值不考虑显示尺寸。
不合法的日期，将会被强制为0存储


 **自动更新第一个 TIMESTAMP 列在下列任何条件下发生：**

- 列值没有明确地在一个 Insert 或 LOAD DATA INFILE 语句中被指定。

- 列值没有明确地在一个 Update 语句中被指定，并且其它的一些列值已发生改变。(注意，当一个 Update 设置一个列值为它原有值时，这将不会引起 TIMESTAMP 列的更新，因为，如果你设置一个列值为它当前值时，MySQL 为了效率为忽略更新。)

- 明确地以 NULL 设置 TIMESTAMP 列。
- 第一个列以外其它 TIMESTAMP 列，可以设置到当前的日期和时间，只要将该列赋值 NULL 或 NOW()。

- 任何 TIMESTAMP 列均可以被设置一个不同于当前操作日期与时间的值，这通过为该列明确指定一个你所期望的值来实现。这也适用于第一个 TIMESTAMP 列。这个选择性是很有用的，举例来说，当你希望 TIMESTAMP 列保存该记录行被新添加时的当前的日期和时间，但该值不再发生改变，无论以后是否对该记录行进行过更新：

- 当该记录行被建立时，让 MySQL 设置该列值。这将初始化该列为当前日期和时间。
以后当你对该记录行的其它列执行更新时，为 TIMESTAMP 列值明确地指定为它原来的值。

- 另一方面，你可能发现更容易的方法，使用 DATETIME 列，当新建记录行时以 NOW() 初始化该列，以后在对该记录行进行更新时不再处理它。

#### 1.9 【插入外码】
> alter table `Bookinfo` add constraint `F_N` foreign key `F_N`(`classno`) references `Bookclass`(`classno`) on delete cascade on update cascade;

## 2.【变量】
- 加了@ 的是用户变量， 限定当前用户，当前客户端， 在declare中声明的参数可以不加 @，那就是是局部变量
- 例如：declare a int ;  也可以直接就用不用声明，作为临时变量 例如这两种写法：
   - set @name =   expr;
	- select @name:= expr;
- 注意：MySQL中只有基本数据类型，没有Oracle中那个绑定类型：表类型或行类型，所以处理起来有点。。不如Oracle方便，不管是触发器还是存储过程
- set @a= select * from User；执行这句话就会报出 operand should contain 1 column(s)错误，就是说多值赋值的错误

## 3.【基本流程语法】
```
	if ... then 
	elseif ... then (注意elseif中间没有空格)
	end if;
```

## 4.【触发器】
### 4.1【创建单语句的触发器】
- CREATE TRIGGER ins_sum BEFORE INSERT ON account FOR EACH ROW SET @sum = @sum + NEW.amount;

- CREATE TRIGGER trigger_name trigger_time trigger_event ON tbl_name FOR EACH ROW trigger_stmt

### 4.2【创建多语句的触发器】
```
      CREATE TRIGGER trigger_name trigger_time trigger_event
          ON tbl_name FOR EACH ROW
      BEGIN
          .......
      END
```
### 4.3【NEW 和 OLD关键字】
- 使用OLD和NEW关键字，能够访问受触发程序影响的行中的列（OLD和NEW不区分大小写）。在INSERT触发程序中，仅能使用NEW.col_name，没有旧行。
- 在DELETE触发程序中，仅能使用OLD.col_name，没有新行。在UPDATE触发程序中，可以使用OLD.col_name来引用更新前的某一行的列，也能使用NEW.col_name来引用更新后的行中的列。
- 用OLD命名的列是只读的。你可以引用它，但不能更改它。对于用NEW命名的列，如果具有SELECT权限，可引用它。
- 在BEFORE触发程序中，如果你具有UPDATE权限，可使用“SET NEW.col_name = value”更改它的值。这意味着，
- 你可以使用触发程序来更改将要插入到新行中的值，或用于更新行的值。
- 在BEFORE触发程序中，AUTO_INCREMENT列的NEW值为0，不是实际插入新记录时将自动生成的序列号。

## 5.【存储过程】
### 基本结构示例：
```
       【loop】 要有iterate 和leave才是完整的
        CREATE PROCEDURE doiterate(p1 INT)
      BEGIN
        label1: LOOP
          SET p1 = p1 + 1;
          IF p1 < 10 THEN ITERATE label1; END IF;
          LEAVE label1;
        END LOOP label1;
        SET @x = p1;
      END
      
      call doiterate(7);
      select @x;
```


## 6. 【函数】
### 【简单示例】

```
      ---函数部分,修改定界符 
      delimiter //
      CREATE FUNCTION hello (s CHAR(20)) RETURNS CHAR(50)
       RETURN CONCAT('Hello, ',s,'!');
      //
      --将定界符改回来，是第二句SQL语句
      delimiter ;
      
      select hello('Myth ');
      drop function hello;

-- 函数
		create function fun_test(var1 int,var2 varchar(16)) returns int
		begin 
		   declare temp int;
		   select count(*) into temp from test;
		   return temp;
		end;

select fun_test(8,'d');
```
## 7.【异常】

## 8.【用户管理】
> [参考博客](http://www.cnblogs.com/fslnet/p/3143344.html)

### 查看
- 查询用户信息 `select host,user,password from user ;`
- 查看权限 `show grants for zx_root;`

### 创建
> 创建本地超级用户： CREATE USER 'myth'@'localhost' IDENTIFIED BY 'ad'; 

> 授予所有权限 GRANT all privileges  ON *.* TO 'myth'@'localhost';

> 创建远程访问指定数据库用户 ： CREATE USER 'myth'@'%' IDENTIFIED BY 'ad'; 

> 授予数据库db的所有权限 GRANT all privileges  ON db.* TO 'myth'@'%';

- 创建用户 `CREATE USER 'username'@'host' IDENTIFIED BY 'password';`
- 设置密码 `SET PASSWORD FOR 'username'@'%' = PASSWORD("123456");`
    - 修改密码也是这个语句注意的是要  `flush privileges;`
- 删除用户 `drop user 'username'@'host'`
    - 如果服务器需要远程访问 修改配置文件`/etc/mysql/mysql.conf.d/mysqld.cnf`，注释掉 bind_address 一行
```
    %            匹配所有主机
    localhost    localhost不会被解析成IP地址，直接通过UNIXsocket连接
    127.0.0.1    会通过TCP/IP协议连接，并且只能在本机访问；
    ::1          ::1就是兼容支持ipv6的，表示同ipv4的127.0.0.1
```
### 修改
- 修改名字：`rename   user  feng  to   newuser；`

### 【授权】
- grant all privileges  ON databasename.tablename TO 'username'@'host' 
    - all privileges 所有权限
    - alter | alter routine
    - create | create routine | create temporary table | create user | create view
    - delete | drop
    - execute | file
    - index | insert
    - lock table | process | reload
    - replication | client | replication slave
    - select | show databases | show view
    - shutdown | super
    - update | usage
- revoke 回收权限用法和grant一样

- 刷新权限缓存 `flush privileges;`

*************************

## mysql命令行参数
```
Usage: mysql [OPTIONS] [database] //命令方式
  -?, --help //显示帮助信息并退出
  -I, --help //显示帮助信息并退出
  --auto-rehash //自动补全功能，就像linux里面，按Tab键出提示差不多，下面有例子

  -A, --no-auto-rehash //默认状态是没有自动补全功能的。-A就是不要自动补全功能
  -B, --batch //ysql不使用历史文件，禁用交互
  (Enables --silent)
  --character-sets-dir=name //字体集的安装目录 
  --default-character-set=name //设置数据库的默认字符集
  -C, --compress //在客户端和服务器端传递信息时使用压缩
  -#, --debug[=#] //bug调用功能
  -D, --database=name //使用哪个数据库
  --delimiter=name //mysql默认命令结束符是分号，下面有例子
  -e, --execute=name //执行mysql的sql语句
  -E, --vertical //垂直打印查询输出
  -f, --force //如果有错误跳过去，继续执行下面的
  -G, --named-commands
  /*Enable named commands. Named commands mean this program's
  internal commands; see mysql> help . When enabled, the
  named commands can be used from any line of the query,
  otherwise only from the first line, before an enter.
  Disable with --disable-named-commands. This option is
  disabled by default.*/
  -g, --no-named-commands
  /*Named commands are disabled. Use \* form only, or use
  named commands only in the beginning of a line ending
  with a semicolon (;) Since version 10.9 the client now
  starts with this option ENABLED by default! Disable with
  '-G'. Long format commands still work from the first
  line. WARNING: option deprecated; use
  --disable-named-commands instead.*/
  -i, --ignore-spaces //忽视函数名后面的空格.
  --local-infile //启动/禁用 LOAD DATA LOCAL INFILE.
  -b, --no-beep //sql错误时，禁止嘟的一声
  -h, --host=name //设置连接的服务器名或者Ip
  -H, --html //以html的方式输出
  -X, --xml //以xml的方式输出
  --line-numbers //显示错误的行号
  -L, --skip-line-numbers //忽略错误的行号
  -n, --unbuffered //每执行一次sql后，刷新缓存
  --column-names //查寻时显示列信息，默认是加上的
  -N, --skip-column-names //不显示列信息
  -O, --set-variable=name //设置变量用法是--set-variable=var_name=var_value
  --sigint-ignore //忽视SIGINT符号(登录退出时Control-C的结果)
  -o, --one-database //忽视除了为命令行中命名的默认数据库的语句。可以帮跳过日志中的其它数据库的更新。
  --pager[=name] //使用分页器来显示查询输出，这个要在linux可以用more,less等。
  --no-pager //不使用分页器来显示查询输出。
  -p, --password[=name] //输入密码
  -P, --port=# //设置端口
  --prompt=name //设置mysql提示符
  --protocol=name //使用什么协议
  -q, --quick //不缓存查询的结果，顺序打印每一行。如果输出被挂起，服务器会慢下来，mysql不使用历史文件。
  -r, --raw //写列的值而不转义转换。通常结合--batch选项使用。
  --reconnect //如果与服务器之间的连接断开，自动尝试重新连接。禁止重新连接，使用--disable-reconnect。
  -s, --silent //一行一行输出，中间有tab分隔
  -S, --socket=name //连接服务器的sockey文件
  --ssl //激活ssl连接，不激活--skip-ssl
  --ssl-ca=name //CA证书
  --ssl-capath=name //CA路径
  --ssl-cert=name //X509 证书
  --ssl-cipher=name //SSL cipher to use (implies --ssl).
  --ssl-key=name //X509 密钥名
  --ssl-verify-server-cert //连接时审核服务器的证书
  -t, --table //以表格的形势输出
  --tee=name //将输出拷贝添加到给定的文件中，禁时用--disable-tee
  --no-tee //根--disable-tee功能一样
  -u, --user=name //用户名
  -U, --safe-updates //Only allow UPDATE and DELETE that uses keys.
  -U, --i-am-a-dummy //Synonym for option --safe-updates, -U.
  -v, --verbose //输出mysql执行的语句
  -V, --version //版本信息
  -w, --wait //服务器down后，等待到重起的时间
  --connect_timeout=# //连接前要等待的时间
  --max_allowed_packet=# //服务器接收／发送包的最大长度
  --net_buffer_length=# //TCP / IP和套接字通信缓冲区大小。
  --select_limit=# //使用--safe-updates时SELECT语句的自动限制
  --max_join_size=# //使用--safe-updates时联接中的行的自动限制
  --secure-auth //拒绝用(pre-4.1.1)的方式连接到数据库
  --server-arg=name //Send embedded server this as a parameter.
  --show-warnings //显示警告
```

## mysql命令行实例

1，auto-rehash自动补全

说例子前，先说一下，你到google或baidu上面搜一下mysql auto-rehash，然后会出来结果，绝大部分都是一样的，并且内容里面有明显错误。
mysqld_safe –user=mysql –auto-rehash &，这个根本就不对，为什么抄袭的人不知道自己测试一下，对于这种人，我也是很无语的。你自己写着玩到也无所谓，但是你会害人的。

`[root@BlackGhost zhangy]# mysqld_safe –help |grep rehash`
参数选项中根本没有auto-rehash
二种方法可以实现自动补全功能
```
    －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    [mysql]
    #no-auto-rehash
    auto-rehash
    －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    mysql -u root –auto-rehash
    －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－ 
```
mysql> use test
  Database changed
mysql> select acc //这里自动补全，只是提示表名，和表里面的字段名，不像php可以提示函数名
  account account.acct_num account.amount acct_num2，－B的用法

`D:\xampp\mysql\bin>mysql.exe -uroot -D bak_test -e "show tables;" -B`
Tables_in_bak_test
comment
user3，－E的用法

`D:\xampp\mysql\bin>mysql.exe -uroot bak_test -e "show tables;" -E`
*************************** 1. row ***************************
Tables_in_bak_test: comment
*************************** 2. row ***************************
Tables_in_bak_test: user4，－D的用法

`[root@BlackGhost zhangy]# mysql -u root -D test `进入后默认就在test数据库里面，不要用use test;

5，–default-character-set设置默认字符集
`[root@BlackGhost zhangy]# mysql -u root -D test --default-character-set=utf86`，–delimiter设置mysql命令结束符
`[root@BlackGhost zhangy]# mysql -u root -D test --delimiter=\|mysql` 默认的命令结束符是分号，现在把它设置成竖杠，要注意｜前面的\
7，-e的用法
`D:\xampp\mysql\bin>mysql.exe -uroot -D bak_test -e "show tables;"`
这个很有用的，因为我不用进入mysql客户里面去，就能把我要的数据取出来，这个可以配合shell脚本的话，能发挥很大的功能

8，-f的用法
`D:\xampp\mysql\bin>mysql.exe -uroot bak_test -e "show databaseds;show tables;" -f`
ERROR 1064 (42000) at line 1: You have an error in your SQL syntax; check the ma
nual that corresponds to your MySQL server version for the right syntax to use n
ear 'databaseds' at line 1
+--------------------+
| Tables_in_bak_test |
+--------------------+
| comment |
| user |
+--------------------+
忽略mysql的错误，继续向下执行

9，-N的用法
`D:\xampp\mysql\bin>mysql.exe -uroot bak_test -e "select * from user" -N`
+---+------+---+
| 1 | bb | 0 |
| 2 | tank | 0 |
+---+------+---+10，-p的用法
`[root@BlackGhost zhangy]# mysql -u root -o test -p -S /tmp/mysql.sock`
Enter password11，-h的用法
`[root@BlackGhost zhangy]# mysql -u root -h 192.168.1.102` 服务器可能不只一个，这个时间我们可以用-h来指定连接哪里

12，-H的用法
`D:\xampp\mysql\bin>mysql.exe -uroot bak_test -e "show tables " -H`
<TABLE BORDER=1><TR><TH>Tables_in_bak_test</TH></TR><TR><TD>comment</TD></TR><TR
><TD>user</TD></TR></TABLE>13，-X的用法

D:\xampp\mysql\bin>mysql.exe -uroot bak_test -e "show tables " -X
<?xml version="1.0"?> 

<resultset statement="show tables
" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <row>
  <field name="Tables_in_bak_test">comment</field>
  </row> 

  <row>
  <field name="Tables_in_bak_test">user</field>
  </row>
</resultset>
14，–prompt的用法
`[root@BlackGhost zhangy]# mysql -u root --prompt=\^\_\^`
^_^show databases;
+--------------------+
| Database |
+--------------------+
| information_schema |
| biztojie |mysql的提示符，我把它设置成笑脸了。

15，-S的用法
`[root@BlackGhost zhangy]# mysql -u root -D test -S /tmp/mysql.sock`
当我们一台服务器启动了二个不同mysql版本的时候，存放socket的文件是不能一样的，－S用来指定连接到那个

16，-v的用法
`[root@BlackGhost zhangy]# mysql -u root -D test -e "show tables;" -v`
--------------
show tables
--------------内容不止这么点，只说重点

17，-P的用法
`[root@BlackGhost zhangy]# mysql -u root -o test -P 13306 -S /tmp/mysql.sock`
***************

tee output.txt 保存运行结果到文件
Logging to file 'output.txt'同上
如果select出来的结果集超过几个屏幕，那么前面的结果一晃而过无法看到。
使用pager可以设置调用os的more或者less等显示查询结果，
和在os中使用more或者less查看大文件的效果一样。
 pager more或者
PAGER set to ‘more’
字符编码
show full fields from tableName;show create table TableName 来检查当前表中字段的字符集设置。
set name 'gbk';同时修改 character_set_client,character_set_connection,character_set_results
 set names 'gbk';
  java.util.Properties prop = new java.util.Properties();
       prop.put( " charSet " , " Big5 " );
       prop.put( " user " , username);
       prop.put( " password " , password);

       // Connect to the database 
       con = DriverManager.getConnection(url, prop);
存储过程参数乱码create procedure t ( aa char(10) charset 'gbk')

设置方法2{
设置为gbk即可.可以写一个my.ini来自动设置:
在Windows的系统安装目录下 (如：C:\WINDOWS\my.ini) 新建一个“my.ini”文件，注意后缀名是“ini”。内容如下：
[WinMySQLAdmin]
Server=c:/apps/mysql/bin/mysqld-nt.exe
[mysqld]
basedir=c:/apps/mysql
datadir=c:/dev/mysql data/data
default-character-set=gbk
[client]
default-character-set=gbk
上面“Server”指向MySQL的执行主程序，“basedir”指向MySQL的安装目录，“datadir”指向MySQL的数据存放目录（因为我改变了它，所以需要特别指定），
设置”default-charseter-set=gbk”是为了支持默认为中文。然后把“c:\apps\mysql\bin”追加到“环境变量”的“path”变量中 。 
}

    将原来的数据连接:
<property name="connection.url">
    jdbc:mysql://localhost:3306/db
</property>
    修改成:
<property name="connection.url">
    <![CDATA[jdbc:mysql://localhost:3306/db?useUnicode=true&characterEncoding=utf-8]]>
</property>
 注意，在将连接字符串放到CDATA中，因为&是XML中的转义字符。不然会提示错误:
    Error parsing XML: /hibernate.cfg.xml(12) The reference to entity "characterEncoding" must end with the ';' delimiter.
    也可以直接把&修改为&amp; 
    即: jdbc:mysql://localhost:3306/db?useUnicode=true&amp;characterEncoding=utf-8

### 常用五类约束
not null：非空约束，指定某列不为空 
unique： 唯一约束，指定某列和几列组合的数据不能重复 
primary key：主键约束，指定某列的数据不能重复、唯一 
foreign key：外键，指定该列记录属于主表中的一条记录，参照另一条数据 
check：检查，指定一个表达式，用于检验指定数据 
注意： MySQL不支持check约束，但可以使用check约束，而没有任何效果；  

### mysql正确卸载
删除数据文件夹，删除安装文件夹，删除c盘下的programData下的文件夹。
命令行窗口输入和显示中文乱码:
改my.ini，defauslt- chdaracter -set=gbk
null与其他值做运算结果是null,开发中把null作为零处理，用函数ifnull（english，0）处理。

### 数据类型
字符：char,varchar
小数：dec,decimal,float,double,
整数：bigint, int,mediumint,smallint,tinyint,integer
布尔：bit,boolean
二进制数据：blob（4G最多）,longblob,mediumblob,tinyblob,varbinary,binary
文本：text,longtext,mediumtext,tinytext,
日期：date,time,timestamp,datetime
	
### 常见函数
like ‘关_’ like%分别匹配一个或者多个字。
not取反
is null;is not null
between and 还有in(,)都包括=
order by asc desc默认asc升序。也可以使用order by +别名
select count(name) 
select sum(english)
select avg(math) 
select max(math)
select name ,sum(price) from products groutp by name[having price> [200] having是过滤操作
select form talbe where groutp by having order by asc desc

内连接，用于关联列有关联的表。
select * from emp join dept  on emp.id_dept=dept.id;消除笛卡尔积。这是显式内连接效果等于下句。
select * from emp ,dept where emp.id_dept=dept.id;这是隐式内连接。效果等于上句。

外连接，相反。
mysql不支持全外连接。
左外连接：select * from emp left outer join dept on emp.id_dept=dept.id;
区分左外还是右外连接的写法。可以看left/right outer join 的左边或右边的表名。

设置环境变量。一般,访问mysql数据库时，首先需要使用telnet远程登录安装数据库系统的服务器，然后再进入mysql数据库
运行：mysql -h110.110.110.110 -u -p 数据库名；hostname为装有mysql数据库的服务器名称		||mysql -hlocalhost -uroot -p
终止:\q   quit  exit
指定数据库：use student;
执行外部文件：source a.txt
查看指定数据库的定义信息： show create database mydb;

查字符集：show variables like '%char%'
查看数据库引擎：show engines;
查看默认引擎：show variables like '%storage_engine%';
查用户：select user();
查数据库：show databases;
查当前数据库：select database();
查表：show tables;
查看当前表引擎：show create table a;
查字段和 select name,math+enlish+chinese  from score; 

结果列别名：select name as newName,(math+enlish+chinese) as total  from score;as可省略

去重复查询：select distinct name from student;
查建表信息：show create table student;
查表明细：show table status from student;
描述表：describe class;		||desc class;		||show columns from class;
查索引：show index from class;
查数据：select * from class order by id limit 0,2;  查看排序最前的两行数据
查触发器：SELECT * FROM information_schema.`TRIGGERS`;
查约束：SELECT * FROM information_schema.`TABLE_CONSTRAINTS`;
	SELECT  CONSTRAINT_CATALOG,  CONSTRAINT_SCHEMA,  CONSTRAINT_NAME,  TABLE_SCHEMA,  TABLE_NAME,  CONSTRAINT_TYPE 
	FROM  information_schema.TABLE_CONSTRAINTS 
 	WHERE  TABLE_NAME='t_org';

主键表主键值被外键表参照时，主键表记录不允许被删除。
? ON DELETE CASCADE： 指当主键表中的行被删除时，
外键表中相依赖的行也将被级联删除。
? ON DELETE SET NULL： 当主键表中的行被删除时，
把涉及到外键表的外键值设置为空。


增数据库：create database student;
增数据库并设置字符集：create database student character set utf8;
增临时表 temporary
复制表：create table class2 select ...(不复制主键、自增等属性);||	create table class2 like class;	(完全复制) 
增表：create table class(id int(9) auto_increment  primary key ,
				name char(20) not null ,
				birthday date default 19870218,
				constraint c1 unique(name,id));
增列：alter table class add column sex char(4) default 'man' first   /after ...;
增约束：alter table class add unique(name);
增主键:alter table class add primary key(id);
	alter table class add constraint 主键 primary key 表名(主键字段)
增外键：alter table student add foreign key(classes_name, classes_number) references classes(name, number) ;
	alter table class add constraint c1 foreign key 从表(字段) references 主表(字段) [on delete cascade];
增数据：insert into class set name='';		||insert into class (,) values(,),(,);	//字符中包含引用标志时用\。
增重复数据：insert LOW_PRIORITY | DELAYED | HIGH_PRIORITY] into class...	
		||insert into class values ... on duplicate key update name=''...	
		||replace into...
增索引：alter table class add index(name);	||alter table class add fulltext index (hisBlog);
增索引：create index i on class(id(10));在id列的头10个数据建立索引。	||create index ii on class(hisWords(10));以前10字为索引关键字
增本地用户：grant all privileges on student.* to newUser@localhost identified by '123456';
增特定地址登陆用户：grant select on student.* to custom@weiqiong.com identified by '123456';
增任意登陆的超级用户：grant all privileges on *.* to newUser@"%" identified by '' with grant option;
导入数据：load data local infile 'c:\\a.sql' into table class;		||source a.sql;	（数据要顶行，null代表空，tab代表列之间的间隔）


更改为 SkillID 和 SkillName 列的组合，必须首先删除已创建的主键，然后添加新的主键：

改引擎：alter table a engine=innodb;
该数据库字符集：alter database db character set utf8;
改字符集：set character_set_database=gbk；	||mysql --default-character-set=gbk -uname -p;
改密码：set password for administer =password("123456");
改表名：rename table class to class1;||	alter table class rename （to） classes;
改表型 ：alter table class type=innoDB;
改列型、属性：alter table class modify/change name newName int unsigned/null/not null/unique/primary key+auto_increment default 'man'

改数据：update class set age=100 where age=21;	



删除外键先把包含外键的那个表中的外键全部删掉，置为null，或者直接将那列删掉，这样就没有地方引用这些外键
删列：alter table class drop column sex;
删主键：alter table class drop primary key;
删外键：alter table class drop foreign key 外键;
删索引：alter table class drop index i;		||drop index i on class;
删数据：delete from class where id=01245;
删全部：delete * from class;	||truncate table class;	//后者重建表，速度快，清零auto_increment,但事务不安全
删表：drop table if exists class;
删数据库：drop database student;	||drop database if exists student;
删用户：revoke all privileges on *.* from userName@"%"	->use mysql	->delete from user where User='newUser' and host="%";	
	->flush privileges;
删除约束：alter table class drop constraint c1;

外键约束是保证一个或两个表之间的参照完整性，外键是构建于一个表的两个字段或是两个表的两个字段之间的参照关系。 
也就是说从表的外键值必须在主表中能找到或者为空。 当主表的记录被从表参照时，主表的记录将不允许删除，如果要删除数据，需要先删除从表中依赖该记录的数据，
然后才可以删除主表的数据。还有一种就是级联删除子表数据。
注意：
	外键约束的参照列，在主表中引用的只能是主键或唯一键约束的列，假定引用的主表列不是唯一的记录， 那么从表引用的数据就不确定记录的位置。
	同一个表可以有多个外键约束。通常先建主表，然后再建从表，这样从表的参照引用的表才存在。

主表 create table classes( id int auto_increment primary key,name varchar(20) ); 
从表 create table student( id int auto_increment,name varchar(22), constraint pk_id primary key(id),classes_id int references classes(id));   

create table student( id int auto_increment primary key, name varchar(25),classes_id int,foreign key(classes_id) references classes(id) ); 
上面的创建外键的方法没有指定约束名称，系统会默认给外键约束分配外键约束名称，命名为student_ibfk_n， 其中student是表名，n是当前约束从1开始的整数。  
指定约束名称： 
create table student(  id int auto_increment primary key,name varchar(25), classes_id int,constraint fk_classes_id foreign key(classes_id) references classes(id) [on delete cascade]);   
多列外键组合，必须用表级别约束语法： 
create table student(id int auto_increment primary key, name varchar(20),classes_name varchar(20),classes_number int,                
foreign key(classes_name, classes_number) references classes(name, number));   
  
自引用、自关联（递归表、树状表） 
create table tree(id int auto_increment primary key,name varchar(50),  parent_id int, foreign key(parent_id) references tree(id) );   
级联删除：删除主表的数据时，关联的从表数据也删除，则需要在建立外键约束的后面增加on delete cascade 或on delete set null，前者是级联删除，后者是将从表的关联列的值设置为null。
create table student(         
id int auto_increment primary key,         
name varchar(20),         
classes_name varchar(20),         
classes_number int,         /*表级别联合外键*/         
foreign key(classes_name, classes_number) references classes(name, number) on delete cascade
);  

区分大小写的比较关键字是binary.
放弃之前的语句：\c

（var）char最大长度为255，char数据类型的处理速度更快，有时甚至可以超出varchar处理速度的50%。
int 4个字节，- 2147483647 到2147483648。unsigned类型0-4294967295
float (4,2)
text/blob 255-65535 后者大小写敏感
mysql语句不区分大小写。
存储过程格式如下：
delimiter //
create procedure sam2()
begin
update class set birthday=19530302;
end//
delimiter ;
er ;
