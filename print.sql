/*
SQLyog Ultimate v8.32 
MySQL - 5.5.36 : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

/*Table structure for table `adminuser` */

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `auid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`auid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `adminuser` */

insert  into `adminuser`(`auid`,`username`,`password`,`uid`) values (1,'admin','admin',0);

/*Table structure for table `billitem` */

DROP TABLE IF EXISTS `billitem`;

CREATE TABLE `billitem` (
  `billid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `ptotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`billid`),
  UNIQUE KEY `pid` (`pid`),
  KEY `FK3510439A73B4E627` (`pid`),
  CONSTRAINT `FK3510439A73B4E627` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `billitem` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cid`,`cname`) values (1,'纸质类'),(2,'笔类'),(4,'食品零食'),(5,'生活便民'),(7,'打印'),(10,'学习用品');

/*Table structure for table `categorysecond` */

DROP TABLE IF EXISTS `categorysecond`;

CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF2418BCBAF` (`cid`),
  CONSTRAINT `FK936FCAF2418BCBAF` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `categorysecond` */

insert  into `categorysecond`(`csid`,`csname`,`cid`) values (1,'打印纸质',NULL),(2,'草稿本',NULL),(3,'作业本',NULL),(4,'生活用纸',NULL),(5,'毛笔',NULL),(6,'考试用笔',NULL),(7,'单词本',1),(8,'方格本',1),(10,'',NULL),(14,'休闲食品',4),(15,'生鲜食品',4),(16,'粮油调味',NULL),(17,'地方特产',4),(18,'时尚饰品',NULL),(19,'眼镜配饰',NULL),(25,'',NULL),(27,'考试系列',7),(28,'照片',7),(29,'彩印',1),(35,'草稿本',1),(36,'作业本',1),(38,'毛笔',2),(39,'钢笔',2),(40,'考试用笔',2),(41,'中性笔',2),(42,'普通打印',7),(43,'水彩笔',2),(44,'橡皮擦',10),(45,'圆规',10),(46,'尺子',10),(47,'便利贴',5);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `messagedate` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `FK38EB0007FC32F8E` (`uid`),
  CONSTRAINT `FK38EB0007FC32F8E` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `oiid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oiid`),
  KEY `FKE8B2AB61E818A405` (`oid`),
  KEY `FKE8B2AB6173B4E627` (`pid`),
  CONSTRAINT `FKE8B2AB6173B4E627` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `FKE8B2AB61E818A405` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`oiid`,`count`,`subtotal`,`pid`,`oid`) values (1,1,699,36,2),(2,1,588,37,2),(3,1,699,42,2),(4,1,699,40,2),(5,1,4899,54,3),(6,1,7999,55,3),(7,1,45,45,3),(8,1,9,46,3),(9,1,289,47,4),(10,1,4899,54,5),(11,1,2,54,6),(12,1,289,47,6),(13,1,2,54,7),(14,1,5,56,8),(15,5,25,51,9),(16,1,0.1,57,9),(17,5610,561,57,10);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `receiveInfo` varchar(255) DEFAULT NULL,
  `phoNum` varchar(255) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `accepter` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E5FC32F8E` (`uid`),
  CONSTRAINT `FKC3DF62E5FC32F8E` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`oid`,`money`,`state`,`receiveInfo`,`phoNum`,`order_time`,`uid`,`accepter`) values (1,2685,0,NULL,NULL,'2018-03-18 21:10:00',3,NULL),(2,2685,2,'上海市静安区','13913812312','2018-03-18 21:12:16',3,'嗷大猫'),(3,12952,0,NULL,NULL,'2018-03-04 17:37:01',1,NULL),(4,289,3,'水电费水电费','是的冯绍峰','2019-05-28 18:32:38',2,'胜多负少'),(5,4899,1,'45645','456456','2019-05-28 18:46:05',2,'45645'),(6,291,3,'','','2019-05-28 20:04:22',2,''),(7,2,3,'爱对方水电费','沙发斯蒂芬','2019-06-02 16:34:12',2,'水电费水电费'),(8,5,1,'','','2019-06-06 10:04:22',2,''),(9,25.1,0,NULL,NULL,'2019-06-06 11:01:20',2,NULL),(10,561,1,'水电费水电费','456456','2019-06-10 10:51:53',2,'45');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdesc` varchar(5000) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdate` timestamp NULL DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEF5F778050` (`csid`),
  CONSTRAINT `FKED8DCCEF5F778050` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`pid`,`pname`,`market_price`,`shop_price`,`image`,`pdesc`,`is_hot`,`pdate`,`csid`,`state`) values (36,'档案袋',5,5,'products/689357e1-cf20-4f31-8a1e-5616541cadfaTIM图片20190528193441.png','档案袋',0,'2019-06-03 08:45:10',47,NULL),(37,'笔记本',8,8,'products/0707d69c-c2ee-4b61-a165-8eab5241d57dTIM图片20190528193502.jpg','作业笔记本',0,'2019-06-03 08:43:34',36,NULL),(40,'水彩笔',8,8,'products/14cb6965-b0a5-4db5-8eb3-7cf8cda33846TIM图片20190528193457.jpg','水彩笔',1,'2019-06-03 08:42:43',43,NULL),(42,'画笔',2,2,'products/31e96556-b8ba-4ee5-9041-88dd4259a6e9TIM图片20190528193410.jpg','画笔',0,'2019-06-03 08:41:58',43,NULL),(45,'费列罗巧克力',55,45,'products/61e7a560-b44e-49dc-a36a-8a44e43b0f84021.jpg','费列罗巧克力',1,'2018-02-04 16:29:59',14,NULL),(46,'喜之郎果冻',11,9,'products/7354dcbc-550e-4dfb-9452-a8e216f3577a020.jpg','喜之郎果冻',1,'2018-02-04 16:31:26',14,NULL),(47,'小柜子',299,289,'products/9d4b86c5-acdb-43b3-96d9-af3a0af683a1TB2faVxXvDH8KJjy1XcXXcpdXXa_!!722699487.jpg_430x430q90.jpg','小柜子',1,'2019-06-02 15:08:53',47,NULL),(51,'铅笔',5,5,'products/60a8fa31-a9ce-44e7-b0d3-7d70d4e6275bTIM图片20190528193451.jpg','铅笔',0,'2019-06-03 08:44:24',39,NULL),(52,'文具',199,179,'products/aa63c02b-a74b-40c4-82c3-02b31db6ff1cTB1peBczkSWBuNjSszdXXbeSpXa_!!0-item_pic.jpg_430x430q90.jpg','文具',0,'2019-06-02 15:06:45',35,NULL),(53,'舌尖上的中国',29,19,'products/f5fca230-0214-486e-a033-cda9c2789245big_03.jpg','舌尖上的中国',0,'2018-02-04 16:46:58',29,NULL),(54,'档案袋（大）',2,2,'products/eb549709-382b-4874-b8e2-fd2c49c84ba6O1CN01EGipxE1ZyxFER1fKt_!!3173833264.jpg_400x400.jpg','用来装一些文件',1,'2019-06-02 15:08:30',47,NULL),(55,'文具',2,2,'products/a159822f-4d9d-46f8-bb97-3bb5406088aeTIM图片20190528193502.jpg','笔记本',1,'2019-06-02 15:08:16',3,NULL),(56,'铅笔',5,5,'products/314a10c8-5e73-4a17-a854-48b12846d04eTIM图片20190528193423.png','橡皮',1,'2019-06-03 08:45:46',44,NULL),(57,'普通打印',0.1,0.1,'products/6bab7f51-f409-4b95-a4e3-51a15b3582c1微信图片_20190603085106.png','普通打印文件',1,'2019-06-03 08:53:16',42,NULL);

/*Table structure for table `shopcartitem` */

DROP TABLE IF EXISTS `shopcartitem`;

CREATE TABLE `shopcartitem` (
  `cartitemid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `pcount` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ptotal` double DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cartitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shopcartitem` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL DEFAULT '1',
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`name`,`email`,`phone`,`addr`,`state`,`code`) values (1,'hikitty','123456','张三','hikitty@qq.com','13555512345','上海市','1',NULL),(2,'jack','123456','马云','jack@qq.com','13812312312','中国','1',NULL),(3,'hellokitty','123456','张三','aodamao@qq.com','13555512345','上海市','0','ca0f6f5a-36da-402d-8c0f-22587423de20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
