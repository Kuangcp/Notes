# Host: localhost  (Version 5.5.19)
# Date: 2016-06-12 19:42:10
# Generator: MySQL-Front 5.3  (Build 5.39)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "acount"
#

DROP TABLE IF EXISTS `acount`;
CREATE TABLE `acount` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账单',
  `vno` int(11) DEFAULT NULL,
  `gno` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `prices` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "acount"
#


#
# Structure for table "cashier"
#

DROP TABLE IF EXISTS `cashier`;
CREATE TABLE `cashier` (
  `cno` int(11) NOT NULL DEFAULT '0' COMMENT '收银员编号',
  `name` char(20) DEFAULT NULL,
  `pass` char(16) DEFAULT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "cashier"
#


#
# Structure for table "goods"
#

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `gno` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `name` varchar(11) DEFAULT NULL,
  `odd` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `price` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`gno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "goods"
#

INSERT INTO `goods` VALUES (1,'we',2,4,1.00),(2,'2',2,2,2.00),(3,'3',3,3,3.00);

#
# Structure for table "mold"
#

DROP TABLE IF EXISTS `mold`;
CREATE TABLE `mold` (
  `gno` int(11) DEFAULT NULL,
  `nums` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "mold"
#


#
# Structure for table "vip"
#

DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `vno` int(11) NOT NULL DEFAULT '0' COMMENT '会员编号',
  `name` char(20) DEFAULT NULL,
  `sex` char(4) DEFAULT NULL,
  `phone` char(14) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  PRIMARY KEY (`vno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "vip"
#

