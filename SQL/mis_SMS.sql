create table excel (a char(20),b char(20),c char(20),d char(20));
create table excel2(a char(20),b char(20),c char(20),d char(20),e char(20),f char(20),
g char(20),h char(20),i char(20),j char(20),k char(20))

delete from excel2
select * from excel

insert into excel2(a) values(null)

create table allgrades ()

create table u (a int key auto_increment,b int );
insert into u(b) values(31);
insert into test(b)  select b from test;
alter table test auto_increment=30;
--创建登录历史记录表
create table history(name varchar(20),times datetime,adds varchar(20));
drop table test 
delete from  customers ;

create table customers(
       customerID char(8) primary key,
       name char(40) default null,
       phone char(16) default null
)
insert into customers values('1','myht','23');

create table pri(a int primary key auto_increment,b int) auto_increment=100;
insert into pri(b) values(2);

create table us (a int ,b int ,c int ,d varchar(10) ,primary key(a,b,c));
create table academy(aid varchar(20) primary key comment '学院编号
a01',academy varchar(20) not null comment '学院',ainfo varchar(20) default null comment '学院介绍')
--添加外键约束，同样的约束名是不能同名的
alter table syllabus add constraint PK_TNO foreign key PK_TNO(tno) references teacher(tno)on delete cascade on update cascade;
alter table mark add constraint PK_SNO foreign key PK_SNO(sno) references student(sno)on delete cascade on update cascade;
alter table mark add constraint PK_C foreign key PK_C(cno) references course(cno)on delete cascade on update cascade;

alter table obligatory add constraint PK_Cn foreign key PK_Cn(cno) references course(cno)on delete cascade on update cascade;
alter table obligatory add constraint PK_Ci foreign key PK_Ci(cid) references classs(cid)on delete cascade on update cascade;
alter table obligatory add constraint PK_tn foreign key PK_tn(tno) references teacher(tno)on delete cascade on update cascade;

alter table excelonegrade add constraint PK_ss foreign key PK_ss(sno) references student(sno) on delete cascade on update cascade;

alter table student add constraint PK_CC foreign key PK_CC(cid) references classs(cid)on delete cascade on update cascade;

alter table syllabus add constraint LP_week check week<7&&week>0;
--添加唯一约束
alter table mark add constraint K_all key(sno,cno,term,year);
--计算添加mark表的绩点
update mark set gpa = grade/10-5
--创建触发器  如果是在命令行中，就需要声明定界符 delimiter
drop trigger t_checktwo_b_i;
--这个触发器就是用来实现了两个字段组成候选码，不重复,切记
--中断机制采用的是错误的SQL语句，并且插入之前计算出绩点的值，那么只需要学号，课程，成绩，学期，四个值
create trigger t_checktwo_b_i before insert on mark for each row
begin 
	set @flag=(select id from mark where sno=NEW.sno and cno=NEW.cno);
	if @flag is not null then 
		insert into mark_error values('23','er','eww');
  elseif @flag is null then 
       set NEW.gpa=(NEW.grade/10-5);
	end if;
end
--
创建触发器，进行数据格式的转换   java.util.Date 转换为 '1970-00-00' 格式
create trigger t_checktwo_b_i before insert on mark for each row
begin 
	set @flag=(select id from mark where sno=NEW.sno and cno=NEW.cno);
	if @flag is not null then 
		insert into mark_error values('23','er','eww');
  elseif @flag is null then 
       set NEW.gpa=(NEW.grade/10-5);
	end if;
end
--创建触发器来自动计算绩点,这是错误的，不允许在insert之后来更改new的值，所以应该放在前面
--drop trigger t_caculatergpa_a_i;
--create trigger t_caculatergpa_a_i after insert on mark for each row
--begin 
--      set NEW.gpa = (NEW.grade/10-5);
--end

select aid id,academy name from academy

insert into mark(sno,cno,grade) values(20,'20004',93)

insert into mark(sno,cno,grade,year,term) values(12,20003,98,'2015-2016',1)
select * from student order by sno desc;

-----------------------------------------------------------------------------------
drop procedure getGrade;
delimiter //
create procedure getGrade(classid varchar(20),years varchar(20),terms int)
	begin 
		declare num int ;
		declare i int default 0;
		
		select cname from obligatory o ,course c where o.cno = c.cno and cid =  classid and year = years and term = terms;
	
		select count(*) into num from obligatory o ,course c where o.cno = c.cno and cid =  classid and year = years and term = terms;
	
		f:LOOP
   SET i = i + 1;
   select 
   if i<num then iterate f;
   end if;
   LEAVE f;
    END LOOP f; 
    SET @x = num;
	end;
	//
  call getGrade('3','2015-2016',1);
  
  select cname from obligatory o ,course c where o.cno = c.cno and cid =  '3' and year = '2015-2016' and term = 1;
 ---------------------------
 drop procedure doiterate;
 
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
-------------------------------------------------------------------------------------
--创建bug数据库
use bug
create table student(num int primary key auto_increment,how datetime,info varchar(255),causes varchar(255),handle varchar(255));

insert into student(how,info,causes,handle) values(now(),"","","");
desc student;

-------------
drop table if exists temp ;
create table temp as (select a.sno,sname,a.grade c_20002,b.grade c_20003,c.grade c_20004 from 
       (select sno,grade from mark where cno='20002') a,
       (select sno,grade from mark where cno='20003') b,
       (select sno,grade from mark where cno='20004') c,
       student 
       where a.sno=b.sno and a.sno=student.sno
);

select * from excel a left join excel b on a.a=b.a;
select c.cno,cname from obligatory o,course c where o.cno=c.cno and cid='3'

--貌似左外连接只能用基本表，视图或虚表是不可用的
(select a,b from excel) f left join (select b,c from excel) g on f.b=g.b
--
select * from (select a,b,c from excel ) a ,(select a,d,e from excel) b  where a.a = b.a;
drop table if exists inserts ;
create table inserts(id int ,name char(4));

create table temp as ( select distinct col_0.sno,sname ,col_0.grade '编译原理',col_0.credit cr_20002,col_1.grade '单片机',col_1.credit cr_20003,col_2.grade '编译原理',col_2.credit cr_20004 from (select sno,grade,credit from mark,course where course.cno=mark.cno and mark.cno = '20002' and year='2015-2016' and term = 1 ) col_0 ,(select sno,grade,credit from mark,course where course.cno=mark.cno and mark.cno = '20003' and year='2015-2016' and term = 1 ) col_1 ,(select sno,grade,credit from mark,course where course.cno=mark.cno and mark.cno = '20004' and year='2015-2016' and term = 1 ) col_2 ,student s where  col_0.sno=col_1.sno and col_1.sno=col_2.sno and s.sno = col_0.sno and cid = '3' );

----------------------------------------------
create table course(cno int primary key,name varchar(20),totalClass int,block int,room varchar(20))

create database EEZH;
create table test (sno int, sname varchar(20));

create table login (users varchar(20),pass varchar(20));
create table person (id varchar(20),name varchar(20),sex char(4),age int,addr varchar(20),major varchar(20));






select * from student where sbirth ='1970-01-02';
update student set sbirth ='1990-03-03' where sbirth ='1970-01-01';




select major,cid,classs from major m,classs c where c.mid=m.mid and m.mid ='I10001'



select student0_.sno as sno4_, student0_.pass as pass4_, student0_.sname as sname4_, student0_.ssex as ssex4_, student0_.sbirth as sbirth4_, student0_.sid as sid4_, student0_.cid as cid4_, student0_.spolitics as spolitics4_, student0_.saddr as saddr4_, student0_.sinfo as sinfo4_ from student.student student0_








