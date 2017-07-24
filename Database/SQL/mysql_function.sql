---函数部分,修改定界符 
delimiter //
CREATE FUNCTION hello (s CHAR(20)) RETURNS CHAR(50)
 RETURN CONCAT('Hello, ',s,'!');
//
--将定界符改回来，是第二句SQL语句
delimiter ;

select hello('Myth ');
drop function hello;
-------------------------------------------------------
drop table if exists temp ;
create table temp as (select a.sno,sname,a.grade c_20002,a.credit f_20002,b.grade c_20003,b.credit f_20003,c.grade c_20004,c.credit f_20004 from 
       (select sno,grade,credit from mark,course  where mark.cno='20002' and mark.cno=course.cno) a,
       (select sno,grade,credit from mark,course  where mark.cno='20003' and mark.cno=course.cno) b,
       (select sno,grade,credit from mark,course  where mark.cno='20004' and mark.cno=course.cno) c,       
       student 
       where a.sno=b.sno and a.sno=student.sno and b.sno=c.sno
);
-----------------------------------------------存储过程 使用call关键字调用-----------------------------------------
delimiter //
create procedure getGrade(classid varchar(20),years varchar(20),terms int)
	begin 
		declare num int ;
		declare i int default 0;
		
		select cname from obligatory o ,course c where o.cno = c.cno and cid =  classid and year = years and term = terms;
		
		select count(*) into num from obligatory o ,course c where o.cno = c.cno and cid =  classid and year = years and term = terms;
		
		
		
	end;
	//
	
	 call getGrade('3','2015-2016',1)//
	 
	grades:loop
			if i<num then ;
			end if;
			leave grades;
		end loop grades;
		
select cname from obligatory o ,course c where o.cno = c.cno and cid =  '3' and year = '2015-2016' and term = 1;
