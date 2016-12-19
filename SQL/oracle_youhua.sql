CREATE TABLE STUDENT (SNO NUMBER NOT NULL , SNAME VARCHAR2(20) NOT NULL , SSEX CHAR(10) NOT NULL , SAGE NUMBER , SDEPT VARCHAR2(20) , CONSTRAINT STUDENT_PK PRIMARY KEY ( SNO  ));
create table Course( Cno number primary key,Cname varchar2(20) not null,Cpno number,  Ccredit varchar(20));
CREATE TABLE SC ( SNO NUMBER NOT NULL , CNO NUMBER NOT NULL , GRADE NUMBER , CONSTRAINT SC_PK PRIMARY KEY (  SNO , CNO  ));

alter table SC add CONSTRAINT SC_sno foreign key (sno) references student(sno);
alter table SC add CONSTRAINT SC_cno foreign key (cno) references course(cno);

insert into student values(14,'rt','男',21,'CS');
insert into course values (46,'大学语文',45,2);
insert into sc values (12,45,68);
----创建基本表

select * from test;

-- 查询控制文件路径
select * from v$controlfile;

-- 重做日志文件信息
select group#,sequence#,members,bytes,status,archived from v$log;

-- 添加重做日志组
select * from v$logfile;
alter database add logfile('F:\DB\Oracle\Data\Log\REDO04A.log','F:\DB\Oracle\Data\Log\REDO04B.log'
)size 10m;
alter database drop logfile group 3;
alter database add logfile group 3('F:\DB\Oracle\Data\Log\REDO03A.log','F:\DB\Oracle\Data\Log\REDO03B.log','F:\DB\Oracle\Data\Log\REDO03C.log'
)size 15m;
-- 强制切换日志组 将当前组（group 1）多切换几次成inactive状态时再删除
alter system switch logfile;
-- 删除1 再添加1 不能修改1
alter database drop logfile group 1;
alter database add logfile group 1('F:\DB\Oracle\Data\Log\REDO01A.log','F:\DB\Oracle\Data\Log\REDO01B.log','F:\DB\Oracle\Data\Log\REDO01C.log'
)size 15m;
-- 表空间的管理
select tablespace_name,block_size,extent_management,segment_space_management from dba_tablespaces;
-- 创建表空间
 create tablespace myth
datafile 'F:\DB\Oracle\Data\DBF\myth01.DBF' size 30m,'F:\DB\Oracle\Data\DBF\myth02.DBF' size 30m 
extent management local 
uniform size 1m;

