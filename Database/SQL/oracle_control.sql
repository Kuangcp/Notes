--关于Oracle的一些配置文件的语句
create table emp_subquery as
select employee_id,first_name,salary from employees;

create view emp_view_subquery as select *from employees where salary >2000;
--习题
--1
create user usera_exer identified by usera default tablespace users quota 10m 
on users account lock;
--2
create user userb_exer3 identified by userb;
drop user userb_exer3;
--3
grant create session to userb_exer3 with admin option;
grant  select,update on hr.employees to userb_exer3 with grant option;
--4
alter  user userb_exer3 account unlock;
--5
connect userb_exer3/userb
select * from hr.employees ;
update hr.employees set salary=salary+200;
grant select ,update on hr.employees to userb_exer3;
--6
revoke create session from  userb_exer3;
grant create session to  userb_exer3;
--7
revoke select ,update on hr.employees from  userb_exer3;
grant select ,update on hr.employees to  userb_exer3;
--8
create  role rolea;
create role  roleb;
grant create table to rolea;
grant insert ,delete on hr.employees to rolea;
grant connect ,resource to roleb;
--9
grant rolea,roleb to  userb_exer3;
--10 创建概要文件
create  profile pwd_file limit connect_time 30
idle_time 10 failed_login_attempts 4
password_lock_time 10
password_life_time 20;
alter user  userb_exer3 profile pwd_file;

conn hr/hr;


conn as sysdba


select name from v$database;
