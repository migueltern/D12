start transaction;
create database `Acme-Recycling`;
use `Acme-Recycling`;
create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';
grant select, insert, update, delete on `Acme-Recycling`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter, create temporary tables, lock tables, create view, create routine, alter routine, execute, trigger, show view on `Acme-Recycling`.* to 'acme-manager'@'%';
-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: acme-recycling
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gfgqmtp2f9i5wsojt33xm0uth` (`userAccount_id`),
  KEY `AdminUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_gfgqmtp2f9i5wsojt33xm0uth` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (3946,0,'Adress admin 1','admin@acmenewspaper.com','admin 1','+34611111111','SEVILLA','surname admin 1',3920);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assesment`
--

DROP TABLE IF EXISTS `assesment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assesment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `moment` date DEFAULT NULL,
  `valuation` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assesment`
--

LOCK TABLES `assesment` WRITE;
/*!40000 ALTER TABLE `assesment` DISABLE KEYS */;
INSERT INTO `assesment` VALUES (4059,0,'description 2','2018-02-02',2),(4060,0,'description 3','2018-03-02',5);
/*!40000 ALTER TABLE `assesment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `expirationMonth` varchar(255) DEFAULT NULL,
  `expirationYear` varchar(255) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cd8x6jpg0qhhvfeiwvkf1ho3e` (`material_id`),
  CONSTRAINT `FK_cd8x6jpg0qhhvfeiwvkf1ho3e` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (4197,0,'comment buy 1','Brand name 1',123,'06','20','holder name 1','4388576018410707',8,4033),(4198,0,'comment buy 2','Brand name 2',123,'01','21','holder name 2','4388576018410707',2,4034),(4199,0,'comment buy 3','Brand name 3',614,'01','19','holder name 3','4388576018410707',3,4035),(4200,0,'comment buy 4','Brand name 4',614,'01','19','holder name 4','4388576018410707',4,4036),(4201,0,'comment buy 5','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707',5,4037),(4202,0,'comment buy 6','Brand name 1',123,'06','20','holder name 1','4388576018410707',1,4033),(4203,0,'comment buy 7','Brand name 2',123,'01','21','holder name 2','4388576018410707',2,4033),(4204,0,'comment buy 8','Brand name 4',614,'01','19','holder name 4','4388576018410707',2,4034),(4205,0,'comment buy 9','Brand name 6',614,'01','19','Agent2 holder name 6','4388576018410707',9,4038);
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  `finder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_n1u0aujikrqor6qt4sc7dxi6y` (`userAccount_id`),
  KEY `BuyerUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  KEY `FK_n4qyus4u40veu4jljxd5fdf6d` (`finder_id`),
  CONSTRAINT `FK_n1u0aujikrqor6qt4sc7dxi6y` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_n4qyus4u40veu4jljxd5fdf6d` FOREIGN KEY (`finder_id`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (3967,1,'Adress buyer 1','buyer1@acmerecycling.com','buyer 1','+34666666666','ALMERIA','surname buyer 1',3941,3978),(3968,1,'Adress buyer 2','buyer2@acmerecycling.com','buyer 2','+34612666666','ALMERIA','surname buyer 2',3942,3979),(3969,1,'Adress buyer 3','buyer3@acmerecycling.com','buyer 3','+34136666666','GIRONA','surname buyer 3',3943,3980),(3970,1,'Adress buyer 4','buyer4@acmerecycling.com','buyer 4','+34614666666','BADAJOZ','surname buyer 4',3944,3981),(3971,1,'Adress buyer 5','buyer5@acmerecycling.com','buyer 5','+34615666666','CADIZ','surname buyer 5',3945,3982);
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_buy`
--

DROP TABLE IF EXISTS `buyer_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer_buy` (
  `Buyer_id` int(11) NOT NULL,
  `buys_id` int(11) NOT NULL,
  UNIQUE KEY `UK_lbqhc4pbb4m4sys6eimm7uk7m` (`buys_id`),
  KEY `FK_gjdoq629c7fhhaxsnkk6jsidm` (`Buyer_id`),
  CONSTRAINT `FK_gjdoq629c7fhhaxsnkk6jsidm` FOREIGN KEY (`Buyer_id`) REFERENCES `buyer` (`id`),
  CONSTRAINT `FK_lbqhc4pbb4m4sys6eimm7uk7m` FOREIGN KEY (`buys_id`) REFERENCES `buy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_buy`
--

LOCK TABLES `buyer_buy` WRITE;
/*!40000 ALTER TABLE `buyer_buy` DISABLE KEYS */;
INSERT INTO `buyer_buy` VALUES (3967,4197),(3967,4205),(3968,4198),(3968,4199),(3970,4200),(3970,4203),(3971,4201),(3971,4202),(3971,4204);
/*!40000 ALTER TABLE `buyer_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_course`
--

DROP TABLE IF EXISTS `buyer_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer_course` (
  `Buyer_id` int(11) NOT NULL,
  `courses_id` int(11) NOT NULL,
  UNIQUE KEY `UK_799fa4uacgnxoq3cnif44whbg` (`courses_id`),
  KEY `FK_ht8o0qswo3094lmf11lbhf2er` (`Buyer_id`),
  CONSTRAINT `FK_ht8o0qswo3094lmf11lbhf2er` FOREIGN KEY (`Buyer_id`) REFERENCES `buyer` (`id`),
  CONSTRAINT `FK_799fa4uacgnxoq3cnif44whbg` FOREIGN KEY (`courses_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_course`
--

LOCK TABLES `buyer_course` WRITE;
/*!40000 ALTER TABLE `buyer_course` DISABLE KEYS */;
INSERT INTO `buyer_course` VALUES (3967,4016),(3968,4017),(3968,4018),(3970,4021),(3971,4020);
/*!40000 ALTER TABLE `buyer_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_62tsjlw490ys898otivsrx4dx` (`userAccount_id`),
  KEY `CarrierUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_62tsjlw490ys898otivsrx4dx` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrier`
--

LOCK TABLES `carrier` WRITE;
/*!40000 ALTER TABLE `carrier` DISABLE KEYS */;
INSERT INTO `carrier` VALUES (3952,0,'Adress carrier 1','carrier1@acmerecycling.com','carrier 1','+34633333333','SEVILLA','surname carrier 1',3926),(3953,0,'Adress carrier 2','carrier2@acmerecycling.com','carrier 2','+34612333333','CADIZ','surname carrier 2',3927),(3954,0,'Adress carrier 3','carrier3@acmerecycling.com','carrier 3','+34613333333','HUELVA','surname carrier 3',3928),(3955,0,'Adress carrier 4','carrier4@acmerecycling.com','carrier 4','+34614333333','JAEN','surname carrier 4',3929),(3956,0,'Adress carrier 5','carrier5@acmerecycling.com','carrier 5','+34615333333','SEVILLA','surname carrier 5',3930);
/*!40000 ALTER TABLE `carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleanpoint`
--

DROP TABLE IF EXISTS `cleanpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cleanpoint` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` bit(1) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleanpoint`
--

LOCK TABLES `cleanpoint` WRITE;
/*!40000 ALTER TABLE `cleanpoint` DISABLE KEYS */;
INSERT INTO `cleanpoint` VALUES (4053,0,'ctra arahal-paradas',37.35,-5.98,'ubicacion 1','\0','+652582643','SEVILLA'),(4054,0,'address clean point 2',37.28,-5.49,'Ubicacion 2','\0','+654769645','HUELVA'),(4055,0,'address clean point 3',40.6,5.5,'Ubicacion 3','\0','+689354723','MALAGA'),(4056,0,'address clean point  4',41.34,2.09,'Ubicacion 4','','+7656573211','MALAGA'),(4057,0,'address clean point 5',43.65,7.08,'Ubicacion 5','\0','+676543234','ALMERIA'),(4058,0,'address clean point 6',34.65,5.08,'Ubicacion 6','','+676543255','HUESCA');
/*!40000 ALTER TABLE `cleanpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `createdMoment` datetime DEFAULT NULL,
  `commentTo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5vsspagpf1k5vhnu1g4c180j4` (`commentTo_id`),
  CONSTRAINT `FK_5vsspagpf1k5vhnu1g4c180j4` FOREIGN KEY (`commentTo_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (4008,0,'body 1','2018-01-02 13:31:00',NULL),(4009,0,'body 2','2018-02-02 12:31:00',NULL),(4010,0,'body 3','2018-01-02 13:31:00',NULL),(4011,0,'body 4','2018-04-02 14:31:00',NULL),(4012,0,'body 5','2018-05-02 15:31:00',NULL),(4013,0,'body 6','2018-05-06 15:31:00',4008),(4014,0,'body 7','2018-05-07 15:31:00',4008),(4015,0,'body 8','2018-05-08 15:31:00',4012);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurationsystem`
--

DROP TABLE IF EXISTS `configurationsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurationsystem` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `aboutUsPicture` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `cacheMaxTime` int(11) NOT NULL,
  `englishWelcomeMessage` varchar(255) DEFAULT NULL,
  `locationEnglish` varchar(255) DEFAULT NULL,
  `locationSpanish` varchar(255) DEFAULT NULL,
  `maxNumberFinder` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `spanishWelcomeMessage` varchar(255) DEFAULT NULL,
  `whoAreWeEnglish` varchar(255) DEFAULT NULL,
  `whoAreWeSpanish` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurationsystem`
--

LOCK TABLES `configurationsystem` WRITE;
/*!40000 ALTER TABLE `configurationsystem` DISABLE KEYS */;
INSERT INTO `configurationsystem` VALUES (4022,0,'https://okdiario.com/img/2017/05/03/planeta-655x368.jpg','http://www.masciudadania.es/wp-content/uploads/2016/04/z-Banner.jpg',2,'There are people who make the world work better, let\'s make it work by reducing pollution and recycling.','Our company Acme-Recycler is located in the capital of Andalucia, specifically in the Spanish municipality of the province of Seville.','Nuestra empresa Acme-Recycler se encuentra ubicada en la capital de Andalucía, concretamente en el municipio español de la provincia de Sevilla.',40,'Acme-Recycling','Hay gente que hace que el mundo funcione mejor, hagamos que funcione reduciendo la contaminación y reciclando.','The organization that takes care of the environment through recycling and eco-design of packaging in Spain. We make it possible for plastic containers, cans, paperboard, and any object can have a second chance.','La organización que cuida del medio ambiente a través del reciclaje y el ecodiseño de los envases en España. Hacemos posible que los envases de plástico, latas, cartón, y cualquier objeto puedan tener una segunda oportunidad. ');
/*!40000 ALTER TABLE `configurationsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurationsystem_legislation`
--

DROP TABLE IF EXISTS `configurationsystem_legislation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurationsystem_legislation` (
  `ConfigurationSystem_id` int(11) NOT NULL,
  `laws_id` int(11) NOT NULL,
  UNIQUE KEY `UK_ex1whcqwhagel3y2pd74kueph` (`laws_id`),
  KEY `FK_1nj8tg5444u2g3coofehsbwj8` (`ConfigurationSystem_id`),
  CONSTRAINT `FK_1nj8tg5444u2g3coofehsbwj8` FOREIGN KEY (`ConfigurationSystem_id`) REFERENCES `configurationsystem` (`id`),
  CONSTRAINT `FK_ex1whcqwhagel3y2pd74kueph` FOREIGN KEY (`laws_id`) REFERENCES `legislation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurationsystem_legislation`
--

LOCK TABLES `configurationsystem_legislation` WRITE;
/*!40000 ALTER TABLE `configurationsystem_legislation` DISABLE KEYS */;
INSERT INTO `configurationsystem_legislation` VALUES (4022,4029),(4022,4030),(4022,4031),(4022,4032);
/*!40000 ALTER TABLE `configurationsystem_legislation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurationsystem_tabooword`
--

DROP TABLE IF EXISTS `configurationsystem_tabooword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurationsystem_tabooword` (
  `ConfigurationSystem_id` int(11) NOT NULL,
  `tabooWords_id` int(11) NOT NULL,
  UNIQUE KEY `UK_atoy8roxhv9akeamxs61hujxr` (`tabooWords_id`),
  KEY `FK_4uqlduhykfkaeldgil1dx4ehl` (`ConfigurationSystem_id`),
  CONSTRAINT `FK_4uqlduhykfkaeldgil1dx4ehl` FOREIGN KEY (`ConfigurationSystem_id`) REFERENCES `configurationsystem` (`id`),
  CONSTRAINT `FK_atoy8roxhv9akeamxs61hujxr` FOREIGN KEY (`tabooWords_id`) REFERENCES `tabooword` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurationsystem_tabooword`
--

LOCK TABLES `configurationsystem_tabooword` WRITE;
/*!40000 ALTER TABLE `configurationsystem_tabooword` DISABLE KEYS */;
INSERT INTO `configurationsystem_tabooword` VALUES (4022,4024),(4022,4025),(4022,4026),(4022,4027);
/*!40000 ALTER TABLE `configurationsystem_tabooword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `draftMode` bit(1) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `minimumScore` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `realisedMoment` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_rn6vlan03m96oonvb1bx79xnh` (`title`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (4016,0,'description course 1','\0',37.35,-5.98,'ubicacion 1',1,'http://cuellar7.com/wp-content/uploads/2014/09/Curso-2-Coca.jpg','2018-12-12','title course 1'),(4017,0,'description course 2','\0',37.28,-5.49,'Ubicacion 2',2,'https://spseguridad.files.wordpress.com/2013/05/curso_presencial1.jpg','2018-02-12','title course 2'),(4018,0,'description course 3','\0',40.6,5.5,'Ubicacion 3',3,'http://www.gsesoftware.com/wp-content/uploads/2017/02/LOGO-FORMACI%C3%93N-300x119.png','2018-12-13','title course 3'),(4019,0,'description course 4','\0',41.34,2.09,'Ubicacion 4',4,'https://www.panamaparaninos.com/image/cache/data/Eventos/Culturales/Mu%C3%B1ecosPapelMacheBibadabook_01-600x600.jpg','2018-04-12','title course 4'),(4020,0,'description course 5','\0',43.65,7.08,'Ubicacion 5',5,'https://image.slidesharecdn.com/presentacincrac-130926082730-phpapp01/95/presentacin-del-curso-de-reciclaje-artstico-y-creativo-34-638.jpg?cb=1380200215','2018-12-15','title course 5'),(4021,0,'description course 6','',43.65,7.08,'Ubicacion 5',2,'https://image.slidesharecdn.com/presentacincrac-130926082730-phpapp01/95/presentacin-del-curso-de-reciclaje-artstico-y-creativo-5-638.jpg?cb=1380200215','2019-11-01','title course 6');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_material`
--

DROP TABLE IF EXISTS `course_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_material` (
  `Course_id` int(11) NOT NULL,
  `materials_id` int(11) NOT NULL,
  KEY `FK_r0k66bv5sq61eroumlfoevehl` (`materials_id`),
  KEY `FK_2ur8pf23wgv8y6n0py1ixi4gi` (`Course_id`),
  CONSTRAINT `FK_2ur8pf23wgv8y6n0py1ixi4gi` FOREIGN KEY (`Course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_r0k66bv5sq61eroumlfoevehl` FOREIGN KEY (`materials_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_material`
--

LOCK TABLES `course_material` WRITE;
/*!40000 ALTER TABLE `course_material` DISABLE KEYS */;
INSERT INTO `course_material` VALUES (4016,4033),(4017,4034),(4018,4035),(4019,4036),(4020,4037),(4021,4038);
/*!40000 ALTER TABLE `course_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor`
--

DROP TABLE IF EXISTS `editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_n206xwfkcb9yc6xokpt7nil48` (`userAccount_id`),
  KEY `EditorUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_n206xwfkcb9yc6xokpt7nil48` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor`
--

LOCK TABLES `editor` WRITE;
/*!40000 ALTER TABLE `editor` DISABLE KEYS */;
INSERT INTO `editor` VALUES (3947,0,'Adress editor 1','editor1@acmerecycling.com','editor 1','+34622222222','SEVILLA','surname editor 1',3936),(3948,0,'Adress editor 2','editor2@acmerecycling.com','editor 2','+34635222222','MADRID','surname editor 2',3937),(3949,0,'Adress editor 3','editor3@acmerecycling.com','editor 3','+34667222222','LUGO','surname editor 3',3938),(3950,0,'Adress editor 4','editor4@acmerecycling.com','editor 4','+34619222222','VALENCIA','surname editor 4',3939),(3951,0,'Adress editor 5','editor5@acmerecycling.com','editor 5','+34615222222','ZARAGOZA','surname editor 5',3940);
/*!40000 ALTER TABLE `editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor_newscast`
--

DROP TABLE IF EXISTS `editor_newscast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editor_newscast` (
  `Editor_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  UNIQUE KEY `UK_4incsu1rxfo6apn103xdau8iu` (`news_id`),
  KEY `FK_4dw0i16e1gk6fhsj2obkwvygh` (`Editor_id`),
  CONSTRAINT `FK_4dw0i16e1gk6fhsj2obkwvygh` FOREIGN KEY (`Editor_id`) REFERENCES `editor` (`id`),
  CONSTRAINT `FK_4incsu1rxfo6apn103xdau8iu` FOREIGN KEY (`news_id`) REFERENCES `newscast` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor_newscast`
--

LOCK TABLES `editor_newscast` WRITE;
/*!40000 ALTER TABLE `editor_newscast` DISABLE KEYS */;
INSERT INTO `editor_newscast` VALUES (3947,3972),(3947,3973),(3949,3974),(3949,3977),(3950,3975),(3951,3976);
/*!40000 ALTER TABLE `editor_newscast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder`
--

DROP TABLE IF EXISTS `finder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `highPrice` double DEFAULT NULL,
  `keyWord` varchar(255) DEFAULT NULL,
  `lowPrice` double DEFAULT NULL,
  `startCacheTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_i7gvuyaofx4ru2qxvk0d7i53v` (`keyWord`,`lowPrice`,`highPrice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
INSERT INTO `finder` VALUES (3978,0,3.1,'sex',1,'2018-12-12 18:34:00'),(3979,0,3.1,'sex2',1,'2018-12-12 18:34:00'),(3980,0,3.1,'sex3',1,'2018-12-12 18:34:00'),(3981,0,3.1,'sex4',1,'2018-12-12 18:34:00'),(3982,0,3.1,'sex5',1,'2018-12-12 18:34:00');
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_material`
--

DROP TABLE IF EXISTS `finder_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_material` (
  `Finder_id` int(11) NOT NULL,
  `materials_id` int(11) NOT NULL,
  KEY `FK_espuk5oa1hddxu2iqe9unnw49` (`materials_id`),
  KEY `FK_6oapoun3bpjwo38atujud0jca` (`Finder_id`),
  CONSTRAINT `FK_6oapoun3bpjwo38atujud0jca` FOREIGN KEY (`Finder_id`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_espuk5oa1hddxu2iqe9unnw49` FOREIGN KEY (`materials_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_material`
--

LOCK TABLES `finder_material` WRITE;
/*!40000 ALTER TABLE `finder_material` DISABLE KEYS */;
INSERT INTO `finder_material` VALUES (3978,4033),(3978,4034),(3980,4035),(3981,4036),(3982,4037);
/*!40000 ALTER TABLE `finder_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidence`
--

DROP TABLE IF EXISTS `incidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidence` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdMoment` datetime DEFAULT NULL,
  `reasonWhy` varchar(255) DEFAULT NULL,
  `resolved` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `recycler_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_ik2nkn7fw3mbgknt6ax04utq` (`resolved`),
  KEY `FK_20fx24iugg993d9t2so36kc0y` (`recycler_id`),
  CONSTRAINT `FK_20fx24iugg993d9t2so36kc0y` FOREIGN KEY (`recycler_id`) REFERENCES `recycler` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidence`
--

LOCK TABLES `incidence` WRITE;
/*!40000 ALTER TABLE `incidence` DISABLE KEYS */;
INSERT INTO `incidence` VALUES (3983,0,'comment incidence 1','2018-01-01 11:20:00','reason why 1','\0','title incidence 1 viagra',3962),(3984,0,'comment incidence 2','2018-02-02 12:20:00','reason why 2','','title incidence 2',3962),(3985,0,'comment incidence 3','2018-03-03 13:30:00','reason why 3','','title incidence 3',3964),(3986,0,'comment incidence 4','2018-04-04 14:40:00','reason why 4','\0','title incidence 4',3964),(3987,0,'comment incidence 5','2018-05-05 15:50:00','reason why 5','\0','title incidence 5',3964),(3988,0,'comment incidence 6','2018-05-01 19:20:00','reason why 6','','title incidence 6 sex',3962),(3989,0,'comment incidence 7','2018-02-22 21:20:00','reason why 7','','title incidence 7 sexo',3964);
/*!40000 ALTER TABLE `incidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `publicationMoment` datetime DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` int(11) NOT NULL,
  `labelProduct_id` int(11) NOT NULL,
  `recycler_id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_4kg18ag5wmhd4ddvrtl605h8w` (`publicationMoment`,`value`),
  KEY `FK_j23bn5qrff19qbojj9vxnyf7b` (`labelProduct_id`),
  KEY `FK_1kldsov10d5jj7evpiraahk8b` (`recycler_id`),
  KEY `FK_j1xoaasamwybtdxg8k56tokbp` (`request_id`),
  CONSTRAINT `FK_j1xoaasamwybtdxg8k56tokbp` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`),
  CONSTRAINT `FK_1kldsov10d5jj7evpiraahk8b` FOREIGN KEY (`recycler_id`) REFERENCES `recycler` (`id`),
  CONSTRAINT `FK_j23bn5qrff19qbojj9vxnyf7b` FOREIGN KEY (`labelProduct_id`) REFERENCES `labelproduct` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (4206,0,'description item 1','https://pimientosytomates.files.wordpress.com/2009/08/lavadora-vieja.jpg','2018-01-12 12:12:00',23,'title item 1',16,3996,3962,4047),(4207,0,'description item 2','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSWZaE9DvgcQGN3ekP2yPWphBpe78dohdbXxsLnkGy7ed1QeQ4QA','2018-02-12 12:12:00',2,'title item 2',2,3996,3963,NULL),(4208,0,'description item 3','http://www.cafedelescritor.com/wp-content/uploads/libros-viejos.jpg','2018-03-12 12:12:00',3,'title item 3',3,3997,3964,4049),(4209,0,'description item 5','http://fotografias.lasexta.com/clipping/cmsimages01/2014/11/25/AE4222C6-A8BC-470C-BB56-73743D2FBD16/58.jpg','2018-05-12 15:12:00',5,'title item 5',5,3998,3966,4051),(4210,0,'description item 6','http://fotografias.lasexta.com/clipping/cmsimages01/2014/11/25/AE4222C6-A8BC-470C-BB56-73743D2FBD16/58.jpg','2018-05-12 15:12:00',5,'title item 6',5,3998,3966,4052),(4211,0,'description item 7','https://pimientosytomates.files.wordpress.com/2009/08/lavadora-vieja.jpg','2018-01-16 12:12:00',7,'title item 7',16,3996,3962,4048);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labelmaterial`
--

DROP TABLE IF EXISTS `labelmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labelmaterial` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `byDefault` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i5l4eaby4iyd01xxtwvdu8ufi` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labelmaterial`
--

LOCK TABLES `labelmaterial` WRITE;
/*!40000 ALTER TABLE `labelmaterial` DISABLE KEYS */;
INSERT INTO `labelmaterial` VALUES (3990,0,'\0','Cobre'),(3991,0,'\0','Aluminio'),(3992,0,'\0','Bronce'),(3993,0,'\0','Aceite'),(3994,0,'','Baterias'),(3995,0,'','Vidrio');
/*!40000 ALTER TABLE `labelmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labelproduct`
--

DROP TABLE IF EXISTS `labelproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labelproduct` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `byDefault` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1ftrt8m9x09u0xrkg6vtr3h38` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labelproduct`
--

LOCK TABLES `labelproduct` WRITE;
/*!40000 ALTER TABLE `labelproduct` DISABLE KEYS */;
INSERT INTO `labelproduct` VALUES (3996,0,'','Aluminio'),(3997,0,'','Cemento'),(3998,0,'','Papel'),(3999,0,'','Pilas y baterias'),(4000,0,'','Plastico'),(4001,0,'','Ordenador'),(4002,0,'','Telefono'),(4003,0,'','Textil'),(4004,0,'','Vidrio'),(4005,0,'','Otros'),(4006,0,'\0','Cables'),(4007,0,'\0','Tonner');
/*!40000 ALTER TABLE `labelproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legislation`
--

DROP TABLE IF EXISTS `legislation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legislation` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legislation`
--

LOCK TABLES `legislation` WRITE;
/*!40000 ALTER TABLE `legislation` DISABLE KEYS */;
INSERT INTO `legislation` VALUES (4029,0,'body 1','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 1'),(4030,0,'body 2','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 2'),(4031,0,'body 3','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 3'),(4032,0,'body 4','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 4');
/*!40000 ALTER TABLE `legislation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_7q0wr758ruqshn5n1xwv4pa9g` (`title`,`summary`,`course_id`),
  KEY `FK_swxtnpbei5seidnpkvxyqph49` (`course_id`),
  CONSTRAINT `FK_swxtnpbei5seidnpkvxyqph49` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (4061,0,1,'summary of lesson 1','title 1',4016),(4062,0,2,'summary of lesson 2','title 2',4017),(4063,0,1,'summary of lesson 3','title 3',4018),(4064,0,1,'summary of lesson 4','title 4',4019),(4065,0,1,'summary of lesson 5','title 5',4020),(4066,0,1,'summary of lesson 6','title 6',4021);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_84bmmxlq61tiaoc7dy7kdcghh` (`userAccount_id`),
  KEY `ManagerUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_84bmmxlq61tiaoc7dy7kdcghh` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (3957,0,'Adress manager 1','manager1@acmerecycling.com','manager 1','+34644444444','SEVILLA','surname manager 1',3921),(3958,0,'Adress manager 2','manager2@acmerecycling.com','manager 2','+34612444444','PALENCIA','surname manager 2',3922),(3959,0,'Adress manager 3','manager3@acmerecycling.com','manager 3','+34613444444','CIUDAD REAL','surname manager 3',3923),(3960,0,'Adress manager 4','manager4@acmerecycling.com','manager 4','+34614444444','BARCELONA','surname manager 4',3924),(3961,0,'Adress manager 5','manager5@acmerecycling.com','manager 5','+34615444444','SEVILLA','surname manager 5',3925);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_incidence`
--

DROP TABLE IF EXISTS `manager_incidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_incidence` (
  `Manager_id` int(11) NOT NULL,
  `incidences_id` int(11) NOT NULL,
  UNIQUE KEY `UK_t9i915m30wihgwfaauomhru9b` (`incidences_id`),
  KEY `FK_hb07ljn2wj0bd2w4k05pvgnju` (`Manager_id`),
  CONSTRAINT `FK_hb07ljn2wj0bd2w4k05pvgnju` FOREIGN KEY (`Manager_id`) REFERENCES `manager` (`id`),
  CONSTRAINT `FK_t9i915m30wihgwfaauomhru9b` FOREIGN KEY (`incidences_id`) REFERENCES `incidence` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_incidence`
--

LOCK TABLES `manager_incidence` WRITE;
/*!40000 ALTER TABLE `manager_incidence` DISABLE KEYS */;
INSERT INTO `manager_incidence` VALUES (3957,3983),(3957,3984),(3959,3985),(3960,3986),(3961,3987);
/*!40000 ALTER TABLE `manager_incidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_request`
--

DROP TABLE IF EXISTS `manager_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_request` (
  `Manager_id` int(11) NOT NULL,
  `requests_id` int(11) NOT NULL,
  UNIQUE KEY `UK_igi48yjdoih83ay6r3sgap8l7` (`requests_id`),
  KEY `FK_sn5pe25d862k9q10fx9ch64nq` (`Manager_id`),
  CONSTRAINT `FK_sn5pe25d862k9q10fx9ch64nq` FOREIGN KEY (`Manager_id`) REFERENCES `manager` (`id`),
  CONSTRAINT `FK_igi48yjdoih83ay6r3sgap8l7` FOREIGN KEY (`requests_id`) REFERENCES `request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_request`
--

LOCK TABLES `manager_request` WRITE;
/*!40000 ALTER TABLE `manager_request` DISABLE KEYS */;
INSERT INTO `manager_request` VALUES (3957,4047),(3959,4049),(3960,4050),(3961,4051),(3961,4052);
/*!40000 ALTER TABLE `manager_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `labelMaterial_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_lpviqy4yxestjxg2t8b4on8y7` (`title`,`description`,`unitPrice`),
  KEY `FK_tpq6xjbrtre04u39tqf803vh7` (`labelMaterial_id`),
  CONSTRAINT `FK_tpq6xjbrtre04u39tqf803vh7` FOREIGN KEY (`labelMaterial_id`) REFERENCES `labelmaterial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (4033,0,'description 1',2.2,'material title 1',4.4,2,3990),(4034,0,'description 2',2.2,'material title 2',4.4,2,3990),(4035,0,'description 3',3.2,'material title 3',9.92,3.1,3991),(4036,0,'description 4',4.2,'material title 4',17.64,4.2,3991),(4037,0,'description 5',5.2,'material title 5',26,5,3992),(4038,0,'description 6',3.2,'material title 6',38.4,12,3992);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `messageFolder_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_h27p9c2qmr2peaojb34sh9axv` (`messageFolder_id`,`subject`,`body`),
  CONSTRAINT `FK_iq38mox9qghnx2rc8hpdtmros` FOREIGN KEY (`messageFolder_id`) REFERENCES `messagefolder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (4212,0,'body 1','2017-10-01 15:20:00','HIGH','subject 1',4023,3946,3962),(4213,0,'body 1','2017-10-01 15:20:00','HIGH','subject 1 viagra',4196,3946,3961),(4214,0,'body 1','2017-10-01 15:20:00','HIGH','subject 1 viagra',4138,3946,3961),(4215,0,'body 2 sex','2017-10-01 15:20:00','HIGH','subject 2',4196,3946,3961),(4216,0,'body 2 sex','2017-10-01 15:20:00','NEUTRAL','subject 2',4138,3946,3961),(4217,0,'body 3','2017-10-01 15:20:00','HIGH','subject 3 cialis',4196,3946,3961),(4218,0,'body 3','2017-10-01 15:20:00','NEUTRAL','subject 3 cialis',4138,3946,3961),(4219,0,'body 4','2017-10-01 15:20:00','HIGH','subject 4 sexo',4196,3946,3961),(4220,0,'body 4','2017-10-01 15:20:00','NEUTRAL','subject 4 sexo',4138,3946,3961),(4221,0,'body 5 viagra','2017-10-01 15:20:00','NEUTRAL','subject 5',4196,3946,3961),(4222,0,'body 5 viagra','2017-10-01 15:20:00','NEUTRAL','subject 5',4138,3946,3961),(4223,0,'body 6 sex','2017-10-01 15:20:00','NEUTRAL','subject 6',4196,3946,3961),(4224,0,'body 6 sex','2017-10-01 15:20:00','HIGH','subject 6',4138,3946,3961),(4225,0,'body 1','2017-10-01 15:20:00','HIGH','subject 1 viagra',4196,3946,3971),(4226,0,'body 1','2017-10-01 15:20:00','NEUTRAL','subject 1 viagra',4113,3946,3971),(4227,0,'body 2 sex','2017-10-01 15:20:00','NEUTRAL','subject 2',4196,3946,3971),(4228,0,'body 2 sex','2017-10-01 15:20:00','NEUTRAL','subject 2',4113,3946,3971),(4229,0,'body 3','2017-10-01 15:20:00','NEUTRAL','subject 3 cialis',4196,3946,3971),(4230,0,'body 3','2017-10-01 15:20:00','HIGH','subject 3 cialis',4113,3946,3971),(4231,0,'body 4','2017-10-01 15:20:00','HIGH','subject 4 sexo',4196,3946,3971),(4232,0,'body 4','2017-10-01 15:20:00','NEUTRAL','subject 4 sexo',4113,3946,3971),(4233,0,'body 5 viagra','2017-10-01 15:20:00','NEUTRAL','subject 5',4196,3946,3971),(4234,0,'body 5 viagra','2017-10-01 15:20:00','NEUTRAL','subject 5',4113,3946,3971),(4235,0,'body 6 sex','2017-10-01 15:20:00','NEUTRAL','subject 6',4196,3946,3971),(4236,0,'body 6 sex','2017-10-01 15:20:00','NEUTRAL','subject 6',4113,3946,3971);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messagefolder`
--

DROP TABLE IF EXISTS `messagefolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messagefolder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `modifiable` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_qtw36ey8a18uy89ca2xvcpsb4` (`actor_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagefolder`
--

LOCK TABLES `messagefolder` WRITE;
/*!40000 ALTER TABLE `messagefolder` DISABLE KEYS */;
INSERT INTO `messagefolder` VALUES (4023,0,'','folder 1',3962),(4067,0,'\0','In box',3962),(4068,0,'\0','Out box',3962),(4069,0,'\0','Notification box',3962),(4070,0,'\0','Trash box',3962),(4071,0,'\0','Spam box',3962),(4072,0,'\0','In box',3963),(4073,0,'\0','Out box',3963),(4074,0,'\0','Notification box',3963),(4075,0,'\0','Trash box',3963),(4076,0,'\0','Spam box',3963),(4077,0,'\0','In box',3964),(4078,0,'\0','Out box',3964),(4079,0,'\0','Notification box',3964),(4080,0,'\0','Trash box',3964),(4081,0,'\0','Spam box',3964),(4082,0,'\0','In box',3965),(4083,0,'\0','Out box',3965),(4084,0,'\0','Notification box',3965),(4085,0,'\0','Trash box',3965),(4086,0,'\0','Spam box',3965),(4087,0,'\0','In box',3966),(4088,0,'\0','Out box',3966),(4089,0,'\0','Notification box',3966),(4090,0,'\0','Trash box',3966),(4091,0,'\0','Spam box',3966),(4092,0,'\0','In box',3967),(4093,0,'\0','Out box',3967),(4094,0,'\0','Notification box',3967),(4095,0,'\0','Trash box',3967),(4096,0,'\0','Spam box',3967),(4097,0,'\0','In box',3968),(4098,0,'\0','Out box',3968),(4099,0,'\0','Notification box',3968),(4100,0,'\0','Trash box',3968),(4101,0,'\0','Spam box',3968),(4102,0,'\0','In box',3969),(4103,0,'\0','Out box',3969),(4104,0,'\0','Notification box',3969),(4105,0,'\0','Trash box',3969),(4106,0,'\0','Spam box',3969),(4107,0,'\0','In box',3970),(4108,0,'\0','Out box',3970),(4109,0,'\0','Notification box',3970),(4110,0,'\0','Trash box',3970),(4111,0,'\0','Spam box',3970),(4112,0,'\0','In box',3971),(4113,0,'\0','Out box',3971),(4114,0,'\0','Notification box',3971),(4115,0,'\0','Trash box',3971),(4116,0,'\0','Spam box',3971),(4117,0,'\0','In box',3957),(4118,0,'\0','Out box',3957),(4119,0,'\0','Notification box',3957),(4120,0,'\0','Trash box',3957),(4121,0,'\0','Spam box',3957),(4122,0,'\0','In box',3958),(4123,0,'\0','Out box',3958),(4124,0,'\0','Notification box',3958),(4125,0,'\0','Trash box',3958),(4126,0,'\0','Spam box',3958),(4127,0,'\0','In box',3959),(4128,0,'\0','Out box',3959),(4129,0,'\0','Notification box',3959),(4130,0,'\0','Trash box',3959),(4131,0,'\0','Spam box',3959),(4132,0,'\0','In box',3960),(4133,0,'\0','Out box',3960),(4134,0,'\0','Notification box',3960),(4135,0,'\0','Trash box',3960),(4136,0,'\0','Spam box',3960),(4137,0,'\0','In box',3961),(4138,0,'\0','Out box',3961),(4139,0,'\0','Notification box',3961),(4140,0,'\0','Trash box',3961),(4141,0,'\0','Spam box',3961),(4142,0,'\0','In box',3947),(4143,0,'\0','Out box',3947),(4144,0,'\0','Notification box',3947),(4145,0,'\0','Trash box',3947),(4146,0,'\0','Spam box',3947),(4147,0,'\0','In box',3948),(4148,0,'\0','Out box',3948),(4149,0,'\0','Notification box',3948),(4150,0,'\0','Trash box',3948),(4151,0,'\0','Spam box',3948),(4152,0,'\0','In box',3949),(4153,0,'\0','Out box',3949),(4154,0,'\0','Notification box',3949),(4155,0,'\0','Trash box',3949),(4156,0,'\0','Spam box',3949),(4157,0,'\0','In box',3950),(4158,0,'\0','Out box',3950),(4159,0,'\0','Notification box',3950),(4160,0,'\0','Trash box',3950),(4161,0,'\0','Spam box',3950),(4162,0,'\0','In box',3951),(4163,0,'\0','Out box',3951),(4164,0,'\0','Notification box',3951),(4165,0,'\0','Trash box',3951),(4166,0,'\0','Spam box',3951),(4167,0,'\0','In box',3952),(4168,0,'\0','Out box',3952),(4169,0,'\0','Notification box',3952),(4170,0,'\0','Trash box',3952),(4171,0,'\0','Spam box',3952),(4172,0,'\0','In box',3953),(4173,0,'\0','Out box',3953),(4174,0,'\0','Notification box',3953),(4175,0,'\0','Trash box',3953),(4176,0,'\0','Spam box',3953),(4177,0,'\0','In box',3954),(4178,0,'\0','Out box',3954),(4179,0,'\0','Notification box',3954),(4180,0,'\0','Trash box',3954),(4181,0,'\0','Spam box',3954),(4182,0,'\0','In box',3955),(4183,0,'\0','Out box',3955),(4184,0,'\0','Notification box',3955),(4185,0,'\0','Trash box',3955),(4186,0,'\0','Spam box',3955),(4187,0,'\0','In box',3956),(4188,0,'\0','Out box',3956),(4189,0,'\0','Notification box',3956),(4190,0,'\0','Trash box',3956),(4191,0,'\0','Spam box',3956),(4192,0,'\0','In box',3946),(4193,0,'\0','Out box',3946),(4194,0,'\0','Notification box',3946),(4195,0,'\0','Trash box',3946),(4196,0,'\0','Spam box',3946);
/*!40000 ALTER TABLE `messagefolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newscast`
--

DROP TABLE IF EXISTS `newscast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newscast` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_admvb507fe6dx8oy3fgbd7phm` (`title`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newscast`
--

LOCK TABLES `newscast` WRITE;
/*!40000 ALTER TABLE `newscast` DISABLE KEYS */;
INSERT INTO `newscast` VALUES (3972,0,'content new 1','2018-04-04 12:22:00','title new viagra 1'),(3973,0,'content new 2','2018-04-01 13:01:00','title new 2 viagra'),(3974,0,'content new 3','2018-04-03 13:33:00','title new 3'),(3975,0,'content new 4','2018-04-04 14:44:00','title new 4'),(3976,0,'content new 5','2018-04-05 15:55:00','title new 5'),(3977,0,'content new 6','2018-04-07 17:55:00','title new 6');
/*!40000 ALTER TABLE `newscast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newscast_comment`
--

DROP TABLE IF EXISTS `newscast_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newscast_comment` (
  `Newscast_id` int(11) NOT NULL,
  `comments_id` int(11) NOT NULL,
  UNIQUE KEY `UK_95oc7xri784i9gu9uuqweeqcd` (`comments_id`),
  KEY `FK_9osntbxsehl99g5inpw7ts7yl` (`Newscast_id`),
  CONSTRAINT `FK_9osntbxsehl99g5inpw7ts7yl` FOREIGN KEY (`Newscast_id`) REFERENCES `newscast` (`id`),
  CONSTRAINT `FK_95oc7xri784i9gu9uuqweeqcd` FOREIGN KEY (`comments_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newscast_comment`
--

LOCK TABLES `newscast_comment` WRITE;
/*!40000 ALTER TABLE `newscast_comment` DISABLE KEYS */;
INSERT INTO `newscast_comment` VALUES (3972,4008),(3972,4009),(3972,4013),(3972,4014),(3974,4010),(3975,4011),(3976,4012),(3976,4015);
/*!40000 ALTER TABLE `newscast_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newscast_pictures`
--

DROP TABLE IF EXISTS `newscast_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newscast_pictures` (
  `Newscast_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_3h20o51qhwy0d8n556ow4bqgv` (`Newscast_id`),
  CONSTRAINT `FK_3h20o51qhwy0d8n556ow4bqgv` FOREIGN KEY (`Newscast_id`) REFERENCES `newscast` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newscast_pictures`
--

LOCK TABLES `newscast_pictures` WRITE;
/*!40000 ALTER TABLE `newscast_pictures` DISABLE KEYS */;
INSERT INTO `newscast_pictures` VALUES (3972,'http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png\n				'),(3972,'http://www.cantillana.es/opencms/export/sites/default/cantillana/galeriaInterior/noticias/Elreciclajetienesupunto.jpg\n				'),(3973,'http://www.rocianadelcondado.es/export/sites/rociana/.galleries/000126.jpg\n				'),(3974,'http://www.minambiente.gov.co/images/sala-de-prensa/imagenes-noticias/noticias_2015/diciembre/17-mayo-reciclaje.jpg\n				'),(3975,'http://www.jafcia.cl/wp-content/uploads/2016/11/noticia-1.jpg\n				'),(3976,'http://www.jafcia.cl/wp-content/uploads/2016/11/noticia-2.jpg\n				'),(3977,'http://www.jafcia.cl/wp-content/uploads/2016/11/noticia-2.jpg\n				');
/*!40000 ALTER TABLE `newscast_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinable_opinion`
--

DROP TABLE IF EXISTS `opinable_opinion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinable_opinion` (
  `Opinable_id` int(11) NOT NULL,
  `opinions_id` int(11) NOT NULL,
  UNIQUE KEY `UK_wqhxeeg5fgetqu5dum7oj6pl` (`opinions_id`),
  CONSTRAINT `FK_wqhxeeg5fgetqu5dum7oj6pl` FOREIGN KEY (`opinions_id`) REFERENCES `opinion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinable_opinion`
--

LOCK TABLES `opinable_opinion` WRITE;
/*!40000 ALTER TABLE `opinable_opinion` DISABLE KEYS */;
INSERT INTO `opinable_opinion` VALUES (4206,4039),(4207,4040),(4208,4041),(4209,4043),(4018,4046);
/*!40000 ALTER TABLE `opinable_opinion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinion`
--

DROP TABLE IF EXISTS `opinion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opinion` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdMoment` datetime DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_sh88e130et0akt8xxoygv3gyv` (`actor_id`,`title`,`createdMoment`,`comment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinion`
--

LOCK TABLES `opinion` WRITE;
/*!40000 ALTER TABLE `opinion` DISABLE KEYS */;
INSERT INTO `opinion` VALUES (4039,0,'caption opinion 1','comment opinion 1','2018-03-04 00:00:00','http://slideplayer.es/slide/4019554/13/images/21/RECICLAJE+DE+PAPEL+GR%C3%81FICO+RESUMEN.jpg','title opinion 1',3962),(4040,0,'caption opinion 2','comment opinion 2','2018-02-04 00:00:00','http://vadecuentos.com/wp-content/uploads/2015/05/taller-infantil-creatividad-reciclaje-jueguetes-carton1.png','title opinion 2',3962),(4041,0,'caption opinion 3','comment opinion 3','2018-02-03 00:00:00','http://fece.org/wp-content/uploads/2016/12/materiales-reciclables-raee.jpg','title opinion 3',3964),(4042,0,'caption opinion 4','comment opinion 4','2018-04-04 00:00:00','https://culturaeinformacioninma.files.wordpress.com/2015/03/81dd0-por-qu25c325a9-reciclar.jpg','title opinion 4',3965),(4043,0,'caption opinion 5','comment opinion 5','2018-05-03 00:00:00','http://publicaciones.unicartagena.edu.co/images/catalogo/portadas/El-reciclaje-es-un-negocio-con-beneficio-economico-social-y-ambiental.jpg','title opinion 5',3966),(4044,0,'caption opinion  6','comment opinion 6','2018-03-03 00:00:00','http://publicaciones.unicartagena.edu.co/images/catalogo/portadas/El-reciclaje-es-un-negocio-con-beneficio-economico-social-y-ambiental.jpg','title opinion 6',3948),(4045,0,'caption opinon 7','comment opinion 7','2018-01-04 00:00:00','https://culturaeinformacioninma.files.wordpress.com/2015/03/81dd0-por-qu25c325a9-reciclar.jpg','title opinion 7',3948),(4046,0,'caption opinon 8','comment opinion 8','2018-01-04 00:00:00','https://culturaeinformacioninma.files.wordpress.com/2015/03/81dd0-por-qu25c325a9-reciclar.jpg','title opinion 8',3963);
/*!40000 ALTER TABLE `opinion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recycler`
--

DROP TABLE IF EXISTS `recycler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recycler` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j9etl5bw3fdbgeunx12x8uslx` (`userAccount_id`),
  KEY `RecyclerUK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_j9etl5bw3fdbgeunx12x8uslx` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recycler`
--

LOCK TABLES `recycler` WRITE;
/*!40000 ALTER TABLE `recycler` DISABLE KEYS */;
INSERT INTO `recycler` VALUES (3962,0,'Adress recycler 1','recycler1@acmerecycling.com','recycler 1','+34655555555','SEVILLA','surname recycler 1',3931),(3963,0,'Adress recycler 2','recycler2@acmerecycling.com','recycler 2','+34612555555','BILBAO','surname recycler 2',3932),(3964,0,'Adress recycler 3','recycler3@acmerecycling.com','recycler 3','+34613555555','GRANADA','surname recycler 3',3933),(3965,0,'Adress recycler 4','recycler4@acmerecycling.com','recycler 4','+34614555555','SEVILLA','surname recycler 4',3934),(3966,0,'Adress recycler 5','recycler5@acmerecycling.com','recycler 5','+34615555555','SEVILLA','surname recycler 5',3935);
/*!40000 ALTER TABLE `recycler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recycler_comment`
--

DROP TABLE IF EXISTS `recycler_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recycler_comment` (
  `Recycler_id` int(11) NOT NULL,
  `comments_id` int(11) NOT NULL,
  UNIQUE KEY `UK_1tejp6xmklc0ujlf18wvqrwao` (`comments_id`),
  KEY `FK_3i84qga2ietc8pfc5kj1b8eg` (`Recycler_id`),
  CONSTRAINT `FK_3i84qga2ietc8pfc5kj1b8eg` FOREIGN KEY (`Recycler_id`) REFERENCES `recycler` (`id`),
  CONSTRAINT `FK_1tejp6xmklc0ujlf18wvqrwao` FOREIGN KEY (`comments_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recycler_comment`
--

LOCK TABLES `recycler_comment` WRITE;
/*!40000 ALTER TABLE `recycler_comment` DISABLE KEYS */;
INSERT INTO `recycler_comment` VALUES (3962,4008),(3962,4009),(3963,4013),(3963,4014),(3964,4010),(3964,4015),(3965,4011),(3966,4012);
/*!40000 ALTER TABLE `recycler_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recycler_course`
--

DROP TABLE IF EXISTS `recycler_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recycler_course` (
  `Recycler_id` int(11) NOT NULL,
  `courses_id` int(11) NOT NULL,
  KEY `FK_jgm443x1jxrjywt658u49ggcd` (`courses_id`),
  KEY `FK_dnx3unimv5byqbkr3k15edjmm` (`Recycler_id`),
  CONSTRAINT `FK_dnx3unimv5byqbkr3k15edjmm` FOREIGN KEY (`Recycler_id`) REFERENCES `recycler` (`id`),
  CONSTRAINT `FK_jgm443x1jxrjywt658u49ggcd` FOREIGN KEY (`courses_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recycler_course`
--

LOCK TABLES `recycler_course` WRITE;
/*!40000 ALTER TABLE `recycler_course` DISABLE KEYS */;
INSERT INTO `recycler_course` VALUES (3962,4020),(3963,4018),(3964,4018);
/*!40000 ALTER TABLE `recycler_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `assesment_id` int(11) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_dyvisf1kwsc6vnhb4k4900t7e` (`carrier_id`,`assesment_id`,`code`,`title`),
  KEY `FK_e49ye2s4qr7xmbm5ietd056f5` (`assesment_id`),
  CONSTRAINT `FK_h0j2w5l8lhry4fc3urybmt8q2` FOREIGN KEY (`carrier_id`) REFERENCES `carrier` (`id`),
  CONSTRAINT `FK_e49ye2s4qr7xmbm5ietd056f5` FOREIGN KEY (`assesment_id`) REFERENCES `assesment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (4047,0,'DG180131DF','observation request 1','CLEAN POINT','title request 1',NULL,NULL),(4048,1,'DG180231BB','observation request 2','FINISHED','title request 2',4059,3954),(4049,1,'DG180331CC','observation request 3','FINISHED','title request 3',4060,3954),(4050,0,'DG180431DD','observation request 4','IN COLLECTION','title request 4',NULL,3955),(4051,0,'DG180131EE','observation request 5','IN COLLECTION','title request 5',NULL,3956),(4052,0,'DG180731FF','observation request 6','CANCELLED','title request 6',NULL,3956);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_cleanpoint`
--

DROP TABLE IF EXISTS `request_cleanpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_cleanpoint` (
  `Request_id` int(11) NOT NULL,
  `cleanPoints_id` int(11) NOT NULL,
  KEY `FK_5qogi02bsqxdnem3042lwoyfb` (`cleanPoints_id`),
  KEY `FK_fudyb2x5yfvmdyfhbjeuop6wi` (`Request_id`),
  CONSTRAINT `FK_fudyb2x5yfvmdyfhbjeuop6wi` FOREIGN KEY (`Request_id`) REFERENCES `request` (`id`),
  CONSTRAINT `FK_5qogi02bsqxdnem3042lwoyfb` FOREIGN KEY (`cleanPoints_id`) REFERENCES `cleanpoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_cleanpoint`
--

LOCK TABLES `request_cleanpoint` WRITE;
/*!40000 ALTER TABLE `request_cleanpoint` DISABLE KEYS */;
INSERT INTO `request_cleanpoint` VALUES (4047,4053);
/*!40000 ALTER TABLE `request_cleanpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabooword`
--

DROP TABLE IF EXISTS `tabooword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabooword` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `default_word` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabooword`
--

LOCK TABLES `tabooword` WRITE;
/*!40000 ALTER TABLE `tabooword` DISABLE KEYS */;
INSERT INTO `tabooword` VALUES (4024,0,'','sex'),(4025,0,'','sexo'),(4026,0,'','cialis'),(4027,0,'','viagra'),(4028,0,'\0','cialis 1');
/*!40000 ALTER TABLE `tabooword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `activated` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (3920,0,'','21232f297a57a5a743894a0e4a801fc3','admin'),(3921,0,'','c240642ddef994358c96da82c0361a58','manager1'),(3922,0,'','8df5127cd164b5bc2d2b78410a7eea0c','manager2'),(3923,0,'','2d3a5db4a2a9717b43698520a8de57d0','manager3'),(3924,0,'','e1ec6fc941af3ba79a4ac5242dd39735','manager4'),(3925,0,'\0','029cb1d27c0b9c551703ccba2591c334','manager5'),(3926,0,'','8d2f089b195fc8ca1415db70968a461f','carrier1'),(3927,0,'','e9c83d20abca1fe451b73b6f74d9f411','carrier2'),(3928,0,'','8dee391cf2bfda3504283d0dc1af7a2e','carrier3'),(3929,0,'','cde726b4067344e0cf4228f72f213c19','carrier4'),(3930,0,'','447b827b64e3dbffe93784f27b09f112','carrier5'),(3931,0,'','9125428c3007c097eab9a4afd9b0167b','recycler1'),(3932,0,'','39024b6a5dafff9f862b3f72a02a4293','recycler2'),(3933,0,'','93ca7571542659a3378f0e05c34b438a','recycler3'),(3934,0,'','6e6ffd409bf417b2088be41af53b8f4f','recycler4'),(3935,0,'','709116e0126b66542e3d4089234d6422','recycler5'),(3936,0,'','c9330587565205a5b8345f60c620ecc6','editor1'),(3937,0,'','0a96c5e164b4f259b4b8f6f565b55fe2','editor2'),(3938,0,'','8ae4e8e6f68f3f6cb50817e40111abd6','editor3'),(3939,0,'','a05298fc2d0052a29953bf41945cc109','editor4'),(3940,0,'','dbdcd9bbf4c35245b19be25d60f51480','editor5'),(3941,0,'','5cbd9d629096842872fdc665d2d03ba3','buyer1'),(3942,0,'','ba71d29d4efdd8753c516db594fab6d8','buyer2'),(3943,0,'','3cb52c98f366dad959eb21181107c7a7','buyer3'),(3944,0,'','1757397eb4f922f8c89b65f08333a96f','buyer4'),(3945,0,'\0','adeeaf80af67860d2a1e966d61e61841','buyer5');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (3920,'ADMIN'),(3921,'MANAGER'),(3922,'MANAGER'),(3923,'MANAGER'),(3924,'MANAGER'),(3925,'MANAGER'),(3926,'CARRIER'),(3927,'CARRIER'),(3928,'CARRIER'),(3929,'CARRIER'),(3930,'CARRIER'),(3931,'RECYCLER'),(3932,'RECYCLER'),(3933,'RECYCLER'),(3934,'RECYCLER'),(3935,'RECYCLER'),(3936,'EDITOR'),(3937,'EDITOR'),(3938,'EDITOR'),(3939,'EDITOR'),(3940,'EDITOR'),(3941,'BUYER'),(3942,'BUYER'),(3943,'BUYER'),(3944,'BUYER'),(3945,'BUYER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-01 20:37:23
commit;