/*
Navicat MySQL Data Transfer

Source Server         : Myth
Source Server Version : 50519
Source Host           : 127.0.0.1:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2016-10-04 11:37:56
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
-- Records of academy
-- ----------------------------
INSERT INTO `academy` VALUES ('Account', '会计学院', '立信为本');
INSERT INTO `academy` VALUES ('IT', '信息科学与技术学院', '专注于技术，扩展于其他');

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
) ENGINE=InnoDB AUTO_INCREMENT=800005 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assitant
-- ----------------------------
INSERT INTO `assitant` VALUES ('800001', '辅导员1', '1', '女', 'I10001', '*');
INSERT INTO `assitant` VALUES ('800003', '辅导员3', '3', '女', 'I10001', '*');
INSERT INTO `assitant` VALUES ('800004', '辅导员4', '4', '女', 'I10001', '*');

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
-- Records of classs
-- ----------------------------
INSERT INTO `classs` VALUES ('3', '31', 'I10001', '2');
INSERT INTO `classs` VALUES ('A1212', '123', 'I10001', '1');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cno` varchar(20) NOT NULL COMMENT '课程编号\nk111',
  `cname` varchar(20) NOT NULL COMMENT '名称',
  `credit` float(4,2) NOT NULL COMMENT '学分',
  `theoryhour` float(4,2) DEFAULT NULL COMMENT '理论课时',
  `practicehour` float(4,2) DEFAULT NULL COMMENT '实践课时，暂时用来放学期',
  `ctype` varchar(20) NOT NULL COMMENT '课程类型',
  `cacademy` varchar(20) DEFAULT '' COMMENT '所属学院',
  `cinfo` varchar(20) DEFAULT NULL COMMENT '备注，暂时用来放学年',
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('20002', '编译原理', '4.00', '48.00', '32.00', '基础课程', 'IT', '2');
INSERT INTO `course` VALUES ('20003', '单片机', '3.00', '32.00', '32.00', '51单片机', 'IT', '3');
INSERT INTO `course` VALUES ('20004', '数据结构', '4.00', '32.00', '32.00', '52单片机', 'IT', '4');
INSERT INTO `course` VALUES ('20005', '计算机网络', '3.00', '32.00', '32.00', '53单片机', 'IT', '5');
INSERT INTO `course` VALUES ('20006', '软件工程', '2.00', '32.00', '32.00', '54单片机', 'IT', '6');
INSERT INTO `course` VALUES ('20007', '数据库原理', '4.00', '32.00', '32.00', '55单片机77', 'IT', '7');
INSERT INTO `course` VALUES ('20008', '管理沟通', '2.00', null, '1.00', '公选课', '', '2016-2017');
INSERT INTO `course` VALUES ('20009', '形势与政策', '2.00', null, '1.00', '必修课', '', '2016-2017');
INSERT INTO `course` VALUES ('20010', '编译原理(M)', '3.00', null, '1.00', '必修课', '', '2016-2017');
INSERT INTO `course` VALUES ('20011', '移动应用开发', '5.00', null, '1.00', '限选课', '', '2016-2017');
INSERT INTO `course` VALUES ('20012', '人机界面设计(M)', '1.50', null, '1.00', '限选课', '', '2016-2017');
INSERT INTO `course` VALUES ('20013', '软件项目管理(M)', '2.00', null, '1.00', '限选课', '', '2016-2017');
INSERT INTO `course` VALUES ('20014', '毕业综合技能测试', '3.00', null, '1.00', '必修课', '', '2016-2017');
INSERT INTO `course` VALUES ('20015', '软件工程课程设计', '4.00', null, '1.00', '实践课', '', '2016-2017');
INSERT INTO `course` VALUES ('20016', '综合应用项目开发', '8.00', null, '1.00', '限选课', '', '2016-2017');
INSERT INTO `course` VALUES ('20017', '嵌入式驱动开发(M)', '2.50', null, '1.00', '限选课', '', '2016-2017');
INSERT INTO `course` VALUES ('20018', '嵌入式系统测试(M)', '1.50', null, '1.00', '限选课', '', '2016-2017');
INSERT INTO `course` VALUES ('20019', '网络协议编程（M）', '3.00', null, '1.00', '必修课', '', '2016-2017');
INSERT INTO `course` VALUES ('20020', '就业指导与创业教育', '0.50', null, '1.00', '必修课', '', '2016-2017');
INSERT INTO `course` VALUES ('20021', '专业技能综合课程设计', '4.00', null, '1.00', '实践课', '', '2016-2017');
INSERT INTO `course` VALUES ('20022', '网络工程与综合布线(M)', '2.50', null, '1.00', '限选课', '', '2016-2017');
INSERT INTO `course` VALUES ('20023', '大学生就业与创业法律风险防范', '2.00', null, '1.00', '公选课', '', '2016-2017');

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
-- Records of excelonegrade
-- ----------------------------

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
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('12', '2016-08-14 23:19:40', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 20:28:47', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 20:30:02', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 21:34:06', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 21:34:41', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 21:34:50', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 21:35:18', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 21:38:14', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 21:39:34', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 21:39:59', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('15', '2016-08-15 21:42:29', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('15', '2016-08-15 21:42:48', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 21:43:03', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('16', '2016-08-15 21:43:24', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('15', '2016-08-15 21:43:29', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('16', '2016-08-15 21:43:33', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-15 21:43:39', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-19 15:12:26', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-19 15:23:02', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-19 15:32:34', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-19 15:34:21', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 15:34:39', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 15:34:45', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 15:35:18', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 15:35:44', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 15:45:18', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:00:42', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:11:14', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:11:33', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:11:45', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:12:05', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:12:10', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:12:22', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:12:58', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:13:40', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:13:45', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:14:08', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:24:33', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:25:12', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:25:58', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:26:58', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:28:40', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:30:00', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:30:41', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:31:25', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:32:00', '127.0.0.1');
INSERT INTO `history` VALUES ('12', '2016-08-19 16:33:03', '127.0.0.1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:29:05', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:29:59', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:30:38', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:31:17', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:32:05', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:33:00', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:45:31', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:46:39', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:47:47', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:48:40', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:49:46', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-19 20:55:51', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-22 12:42:32', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-22 13:06:00', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-22 13:28:16', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-22 13:30:55', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-22 13:41:13', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-22 13:57:52', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-22 14:14:15', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-22 14:26:33', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-22 14:44:40', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 08:11:13', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 08:13:03', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 08:20:48', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 08:20:55', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 08:28:31', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 08:29:36', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 08:30:21', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 08:31:24', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 08:40:42', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 13:32:46', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 13:33:51', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 13:34:59', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-23 13:36:35', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('800001', '2016-08-23 13:37:09', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 13:38:05', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('12', '2016-08-23 13:38:28', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('5', '2016-08-23 13:39:27', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('5', '2016-08-23 13:47:21', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 13:56:24', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 14:33:06', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 14:33:38', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 14:34:04', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 14:34:48', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 14:35:06', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 14:35:46', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('5', '2016-08-23 14:42:59', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('5', '2016-08-23 14:43:30', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:42:52', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:43:45', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:45:20', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:47:50', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:49:17', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:50:01', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:51:33', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:52:01', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:53:01', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:53:04', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:54:09', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:54:24', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:54:30', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:57:31', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:58:28', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:58:54', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:59:22', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 20:59:57', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:00:29', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:00:52', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:01:19', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:02:26', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:03:16', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:03:54', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:04:45', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:05:06', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:05:33', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:06:08', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:06:25', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:06:37', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:07:14', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:07:44', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:08:05', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:08:38', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:09:35', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:09:54', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:10:31', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:11:30', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:11:46', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:12:11', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:12:25', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:13:03', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:13:23', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:13:38', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:14:27', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:14:46', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-08-23 21:28:28', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-09-02 22:59:28', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('5', '2016-09-02 23:00:14', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-09-03 21:17:11', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('5', '2016-09-03 21:17:29', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('5', '2016-09-03 21:19:30', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('5', '2016-09-03 21:20:03', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-09-04 09:38:52', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-09-04 09:39:32', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-09-04 09:49:39', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-09-04 09:53:40', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-09-04 10:02:59', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('900001', '2016-09-04 10:04:52', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('5', '2016-09-05 18:48:59', '127.0.0.1');
INSERT INTO `history` VALUES ('5', '2016-09-05 18:51:31', '127.0.0.1');
INSERT INTO `history` VALUES ('5', '2016-09-05 18:55:02', '127.0.0.1');
INSERT INTO `history` VALUES ('5', '2016-09-05 18:56:08', '127.0.0.1');
INSERT INTO `history` VALUES ('900001', '2016-09-06 22:32:46', '127.0.0.1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:08:30', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:15:20', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:15:31', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:17:28', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:20:32', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:21:11', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:21:32', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:26:12', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:27:34', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:30:51', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:33:33', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:34:29', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-19 21:36:26', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:25:51', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:31:55', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:32:17', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:34:48', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:35:16', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:35:21', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:35:52', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:35:58', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:36:45', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:36:51', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:38:32', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:38:45', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:40:28', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:40:35', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:41:31', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:41:40', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:44:13', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:44:19', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:44:44', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:44:49', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:45:42', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:45:47', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 19:52:11', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 20:10:50', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 20:16:08', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-20 20:20:18', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-21 10:41:20', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-21 10:42:00', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-21 16:30:47', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-21 19:10:04', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-21 19:18:15', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-21 19:22:09', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-23 16:09:36', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-23 16:18:19', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-23 16:41:37', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-23 16:51:51', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-23 17:16:15', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-23 17:16:20', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-23 17:16:28', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 09:23:29', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 09:24:15', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 09:25:01', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 09:27:56', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 09:30:00', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 11:41:16', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 18:21:24', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 18:44:27', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 20:35:28', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 21:00:13', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-24 21:06:48', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-25 09:32:28', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-25 11:49:08', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-25 11:51:15', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-25 11:51:31', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 10:35:31', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 14:07:12', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 14:17:09', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 14:26:07', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 14:31:05', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 15:00:27', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 15:01:23', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 15:02:45', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 15:05:11', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 15:06:00', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 18:50:08', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 19:11:55', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 19:13:11', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 20:04:34', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 20:40:04', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-26 21:03:20', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-27 18:52:00', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-27 18:57:56', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-27 18:59:05', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-27 19:11:48', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-27 19:22:45', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-27 20:30:25', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-29 18:02:45', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-29 18:03:34', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-09-29 18:14:48', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-10-04 10:17:37', '0:0:0:0:0:0:0:1');
INSERT INTO `history` VALUES ('23', '2016-10-04 11:15:41', '0:0:0:0:0:0:0:1');

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
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('A1001', '审计', 'IT', '立信为本');
INSERT INTO `major` VALUES ('I10001', '信息工程', 'IT', '1');

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
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('23', '2', '2');
INSERT INTO `manager` VALUES ('5', 'df', 'dasf');
INSERT INTO `manager` VALUES ('s', 'see', 's');

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
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mark
-- ----------------------------
INSERT INTO `mark` VALUES ('0', '20', '20002', '82.00', '3.20', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('2', '12', '20002', '66.00', '1.60', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('3', '15', '20003', '76.00', '2.60', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('14', '12', '20003', '98.00', '4.80', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('15', '20', '20003', '87.00', '3.70', '0.00', '0.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('16', '12', '20004', '93.00', '4.30', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('17', '20', '20004', '93.00', '4.30', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('18', '16', '20002', '82.00', '3.20', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('19', '17', '20002', '66.00', '1.60', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('20', '16', '20003', '76.00', '2.60', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('21', '17', '20003', '98.00', '4.80', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('23', '16', '20004', '93.00', '4.30', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('24', '17', '20004', '93.00', '4.30', '-1.00', '-1.00', '2015-2016', '1', '*');
INSERT INTO `mark` VALUES ('729', '11010020128', '20008', '62.00', '1.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('730', '11010020128', '20009', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('731', '11010020128', '20010', '36.00', '-1.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('732', '11010020128', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('733', '11010020128', '20012', '78.00', '2.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('734', '11010020128', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('735', '11010020128', '20014', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('736', '11010020128', '20015', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('737', '11010020128', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('738', '11010020128', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('739', '11010020128', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('740', '11010020128', '20019', '64.00', '1.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('741', '11010020128', '20020', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('742', '11010020128', '20021', '6.00', '-4.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('743', '11010020128', '20022', '33.00', '-1.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('744', '11010020128', '20023', '0.00', '-5.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('745', '11114010303', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('746', '11114010303', '20009', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('747', '11114010303', '20010', '24.00', '-2.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('748', '11114010303', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('749', '11114010303', '20012', '69.00', '1.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('750', '11114010303', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('751', '11114010303', '20014', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('752', '11114010303', '20015', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('753', '11114010303', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('754', '11114010303', '20017', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('755', '11114010303', '20018', '65.00', '1.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('756', '11114010303', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('757', '11114010303', '20020', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('758', '11114010303', '20021', '76.00', '2.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('759', '11114010303', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('760', '11114010303', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('761', '11208090103', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('762', '11208090103', '20009', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('763', '11208090103', '20010', '64.00', '1.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('764', '11208090103', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('765', '11208090103', '20012', '79.00', '2.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('766', '11208090103', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('767', '11208090103', '20014', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('768', '11208090103', '20015', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('769', '11208090103', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('770', '11208090103', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('771', '11208090103', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('772', '11208090103', '20019', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('773', '11208090103', '20020', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('774', '11208090103', '20021', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('775', '11208090103', '20022', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('776', '11208090103', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('777', '11214010101', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('778', '11214010101', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('779', '11214010101', '20010', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('780', '11214010101', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('781', '11214010101', '20012', '76.00', '2.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('782', '11214010101', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('783', '11214010101', '20014', '74.00', '2.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('784', '11214010101', '20015', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('785', '11214010101', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('786', '11214010101', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('787', '11214010101', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('788', '11214010101', '20019', '51.00', '0.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('789', '11214010101', '20020', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('790', '11214010101', '20021', '78.00', '2.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('791', '11214010101', '20022', '66.00', '1.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('792', '11214010101', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('793', '11214010103', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('794', '11214010103', '20009', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('795', '11214010103', '20010', '92.00', '4.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('796', '11214010103', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('797', '11214010103', '20012', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('798', '11214010103', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('799', '11214010103', '20014', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('800', '11214010103', '20015', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('801', '11214010103', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('802', '11214010103', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('803', '11214010103', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('804', '11214010103', '20019', '74.00', '2.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('805', '11214010103', '20020', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('806', '11214010103', '20021', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('807', '11214010103', '20022', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('808', '11214010103', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('809', '11214010104', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('810', '11214010104', '20009', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('811', '11214010104', '20010', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('812', '11214010104', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('813', '11214010104', '20012', '77.00', '2.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('814', '11214010104', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('815', '11214010104', '20014', '68.00', '1.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('816', '11214010104', '20015', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('817', '11214010104', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('818', '11214010104', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('819', '11214010104', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('820', '11214010104', '20019', '61.00', '1.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('821', '11214010104', '20020', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('822', '11214010104', '20021', '69.00', '1.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('823', '11214010104', '20022', '63.00', '1.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('824', '11214010104', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('825', '11214010105', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('826', '11214010105', '20009', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('827', '11214010105', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('828', '11214010105', '20011', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('829', '11214010105', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('830', '11214010105', '20013', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('831', '11214010105', '20014', '73.00', '2.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('832', '11214010105', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('833', '11214010105', '20016', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('834', '11214010105', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('835', '11214010105', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('836', '11214010105', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('837', '11214010105', '20020', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('838', '11214010105', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('839', '11214010105', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('840', '11214010105', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('841', '11214010106', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('842', '11214010106', '20009', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('843', '11214010106', '20010', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('844', '11214010106', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('845', '11214010106', '20012', '79.00', '2.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('846', '11214010106', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('847', '11214010106', '20014', '63.00', '1.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('848', '11214010106', '20015', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('849', '11214010106', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('850', '11214010106', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('851', '11214010106', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('852', '11214010106', '20019', '65.00', '1.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('853', '11214010106', '20020', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('854', '11214010106', '20021', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('855', '11214010106', '20022', '62.00', '1.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('856', '11214010106', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('857', '11214010107', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('858', '11214010107', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('859', '11214010107', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('860', '11214010107', '20011', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('861', '11214010107', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('862', '11214010107', '20013', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('863', '11214010107', '20014', '68.00', '1.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('864', '11214010107', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('865', '11214010107', '20016', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('866', '11214010107', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('867', '11214010107', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('868', '11214010107', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('869', '11214010107', '20020', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('870', '11214010107', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('871', '11214010107', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('872', '11214010107', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('873', '11214010108', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('874', '11214010108', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('875', '11214010108', '20010', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('876', '11214010108', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('877', '11214010108', '20012', '82.00', '3.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('878', '11214010108', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('879', '11214010108', '20014', '65.00', '1.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('880', '11214010108', '20015', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('881', '11214010108', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('882', '11214010108', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('883', '11214010108', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('884', '11214010108', '20019', '68.00', '1.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('885', '11214010108', '20020', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('886', '11214010108', '20021', '82.00', '3.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('887', '11214010108', '20022', '62.00', '1.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('888', '11214010108', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('889', '11214010109', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('890', '11214010109', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('891', '11214010109', '20010', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('892', '11214010109', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('893', '11214010109', '20012', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('894', '11214010109', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('895', '11214010109', '20014', '67.00', '1.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('896', '11214010109', '20015', '85.00', '3.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('897', '11214010109', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('898', '11214010109', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('899', '11214010109', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('900', '11214010109', '20019', '61.00', '1.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('901', '11214010109', '20020', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('902', '11214010109', '20021', '78.00', '2.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('903', '11214010109', '20022', '63.00', '1.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('904', '11214010109', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('905', '11214010110', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('906', '11214010110', '20009', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('907', '11214010110', '20010', '69.00', '1.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('908', '11214010110', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('909', '11214010110', '20012', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('910', '11214010110', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('911', '11214010110', '20014', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('912', '11214010110', '20015', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('913', '11214010110', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('914', '11214010110', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('915', '11214010110', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('916', '11214010110', '20019', '63.00', '1.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('917', '11214010110', '20020', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('918', '11214010110', '20021', '77.00', '2.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('919', '11214010110', '20022', '66.00', '1.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('920', '11214010110', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('921', '11214010111', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('922', '11214010111', '20009', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('923', '11214010111', '20010', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('924', '11214010111', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('925', '11214010111', '20012', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('926', '11214010111', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('927', '11214010111', '20014', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('928', '11214010111', '20015', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('929', '11214010111', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('930', '11214010111', '20017', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('931', '11214010111', '20018', '85.00', '3.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('932', '11214010111', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('933', '11214010111', '20020', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('934', '11214010111', '20021', '92.00', '4.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('935', '11214010111', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('936', '11214010111', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('937', '11214010112', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('938', '11214010112', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('939', '11214010112', '20010', '68.00', '1.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('940', '11214010112', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('941', '11214010112', '20012', '79.00', '2.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('942', '11214010112', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('943', '11214010112', '20014', '68.00', '1.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('944', '11214010112', '20015', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('945', '11214010112', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('946', '11214010112', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('947', '11214010112', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('948', '11214010112', '20019', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('949', '11214010112', '20020', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('950', '11214010112', '20021', '79.00', '2.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('951', '11214010112', '20022', '66.00', '1.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('952', '11214010112', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('953', '11214010113', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('954', '11214010113', '20009', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('955', '11214010113', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('956', '11214010113', '20011', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('957', '11214010113', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('958', '11214010113', '20013', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('959', '11214010113', '20014', '74.00', '2.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('960', '11214010113', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('961', '11214010113', '20016', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('962', '11214010113', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('963', '11214010113', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('964', '11214010113', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('965', '11214010113', '20020', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('966', '11214010113', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('967', '11214010113', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('968', '11214010113', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('969', '11214010114', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('970', '11214010114', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('971', '11214010114', '20010', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('972', '11214010114', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('973', '11214010114', '20012', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('974', '11214010114', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('975', '11214010114', '20014', '62.00', '1.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('976', '11214010114', '20015', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('977', '11214010114', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('978', '11214010114', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('979', '11214010114', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('980', '11214010114', '20019', '65.00', '1.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('981', '11214010114', '20020', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('982', '11214010114', '20021', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('983', '11214010114', '20022', '67.00', '1.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('984', '11214010114', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('985', '11214010115', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('986', '11214010115', '20009', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('987', '11214010115', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('988', '11214010115', '20011', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('989', '11214010115', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('990', '11214010115', '20013', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('991', '11214010115', '20014', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('992', '11214010115', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('993', '11214010115', '20016', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('994', '11214010115', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('995', '11214010115', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('996', '11214010115', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('997', '11214010115', '20020', '91.00', '4.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('998', '11214010115', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('999', '11214010115', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1000', '11214010115', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1001', '11214010116', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1002', '11214010116', '20009', '92.00', '4.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1003', '11214010116', '20010', '85.00', '3.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1004', '11214010116', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1005', '11214010116', '20012', '79.00', '2.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1006', '11214010116', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1007', '11214010116', '20014', '67.00', '1.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1008', '11214010116', '20015', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1009', '11214010116', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1010', '11214010116', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1011', '11214010116', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1012', '11214010116', '20019', '66.00', '1.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1013', '11214010116', '20020', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1014', '11214010116', '20021', '77.00', '2.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1015', '11214010116', '20022', '62.00', '1.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1016', '11214010116', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1017', '11214010117', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1018', '11214010117', '20009', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1019', '11214010117', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1020', '11214010117', '20011', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1021', '11214010117', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1022', '11214010117', '20013', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1023', '11214010117', '20014', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1024', '11214010117', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1025', '11214010117', '20016', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1026', '11214010117', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1027', '11214010117', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1028', '11214010117', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1029', '11214010117', '20020', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1030', '11214010117', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1031', '11214010117', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1032', '11214010117', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1033', '11214010118', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1034', '11214010118', '20009', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1035', '11214010118', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1036', '11214010118', '20011', '92.00', '4.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1037', '11214010118', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1038', '11214010118', '20013', '92.00', '4.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1039', '11214010118', '20014', '75.00', '2.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1040', '11214010118', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1041', '11214010118', '20016', '92.00', '4.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1042', '11214010118', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1043', '11214010118', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1044', '11214010118', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1045', '11214010118', '20020', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1046', '11214010118', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1047', '11214010118', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1048', '11214010118', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1049', '11214010119', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1050', '11214010119', '20009', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1051', '11214010119', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1052', '11214010119', '20011', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1053', '11214010119', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1054', '11214010119', '20013', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1055', '11214010119', '20014', '78.00', '2.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1056', '11214010119', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1057', '11214010119', '20016', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1058', '11214010119', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1059', '11214010119', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1060', '11214010119', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1061', '11214010119', '20020', '79.00', '2.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1062', '11214010119', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1063', '11214010119', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1064', '11214010119', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1065', '11214010120', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1066', '11214010120', '20009', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1067', '11214010120', '20010', '69.00', '1.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1068', '11214010120', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1069', '11214010120', '20012', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1070', '11214010120', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1071', '11214010120', '20014', '63.00', '1.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1072', '11214010120', '20015', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1073', '11214010120', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1074', '11214010120', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1075', '11214010120', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1076', '11214010120', '20019', '62.00', '1.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1077', '11214010120', '20020', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1078', '11214010120', '20021', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1079', '11214010120', '20022', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1080', '11214010120', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1081', '11214010121', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1082', '11214010121', '20009', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1083', '11214010121', '20010', '69.00', '1.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1084', '11214010121', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1085', '11214010121', '20012', '82.00', '3.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1086', '11214010121', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1087', '11214010121', '20014', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1088', '11214010121', '20015', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1089', '11214010121', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1090', '11214010121', '20017', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1091', '11214010121', '20018', '75.00', '2.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1092', '11214010121', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1093', '11214010121', '20020', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1094', '11214010121', '20021', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1095', '11214010121', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1096', '11214010121', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1097', '11214010122', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1098', '11214010122', '20009', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1099', '11214010122', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1100', '11214010122', '20011', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1101', '11214010122', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1102', '11214010122', '20013', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1103', '11214010122', '20014', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1104', '11214010122', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1105', '11214010122', '20016', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1106', '11214010122', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1107', '11214010122', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1108', '11214010122', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1109', '11214010122', '20020', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1110', '11214010122', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1111', '11214010122', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1112', '11214010122', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1113', '11214010123', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1114', '11214010123', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1115', '11214010123', '20010', '77.00', '2.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1116', '11214010123', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1117', '11214010123', '20012', '74.00', '2.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1118', '11214010123', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1119', '11214010123', '20014', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1120', '11214010123', '20015', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1121', '11214010123', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1122', '11214010123', '20017', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1123', '11214010123', '20018', '66.00', '1.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1124', '11214010123', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1125', '11214010123', '20020', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1126', '11214010123', '20021', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1127', '11214010123', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1128', '11214010123', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1129', '11214010124', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1130', '11214010124', '20009', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1131', '11214010124', '20010', '68.00', '1.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1132', '11214010124', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1133', '11214010124', '20012', '69.00', '1.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1134', '11214010124', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1135', '11214010124', '20014', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1136', '11214010124', '20015', '82.00', '3.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1137', '11214010124', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1138', '11214010124', '20017', '75.00', '2.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1139', '11214010124', '20018', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1140', '11214010124', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1141', '11214010124', '20020', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1142', '11214010124', '20021', '78.00', '2.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1143', '11214010124', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1144', '11214010124', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1145', '11214010125', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1146', '11214010125', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1147', '11214010125', '20010', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1148', '11214010125', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1149', '11214010125', '20012', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1150', '11214010125', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1151', '11214010125', '20014', '64.00', '1.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1152', '11214010125', '20015', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1153', '11214010125', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1154', '11214010125', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1155', '11214010125', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1156', '11214010125', '20019', '62.00', '1.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1157', '11214010125', '20020', '92.00', '4.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1158', '11214010125', '20021', '69.00', '1.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1159', '11214010125', '20022', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1160', '11214010125', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1161', '11214010126', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1162', '11214010126', '20009', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1163', '11214010126', '20010', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1164', '11214010126', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1165', '11214010126', '20012', '75.00', '2.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1166', '11214010126', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1167', '11214010126', '20014', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1168', '11214010126', '20015', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1169', '11214010126', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1170', '11214010126', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1171', '11214010126', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1172', '11214010126', '20019', '50.00', '0.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1173', '11214010126', '20020', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1174', '11214010126', '20021', '72.00', '2.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1175', '11214010126', '20022', '53.00', '0.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1176', '11214010126', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1177', '11214010127', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1178', '11214010127', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1179', '11214010127', '20010', '10.00', '-4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1180', '11214010127', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1181', '11214010127', '20012', '63.00', '1.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1182', '11214010127', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1183', '11214010127', '20014', '65.00', '1.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1184', '11214010127', '20015', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1185', '11214010127', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1186', '11214010127', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1187', '11214010127', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1188', '11214010127', '20019', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1189', '11214010127', '20020', '78.00', '2.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1190', '11214010127', '20021', '6.00', '-4.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1191', '11214010127', '20022', '27.00', '-2.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1192', '11214010127', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1193', '11214010128', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1194', '11214010128', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1195', '11214010128', '20010', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1196', '11214010128', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1197', '11214010128', '20012', '73.00', '2.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1198', '11214010128', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1199', '11214010128', '20014', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1200', '11214010128', '20015', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1201', '11214010128', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1202', '11214010128', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1203', '11214010128', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1204', '11214010128', '20019', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1205', '11214010128', '20020', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1206', '11214010128', '20021', '64.00', '1.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1207', '11214010128', '20022', '66.00', '1.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1208', '11214010128', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1209', '11214010129', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1210', '11214010129', '20009', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1211', '11214010129', '20010', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1212', '11214010129', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1213', '11214010129', '20012', '73.00', '2.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1214', '11214010129', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1215', '11214010129', '20014', '64.00', '1.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1216', '11214010129', '20015', '85.00', '3.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1217', '11214010129', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1218', '11214010129', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1219', '11214010129', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1220', '11214010129', '20019', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1221', '11214010129', '20020', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1222', '11214010129', '20021', '72.00', '2.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1223', '11214010129', '20022', '65.00', '1.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1224', '11214010129', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1225', '11214010130', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1226', '11214010130', '20009', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1227', '11214010130', '20010', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1228', '11214010130', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1229', '11214010130', '20012', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1230', '11214010130', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1231', '11214010130', '20014', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1232', '11214010130', '20015', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1233', '11214010130', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1234', '11214010130', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1235', '11214010130', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1236', '11214010130', '20019', '65.00', '1.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1237', '11214010130', '20020', '90.00', '4.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1238', '11214010130', '20021', '64.00', '1.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1239', '11214010130', '20022', '61.00', '1.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1240', '11214010130', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1241', '11214010131', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1242', '11214010131', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1243', '11214010131', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1244', '11214010131', '20011', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1245', '11214010131', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1246', '11214010131', '20013', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1247', '11214010131', '20014', '74.00', '2.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1248', '11214010131', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1249', '11214010131', '20016', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1250', '11214010131', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1251', '11214010131', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1252', '11214010131', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1253', '11214010131', '20020', '95.00', '4.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1254', '11214010131', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1255', '11214010131', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1256', '11214010131', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1257', '11214010132', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1258', '11214010132', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1259', '11214010132', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1260', '11214010132', '20011', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1261', '11214010132', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1262', '11214010132', '20013', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1263', '11214010132', '20014', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1264', '11214010132', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1265', '11214010132', '20016', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1266', '11214010132', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1267', '11214010132', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1268', '11214010132', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1269', '11214010132', '20020', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1270', '11214010132', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1271', '11214010132', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1272', '11214010132', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1273', '11214010133', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1274', '11214010133', '20009', '91.00', '4.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1275', '11214010133', '20010', '66.00', '1.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1276', '11214010133', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1277', '11214010133', '20012', '82.00', '3.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1278', '11214010133', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1279', '11214010133', '20014', '79.00', '2.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1280', '11214010133', '20015', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1281', '11214010133', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1282', '11214010133', '20017', '78.00', '2.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1283', '11214010133', '20018', '76.00', '2.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1284', '11214010133', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1285', '11214010133', '20020', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1286', '11214010133', '20021', '82.00', '3.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1287', '11214010133', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1288', '11214010133', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1289', '11214010134', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1290', '11214010134', '20009', '91.00', '4.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1291', '11214010134', '20010', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1292', '11214010134', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1293', '11214010134', '20012', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1294', '11214010134', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1295', '11214010134', '20014', '77.00', '2.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1296', '11214010134', '20015', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1297', '11214010134', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1298', '11214010134', '20017', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1299', '11214010134', '20018', '91.00', '4.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1300', '11214010134', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1301', '11214010134', '20020', '94.00', '4.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1302', '11214010134', '20021', '96.00', '4.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1303', '11214010134', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1304', '11214010134', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1305', '11214010135', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1306', '11214010135', '20009', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1307', '11214010135', '20010', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1308', '11214010135', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1309', '11214010135', '20012', '75.00', '2.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1310', '11214010135', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1311', '11214010135', '20014', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1312', '11214010135', '20015', '60.00', '1.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1313', '11214010135', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1314', '11214010135', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1315', '11214010135', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1316', '11214010135', '20019', '49.00', '-0.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1317', '11214010135', '20020', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1318', '11214010135', '20021', '66.00', '1.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1319', '11214010135', '20022', '64.00', '1.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1320', '11214010135', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1321', '11214010136', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1322', '11214010136', '20009', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1323', '11214010136', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1324', '11214010136', '20011', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1325', '11214010136', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1326', '11214010136', '20013', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1327', '11214010136', '20014', '71.00', '2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1328', '11214010136', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1329', '11214010136', '20016', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1330', '11214010136', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1331', '11214010136', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1332', '11214010136', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1333', '11214010136', '20020', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1334', '11214010136', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1335', '11214010136', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1336', '11214010136', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1337', '11214010137', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1338', '11214010137', '20009', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1339', '11214010137', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1340', '11214010137', '20011', '76.00', '2.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1341', '11214010137', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1342', '11214010137', '20013', '76.00', '2.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1343', '11214010137', '20014', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1344', '11214010137', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1345', '11214010137', '20016', '76.00', '2.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1346', '11214010137', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1347', '11214010137', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1348', '11214010137', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1349', '11214010137', '20020', '91.00', '4.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1350', '11214010137', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1351', '11214010137', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1352', '11214010137', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1353', '11214010138', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1354', '11214010138', '20009', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1355', '11214010138', '20010', '78.00', '2.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1356', '11214010138', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1357', '11214010138', '20012', '82.00', '3.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1358', '11214010138', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1359', '11214010138', '20014', '76.00', '2.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1360', '11214010138', '20015', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1361', '11214010138', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1362', '11214010138', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1363', '11214010138', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1364', '11214010138', '20019', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1365', '11214010138', '20020', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1366', '11214010138', '20021', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1367', '11214010138', '20022', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1368', '11214010138', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1369', '11214010139', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1370', '11214010139', '20009', '92.00', '4.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1371', '11214010139', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1372', '11214010139', '20011', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1373', '11214010139', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1374', '11214010139', '20013', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1375', '11214010139', '20014', '70.00', '2.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1376', '11214010139', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1377', '11214010139', '20016', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1378', '11214010139', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1379', '11214010139', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1380', '11214010139', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1381', '11214010139', '20020', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1382', '11214010139', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1383', '11214010139', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1384', '11214010139', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1385', '11214010140', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1386', '11214010140', '20009', '87.00', '3.70', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1387', '11214010140', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1388', '11214010140', '20011', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1389', '11214010140', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1390', '11214010140', '20013', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1391', '11214010140', '20014', '80.00', '3.00', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1392', '11214010140', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1393', '11214010140', '20016', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1394', '11214010140', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1395', '11214010140', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1396', '11214010140', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1397', '11214010140', '20020', '83.00', '3.30', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1398', '11214010140', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1399', '11214010140', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1400', '11214010140', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1401', '11214010141', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1402', '11214010141', '20009', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1403', '11214010141', '20010', '29.00', '-2.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1404', '11214010141', '20011', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1405', '11214010141', '20012', '81.00', '3.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1406', '11214010141', '20013', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1407', '11214010141', '20014', '75.00', '2.50', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1408', '11214010141', '20015', '84.00', '3.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1409', '11214010141', '20016', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1410', '11214010141', '20017', '66.00', '1.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1411', '11214010141', '20018', '72.00', '2.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1412', '11214010141', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1413', '11214010141', '20020', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1414', '11214010141', '20021', '89.00', '3.90', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1415', '11214010141', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1416', '11214010141', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1417', '11214010142', '20008', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1418', '11214010142', '20009', '88.00', '3.80', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1419', '11214010142', '20010', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1420', '11214010142', '20011', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1421', '11214010142', '20012', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1422', '11214010142', '20013', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1423', '11214010142', '20014', '74.00', '2.40', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1424', '11214010142', '20015', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1425', '11214010142', '20016', '86.00', '3.60', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1426', '11214010142', '20017', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1427', '11214010142', '20018', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1428', '11214010142', '20019', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1429', '11214010142', '20020', '92.00', '4.20', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1430', '11214010142', '20021', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1431', '11214010142', '20022', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');
INSERT INTO `mark` VALUES ('1432', '11214010142', '20023', '-1.00', '-5.10', '-1.00', '-1.00', '2016-2017', '1', '*');

-- ----------------------------
-- Table structure for obligatory
-- ----------------------------
DROP TABLE IF EXISTS `obligatory`;
CREATE TABLE `obligatory` (
  `year` varchar(20) NOT NULL COMMENT '学年',
  `term` int(11) NOT NULL COMMENT '学期',
  `cid` varchar(20) NOT NULL COMMENT '班级',
  `cno` varchar(20) NOT NULL COMMENT '课程',
  `tno` bigint(15) DEFAULT '0' COMMENT '教师',
  `info` varchar(20) DEFAULT NULL COMMENT '备注',
  KEY `PK_Cn` (`cno`),
  KEY `PK_Ci` (`cid`),
  KEY `PK_tn` (`tno`),
  CONSTRAINT `PK_Ci` FOREIGN KEY (`cid`) REFERENCES `classs` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_Cn` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of obligatory
-- ----------------------------
INSERT INTO `obligatory` VALUES ('2015-2016', '1', '3', '20004', '900001', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', '3', '20003', '900004', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', '3', '20002', '900005', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', 'A1212', '20004', '900001', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', 'A1212', '20003', '900004', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', 'A1212', '20002', '900005', '*');
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20008', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20009', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20010', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20011', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20012', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20013', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20014', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20015', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20016', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20017', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20018', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20019', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20020', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20021', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20022', '0', null);
INSERT INTO `obligatory` VALUES ('2016-2017', '1', 'A1212', '20023', '0', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` bigint(15) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `pass` varchar(20) NOT NULL COMMENT '密码',
  `sname` varchar(20) NOT NULL COMMENT '姓名',
  `ssex` char(4) DEFAULT '' COMMENT '性别',
  `sbirth` date DEFAULT '0000-00-00' COMMENT '出生年月',
  `sid` varchar(20) DEFAULT '' COMMENT '身份证号',
  `cid` varchar(20) NOT NULL COMMENT '班级',
  `spolitics` varchar(20) DEFAULT NULL COMMENT '政治面貌',
  `saddr` varchar(50) DEFAULT '' COMMENT '家庭住址',
  `sinfo` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sno`),
  KEY `PK_CC` (`cid`),
  CONSTRAINT `PK_CC` FOREIGN KEY (`cid`) REFERENCES `classs` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20160101008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('12', '1', '十二', '2', '1990-03-03', '90', '3', '3', '45', '55');
INSERT INTO `student` VALUES ('15', '1', '十五', '2', '1990-03-03', '902', '3', '3', '45', '55');
INSERT INTO `student` VALUES ('16', '1', '十六', '2', '1990-03-03', '2', 'A1212', '3', '45', '55');
INSERT INTO `student` VALUES ('17', '1', '十七', '2', '1990-03-03', '21', 'A1212', '3', '45', '55');
INSERT INTO `student` VALUES ('20', '1', '二十', '2', '1990-03-03', '11', '3', '3', '45', '55');
INSERT INTO `student` VALUES ('21', '1', '二十一', '2', '2016-09-22', '34', 'A1212', '3333', '333', '333');
INSERT INTO `student` VALUES ('22', '1', '二十', '2', '1990-03-03', '45', '3', '3', '45', '55');
INSERT INTO `student` VALUES ('2038', '21', '21', '2', '2016-09-01', '43434', '3', '33', '333', '3eswa');
INSERT INTO `student` VALUES ('11010020128', '123', '周本亮', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11114010303', '123', '黄隽', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11208090103', '123', '徐志伟', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010101', '123', '曾远', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010103', '123', '贾婷', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010104', '123', '张杰', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010105', '123', '杨梦雯', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010106', '123', '彭致华', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010107', '123', '肖钰莹', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010108', '123', '方寒峰', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010109', '123', '肖凯文', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010110', '123', '刘红生', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010111', '123', '陈强华', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010112', '123', '戴伟', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010113', '123', '林其聪', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010114', '123', '叶世凌', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010115', '123', '张宇红', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010116', '123', '牟秀', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010117', '123', '欧阳彬', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010118', '123', '丁玲丽', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010119', '123', '姚林', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010120', '123', '吴志兵', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010121', '123', '桂文', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010122', '123', '马小鹏', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010123', '123', '肖爱金', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010124', '123', '张志帅', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010125', '123', '刘欣', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010126', '123', '李幼杰', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010127', '123', '卢刚', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010128', '123', '魏奎财', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010129', '123', '胡冰华', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010130', '123', '程铖', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010131', '123', '王美萍', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010132', '123', '严翔', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010133', '123', '汪岳葵', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010134', '123', '海宇尚', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010135', '123', '石文胜', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010136', '123', '胡玉琼', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010137', '123', '刘晗', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010138', '123', '钟世明', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010139', '123', '刘璐', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010140', '123', '曹勤', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010141', '123', '周建辉', '', '0000-00-00', '', 'A1212', null, '', null);
INSERT INTO `student` VALUES ('11214010142', '123', '杨鹃榕', '', '0000-00-00', '', 'A1212', null, '', null);

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
-- Records of syllabus
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=900007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('900001', '沃克尔', '1', '男', '1980-08-24', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900002', '沃克尔', '2', '男', '1980-08-25', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900003', '沃克尔', '3', '男', '1980-08-26', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900004', '沃克尔', '4', '男', '1980-08-27', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900005', '沃克尔', '5', '男', '1980-08-28', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900006', '沃克尔', '6', '男5', '1980-08-29', '无', '教师', 'IT', '*');

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
-- Records of temp
-- ----------------------------
INSERT INTO `temp` VALUES ('12', '十二', '93.00', '4.00', '98.00', '3.00', '66.00', '4.00');
INSERT INTO `temp` VALUES ('20', '二十', '93.00', '4.00', '87.00', '3.00', '82.00', '4.00');

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
