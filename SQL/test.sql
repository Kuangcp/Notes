# Host: localhost  (Version: 5.5.19)
# Date: 2016-05-19 16:07:04
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "test"
#

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `boDate` date DEFAULT NULL,
  `factDate` date DEFAULT NULL,
  `reDate` date DEFAULT NULL,
  `overDays` int(11) DEFAULT NULL,
  `overDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "test"
#

INSERT INTO `test` VALUES (1,'2016-03-05',NULL,'2016-04-08',NULL,'2000-02-14'),(2,'2016-04-01',NULL,'2015-05-01',NULL,'2000-01-18');
