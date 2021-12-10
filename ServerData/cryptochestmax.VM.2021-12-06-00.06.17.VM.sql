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
-- Table structure for table `VM`
--

DROP TABLE IF EXISTS `VM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VM` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `toKvmHost` int(11) DEFAULT NULL,
  `ToKvmVolume` int(11) DEFAULT NULL,
  `ToVmNetwork` int(11) DEFAULT NULL,
  `toUser` int(11) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `Id` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `OsVersion` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `CpuSet` varchar(45) DEFAULT NULL,
  `Vcpu` varchar(45) DEFAULT NULL,
  `Memory` int(11) DEFAULT NULL,
  `SpicePort` int(11) DEFAULT NULL,
  `MacAdr` varchar(45) DEFAULT NULL,
  `AdminLogin` varchar(45) DEFAULT NULL,
  `AdminPassword` blob DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  KEY `LinkToKvmVolume_idx` (`ToKvmVolume`),
  KEY `LinkToVmNetwork_idx` (`ToVmNetwork`),
  KEY `LinkToUser_idx` (`toUser`),
  KEY `LinkToKvmHost_idx` (`toKvmHost`),
  CONSTRAINT `LinkToKvmHost3` FOREIGN KEY (`toKvmHost`) REFERENCES `KvmHost` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToKvmVolume` FOREIGN KEY (`ToKvmVolume`) REFERENCES `KvmVolume` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToUser` FOREIGN KEY (`toUser`) REFERENCES `User` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToVmNetwork` FOREIGN KEY (`ToVmNetwork`) REFERENCES `VMNetwork` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='virsh list --all\\n\nvirsh dumpxml VMNAME';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VM`
--

LOCK TABLES `VM` WRITE;
/*!40000 ALTER TABLE `VM` DISABLE KEYS */;
INSERT INTO `VM` VALUES (1,1,2,1,2,'7350986e-582d-43a9-ada0-b6afed2b05c1','41','U226','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5900,'52:54:00:35:76:3e','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:28'),(2,1,15,2,2,'98105d93-d265-4ebb-82da-39e81e0a654c','42','U227','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5901,'52:54:00:15:7b:22','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:28'),(3,1,3,3,2,'383c0526-539e-4bd2-ac9a-67c22bbd9685','43','U228','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5902,'52:54:00:58:a0:44','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:29'),(4,1,16,4,2,'3b282355-5195-471d-a4ba-fdae50f9f762','44','U229','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5903,'52:54:00:10:bd:b7','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:29'),(5,1,4,5,2,'938887b6-f450-4330-9aaf-bcff82580733','45','U230','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5904,'52:54:00:81:a0:cd','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:29'),(6,1,17,6,2,'53c2523a-7dfd-4e67-b814-e2a4e051b0ad','46','U231','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5905,'52:54:00:60:90:13','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:29'),(7,1,5,7,2,'a4e9e8bf-fba3-4a29-b4a7-d879ed772bc3','47','U232','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5906,'52:54:00:73:7e:8b','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:30'),(8,1,18,8,2,'2c031473-dc36-4d1b-aeeb-fb4f98cdfd04','48','U233','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5907,'52:54:00:33:66:d1','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:30'),(9,1,6,9,2,'04390a2a-ed80-4cec-b5d1-788f0b318ef8','49','U234','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5908,'52:54:00:88:53:e8','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:30'),(10,1,19,10,2,'302e12ad-efa6-4ebf-bd7c-63ad878d8c20','50','U235','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5909,'52:54:00:22:ab:a4','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:31'),(11,1,7,11,2,'fd619dea-813a-4838-96aa-d2ca91d38155','51','U236','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5910,'52:54:00:4c:2a:b6','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:31'),(12,1,20,12,2,'1dcdd9c6-9a1f-4cfd-ae86-58580514e8b4','52','U237','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5911,'52:54:00:06:6c:57','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:31'),(13,1,8,13,2,'15028a9d-d587-46a4-aa45-86d637225ecf','53','U238','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5912,'52:54:00:82:ff:6b','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:32'),(14,1,21,14,2,'45e3ddc7-05ca-4914-98b0-1f5713a971dc','54','U66','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5913,'52:54:00:ca:a3:de','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:32'),(15,1,9,15,2,'55bb5e41-4d32-44cd-ab9f-284974ea2e9b','55','U67','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5914,'52:54:00:a1:09:75','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:32'),(16,1,22,16,2,'bae26000-159f-45ad-8aa5-0c72f33aed56','56','U68','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5915,'52:54:00:69:e2:cc','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:32'),(17,1,10,17,2,'8f65dad3-cfed-4bc5-990f-002f2ecfaf0f','58','U69','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5916,'52:54:00:a0:61:ea','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:33'),(18,1,23,18,2,'3e1baeb5-5d48-4f93-b03f-5a5e255bbefb','59','U70','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5917,'52:54:00:cb:b7:c2','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:33'),(19,1,11,19,2,'314f2cfa-2786-4acd-9149-4ec809372f08','60','U71','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5918,'52:54:00:04:c0:04','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:33'),(20,1,24,20,2,'92e73e22-cad0-44f8-bc16-f5214d105b5e','61','U72','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5919,'52:54:00:82:56:26','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:34'),(21,1,25,21,2,'1d9d1ba7-b979-4816-a546-a98127be9bc8','62','U73','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5920,'52:54:00:d0:5b:87','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:34'),(22,1,32,22,2,'8491b359-f308-4fb8-ab76-84f264fe8b73','63','U74','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5921,'52:54:00:fd:b8:3b','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:34'),(23,1,33,23,2,'4cac68c1-479f-41f6-a744-b72315094a67','64','U75','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5922,'52:54:00:39:50:58','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:35'),(24,1,12,24,2,'227d6053-75f4-47d3-bf5c-ecaab02478c7','65','U76','Ubuntu 16.04.7 LTS','running','0,6','1',2097152,5923,'52:54:00:bd:c1:99','root','T÷—ðœÂÇ•í)þ¼Sò',NULL,'2021-11-29 15:12:35'),(25,1,28,25,3,'8aae5e90-523d-409f-a80e-5f7051f84312','66','L77','Ubuntu 16.04.7 LTS','running','0,6','1',4194304,5924,'52:54:00:48:58:61','coinadmin','V	c\\«Í˜­Â·ã}¥Zo',NULL,'2021-11-29 15:12:35'),(26,1,29,26,3,'2b1f7637-4e72-4d13-8aea-f86beebffa0b','67','L78','Ubuntu 16.04.7 LTS','running','0,6','1',4194304,5925,'52:54:00:21:3f:e1','coinadmin','V	c\\«Í˜­Â·ã}¥Zo',NULL,'2021-11-29 15:12:35'),(27,1,30,27,3,'847b2aa8-5b1f-437e-892f-65d0a2f12c54','68','L79','Ubuntu 16.04.7 LTS','running','0,6','1',4194304,5926,'52:54:00:cd:43:f1','coinadmin','V	c\\«Í˜­Â·ã}¥Zo',NULL,'2021-11-29 15:12:36'),(28,1,31,28,3,'43dad448-30d3-49bd-be54-21ee7559ff4e','69','L80','Ubuntu 16.04.7 LTS','running','0,6','1',4194304,5927,'52:54:00:7e:e5:f0','coinadmin','V	c\\«Í˜­Â·ã}¥Zo',NULL,'2021-11-29 15:12:36'),(29,1,37,31,1,'933324c2-6531-4bd1-aa8d-403927788e7c','72','D84-redis','Ubuntu 16.04.7 LTS','running','NO','2',4194304,5930,'52:54:00:c9:72:d9','redisadmin','ñ?ÆÒtíké…Òuâ<',NULL,'2021-11-29 15:13:06'),(30,1,34,32,1,'55b4d5ce-191b-4aa4-804e-fed83c82e485','73','D81-reg','Ubuntu 16.04.7 LTS','stop','0,6','1',4194304,5931,'52:54:00:3d:bf:b5','regadmin','ñ?ÆÒtíké…Òuâ<','Gateway trouble','2021-11-29 15:13:07'),(31,1,36,33,1,'e29ab2e7-066a-4ff4-b969-32edc991c7a1','74','D83-git','Ubuntu 16.04.7 LTS','stop','NO','2',4194304,5932,'52:54:00:89:8c:79','gitadmin','ñ?ÆÒtíké…Òuâ<','Gateway trouble','2021-11-29 15:13:08'),(32,1,35,30,1,'5f7553a9-75c1-42f0-abe2-059c5418c196','76','D82-site','Ubuntu 16.04.7 LTS','running','NO','2',51200000,5929,'52:54:00:8c:d3:b3','siteadmin','ñ?ÆÒtíké…Òuâ<',NULL,'2021-11-29 15:13:09'),(33,1,38,29,1,'546e2d72-816c-4298-8fe9-08a372395574','79','D85-tst','Ubuntu 16.04.7 LTS','running','NO','2',8388608,5928,'52:54:00:e6:57:9c','tstadmin','ñ?ÆÒtíké…Òuâ<',NULL,'2021-11-29 15:13:10');
/*!40000 ALTER TABLE `VM` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06  0:06:22
