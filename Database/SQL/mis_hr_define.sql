# Host: localhost  (Version: 5.5.19)
# Date: 2016-09-13 19:18:53
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "attendance"
#

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` varchar(255) DEFAULT NULL COMMENT '打卡表',
  `dates` date DEFAULT NULL,
  `ontimes` time DEFAULT NULL COMMENT '打卡的时间点',
  `offtimes` time DEFAULT NULL COMMENT '退卡时间',
  `types` int(11) DEFAULT NULL COMMENT '上午1下午0',
  `fee` float(4,2) unsigned NOT NULL DEFAULT '10.00' COMMENT '迟到单天价格',
  KEY `P_IDI` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "attendance"
#

INSERT INTO `attendance` VALUES ('2','2016-05-01','07:07:00','13:00:00',1,10.00);

#
# Structure for table "bonus_record"
#

DROP TABLE IF EXISTS `bonus_record`;
CREATE TABLE `bonus_record` (
  `id` varchar(255) DEFAULT NULL,
  `dates` date DEFAULT NULL,
  `bonus` float(8,2) DEFAULT NULL,
  `attendance` float(4,2) DEFAULT NULL COMMENT '考勤奖金的计算的状态（有值就是计算了，0或空就是等待计算）',
  `insurance` float(4,2) DEFAULT NULL COMMENT '五险的计算',
  KEY `P_IDB` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "bonus_record"
#

INSERT INTO `bonus_record` VALUES ('1','2016-05-01',300.00,NULL,NULL),('2','2016-05-03',400.00,NULL,NULL),('2','2016-04-03',400.00,NULL,NULL),('2','2016-03-03',400.00,NULL,NULL),('1','2016-04-03',300.00,NULL,NULL),('3','2016-06-10',500.00,NULL,NULL);

#
# Structure for table "department"
#

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department` char(10) NOT NULL,
  `dname` char(10) DEFAULT NULL,
  `manager` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`department`),
  KEY `manager` (`manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "department"
#

INSERT INTO `department` VALUES ('1001','SALE','1'),('1002','IT','1'),('1003','HR','1');

#
# Structure for table "emp"
#

DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `uid` char(16) NOT NULL DEFAULT '',
  `name` char(20) DEFAULT NULL,
  `pass` char(16) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` char(8) DEFAULT NULL,
  `education` char(10) DEFAULT NULL COMMENT '学历',
  `politics` char(10) DEFAULT NULL COMMENT '政治面貌',
  `professional` char(32) DEFAULT NULL COMMENT '专业',
  `phone` char(16) DEFAULT NULL,
  `hobbies` char(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `national` varchar(8) NOT NULL DEFAULT '汉' COMMENT '民族',
  `natives` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `formal` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '1表示转正',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "emp"
#

INSERT INTO `emp` VALUES ('E1','Myth','1',23,'男','本科','团员','物联网','15979911232','吉他','无','汉','江西',0),('E2','Lee','2',24,'女','本科','团员','市场营销','15979921287','背包客','无','汉','江西',0),('E3','Canny','3',23,'男','本科','团员','营销','18978329888','无','无','汉','江西',0);

#
# Structure for table "emp_score"
#

DROP TABLE IF EXISTS `emp_score`;
CREATE TABLE `emp_score` (
  `uid` char(16) DEFAULT NULL,
  `work` char(20) DEFAULT '0' COMMENT '能力评分',
  `attitude` char(16) DEFAULT '0' COMMENT '态度评分',
  `precent` char(16) DEFAULT '0' COMMENT '绩效评分',
  `em` int(11) DEFAULT '0' COMMENT '转正1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "emp_score"
#


#
# Structure for table "insurance"
#

DROP TABLE IF EXISTS `insurance`;
CREATE TABLE `insurance` (
  `no` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL,
  `company` float(2,2) DEFAULT NULL,
  `personal` float(2,2) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "insurance"
#

INSERT INTO `insurance` VALUES (1,'YangLao',0.20,0.08),(2,'YiLiao',0.06,0.02),(3,'ShiYe',0.02,0.01),(4,'GongShang',0.01,0.00),(5,'ShengYu',0.01,0.00);

#
# Structure for table "jobs"
#

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `job` char(10) NOT NULL,
  `jname` char(22) DEFAULT NULL,
  PRIMARY KEY (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "jobs"
#

INSERT INTO `jobs` VALUES ('2001','Sales'),('2002','Programmer'),('2003','MANAGER'),('2004','Telephione'),('2005','Receptionist'),('2006','Cleaning'),('2007','Maintenance'),('2008','DBA');

#
# Structure for table "recruit"
#

DROP TABLE IF EXISTS `recruit`;
CREATE TABLE `recruit` (
  `Rid` varchar(16) NOT NULL DEFAULT '' COMMENT '招聘的流水号',
  `department` char(10) DEFAULT NULL COMMENT '部门',
  `job` char(10) DEFAULT NULL COMMENT '职位',
  `need` int(11) DEFAULT NULL COMMENT '需求人数',
  `limits` int(11) DEFAULT NULL COMMENT '投递限额',
  `fact` int(11) NOT NULL DEFAULT '0' COMMENT '实投',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '有效状态  1',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述即需求',
  PRIMARY KEY (`Rid`),
  KEY `F_D` (`department`),
  KEY `F_J` (`job`),
  CONSTRAINT `F_D` FOREIGN KEY (`department`) REFERENCES `department` (`department`),
  CONSTRAINT `F_J` FOREIGN KEY (`job`) REFERENCES `jobs` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='某项职位招聘情况';

#
# Data for table "recruit"
#

INSERT INTO `recruit` VALUES ('3001','1001','2001',5,10,0,1,'工资：2k-5k，品行端正，有较强的逻辑思维能力'),('3002','1002','2002',6,12,0,1,'工资：2k-5k，吃苦耐劳，良好的团队合作精神'),('3003','1003','2005',2,6,0,1,'工资：2k-3k，工作积极主动，抗压能力强'),('3004','1003','2006',3,6,0,1,'工资：2k-3k，亲和力强，有团队荣誉感'),('3005','1002','2008',1,5,0,1,'工资：8k-10k，心态积极向上，有激情，目标明确');

#
# Structure for table "em_re"
#

DROP TABLE IF EXISTS `em_re`;
CREATE TABLE `em_re` (
  `uid` char(16) DEFAULT NULL,
  `rid` varchar(16) DEFAULT NULL,
  `dates` date DEFAULT NULL,
  `hire` int(3) DEFAULT NULL COMMENT '是否录用',
  KEY `F_UI` (`uid`),
  KEY `F_RI` (`rid`),
  CONSTRAINT `F_RI` FOREIGN KEY (`rid`) REFERENCES `recruit` (`Rid`),
  CONSTRAINT `F_UI` FOREIGN KEY (`uid`) REFERENCES `emp` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "em_re"
#

INSERT INTO `em_re` VALUES ('E2','3001','2016-06-11',0),('E2','3002','2016-06-11',0),('E2','3001','2016-06-11',0),('E3','3001','2016-06-11',0),('E3','3003','2016-06-11',1);

#
# Structure for table "sal_record"
#

DROP TABLE IF EXISTS `sal_record`;
CREATE TABLE `sal_record` (
  `id` varchar(255) DEFAULT NULL,
  `dates` date DEFAULT NULL,
  `base` float(8,2) DEFAULT NULL,
  `base_sal` float(6,2) unsigned NOT NULL DEFAULT '12.00',
  KEY `P_IDS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sal_record"
#

INSERT INTO `sal_record` VALUES ('1','2016-05-04',3000.00,12.00),('2','2016-05-05',3000.00,12.00),('3','2016-06-10',3000.00,12.00);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL DEFAULT '0',
  `name` char(20) DEFAULT NULL,
  `pass` varchar(14) NOT NULL DEFAULT '123',
  `sex` char(4) NOT NULL DEFAULT '男',
  `age` int(11) DEFAULT NULL,
  `entry` date DEFAULT NULL,
  `job` char(10) DEFAULT NULL,
  `salary` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `bonus` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `department` char(10) DEFAULT NULL,
  `superior` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_SUPER` (`superior`),
  KEY `P_dept` (`department`),
  KEY `P_JOB` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES ('1','李洁','123','女',19,'2016-05-14','2003',1000.00,100.00,'1001','1'),('100','Myth','123','男',23,'2016-06-11',NULL,0.00,0.00,NULL,'1'),('2','Myth','123','男',21,'2016-07-01','2002',3000.00,500.00,'1002','1'),('3','Lee','123','女',27,'2016-07-01','2005',3000.00,500.00,'1002','1'),('300','Canny','123','男',23,'2016-06-11','2005',0.00,0.00,'1003','1');

#
# Structure for table "all_sals"
#

DROP VIEW IF EXISTS `all_sals`;
CREATE VIEW `all_sals` AS 
  select `s`.`id` AS `id`,`user`.`name` AS `name`,date_format(`s`.`dates`,_utf8'%Y-%m') AS `Y_M`,`s`.`base` AS `base`,`b`.`bonus` AS `bonus`,(`s`.`base` + `b`.`bonus`) AS `all_sal` from ((`sal_record` `s` join `bonus_record` `b`) join `user`) where ((`s`.`id` = `b`.`id`) and (date_format(`s`.`dates`,_utf8'%Y-%m') = date_format(`b`.`dates`,_utf8'%Y-%m')) and (`s`.`id` = `user`.`id`));

#
# Structure for table "em_res"
#

DROP VIEW IF EXISTS `em_res`;
CREATE VIEW `em_res` AS 
  select `em_re`.`rid` AS `rid`,`em_re`.`dates` AS `dates`,`em_re`.`hire` AS `hire`,`emp`.`uid` AS `uid`,`emp`.`name` AS `name`,`emp`.`pass` AS `pass`,`emp`.`age` AS `age`,`emp`.`sex` AS `sex`,`emp`.`education` AS `education`,`emp`.`politics` AS `politics`,`emp`.`professional` AS `professional`,`emp`.`phone` AS `phone`,`emp`.`hobbies` AS `hobbies`,`emp`.`experience` AS `experience`,`emp`.`national` AS `national`,`emp`.`natives` AS `natives`,`emp`.`formal` AS `formal` from (`em_re` join `emp`) where (`em_re`.`uid` = `emp`.`uid`);

#
# Structure for table "emp_sco"
#

DROP VIEW IF EXISTS `emp_sco`;
CREATE VIEW `emp_sco` AS 
  select `es`.`work` AS `work`,`es`.`attitude` AS `attitude`,`es`.`precent` AS `precent`,`es`.`em` AS `em`,`e`.`uid` AS `uid`,`e`.`name` AS `name`,`e`.`pass` AS `pass`,`e`.`age` AS `age`,`e`.`sex` AS `sex`,`e`.`education` AS `education`,`e`.`politics` AS `politics`,`e`.`professional` AS `professional`,`e`.`phone` AS `phone`,`e`.`hobbies` AS `hobbies`,`e`.`experience` AS `experience`,`e`.`national` AS `national`,`e`.`natives` AS `natives`,`e`.`formal` AS `formal` from (`emp_score` `es` join `emp` `e`) where (`es`.`uid` = `e`.`uid`);

#
# Structure for table "recruits"
#

DROP VIEW IF EXISTS `recruits`;
CREATE VIEW `recruits` AS 
  select `r`.`Rid` AS `Rid`,`r`.`department` AS `department`,`r`.`job` AS `job`,`r`.`need` AS `need`,`r`.`limits` AS `limits`,`r`.`fact` AS `fact`,`r`.`state` AS `state`,`r`.`description` AS `description`,`d`.`dname` AS `dname`,`j`.`jname` AS `jname` from ((`recruit` `r` join `department` `d`) join `jobs` `j`) where ((`r`.`department` = `d`.`department`) and (`r`.`job` = `j`.`job`));

#
# Structure for table "users"
#

DROP VIEW IF EXISTS `users`;
CREATE VIEW `users` AS 
  select `a`.`id` AS `id`,`a`.`name` AS `name`,`a`.`sex` AS `sex`,`a`.`age` AS `age`,`a`.`entry` AS `entry`,`a`.`job` AS `job`,`a`.`salary` AS `salary`,`a`.`bonus` AS `bonus`,`a`.`department` AS `department`,`a`.`superior` AS `superior`,`b`.`name` AS `sname`,`jobs`.`jname` AS `jname`,`department`.`dname` AS `dname` from (((`user` `a` join `user` `b`) join `jobs`) join `department`) where ((`a`.`superior` = `b`.`id`) and (`a`.`job` = `jobs`.`job`) and (`a`.`department` = `department`.`department`));

#
# Structure for table "v_attendance"
#

DROP VIEW IF EXISTS `v_attendance`;
CREATE VIEW `v_attendance` AS 
  select `a`.`id` AS `id`,`a`.`dates` AS `dates`,`a`.`ontimes` AS `ontimes`,`a`.`offtimes` AS `offtimes`,`a`.`types` AS `types`,`a`.`fee` AS `fee`,`u`.`name` AS `name` from (`attendance` `a` join `user` `u`) where (`a`.`id` = `u`.`id`);
