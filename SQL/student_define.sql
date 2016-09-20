/*
Navicat MySQL Data Transfer

Source Server         : Myth
Source Server Version : 50519
Source Host           : 127.0.0.1:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2016-09-19 10:02:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for academy
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy` (
  `aid` varchar(20) NOT NULL COMMENT '学院编号a01',
  `academy` varchar(20) NOT NULL COMMENT '学院',
  `ainfo` varchar(20) DEFAULT NULL COMMENT '学院介绍',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for assitant
-- ----------------------------
DROP TABLE IF EXISTS `assitant`;
CREATE TABLE `assitant` (
  `ano` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '辅导员工号',
  `aname` varchar(20) NOT NULL COMMENT '姓名',
  `pass` varchar(20) NOT NULL COMMENT '密码',
  `asex` char(4) NOT NULL COMMENT '性别',
  `mid` varchar(20) NOT NULL DEFAULT '' COMMENT '所属专业',
  `ainfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ano`)
) ENGINE=InnoDB AUTO_INCREMENT=800022 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for classs
-- ----------------------------
DROP TABLE IF EXISTS `classs`;
CREATE TABLE `classs` (
  `cid` varchar(20) NOT NULL COMMENT '班级编号\nc01',
  `classs` varchar(20) NOT NULL DEFAULT '' COMMENT '班级',
  `mid` varchar(20) DEFAULT NULL COMMENT '所属专业',
  `cinfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cid`),
  KEY `pk_mid` (`mid`),
  CONSTRAINT `pk_mid` FOREIGN KEY (`mid`) REFERENCES `major` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course
-- ----------------------------
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

-- ----------------------------
-- Table structure for excelonegrade
-- ----------------------------
DROP TABLE IF EXISTS `excelonegrade`;
CREATE TABLE `excelonegrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sno` bigint(15) NOT NULL COMMENT '学号',
  `sname` varchar(20) NOT NULL COMMENT '姓名',
  `grade` float(4,2) NOT NULL COMMENT '成绩',
  PRIMARY KEY (`id`),
  KEY `PK_ss` (`sno`),
  CONSTRAINT `PK_ss` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `name` varchar(20) DEFAULT NULL,
  `times` datetime DEFAULT NULL,
  `adds` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `mid` varchar(20) NOT NULL COMMENT '系编号\nm001',
  `major` varchar(20) NOT NULL COMMENT '系名',
  `aid` varchar(20) DEFAULT NULL COMMENT '所属学院',
  `minfo` varchar(20) DEFAULT NULL COMMENT '系介绍',
  PRIMARY KEY (`mid`),
  KEY `pk_aid` (`aid`),
  CONSTRAINT `pk_aid` FOREIGN KEY (`aid`) REFERENCES `academy` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mname` varchar(20) NOT NULL COMMENT '管理员\n用户名',
  `pass` varchar(20) NOT NULL COMMENT '密码',
  `minfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`mname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mark
-- ----------------------------
DROP TABLE IF EXISTS `mark`;
CREATE TABLE `mark` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `sno` bigint(15) NOT NULL COMMENT '学号',
  `cno` varchar(20) NOT NULL COMMENT '课程号',
  `grade` float(4,2) NOT NULL COMMENT '成绩',
  `gpa` float(4,2) DEFAULT NULL COMMENT '绩点，需要由触发器写入，计算：成绩/10-5',
  `makeup` float(4,2) NOT NULL DEFAULT '-1.00' COMMENT '补考,没有考就为-1',
  `ultimate` float(4,2) NOT NULL DEFAULT '-1.00' COMMENT '清考，没有考就为-1',
  `year` varchar(20) DEFAULT '' COMMENT '学年 2015-2016',
  `term` int(3) NOT NULL DEFAULT '1' COMMENT '学期',
  `info` varchar(20) NOT NULL DEFAULT '*' COMMENT '备注，不填写默认为 *',
  PRIMARY KEY (`id`),
  KEY `PK_SNO` (`sno`),
  KEY `PK_C` (`cno`),
  CONSTRAINT `PK_C` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_SNO` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for obligatory
-- ----------------------------
DROP TABLE IF EXISTS `obligatory`;
CREATE TABLE `obligatory` (
  `year` varchar(20) NOT NULL COMMENT '学年',
  `term` int(11) NOT NULL COMMENT '学期',
  `cid` varchar(20) NOT NULL COMMENT '班级',
  `cno` varchar(20) NOT NULL COMMENT '课程',
  `tno` bigint(15) NOT NULL COMMENT '教师',
  `info` varchar(20) DEFAULT NULL COMMENT '备注',
  KEY `PK_Cn` (`cno`),
  KEY `PK_Ci` (`cid`),
  KEY `PK_tn` (`tno`),
  CONSTRAINT `PK_Ci` FOREIGN KEY (`cid`) REFERENCES `classs` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_Cn` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_tn` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '学号',
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
) ENGINE=InnoDB AUTO_INCREMENT=2038 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for syllabus
-- ----------------------------
DROP TABLE IF EXISTS `syllabus`;
CREATE TABLE `syllabus` (
  `cid` varchar(20) NOT NULL COMMENT '班级编号',
  `cno` varchar(20) NOT NULL COMMENT '课程编号',
  `tno` bigint(15) NOT NULL COMMENT '教师编号',
  `theoryroom` varchar(20) NOT NULL DEFAULT '' COMMENT '理论/实践教室',
  `week` int(11) DEFAULT NULL COMMENT '星期几',
  `start` int(11) DEFAULT NULL COMMENT '第几节开始',
  `amount` int(11) NOT NULL COMMENT '共几节',
  `year` varchar(20) NOT NULL DEFAULT '2015-2016' COMMENT '学年',
  `term` int(3) NOT NULL DEFAULT '1' COMMENT '学期',
  KEY `PK_CID` (`cid`),
  KEY `PK_CNO` (`cno`),
  KEY `PK_TNO` (`tno`),
  CONSTRAINT `PK_CID` FOREIGN KEY (`cid`) REFERENCES `classs` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_CNO` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_TNO` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tno` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '教师工号',
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
  CONSTRAINT `pk_ac` FOREIGN KEY (`tacademy`) REFERENCES `academy` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=900008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp` (
  `sno` bigint(15) NOT NULL COMMENT '学号',
  `sname` varchar(20) NOT NULL COMMENT '姓名',
  `c_20004` float(4,2) NOT NULL COMMENT '成绩',
  `f_20004` float(4,2) NOT NULL COMMENT '学分',
  `c_20003` float(4,2) NOT NULL COMMENT '成绩',
  `f_20003` float(4,2) NOT NULL COMMENT '学分',
  `c_20002` float(4,2) NOT NULL COMMENT '成绩',
  `f_20002` float(4,2) NOT NULL COMMENT '学分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for mark_pro
-- ----------------------------
DROP VIEW IF EXISTS `mark_pro`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `mark_pro` AS select s.sno,s.sname,co.cno,co.cname,cl.cid,cl.classs,m.grade,m.year,m.term from mark m, student s, course co, classs cl
 where s.sno = m.sno and m.cno=co.cno and s.cid = cl.cid ;
DROP TRIGGER IF EXISTS `t_checktwo_b_i`;
DELIMITER ;;
CREATE TRIGGER `t_checktwo_b_i` BEFORE INSERT ON `mark` FOR EACH ROW begin 
	set @flag=(select id from mark where sno=NEW.sno and cno=NEW.cno);
	if @flag is not null then 
		insert into w values('23','er','eww');
  elseif @flag is null then 
       set NEW.gpa=(NEW.grade/10-5);
	end if;
end
;;
DELIMITER ;
