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
-- Table structure for table `TableDataSource`
--

DROP TABLE IF EXISTS `TableDataSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TableDataSource` (
  `i` int(11) NOT NULL AUTO_INCREMENT,
  `TableName` varchar(45) DEFAULT NULL,
  `DataSource` varchar(255) DEFAULT NULL,
  `Dump` varchar(255) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`i`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TableDataSource`
--

LOCK TABLES `TableDataSource` WRITE;
/*!40000 ALTER TABLE `TableDataSource` DISABLE KEYS */;
INSERT INTO `TableDataSource` VALUES (1,'ArpScanVm','Manually -Arp-Scan package installation','mysqldump -u cryptochest -p --port=33306 cryptochestmax ArpScanVm > cryptochestmax.ArpScanHost.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(2,'Coin','Manually','mysqldump -u cryptochest -p --port=33306 cryptochestmax Coin > cryptochestmax.Coin.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(3,'CoinTemplate','DockerRegistryHost','mysqldump -u cryptochest -p --port=33306 cryptochestmax CoinTemplate > cryptochestmax.CoinTemplate.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(4,'DockerImage','Docker list From DockerRegistry','mysqldump -u cryptochest -p --port=33306 cryptochestmax DockerImage > cryptochestmax.DockerImage.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(5,'DockerHubVm','Manually - Docker package insallation','mysqldump -u cryptochest -p --port=33306 cryptochestmax DockerHubVm > cryptochestmax.DockerHubVm.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(6,'DockerRegistryVm','Manually - DockerRegistry package insallation','mysqldump -u cryptochest -p --port=33306 cryptochestmax DockerRegistryVm > cryptochestmax.DockerRegistryVm.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(7,'KvmBridge','KvmHost - brctl, arp -a','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmBridge > cryptochestmax.KvmBridge.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(8,'KvmBridgePort','KvmHost - ip a, brctl showmacs br1','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmBridgePort > cryptochestmax.KvmBridgePort.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(9,'KvmDevicePartition','KvmHost - blkid, fdisk DEVICE print','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmDevicePartition > cryptochestmax.KvmDevicePartition.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(10,'KvmHost','Manually - Hezner panel, KvmHost - virsh nodeinfo','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmHost > cryptochestmax.KvmHost.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(11,'KvmHostAccess','KvmHost - ufw status verbose','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmHostAccess > cryptochestmax.KvmHostAccess.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(12,'KvmLVM','KvmHost - pvs','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmLVM > cryptochestmax.KvmLVM.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(13,'KvmLVMmember','KvmHost - lvdisplay -m','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmLVMmember > cryptochestmax.KvmLVMmember.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(14,'KvmNetworkInterface','KvmHost - Ip a','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmNetworkInterface > cryptochestmax.KvmNetworkInterface.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(15,'KvmPool','KvmHost - virsh pool-list --all, virsh pool-dumpxml POOLNAME','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmPool > cryptochestmax.KvmPool.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(16,'KvmPoolExtent','KvmHost - virsh pool-dumpxml POOLNAME','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmPoolExtent > cryptochestmax.KvmPoolExtent.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(17,'KvmStorageDevice','KvmHost - lsblk, fdisk DEVICE print','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmStorageDevice > cryptochestmax.KvmStorageDevice.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(18,'KvmVlanSwitch','Manually - Hezner panel','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmVlanSwitch > cryptochestmax.KvmVlanSwitch.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(19,'KvmVolume','KvmHost - virsh vol-list --details POOL','mysqldump -u cryptochest -p --port=33306 cryptochestmax KvmVolume > cryptochestmax.KvmVolume.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(20,'MasterNode','API to deploy masternode to Vm and Docker, than in each VM - cat ConfigPath and exec StatusCommand','mysqldump -u cryptochest -p --port=33306 cryptochestmax MasterNode > cryptochestmax.MasterNode.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(22,'User','Online Registration','mysqldump -u cryptochest -p --port=33306 cryptochestmax User > cryptochestmax.User.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(23,'VM','KvmHost - virsh list --all, nvirsh dumpxml VMNAME','mysqldump -u cryptochest -p --port=33306 cryptochestmax VM > cryptochestmax.VM.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47'),(24,'VmIp','arp-scan inside each Vlan (ArpScanHost)','mysqldump -u cryptochest -p --port=33306 cryptochestmax VmIp > cryptochestmax.VmIp.$(date +%Y-%m-%d-%H.%M.%S).sql',NULL,'2021-11-26 09:32:47');
/*!40000 ALTER TABLE `TableDataSource` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-12 23:06:02
