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
-- Table structure for table `KvmBridge`
--

DROP TABLE IF EXISTS `KvmBridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmBridge` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmNetwork` int(11) DEFAULT NULL,
  `toKvmVlanSwitch` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Id` varchar(45) DEFAULT NULL,
  `STP` varchar(45) DEFAULT NULL,
  `Ip` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmNetwork_idx` (`toKvmNetwork`),
  KEY `LinkToKvmVlan_idx` (`toKvmVlanSwitch`),
  CONSTRAINT `LinkToKvmNetwork` FOREIGN KEY (`toKvmNetwork`) REFERENCES `KvmNetworkInterface` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToKvmVlan` FOREIGN KEY (`toKvmVlanSwitch`) REFERENCES `KvmVlanSwitch` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='brctl\narp -a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KvmBridge`
--

LOCK TABLES `KvmBridge` WRITE;
/*!40000 ALTER TABLE `KvmBridge` DISABLE KEYS */;
INSERT INTO `KvmBridge` VALUES (1,1,NULL,'virbr0','8000.5254005da0cc','yes','192.168.122.1',NULL,'2021-11-26 09:36:25'),(2,NULL,1,'br1','8000.305a3a75da41','no','188.XX.XX.224',NULL,'2021-11-26 09:36:25'),(3,NULL,2,'br2','8000.305a3a75da41','yes','157.XX.XX.64',NULL,'2021-11-26 09:36:25');
/*!40000 ALTER TABLE `KvmBridge` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-12 23:03:37
