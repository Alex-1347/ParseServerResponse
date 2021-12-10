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
-- Table structure for table `KvmVolume`
--

DROP TABLE IF EXISTS `KvmVolume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmVolume` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmPool` int(11) DEFAULT NULL,
  `toDevicePartition` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Path` varchar(225) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Capacity` varchar(45) DEFAULT NULL,
  `Allocation` varchar(45) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  UNIQUE KEY `Path_UNIQUE` (`Path`),
  KEY `LinkToKvmPool_idx` (`toKvmPool`),
  KEY `LinkToDevicePartition_idx` (`toDevicePartition`),
  CONSTRAINT `LinkToDevicePartition` FOREIGN KEY (`toDevicePartition`) REFERENCES `KvmDevicePartition` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToKvmPool` FOREIGN KEY (`toKvmPool`) REFERENCES `KvmPool` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COMMENT='virsh vol-list --details POOL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KvmVolume`
--

LOCK TABLES `KvmVolume` WRITE;
/*!40000 ALTER TABLE `KvmVolume` DISABLE KEYS */;
INSERT INTO `KvmVolume` VALUES (1,2,NULL,'ubuntu-16.04.7-server-amd64.iso','/var/lib/libvirt/images/ubuntu-16.04.7-server-amd64.iso','file','880.00 MiB','880.00 MiB',NULL,'2021-11-27 17:29:23'),(2,2,3,'sdb1','/dev/sdb1','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:23'),(3,2,4,'sdb2','/dev/sdb2','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:23'),(4,2,5,'sdb3','/dev/sdb3','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:24'),(5,2,6,'sdb4','/dev/sdb4','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:24'),(6,2,7,'sdb5','/dev/sdb5','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:24'),(7,2,8,'sdb6','/dev/sdb6','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:24'),(8,2,9,'sdb7','/dev/sdb7','block','17.00 GiB','17.00 GiB',NULL,'2021-11-27 17:29:24'),(9,2,10,'sdb8','/dev/sdb8','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:24'),(10,2,11,'sdb9','/dev/sdb9','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:24'),(11,2,12,'sdb10','/dev/sdb10','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:24'),(12,2,13,'sdb11','/dev/sdb11','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:29:24'),(13,2,14,'sdb12','/dev/sdb12','block','100.00 GiB','100.00 GiB',NULL,'2021-11-27 17:29:24'),(14,2,15,'sdb13','/dev/sdb13','block','170.00 GiB','170.00 GiB',NULL,'2021-11-27 17:29:24'),(15,3,16,'sdc1','/dev/sdc1','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:29'),(16,3,17,'sdc2','/dev/sdc2','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:29'),(17,3,18,'sdc3','/dev/sdc3','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:29'),(18,3,19,'sdc4','/dev/sdc4','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:29'),(19,3,20,'sdc5','/dev/sdc5','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:29'),(20,3,21,'sdc6','/dev/sdc6','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:29'),(21,3,22,'sdc7','/dev/sdc7','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:29'),(22,3,23,'sdc8','/dev/sdc8','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:29'),(23,3,24,'sdc9','/dev/sdc9','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:30'),(24,3,25,'sdc10','/dev/sdc10','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:30'),(25,3,26,'sdc11','/dev/sdc11','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:34:30'),(26,3,27,'sdc12','/dev/sdc12','block','50.00 GiB','50.00 GiB',NULL,'2021-11-27 17:34:30'),(27,3,28,'sdc13','/dev/sdc13','block','221.00 GiB','221.00 GiB',NULL,'2021-11-27 17:34:30'),(28,4,29,'sdd1','/dev/sdd1','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:39:22'),(29,4,30,'sdd2','/dev/sdd2','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:39:23'),(30,4,31,'sdd3','/dev/sdd3','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:39:23'),(31,4,32,'sdd4','/dev/sdd4','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:39:23'),(32,4,33,'sdd5','/dev/sdd5','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:39:23'),(33,4,34,'sdd6','/dev/sdd6','block','16.00 GiB','16.00 GiB',NULL,'2021-11-27 17:39:23'),(34,4,35,'sdd7','/dev/sdd7','block','20.00 Gi','20.00 GiB',NULL,'2021-11-27 17:39:23'),(35,4,36,'sdd8','/dev/sdd8','block','20.00 GiB','20.00 GiB',NULL,'2021-11-27 17:39:23'),(36,4,37,'sdd9','/dev/sdd9','block','20.00 GiB','20.00 GiB',NULL,'2021-11-27 17:39:23'),(37,4,38,'sdd10','/dev/sdd10','block','20.00 GiB','20.00 GiB',NULL,'2021-11-27 17:39:23'),(38,4,39,'sdd11','/dev/sdd11','block','20.00 GiB','20.00 GiB',NULL,'2021-11-27 17:39:23'),(39,4,40,'sdd12','/dev/sdd12','block','250.00 GiB','250.00 GiB',NULL,'2021-11-27 17:39:23');
/*!40000 ALTER TABLE `KvmVolume` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06  0:05:23
