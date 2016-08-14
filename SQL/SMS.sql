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

alter table syllabus add constraint LP_week check week<7&&week>0;
--添加唯一约束
alter table mark add constraint K_all key(sno,cno,term,year);
--计算添加mark表的绩点
update mark set gpa = grade/10-5
--创建触发器  如果是在命令行中，就需要声明定界符 delimiter
drop trigger t_checktwo_b_i;
--这个触发器就是用来实现了两个字段组成候选码，不重复
--中断机制采用的是错误的SQL语句，并且插入之前计算出绩点的值，那么只需要学号，课程，成绩，学期，四个值
create trigger t_checktwo_b_i before insert on mark for each row
begin 
	set @flag=(select id from mark where sno=NEW.sno and cno=NEW.cno);
	if @flag is not null then 
		insert into w values('23','er','eww');
  elseif @flag is null then 
       set NEW.gpa=(NEW.grade/10-5);
	end if;
end
--创建触发器来自动计算绩点,这是错误的，不允许在insert之后来更改new的值，所以应该放在前面
drop trigger t_caculatergpa_a_i;
create trigger t_caculatergpa_a_i after insert on mark for each row
begin 
      set NEW.gpa = (NEW.grade/10-5);
end

insert into mark(sno,cno,grade,year) values(12,20003,98,'2015-2016')
   







