alter table emp add constraint PK_U primary key(uid)

alter table tablename auto_increment 1;


create table emp (uid char(16),name char(20),pass char(16),age int,sex char(2),education char(10)
       ,politics char(10),professional char(32),phone char(16),hobbies char(255),experience varchar(255));
       
create table em_re(uid char(16),rid varchar(16),dates date,hire int(3));
       
       
create view recruits as select r.*,d.dname,j.jname from recruit r,department d,jobs j where r.department=d.department and r.job=j.job

create view em_res as select rid,dates,hire,emp.* from em_re,emp where em_re.uid=emp.uid ;

select * from attendance where dates='2016-05-02';   
select curdate()

select * from attendance where id='2' and dates=curdate()order by ontimes desc 

create table inserts(a int,d int);
insert into inserts values(1,select d from inserts);


create table emp_score (uid char(16),work char(20),attitude char(16),precent char(16),em int )

create view emp_sco as select es.work,es.attitude,es.precent,es.em,e.* from emp_score es,emp e where es.uid = e.uid;

update user set department=(select department from recruit,em_re where em_re.rid=recruit.rid and em_re.uid='E1'),job=(select job from recruit,em_re where em_re.rid=recruit.rid and em_re.uid='E1') where id=100


select hire from em_re where uid='E1'
