CREATE DATABASE  IF NOT EXISTS `db_second_hand_bbs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_second_hand_bbs`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_second_hand_bbs
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
-- Table structure for table `adminuser`
--

DROP TABLE IF EXISTS `adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminuser` (
  `id` bigint NOT NULL,
  `level` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminuser`
--

LOCK TABLES `adminuser` WRITE;
/*!40000 ALTER TABLE `adminuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announce`
--

DROP TABLE IF EXISTS `announce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announce` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `adminuser_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5j34dekeu7i9uskvauvlngbqf` (`adminuser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announce`
--

LOCK TABLES `announce` WRITE;
/*!40000 ALTER TABLE `announce` DISABLE KEYS */;
/*!40000 ALTER TABLE `announce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm1rmnfcvq5mk26li4lit88pc5` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (32),(32),(32),(32),(32),(32);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `content` longtext,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsugxsnh3pn3da0e47omlal622` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (87,'dsafsadf','2019-12-05 22:56:43','fserfe@grsfs','34234',334,'工具','化妆类','esdfasef',39),(88,'ccc','2019-12-09 10:05:44','504250439@qq.com','13138283670',343,'dsff','电器类','dfdfdff',84),(89,'dsfgsdfg','2019-12-09 10:06:59','504250439@qq.com','13138283670',200,'bvbv','衣物类','dfdfdff',84),(91,'dafgfsg','2019-12-09 10:20:17','504250439@qq.com','13138283670',0,'gggg','电器类','fff',39),(92,'dafgfsg','2019-12-09 10:20:38','504250439@qq.com','13138283670',0,'gggg','电器类','fff',39),(93,'rdsgrds','2019-12-09 10:21:19','504250439@qq.com','13138283670',0,'vcvc','衣物类','dfdfdff',39),(94,'rdsgrds','2019-12-09 10:24:41','504250439@qq.com','13138283670',0,'vcvc','衣物类','dfdfdff',84),(111,'dsfgsdfgsd','2019-12-09 21:10:23','934387764@qq.com','13138283670',4545,'dsfgds','书籍类','fgf',39),(110,'asdfsadf','2019-12-09 20:56:20','934387764@qq.com','13138283670',2345,'dfgd','电器类','fff',40),(122,'asdfsaf','2019-12-11 14:02:04','asdf@fff.ff','13138283670',1324,'dsafs','生活类','fffaa',39),(125,'非常新','2019-12-12 11:00:50','504250439@qq.com','13138283670',123,'鼠标','电器类','fff',39),(130,'adfgdg','2019-12-12 11:11:37','934387764@qq.com','13138283670',324,NULL,'生活类','sefseeasf',NULL),(14,'的说法',NULL,'','',123,'大师傅第三方','书籍类','',1),(15,'的说法',NULL,'','',123,'大师傅第三方','书籍类','',1),(16,'ef esfaesf aef','2020-07-29 13:58:42','','',2222,'asdf asdf asdffaf','书籍类','',1),(17,'rtyerye','2020-07-29 14:23:05','','',546,'ytjy','书籍类','',1),(18,'规范公司 ','2020-07-29 14:27:57','','',423,'打发','书籍类','',1),(19,'安抚啊啊','2020-07-29 14:30:06','','',123,'反反复复','书籍类','',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_imgs`
--

DROP TABLE IF EXISTS `product_imgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_imgs` (
  `product_id` bigint NOT NULL,
  `imgs` varchar(255) DEFAULT NULL,
  KEY `FKsmqh42bp8h7rj8hq70kwydijl` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_imgs`
--

LOCK TABLES `product_imgs` WRITE;
/*!40000 ALTER TABLE `product_imgs` DISABLE KEYS */;
INSERT INTO `product_imgs` VALUES (87,'1\\打发\\20200713082645142.jpg'),(88,'1\\打发\\20200713082645142.jpg'),(89,'1\\打发\\20200713082645142.jpg'),(91,'1\\打发\\20200713082645142.jpg'),(92,'1\\打发\\20200713082645142.jpg'),(93,'1\\打发\\20200713082645142.jpg'),(94,'1\\打发\\20200713082645142.jpg'),(111,'1\\打发\\20200713082645142.jpg'),(110,'1\\打发\\20200713082645142.jpg'),(122,'1\\打发\\20200713082645142.jpg'),(122,'1\\打发\\20200713082645142.jpg'),(125,'1\\打发\\20200713082645142.jpg'),(14,'1\\打发\\20200713082645142.jpg'),(15,'1\\打发\\20200713082645142.jpg'),(16,'1\\打发\\20200713082645142.jpg'),(17,'1\\打发\\20200713082645142.jpg'),(18,'1\\打发\\20200713082645142.jpg'),(19,'1\\打发\\20200713082645142.jpg');
/*!40000 ALTER TABLE `product_imgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` int NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  `role_key` varchar(45) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `create_by` varchar(45) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'ROLE_admin','admin','1','2020-07-28 14:12:17','系统最厉害的管理员','father','2020-07-28 14:12:17'),(2,'ROLE_user','common','1','2020-07-28 14:12:17','普通用户',NULL,'2020-07-28 14:12:17'),(11,'搜狗是s','森岛帆高',NULL,'2020-07-29 10:54:24','个搜狗是',NULL,NULL),(12,'ssss','ffff',NULL,NULL,'个搜狗是f',NULL,'2020-07-29 11:24:58'),(13,'gggggggg','gggggggg',NULL,NULL,'个搜狗是',NULL,'2020-07-29 11:25:57');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `account_non_expired` bit(1) NOT NULL,
  `account_non_locked` bit(1) NOT NULL,
  `credentials_non_expired` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'504250439@qq.com','father','13138283670','father','dsfa',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(3,'504250439@qq.com','asdfadsf','13138283670','adfadf','dsfa',NULL,NULL,'2020-07-28 16:36:01',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(40,NULL,'test',NULL,'test',NULL,NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(39,NULL,'amy',NULL,'amy',NULL,NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(42,NULL,'test2',NULL,'test2',NULL,NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(83,NULL,'etstsetes',NULL,'testetst2',NULL,NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(84,'504250439@qq.com','testse','13138283670','tests','sefseeasf',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(109,'asdf@fff.ff','yes','45252','yes','fdgfgdsfg',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(120,'934387764@qq.com','safesaef','13138283670','estt','sdaf',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(126,'934387764@qq.com','father','13138283670','fatherfdsgg','esdfasef',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(2,'504250439@qq.com','dfasdf','13138283670','adsfasd','dsfa',NULL,NULL,'2020-07-28 14:12:17',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(23,NULL,'dsaf',NULL,'test1',NULL,NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(27,NULL,'dsaf',NULL,'test1',NULL,NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(29,NULL,'dsaf',NULL,'test1',NULL,NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(31,NULL,'dsaf',NULL,'test1',NULL,NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKhh52n8vd4ny9ff4x9fb8v65qx` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,1),(23,1),(31,30),(39,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-30 17:57:37
