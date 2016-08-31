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

-----------------------------------------------存储过程 使用call关键字调用-----------------------------------------
delimiter //
create procedure getGrade(classid varchar(20),years varchar(20),terms int)
	begin 
		declare num int ;
		declare i int default 0;
		
		select cname from obligatory o ,course c where o.cno = c.cno and cid =  classid and year = years and term = terms;
		
		select count(*) into num from obligatory o ,course c where o.cno = c.cno and cid =  classid and year = years and term = terms;
		
		
		grades:loop
			if i<num then ;
			end if;
			leave grades;
		end loop grades;
	end;
	//