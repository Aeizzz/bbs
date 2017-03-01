/*
SQLyog Ultimate v8.32 
MySQL - 5.7.17-log : Database - bbs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bbs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bbs`;

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `pid` varchar(32) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `creattime` timestamp NULL DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `NewIndex1` (`uid`),
  CONSTRAINT `FK_post` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `post` */

insert  into `post`(`pid`,`title`,`content`,`creattime`,`uid`) values ('169D8B112C52440D8C87F41E9371FBA9','asdasd','<p>sadasdasdasdasd<span style=\"color: inherit;\">sadasdasdasdasd</span><span style=\"color: inherit;\">sadasdasdasdasd</span></p><p>sadasdasdasdasd</p><p>sadasdasdasdasd</p><p>sadasdasdasdasd</p><p>sadasdasdasdasd</p><p>sadasdasdasdasd</p><p><br></p><p>sadasdasdasdasd<span style=\"color: inherit;\">sadasdasdasdasd</span></p><p><br></p>','2017-02-28 08:00:49','631FA5B05A294DCDBD235197E305B0FF'),('42CF60D765D5491C990E7FCFECD02108','123','<p>naisodhalsdas<span style=\"color: inherit;\">naisodhalsdas</span><span style=\"color: inherit;\">naisodhalsdas</span><span style=\"color: inherit;\">naisodhalsdas</span><span style=\"color: inherit;\">naisodhalsdas</span><span style=\"color: inherit;\">naisodhalsdas</span></p><p><br></p>','2017-02-28 08:01:25','176367635BF74270BDB32F41A52D8B57'),('58ABC464A3414BE49BA84BA3965B5268','root的帖子','<p>root</p>','2017-02-28 08:18:23','EACB6454D6F14EDBB85E39DD6B33C97A'),('833B9533C4ED4921A46B49CCCEFCCEFA','题目','<p>这是个测试文章</p>','2017-02-27 08:27:29','631FA5B05A294DCDBD235197E305B0FF'),('BD42DDBC2A5A411AA9C3CF32D4C0E962','asdasdasd','<p>asdasdasd</p>','2017-02-28 08:01:16','176367635BF74270BDB32F41A52D8B57'),('EC726C5A2ABB464DB87DCC8E31014070','asdas ','<p>asdasdasdasd</p>','2017-02-25 00:00:00','631FA5B05A294DCDBD235197E305B0FF'),('FADEE0E4BC864DE4B37DE10903939E39','啊金山毒霸数据库','<p>是擦速度<span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span><span style=\"color: inherit;\">是擦速度</span></p><p><br></p>','2017-02-28 08:01:50','176367635BF74270BDB32F41A52D8B57');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` char(20) DEFAULT NULL,
  `passworld` char(20) DEFAULT NULL,
  `creattime` timestamp NULL DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`passworld`,`creattime`,`admin`,`name`) values ('176367635BF74270BDB32F41A52D8B57','123','123','2017-02-28 08:00:59',0,'123'),('631FA5B05A294DCDBD235197E305B0FF','1129603149','liuhonglei','2017-02-27 11:23:13',1,'刘洪磊'),('EACB6454D6F14EDBB85E39DD6B33C97A','admin','admin','2017-02-28 08:09:53',1,'admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
