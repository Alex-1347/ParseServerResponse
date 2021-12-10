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
-- Table structure for table `KvmHost`
--

DROP TABLE IF EXISTS `KvmHost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmHost` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `ServerName` varchar(45) DEFAULT NULL,
  `OsVersion` varchar(45) DEFAULT NULL,
  `KvmVersion` varchar(145) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` blob DEFAULT NULL,
  `CpuModel` varchar(45) DEFAULT NULL,
  `CpuCount` int(11) DEFAULT NULL,
  `CpuSocket` int(11) DEFAULT NULL,
  `CorePerSocket` int(11) DEFAULT NULL,
  `ThreadPerSocket` int(11) DEFAULT NULL,
  `NumaCell` int(11) DEFAULT NULL,
  `MemorySize` bigint(20) DEFAULT NULL,
  `MainServerIP` varchar(45) DEFAULT NULL,
  `Location` varchar(450) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  UNIQUE KEY `i_UNIQUE` (`i`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='virsh nodeinfo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KvmHost`
--

LOCK TABLES `KvmHost` WRITE;
/*!40000 ALTER TABLE `KvmHost` DISABLE KEYS */;
INSERT INTO `KvmHost` VALUES (1,'New256','Ubuntu 20.10','QEMU emulator version 5.0.0 (Debian 1:5.0-5ubuntu9.6)','root','—¢4ßòô·rmÅ]H=ûó','x86_64',12,1,6,2,1,263827608,'144.XX.XX.107','Hetzner,FSN1-DC11,SB73 #XXXXXXX',NULL,'2021-11-26 09:32:47');
/*!40000 ALTER TABLE `KvmHost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 23:56:28
