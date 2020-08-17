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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (100),(100),(100),(100),(100),(100);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (33, '收音效果正常、音量不能调节', '2020-08-12 00:47:15', 'tecent128@qq.com', '1.3163E+11', 100, '德生100收音机', '电器类', '123_cyl', 32);
INSERT INTO `product` VALUES (34, '正常使用', '2020-08-12 00:47:47', 'tecent129@qq.com', '1.3163E+11', 120, '德生200', '电器类', '124_ymj', 32);
INSERT INTO `product` VALUES (35, '自动调台、适合家用', '2020-08-12 00:50:07', 'tecent130@qq.com', '1.3163E+11', 70, '名士台式收音机', '电器类', '125_aha', 32);
INSERT INTO `product` VALUES (36, '分体式音箱、自动调音', '2020-08-12 00:50:36', 'tecent131@qq.com', '1.3163E+11', 240, 'Sony台式', '电器类', '126_hjh', 32);
INSERT INTO `product` VALUES (38, '可正常使用', '2020-08-12 00:54:21', 'tecent132@qq.com', '1.3163E+11', 80, '德生100', '电器类', '127_hzt', 37);
INSERT INTO `product` VALUES (39, '50年代收音机、可正常使用', '2020-08-12 00:54:50', 'tecent123@qq.com', '1.3163E+11', 200, '古董收音机', '书籍类', '128_wyf', 37);
INSERT INTO `product` VALUES (40, '小型家用收音机、天线丢失', '2020-08-12 00:55:18', 'tecent124@qq.com', '1.3163E+11', 40, 'band小型收音机', '电器类', '129_yxqx', 37);
INSERT INTO `product` VALUES (41, '32寸液晶显示器', '2020-08-12 00:55:46', 'tecent125@qq.com', '1.3163E+11', 300, '创维液晶电视', '电器类', '130_czx', 37);
INSERT INTO `product` VALUES (42, '48寸可壁挂', '2020-08-12 00:56:20', 'tecent126@qq.com', '1.3163E+11', 800, 'LG液晶显示器', '电器类', '131_lm', 37);
INSERT INTO `product` VALUES (46, '可爱5寸小相框', '2020-08-12 01:02:57', 'tecent127@qq.com', '1.3163E+11', 10, '相框', '生活类', '132_tx', 45);
INSERT INTO `product` VALUES (47, '20寸实木相框', '2020-08-12 01:03:23', 'tecent128@qq.com', '1.3163E+11', 100, '相框', '生活类', '123_cyl', 45);
INSERT INTO `product` VALUES (48, '布艺5寸相框', '2020-08-12 01:03:43', 'tecent129@qq.com', '1.3163E+11', 5, '相框', '生活类', '124_ymj', 45);
INSERT INTO `product` VALUES (49, '普通18寸相框', '2020-08-12 01:04:10', 'tecent130@qq.com', '1.3163E+11', 40, '相框', '生活类', '125_aha', 45);
INSERT INTO `product` VALUES (50, '10寸、8寸、5寸各一个', '2020-08-12 01:04:27', 'tecent131@qq.com', '1.3163E+11', 70, '相框', '生活类', '126_hjh', 45);
INSERT INTO `product` VALUES (52, '考研英语词汇红宝书', '2020-08-12 01:06:04', 'tecent132@qq.com', '1.3163E+11', 10, '红宝书', '书籍类', '127_hzt', 51);
INSERT INTO `product` VALUES (53, '考研英语阅读理解', '2020-08-12 01:06:27', 'tecent123@qq.com', '1.3163E+11', 12, '英语阅读理解', '书籍类', '128_wyf', 51);
INSERT INTO `product` VALUES (54, '考研英语是词汇应用大全', '2020-08-12 01:06:51', 'tecent123@qq.com', '1.3163E+11', 6, '词汇随身记', '书籍类', '123_cyl', 51);
INSERT INTO `product` VALUES (55, '考研数学典型题大全', '2020-08-12 01:07:17', 'tecent124@qq.com', '1.3163E+11', 25, '考研数学', '书籍类', '124_ymj', 51);
INSERT INTO `product` VALUES (57, '高考语文复习考点精讲', '2020-08-12 01:08:15', 'tecent125@qq.com', '1.3163E+11', 10, '高考大一轮复习', '书籍类', '125_aha', 56);
INSERT INTO `product` VALUES (58, 'Crack行政法解题书', '2020-08-12 01:08:38', 'tecent126@qq.com', '1.3163E+11', 30, '高考行政法', '书籍类', '126_hjh', 56);
INSERT INTO `product` VALUES (59, '高考语文核按钮', '2020-08-12 01:09:00', 'tecent127@qq.com', '1.3163E+11', 15, '高考语文', '书籍类', '127_hzt', 56);
INSERT INTO `product` VALUES (60, 'Spark高考英语词汇突破', '2020-08-12 01:09:23', 'tecent128@qq.com', '1.3163E+11', 25, '高考英语', '书籍类', '128_wyf', 56);
INSERT INTO `product` VALUES (62, '复古小戒指，大小可调', '2020-08-12 01:10:32', 'tecent129@qq.com', '1.3163E+11', 30, '复古小戒指', '化妆类', '129_yxqx', 61);
INSERT INTO `product` VALUES (63, '99金小镯子', '2020-08-12 01:10:58', 'tecent130@qq.com', '1.3163E+11', 500, '金镯子', '化妆类', '130_czx', 61);
INSERT INTO `product` VALUES (64, '金镶玉手镯、大小不可调', '2020-08-12 01:11:33', 'tecent131@qq.com', '1.3163E+11', 1000, '玉镯子', '化妆类', '131_lm', 61);
INSERT INTO `product` VALUES (65, '蒂芙妮玫瑰金项链', '2020-08-12 01:11:55', 'tecent132@qq.com', '1.3163E+11', 2000, '玫瑰金项链', '化妆类', '132_tx', 61);
INSERT INTO `product` VALUES (67, '槐花树水墨画', '2020-08-12 01:13:04', 'tecent123@qq.com', '1.3163E+11', 500, '古画', '生活类', '123_cyl', 66);
INSERT INTO `product` VALUES (68, '宋代牧马牵狗图', '2020-08-12 01:13:38', 'tecent124@qq.com', '1.3163E+11', 1500, '牧马图', '生活类', '124_ymj', 66);
INSERT INTO `product` VALUES (69, '齐老画作', '2020-08-12 01:14:24', 'tecent125@qq.com', '1.3163E+11', 100000, '斗虾水墨', '生活类', '125_aha', 66);
INSERT INTO `product` VALUES (70, '远山近松水墨画', '2020-08-12 01:14:52', 'tecent126@qq.com', '1.3163E+11', 700, '山水图', '生活类', '126_hjh', 66);
INSERT INTO `product` VALUES (72, '伴娘头饰，九成新', '2020-08-12 01:16:02', 'tecent127@qq.com', '1.3163E+11', 80, '结婚头饰', '化妆类', '127_hzt', 71);
INSERT INTO `product` VALUES (73, '头饰、耳钉，九成新', '2020-08-12 01:16:34', 'tecent128@qq.com', '1.3163E+11', 500, '全套头饰', '生活类', '128_wyf', 71);
INSERT INTO `product` VALUES (74, '镶钻项链、大小可调', '2020-08-12 01:16:59', 'tecent129@qq.com', '1.3163E+11', 3000, '星钻项链', '生活类', '129_yxqx', 71);
INSERT INTO `product` VALUES (75, '塑料玩具头饰', '2020-08-12 01:17:33', 'tecent130@qq.com', '1.3163E+11', 60, '玩具头饰', '化妆类', '130_czx', 71);
INSERT INTO `product` VALUES (77, '18寸大小，无磕碰', '2020-08-12 01:18:53', 'tecent131@qq.com', '1.3163E+11', 700, '家用玉盘摆件', '书籍类', '131_lm', 76);
INSERT INTO `product` VALUES (78, '元代酒杯', '2020-08-12 01:19:23', 'tecent132@qq.com', '1.3163E+11', 300, '古董酒杯', '生活类', '132_tx', 76);
INSERT INTO `product` VALUES (79, '玉质古代熏炉，具体时间不详', '2020-08-12 01:20:05', 'tecent123@qq.com', '1.3163E+11', 7000, '熏炉', '生活类', '123_cyl', 76);
INSERT INTO `product` VALUES (80, '马到成功摆件、铜质', '2020-08-12 01:20:44', 'tecent124@qq.com', '1.3163E+11', 800, '马型摆件', '生活类', '124_ymj', 76);
INSERT INTO `product` VALUES (83, '民国玻璃红黄床头灯', '2020-08-12 01:26:21', 'nxczx1997@163.com', '123456', 1000, '民国灯盏', '生活类', '123', 81);
INSERT INTO `product` VALUES (84, '民国玻璃黄白灯盏', '2020-08-12 01:27:10', 'nxczx1997@163.com', '123456', 1200, '民国灯盏', '生活类', '123', 81);
INSERT INTO `product` VALUES (85, '铁质书桌灯', '2020-08-12 01:27:58', 'nxczx1997@163.com', '123456', 100, '70年代桌脚灯', '生活类', '123', 81);
INSERT INTO `product` VALUES (86, '民国珐琅雕像灯', '2020-08-12 01:28:59', 'nxczx1997@163.com', '123456', 3000, '民国珐琅灯', '生活类', '123', 81);
INSERT INTO `product` VALUES (87, '民国珐琅雕像灯', '2020-08-12 01:47:06', 'nxczx1997@163.com', '123456', 3000, '民国珐琅灯', '生活类', '123', 81);
INSERT INTO `product` VALUES (88, '民国珐琅雕像灯', '2020-08-12 01:49:26', 'nxczx1997@163.com', '123456', 3000, '民国珐琅灯', '生活类', '123', 81);
INSERT INTO `product` VALUES (89, '民国珐琅雕像灯', '2020-08-12 01:49:34', 'nxczx1997@163.com', '123456', 3000, '民国珐琅灯', '生活类', '123', 81);
INSERT INTO `product` VALUES (90, '民国珐琅雕像灯', '2020-08-12 01:49:50', 'nxczx1997@163.com', '123456', 3000, '民国珐琅灯', '生活类', '123', 81);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_imgs`
--

LOCK TABLES `product_imgs` WRITE;
/*!40000 ALTER TABLE `product_imgs` DISABLE KEYS */;
INSERT INTO `product_imgs` VALUES (33, 'productsImgs\\32\\德生100收音机\\11.jpg');
INSERT INTO `product_imgs` VALUES (34, 'productsImgs\\32\\德生200\\12.jpg');
INSERT INTO `product_imgs` VALUES (35, 'productsImgs\\32\\名士台式收音机\\13.jpg');
INSERT INTO `product_imgs` VALUES (36, 'productsImgs\\32\\Sony台式\\14.jpg');
INSERT INTO `product_imgs` VALUES (38, 'productsImgs\\37\\德生100\\21.jpg');
INSERT INTO `product_imgs` VALUES (39, 'productsImgs\\37\\古董收音机\\22.jpg');
INSERT INTO `product_imgs` VALUES (40, 'productsImgs\\37\\band小型收音机\\23.jpg');
INSERT INTO `product_imgs` VALUES (41, 'productsImgs\\37\\创维液晶电视\\24.jpg');
INSERT INTO `product_imgs` VALUES (42, 'productsImgs\\37\\LG液晶显示器\\25.jpg');
INSERT INTO `product_imgs` VALUES (46, 'productsImgs\\45\\相框\\31.jpg');
INSERT INTO `product_imgs` VALUES (47, 'productsImgs\\45\\相框\\32.jpg');
INSERT INTO `product_imgs` VALUES (48, 'productsImgs\\45\\相框\\33.jpg');
INSERT INTO `product_imgs` VALUES (49, 'productsImgs\\45\\相框\\34.jpg');
INSERT INTO `product_imgs` VALUES (50, 'productsImgs\\45\\相框\\35.jpg');
INSERT INTO `product_imgs` VALUES (52, 'productsImgs\\51\\红宝书\\41.jpg');
INSERT INTO `product_imgs` VALUES (53, 'productsImgs\\51\\英语阅读理解\\42.jpg');
INSERT INTO `product_imgs` VALUES (54, 'productsImgs\\51\\词汇随身记\\43.jpg');
INSERT INTO `product_imgs` VALUES (55, 'productsImgs\\51\\考研数学\\44.jpg');
INSERT INTO `product_imgs` VALUES (57, 'productsImgs\\56\\高考大一轮复习\\51.jpg');
INSERT INTO `product_imgs` VALUES (58, 'productsImgs\\56\\高考行政法\\52.jpg');
INSERT INTO `product_imgs` VALUES (59, 'productsImgs\\56\\高考语文\\53.jpg');
INSERT INTO `product_imgs` VALUES (60, 'productsImgs\\56\\高考英语\\54.jpg');
INSERT INTO `product_imgs` VALUES (62, 'productsImgs\\61\\复古小戒指\\61.jpg');
INSERT INTO `product_imgs` VALUES (63, 'productsImgs\\61\\金镯子\\62.jpg');
INSERT INTO `product_imgs` VALUES (64, 'productsImgs\\61\\玉镯子\\63.jpg');
INSERT INTO `product_imgs` VALUES (65, 'productsImgs\\61\\玫瑰金项链\\64.jpg');
INSERT INTO `product_imgs` VALUES (67, 'productsImgs\\66\\古画\\71.jpg');
INSERT INTO `product_imgs` VALUES (68, 'productsImgs\\66\\牧马图\\72.jpg');
INSERT INTO `product_imgs` VALUES (69, 'productsImgs\\66\\斗虾水墨\\73.jpg');
INSERT INTO `product_imgs` VALUES (70, 'productsImgs\\66\\山水图\\74.jpg');
INSERT INTO `product_imgs` VALUES (72, 'productsImgs\\71\\结婚头饰\\81.jpg');
INSERT INTO `product_imgs` VALUES (73, 'productsImgs\\71\\全套头饰\\82.jpg');
INSERT INTO `product_imgs` VALUES (74, 'productsImgs\\71\\星钻项链\\83.jpg');
INSERT INTO `product_imgs` VALUES (75, 'productsImgs\\71\\玩具头饰\\84.jpg');
INSERT INTO `product_imgs` VALUES (77, 'productsImgs\\76\\家用玉盘摆件\\91.jpg');
INSERT INTO `product_imgs` VALUES (78, 'productsImgs\\76\\古董酒杯\\92.jpg');
INSERT INTO `product_imgs` VALUES (79, 'productsImgs\\76\\熏炉\\93.jpg');
INSERT INTO `product_imgs` VALUES (80, 'productsImgs\\76\\马型摆件\\94.jpg');
INSERT INTO `product_imgs` VALUES (83, 'productsImgs\\81\\民国灯盏\\101.jpg');
INSERT INTO `product_imgs` VALUES (84, 'productsImgs\\81\\民国灯盏\\102.jpg');
INSERT INTO `product_imgs` VALUES (85, 'productsImgs\\81\\70年代桌脚灯\\103.jpg');
INSERT INTO `product_imgs` VALUES (86, 'productsImgs\\81\\民国珐琅灯\\104.jpg');
INSERT INTO `product_imgs` VALUES (87, 'productsImgs\\81\\民国珐琅灯\\104.jpg');
INSERT INTO `product_imgs` VALUES (88, 'productsImgs\\81\\民国珐琅灯\\104.jpg');
INSERT INTO `product_imgs` VALUES (89, 'productsImgs\\81\\民国珐琅灯\\104.jpg');
INSERT INTO `product_imgs` VALUES (90, 'productsImgs\\81\\民国珐琅灯\\104.jpg');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'ROLE_admin','admin','1','2020-08-14 09:28:37','超级管理员','father','2020-08-14 09:28:37'),(2,'ROLE_user','common','1','2020-08-14 09:28:37','普通用户',NULL,'2020-08-14 09:28:37');
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
  `lat` double(20, 7) NOT NULL,
  `lon` double(20, 7) NOT NULL,
  `shopname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (32, 'nxczx1997@163.com', '$2a$10$PXKejm7Os/9.gdnEZ4TLbOaHe7AfAJFFc0suonpGyv36fCQIv2JPC', '1.3163E+11', 'syjd', '123_cyl', '男', NULL, '2020-08-12 00:45:17', b'0', b'0', b'0', b'0', 31.2864000, 121.5030710, '收音机店');
INSERT INTO `sys_user` VALUES (37, 'nxczx1997@163.com', '$2a$10$tBBAyjPsk4tc6a4s2yQDCOOjFJA000b/t138bOd2SItWYvXPsJAJe', '1.3163E+11', 'dsj', '124_ymj', '男', NULL, '2020-08-12 00:53:33', b'0', b'0', b'0', b'0', 31.2855190, 121.5055270, '电视机');
INSERT INTO `sys_user` VALUES (45, 'nxczx1997@163.com', '$2a$10$xKMxfRsV9sxolUnZLiWeJuh.c1s8wv6zBHF.yqu3cCM1N6rXP/Hny', '1.3163E+11', 'gdxk', '125_aha', '男', NULL, '2020-08-12 01:00:12', b'0', b'0', b'0', b'0', 31.2853910, 121.5039290, '古代相框');
INSERT INTO `sys_user` VALUES (51, 'nxczx1997@163.com', '$2a$10$wwnbsx2NzMQG2xhDE7dT2.1Ah.7RGF4oK5LzlueYu9gBbYx1UGnvu', '1.3163E+11', 'kykt', '126_hjh', '女', NULL, '2020-08-12 01:05:29', b'0', b'0', b'0', b'0', 31.2847770, 121.5060320, '考研考托');
INSERT INTO `sys_user` VALUES (56, 'nxczx1997@163.com', '$2a$10$YBbGNTfKbKe1hOUVJuPd/OCUPBicHw91ttxsPuqPUBwzEa9IjLbmu', '1.3163E+11', 'gkbb', '127_hzt', '女', NULL, '2020-08-12 01:07:46', b'0', b'0', b'0', b'0', 31.2840800, 121.5067720, '高考必备');
INSERT INTO `sys_user` VALUES (61, 'nxczx1997@163.com', '$2a$10$SexXgwJQ6yYnpvz6ALF.auV2pP9ZljY4xuqHtG/KvcBj.9C88m7GS', '1.3163E+11', 'mnxt', '128_wyf', '女', NULL, '2020-08-12 01:09:52', b'0', b'0', b'0', b'0', 31.2832730, 121.5057960, '美女小摊');
INSERT INTO `sys_user` VALUES (66, 'nxczx1997@163.com', '$2a$10$2Zknldb9vbCyOT/402PaDeB3tH3CDSuERzM0X.73O0ptdg2TY2ooG', '1.3163E+11', 'gdmmdd', '129_yxqx', '女', NULL, '2020-08-12 01:12:17', b'0', b'0', b'0', b'0', 31.2819620, 121.5051310, '挂得满满当当');
INSERT INTO `sys_user` VALUES (71, 'nxczx1997@163.com', '$2a$10$BrmHodJF0hVVLyDPkhL3nO6qDrB5LO9sft5l5c/sf45aonOSZG..C', '1.3163E+11', 'zbhxs', '130_czx', '男', NULL, '2020-08-12 01:15:20', b'0', b'0', b'0', b'0', 31.2804670, 121.5047550, '珠宝黑心商');
INSERT INTO `sys_user` VALUES (76, 'nxczx1997@163.com', '$2a$10$CmRiR.fDNZeAFhc.tsDXbu/6Kwgz.rf8fiUqc1sXcvZb/og7kIepq', '1.3163E+11', 'ywxbj', '131_lm', '男', NULL, '2020-08-12 01:18:05', b'0', b'0', b'0', b'0', 31.2793300, 121.5006570, '义务小摆件');
INSERT INTO `sys_user` VALUES (81, 'nxczx1997@163.com', '$2a$10$g0m71CNAkDn2JbSic2grt.z2.qEVCvLktnQqS57j0.btbkTBY7ukq', '1.3163E+11', 'gldq', '132_tx', '男', NULL, '2020-08-12 01:21:11', b'0', b'0', b'0', b'0', 31.2834560, 121.4989510, '各类电器');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,1),(23,1),(31,30),(39,1), (32,2),(37,2),(45,2),(51,2),(56,2),(61,2),(66,2),(71,2),(76,2),(81,2);
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
