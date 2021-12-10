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
-- Table structure for table `KvmLVMmember`
--

DROP TABLE IF EXISTS `KvmLVMmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmLVMmember` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmLVM` int(11) DEFAULT NULL,
  `DeviceName` varchar(45) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `BlockSize` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmLVM_idx` (`toKvmLVM`),
  CONSTRAINT `LinkToKvmLVM1` FOREIGN KEY (`toKvmLVM`) REFERENCES `KvmLVM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='blkid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KvmLVMmember`
--

LOCK TABLES `KvmLVMmember` WRITE;
/*!40000 ALTER TABLE `KvmLVMmember` DISABLE KEYS */;
INSERT INTO `KvmLVMmember` VALUES (1,1,'/dev/mapper/vg0-root','1e365d3b-c2f9-4dd0-a1fc-50874c94391f','Linux ext4','4096',NULL,'2021-11-26 09:32:47'),(2,1,'/dev/mapper/vg0-swap','cd3f191-5c74-499b-9402-02b72500f808','swap',NULL,NULL,'2021-11-26 09:32:47');
/*!40000 ALTER TABLE `KvmLVMmember` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06  0:03:45
