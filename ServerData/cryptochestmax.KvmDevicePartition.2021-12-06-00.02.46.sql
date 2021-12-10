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
-- Table structure for table `KvmDevicePartition`
--

DROP TABLE IF EXISTS `KvmDevicePartition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KvmDevicePartition` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `ToKvmStorageDevice` int(11) DEFAULT NULL,
  `ToKvmLvmDevice` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `PartUUID` varchar(45) DEFAULT NULL,
  `PtType` varchar(45) DEFAULT NULL,
  `PartLabel` varchar(45) DEFAULT NULL,
  `BlockSize` varchar(45) DEFAULT NULL,
  `Size` varchar(45) DEFAULT NULL,
  `Start` bigint(20) DEFAULT NULL,
  `End` bigint(20) DEFAULT NULL,
  `Sectors` bigint(20) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`),
  UNIQUE KEY `UUID_UNIQUE` (`UUID`),
  KEY `LinkToPhysicalDevice_idx` (`ToKvmStorageDevice`),
  KEY `LinkToKvmLvm_idx` (`ToKvmLvmDevice`),
  CONSTRAINT `LinkToKvmLvm` FOREIGN KEY (`ToKvmLvmDevice`) REFERENCES `KvmLVM` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LinkToPhysicalDevice` FOREIGN KEY (`ToKvmStorageDevice`) REFERENCES `KvmStorageDevice` (`i`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='blkid\nfdisk DEVICE print';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KvmDevicePartition`
--

LOCK TABLES `KvmDevicePartition` WRITE;
/*!40000 ALTER TABLE `KvmDevicePartition` DISABLE KEYS */;
INSERT INTO `KvmDevicePartition` VALUES (1,1,NULL,'/dev/sda1','Linux ext3','5dd357af-1222-4d05-8e31-48e534751e2d','fb013c65-01',NULL,NULL,'4096','512M',2048,1050623,1048576,NULL,'2021-11-27 19:04:13'),(2,NULL,1,'/dev/sda2','Linux LVM','nWdphx-dhEA-2yOc-KYan-wY3U-MmvQ-Qvq6L5','fb013c65-02',NULL,NULL,NULL,'446.6G',1050624,937701039,936650416,NULL,'2021-11-27 19:11:18'),(3,2,NULL,'/dev/sdb1','Linux filesystem','80b20d97-e4d0-4d72-b35f-0269a64aa865','0f3a7f3a','dos','primary',NULL,'16G',34,33554465,33554432,NULL,'2021-11-27 19:42:08'),(4,2,NULL,'/dev/sdb2','Linux filesystem','1a04f15c-172a-4e04-b3c4-861cb6693515','e3371392','dos','primary',NULL,'16G',33554466,67108897,33554432,NULL,'2021-11-27 19:42:08'),(5,2,NULL,'/dev/sdb3','Linux filesystem','0aee6e4f-0862-4b37-af47-6415ae125525','0f7942c4','dos','primary',NULL,'16G',67108898,100663329,33554432,NULL,'2021-11-27 19:42:08'),(6,2,NULL,'/dev/sdb4','Linux filesystem','cd95957c-cf64-4309-b123-d4ee8ba45d7c','7db68d16','dos','primary',NULL,'16G',100663330,134217761,33554432,NULL,'2021-11-27 19:42:08'),(7,2,NULL,'/dev/sdb5','Linux filesystem','f2833bfa-ff90-4432-a13f-a7fc09ea5bf9','50f1611d','dos','primary',NULL,'16G',134217762,167772193,33554432,NULL,'2021-11-27 19:42:08'),(8,2,NULL,'/dev/sdb6','Linux filesystem','7173f396-24a7-4ece-b823-14625e273351','02136dd0','dos','primary',NULL,'16G',167772194,201326625,33554432,NULL,'2021-11-27 19:42:08'),(9,2,NULL,'/dev/sdb7','Linux filesystem','3565e878-15e0-422e-8a69-15c823b18f19','769fe9a2','dos','primary',NULL,'17G',201326626,236978209,35651584,NULL,'2021-11-27 19:42:09'),(10,2,NULL,'/dev/sdb8','Linux filesystem','e78eef85-5425-4a0c-934d-aea29dc38e51','6bdc6cb6','dos','primary',NULL,'16G',236978210,270532641,33554432,NULL,'2021-11-27 19:42:09'),(11,2,NULL,'/dev/sdb9','Linux filesystem','7183988a-b6a6-4781-83fc-870a688be2b6','3bbc74c5','dos','primary',NULL,'16G',270532642,304087073,33554432,NULL,'2021-11-27 19:42:09'),(12,2,NULL,'/dev/sdb10','Linux filesystem','dc5f54f3-5c60-4fe9-abdb-eeb0c3a3a7b3','6e4c748d','dos','primary',NULL,'16G',304087074,337641505,33554432,NULL,'2021-11-27 19:42:09'),(13,2,NULL,'/dev/sdb11','Linux filesystem','9e11c136-d133-4ab7-b0e0-bfa40642478b','171cc73f','dos','primary',NULL,'16G',337641506,371195937,33554432,NULL,'2021-11-27 19:42:09'),(14,2,NULL,'/dev/sdb12','Linux filesystem','76ae80fb-5fc1-447d-997e-9b4f1922da7a','bb62b343','dos','primary',NULL,'100G',371195938,580911137,209715200,NULL,'2021-11-27 19:42:09'),(15,2,NULL,'/dev/sdb13','Linux filesystem','88fab9c6-2930-40d2-8ead-78210ea71d12','19a70f81','dos','primary',NULL,'170G',580911138,937426977,356515840,NULL,'2021-11-27 19:42:09'),(16,3,NULL,'/dev/sdc1','Linux filesystem','177d5fdb-f03a-4295-8b96-a88ef0b320fe','29151619','dos','primary',NULL,'16G',34,33554465,33554432,NULL,'2021-11-27 20:08:40'),(17,3,NULL,'/dev/sdc2','Linux filesystem','306a0eb1-da35-4fd7-95da-a3d074f883a2','f7f6307f','dos','primary',NULL,'16G',33554466,67108897,33554432,NULL,'2021-11-27 20:08:40'),(18,3,NULL,'/dev/sdc3','Linux filesystem','c4fa01d5-1f01-46ad-b4aa-60cc91d03e11','4d2fed16','dos','primary',NULL,'16G',67108898,100663329,33554432,NULL,'2021-11-27 20:08:40'),(19,3,NULL,'/dev/sdc4','Linux filesystem','65f7438e-ff1a-494d-b747-8ca900311947','c583667b','dos','primary',NULL,'16G',100663330,134217761,33554432,NULL,'2021-11-27 20:08:40'),(20,3,NULL,'/dev/sdc5','Linux filesystem','24119d36-65e7-4081-bdd6-f39f84b6d77e','495ad72c','dos','primary',NULL,'16G',134217762,167772193,33554432,NULL,'2021-11-27 20:08:40'),(21,3,NULL,'/dev/sdc6','Linux filesystem','636255a2-149c-4375-b5ca-4a1a96492211','95fd718b','dos','primary',NULL,'16G',167772194,201326625,33554432,NULL,'2021-11-27 20:08:40'),(22,3,NULL,'/dev/sdc7','Linux filesystem','0f82725b-f70a-4273-93fe-0151533d68ba','33bb1e55','dos','primary',NULL,'16G',201326626,234881057,33554432,NULL,'2021-11-27 20:08:40'),(23,3,NULL,'/dev/sdc8','Linux filesystem','abd71dee-5085-444a-9c3b-80e7981d351d','539ce42a','dos','primary',NULL,'16G',234881058,268435489,33554432,NULL,'2021-11-27 20:08:40'),(24,3,NULL,'/dev/sdc9','Linux filesystem','06241887-32cf-4a1b-bb24-e6f91bed7c64','cea8875d','dos','primary',NULL,'16G',268435490,301989921,33554432,NULL,'2021-11-27 20:08:40'),(25,3,NULL,'/dev/sdc10','Linux filesystem','861cc003-0413-4de3-9091-deaf9e1c3f7d','83e9355e','dos','primary',NULL,'16G',301989922,335544353,33554432,NULL,'2021-11-27 20:08:40'),(26,3,NULL,'/dev/sdc11','Linux filesystem','f5c107aa-1ae1-42ca-a297-e359c1ae8990','bdc875e2','dos','primary',NULL,'16G',335544354,369098785,33554432,NULL,'2021-11-27 20:08:40'),(27,3,NULL,'/dev/sdc12','Linux filesystem','49c583b2-22e9-4ebf-8145-875d24cfe332','0e4b61fd','dos','primary',NULL,'50G',369098786,473956385,104857600,NULL,'2021-11-27 20:08:40'),(28,3,NULL,'/dev/sdc13','Linux filesystem','7d5aae12-b6b9-4c0a-bd95-46985358bdb7','6a445bfd','dos','primary',NULL,'221G',473956386,937426977,463470592,NULL,'2021-11-27 20:08:40'),(29,4,NULL,'/dev/sdd1','Linux filesystem','86f30785-35f3-3c47-9899-54435875f84e','1204e374','dos',NULL,NULL,'16G',2048,33556479,33554432,NULL,'2021-11-27 20:08:40'),(30,4,NULL,'/dev/sdd2','Linux filesystem','36f0901d-85bd-0845-9f46-29be93e127a8','10594c7f','dos',NULL,NULL,'16G',33556480,67110911,33554432,NULL,'2021-11-27 20:08:40'),(31,4,NULL,'/dev/sdd3','Linux filesystem','4e9dfc58-8dba-1a45-b6db-4f108d60e397','bfbc6f1e','dos',NULL,NULL,'16G',67110912,100665343,33554432,NULL,'2021-11-27 20:08:40'),(32,4,NULL,'/dev/sdd4','Linux filesystem','2bc9ce23-3164-5940-97d9-f23913b1d589','be28f9d0','dos',NULL,NULL,'16G',100665344,134219775,33554432,NULL,'2021-11-27 20:08:40'),(33,4,NULL,'/dev/sdd5','Linux filesystem','7fc039e2-56fe-49ce-892a-b68b7c0735e4','5a222595','dos','primary',NULL,'16G',134219776,167774207,33554432,NULL,'2021-11-27 20:08:40'),(34,4,NULL,'/dev/sdd6','Linux filesystem','a9e78de6-8a94-49cb-ae4c-4153fbf782a6','1a5adc59','dos','primary',NULL,'16G',167774208,201328639,33554432,NULL,'2021-11-27 20:08:41'),(35,4,NULL,'/dev/sdd7','Linux filesystem','e5cb8204-f625-42bd-bb12-ccdb97ff0bd1','c04e1ebc','dos','primary',NULL,'20G',201328640,243271679,41943040,NULL,'2021-11-27 20:08:41'),(36,4,NULL,'/dev/sdd8','Linux filesystem','58027350-d3b9-458b-94b5-3be00287c11b','97dd0047','dos','primary',NULL,'20G',243271680,285214719,41943040,NULL,'2021-11-27 20:08:41'),(37,4,NULL,'/dev/sdd9','Linux filesystem','e3307a47-b9b6-49d6-81be-0a063e8675ba','47d0acad','dos','primary',NULL,'20G',285214720,327157759,41943040,NULL,'2021-11-27 20:08:41'),(38,4,NULL,'/dev/sdd10','Linux filesystem','3b4bf345-7a2a-4929-8d0b-d5fb04acf71c','d7d62c36','dos','primary',NULL,'20G',327157760,369100799,41943040,NULL,'2021-11-27 20:08:41'),(39,4,NULL,'/dev/sdd11','Linux filesystem','9cf14046-929e-4916-a7ae-b404a57b55fc','f5bc88a1','dos','primary',NULL,'20G',369100800,411043839,41943040,NULL,'2021-11-27 20:08:41'),(40,4,NULL,'/dev/sdd12','ext4','b2abfc79-9082-47df-9e19-746bf2a83de8','3ac49a87-903a-4c7b-9e65-5a023575ac93','dos','primary','4096','250G',411043840,935331839,524288000,NULL,'2021-11-27 20:08:41');
/*!40000 ALTER TABLE `KvmDevicePartition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06  0:02:51
