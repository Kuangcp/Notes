# 1.mysql常用命令集合

### 1.1【自增长】
- 【创建表时设置自增长，并设置起始值】
- create table cc(id int auto_increment,name varchar(20),primary key(id)) auto_increment=1000;
- 【设置已有字段自增长】 
- alter table test MODIFY id INT UNSIGNED AUTO_INCREMENT;
- 【自增长的修改】  
- alter table test auto_increment=10； 注意只能改的比当前的值大，不可以改的比当前小
- 【自增长字段溢出】
- 设置自动增长的列，只能是int类型（包含了各种int），当出现了溢出就可以改成bigint 但是如果有外键约束，可能就会更改失败，还不如删库重建，实在太大了就删约束再建约束

### 1.2【主键约束的修改】
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
#### 1.8【关于时间 】
##### 1.8.1【常用函数】
- NOW()函数以 'YYYY-MM-DD HH:MM:SS' 返回当前的日期时间，可以直接存到DATETIME    字   段中。
- CURDATE()以’YYYY-MM-DD’的格式返回今天的日期，可以直接存到DATE字段中。
- CURTIME()以’HH:MM:SS’的格式返回当前的时间，可以直接存到TIME字段中。
- 例：insert into tablename (fieldname) values (now())
- insert into data values ('Myth','4','2016-03-10',curtime());//年月日，时间
- select datediff(curdate(), date_sub(curdate(), interval i month)); 

##### 1.8.2【获取当前时间与i个月之间的天数 】
- i>0 是以前的日期，假设当前是5月19 且i=1 就是算4月19到今天的天数
- MYSQL 截取日期格式　年,月,日
- select DATE_FORMAT(produceDate, '%Y') as yeahr from historybarcodesort where DATE_FORMAT(produceDate, '%Y')='2013'
- select date_format('1997-10-04 22:23:00','%y %M %b %D %W %a %Y-%m-%d %H:%i:%s %r %T');
   - 结果：97 October Oct 4th Saturday Sat 1997-10-04 22:23:00 10:23:00 PM 22:23:00
- get_date = "2006-12-07"
- SELECT count(*) FROM t_get_video_temp Where DATE_FORMAT(get_date, '%Y-%d')='2006-07';
- SELECT count(*) FROM t_get_video_temp Where get_date like '2006%-07%';

##### 1.8.3 【datetime 和 timestamp 区别】
- 问题

#### 1.9 【插入外码】
- alter table `Bookinfo` add constraint `F_N` foreign key `F_N`(`classno`) references `Bookclass`(`classno`) on delete cascade on update cascade;

## 2.【变量】
- 加了@ 的是用户变量， 限定当前用户，当前客户端， 在declare中声明的参数可以不加 @，那就是是局部变量
- 例如：declare a int ;  也可以直接就用不用声明，作为临时变量 例如这两种写法：
   - set @name =   expr;
	- select @name:= expr;
- 注意：MySQL中只有基本数据类型，没有Oracle中那个绑定类型：表类型或行类型，所以处理起来有点。。不如Oracle方便，不管是触发器还是存储过程
- set @a= select * from User；执行这句话就会报出 operand should contain 1 column(s)错误，就是说多值赋值的错误

## 3.【基本流程语法】

	if ... then 
	elseif ... then (注意elseif中间没有空格)
	end if;


## 4.【触发器】
#### 4.1【创建单语句的触发器】
- CREATE TRIGGER ins_sum BEFORE INSERT ON account FOR EACH ROW SET @sum = @sum + NEW.amount;

- CREATE TRIGGER trigger_name trigger_time trigger_event ON tbl_name FOR EACH ROW trigger_stmt

#### 4.2【创建多语句的触发器】
---
      CREATE TRIGGER trigger_name trigger_time trigger_event
          ON tbl_name FOR EACH ROW
      BEGIN
          .......
      END
---
#### 4.3【NEW 和 OLD关键字】
- 使用OLD和NEW关键字，能够访问受触发程序影响的行中的列（OLD和NEW不区分大小写）。在INSERT触发程序中，仅能使用NEW.col_name，没有旧行。
- 在DELETE触发程序中，仅能使用OLD.col_name，没有新行。在UPDATE触发程序中，可以使用OLD.col_name来引用更新前的某一行的列，也能使用NEW.col_name来引用更新后的行中的列。
- 用OLD命名的列是只读的。你可以引用它，但不能更改它。对于用NEW命名的列，如果具有SELECT权限，可引用它。
- 在BEFORE触发程序中，如果你具有UPDATE权限，可使用“SET NEW.col_name = value”更改它的值。这意味着，
- 你可以使用触发程序来更改将要插入到新行中的值，或用于更新行的值。
- 在BEFORE触发程序中，AUTO_INCREMENT列的NEW值为0，不是实际插入新记录时将自动生成的序列号。

## 5.【存储过程】
#### 基本结构示例：
---
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
---


## 6. 【函数】
##### 【简单示例】

---
      ---函数部分,修改定界符 
      delimiter //
      CREATE FUNCTION hello (s CHAR(20)) RETURNS CHAR(50)
       RETURN CONCAT('Hello, ',s,'!');
      //
      --将定界符改回来，是第二句SQL语句
      delimiter ;
      
      select hello('Myth ');
      drop function hello;
---

## 7.【异常】

## 8.【用户管理】
### 【创建用户】
- CREATE USER 'username'@'host' IDENTIFIED BY 'password'; 
    - 改密: SET PASSWORD FOR 'username'@'%' = PASSWORD("123456"); 
    - 删除: drop user 'username'@'host'
- 注意： host是比较重要的如果写了localhost就只能本地登录，% 就是任意
### 【授权】
- GRANT select  ON databasename.tablename TO 'username'@'host' 
    - alter
    - alter routine
    - create
    - create routine
    - create temporary table
    - create user
    - create view
    - delete 
    - drop
    - execute
    - file
    - index
    - insert
    - lock table
    - process
    - reload
    - replication
    - client
    - replication slave
    - select 
    - show databases
    - show view
    - shutdown
    - super
    - update
    - usage

### 
