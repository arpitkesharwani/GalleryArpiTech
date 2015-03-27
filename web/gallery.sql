/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.0.67-community-nt : Database - gallery
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gallery` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gallery`;

/*Table structure for table `album` */

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `id` int(11) NOT NULL auto_increment,
  `albumName` varchar(200) NOT NULL,
  `albumDate` date default NULL,
  `albumCover` varchar(200) default NULL,
  `albumDescription` varchar(500) default NULL,
  PRIMARY KEY  (`albumName`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `album` */

insert  into `album`(`id`,`albumName`,`albumDate`,`albumCover`,`albumDescription`) values (5,'gandhi','2010-02-20','MyImage/AlbumCoverImage/5610dfe3-8a47-4013-87f5-cf5f4cd5beda_CoverImage.png',NULL),(1,'juhi chawala','2004-02-20','MyImage/AlbumCoverImage/49a74e2f-4b8e-4b07-9be0-56e2a1e230eb_CoverImage.png',NULL),(3,'MahaShivRtri','2007-07-20','MyImage/AlbumCoverImage/08e61868-0afd-4e61-b979-8cb81340ff1b_CoverImage.png',NULL),(2,'Maheshwar','2003-02-20','MyImage/AlbumCoverImage/10db3aaa-725d-4b32-8a6a-a1e08108bb9a_CoverImage.png',NULL),(6,'Salkanpur','2002-02-20','MyImage/AlbumCoverImage/0ac259c1-bbdd-4c27-97ce-c8206b602b43_CoverImage.png',NULL),(4,'Sanchi Stoop','2019-02-20','MyImage/AlbumCoverImage/793d9230-3182-4551-b9c4-cd30046bf799_CoverImage.png',NULL);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `email` varchar(200) default NULL,
  `message` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`name`,`email`,`message`) values (20,'Arpit Kesharwani','arpitanshul@gmail.com','m;jl;jl;'),(21,'Arpit Kesharwani','arpitanshul@gmail.com','j;j;lk;j'),(22,'Apit','bdhd','thrrjrjryjryjy'),(23,'Arpit Kesharwani','fgdfg','fgdfg'),(24,'ggg','hjh','rtretr'),(25,'aroit','sadasd@gmail.com','jhhjgh'),(26,'Arpit Kesharwani','guptashubham@gmail.com',';fdg;dfgg; fggdfgifd gfdjgpf'),(27,'ggg','eww@gmail.com','hi my name is arpit'),(28,'dfsf','eww@gmail.com','dg;jdsgs'),(29,',mb,b,mb','eww@gmail.com','dfsjdlglks'),(30,',mb,b,mb','eww@gmail.com','dsf,sdfnds,f'),(31,'ggg','bdhd','fewretr'),(32,'aroit','sadasd@gmail.com','jwet');

/*Table structure for table `friend` */

DROP TABLE IF EXISTS `friend`;

CREATE TABLE `friend` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(10) default NULL,
  `designation` varchar(100) default NULL,
  `companyName` varchar(100) default NULL,
  `image` varchar(500) default NULL,
  `linkedInUrl` varchar(200) default NULL,
  `fbUrl` varchar(200) default NULL,
  `twitterUrl` varchar(200) default NULL,
  PRIMARY KEY  (`email`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `friend` */

insert  into `friend`(`id`,`name`,`email`,`gender`,`designation`,`companyName`,`image`,`linkedInUrl`,`fbUrl`,`twitterUrl`) values (35,'Arpit Kesharwani','arpitanshul@gmail.com','Male','Web developer','Gravity Consulting','MyImage/FrndsImage/f67c1fd4-c8f2-4c3f-8abe-c343bf1b7914_FriendsImage.png','twitterUrl','twitterUrl','twitterUrl'),(36,'Arpit Kesharwani','dgsdgs@gmail.com','Male','fsdgs','Gravity Consulting','MyImage/FrndsImage/73936852-2ec3-4e9a-947c-322c602e7547_FriendsImage.png','twitterUrl','twitterUrl','twitterUrl'),(37,'ggg','eww@gmail.com','Male','Web developer','gd',NULL,'twitterUrl','twitterUrl','twitterUrl'),(38,',mb,b,mb','sadasd@gmail.com','Male','fsdgs','Gravity Consulting','MyImage/FrndsImage/0d59d8c8-500d-421c-8eb9-67bd1278769c_FriendsImage.png','twitterUrl','twitterUrl','twitterUrl');

/*Table structure for table `gallery_images` */

DROP TABLE IF EXISTS `gallery_images`;

CREATE TABLE `gallery_images` (
  `id` int(11) NOT NULL auto_increment,
  `imagepath` varchar(200) default NULL,
  `albumName` varchar(200) default NULL,
  KEY `id` (`id`),
  KEY `albumName` (`albumName`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

/*Data for the table `gallery_images` */

insert  into `gallery_images`(`id`,`imagepath`,`albumName`) values (70,'MyImage/FB_IMG_1423823764021.jpg','null'),(71,'MyImage/FB_IMG_1423823842683.jpg','null'),(72,'MyImage/FB_IMG_1423823866688.jpg','null'),(73,'MyImage/FB_IMG_1423823904162.jpg','null'),(74,'MyImage/FB_IMG_1423823939326.jpg','null'),(75,'MyImage/FB_IMG_1423823989850.jpg','null'),(76,'MyImage/FB_IMG_1423823939326.jpg','Maheshwar'),(77,'MyImage/FB_IMG_1423823989850.jpg','Maheshwar'),(78,'MyImage/FB_IMG_1423824041852.jpg','Maheshwar'),(79,'MyImage/FB_IMG_1423824078451.jpg','Maheshwar'),(80,'MyImage/Sanchi Stoop/FB_IMG_1423823764021.jpg','Sanchi Stoop'),(81,'MyImage/Sanchi Stoop/FB_IMG_1423823842683.jpg','Sanchi Stoop'),(82,'MyImage/Sanchi Stoop/FB_IMG_1423823866688.jpg','Sanchi Stoop'),(83,'MyImage/Sanchi Stoop/FB_IMG_1423823904162.jpg','Sanchi Stoop'),(84,'MyImage/Salkanpur/Salkanpur2013-04-22_12.29.23.JPG','Salkanpur'),(85,'MyImage/Salkanpur/Salkanpur2013-04-22_12.29.53.JPG','Salkanpur'),(86,'MyImage/Salkanpur/Salkanpur2013-04-22_12.30.08.JPG','Salkanpur'),(87,'MyImage/Salkanpur/Salkanpur2013-04-22_12.30.23.JPG','Salkanpur'),(88,'MyImage/Salkanpur/Salkanpur2013-04-22_12.38.10.JPG','Salkanpur'),(89,'MyImage/Salkanpur/Salkanpur2013-04-22_12.38.14.JPG','Salkanpur'),(90,'MyImage/Salkanpur/Salkanpur2013-04-22_12.38.32.JPG','Salkanpur'),(91,'MyImage/Salkanpur/Salkanpur2013-04-22_12.38.38.JPG','Salkanpur'),(92,'MyImage/Salkanpur/Salkanpur2013-04-22_12.50.08.JPG','Salkanpur'),(93,'MyImage/Salkanpur/Salkanpur2013-04-22_12.50.13.JPG','Salkanpur'),(94,'MyImage/Salkanpur/Salkanpur2013-04-22_14.05.05.JPG','Salkanpur'),(95,'MyImage/Salkanpur/Salkanpur2013-04-22_14.05.11.JPG','Salkanpur'),(96,'MyImage/Salkanpur/Salkanpur2013-04-22_14.05.56.JPG','Salkanpur'),(97,'MyImage/Salkanpur/Salkanpur2013-04-22_14.08.15.JPG','Salkanpur'),(98,'MyImage/Salkanpur/Salkanpur2013-04-22_14.08.27.JPG','Salkanpur'),(99,'MyImage/Salkanpur/Salkanpur2013-04-22_14.10.38.JPG','Salkanpur'),(100,'MyImage/Salkanpur/Salkanpur2013-04-22_14.15.30.JPG','Salkanpur'),(101,'MyImage/Salkanpur/Salkanpur2013-04-22_14.15.46.JPG','Salkanpur'),(102,'MyImage/Salkanpur/Salkanpur2013-04-22_14.16.32.JPG','Salkanpur'),(103,'MyImage/Salkanpur/Salkanpur2013-04-22_14.16.43.JPG','Salkanpur'),(104,'MyImage/Salkanpur/Salkanpur2013-04-22_14.18.06.JPG','Salkanpur'),(105,'MyImage/Salkanpur/Salkanpur2013-04-22_14.18.11.JPG','Salkanpur'),(106,'MyImage/Salkanpur/Salkanpur2013-04-22_14.18.35.JPG','Salkanpur');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) default NULL,
  PRIMARY KEY  (`username`),
  KEY `id` (`id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `register` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`) values (5,'arpitanshul@gmail.com','e1adc3949ba59abbe56e057f2f883e');

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `id` int(11) NOT NULL auto_increment,
  `firstName` varchar(100) default NULL,
  `lastName` varchar(100) default NULL,
  `gender` varchar(20) default NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY  (`email`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `register` */

insert  into `register`(`id`,`firstName`,`lastName`,`gender`,`email`) values (7,'Arpit','Kesharwani','Male','arpitanshul@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
