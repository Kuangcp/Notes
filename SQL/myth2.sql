drop table dates;

create table datess(hj Date)
insert into datess values (to_date('2018-02-02 19:23:45','yyyy-mm-dd hh24:mi:ss'));
select hj from datess;

select table_name from user_tables;
--查找管理者名字
select e.last_name,e.EMPLOYEE_ID,t.last_name,t.EMPLOYEE_ID from employees e,employees t where e.manager_id =t.employee_id and t.last_name='Hunold';
--入职年份排序
select e.*,t.*from employees e ,EMPLOYEES t where e.MANAGER_ID = t.EMPLOYEE_ID and 
   e.HIRE_DATE<t.hire_date;
--管理者地址
select d.*,l.STREET_ADDRESS from departments d ,locations l,employees e 
where d.manager_id = e.employee_id and d.location_id = l.LOCATION_ID;

select d.*,e.* from DEPARTMENTS d left join EMPLOYEES e on d.DEPARTMENT_ID=e.DEPARTMENT_ID ;

select e.*,d.* from EMPLOYEES e left join DEPARTMENTS d on d.DEPARTMENT_ID=e.DEPARTMENT_ID;

select e.EMPLOYEE_ID,e.LAST_NAME,e.SALARY,e.SALARY*nvl(e.COMMISSION_PCT,0) 奖金,j.JOB_TITLE,d.DEPARTMENT_NAME from JOBS j ,EMPLOYEES e left join DEPARTMENTS d on  e.DEPARTMENT_ID=d.DEPARTMENT_ID  where e.JOB_ID=j.JOB_ID;

select d.* from departments d where department_id in (select department_id from employees group by department_id);

select e.* from employees e where e.SALARY>(select salary from EMPLOYEES where employee_id=103);

select e.* from EMPLOYEES e where e.SALARY>(select avg(salary)from EMPLOYEES);

select e.DEPARTMENT_ID,e.JOB_ID,max(e.salary) from EMPLOYEES e group by e.JOB_ID,e.DEPARTMENT_ID; 

select e.DEPARTMENT_ID,count(*),avg(e.salary) from EMPLOYEES e GROUP by e.DEPARTMENT_ID;

select e.job_id,min(e.salary) from employees e  group by e.job_id having min(e.salary)>5000;

select e.department_id,avg(e.salary) from employees e group by e.department_id having avg(e.salary)<10000 and department_id is not null;--
--查询平均工资低于6000的部门及其员工信息
--1 使用左外连接 效率略高 注意左表的空值
select * from  (select e.department_id from employees e group by e.department_id having avg(e.salary)<10000) s left join EMPLOYEES t  on s.department_id=t.department_id;
--2 等值连接
select a.*,b.* from EMPLOYEES a,DEPARTMENTS b where a.department_id in (select department_id from employees group by department_id having avg(salary)<10000 ) and a.department_id =b.department_id;
--------
select last_name from EMPLOYEES e,DEPARTMENTS d where e.department_id = d.department_id and d.DEPARTMENT_NAME='Sales';

select * from EMPLOYEES where job_id = (select job_id from EMPLOYEES where employee_id=140);

select last_name,salary from employees where salary >(select max(salary) from employees where department_id=30);
--各个部门的平均入职年份
select department_id,count(*) 人数,avg(salary),avg((select to_char(sysdate,'yyyy') from dual)- to_char(hire_date,'yyyy')) from EMPLOYEES group by department_id ;

select hire_date from EMPLOYEES;

select to_char(sysdate,'yyyy')- to_char(hire_date,'yyyy') from dual,EMPLOYEES;
--工资与某部门平均工资相等
select * from employees where salary in (select avg(salary) from employees group by department_id) ;
--工资与本部门平均工资相等 先插入个数据
insert into employees values(210,'r','e','32',34,sysdate,'AD_ASST',2200,0.3,134,210);
select *from EMPLOYEES e where e.salary = (select avg(t.salary) from EMPLOYEES t group by department_id having t.department_id = e.department_id);

--查询大于5000的部门和员工信息
--正确的
select d.*,s.* from departments d ,employees s where 5000<all(select salary from employees e where d.department_id = e.department_id) and d.department_id = s.department_id;
--正确的
select * from (select d.* from departments d  where 5000<all(select salary from employees e where d.department_id = e.department_id)) d , EMPLOYEES s where d.department_id = s.department_id;

--查询所有员工工资大于10000的部门  any 和all 的使用<any 小于某一个值（小于最大值）<all 小于最小值

select distinct  d.* from DEPARTMENTS d ,employees e where 10000<all(select salary from employees e where d.department_id = e.department_id)  and d.department_id = e.department_id;

--4000 到 8000 的部门员工 去除空部门
--之前是逻辑错误了 
select * from departments f,employees em
where not exists  (
            select d.* from departments d
            where exists (
                        select * from employees e
                        where d.department_id = e.department_id  and (salary <4000 or salary >8000)--between 4000 and 8000
                        ) 
            and d.department_id = f.department_id
            ) and f.DEPARTMENT_ID=em.DEPARTMENT_ID;

select * from employees where department_id in (10);

commit;
--查询人数最多的部门
select * from (select department_id,count(*) 人数 from employees group by department_id order by count(*) desc ) r where rownum <2;

select * from (select * from employees where department_id = 30  order by salary desc) e where rownum <4;

--查询排名为5-10的员工
select * from employees order by salary desc;

--行号已经
select * from (select salary,rownum ee from employees e order by salary desc ) r where ee between 5 and 10;

--书上：
select * from (
          select rownum ee ,es.* from (
          --先排序，再重置行号，再选取排名才是对的， 先重置行号，再排序，再取排名就是未排序的顺序了
              select * from employees order by salary desc
              ) es --employee_id,first_name,last_name,salary
) ew where ee between 5 and 10;

--将所有员工工资统一修改为部门平均工资加上1000 注意要做回滚点，不然数据就全玩了
savepoint a;
select department_id,avg(salary)+1000 from employees group by department_id order by department_id desc;
select * from employees order by department_id desc;
update employees e set salary =((select avg(salary) from employees s group by department_id having e.department_id=s.department_id)+1000) where e.department_id is not null;


rollback to a;
commit;

---获取一个日期的当月最后一天的日期  再用一个获取天数的函数，得到天数
select extract(day from last_day(hire_date)) from employees;
--当前月倒数第二天入职的人员
select  * from employees where extract (day from (last_day (hire_date)))-2 = extract (day from hire_date);
--查询工龄大于十年的员工
select * from employees where extract (year from sysdate) - extract(year from hire_date)>=10;

select employee_id,FIRST_NAME,initcap(last_name) from employees ;

select * from  employees where first_name like '_e%';
select  employee_id,replace(first_name,'s','S') from employees ;
commit;
--查询工资高于本部门的员工及其部门平均工资
select * from (select department_id,avg(salary) 平均工资 from employees group by department_id) d,employees e where e.department_id=d.department_id and e.salary>d.平均工资; 
commit;