# Host: localhost  (Version 5.5.19)
# Date: 2016-08-20 16:39:04
# Generator: MySQL-Front 5.3  (Build 5.39)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "academy"
#

DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy` (
  `aid` varchar(20) NOT NULL COMMENT '学院编号a01',
  `academy` varchar(20) NOT NULL COMMENT '学院',
  `ainfo` varchar(20) DEFAULT NULL COMMENT '学院介绍',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "academy"
#

INSERT INTO `academy` VALUES ('IT','信息科学与技术学院','专注于技术，扩展于其他');

#
# Structure for table "assitant"
#

DROP TABLE IF EXISTS `assitant`;
CREATE TABLE `assitant` (
  `ano` int(11) NOT NULL AUTO_INCREMENT COMMENT '辅导员工号',
  `aname` varchar(20) NOT NULL COMMENT '姓名',
  `pass` varchar(20) NOT NULL COMMENT '密码',
  `asex` char(4) NOT NULL COMMENT '性别',
  `ainfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "assitant"
#


#
# Structure for table "course"
#

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cno` varchar(20) NOT NULL COMMENT '课程编号\nk111',
  `cname` varchar(20) NOT NULL COMMENT '名称',
  `credit` float(4,2) NOT NULL COMMENT '学分',
  `theoryhour` float(4,2) NOT NULL COMMENT '理论课时',
  `practicehour` float(4,2) DEFAULT NULL COMMENT '实践课时',
  `ctype` varchar(20) NOT NULL COMMENT '课程类型',
  `cacademy` varchar(20) NOT NULL COMMENT '所属学院',
  `cinfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cno`),
  KEY `PK_ACA` (`cacademy`),
  CONSTRAINT `PK_ACA` FOREIGN KEY (`cacademy`) REFERENCES `academy` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "course"
#

INSERT INTO `course` VALUES ('20002','编译原理',4.00,48.00,32.00,'基础课程','IT',NULL),('20003','单片机',3.00,32.00,32.00,'51单片机','IT','3');

#
# Structure for table "history"
#

DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `name` varchar(20) DEFAULT NULL,
  `times` datetime DEFAULT NULL,
  `adds` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "history"
#

INSERT INTO `history` VALUES ('12','2016-08-14 23:19:40','0:0:0:0:0:0:0:1'),('12','2016-08-15 20:28:47','0:0:0:0:0:0:0:1'),('12','2016-08-15 20:30:02','0:0:0:0:0:0:0:1'),('12','2016-08-15 21:34:06','0:0:0:0:0:0:0:1'),('12','2016-08-15 21:34:41','0:0:0:0:0:0:0:1'),('12','2016-08-15 21:34:50','0:0:0:0:0:0:0:1'),('12','2016-08-15 21:35:18','0:0:0:0:0:0:0:1'),('12','2016-08-15 21:38:14','0:0:0:0:0:0:0:1'),('12','2016-08-15 21:39:34','0:0:0:0:0:0:0:1'),('12','2016-08-15 21:39:59','0:0:0:0:0:0:0:1'),('15','2016-08-15 21:42:29','0:0:0:0:0:0:0:1'),('15','2016-08-15 21:42:48','0:0:0:0:0:0:0:1'),('12','2016-08-15 21:43:03','0:0:0:0:0:0:0:1'),('16','2016-08-15 21:43:24','0:0:0:0:0:0:0:1'),('15','2016-08-15 21:43:29','0:0:0:0:0:0:0:1'),('16','2016-08-15 21:43:33','0:0:0:0:0:0:0:1'),('12','2016-08-15 21:43:39','0:0:0:0:0:0:0:1'),('12','2016-08-19 15:12:26','0:0:0:0:0:0:0:1'),('12','2016-08-19 15:23:02','0:0:0:0:0:0:0:1'),('12','2016-08-19 15:32:34','0:0:0:0:0:0:0:1'),('12','2016-08-19 15:34:21','127.0.0.1'),('12','2016-08-19 15:34:39','127.0.0.1'),('12','2016-08-19 15:34:45','127.0.0.1'),('12','2016-08-19 15:35:18','127.0.0.1'),('12','2016-08-19 15:35:44','127.0.0.1'),('12','2016-08-19 15:45:18','0:0:0:0:0:0:0:1'),('12','2016-08-19 16:00:42','127.0.0.1'),('12','2016-08-19 16:11:14','127.0.0.1'),('12','2016-08-19 16:11:33','127.0.0.1'),('12','2016-08-19 16:11:45','127.0.0.1'),('12','2016-08-19 16:12:05','127.0.0.1'),('12','2016-08-19 16:12:10','127.0.0.1'),('12','2016-08-19 16:12:22','127.0.0.1'),('12','2016-08-19 16:12:58','127.0.0.1'),('12','2016-08-19 16:13:40','127.0.0.1'),('12','2016-08-19 16:13:45','127.0.0.1'),('12','2016-08-19 16:14:08','127.0.0.1'),('12','2016-08-19 16:24:33','0:0:0:0:0:0:0:1'),('12','2016-08-19 16:25:12','0:0:0:0:0:0:0:1'),('12','2016-08-19 16:25:58','127.0.0.1'),('12','2016-08-19 16:26:58','127.0.0.1'),('12','2016-08-19 16:28:40','127.0.0.1'),('12','2016-08-19 16:30:00','127.0.0.1'),('12','2016-08-19 16:30:41','127.0.0.1'),('12','2016-08-19 16:31:25','127.0.0.1'),('12','2016-08-19 16:32:00','127.0.0.1'),('12','2016-08-19 16:33:03','127.0.0.1'),('900001','2016-08-19 20:29:05','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:29:59','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:30:38','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:31:17','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:32:05','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:33:00','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:45:31','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:46:39','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:47:47','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:48:40','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:49:46','0:0:0:0:0:0:0:1'),('900001','2016-08-19 20:55:51','0:0:0:0:0:0:0:1');

#
# Structure for table "major"
#

DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `mid` varchar(20) NOT NULL COMMENT '系编号\nm001',
  `major` varchar(20) NOT NULL COMMENT '系名',
  `aid` varchar(20) DEFAULT NULL COMMENT '所属学院',
  `minfo` varchar(20) DEFAULT NULL COMMENT '系介绍',
  PRIMARY KEY (`mid`),
  KEY `pk_aid` (`aid`),
  CONSTRAINT `pk_aid` FOREIGN KEY (`aid`) REFERENCES `academy` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "major"
#

INSERT INTO `major` VALUES ('I10001','信息工程','IT','1');

#
# Structure for table "classs"
#

DROP TABLE IF EXISTS `classs`;
CREATE TABLE `classs` (
  `cid` varchar(20) NOT NULL COMMENT '班级编号\nc01',
  `classs` varchar(20) NOT NULL DEFAULT '' COMMENT '班级',
  `mid` varchar(20) DEFAULT NULL COMMENT '所属专业',
  `cinfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cid`),
  KEY `pk_mid` (`mid`),
  CONSTRAINT `pk_mid` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "classs"
#

INSERT INTO `classs` VALUES ('3','31','I10001','2'),('A1212','123','I10001','1');

#
# Structure for table "manager"
#

DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mname` varchar(20) NOT NULL COMMENT '管理员\n用户名',
  `pass` varchar(20) NOT NULL COMMENT '密码',
  `minfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`mname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "manager"
#

INSERT INTO `manager` VALUES ('34224','df','dasf'),('3443','df','d23'),('5','df','dasf');

#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` int(11) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `pass` varchar(20) NOT NULL COMMENT '密码',
  `sname` varchar(20) NOT NULL COMMENT '姓名',
  `ssex` char(4) NOT NULL COMMENT '性别',
  `sbirth` date NOT NULL COMMENT '出生年月',
  `sid` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号',
  `cid` varchar(20) NOT NULL COMMENT '班级',
  `spolitics` varchar(20) DEFAULT NULL COMMENT '政治面貌',
  `saddr` varchar(50) NOT NULL COMMENT '家庭住址',
  `sinfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sno`),
  UNIQUE KEY `sid` (`sid`),
  KEY `PK_CC` (`cid`),
  CONSTRAINT `PK_CC` FOREIGN KEY (`cid`) REFERENCES `classs` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "student"
#

INSERT INTO `student` VALUES (12,'1','12','2','1970-01-01','90','3','3','45','55'),(15,'1','15','2','1970-01-01','902','3','3','45','55'),(16,'1','16','2','1970-01-01','2','3','3','45','55'),(17,'1','2','2','1970-01-01','21','3','3','45','55'),(18,'1','2','2','1970-01-01','2122','3','3','45','55'),(20,'1','2','2','1970-01-01','11','3','3','45','55'),(21,'1','2','2','1970-01-01','15','3','3','45','55');

#
# Structure for table "mark"
#

DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `sno` int(11) NOT NULL COMMENT '学号',
  `cno` varchar(20) NOT NULL COMMENT '课程号',
  `grade` float(4,2) NOT NULL COMMENT '成绩',
  `gpa` float(4,2) DEFAULT NULL COMMENT '绩点，需要由触发器写入，计算：成绩/10-5',
  `makeup` float(4,2) NOT NULL DEFAULT '-1.00' COMMENT '补考,没有考就为-1',
  `ultimate` float(4,2) NOT NULL DEFAULT '-1.00' COMMENT '清考，没有考就为-1',
  `year` varchar(20) DEFAULT '' COMMENT '学年 2015-2016',
  `term` int(11) NOT NULL DEFAULT '1' COMMENT '学期',
  `info` varchar(20) NOT NULL DEFAULT '*' COMMENT '备注，不填写默认为 *',
  PRIMARY KEY (`id`),
  KEY `PK_SNO` (`sno`),
  KEY `PK_C` (`cno`),
  CONSTRAINT `PK_C` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_SNO` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "markse"
#

INSERT INTO `grade` VALUES (1,20,'20002',12.00,-3.80,-1.00,-1.00,'2015-2016',1,'*'),(2,12,'20002',66.00,1.60,-1.00,-1.00,'2015-2016',1,'*'),(3,15,'20003',76.00,2.60,-1.00,-1.00,'2015-2016',1,'*'),(14,12,'20003',98.00,4.80,-1.00,-1.00,'2015-2016',1,'*'),(15,20,'20003',87.00,3.70,0.00,0.00,'2015-2016',1,'*');

#
# Structure for table "excelonegrade"
#

DROP TABLE IF EXISTS `excelonegrade`;
CREATE TABLE `excelonegrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sno` int(11) NOT NULL COMMENT '学号',
  `sname` varchar(20) NOT NULL COMMENT '姓名',
  `grade` float(4,2) NOT NULL COMMENT '成绩',
  PRIMARY KEY (`id`),
  KEY `PK_ss` (`sno`),
  CONSTRAINT `PK_ss` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "excelonegrade"
#


#
# Structure for table "teacher"
#

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tno` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师工号',
  `tname` varchar(20) NOT NULL COMMENT '姓名',
  `pass` varchar(20) NOT NULL COMMENT '密码',
  `tsex` char(4) NOT NULL COMMENT '性别',
  `tbirth` date NOT NULL COMMENT '出生年月',
  `tpolitics` varchar(20) DEFAULT NULL COMMENT '政治面貌',
  `tjob` varchar(20) NOT NULL COMMENT '职务',
  `tacademy` varchar(20) NOT NULL COMMENT '所属学院',
  `tinfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`tno`),
  KEY `pk_ac` (`tacademy`),
  CONSTRAINT `pk_ac` FOREIGN KEY (`tacademy`) REFERENCES `academy` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=900002 DEFAULT CHARSET=utf8;

#
# Data for table "teacher"
#

INSERT INTO `teacher` VALUES (900001,'沃克尔','1','男','1980-08-24','无','教师','IT','*');

#
# Structure for table "syllabus"
#

DROP TABLE IF EXISTS `syllabus`;
CREATE TABLE `syllabus` (
  `cid` varchar(20) NOT NULL COMMENT '班级编号',
  `cno` varchar(20) NOT NULL COMMENT '课程编号',
  `tno` int(11) NOT NULL COMMENT '教师编号',
  `theoryroom` varchar(20) NOT NULL DEFAULT '' COMMENT '理论/实践教室',
  `week` int(11) NOT NULL COMMENT '星期几',
  `start` int(11) NOT NULL COMMENT '第几节开始',
  `amount` int(11) NOT NULL COMMENT '共几节',
  KEY `PK_CID` (`cid`),
  KEY `PK_CNO` (`cno`),
  KEY `PK_TNO` (`tno`),
  CONSTRAINT `PK_CID` FOREIGN KEY (`cid`) REFERENCES `classs` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_CNO` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_TNO` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "syllabus"
#


#
# Structure for table "obligatory"
#

DROP TABLE IF EXISTS `obligatory`;
CREATE TABLE `obligatory` (
  `year` varchar(20) NOT NULL COMMENT '学年',
  `term` int(11) NOT NULL COMMENT '学期',
  `cid` varchar(20) NOT NULL COMMENT '班级',
  `cno` varchar(20) NOT NULL COMMENT '课程',
  `tno` int(11) NOT NULL COMMENT '教师',
  `info` varchar(20) DEFAULT NULL COMMENT '备注',
  KEY `PK_Cn` (`cno`),
  KEY `PK_Ci` (`cid`),
  KEY `PK_tn` (`tno`),
  CONSTRAINT `PK_Ci` FOREIGN KEY (`cid`) REFERENCES `classs` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_Cn` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_tn` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "obligatory"
#

INSERT INTO `obligatory` VALUES ('2015-2016',1,'3','20002',900001,'*');

#
# Trigger "t_checktwo_b_i"
#

DROP TRIGGER IF EXISTS `t_checktwo_b_i`;
CREATE DEFINER='root'@'localhost' TRIGGER `t_checktwo_b_i` BEFORE INSERT ON `markse`
  FOR EACH ROW begin 
	set @flag=(select id from mark where sno=NEW.sno and cno=NEW.cno);
	if @flag is not null then 
		insert into w values('23','er','eww');
  elseif @flag is null then 
       set NEW.gpa=(NEW.grade/10-5);
	end if;
end;
