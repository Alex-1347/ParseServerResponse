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
-- Table structure for table `KvmPool`
--

DROP TABLE IF EXISTS `KvmPool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmPool` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toStorageDevice` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `Autostart` int(11) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `Format` varchar(45) DEFAULT NULL,
  `Path` varchar(45) DEFAULT NULL,
  `Capacity` bigint(20) DEFAULT NULL,
  `Allocation` bigint(20) DEFAULT NULL,
  `Available` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToPhysicalDevice1_idx` (`toStorageDevice`),
  CONSTRAINT `LinkToPhysicalDevice1` FOREIGN KEY (`toStorageDevice`) REFERENCES `KvmStorageDevice` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='virsh pool-list --all\nvirsh pool-dumpxml POOLNAME';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KvmPool`
--

LOCK TABLES `KvmPool` WRITE;
/*!40000 ALTER TABLE `KvmPool` DISABLE KEYS */;
INSERT INTO `KvmPool` VALUES (1,1,'dir','default',1,1,'b9da56a4-5b23-4836-ad05-279efbc750c9',NULL,'/var/lib/libvirt/images',459084234752,4599349248,454484885504,NULL,'2021-11-26 09:41:44'),(2,2,'disk','dsk-b',1,1,'94de5afc-0836-4fb4-9dac-559889e11525','gpt','/dev/sdb',480103964160,479962595328,141351424,NULL,'2021-11-26 09:41:59'),(3,3,'disk','dsk-c',1,1,'84d4e719-b9ff-4b8f-8c4a-b8df44e4ff5b','gpt','/dev/sdc',480103964160,479962595328,141351424,NULL,'2021-11-26 09:42:16'),(4,4,'disk','dsk-d',1,1,'5013443c-43a8-4338-81c3-8dcce6bd8e57','gpt','/dev/sdd',480103964160,478888853504,1215093248,NULL,'2021-11-26 09:42:29');
/*!40000 ALTER TABLE `KvmPool` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06  0:04:18
