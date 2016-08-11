create view bobooks as 
select `bi`.`bno` AS `bno`,`bi`.`nows` AS `nows`,`bi`.`Book` AS `book`,`bi`.`bname` AS `bname`,`bc`.`classname` AS `classname`,`bo`.`reDate` AS `reDate`
from (`bookclass` `bc` join (`bookinfo` `bi` left join `borrow` `bo` on((`bo`.`bno` = `bi`.`bno`))))
where (`bi`.`classno` = `bc`.`classno`);

create view bookes as 
select `bi`.`bno` AS `bno`,`bi`.`Book` AS `Book`,`bi`.`bname` AS `bname`,`bi`.`author` AS `author`,`bi`.`descr` AS `descr`,`bi`.`price` AS `price`,`bi`.`classno` AS `classno`,`bi`.`isbn` AS `isbn`,`bi`.`nows` AS `nows`,`bi`.`Search` AS `Search`,`bi`.`Borrowed` AS `Borrowed`,`bi`.`cover` AS `cover`,`bc`.`classname` AS `classname`
from (`bookinfo` `bi` left join `bookclass` `bc` on((`bi`.`classno` = `bc`.`classno`)));

drop view usebook;
create view usebook as select u.uname,bi.bname,bo.*,bo.fee*bo.overdays fees from borrow bo,users u,bookinfo bi where bo.uno=u.uno and bi.bno=bo.bno;

drop view backbook;
create view backbook as select u.uname,bi.bname,bi.nows,bo.*,bo.fee*bo.overdays fees from backed bo,users u,bookinfo bi where bo.uno=u.uno and bi.bno=bo.bno;

insert into bookinfo (bno,banme,author,classno,desc,isbn,price,now) values('1','1','1',0,'1','1',1,1)

delete from bookinfo 

INSERT INTO `bookinfo` VALUES ('1470017',100007,'代码之殇','Eric Brechner','本书是《代码大全》的姊妹篇，资深软件开发专家30余年工作经验结晶，被誉为 软件行业的财富 ，微软公司软件工程师必读之书。它从软件开发流程、技术、方法、项目管理、团队管理、人际沟通等多角度总结出90余个具有代表性的问题（大多数问题可能会给公司或软件项目带来毁灭性灾难），并给出了问题的解决方案和最佳实践，值得所有软件工程师和项目管理者研读。',79,118001,'9787111416821',1,4,0,'img/Cover/9787111416821.jpg')

INSERT INTO `bookinfo` VALUES ('1470022',100008,'Thinking in java','Bruce Eckel','本书赢得了全球程序员的广泛赞誉，即使是最晦涩的概念，在Bruce Eckel的文字亲和力和小而直接的编程示例面前也会化解于无形。从Java的基础语法到最高级特性（深入的面向对象概念、多线程、自动项目构建、单元测试和调试等），本书都能逐步指导你轻松掌握。',79,118001,'9780131872486',1,4,0,'img/Cover/9780131872486.jpg')

alter table bookclass MODIFY classno INT AUTO_INCREMENT;

update bookinfo set classno = 118004 where book=100010
--插入大量垃圾数据后，更新书籍相关信息
update bookinfo set borrowed = count(

insert into bookclass(classname,detail) values('s','s');

--如果要取年份 要记得加上1990的时间戳
select date_format(boDate,'%m') from borrow where date_format(boDate,'%m')=5;

--  不能在分组后使用having来限制没用来分组的属性，因为被去掉了 比如是按月来分组，你却使用年来做条件限制，这样的条件是无效的，加了也是没加
select boDate,count(*),date_format(boDate,'%m'),date_format(boDate,'%Y') 
from backed where date_format(boDate,'%Y')='2016' group by date_format(boDate,'%m')  order by date_format(boDate,'%m') ;

delete from backed where date_format(boDate,'%m')=4;

create view backeds as 

 select date_format(boDate,'%y') from backed group by date_format(boDate,'%y')


commit;

-- 检查罚款问题
use test;
insert into test values(curdate(),'2016-06-18',null);

update test set overDays=(curdate()-boDate) factDate from backed where factDate is null limit 0,50;

update test set overDate=(month(curdate())-month(boDate)) where factDate is null 

--#获取当前时间与i个月之间的天数 
--   i>0 是以前的日期，假设当前是5月19 且i=1 就是算4月19到今天的天数

select datediff(curdate(), date_sub(curdate(), interval 12 month));
-- 已经成功算出来了 当前日期和归还日期之差
select id,overDays,((year(curdate())-year(reDate))*12+(month(curdate())-month(reDate))) m,(select datediff(curdate(), date_sub(curdate(), interval m month))+day(curDate())-day(reDate)) d 
from test2  where factDate is null 

--算出来并 一一 更改 数据  backed
update backed set overdays = (select days from (select id,((year(curdate())-year(reDate))*12+(month(curdate())-month(reDate))) m,(select datediff(curdate(), date_sub(curdate(), interval m month))+day(curDate())-day(reDate)) days 
from backed  where factDate is null and curdate()>reDate) e where  e.id=backed.id ) where factDate is null ;
update backed set already=0 where overDays is not null;
--算出来并 一一 更改 数据  borrow
update borrow set overdays = (select days from (select id,((year(curdate())-year(reDate))*12+(month(curdate())-month(reDate))) m,(select datediff(curdate(), date_sub(curdate(), interval m month))+day(curDate())-day(reDate)) days 
from borrow where factDate is null and curdate()>reDate) e where  e.id=borrow.id and factDate is null) where factDate is null ;
update borrow set already=0 where overDays is not null;

update borrow set already=1 where overDays is null;

--快速复制一个表，缺点是不会复制索引，实际上不需要复制一个表
create table test2 as select * from test where 1=0
INSERT INTO `test2` VALUES (1,'2016-03-05',NULL,'2016-04-08',NULL,'2000-02-14'),(2,'2016-04-01',NULL,'2015-05-01',NULL,'2000-01-18');

delete from backed where factDate is not null;
-- 添加自动增长的主键列
alter table `borrow` add column `id` int not null auto_increment primary key comment '主键' first; 

select uname,count(*) from backbook group by uname desc;
--修正图书可借状态
update bookinfo set nows=1;
update backbook set nows=0 where factDate is null;
update users set borrowed=0;

update users set owe=(select sum(overDays)*fee from borrow where uno=2016005) where uno=2016005;


