/*
Navicat MySQL Data Transfer

Source Server         : Myth
Source Server Version : 50519
Source Host           : 127.0.0.1:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2016-09-12 22:48:15
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
) ENGINE=InnoDB AUTO_INCREMENT=800021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assitant
-- ----------------------------
INSERT INTO `assitant` VALUES ('800001', '辅导员1', '1', '女', 'I10001', '*');
INSERT INTO `assitant` VALUES ('800002', '辅导员2', '2', '女', 'I10001', '*');
INSERT INTO `assitant` VALUES ('800003', '辅导员3', '3', '女', 'I10001', '*');
INSERT INTO `assitant` VALUES ('800004', '辅导员4', '4', '女', 'I10001', '*');
INSERT INTO `assitant` VALUES ('800005', '辅导员5', '5', '女', 'I10001', '*');
INSERT INTO `assitant` VALUES ('800020', 'ed', 'ee', 'dsd', 'I10001', 'dfasfa');

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
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('20002', '编译原理', '4.00', '48.00', '32.00', '基础课程', 'IT', '2');
INSERT INTO `course` VALUES ('20003', '单片机', '3.00', '32.00', '32.00', '51单片机', 'IT', '3');
INSERT INTO `course` VALUES ('20004', '数据结构', '4.00', '32.00', '32.00', '52单片机', 'IT', '4');
INSERT INTO `course` VALUES ('20005', '计算机网络', '3.00', '32.00', '32.00', '53单片机', 'IT', '5');
INSERT INTO `course` VALUES ('20006', '软件工程', '2.00', '32.00', '32.00', '54单片机', 'IT', '6');
INSERT INTO `course` VALUES ('20007', '数据库原理', '4.00', '32.00', '32.00', '55单片机', 'IT', '7');

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
INSERT INTO `manager` VALUES ('34224', 'df', 'dasf');
INSERT INTO `manager` VALUES ('3443', 'df', 'd23');
INSERT INTO `manager` VALUES ('5', 'df', 'dasf');

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
-- Records of obligatory
-- ----------------------------
INSERT INTO `obligatory` VALUES ('2015-2016', '1', '3', '20004', '900001', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', '3', '20003', '900004', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', '3', '20002', '900005', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', 'A1212', '20004', '900001', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', 'A1212', '20003', '900004', '*');
INSERT INTO `obligatory` VALUES ('2015-2016', '1', 'A1212', '20002', '900005', '*');

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
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('12', '1', '十二', '2', '1970-01-01', '90', '3', '3', '45', '55');
INSERT INTO `student` VALUES ('15', '1', '十五', '2', '1970-01-01', '902', '3', '3', '45', '55');
INSERT INTO `student` VALUES ('16', '1', '十六', '2', '1970-01-01', '2', 'A1212', '3', '45', '55');
INSERT INTO `student` VALUES ('17', '1', '十七', '2', '1970-01-01', '21', 'A1212', '3', '45', '55');
INSERT INTO `student` VALUES ('20', '1', '二十', '2', '1970-01-01', '11', '3', '3', '45', '55');
INSERT INTO `student` VALUES ('21', '1', '23', '2', '2016-09-22', '34', 'A1212', '3333', '333', '333');

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
) ENGINE=InnoDB AUTO_INCREMENT=900008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('900001', '沃克尔', '1', '男', '1980-08-24', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900002', '沃克尔', '2', '男', '1980-08-25', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900003', '沃克尔', '3', '男', '1980-08-26', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900004', '沃克尔', '4', '男', '1980-08-27', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900005', '沃克尔', '5', '男', '1980-08-28', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900006', '沃克尔', '6', '男', '1980-08-29', '无', '教师', 'IT', '*');
INSERT INTO `teacher` VALUES ('900007', '沃克尔', '7', '男', '1980-08-30', '无', '教师', 'IT', '*');

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
