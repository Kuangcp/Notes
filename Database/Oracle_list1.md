`目录 start`
 

`目录 end` *目录创建于2018-01-14*
****************************************
`目录`

*目录创建于2017-12-18*
用斜杠/或者用  ;  号   执行  但是；感觉反应更快
show parameter instance_name   查看当前数据库的SID
【创建用户】
create tablespace myth_data datafile 'D:\myth\a.dbf' size 50m autoextend on next 50m maxsize 2048m[extent management local;]
create user myth idenitfied by ad default tablespace myth_data;
grant connect,resource,dba to myth;

【sqlplus】
	sys as sysdba
	密码
	或： 
	先使用 myth ad 连接上
	再以管理员身份连接 ：conn  as sysdba

alert session set NLS_DATE_FORMAT='yyyy-mm-dd';本次会话范围内（全局范围是global）设置日期格式

set linesize 120;设置命令行界面每行显示120个字符
set pagesize 20;设置每20行作为一个显示表
col ename for a8;设置字段显示8个字符
col payment for 9999;设置字段显示4位数字
如果集合中含有null,不能使用not in，但可以使用in。
select sal*12+nvl(bonus,0);空值问题：查询年收入（月薪*12+奖金）

====================================================================================================
多列排序,先排sal
select sal ，deptno from emp order by sal,deptno desc；

order by用表达式
select *.... order by sal*12;

按别名排序
select sal*12 年薪 from emp order by 年薪; 

按列名顺序值排序
select（distinct） ename, sal*12 from emp order by 2;

对可能空值的列排序，不为null的行前置
select sal from emp order by sal nulls last；

select * from v$nls_parameters;查询数据库默认设置
oracle默认日期格式：dd-mm月-yyyy
select * from emp where ename like 'S%';查询出名字是S开头的员工
select * from emp where ename like ‘__’;查询出名字是2个字的员工

select * from emp where ename like '%\_%' escape '\'; 查询名字中包含_的员工。用\将_转义
select 字段名 优先于 * ，可提高性能。

a  desc; a命令是往上次命令append追加desc命令，a后需要至少2个空格，确保append后形成的语句间隔了至少一个空格以形成合法格式
order by pay asc/desc
where condition1 and condition2 ..; oracle逻辑判断是从右向左的顺序。
rollback；撤销上步操作
spool c:\aa.txt
oracle数据赋值使用:=

========================PL/SQL============================
set serveroutput on   设置后才可以看到输出
dbms_output.put_line();  输出语句
执行要用   /   执行


oracle 里面的case结构特殊：
	case 语句是会自动跳出的，不会执行后面的case语句
	不像C语言是要加break才能跳出

====================解锁账户以及设立密码===========
alter user hr account unlock;
 alter user hr identified by hr;

 创建用户并授权:
   create user myth identified by ad
    grant connect,resource,dba,sysdba to myth

=====记录==========================
spool  路径
spool off
=====查询当前状态，要使用系统用户连接========
select status from v$instance;
==输出格式调整========================
col 表 for a10
col 列 format 999

==查看所有数据文件===================
select name from v$datafile

==查看成员===========
select group#,members from v$log
==查看控制文件========
select group#,member from v$controlfile
==连接至数据库管理员======
conn /as sysdba
==关闭数据库==========
shut immediate

==连接至 nomount    可以恢复控制文件=========
startup nomount
select instance_name,status from v$instance;
==连接至mount 控制文件上线      可以用日志文件进行恢复
alter database mount
==数据文件上线open  可以查询数据库的表
alter database open


可以直接选择全部忽略，不影响db的使用。
Oracle执行先决条件检查是依赖c$共享，通常为了安全默认都关闭了这个，所以导致检查不通过。
打开方法很简单，确保“服务”里的Server服务正常运行，然后在CMD命令控制台里输入
net share c$=c:
即可

alter table exer_student add constraint P_F foreign key (cno) references exer_class(cno)


SQL> create table exer_class(cno number(2), constraint tu primary key(cno));

表已创建。

SQL> alter table exer_student add constraint hh foreign key(cno) references exer_class(cno);
alter table exer_student add constraint hh foreign key(cno) references exer_class(cno)
                                        *
第 1 行出现错误:
ORA-02298: 无法验证 (MYTH.HH) - 未找到父项关键字  
====最终解决方法是重新创建一个表空间，基于该表空间创建用户，再创建表就没错了===
==虽然已经解决，但是不知道为什么会这样


SQL> desc eser_class;
ERROR:
ORA-04043: 对象 eser_class 不存在


SQL> desc exer_class;
 名称                                      是否为空? 类型
 ----------------------------------------- -------- ----------------------------
 CNO                                       NOT NULL NUMBER(2)

SQL> shut immediate;
ORA-01031: 权限不足
SQL> conn as sysdba
请输入用户名:  3
输入口令:
已连接。
SQL> shut immediate;
数据库已经关闭。
已经卸载数据库。
ORACLE 例程已经关闭。

+++++++++++++++++++++++有关使用的细节++++++++

===================插入表
insert all 
   when dept=10 then into emp10
   when dept=20 then into emp20
   when dept=30 then into emp30
   when dept=40 then into emp_other
   when salary<2000 then into lowsal
   when salary>4000 then into highsal
   else into middlesal
   select * from employees;
    只能有一个else 而且else后面就应该接上select语句
--个人理解这个else是不满足上面所有when的那种情况，即 不是10 20 30 40 部门号
--并且2000到4000中间的工资  事实上猜测是正确的

===========插入时间======
分为Date 和timestamp类型
前者是年月日时分秒
后者可以精确到小数秒位数自己指定 例如：timestamp(4)

to_date('2010-02-02 13:45:32','yyyy-mm-dd hh24:mi:ss')
to_date('2010-02-05','yyyy-mm-dd')

==================绑定变量=============
         感觉相当于Java中preparements 的那个Set ？ 机制是一样的用变量来插入SQL语句再执行
    简单使用：
variable i number;  声明一个变量
exec :i :=1;  给变量赋值
select * from tudent where id=:i;  使用这个绑定变量

=================事务操作===============
设立保存点：savepoint A;
回滚：rollback to A; 或者回滚所有操作 rollback;

注意 ： 一旦commit，会话注销，保存点是会失效的，所以不能做回退操作

=======================================【知识点概览】==================================================
修改列名Oracle：alter table bbb rename column nnnnn to hh int;
修改列名SQLServer：exec sp_rename't_student.name','nn','column';


查约束：SELECT constraint_name, table_name, r_owner, r_constraint_name FROM all_constraints WHERE table_name = 'table_name' and owner = 'owner_name'; 


--注释
dml操作才可以回滚，ddl自动隐士提交，监听器监听连接请求。rownum用来做分页查询。between ...and ..包括等于.varchar2必须指定长度，没有默认长度。where不能用分组函数如avg等。清除数据时，truncate比delete效率高很多。

Select列表中的表达式列需要给定别名，如果没有别名会产生错误
非空约束只能为行级约束，其他约束可以为表级约束。
外键：constraint con3 foreign key(id) references teacher(id)
sqlplus登陆数据库：用户名：sys 口令：open 主机字符串：oracle1 as sysdba
命令行登陆数据库:sqlplus sys/open as sysdba
用名为dual的表（dual意为空）进行数学运算操作。
sql>conn system/manager; 
sql>conn scott/tiger; 
exit 退出
to_char(sal,'999,999.00')	格式化数据
select to_char(hiredate,'mm"月"/yyyy"年"') from emp;
linesize  show linesize(默认80)       set  linesize  120
pagesize  show pagesize(默认14)       set  pagesize  5

创建用户
　　三 、3种标准角色 
　　Qracle为了兼容以前的版本，提供了三种标准的角色(role)：CONNECT、RESOURCE和DBA。 
　　1. CONNECT Role(连接角色) 
　　临时用户，特别是那些不需要建表的用户，通常只赋予他们CONNECTrole。CONNECT是使用Oracle的简单权限，这种权限只有在对其他用户的表有访问权时，包括select、insert、update和delete等，才会变得有意义。拥有 CONNECT role的用户还能够创建表、视图、序列(sequence)、簇(cluster)、同义词(synonym )、会话(session)和与其他数据库的链(link)。 
　　2. RESOURCE Role(资源角色) 
　　更可靠和正式的数据库用户可以授予RESOURCE role。RESOURCE提供给用户另外的权限以创建他们自己的表、序列、过程(procedure)、触发器(trigger)、索引(index)和簇(cluster)。 
　　3. DBA Role(数据库管理员角色) 
　　DBA role拥有所有的系统权限----包括无限制的空间限额和给其他用户授予各种权限的能力。SYSTEM由DBA用户拥有。下面介绍一些DBA经常使用的典型权限。 
　　一个具有DBA角色的用户可以撤消任何别的用户甚至别的DBA的CONNECT、RESOURCE 和DBA的其他权限。当然，这样是很危险的，因此，除非真正需要，DBA权限不应随便授予那些不是很重要的一般用户。 
　　撤消一个用户的所有权限，并不意味着从Oracle中删除了这个用户， 也不会破坏用户创建的任何表;只是简单禁止其对这些表的访问。其他要访问这些表的用户可以象以前那样地访问这些表。 

Oracle角色 
角色就是相关权限的命令集合，使用角色的主要目的就是为了简化权限的管理。假定有用户a，b，c为了让他们都拥有权限 

2、在scott.emp表上select，insert，update 
如果采用直接授权操作，则需要进行12次授权。 
如果采用角色就可以简化 
首先将create session，select on scott.emp，insert on scott.emp，update on scott.emp授予角色，然后将该角色授予a，b，c用户，这样就可以三次授权搞定。角色分为预定义角色和自定义角色两类。 

二、预定义角色 
预定义角色是指Oracle所提供的角色，每种角色都用于执行一些特定的管理任务，下面我们介绍常用的预定义角色connect，resource，dba。 
1、connect角色 
具有一般应用开发人员需要的大部分权限，当建立了一个用户后，多数情况下，只要给用户授予connect和resource角色就够了，那么connect角色具有以下系统权限： 
alter session 
create cluster 
create database link 
create session 
create view 
create sequence  

2、resource角色 
具有应用开发人员所需要的其他权限，比如建立存储过程、触发器等。这里需要注意的是resource角色隐含了unlimited tablespace系统权限。 
包含以下系统权限：
create indextype 
create table 
create type 
create procedure 
create trigger  

3、dba角色 
dba角色具有所有的系统权限，及with admin option选项，默认的dba用户为sys和system他们可以将任何系统权限授予其他用户。但是要注意的是dba角色不具备sysdba和sysoper的特权（启动和关闭数据库）。 

三、自定义角色 
顾名思义就是自己定义的角色，根据自己的需要来定义，一般是DBA来建立，如果用的别的用户来建立，则需要具有create role的系统权限，在建立角色时可以指定验证方式（不验证，数据库验证等）。 
1、建立角色（不验证） 如果角色是公用的角色，可以采用不验证的方式建立角色 create role 角色名 not identified; 
2、建立角色（数据库验证）create role 角色名 identified by tiger; 
给角色授予权限和给用户授权没有太多的区别，但是要注意，系统权限的unlimited tablespace对对象权限with grant option选项是不能授予角色的。 

sql> grant select on scott.emp to 角色名; 
sql>grant insert,update,delete on scott.emp to 角色名; 
通过上面的步骤，就给角色授权了。
 

4、分配角色给某个用户 
一般分配角色是由dba来完成的，如果要以其他用户身份分配角色，则要求用户必须具有grant any role的系统权限。 
grant 角色名 to blake with admin option; 
因为我给了with admin option选项，所以，blake可以把system分配给它的角色分配给别的用户。 


show和set命令是两条用于维护SQL*Plus系统变量的命令
SQL> set heading off --禁止输出列标题，默认值为ON 
SQL> set feedback off --禁止显示最后一行的计数反馈信息，默认值为"对6个或更多的记录，回送ON" 
SQL> set timing on --默认为OFF，设置查询耗时，可用来估计SQL语句的执行时间，测试性能 
SQL> set sqlprompt "SQL> " --设置默认提示符，默认值就是"SQL> " 
SQL> set linesize 1000 --设置屏幕显示行宽，默认100 
SQL> set autocommit ON --设置是否自动提交，默认为OFF 
SQL> set pause on --默认为OFF，设置暂停，会使屏幕显示停止，等待按下ENTER键，再显示下一页 
SQL> set arraysize 1 --默认为15 
SQL> set long 1000 --默认为80 
说明： 
long值默认为80，设置1000是为了显示更多的内容，因为很多数据字典视图中用到了long数据类型，如： 
SQL> desc user_views 
列名 可空值否 类型 
------------------------------- -------- ---- 
VIEW_NAME NOT NULL VARCHAR2(30) 
TEXT_LENGTH NUMBER 
TEXT LONG 
SQL> define a = '''20000101 12:01:01''' --定义局部变量，如果想用一个类似在各种显示中所包括的回车那样的常量， 
--可以用define命令来设置 
select &a from dual; 
原值 1: select &a from dual 
新值 1: select '20000101 12:01:01' from dual 
'2000010112:01:01 
----------------- 
20000101 12:01:01 
问题提出： 
1、用户需要对数据库用户下的每一张表都执行一个相同的SQL操作，这时，一遍、一遍的键入SQL语句是很麻烦的 
实现方法： 
SQL> set heading off --禁止输出列标题 
SQL> set feedback off --禁止显示最后一行的计数反馈信息 

把所有符合条件的表的select权限授予为public 
select 'grant select on '||table_name||' to public;' from user_tables where 《条件》; 
删除用户下各种对象 
select 'drop '||tabtype||' '||tname from tab; 
删除符合条件用户 
select 'drop user '||username||' cascade;' from all_users where user_id>25; 
快速编译所有视图 
----当在把数据库倒入到新的服务器上后(数据库重建)，需要将视图重新编译一遍， 
----因为该表空间视图到其它表空间的表的连接会出现问题，可以利用PL/SQL的语言特性，快速编译。 
SQL> SPOOL ON.SQL 
SQL> SELECT'ALTER VIEW '||TNAME||' COMPILE;' FROM TAB; 
SQL> SPOOL OFF 
然后执行ON.SQL即可。 
SQL> @ON.SQL 
当然，授权和创建同义词也可以快速进行，如： 
SQL> SELECT 'GRANT SELECT ON '||TNAME||' TO 用户名;' FROM TAB; 
SQL> SELECT 'CREATE SYNONYM '||TNAME||' FOR 用户名.'||TNAME||';' FROM TAB; 
命令列表： 
假设当前执行命令为：select * from tab; 
(a)ppend　　　　 添加文本到缓冲区当前行尾　　　　a order by tname　结果：select * from tab order by tname; 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　（注：a后面跟2个空格） 
(c)hange/old/new 在当前行用新的文本替换旧的文本　c/*/tname　　　　　结果：select tname from tab; 
(c)hange/text　　从当前行删除文本　　　　　　　　c/tab　　　　　　　结果：select tname from ; 
del　　　　　　　删除当前行 
del n　　　　　　删除第n行 
(i)nput 文本　　 在当前行之后添加一行 
(l)ist　　　　　 显示缓冲区中所有行 
(l)ist n　　　　 显示缓冲区中第 n 行 
(l)ist m n　　　 显示缓冲区中 m 到 n 行 
run　　　　　　　执行当前缓冲区的命令 
/　　　　　　　　执行当前缓冲区的命令 
r　　　　　　　　执行当前缓冲区的命令 
@文件名　　　　　运行调入内存的sql文件，如： 
SQL> edit s<回车> 
如果当前目录下不存在s.sql文件，则系统自动生成s.sql文件， 
在其中输入"select * from tab;"，存盘退出。 
SQL> @s<回车> 
系统会自动查询当前用户下的所有表、视图、同义词。 
@@文件名　　　　 在.sql文件中调用令一个.sql文件时使用 
save 文件名　　　将缓冲区的命令以文件方式存盘，缺省文件扩展名为.sql 
get 文件名　　　 调入存盘的sql文件 
start 或@ 执行sql脚本    用法：start或@   F:\123.sql  运行调入内存的sql文件 
spool   F:\123.sql  ………………  spool off
结果输出到文件：spool 文件名　　 把这之后的各种操作及执行结果"假脱机"即存盘到磁盘文件上，默认文件扩展名为.lst 
spool　　　　　　显示当前的"假脱机"状态 
spool off　　　　停止输出 
例： 
SQL> spool a 
SQL> spool 
正假脱机到 A.LST 
SQL> spool off 
SQL> spool 
当前无假脱机 

desc 表名　　　　显示表的结构 
show user　　　　显示当前连接用户 
show error　　　 显示错误 
show all　　　　 显示所有68个系统变量值 
edit　　　　　　 打开默认编辑器，Windows系统中默认是notepad.exe，把缓冲区中最后一条SQL语句调入afiedt.buf文件中进行编辑 
edit 文件名　　　把当前目录中指定的.sql文件调入编辑器进行编辑 
clear screen　　 清空当前屏幕显示 
二．Oracle sqlplus语句编辑命令 

ln 命令用于指定对以输入的第n行语句进行操作，比如在上述语句运行后输入： 
l1则当前选中的语句行即为 SELECT emp_id, emp_name （语句前有"*"表示） a 命令用于直接在当前行的末尾加上字符，比如在上述语句运行后输入： a , emp_dept 则执行的指令变为： 
SELECT emp_id, emp_name, emp_dept FROM Employees WHERE emp_age > 30 
c 命令用于修改当前语句中的字符，比如在上述语句运行后输入： 
c /emp_name/emp_age/则执行的指令变为： 
SELECT emp_id, emp_age, emp_dept FROM Employees WHERE emp_age > 30 
del n 命令用于删除第n行指令，比如在上述语句运行后输入： 
DEL 3 
则执行的指令变为：SELECT emp_id, emp_age, emp_dept FROM Employees 
系统权限的传递：
1）	系统权限：用户对数据库的相关权限；
2）	对象权限：用户对其他用户的数据对象操作的权限；

角色：拥有一系列的权限的组合（常见：dba、connect、resource）
1）	预定义角色：系统定义的；
2）	自定义角色：用户自己定义的；

使用profile 管理用户口令：
1)锁定口令：
create profile lock_account limit 
failed_login_attempts 3 password_lock_time 2; 
alter user xiaoming profile lock_account;
alter user xiaoming account unlock;
2)终止口令：
create profile myprofile limit
password_lift_time 10 password_grace_time 2;
alter user xiaoming profile myprofile;
3)口令历史：
create profile password_history limit 
password_life_time 10 password_grace_time 2
password_reuse_time 10; 
4)删除profile文件：
drop profile password_history [cascade]

表名和列名的命名规则：
a）	字母开头b）	不超过30个字符d）	A-Z，a-z，0-9，$，#
oracle数据类型：
char(?)型： 定长  最大2000字符 例如：char(10)‘xiao’ 前四个字符放‘xiao’后添6个空格补全；
varchar2(?):  变长 最大4000字符 例如：varchar2(4) 只分配四个字符；
number： 范围-1038至1038 可以表示整数，也可以表示小数；
number(5,2)：表示一个数有5位有效数，两位小数；范围-999.99至999.99；
number(5):   表示一个5位整数，范围-99999至99999；
date: 包括年月日和时分秒；
blob：二进制数据可以存放图片/声音/视频,4G；
clob： 字符型大对象 最大4G：

禁用约束：alter table stu disable constraint con1;
启用： enable 

增：
	表结构：create table stu_backup as select * from student where 1=2; 复制表结构，where子句表示条件为假，所以不顾数据，只复制表结构
	表	create table stu(sno number(4),sname varchar2(20),sex char(2),birthday date,sch number(7,2));
用子查询创建表：CREATE TABLE dept10 AS SELECT employee_id, last_name, salary＋1000 newSalary FROM employees  WHERE department_id = 10;
约束：name char(2) constraint con1 not null（行级约束）=constraint con2 unique（name）（表级约束）//为字段name定义两个等效约束
	部分数据：insert into student(sno,sname,sex) values(209,'王五','男');
约束：alter table stu add(constraint c1)primary key(name);
删除约束：...drop primary key|unique(column)|constraint c1 [cascade]
	字段：	alter table student add(classID number(2));
	数据：	insert into student values(209,'张三','男','18-1月-1990',234.56,2);
	视图;	create or replace view v1 as select * from student with read only/with check option constraint vddf;带约束条件的视图，视图不能改自己的约束项数据
	序列：CREATE SEQUENCE [schema.]序列名[INCREMENT BY n][START WITH n][MAXVALUE n | NOMAXVALUE][MINVALUE n | NOMINVALUE][CYCLE | NOCYCLE][CACHE n | NOCACHE];   
	索引：	create index ind1 on student(name);
　除了前面讲到的三种系统角色----CONNECT、RESOURCE和DBA，用户还可以在Oracle创建自己的role。用户创建的role可以由表或系统权限或两者的组合构成
用户：create user xiaoming identified by tiger;（权限不足）新创建的用户没有任何权限
授权用户：grant connect， create session,resource,create view,select on emp to user1 (with grant/admin option);授予：登陆，建表和视图的权限create user xiaoming identified by tiger;（权限不足）新创建的用户没有任何权限
	system 用grant connect to xiaoming with admin option
撤销：revoke select on emp from xiaoming；
SYSTEM具有创建别 的用户的 权限 create role STUDENT; 
授权角色同用户：grant select on CLASS to STUDENT; 
　　
删
	字段：	alter table student drop column sal;
	一条记录:  delete from student where sanme=’王五’； 
	所有记录: delete from student; 表结构还在，写日志，可以恢复，速度慢；
	所有记录:truncate table student；表结构还在，不写日志，无法找回删除的记录，速度快；
	表结构和数据:  drop table student；
	数据：( 保存点：savepoint myPoint;  rollback to myPoint;)
	表：	drop table；
	约束	alter table stu drop constraint con1;alter table stu drop unique(name)；
	序列：	drop sequence seq;
	视图：	drop view v;
	角色：drop role
禁用约束: disable constraint c1 [cascade]
用户drop user user01
删除用户所有的对象再删除用户drop user user01 CASCADE
　



改：

口令：password 用户名 新密码  
alter user user01 identified by usr01;
如果使用password命令，用户输入的新口令将不在屏幕上显示。有dba特权的用户可以通过password命令改变任何其他用户的口令;其他用户只能改变自己的口令。  
 
	表名：	rename student to stu;
	字段：	alter table student modify(sname char(30));
	字段重命名：alter table t rename column a to b;
	字段属性：alter session set nls_date_format=’yyyy-mm-dd’;
	修改一个字段：update student set sex='女' where sname='王五';
	修改多个字段：update student set sch=sch/2,classID=1;
	update city set buildDate=to_date('1900-1-1','yyyy-mm-dd') ;
	update view1 set sal=2 where id=2;可以对视图进行更改
	序列： 	alter sequence seq maxvalue 12;
数据库用户解锁:alter user scott account unlock;

查
show all --查看所有68个系统变量值 
show error　　 --显示错误 
序列：1. 必须以管理员身份登录；2. sequence_owner必须为大写，不管你的用户名是否大写。只有大写才能识别
当前用户的所有序列select SEQUENCE_OWNER,SEQUENCE_NAME from dba_sequences where sequence_owner='用户名';
当前用户的序列总数select count(*) from dba_sequences where sequence_owner='用户名';
当前用户下所有同义词的定义，可用来测试同义词的真实存在性 select 'desc '||tname from tab where tabtype='SYNONYM'; 
当前用户下所有表的记录数 select 'select '''||tname||''',count(*) from '||tname||';' from tab where tabtype='TABLE';

所有角色 select * from dba_roles; 
角色具有的系统权限 select privilege,admin_option from role_sys_privs where role='角色名'; 
角色具有的对象权限 通过查询数据字典视图dba_tab_privs可以查看角色具有的对象权限或是列的权限。 
用户具有的角色及默认角色 当以用户的身份连接到数据库时，Oracle会自动的激活默认的角色，通过查询数据字典视图dba_role_privs可以显示某个用户具有的所有角色及当前默认的橘色。 
select granted_role,default_role from dba_role_privs where grantee='用户名'; 	
	select * from student where birthday is (not) null;
	select * from user_constraint where table_name='student';
所有角色：select * from dba_roles;
管理员角色：select * from dba_role_privs;
当前用户角色：select * from user_role_privs;
当前用户show user
所有用户：select * from dba_users;
select * from all_users;
select * from user_users;
用户和默认表空间的关系select username,default_tablespace from dba_users;
查看当前用户能访问的表select * from user_tables; 
用户表select * from user_all_tables;
用户视图select * from user_views;
所有函数和储存过程：select * from user_source;
当前用户连接：select * from v$Session;
当前用户权限：select * from session_privs;
数据库名SELECT NAME FROM V$DATABASE;
所有表空间使用情况select a.file_id "FileNo",a.tablespace_name "Tablespace_name",a.bytes "Bytes",a.bytes - sum(nvl(b.bytes, 0)) "Used",
       sum(nvl(b.bytes, 0)) "Free",   sum(nvl(b.bytes, 0)) / a.bytes * 100 "%free" from dba_data_files a, dba_free_space b where a.file_id = b.file_id(+) group by a.tablespace_name, a.file_id, a.bytes order by a.tablespace_name;

用户或角色系统权限(直接赋值给用户或角色的系统权限)：
select * from dba_sys_privs;
select * from user_sys_privs;
角色(只能查看登陆用户拥有的角色)所包含的权限select * from role_sys_privs;
用户对象权限：select * from dba_tab_privs;
select * from all_tab_privs;
select * from user_tab_privs;

哪些用户有sysdba或sysoper系统权限(查询时需要相应权限)
select * from V$PWFILE_USERS


select ename 员工名,ename||'的入职时间是'||to_char(hiredate,'yyyy-mm-dd') 入职时间 from emp;包括了：为列起别名 格式化数据输出
select * from emp where hiredate>'1-5月-1987' and job<>'salesman';
select * from emp where ename=’&name’;
Select * From Emp Where Mgr is null;		查询某列值为空
Select Round(Months_Between(Sysdate,'1-1月-2000')) 月 From Dual;相隔月
select round(sysdate-to_date('1-1月-2000')/7) from dual;		相隔周
select instr(ename,'a',3) from emp where instr(ename,'a',1)从第1个字符位置开始查找，返回位置
select instr(ename,'a',3) from emp where instr(ename,'a',1,2)从第1个字符位置开始查找，查找第二次出现的a字符。	
查询数据:
where里面不能写带有主函数的判断条件。用having取代。
Select D.Dname,Avg(E.Sal) From Emp e,Dept d Where E.Deptno=D.Deptno Having Avg(E.Sal)>2000 group by d.dname;
使用了组函数的语句，没有使用函数的字段作为分组字段，必须用其与group by连用进行分组.
select e.ename from emp e,dept d where e.deptno=d.deptno(+);右外连接
select * from emp e full outer join dept d on e.deptno=d.deptno;全外连接 包括双表的空值项
select nvl(max(s.score),0),count(*) from teacher t left join student s on t.id=s.id group by t.id;
Select * From Emp E,Dept D where E.Deptno (+)= D.Deptno; 左边可能空值显示
查看用户下所有表：select * from user_tables;
查询表结构desc emp；
查询所有列：select * from emp；
取消重复行: select distinct deptno,job from emp;
使用列别名：select ename "姓名", sal*12 "年薪" from emp;
处理null值：select ename "姓名", sal*12+nvl(comm,0)*12 "年薪" from emp; 
使用列表别名排序：select ename,sal*12+nvl(comm,0)*12 "年薪" from emp order by "年薪";
求工资最多的那个人：select ename, sal from emp where sal in(select max(sal) from emp);
高于平均工资员工信息：select empno,ename,sal from emp where sal > (select avg(sal) from emp);

各个部门平均工资和最高工资: select deptno, avg(sal),max(sal) from emp group by deptno;(group by 后边的字段一定要出现在select语句中)
平均工资大于2000的部门号和平均工资和最高工资：select deptno,avg(sal),max(sal) from emp group by deptno having avg(sal) > 2000;
聚集函数总结：select deptno,avg(sal),max(sal) from emp group by deptno having avg(sal) > 2000 order by deptno asc;
a)	聚集函数只能出现在选择列、having、order by 子句中；
b)	如果select语句中同时含有group by 、having、order by 那么它们的顺序是group by ，having，order by；
c)	在选择列中如果有列、表达式和聚集函数，那么这些列和表达式必须有一个出现在group by 子句中，否则就会出错；

to_date()函数要注意参数类型。
substr(colName,off,num).截取从off开始的num个字符.
length(colName)；返回值所占空间数量
int instr(colName,'篮球')；列值中存在目的字符串则返回正值。
我的操作记录：
update student set date_enter_school=to_date('1987-01-01','yyyy-mm-dd') where id=1;
insert into student values(2,'张明','男','篮球',to_date('1987-02-28','yyyy-mm-dd'));
select to_char(date_enter_school,'yyyy-mm-dd') from student where id=1;
update student set hobby=replace(hobby,'篮球','再也不玩了');


事务的四个特性 考试。

问题1：数据库未打开？
解：startup mount;
select * from v$log;
alter database clear unarchived logfile group1;
alter database clear unarchived logfile group2;
alter database clear unarchived logfile group3;


======update 表名 set 列=？
