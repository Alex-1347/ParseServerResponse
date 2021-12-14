-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cryptochestmax
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB-1:10.5.9+maria~xenial

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `KvmBridgePort`
--

DROP TABLE IF EXISTS `KvmBridgePort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmBridgePort` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmBridge` int(11) DEFAULT NULL,
  `BridgePort` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `BridgePortMac` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmBridge_idx` (`toKvmBridge`),
  CONSTRAINT `LinkToKvmBridge` FOREIGN KEY (`toKvmBridge`) REFERENCES `KvmBridge` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='ip a\nbrctl showmacs br1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KvmBridgePort`
--

LOCK TABLES `KvmBridgePort` WRITE;
/*!40000 ALTER TABLE `KvmBridgePort` DISABLE KEYS */;
INSERT INTO `KvmBridgePort` VALUES (1,2,2,'vnet0','fe:54:00:35:76:3e ',NULL,'2021-11-26 09:32:47'),(2,2,3,'vnet1','fe:54:00:15:7b:22',NULL,'2021-11-26 09:32:47'),(3,2,4,'vnet2','fe:54:00:58:a0:44',NULL,'2021-11-26 09:32:47'),(4,2,5,'vnet3','fe:54:00:10:bd:b7',NULL,'2021-11-26 09:32:47'),(5,2,6,'vnet4','fe:54:00:81:a0:cd',NULL,'2021-11-26 09:32:47'),(6,2,7,'vnet5','fe:54:00:60:90:13',NULL,'2021-11-26 09:32:47'),(7,2,8,'vnet6','fe:54:00:73:7e:8b',NULL,'2021-11-26 09:32:47'),(8,2,9,'vnet7','fe:54:00:33:66:d1',NULL,'2021-11-26 09:32:47'),(9,2,10,'vnet8','fe:54:00:88:53:e8',NULL,'2021-11-26 09:32:47'),(10,2,11,'vnet9','fe:54:00:22:ab:a4',NULL,'2021-11-26 09:32:47'),(11,2,12,'vnet10','fe:54:00:4c:2a:b6',NULL,'2021-11-26 09:32:47'),(12,2,13,'vnet11','fe:54:00:06:6c:57',NULL,'2021-11-26 09:32:47'),(13,2,14,'vnet12','fe:54:00:82:ff:6b',NULL,'2021-11-26 09:32:47'),(14,3,2,'vnet13','fe:54:00:ca:a3:de',NULL,'2021-11-26 09:32:47'),(15,3,3,'vnet14','fe:54:00:a1:09:75',NULL,'2021-11-26 09:32:47'),(16,3,4,'vnet15','fe:54:00:69:e2:cc',NULL,'2021-11-26 09:32:47'),(17,3,5,'vnet16','fe:54:00:a0:61:ea',NULL,'2021-11-26 09:32:47'),(18,3,6,'vnet17','fe:54:00:cb:b7:c2',NULL,'2021-11-26 09:32:47'),(19,3,7,'vnet18','fe:54:00:04:c0:04',NULL,'2021-11-26 09:32:47'),(20,3,8,'vnet19','fe:54:00:82:56:26',NULL,'2021-11-26 09:32:47'),(21,3,9,'vnet20','fe:54:00:d0:5b:87',NULL,'2021-11-26 09:32:47'),(22,3,10,'vnet21','fe:54:00:fd:b8:3b',NULL,'2021-11-26 09:32:47'),(23,3,11,'vnet22','fe:54:00:39:50:58',NULL,'2021-11-26 09:32:47'),(24,3,12,'vnet23','fe:54:00:bd:c1:99',NULL,'2021-11-26 09:32:47'),(25,3,13,'vnet24','fe:54:00:48:58:61',NULL,'2021-11-26 09:32:47'),(26,3,14,'vnet25','fe:54:00:21:3f:e1',NULL,'2021-11-26 09:32:47'),(27,3,15,'vnet26','fe:54:00:cd:43:f1',NULL,'2021-11-26 09:32:47'),(28,3,16,'vnet27','fe:54:00:7e:e5:f0',NULL,'2021-11-26 09:32:47'),(29,3,17,'vnet28','fe:54:00:e6:57:9c',NULL,'2021-11-26 09:32:47'),(30,3,18,'vnet29','fe:54:00:8c:d3:b3',NULL,'2021-11-26 09:32:47'),(31,3,19,'vnet30','fe:54:00:c9:72:d9',NULL,'2021-11-26 09:32:47'),(32,3,NULL,'vnet31','fe:54:00:3d:bf:b5',NULL,'2021-11-26 09:32:47'),(33,3,NULL,'vnet32','fe:54:00:89:8c:79',NULL,'2021-11-26 09:32:47');
/*!40000 ALTER TABLE `KvmBridgePort` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-12 23:03:51
