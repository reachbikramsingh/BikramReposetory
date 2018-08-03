CREATE DATABASE  IF NOT EXISTS `vrs_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vrs_db`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: vrs_db
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id_admin` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin'),(2,'ravi','ravi'),(3,'dev','dev'),(4,'bikram','bikram');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeofregistration`
--

DROP TABLE IF EXISTS `changeofregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeofregistration` (
  `Reg_Num` int(10) NOT NULL AUTO_INCREMENT,
  `Reg_Date` date DEFAULT NULL,
  `Userid` int(11) DEFAULT NULL,
  `V_id` varchar(15) DEFAULT NULL,
  `Owner_Change` tinyint(1) DEFAULT NULL,
  `License_No` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Reg_Num`),
  KEY `fk_vid` (`V_id`),
  KEY `fk_uid` (`Userid`),
  CONSTRAINT `fk_uid` FOREIGN KEY (`Userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `fk_vid` FOREIGN KEY (`V_id`) REFERENCES `vehicle` (`V_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeofregistration`
--

LOCK TABLES `changeofregistration` WRITE;
/*!40000 ALTER TABLE `changeofregistration` DISABLE KEYS */;
INSERT INTO `changeofregistration` VALUES (1,'2015-11-03',1,'asd',1,'Yash4321'),(3,'2015-11-03',1,'a587468e',1,'Yash4321'),(4,'2015-11-03',1,'asd45674',1,'Yash4321');
/*!40000 ALTER TABLE `changeofregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealer`
--

DROP TABLE IF EXISTS `dealer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dealer` (
  `Dealer_id` int(20) NOT NULL AUTO_INCREMENT,
  `Email_id` varchar(60) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Company_Name` varchar(60) NOT NULL,
  `Office_Loc` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `Contact` varchar(11) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `Zipcode` int(11) DEFAULT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  PRIMARY KEY (`Dealer_id`),
  UNIQUE KEY `Email_id_UNIQUE` (`Email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealer`
--

LOCK TABLES `dealer` WRITE;
/*!40000 ALTER TABLE `dealer` DISABLE KEYS */;
INSERT INTO `dealer` VALUES (1,'honda@gmail.com','111111','Honda Motor Corp.','weqweqw','hyd','sdfsdfds','ap','hyd',2222,'',''),(2,'nani@gmail.com','111111','Deccansoft','Delhi','wrwer','9700094389','ap','hyd',123211,'nani','p'),(3,'nan11i@gmail.com','111111','Deccansoft','Delhi','wrwer','9700094389','ap','hyd',34324,'nani1','p'),(4,'bikram@gmail.com','bikram','jsssss','hyderabad','hyderabad','9550552955','hyderabad','hyderabad',825320,'bikram','bikram');
/*!40000 ALTER TABLE `dealer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initial_registration`
--

DROP TABLE IF EXISTS `initial_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initial_registration` (
  `Reg_Num` int(11) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `Userid` int(11) DEFAULT NULL,
  `Dealer_id` int(20) DEFAULT NULL,
  `V_id` varchar(15) DEFAULT NULL,
  `Temp_reg_num` int(10) NOT NULL AUTO_INCREMENT,
  `License_No` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Temp_reg_num`),
  UNIQUE KEY `Temp_reg_num` (`Temp_reg_num`),
  KEY `fk_userid` (`Userid`),
  KEY `fk_dealerid` (`Dealer_id`),
  KEY `fk_vid1` (`V_id`),
  CONSTRAINT `fk_dealerid` FOREIGN KEY (`Dealer_id`) REFERENCES `dealer` (`Dealer_id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`Userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `fk_vid1` FOREIGN KEY (`V_id`) REFERENCES `vehicle` (`V_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initial_registration`
--

LOCK TABLES `initial_registration` WRITE;
/*!40000 ALTER TABLE `initial_registration` DISABLE KEYS */;
INSERT INTO `initial_registration` VALUES (3718,'2015-11-05 14:19:50',8,1,'CGD234',1,'V1234V'),(3344,'2015-11-05 14:32:33',9,1,'ABCD1234',2,'LI346'),(7248,'2015-11-09 10:46:42',11,1,'7890',3,'NEWLI'),(5454,'2015-11-10 06:58:25',12,1,'a587468e',4,'MAKE123456'),(6446,'2015-11-10 06:59:10',13,1,'asd45674',5,'NEWLI4'),(54545,'2015-11-16 10:00:39',1,1,'asd',6,'LIC4234'),(NULL,NULL,18,1,'FFRR45',7,'Lic455'),(NULL,NULL,25,4,'2132',8,'1212');
/*!40000 ALTER TABLE `initial_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `Notification_id` int(11) NOT NULL,
  `Userid` int(11) DEFAULT NULL,
  `Reg_Num` int(10) DEFAULT NULL,
  `Mail_Status` varchar(30) DEFAULT NULL,
  `License_No` varchar(30) DEFAULT NULL,
  `Temp_Reg_Num` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Notification_id`),
  KEY `fk_uid1` (`Userid`),
  CONSTRAINT `fk_uid1` FOREIGN KEY (`Userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `contact` varchar(11) DEFAULT NULL,
  `email_id` varchar(60) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `address1` varchar(60) DEFAULT NULL,
  `address2` varchar(60) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `license_num` varchar(15) NOT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `license_num_UNIQUE` (`license_num`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Yashasvi','Dhanakonda','9700091111','anusha.k@deccansoft.com','121212','new',NULL,'new','new','2222','Yash4321',NULL),(2,'Vamshi','Renukuntla','102060902','vamshi4689@hotmail.com','vamshi4622','7221','Avalon Gates','Trumbull','CT','06611','XAX235',NULL),(3,'Yash','Yash','7778889999','yash2spy1@gmail.com','yash234','yash',NULL,'yash','yash','yash','MAKE123','2014-05-20'),(4,'vamshi','krishna',NULL,NULL,NULL,'7221 avalon gates',NULL,NULL,NULL,NULL,'54236878',NULL),(5,'Yash2','Yash2','1212121212','yash2spy2@gmail.com','yash234','yash2',NULL,'yash2','yash2','yash2','mak234','1999-02-02'),(7,'YYY12','DDD12',NULL,NULL,NULL,'asd',NULL,NULL,NULL,NULL,'MAKE12345',NULL),(8,'Rakesh','Mishra',NULL,NULL,NULL,'Town City',NULL,NULL,NULL,NULL,'V1234V',NULL),(9,'Rakesh','krishna',NULL,NULL,NULL,'1320 gate macd',NULL,NULL,NULL,NULL,'LI346',NULL),(10,'rohan','reddy','0987789098','rohan@yahoo.co.in','rohan23','rohan',NULL,'rohan','rohan','rohan','buh345','2014-05-20'),(11,'Santosh','Kumar','0987789090','yash2spy3@gmail.com','yash345','4500 n south',NULL,'Joliet','IL','60435','NEWLI','2014-05-20'),(12,'rohan','Yash',NULL,NULL,NULL,'yash',NULL,NULL,NULL,NULL,'MAKE123456',NULL),(13,'Santosh','Kumar',NULL,NULL,NULL,'4500 n south',NULL,NULL,NULL,NULL,'NEWLI4',NULL),(15,'murfy','man','4102060902','murfy789@gmail.com','scofield123','7221 avalon gates',NULL,'Trumbull','Connecticut','06611','AP0245876985','1989-06-04'),(16,'11321','qweqwe','weqweq','admin@gmai..com','admin','wqwe',NULL,'qwewe','qweq','4324','qeq','1205-02-06'),(18,'Nani','babu',NULL,NULL,NULL,'hyd',NULL,NULL,NULL,NULL,'Lic455',NULL),(19,'bikram','singh','9550552955','biku2955@gmail.com','123123','rah',NULL,'edrsd','ts','500001','1222','2016-04-13'),(20,'Raj','Kumar','8956238950','raj@gmail.com','Raj@123','Hyderabadhjgsh',NULL,'hyd','delhi','825320','23434','1991-02-10'),(21,'qsdsad','dfdf','9685745458','admin','dfd','d',NULL,'s','fg','45451','dfdg','2016-08-02'),(22,'Amita','lakkakula','8754874587','amita@gmail.com','demo','hyd',NULL,'hyd','telangana','54124','123123','2017-06-07'),(23,'Abhijit','Subhedar','0433902705','abhijitsubhedar@gmail.com','deccansoft','Hyderabad',NULL,'Hyderabad','telangana','50195','Apj5824f','2016-07-04'),(24,'triveni','t','7845874578','triveni@gmail.com','triveni','hyd',NULL,'Hyderabad','telanagana','50195','875487454','1994-06-05'),(25,'aaaa','bbbb',NULL,NULL,NULL,'cccc',NULL,NULL,NULL,NULL,'1212',NULL),(26,'test','test','1234567890','test@gmail.com','test','hyd ts',NULL,'Hyderabad','telanagana','50195','12','2016-10-05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `V_id` varchar(15) NOT NULL,
  `V_model` varchar(10) DEFAULT NULL,
  `V_year` varchar(10) DEFAULT NULL,
  `V_color` varchar(10) DEFAULT NULL,
  `V_type` varchar(15) DEFAULT NULL,
  `Userid` int(11) DEFAULT NULL,
  `Dealer_id` int(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`V_id`),
  KEY `fk_uid2` (`Userid`),
  KEY `fk_dealer1` (`Dealer_id`),
  CONSTRAINT `fk_dealer1` FOREIGN KEY (`Dealer_id`) REFERENCES `dealer` (`Dealer_id`),
  CONSTRAINT `fk_uid2` FOREIGN KEY (`Userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('2132','abc','12/02/2014','red','4 Wheeler',25,4,'2018-04-21 04:39:40'),('7890','Lancer','2015','gold','3 Wheeler',1,1,'2015-11-09 05:16:42'),('a587468e','camry','2015','asd','4 Wheeler',12,1,'2015-11-10 01:28:25'),('ABCD1234','camry','2015','red','2 Wheeler',9,1,'2015-11-05 09:02:33'),('asd','vm','vy','vc','2 Wheeler',7,1,'2015-11-05 08:43:11'),('asd45674','honda','2014','black','2 Wheeler',13,1,'2015-11-10 01:29:10'),('CGD234','Corolla','2015','Beige','3 Wheeler',8,1,'2015-11-05 08:49:50'),('FFRR45','maruthi','2015','black','4 Wheeler',18,1,'2015-11-18 09:27:24');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-03 12:00:50
