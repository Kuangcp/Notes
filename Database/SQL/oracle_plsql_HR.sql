
set serveroutput on 
--根据用户输入的部门号来查询  游标
declare 
  v_deptno employees.department_id%TYPE;
  cursor c_emp is select * from employees where department_id = v_deptno;
  v_emp c_emp%ROWTYPE;--游标记录类型一致的变量
begin 
  v_deptno:=&x;
  open c_emp;
  Loop 
    dbms_output.put_line('id'||'_'||'name'||'_'||'name'||'_'||'sal'||'_'||'deptno');
    fetch c_emp into v_emp;--把游标指向的数据放入变量里
    exit when c_emp%NOTFOUND;
    dbms_output.put_line(v_emp.employee_id||'_'||v_emp.first_name||'_'||v_emp.last_name||'_'||v_emp.salary||'_'||v_deptno);
    end Loop;
    close c_emp;
end;

-- 按工资的多少来分别修改工资 
savepoint A;
declare 
  v_sal employees.salary%type;
  v_increment NUMBER(4);
  v_empno employees.employee_id%type;
begin 
  v_empno :=&x;
  select employees.salary into v_sal from employees where employee_id = v_empno;
  case 
    when v_sal<1000 then v_increment:=200;
    when v_sal<2000 then v_increment:=140;
    when v_sal<3000 then v_increment:=100;
    else v_increment := 50;
  end case ;
  update employees set salary=salary+v_increment where employee_id=v_empno;
end;
--savepoint B;
rollback to A;
---------
commit;

--declare 
--  v_table char(20);
--  TYPE type_cursor is ref cursor ;
--  v_cursor type_cursor;
--  v_emp employees%rowtype;
--  v_deptno employees.department

-- 查询某人的工资，有异常捕捉
declare 
	v_sal employees.salary%type;
begin 
  dbms_output.put_line('进入begin');
	select salary into v_sal from employees where last_name='Khoo';
	dbms_output.put_line('工资:');
  dbms_output.put_line(v_sal);
  dbms_output.put_line('退出begin');
EXCEPTION

	when no_data_found then 
		dbms_output.put_line(v_sal);
    dbms_output.put_line('进入异常1');
	when too_many_rows then 
		for v_emp in (select * from employees where last_name='Khoo') loop
			dbms_output.put_line(v_emp.employee_id||''||v_emp.first_name);
		end loop;
    dbms_output.put_line('进入异常2');
end;
--
declare begin dbms_output.put_line('9'); end;

  
--------------- 给不同部门号的某员工加不同的工资  ---------------
create or replace procedure test22(
	id employees.employee_id%type)
	as 
		plus employees.salary%type;
		dept employees.department_id%type;
	begin 
		select department_id into dept from employees where employee_id=id;
		if dept=10 then plus:=140;
		elsif dept=20 then plus:=200;
		elsif dept=30 then plus:=250;
		else plus:=300;
    end if;
		update employees set salary=salary+plus where employee_id=id;
	exception
		when no_data_found then 
			dbms_output.put_line('没有找到部门号');
end test22;
--执行存储过程
execute test22(100);
----------------------------------------------------------------
set serveroutput on --每次启动服务后都要执行这句话才可以看到输出

--输出所有比本部门平均工资高的员工信息
declare 
	avg_sal employees.salary%type;
  cursor deptno is  select distinct department_id from employees ;
  cursor avg_dept is select * from employees where salary>avg_sal ;
begin
	for dept in deptno loop
--  dbms_output.put_line(dept.department_id);
--注意处理空值情况
    if dept.department_id is not null then
      select avg(salary)into avg_sal from employees where department_id=dept.department_id;
      for emp in avg_dept loop
        dbms_output.put_line(emp.first_name||'_avg:'||avg_sal||'<sal:'||emp.salary);
      end loop;
    end if;
	end loop;
end;
--显示时间戳
declare

begin
	dbms_output.put_line(systimestamp);
end;


-- 分类加工资
savepoint  a;
declare
	v_plus employees.salary%type;
	cursor job is select job_id,employee_id from employees;
begin
	for jobs in job loop
		case 
			when jobs.job_id='AD_PRES' or jobs.job_id='AD_VP'or jobs.job_id='AD_ASST' then v_plus:=1000;
			when jobs.job_id='FI_MGR' or jobs.job_id='FI_ACCOUNT'then v_plus:=800;
			when jobs.job_id='AC_MGR' or jobs.job_id='AC_ACCOUNT'then v_plus:=700;
			when jobs.job_id='SA_MAN' or jobs.job_id='SA_REP'then v_plus:=600;
			when jobs.job_id='PU_MAN' or jobs.job_id='PU_CLERK'then v_plus:=500;
			when jobs.job_id='ST_MAN' or jobs.job_id='ST_CLERK'or jobs.job_id='SH_CLERK' then v_plus:=400;
			when jobs.job_id='IT_PROG' or jobs.job_id='MK_MAN'or jobs.job_id='MK_REP' then v_plus:=300;
			else v_plus:=200;
		end case;
		update employees set salary=salary+v_plus where employee_id=jobs.employee_id;
	end loop;
end;
rollback to a;  
commit;

----------------------- 函数 参数（部门）返回部门最高工资 ---------------
set serveroutput on
create or replace function fun_dept_max(
  p_deptno departments.department_id%type)
  return employees.salary%type
as
  v_maxsal employees.salary%type;
begin
  select max(salary) into v_maxsal from employees
  where department_id=p_deptno;
  return v_maxsal;
  exception
    when no_data_found then 
      dbms_output.put_line('the deptno is invalid');
  end fun_dept_max;

--  自定义函数的使用 非常方便，复杂逻辑的运算就可以在数据库里执行了而不是在应用程序端执行判断什么的
select fun_dept_max(50) from employees;
  
  
  commit;
  
  
declare
v_table char(20);
type type_cursor is ref cursor;
v_cursor type_cursor;
v_emp employees%rowtype;
v_deptno employees.department_id%type;
v_num number;
begin
  v_table:='&table_name';
  if v_table ='employees' then
    open v_cursor for select *from employees where salary>(
    select avg(salary)from employees where department_id=10);
  elsif v_table ='departments'
    then open v_cursor for select department_id,count(*)num from employees
    group by department_id;
  else
    raise_application_error(-20000,'input must be ''emp''or''dept''');
  end if;
  loop
    if v_table ='employees' then fetch v_cursor into v_emp;
      exit when v_cursor%notfound;
      dbms_output.put_line(v_emp.employee_id||' '||v_emp.first_name||' '||
      v_emp.last_name||' '||v_emp.salary||' '||v_emp.department_id);
    else 
      fetch v_cursor into v_deptno,v_num;
      exit when v_cursor%notfound;
      dbms_output.put_line(v_deptno||' '||v_num);
    end if;
  end loop;
  close v_cursor;
end;
  
declare
  v_sal employees.salary%type;
begin
  select salary into v_sal from employees where last_name='Smith';
  dbms_output.put_line(v_sal);
exception
when no_data_found then
  dbms_output.put_line('there is not suah an employee!');
  when too_many_rows then
  for v_emp in (select*from employees where last_name='Smith')loop
  dbms_output.put_line(v_emp.employee_id||' '||v_emp.first_name||' '||
  v_emp.last_name||' '||v_emp.salary);
  end loop;
  end;
  
declare 
  e_deptno_fk exception;
  PRAGMA EXCEPTION_INIT (e_deptno_fk,-2292);
begin
  delete from departments where department_id=350;
exception
  when e_deptno_fk then
  dbms_output.put_line('there are subrecords in employees table!');
  end;
 
declare
  e_highlimit exception;
  v_sal employees.salary%type;
  begin
    update employees set salary=salary+100 where employee_id=107
    returning salary into v_sal;
    if v_sal>6000 then
    raise e_highlimit;
    end if;
  exception
  when e_highlimit then
  dbms_output.put_line('the salary is too large!');
  rollback;
end;

commit;
set serveroutput on 
declare
  v_sal employees.salary%type;
  e_highlimit exception;
begin
  select salary into v_sal from employees where last_name='Smith';
  update employees set salary=salary+500 where employee_id=200;
  if v_sal>6000 then
    raise e_highlimit;
  end if;
exception
  when e_highlimit then
    dbms_output.put_line('the salary is too large!');
    rollback;
when others then
  dbms_output.put_line('there is some wrong in selecting!');
end;

declare
  v_sal employees.salary%type;
  e_highlimit exception;
  v_code number(6);
  v_text varchar2(200);
begin
  select salary into v_sal from employees where last_name='Smith';
  update employees set salary=salary+500 where employee_id=200;
  if v_sal>6000 then
  raise e_highlimit;
  end if;
exception
  when e_highlimit then
  dbms_output.put_line('the salary is too large!');
  rollback;
when others then
v_code:=sqlcode;
v_text:=sqlerrm;
dbms_output.put_line(v_code||' '||v_text);
end;
set SERVEROUTPUT ON
------------------------------ffh----
create or replace procedure proc_show_emp(
p_deptno employees.department_id%type)
as 
  v_sal employees.salary%type;
begin
  select avg(salary) into v_sal from employees where department_id=p_deptno;
  dbms_output.put_line(p_deptno||' '||'average salary is:'||v_sal);
  for v_emp in(
  select *from employees where department_id=p_deptno and salary>v_sal)loop
dbms_output.put_line(v_emp.employee_id||' '||v_emp.first_name||' '||v_emp.last_name||''||v_emp.salary);
end loop;
exception
when no_data_found then
dbms_output.put_line('the department doesn''t exists!');
end proc_show_emp;

execute proc_show_emp(100);
------------------------- 部门参数 返回部门平均工资
create or replace procedure proc_return_deptinfo(
    p_deptno employees.department_id%type,
    p_avgsal out employees.salary%type,
    p_count out number)
as
begin
 select avg(salary),count(*)into p_avgsal,p_count from employees
 where department_id=p_deptno;
 exception
 when no_data_found then 
 dbms_output.put_line('the department don''t exists!');
 end proc_return_deptinfo;
 
 --execute proc_return_deptinfo();
 
 declare
 v_avgsal employees.salary%type;
 v_count number;
 begin
 proc_show_emp(20);
 proc_return_deptinfo(10,v_avgsal,v_count);
 dbms_output.put_line(v_avgsal||' '||v_count);
 end ;
 set serveroutput on --每次启动服务后都要执行这句话才可以看到输出
 --------------------------------------------------------------------
create or replace procedure proc_secure_dml
is
begin
  if to_char(sysdate,'hh24:MI')not between '08:00'and '18:00'or
  to_char(sysdate,'DY','NLS_DATE_LANGUAGE=AMERICAN')IN ('SAT','SUN')THEN
    RAISE_APPLICATION_ERROR(-20205,'只能在正常的工作时间内进行改变。');
    end if;
    end proc_secure_dml;

create or replace function func_dept_maxsal(
p_deptno employees.department_id%type)
return employees.salary%type
as
  v_maxsal employees.salary%type;
  begin
    select max(salary)into v_maxsal from employees
    where department_id=p_deptno;
    return v_maxsal;
exception
  when no_data_found then
  dbms_output.put_line('the deptno is invalid!');
  end func_dept_maxsal;


 
 create or replace function func_dept_info(
 p_deptno departments.department_id%type,
 p_num out number,
 p_avg out number)
 return departments.department_name%type
 as
 v_dname departments.department_name%type;
 begin
   select department_name into v_dname from departments
    where department_id=p_deptno;
   select count(*),avg(salary) into p_num,p_avg from employees
   where department_id=p_deptno;
   return v_dname;
end func_dept_info;

declare
  v_maxsal employees.salary%type;
  v_avgsal employees.salary%type;
  v_num number;
  v_dname departments.department_name%type;
begin
 for v_dept in(select distinct department_id from employees
 where department_id is not null)
 loop
 v_maxsal:=func_dept_maxsal(v_dept.department_id);
 v_dname:=func_dept_info(v_dept.department_id,v_num,v_avgsal);
 dbms_output.put_line(v_dname||'  '||v_maxsal||' '||v_avgsal||' '||v_num);
 end loop;
 end;
 set SERVEROUTPUT ON
 --创建包规范
 create or replace package pkg_emp
 as
  minsal number;
  maxsal number;
  e_beyondbound exception;
  procedure update_sal (p_empno number,p_sal number);
  procedure add_employee(p_empno number,p_sal number);
end pkg_emp;

--创建包体
 create or replace package body pkg_emp
 as
  procedure update_sal(p_empno number,p_sal number)
  as 
  begin
    select min(salary),max(salary)into minsal,maxsal from employees;
    if p_sal between minsal and maxsal then
     update employees set salary=p_sal where employee_id=p_empno;
     if sql%notfound then
       raise_application_error(-20000,'the employee doesn''t exist');
    end if;
  else 
    raise e_beyondbound;
  end if;
    exception
     when e_beyondbound then
       dbms_output.put_line('the salary is beyond bound!');
    end update_sal;
    procedure add_employee(p_empno number,p_sal number)
    as
    begin
      select min(salary),max(salary)into minsal,maxsal from employees;
      if p_sal between minsal and maxsal then
       insert into employees(employee_id,last_name,email,hire_date,job_id,
       salary,department_id)values(p_empno,'Smith','smith97@neusoft.edu.cn',sysdate,
       'ST_MAN',p_sal,20);
      else
        raise e_beyondbound ;
      end if;
  exception
    when e_beyondbound then
     dbms_output.put_line('the salary is beyond bound!');
  end add_employee;
end pkg_emp;
  --调用update_sal,add_employee
begin
  pkg_emp.update_sal(141,8000);
  pkg_emp.add_employee(217,9000);
end;
commit;
--触发器
create or replace trigger trg_secure_ep
before insert or update or delete on employees
begin
  if to_char(sysdate,'DY','NLS_DATE_LANGUAGE=AMERICAN')IN('SAT','SUN')
  THEN
    RAISE_APPLICATION_ERROR(-20005,'只能在正常的工作的时间内进行改变。');
  end if;
end trg_secure_emp;
set SERVEROUTPUT ON
create or replace trigger trg_emp_dept_stat
after insert or update of salary on employees
declare
  v_count number;
  v_salary number(6,2);
begin
  if inserting or deleting then
    for v_deptinfo in (select department_id,count(*)employee_count
    from employees group by department_id)loop
      dbms_output.put_line(v_deptinfo.department_id||' '||
      v_deptinfo.employee_count);
      end loop;
    elsif updating then
     for v_deptsal in(select department_id,avg(salary)avgsal from employees
     group by department_id)loop
      dbms_output.put_line(v_deptsal.department_id||' '||v_deptsal.avgsal);
    end loop;
  end if;
end trg_emp_dept_stat;
--更新工资后显示部门号及平均工资
update employees set salary=salary+100;
--创建行级触发器
create or replace trigger trg_emp_dml_row
before insert or update or delete on employees
for each row
begin
  if inserting then
    dbms_output.put_line(:new.employee_id||' '||:new.first_name||' '||
    :new.last_name);
  elsif updating then
   dbms_output.put_line(:old.salary||' '||:new.salary);
  else
   dbms_output.put_line(:old.employee_id||' '||:old.first_name||' '||
   :old.last_name);
   end if;
end trg_emp_dml_row;

 update employees  set salary=salary+100;
 delete from employees where employee_id=102;
 --变异表触发器
create or replace package mutate_pkg
as
  v_deptno number(2);
end;

create or replace  trigger trg_rmutate
before insert or update of department_id on employees
for each row
begin
  mutate_pkg.v_deptno:=:new.department_id ; 
end;

create or replace trigger trg_smutate
after insert or update of department_id on employees
declare
 v_num number(3);
begin
 select count(*)into v_num from employees
 where department_id=mutate_pkg.v_deptno;
 dbms_output.put_line('deptno:'||mutate_pkg.v_deptno);
 if v_num>20 then
   raise_application_error(-20003,'too many employees in department'||
   mutate_pkg.v_deptno);
 end if;
end;

insert into employees(employee_id,first_name,last_name,email,hire_date,job_id,
department_id)values(300,'Jason','Simth','jason@neusoft.edu.cn',
'AC_ACCOUNT',50);
--索引表中元素的删除及集合类型的属性和方法
DECLARE
  CURSOR all_emps is select employee_id,first_name,last_name from employees
  order by employee_id;
    type t_emp is record(
    empno employees.employee_id%type,
    fname employees.first_name%type,
    lname employees.last_name%type);
    type emp_table is table of t_emp index by binary_integer;
    emps emp_table;
    emps_index binary_integer :=0;
begin
 for emp in all_emps loop
  emps_index:=emps_index+1;
  emps(emps_index):=emp;
end loop;
dbms_output.put_line('there are '||emps.count||'employee.');--输出索引表元素个数
dbms_output.put_line('the min index values is:'||emps.first);--最小索引值
dbms_output.put_line('the max index values is:'||emps.last);--最大索引值
emps.delete(2);--删除索引值为2的值
emps.delete(6,10);--删除索引值从6到10的所有元素
dbms_output.put_line('at last,there are '||emps.count||'elements.');--剩余元素个数
for i in emps.first..emps.last loop
 if emps.exists(i)then
  dbms_output.put_line(emps(i).empno||' '||emps(i).fname||' '||
  emps(i).lname);--输出剩余元素
 end if;
 end loop;
end;

declare
  cursor all_emps is select*from employees;
  type t

commit;
--案例数据库触发器的创建，当员工职位或需求变动时，相关信息写入job_history表中
create or replace trigger trg_update_job_history
after update of job_id,department_id on employees
for each row
declare 
  v_start_date date ;
  v_num number;
 begin
  select count(*)into v_num from job_history
  where employee_id=:old.employee_id;
  if v_num=0 then
    v_start_date:=:old.hire_date;
  else
   select max(end_date)into v_start_date from job_history
   where employee_id=:old.employee_id;
end if;
 insert into job_history
 values(:old.employee_id,v_start_date,sysdate,:old.job_id,
 :old.department_id);
end trg_update_job_history;
--将员工信息保存到一个嵌套表变量中，并显示员工号，员工姓名，工资与部门号
set SERVEROUTPUT ON
declare

  cursor all_emps is select*from employees;
  type t_empnested is table of employees%rowtype;
  v_emp t_empnested  :=t_empnested();
  indexvalue binary_integer：=1；
begin
 for emp in all_emps loop
  v_emp.extend;
  v_emp(indexvalue):=emp;
  indexvalue:=indexvalue+1;
end loop;
for i in  1..v_emp.count loop
    dbms_output.put_line(v_emp(i).employee_id||' '||v_emp(i).first_name||' '||
    v_emp(i).last_name||''||v_emp(i).salary)||' '||v_emp(i).department_id);
end loop;
end;


commit;

select * from system_privilege_map;

connect myth/ad @orcl;

connect as sysdba

--查看当前用户 
select user from dual;

create user  hr1 identified by  123;
create user hr2 identified by 123;

grant create session  ,create table ,create view to hr1;
grant select ,insert ,update on hr.employees to hr1 with grant option;
grant select,update on hr.employees to hr2;
revoke  select  ,update on hr.employees from hr1;
select *from ALL_TAB_PRIVS where username='myth';-- user_sys_privs 
--Hgggg
select * from departments d where not exists(
select *from employees e where e.department_id=d.department_id);

select  employee_id,first_name,last_name,d.avgsal from employees,(
select department_id,avg(salary)avgsal from employees group by
department_id) d where employees.department_id=d.department_id;

select  d.department_id,department_name,ds.amount,ds.avgsal from departments d,(
select department_id,count(*）amount,avg(salary)avgsal from employees
group by department_id)ds where d.department_id=ds.department_id;

select *from(
select employee_id,first_name,last_name,salary from employees order by salary desc)
nested_orde where rownum<=5;

commit;

select *from(
select rownum num,employee_id,first_name,last_name,salary from
(select employee_id,first_name,last_name,salary from employees order by salary desc)
nested_order1)nested_order2 where num between 5 and 10;

create table emp_subquery as
select employee_id,first_name,salary from employees;

create view emp_view_subquery as select *from employees where salary >2000;
--1
create user usera_exer identified by usera default tablespace users quota 10m 
on users account lock;
--2
create user userb_exer3 identified by userb ;
--3
grant create session to usera_exer with admin option;
grant  select,update on ehr.employees to usera_exer with admin  option;
--4
alter  user usera_exer account unlock;
--5
connect usera_exer/usera
select *from ehr.employees ;
update ehr.employees set salary=salary+200;
grant select ,update on ehr.employees to userb_exer;
--6
revoke create session from usera_exer;
grant create session to usera_exer;
--7
revoke select ,update on hr.employees from usera_exer;
grant select ,update on hr.employees to usera_exer;
--8
create  role rolea;
create role  roleb;
grant create table to rolea;
grant insert ,delete on hr.employees to rolea;
grant connect ,resource to roleb;
--9
create rolea,roleb to usera_exer;
--10
create  profile pwd_file limit connect_time 30
idle_time 10 failed_login_attempts 4
password_lock_time 10
password_life_time 20;
alter user usera_exer profile pwd_file;

conn hr/hr;











conn as sysdba


select name from v$database;










  


  
  
 
  
  
  
    
  
 
 
