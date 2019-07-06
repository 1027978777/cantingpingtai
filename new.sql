-- MySQL dump 10.13  Distrib 5.5.62, for Win32 (AMD64)
--
-- Host: localhost    Database: cantingpingtai
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `cai`
--

DROP TABLE IF EXISTS `cai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cai` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `image` varchar(30) DEFAULT NULL COMMENT '图片',
  `name` varchar(20) DEFAULT NULL COMMENT '菜名',
  `price` double DEFAULT NULL COMMENT '单价',
  `content` varchar(1000) DEFAULT NULL COMMENT '菜品介绍',
  `careatetime` datetime DEFAULT NULL COMMENT '添加时间',
  `bid` int(11) DEFAULT NULL COMMENT '商家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cai`
--

LOCK TABLES `cai` WRITE;
/*!40000 ALTER TABLE `cai` DISABLE KEYS */;
INSERT INTO `cai` VALUES (1,'/static/file/1560343924192.jpg','烤鸭',30,'烤鸭好吃','2019-05-20 00:00:00',1),(2,'/static/file/1560317363960.png','牛肉串',5,'牛肉串好吃','2019-05-20 00:00:00',1),(3,'/static/file/1560317436145.png','羊肉串',8,'羊肉串好吃','2019-06-05 11:01:27',1),(5,'/static/file/1560318068638.png','鸡腿堡',20,'好吃','2019-05-20 00:00:00',5),(6,'/static/file/1560318113771.png','牛肉汉堡',30,'好吃','2019-05-20 00:00:00',5),(7,'/static/file/1560318164166.png','蟹黄汉堡',40,'好吃','2019-05-20 00:00:00',5),(8,'/static/file/1560317488690.png','烤火腿',2,'烤火腿好吃','2019-06-06 14:58:56',1),(9,'/static/file/1560317557957.png','番茄炒鸡蛋',5,'好吃','2019-06-07 12:18:59',2),(10,'/static/file/1560317701115.png','麻婆豆腐',10,'好吃','2019-06-07 12:19:29',2),(11,'/static/file/1560317786549.png','毛血旺',6,'毛血旺好吃','2019-05-21 08:32:56',2),(12,'/static/file/1560317974528.png','鱼香肉丝',8,'好吃','2019-06-12 13:39:50',2),(13,'/static/file/1560318291408.png','水果蛋糕',189,'好吃','2019-06-12 13:46:21',6),(14,'/static/file/1560318432656.png','维也纳巧克力蛋糕',398,'好吃','2019-06-12 13:47:40',6),(15,'/static/file/1560318497476.png','水果之恋',218,'好吃','2019-06-12 13:48:28',6),(16,'/static/file/1560319155494.png','调味牛五花',45,'好吃','2019-06-12 13:59:22',7),(17,'/static/file/1560319198456.png','黑牛肋条肉',78,'好吃','2019-06-12 14:00:17',7),(18,'/static/file/1560319247754.png','雪花坛肉',58,'好吃','2019-06-12 14:01:02',7),(19,'/static/file/1560319709782.png','奶油蘑菇汤',48,'好吃','2019-06-12 14:08:45',12),(20,'/static/file/1560319760843.png','法式香草',68,'好吃','2019-06-12 14:09:38',12),(21,'/static/file/1560319820749.png','西冷厚牛排',118,'好吃','2019-06-12 14:10:35',12),(22,'/static/file/1560319992787.png','斑鱼',36,'好吃','2019-06-12 14:13:27',13),(23,'/static/file/1560320035289.png','鲜虾滑',32,'好吃','2019-06-12 14:14:14',13),(24,'/static/file/1560320081357.png','特色鱼骨',18,'好吃','2019-06-12 14:14:56',13);
/*!40000 ALTER TABLE `cai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluate`
--

DROP TABLE IF EXISTS `evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价',
  `uid` int(11) DEFAULT NULL COMMENT '评价人',
  `uname` varchar(64) DEFAULT NULL COMMENT '姓名',
  `content` varchar(1000) DEFAULT NULL COMMENT '评价内容',
  `reply` varchar(50) DEFAULT NULL COMMENT '回复',
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `bid` int(11) DEFAULT NULL COMMENT '商家id',
  `createtime` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluate`
--

LOCK TABLES `evaluate` WRITE;
/*!40000 ALTER TABLE `evaluate` DISABLE KEYS */;
INSERT INTO `evaluate` VALUES (1,7,'ll','评价1','回复1',1,1,'2019-06-11 21:17:08'),(2,7,'ll','评价1',NULL,5,2,'2019-06-13 09:26:58'),(3,8,'zz','评价2',NULL,6,1,'2019-06-13 13:38:57'),(4,7,'ll','2222',NULL,11,1,'2019-06-13 16:52:48'),(5,8,'zz','评价2',NULL,3,2,'2019-06-24 09:42:22');
/*!40000 ALTER TABLE `evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '±àºÅ',
  `no` varchar(30) DEFAULT NULL COMMENT '¶©µ¥ºÅ',
  `uid` int(11) DEFAULT NULL COMMENT 'ÓÃ»§',
  `tid` int(11) DEFAULT NULL COMMENT '×ùÎ»',
  `createtime` datetime DEFAULT NULL COMMENT 'ÏÂµ¥Ê±¼ä',
  `state` int(11) DEFAULT '0' COMMENT '×´Ì¬',
  `bid` int(11) DEFAULT NULL COMMENT 'ÉÌ¼Ò',
  `total` double DEFAULT NULL COMMENT '×Ü¼Û',
  `time` datetime DEFAULT NULL COMMENT 'Ô¤¶¨Ê±¼ä',
  `remark` varchar(200) DEFAULT NULL COMMENT '±¸×¢',
  `finishtime` datetime DEFAULT NULL COMMENT '²ËÆ·Íê³ÉÊ±¼ä',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'1560259018880',7,1,'2019-06-11 21:16:58',1,1,45,'2019-06-11 21:16:50','备注1','2019-06-12 23:23:18'),(3,'1560350241039',8,9,'2019-06-12 22:37:21',0,2,15,'2019-06-12 22:37:13','备注3',NULL),(4,'1560350284091',8,10,'2019-06-12 22:38:04',0,2,24,'2019-06-12 22:37:55','备注4',NULL),(5,'1560389119290',7,9,'2019-06-13 09:25:19',0,2,21,'2019-06-13 09:24:13','备注2',NULL),(6,'1560404313849',8,1,'2019-06-13 13:38:33',0,1,13,'2019-06-13 13:38:21','备注1',NULL),(11,'1560415961357',7,1,'2019-06-13 16:52:41',0,1,43,'2019-06-13 16:52:38','44444',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_cai`
--

DROP TABLE IF EXISTS `orders_cai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_cai` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `cid` int(11) DEFAULT NULL COMMENT '菜品编号',
  `image` varchar(60) DEFAULT NULL COMMENT '图片',
  `cname` varchar(20) DEFAULT NULL COMMENT '菜名',
  `num` int(11) DEFAULT '1' COMMENT '数量',
  `state` int(11) DEFAULT '0' COMMENT '状态',
  `no` varchar(64) DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_cai`
--

LOCK TABLES `orders_cai` WRITE;
/*!40000 ALTER TABLE `orders_cai` DISABLE KEYS */;
INSERT INTO `orders_cai` VALUES (1,3,'/static/file/1559703660723.jpg','羊肉串',1,1,'1560259018880'),(2,2,'/static/file/1559703626838.jpg','牛肉串',1,0,'1560259018880'),(3,8,'/static/file/1559804306980.jpg','烤火腿',1,0,'1560259018880'),(4,1,'/static/file/1559703599484.jpg','烤鸭',1,0,'1560259018880'),(5,2,'/static/file/1559703626838.jpg','牛肉串',1,0,'1560309970511'),(6,3,'/static/file/1559703660723.jpg','羊肉串',1,0,'1560309970511'),(7,10,'/static/file/1560317701115.png','麻婆豆腐',1,0,'1560350241039'),(8,9,'/static/file/1560317557957.png','番茄炒鸡蛋',1,0,'1560350241039'),(9,10,'/static/file/1560317701115.png','麻婆豆腐',1,0,'1560350284091'),(10,11,'/static/file/1560317786549.png','毛血旺',1,0,'1560350284091'),(11,12,'/static/file/1560317974528.png','鱼香肉丝',1,0,'1560350284091'),(12,9,'/static/file/1560317557957.png','番茄炒鸡蛋',1,0,'1560389119290'),(13,10,'/static/file/1560317701115.png','麻婆豆腐',1,0,'1560389119290'),(14,11,'/static/file/1560317786549.png','毛血旺',1,0,'1560389119290'),(15,2,'/static/file/1560317363960.png','牛肉串',1,0,'1560404313849'),(16,3,'/static/file/1560317436145.png','羊肉串',1,0,'1560404313849'),(17,10,'/static/file/1560317701115.png','麻婆豆腐',1,0,'1560414725524'),(18,11,'/static/file/1560317786549.png','毛血旺',1,0,'1560414725524'),(19,9,'/static/file/1560317557957.png','番茄炒鸡蛋',1,0,'1560414725524'),(20,12,'/static/file/1560317974528.png','鱼香肉丝',1,0,'1560414725524'),(21,2,'/static/file/1560317363960.png','牛肉串',1,0,'1560415041603'),(22,1,'/static/file/1560343924192.jpg','烤鸭',1,0,'1560415041603'),(23,3,'/static/file/1560317436145.png','羊肉串',1,0,'1560415041603'),(24,8,'/static/file/1560317488690.png','烤火腿',1,0,'1560415041603'),(25,3,'/static/file/1560317436145.png','羊肉串',1,0,'1560415213041'),(26,1,'/static/file/1560343924192.jpg','烤鸭',1,0,'1560415213041'),(27,1,'/static/file/1560343924192.jpg','烤鸭',1,0,'1560415755145'),(28,2,'/static/file/1560317363960.png','牛肉串',1,0,'1560415755145'),(29,3,'/static/file/1560317436145.png','羊肉串',1,0,'1560415755145'),(30,8,'/static/file/1560317488690.png','烤火腿',1,0,'1560415755145'),(31,2,'/static/file/1560317363960.png','牛肉串',1,0,'1560415961357'),(32,3,'/static/file/1560317436145.png','羊肉串',1,0,'1560415961357'),(33,1,'/static/file/1560343924192.jpg','烤鸭',1,0,'1560415961357'),(34,2,'/static/file/1560317363960.png','牛肉串',1,0,'1560416040023'),(35,1,'/static/file/1560343924192.jpg','烤鸭',1,0,'1560416040023'),(36,2,'/static/file/1560317363960.png','牛肉串',1,0,'1560416875289'),(37,3,'/static/file/1560317436145.png','羊肉串',1,0,'1560416875289'),(38,1,'/static/file/1560343924192.jpg','烤鸭',1,0,'1560416875289'),(39,8,'/static/file/1560317488690.png','烤火腿',1,0,'1560416875289'),(40,2,'/static/file/1560317363960.png','牛肉串',1,0,'1560417028762'),(41,1,'/static/file/1560343924192.jpg','烤鸭',1,0,'1560417084984');
/*!40000 ALTER TABLE `orders_cai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '±àºÅ',
  `username` varchar(64) DEFAULT NULL COMMENT 'ÕËºÅ',
  `password` varchar(64) DEFAULT NULL COMMENT 'ÃÜÂë',
  `name` varchar(30) DEFAULT NULL COMMENT 'ÐÕÃû',
  `tel` varchar(22) DEFAULT NULL COMMENT 'µç»°',
  `gz` double DEFAULT NULL COMMENT '¹¤×Ê',
  `bid` int(11) DEFAULT NULL COMMENT '¹éÊôµêÆÌ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (3,'001','123456','zx','465',55,1),(5,'003','123','hjgj','4564',500,1),(6,'147','123','qq','147',5000,7),(7,'159','123456','ww','159789',8000,12),(8,'258','123456','dd','258879',5156,13);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `no` varchar(20) DEFAULT NULL COMMENT '编号',
  `num` int(11) DEFAULT '2' COMMENT '座位数',
  `state` int(11) DEFAULT '0' COMMENT '状态',
  `bid` int(11) DEFAULT NULL COMMENT '商家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,'001',4,0,1),(2,'002',2,0,1),(3,'001',2,0,5),(4,'002',4,1,5),(5,'003',2,0,5),(6,'004',6,0,5),(7,'005',8,0,5),(8,'006',8,2,5),(9,'001',5,0,2),(10,'002',8,0,2),(11,'003',5,2,2),(12,'004',8,1,2),(13,'001',2,0,6),(14,'002',3,1,6),(15,'1号',5,0,7),(16,'2号',8,1,7),(17,'001',5,0,12),(18,'002',4,0,12),(19,'003',5,1,12),(20,'001',5,0,13),(21,'002',8,0,13),(22,'003',8,1,1);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家编号',
  `image` varchar(64) DEFAULT NULL COMMENT '图片',
  `name` varchar(50) DEFAULT NULL COMMENT '商家名',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `opentime` varchar(30) DEFAULT NULL COMMENT '营业时间',
  `shop_type` varchar(20) DEFAULT NULL COMMENT '店铺类型',
  `username` varchar(20) DEFAULT NULL COMMENT '登陆账号',
  `password` varchar(20) DEFAULT NULL COMMENT '登陆密码',
  `type` int(11) DEFAULT '0' COMMENT '账号类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'/static/file/1560259589881.png','巴特尔烤肉店','沈阳市沈北新区','123','08:00--18:00','烧烤店','1','123456',0),(2,'/static/file/1560259673384.png','麦克比中餐厅','上海市建设路','1234','10：54--10：50','中餐店','2','123456',0),(4,'1','管理员','平台管理员','0','0','0','admin','admin',1),(5,'/static/file/1560259721789.png','汉堡王','北京市滨河路','12345','08：00 - - 20：00','快餐店','3','123456',0),(6,'/static/file/1560259872910.png','哈尼cake','沈阳市中街','123456','6:00—22:00','蛋糕店','4','123456',0),(7,'/static/file/1560260577953.png','黑牛の店','沈阳市大什字街','1234567','5:00—23:00','日本料理','5','123456',0),(12,'/static/file/1560261102803.png','秘巢精致西厨','成都市临波路','12345678','4：:0—23:00','西餐店','6','123456',0),(13,'/static/file/1560261283473.png','江小渔鲜鱼火锅','北京市长安路','132456789','5:00—22:00','火锅店','7','123456',0);
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `realname` varchar(64) DEFAULT NULL COMMENT '姓名',
  `money` double DEFAULT NULL COMMENT '账户余额',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'13881282238','123456','ll',NULL,'13881282238'),(8,'13881282239','123456','zz',NULL,'13881282239');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-24 10:09:04
