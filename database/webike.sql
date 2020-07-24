CREATE DATABASE  IF NOT EXISTS `webike` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webike`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: webike
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_motorbike_invoice`
--

DROP TABLE IF EXISTS `tbl_motorbike_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_motorbike_invoice` (
  `motorbike_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  PRIMARY KEY (`invoice_id`,`motorbike_id`),
  KEY `1 bike - N invoice_idx` (`motorbike_id`),
  CONSTRAINT `1 bike - N invoice` FOREIGN KEY (`motorbike_id`) REFERENCES `tblmotorbike` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `1 invoice - N bike` FOREIGN KEY (`invoice_id`) REFERENCES `tblinvoice` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_motorbike_invoice`
--

LOCK TABLES `tbl_motorbike_invoice` WRITE;
/*!40000 ALTER TABLE `tbl_motorbike_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_motorbike_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_role`
--

DROP TABLE IF EXISTS `tbl_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_role` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `1 user - N role_idx` (`user_id`),
  CONSTRAINT `1 role - N user` FOREIGN KEY (`role_id`) REFERENCES `tblrole` (`id`),
  CONSTRAINT `1 user - N role` FOREIGN KEY (`user_id`) REFERENCES `tbluser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_role`
--

LOCK TABLES `tbl_user_role` WRITE;
/*!40000 ALTER TABLE `tbl_user_role` DISABLE KEYS */;
INSERT INTO `tbl_user_role` VALUES (1,1),(2,1),(1,28),(2,28),(2,32),(2,33),(2,34),(2,35);
/*!40000 ALTER TABLE `tbl_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblattachment`
--

DROP TABLE IF EXISTS `tblattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblattachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updator_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `motorbike_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `thumbnail` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK - 1 motorbike - N attachments_idx` (`motorbike_id`),
  CONSTRAINT `FK - 1 motorbike - N attachments` FOREIGN KEY (`motorbike_id`) REFERENCES `tblmotorbike` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Lưu thông tin ảnh, video, nhạc,...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblattachment`
--

LOCK TABLES `tblattachment` WRITE;
/*!40000 ALTER TABLE `tblattachment` DISABLE KEYS */;
INSERT INTO `tblattachment` VALUES (25,'arijit.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/arijit.jpg','2020-05-30 22:43:55',1,NULL,NULL,1,NULL,28,NULL),(32,'H2.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/H2.jpg','2020-06-11 09:12:03',1,NULL,NULL,1,1,NULL,NULL),(33,'KTM-Duke-390.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/KTM-Duke-390.jpg','2020-06-11 09:13:26',1,NULL,NULL,1,2,NULL,NULL),(34,'Suzuki-GSX-S1000.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/Suzuki-GSX-S1000.jpg','2020-06-11 09:14:03',1,NULL,NULL,1,3,NULL,NULL),(35,'PanigaleV4S.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/PanigaleV4S.jpg','2020-06-11 09:14:14',1,NULL,NULL,1,4,NULL,NULL),(36,'G310_GS.png','image/png','D:/Java Web 2/java08blog/upload/G310_GS.png','2020-06-11 09:14:25',1,NULL,NULL,1,5,NULL,NULL),(37,'Triumph_StreetTripleRS.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/Triumph_StreetTripleRS.jpg','2020-06-11 09:15:10',1,NULL,NULL,1,8,NULL,NULL),(38,'Sample.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/Sample.jpg','2020-06-12 22:18:08',1,NULL,NULL,1,NULL,32,NULL),(39,'Huy.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/Huy.jpg','2020-06-13 08:41:08',NULL,NULL,NULL,1,NULL,33,NULL),(40,'CBR_1000RR.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/CBR_1000RR.jpg','2020-06-13 09:51:34',1,NULL,NULL,1,21,NULL,1),(41,'MT09.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/MT09.jpg','2020-06-13 09:55:52',1,NULL,NULL,1,22,NULL,1),(42,'BMW_S1000RR_2020.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/BMW_S1000RR_2020.jpg','2020-06-13 10:02:47',1,NULL,NULL,1,23,NULL,1),(43,'Ẓ900.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/Ẓ900.jpg','2020-06-13 10:07:11',1,NULL,NULL,1,24,NULL,1),(44,'ZX_10R.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/ZX_10R.jpg','2020-06-13 10:13:06',1,NULL,NULL,1,25,NULL,1),(45,'Scrambler_1100.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/Scrambler_1100.jpg','2020-06-13 10:17:55',1,NULL,NULL,1,26,NULL,1),(46,'Panigale959.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/Panigale959.jpg','2020-06-13 10:27:57',1,NULL,NULL,1,27,NULL,1),(47,'YZF_R1.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/YZF_R1.jpg','2020-06-13 10:49:06',1,NULL,NULL,1,28,NULL,1),(48,'Aprilia_RSV4.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/Aprilia_RSV4.jpg','2020-06-13 14:18:45',1,NULL,NULL,1,29,NULL,1),(49,'CBR250.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/CBR250.jpg','2020-06-13 14:24:21',1,NULL,NULL,1,30,NULL,1),(50,'Z1000.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/Z1000.jpg','2020-06-13 14:44:06',1,NULL,NULL,1,31,NULL,1),(51,'R6.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/R6.jpg','2020-06-13 14:55:46',1,NULL,NULL,1,32,NULL,1),(55,'register.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/register.jpg','2020-06-13 17:13:30',NULL,NULL,NULL,1,NULL,34,NULL),(56,'register.jpg','image/jpeg','D:/Java Web 2/java08blog/upload/register.jpg','2020-06-14 15:16:22',NULL,NULL,NULL,1,NULL,35,NULL);
/*!40000 ALTER TABLE `tblattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcategory`
--

DROP TABLE IF EXISTS `tblcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime NOT NULL,
  `creator_id` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updator_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Danh mục xe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcategory`
--

LOCK TABLES `tblcategory` WRITE;
/*!40000 ALTER TABLE `tblcategory` DISABLE KEYS */;
INSERT INTO `tblcategory` VALUES (1,'Sport-bike','2020-05-11 04:12:00',NULL,NULL,NULL,1),(2,'Naked-bike','2020-05-11 04:12:00',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tblcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcomment`
--

DROP TABLE IF EXISTS `tblcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcomment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime NOT NULL,
  `creator_id` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updator_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `motorbike_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK - 1 motorbike - N comments_idx` (`motorbike_id`),
  CONSTRAINT `1 user - N comment` FOREIGN KEY (`id`) REFERENCES `tbluser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Danh sách bình luận của khách hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcomment`
--

LOCK TABLES `tblcomment` WRITE;
/*!40000 ALTER TABLE `tblcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoice`
--

DROP TABLE IF EXISTS `tblinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblinvoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `plan_date` datetime NOT NULL,
  `location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_date` datetime NOT NULL,
  `creator_id` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updator_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `customer_id` int DEFAULT NULL,
  `motorbike_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK - 1 motorbike - N invoice_idx` (`motorbike_id`),
  CONSTRAINT `FK - 1 motorbike - N invoice` FOREIGN KEY (`motorbike_id`) REFERENCES `tblmotorbike` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Đơn đăng ký mua xe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinvoice`
--

LOCK TABLES `tblinvoice` WRITE;
/*!40000 ALTER TABLE `tblinvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmotorbike`
--

DROP TABLE IF EXISTS `tblmotorbike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmotorbike` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `brand` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  `registration_tax` decimal(13,2) DEFAULT NULL,
  `license_fee` decimal(13,2) DEFAULT NULL,
  `civil_insurance` decimal(13,2) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `creator_id` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updator_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK - 1 category - N motorbikes_idx` (`category_id`),
  CONSTRAINT `FK - 1 category - N motorbikes` FOREIGN KEY (`category_id`) REFERENCES `tblcategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Dữ liệu chung của xe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmotorbike`
--

LOCK TABLES `tblmotorbike` WRITE;
/*!40000 ALTER TABLE `tblmotorbike` DISABLE KEYS */;
INSERT INTO `tblmotorbike` VALUES (1,'Ninja H2','Kawasaki',990000000.00,49500000.00,4000000.00,66000.00,1,'2020-04-02 22:30:00',NULL,'2020-06-11 09:11:47',1,1),(2,'Duke 390','KTM',169900000.00,8495000.00,4000000.00,66000.00,2,'2020-04-02 22:30:00',NULL,'2020-06-11 09:13:26',1,1),(3,'GSX S1000','Suzuki',399000000.00,19950000.00,4000000.00,66000.00,2,'2020-04-02 22:30:00',NULL,'2020-06-11 09:14:03',1,1),(4,'Panigale V4S','Ducati',936900000.00,46845000.00,4000000.00,66000.00,1,'2020-05-13 20:25:13',NULL,'2020-06-11 09:14:14',1,1),(5,'G310 GS','BMW',219000000.00,10950000.00,4000000.00,66000.00,2,'2020-05-13 20:33:31',NULL,'2020-06-11 09:14:25',1,1),(8,'Street Triple RS','Triumph',430000000.00,21500000.00,4000000.00,66000.00,2,'2020-05-13 20:40:08',NULL,'2020-06-11 09:15:10',1,1),(21,'CBR 1000RR','Honda',560000000.00,28000000.00,4000000.00,66000.00,1,'2020-06-13 09:51:34',1,NULL,NULL,1),(22,'MT-09','Yamaha',299000000.00,14950000.00,4000000.00,66000.00,2,'2020-06-13 09:55:52',1,NULL,NULL,1),(23,'S1000RR 2020','BMW',949000000.00,47450000.00,4000000.00,66000.00,1,'2020-06-13 10:02:47',1,NULL,NULL,1),(24,'Z900','Kawasaki',288000000.00,14400000.00,4000000.00,66000.00,2,'2020-06-13 10:07:11',1,NULL,NULL,1),(25,'Ninja ZX-10R','Kawasaki',571000000.00,28550000.00,4000000.00,66000.00,1,'2020-06-13 10:13:06',1,NULL,NULL,1),(26,'Scrambler 1100','Ducati',447900000.00,22395000.00,4000000.00,66000.00,2,'2020-06-13 10:17:55',1,NULL,NULL,1),(27,'Panigale 959','Ducati',592000000.00,29600000.00,4000000.00,66000.00,1,'2020-06-13 10:27:57',1,NULL,NULL,1),(28,'YZF-R1','Yamaha',640000000.00,32000000.00,4000000.00,66000.00,1,'2020-06-13 10:49:06',1,NULL,NULL,1),(29,'RSV4','Aprilia',894000000.00,44700000.00,4000000.00,66000.00,1,'2020-06-13 14:18:45',1,NULL,NULL,1),(30,'CBR250','Honda',160000000.00,8000000.00,4000000.00,66000.00,1,'2020-06-13 14:24:21',1,NULL,NULL,1),(31,'Z1000','Kawasaki',412000000.00,20600000.00,4000000.00,66000.00,2,'2020-06-13 14:44:06',1,NULL,NULL,1),(32,'YZF-R6','Yamaha',283000000.00,14150000.00,4000000.00,66000.00,1,'2020-06-13 14:55:46',1,NULL,NULL,1);
/*!40000 ALTER TABLE `tblmotorbike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrole`
--

DROP TABLE IF EXISTS `tblrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblrole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updator_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Quyền người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrole`
--

LOCK TABLES `tblrole` WRITE;
/*!40000 ALTER TABLE `tblrole` DISABLE KEYS */;
INSERT INTO `tblrole` VALUES (1,'ADMIN','2020-05-30 22:43:55',1,NULL,NULL,1),(2,'USER','2020-05-30 22:43:55',1,NULL,NULL,1);
/*!40000 ALTER TABLE `tblrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblspecifications`
--

DROP TABLE IF EXISTS `tblspecifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblspecifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `length` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `fuel_tank_capacity` float DEFAULT NULL,
  `wet_weight` float DEFAULT NULL,
  `displacement` float DEFAULT NULL,
  `horse_power` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `torque` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cylinders` int DEFAULT NULL,
  `gears` int DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `creator_id` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updator_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `motorbike_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK - 1 motorbike - 1 specifications_idx` (`motorbike_id`),
  CONSTRAINT `FK - 1 motorbike - 1 specifications` FOREIGN KEY (`motorbike_id`) REFERENCES `tblmotorbike` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Thông số kỹ thuật của xe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblspecifications`
--

LOCK TABLES `tblspecifications` WRITE;
/*!40000 ALTER TABLE `tblspecifications` DISABLE KEYS */;
INSERT INTO `tblspecifications` VALUES (1,2085,770,1125,17,238,998,'231 HP @ 11500 rpm','141.7 Nm @ 11000 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,1),(2,2002,838,1274,13.5,172.6,373.2,'43.5 HP @ 9000 rpm','37 NM @ 7000 rpm',1,6,'2020-03-25 14:12:00',1,NULL,NULL,1,2),(3,2115,795,1080,17,209,999,'144 HP @ 10000 rpm','105.75 NM @ 9500 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,3),(4,2056,810,1115,16,195,1103,'214 HP @ 13000 rpm','124 NM @ 10000 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,4),(5,2075,880,1230,11,169.5,313,'33.6 BHP @ 9500 rpm','28 NM @ 7500 rpm',1,6,'2020-03-25 14:12:00',1,NULL,NULL,1,5),(6,2015,775,1085,17.4,186,765,'123 PS @ 11750 rpm','79 Nm @ 9350 rpm',3,6,'2020-03-25 14:12:00',1,NULL,NULL,1,8),(7,2065,720,1125,16.2,196,999,'189 HP @ 13000 rpm','114 Nm @ 11000 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,21),(8,2075,815,1120,14,193,847,'115 HP @ 10000 rpm','87.5 Nm @ 8500 rpm',3,6,'2020-03-25 14:12:00',1,NULL,NULL,1,22),(9,2073,848,1151,16.5,197,999,'207 HP @ 13500 rpm','113 Nm @ 11000 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,23),(10,2065,825,1065,17,210,948,'125 PS @ 9500 rpm','98.6 NM @ 7700 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,24),(11,2085,740,1145,17,206,998,'203 HP @ 13500 rpm','114.9 Nm @ 11200 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,25),(12,2190,895,1330,15,206,1079,'86 HP @ 7500 rpm','88 Nm @ 4750 rpm',2,6,'2020-03-25 14:12:00',1,NULL,NULL,1,26),(13,2056,810,1115,17,197.5,955,'150 HP @ 10,500 rpm','102 NM @ 9,000 rpm',2,6,'2020-03-25 14:12:00',1,NULL,NULL,1,27),(14,2055,690,1150,17,199,998,'200 HP @ 13,500 rpm','112.4 Nm @ 11,500 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,28),(15,2040,735,1120,18.5,179,999.6,'181.4 Bhp @ 12500 rpm','117 Nm @ 10000 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,29),(16,2060,724,1098,14.5,168,249.7,'38.7 HP @ 12,500 rpm','23.3 NM @ 11,000 rpm',2,6,'2020-03-25 14:12:00',1,NULL,NULL,1,30),(17,2045,790,1055,17,221,1043,'142 HP @ 10000 rpm','111 Nm @ 7300 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,31),(18,2040,695,1150,17,190,599,'118.4 HP @ 14,500 rpm','61.7 Nm @ 10500 rpm',4,6,'2020-03-25 14:12:00',1,NULL,NULL,1,32);
/*!40000 ALTER TABLE `tblspecifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbluser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updator_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Thông tin người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
INSERT INTO `tbluser` VALUES (1,'admin1','admin1','2020-05-30 22:43:55',1,NULL,NULL,1,'admin1@gmail.com','Hà Nội','12345'),(28,'admin2','admin2','2020-05-30 22:43:55',1,NULL,NULL,1,'admin2@gmail.com','Hải Dương','542424'),(32,'user','user','2020-06-12 22:18:08',1,NULL,NULL,1,'user@gmail.com','Hà Nội','0962432732'),(33,'huy','huy',NULL,NULL,NULL,NULL,1,'huy@gmail.com','Hà Nội','0962866198'),(34,'example','12345',NULL,NULL,NULL,NULL,1,'huypodolski10@gmail.com','gfasdfgfas','5435'),(35,'huy123','123',NULL,NULL,NULL,NULL,1,'huypodolski10@gmail.com','rưẻ','52542');
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'webike'
--

--
-- Dumping routines for database 'webike'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-24 15:16:02
