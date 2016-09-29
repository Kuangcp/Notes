CREATE TABLE STUDENT (SNO NUMBER NOT NULL , SNAME VARCHAR2(20) NOT NULL , SSEX CHAR(10) NOT NULL , SAGE NUMBER , SDEPT VARCHAR2(20) , CONSTRAINT STUDENT_PK PRIMARY KEY ( SNO  ));
create table Course( Cno number primary key,Cname varchar2(20) not null,Cpno number,  Ccredit varchar(20));
CREATE TABLE SC ( SNO NUMBER NOT NULL , CNO NUMBER NOT NULL , GRADE NUMBER , CONSTRAINT SC_PK PRIMARY KEY (  SNO , CNO  ));

alter table SC add CONSTRAINT SC_sno foreign key (sno) references student(sno);
alter table SC add CONSTRAINT SC_cno foreign key (cno) references course(cno);

insert into student values(14,'rt','男',21,'CS');
insert into course values (46,'大学语文',45,2);
insert into sc values (12,45,68);
----创建基本表
