-- 查询某人的工资，有异常捕捉
declare 
	v_sal employees.salary%type;
begin 
	select salary into v_sal from employees where last_name='smith';
	dbms_output.put_line(v_sal);
EXCEPTION
	when no_data_found then 
		dbms_output.put_line(v_sal);
	when too_many_rows then 
		for v_emp in (select * from employees where last_name='smith') loop
			dbms_output.put_line(v_emp.employee_id||''||v_emp.first_name);
		end loop;
end;
--------------- 给不同部门号的某员工加不同的工资  ---------------
create or replace procedure test(
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
end test;
--执行存储过程
execute test(100);


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

--显示时间戳
declare

begin
	dbms_output.put_line(systimestamp);
end;
	
	
	
	