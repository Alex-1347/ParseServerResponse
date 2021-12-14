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
-- Table structure for table `KvmVlanSwitch`
--

DROP TABLE IF EXISTS `KvmVlanSwitch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmVlanSwitch` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmHost` int(11) DEFAULT NULL,
  `toNetworkInterface` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `VlanName` varchar(45) DEFAULT NULL,
  `VirtSwitch` varchar(45) DEFAULT NULL,
  `SwitchMac` varchar(45) DEFAULT NULL,
  `FromIp` varchar(45) DEFAULT NULL,
  `ToIp` varchar(45) DEFAULT NULL,
  `IpBroadcast` varchar(45) DEFAULT NULL,
  `IpNetmask` varchar(45) DEFAULT NULL,
  `IpGateway` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmHost_idx` (`toKvmHost`),
  KEY `LinkToNetwork1_idx` (`toNetworkInterface`),
  CONSTRAINT `LinkToKvmHost1` FOREIGN KEY (`toKvmHost`) REFERENCES `KvmHost` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToNetwork1` FOREIGN KEY (`toNetworkInterface`) REFERENCES `KvmNetworkInterface` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='brctl show\nip a\nroute -n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KvmVlanSwitch`
--

LOCK TABLES `KvmVlanSwitch` WRITE;
/*!40000 ALTER TABLE `KvmVlanSwitch` DISABLE KEYS */;
INSERT INTO `KvmVlanSwitch` VALUES (1,1,1,4002,'vlan.4002','vSwitch #17904','f2:0b:a4:d1:20:01','188.XX.XX.224','188.XX.XX.239','188.XX.XX.239',' 255.255.255.240','188.XX.XX.225',NULL,'2021-11-26 09:36:25'),(2,1,1,4005,'vlan.4005','vSwitch #18841 ','f2:0b:a4:d1:20:01','157.XX.XX.64','157.XX.XX.95','157.XX.XX.95',' 255.255.255.240','157.XX.XX.65',NULL,'2021-11-26 09:36:52');
/*!40000 ALTER TABLE `KvmVlanSwitch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-12 23:05:37
