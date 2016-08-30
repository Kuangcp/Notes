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