-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: secondhand
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` int NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `identity` int DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'czx',123456,'13162394718',NULL,'alvinchen'),(2,'ymj',654321,'13162394719',NULL,'2333'),(3,'cyl',123654,'13162394720',NULL,'winnie');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL,
  `comment` varchar(2000) NOT NULL,
  `clientid` int NOT NULL,
  `merchantid` int NOT NULL,
  `time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `评论所属客户` (`clientid`),
  KEY `评论所属摊贩` (`merchantid`),
  CONSTRAINT `评论所属客户` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`),
  CONSTRAINT `评论所属摊贩` FOREIGN KEY (`merchantid`) REFERENCES `merchantuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'东西还不错',1,1,'2020-08-13 16:51:10.000000');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `good` (
  `id` int NOT NULL,
  `sid` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `商品所属摊位` (`sid`),
  CONSTRAINT `商品所属摊位` FOREIGN KEY (`sid`) REFERENCES `shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (11,1,'德生100收音机',100.00,'收音效果正常、音量不能调节'),(12,1,'德生200',120.00,'正常使用'),(13,1,'名士台式收音机',70.00,'自动调台、适合家用'),(14,1,'Sony台式',240.00,'分体式音箱、自动调音'),(21,2,'德生100',80.00,'可正常使用'),(22,2,'古董收音机',200.00,'50年代收音机、可正常使用'),(23,2,'band小型收音机',40.00,'小型家用收音机、天线丢失'),(24,2,'创维液晶电视',300.00,'32寸液晶显示器'),(25,2,'LG液晶显示器',800.00,'48寸可壁挂'),(31,3,'相框',10.00,'可爱5寸小相框'),(32,3,'相框',100.00,'20寸实木相框'),(33,3,'相框',5.00,'布艺5寸相框'),(34,3,'相框',40.00,'普通18寸相框'),(35,3,'相框组合',70.00,'10寸、8寸、5寸各一个'),(41,4,'红宝书',10.00,'考研英语词汇红宝书'),(42,4,'英语阅读理解',12.00,'考研英语阅读理解'),(43,4,'词汇随身记',6.00,'考研英语是词汇应用大全'),(44,4,'考研数学',25.00,'考研数学典型题大全'),(51,5,'高考大一轮复习',10.00,'高考语文复习考点精讲'),(52,5,'高考行政法',30.00,'Crack行政法解题书'),(53,5,'高考语文',15.00,'高考语文核按钮'),(54,5,'高考英语',25.00,'Spark高考英语词汇突破'),(61,6,'复古小戒指',30.00,'复古小戒指，大小可调'),(62,6,'金镯子',500.00,'99金小镯子'),(63,6,'玉镯子',1000.00,'金镶玉手镯、大小不可调'),(64,6,'玫瑰金项链',2000.00,'蒂芙妮玫瑰金项链'),(71,7,'古画',500.00,'槐花树水墨画'),(72,7,'牧马图',1500.00,'宋代牧马牵狗图'),(73,7,'斗虾水墨',100000.00,'齐老画作'),(74,7,'山水图',700.00,'远山近松水墨画'),(81,8,'结婚头饰',80.00,'伴娘头饰'),(82,8,'全套头饰',500.00,'头饰、耳钉'),(83,8,'星钻项链',3000.00,'镶钻项链、大小可调'),(84,8,'玩具头饰',60.00,'塑料玩具头饰'),(91,9,'家用玉盘摆件',700.00,NULL),(92,9,'古董酒杯',300.00,'元代酒杯'),(93,9,'熏炉',7000.00,'玉质古代熏炉'),(94,9,'马型摆件',800.00,'马到成功摆件、铜质'),(101,10,'民国灯盏 ',1000.00,'民国玻璃红黄床头灯'),(102,10,'民国灯盏',1200.00,'民国玻璃黄白灯盏'),(103,10,'70年代桌脚灯',100.00,'铁质书桌灯'),(104,10,'民国珐琅灯',3000.00,'民国发廊雕像灯'),(111,11,'京剧鼻烟壶',200.00,NULL),(112,11,'盘龙鼻烟壶',400.00,NULL),(113,11,'玉质鼻烟壶',800.00,NULL),(114,11,'白玉鼻烟壶',1000.00,NULL),(121,12,'20寸椭圆镜',150.00,'浮雕椭圆镜'),(122,12,'古董镜',2000.00,'古董镜、镜面已破碎'),(123,12,'雕花方镜',1200.00,'雕花24寸方镜'),(124,12,'普通椭圆镜',300.00,'普通30寸椭圆镜'),(131,13,'咸丰铜币',30.00,NULL),(132,13,'唐铜币',40.00,'龙凤图案'),(133,13,'清铜币',25.00,NULL),(134,13,'周钱币',50.00,NULL),(141,14,'清朝画作',1000.00,NULL),(142,14,'宋朝画作',2000.00,NULL),(143,14,'元代画作',2000.00,NULL),(151,15,'白夜行',20.00,NULL),(152,15,'简爱',23.00,NULL),(153,15,'芒果街上的小屋',23.00,NULL),(154,15,'活着',10.00,NULL),(155,15,'羊脂球',15.00,NULL),(156,15,'JAVA编程思想',50.00,NULL),(157,15,'恶意',33.00,NULL),(158,15,'Spring实战',55.00,NULL);
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodimage`
--

DROP TABLE IF EXISTS `goodimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodimage` (
  `id` int NOT NULL,
  `gid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `商品所属摊位` (`gid`),
  CONSTRAINT `商品照片` FOREIGN KEY (`gid`) REFERENCES `good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodimage`
--

LOCK TABLES `goodimage` WRITE;
/*!40000 ALTER TABLE `goodimage` DISABLE KEYS */;
INSERT INTO `goodimage` VALUES (11,11),(12,12),(13,13),(14,14),(21,21),(22,22),(23,23),(24,24),(25,25),(31,31),(32,32),(33,33),(34,34),(35,35),(41,41),(42,42),(43,43),(44,44),(51,51),(52,52),(53,53),(54,54),(61,61),(62,62),(63,63),(64,64),(71,71),(72,72),(73,73),(74,74),(81,81),(82,82),(83,83),(84,84),(91,91),(92,92),(93,93),(94,94),(101,101),(102,102),(103,103),(104,104),(111,111),(112,112),(113,113),(114,114),(121,121),(122,122),(123,123),(124,124),(131,131),(132,132),(133,133),(134,134),(141,141),(142,142),(143,143),(151,151),(152,152),(153,153),(154,154),(155,155),(156,156),(157,157),(158,158);
/*!40000 ALTER TABLE `goodimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuser`
--

DROP TABLE IF EXISTS `merchantuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuser` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` int NOT NULL,
  `telephone` int DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuser`
--

LOCK TABLES `merchantuser` WRITE;
/*!40000 ALTER TABLE `merchantuser` DISABLE KEYS */;
INSERT INTO `merchantuser` VALUES (1,'czx',970130,0,'czx'),(2,'ymj',123456,NULL,'ymj'),(3,'cyl',234567,NULL,'cyl'),(4,'刘德华',241215,NULL,'德华'),(5,'张国荣',253144,NULL,'哥哥'),(6,'张学友',489712,NULL,'食屎啦'),(7,'黎明',214543,NULL,'甜蜜蜜'),(8,'陈奕迅',259099,NULL,'头发呢？'),(9,'胡歌',908091,NULL,'依旧帅'),(10,'罗志祥',666666,NULL,'身体棒！'),(11,'王菲',109090,NULL,'我也太红了'),(12,'松柏',897912,NULL,'听闻余生'),(13,'毛不易',123555,NULL,'谁给我消愁'),(14,'邓紫棋',905556,NULL,'光年之外'),(15,'陈鸿宇',589432,NULL,'浓烟下的电台');
/*!40000 ALTER TABLE `merchantuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefercommodity`
--

DROP TABLE IF EXISTS `prefercommodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prefercommodity` (
  `id` int NOT NULL,
  `clientid` int NOT NULL,
  `shopid` int NOT NULL,
  `goodid` int NOT NULL,
  `merchantid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `收藏商品所属用户` (`clientid`),
  KEY `收藏商品喜爱摊位` (`shopid`),
  KEY `收藏商品喜爱商品` (`goodid`),
  KEY `收藏商品所属商人` (`merchantid`),
  CONSTRAINT `收藏商品喜爱商品` FOREIGN KEY (`goodid`) REFERENCES `good` (`id`),
  CONSTRAINT `收藏商品喜爱摊位` FOREIGN KEY (`shopid`) REFERENCES `shop` (`id`),
  CONSTRAINT `收藏商品所属商人` FOREIGN KEY (`merchantid`) REFERENCES `merchantuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `收藏商品所属用户` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefercommodity`
--

LOCK TABLES `prefercommodity` WRITE;
/*!40000 ALTER TABLE `prefercommodity` DISABLE KEYS */;
INSERT INTO `prefercommodity` VALUES (1,2,3,31,3),(2,3,3,32,1),(3,1,5,51,5);
/*!40000 ALTER TABLE `prefercommodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefermerchant`
--

DROP TABLE IF EXISTS `prefermerchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prefermerchant` (
  `id` int NOT NULL,
  `merchantid` int NOT NULL,
  `clientid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `喜爱商人所属商人` (`merchantid`),
  KEY `喜爱商人所属用户` (`clientid`),
  CONSTRAINT `喜爱商人所属商人` FOREIGN KEY (`merchantid`) REFERENCES `merchantuser` (`id`),
  CONSTRAINT `喜爱商人所属用户` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefermerchant`
--

LOCK TABLES `prefermerchant` WRITE;
/*!40000 ALTER TABLE `prefermerchant` DISABLE KEYS */;
INSERT INTO `prefermerchant` VALUES (1,1,1),(2,2,2),(3,3,3),(4,1,3),(5,6,2),(6,8,3);
/*!40000 ALTER TABLE `prefermerchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefershop`
--

DROP TABLE IF EXISTS `prefershop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prefershop` (
  `id` int NOT NULL,
  `clientid` int NOT NULL,
  `shopid` int NOT NULL,
  `merchantid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `喜爱摊位所属摊位` (`shopid`),
  KEY `喜爱摊位所属用户` (`clientid`),
  KEY `喜爱摊位所属商人` (`merchantid`),
  CONSTRAINT `喜爱摊位所属商人` FOREIGN KEY (`merchantid`) REFERENCES `merchantuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `喜爱摊位所属摊位` FOREIGN KEY (`shopid`) REFERENCES `shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `喜爱摊位所属用户` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefershop`
--

LOCK TABLES `prefershop` WRITE;
/*!40000 ALTER TABLE `prefershop` DISABLE KEYS */;
INSERT INTO `prefershop` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,1,3,3);
/*!40000 ALTER TABLE `prefershop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `lon` double(255,20) DEFAULT NULL,
  `lat` double(255,20) DEFAULT NULL,
  `Opentime` varchar(20) DEFAULT NULL,
  `Endtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `摊位所属摊贩` (`uid`),
  CONSTRAINT `摊位所属摊贩` FOREIGN KEY (`uid`) REFERENCES `merchantuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,1,'收音机店',120.00013000000000000000,31.20304000000000000000,'十月四日','十月五日'),(2,2,'电视机',120.00014000000000000000,31.20314000000000000000,NULL,NULL),(3,3,'古代相框',120.00015000000000000000,31.20324000000000000000,NULL,NULL),(4,4,'考研考托',120.00016000000000000000,31.20334000000000000000,NULL,NULL),(5,5,'高考必备',120.00017000000000000000,31.20344000000000000000,NULL,NULL),(6,6,'美女小摊',120.00018000000000000000,31.20354000000000000000,NULL,NULL),(7,7,'挂得满满当当',120.00019000000000000000,31.20364000000000000000,NULL,NULL),(8,8,'珠宝黑心商',120.00020000000000000000,31.20374000000000000000,NULL,NULL),(9,9,'义务小摆件',120.00021000000000000000,31.20384000000000000000,NULL,NULL),(10,10,'各类电器',120.00022000000000000000,31.20394000000000000000,NULL,NULL),(11,11,'各类烟壶',120.00023000000000000000,31.20404000000000000000,NULL,NULL),(12,12,'镜子镜子',120.00024000000000000000,31.20414000000000000000,NULL,NULL),(13,13,'古钱币',120.00025000000000000000,31.20424000000000000000,NULL,NULL),(14,14,'古画名作',120.00026000000000000000,31.20434000000000000000,NULL,NULL),(15,15,'二手书',120.00027000000000000000,31.20444000000000000000,NULL,NULL);
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopimage`
--

DROP TABLE IF EXISTS `shopimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopimage` (
  `id` int NOT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `商店照片` (`sid`),
  CONSTRAINT `商店照片` FOREIGN KEY (`sid`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopimage`
--

LOCK TABLES `shopimage` WRITE;
/*!40000 ALTER TABLE `shopimage` DISABLE KEYS */;
INSERT INTO `shopimage` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15);
/*!40000 ALTER TABLE `shopimage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-03 17:18:29
