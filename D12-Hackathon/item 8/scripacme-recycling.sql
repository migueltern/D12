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
  CONSTRAINT `FK_gfgqmtp2f9i5wsojt33xm0uth` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1426,0,'Adress admin 1','admin@acmenewspaper.com','admin 1','+34611111111','SEVILLA','surname admin 1',1400);
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
INSERT INTO `assesment` VALUES (1539,0,'description 2','2018-02-02',2),(1540,0,'description 3','2018-03-02',5);
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
INSERT INTO `buy` VALUES (1677,0,'comment buy 1','Brand name 1',123,'06','20','holder name 1','4388576018410707',8,1513),(1678,0,'comment buy 2','Brand name 2',123,'01','21','holder name 2','4388576018410707',2,1514),(1679,0,'comment buy 3','Brand name 3',614,'01','19','holder name 3','4388576018410707',3,1515),(1680,0,'comment buy 4','Brand name 4',614,'01','19','holder name 4','4388576018410707',4,1516),(1681,0,'comment buy 5','Brand name 5',614,'01','19','Agent1 holder name 5','4388576018410707',5,1517),(1682,0,'comment buy 6','Brand name 1',123,'06','20','holder name 1','4388576018410707',1,1513),(1683,0,'comment buy 7','Brand name 2',123,'01','21','holder name 2','4388576018410707',2,1513),(1684,0,'comment buy 8','Brand name 4',614,'01','19','holder name 4','4388576018410707',2,1514),(1685,0,'comment buy 9','Brand name 6',614,'01','19','Agent2 holder name 6','4388576018410707',9,1518);
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
INSERT INTO `buyer` VALUES (1447,1,'Adress buyer 1','buyer1@acmerecycling.com','buyer 1','+34666666666','ALMERIA','surname buyer 1',1421,1458),(1448,1,'Adress buyer 2','buyer2@acmerecycling.com','buyer 2','+34612666666','ALMERIA','surname buyer 2',1422,1459),(1449,1,'Adress buyer 3','buyer3@acmerecycling.com','buyer 3','+34136666666','GIRONA','surname buyer 3',1423,1460),(1450,1,'Adress buyer 4','buyer4@acmerecycling.com','buyer 4','+34614666666','BADAJOZ','surname buyer 4',1424,1461),(1451,1,'Adress buyer 5','buyer5@acmerecycling.com','buyer 5','+34615666666','CADIZ','surname buyer 5',1425,1462);
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
INSERT INTO `buyer_buy` VALUES (1447,1677),(1447,1685),(1448,1678),(1448,1679),(1450,1680),(1450,1683),(1451,1681),(1451,1682),(1451,1684);
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
INSERT INTO `buyer_course` VALUES (1447,1496),(1448,1497),(1448,1498),(1450,1499),(1451,1500);
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
  CONSTRAINT `FK_62tsjlw490ys898otivsrx4dx` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrier`
--

LOCK TABLES `carrier` WRITE;
/*!40000 ALTER TABLE `carrier` DISABLE KEYS */;
INSERT INTO `carrier` VALUES (1432,0,'Adress carrier 1','carrier1@acmerecycling.com','carrier 1','+34633333333','SEVILLA','surname carrier 1',1406),(1433,0,'Adress carrier 2','carrier2@acmerecycling.com','carrier 2','+34612333333','CADIZ','surname carrier 2',1407),(1434,0,'Adress carrier 3','carrier3@acmerecycling.com','carrier 3','+34613333333','HUELVA','surname carrier 3',1408),(1435,0,'Adress carrier 4','carrier4@acmerecycling.com','carrier 4','+34614333333','JAEN','surname carrier 4',1409),(1436,0,'Adress carrier 5','carrier5@acmerecycling.com','carrier 5','+34615333333','SEVILLA','surname carrier 5',1410);
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
INSERT INTO `cleanpoint` VALUES (1533,0,'ctra arahal-paradas',37.35,-5.98,'ubicacion 1','\0','+652582643','SEVILLA'),(1534,0,'address clean point 2',37.28,-5.49,'Ubicacion 2','\0','+654769645','HUELVA'),(1535,0,'address clean point 3',40.6,5.5,'Ubicacion 3','\0','+689354723','MALAGA'),(1536,0,'address clean point  4',41.34,2.09,'Ubicacion 4','','+7656573211','MALAGA'),(1537,0,'address clean point 5',43.65,7.08,'Ubicacion 5','\0','+676543234','ALMERIA'),(1538,0,'address clean point 6',34.65,5.08,'Ubicacion 6','','+676543255','HUESCA');
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
INSERT INTO `comment` VALUES (1488,0,'body 1','2018-01-02 13:31:00',NULL),(1489,0,'body 2','2018-02-02 12:31:00',NULL),(1490,0,'body 3','2018-01-02 13:31:00',NULL),(1491,0,'body 4','2018-04-02 14:31:00',NULL),(1492,0,'body 5','2018-05-02 15:31:00',NULL),(1493,0,'body 6','2018-05-06 15:31:00',1488),(1494,0,'body 7','2018-05-07 15:31:00',1488),(1495,0,'body 8','2018-05-08 15:31:00',1492);
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
INSERT INTO `configurationsystem` VALUES (1502,0,'https://okdiario.com/img/2017/05/03/planeta-655x368.jpg','http://www.masciudadania.es/wp-content/uploads/2016/04/z-Banner.jpg',2,'There are people who make the world work better, let\'s make it work by reducing pollution and recycling.','Our company Acme-Recycler is located in the capital of Andalucia, specifically in the Spanish municipality of the province of Seville.','Nuestra empresa Acme-Recycler se encuentra ubicada en la capital de Andalucía, concretamente en el municipio español de la provincia de Sevilla.',40,'Acme-Recycling','Hay gente que hace que el mundo funcione mejor, hagamos que funcione reduciendo la contaminación y reciclando.','The organization that takes care of the environment through recycling and eco-design of packaging in Spain. We make it possible for plastic containers, cans, paperboard, and any object can have a second chance.','La organización que cuida del medio ambiente a través del reciclaje y el ecodiseño de los envases en España. Hacemos posible que los envases de plástico, latas, cartón, y cualquier objeto puedan tener una segunda oportunidad. ');
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
INSERT INTO `configurationsystem_legislation` VALUES (1502,1509),(1502,1510),(1502,1511),(1502,1512);
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
INSERT INTO `configurationsystem_tabooword` VALUES (1502,1504),(1502,1505),(1502,1506),(1502,1507);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1496,0,'description course 1','\0',37.35,-5.98,'ubicacion 1',1,'http://cuellar7.com/wp-content/uploads/2014/09/Curso-2-Coca.jpg','2018-12-12','title course 1'),(1497,0,'description course 2','\0',37.28,-5.49,'Ubicacion 2',2,'https://spseguridad.files.wordpress.com/2013/05/curso_presencial1.jpg','2018-02-12','title course 2'),(1498,0,'description course 3','',40.6,5.5,'Ubicacion 3',3,'http://www.gsesoftware.com/wp-content/uploads/2017/02/LOGO-FORMACI%C3%93N-300x119.png','2018-12-13','title course 3'),(1499,0,'description course 4','\0',41.34,2.09,'Ubicacion 4',4,'https://www.panamaparaninos.com/image/cache/data/Eventos/Culturales/Mu%C3%B1ecosPapelMacheBibadabook_01-600x600.jpg','2018-04-12','title course 4'),(1500,0,'description course 5','\0',43.65,7.08,'Ubicacion 5',5,'http://metalurgico.integrando.unicen.edu.ar/wp-content/uploads/2012/11/Folleto-talleres-ReCICLADO-NUEVO.png','2018-12-15','title course 5'),(1501,0,'description course 6','\0',43.65,7.08,'Ubicacion 5',2,'http://metalurgico.integrando.unicen.edu.ar/wp-content/uploads/2012/11/Folleto-talleres-ReCICLADO-NUEVO.png','2018-11-01','title course 6');
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
INSERT INTO `course_material` VALUES (1496,1513),(1497,1514),(1498,1515),(1499,1516),(1500,1517),(1501,1518);
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
  CONSTRAINT `FK_n206xwfkcb9yc6xokpt7nil48` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor`
--

LOCK TABLES `editor` WRITE;
/*!40000 ALTER TABLE `editor` DISABLE KEYS */;
INSERT INTO `editor` VALUES (1427,0,'Adress editor 1','editor1@acmerecycling.com','editor 1','+34622222222','SEVILLA','surname editor 1',1416),(1428,0,'Adress editor 2','editor2@acmerecycling.com','editor 2','+34635222222','MADRID','surname editor 2',1417),(1429,0,'Adress editor 3','editor3@acmerecycling.com','editor 3','+34667222222','LUGO','surname editor 3',1418),(1430,0,'Adress editor 4','editor4@acmerecycling.com','editor 4','+34619222222','VALENCIA','surname editor 4',1419),(1431,0,'Adress editor 5','editor5@acmerecycling.com','editor 5','+34615222222','ZARAGOZA','surname editor 5',1420);
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
INSERT INTO `editor_newscast` VALUES (1427,1452),(1427,1453),(1429,1454),(1429,1457),(1430,1455),(1431,1456);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
INSERT INTO `finder` VALUES (1458,0,3.1,'sex',1,'2018-12-12 18:34:00'),(1459,0,3.1,'sex2',1,'2018-12-12 18:34:00'),(1460,0,3.1,'sex3',1,'2018-12-12 18:34:00'),(1461,0,3.1,'sex4',1,'2018-12-12 18:34:00'),(1462,0,3.1,'sex5',1,'2018-12-12 18:34:00');
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
INSERT INTO `finder_material` VALUES (1458,1513),(1458,1514),(1460,1515),(1461,1516),(1462,1517);
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
INSERT INTO `incidence` VALUES (1463,0,'comment incidence 1','2018-01-01 11:20:00','reason why 1','\0','title incidence 1 viagra',1442),(1464,0,'comment incidence 2','2018-02-02 12:20:00','reason why 2','','title incidence 2',1443),(1465,0,'comment incidence 3','2018-03-03 13:30:00','reason why 3','','title incidence 3',1444),(1466,0,'comment incidence 4','2018-04-04 14:40:00','reason why 4','\0','title incidence 4',1445),(1467,0,'comment incidence 5','2018-05-05 15:50:00','reason why 5','\0','title incidence 5',1446),(1468,0,'comment incidence 6','2018-05-01 19:20:00','reason why 6','','title incidence 6 sex',1445),(1469,0,'comment incidence 7','2018-02-22 21:20:00','reason why 7','','title incidence 7 sexo',1446);
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
INSERT INTO `item` VALUES (1686,0,'description item 1','https://pimientosytomates.files.wordpress.com/2009/08/lavadora-vieja.jpg','2018-01-12 12:12:00',23,'title item 1',16,1476,1442,1527),(1687,0,'description item 2','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSWZaE9DvgcQGN3ekP2yPWphBpe78dohdbXxsLnkGy7ed1QeQ4QA','2018-02-12 12:12:00',2,'title item 2',2,1476,1443,NULL),(1688,0,'description item 3','http://www.cafedelescritor.com/wp-content/uploads/libros-viejos.jpg','2018-03-12 12:12:00',3,'title item 3',3,1477,1444,1529),(1689,0,'description item 5','http://fotografias.lasexta.com/clipping/cmsimages01/2014/11/25/AE4222C6-A8BC-470C-BB56-73743D2FBD16/58.jpg','2018-05-12 15:12:00',5,'title item 5',5,1478,1446,1531),(1690,0,'description item 6','http://fotografias.lasexta.com/clipping/cmsimages01/2014/11/25/AE4222C6-A8BC-470C-BB56-73743D2FBD16/58.jpg','2018-05-12 15:12:00',5,'title item 6',5,1478,1446,1532),(1691,0,'description item 7','https://pimientosytomates.files.wordpress.com/2009/08/lavadora-vieja.jpg','2018-01-16 12:12:00',7,'title item 7',16,1476,1442,1528);
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
INSERT INTO `labelmaterial` VALUES (1470,0,'\0','Cobre'),(1471,0,'\0','Aluminio'),(1472,0,'\0','Bronce'),(1473,0,'\0','Aceite'),(1474,0,'','Baterias'),(1475,0,'','Vidrio');
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
INSERT INTO `labelproduct` VALUES (1476,0,'','Aluminio'),(1477,0,'','Cemento'),(1478,0,'','Papel'),(1479,0,'','Pilas y baterias'),(1480,0,'','Plastico'),(1481,0,'','Ordenador'),(1482,0,'','Telefono'),(1483,0,'','Textil'),(1484,0,'','Vidrio'),(1485,0,'','Otros'),(1486,0,'\0','Cables'),(1487,0,'\0','Tonner');
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
INSERT INTO `legislation` VALUES (1509,0,'body 1','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 1'),(1510,0,'body 2','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 2'),(1511,0,'body 3','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 3'),(1512,0,'body 4','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 4');
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
  KEY `FK_swxtnpbei5seidnpkvxyqph49` (`course_id`),
  CONSTRAINT `FK_swxtnpbei5seidnpkvxyqph49` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1541,0,11,'summary of lesson 1','title 1',1496),(1542,0,12,'summary of lesson 2','title 2',1497),(1543,0,13,'summary of lesson 3','title 3',1498),(1544,0,14,'summary of lesson 4','title 4',1499),(1545,0,15,'summary of lesson 5','title 5',1500),(1546,0,16,'summary of lesson 6','title 6',1496);
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
  CONSTRAINT `FK_84bmmxlq61tiaoc7dy7kdcghh` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1437,0,'Adress manager 1','manager1@acmerecycling.com','manager 1','+34644444444','SEVILLA','surname manager 1',1401),(1438,0,'Adress manager 2','manager2@acmerecycling.com','manager 2','+34612444444','PALENCIA','surname manager 2',1402),(1439,0,'Adress manager 3','manager3@acmerecycling.com','manager 3','+34613444444','CIUDAD REAL','surname manager 3',1403),(1440,0,'Adress manager 4','manager4@acmerecycling.com','manager 4','+34614444444','BARCELONA','surname manager 4',1404),(1441,0,'Adress manager 5','manager5@acmerecycling.com','manager 5','+34615444444','SEVILLA','surname manager 5',1405);
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
INSERT INTO `manager_incidence` VALUES (1437,1463),(1437,1464),(1439,1465),(1440,1466),(1441,1467);
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
INSERT INTO `manager_request` VALUES (1437,1527),(1439,1529),(1440,1530),(1441,1531);
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
  KEY `FK_tpq6xjbrtre04u39tqf803vh7` (`labelMaterial_id`),
  CONSTRAINT `FK_tpq6xjbrtre04u39tqf803vh7` FOREIGN KEY (`labelMaterial_id`) REFERENCES `labelmaterial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1513,0,'description 1',2.2,'material title 1',4.4,2,1470),(1514,0,'description 2',2.2,'material title 2',4.4,2,1470),(1515,0,'description 3',3.2,'material title 3',9.92,3.1,1471),(1516,0,'description 4',4.2,'material title 4',17.64,4.2,1471),(1517,0,'description 5',5.2,'material title 5',26,5,1472),(1518,0,'description 6',3.2,'material title 6',38.4,12,1472);
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
  KEY `FK_iq38mox9qghnx2rc8hpdtmros` (`messageFolder_id`),
  CONSTRAINT `FK_iq38mox9qghnx2rc8hpdtmros` FOREIGN KEY (`messageFolder_id`) REFERENCES `messagefolder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1692,0,'body 1','2017-10-01 15:20:00','HIGH','subject 1',1503,1426,1442);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagefolder`
--

LOCK TABLES `messagefolder` WRITE;
/*!40000 ALTER TABLE `messagefolder` DISABLE KEYS */;
INSERT INTO `messagefolder` VALUES (1503,0,'','folder 1',1442),(1547,0,'\0','In box',1442),(1548,0,'\0','Out box',1442),(1549,0,'\0','Notification box',1442),(1550,0,'\0','Trash box',1442),(1551,0,'\0','Spam box',1442),(1552,0,'\0','In box',1443),(1553,0,'\0','Out box',1443),(1554,0,'\0','Notification box',1443),(1555,0,'\0','Trash box',1443),(1556,0,'\0','Spam box',1443),(1557,0,'\0','In box',1444),(1558,0,'\0','Out box',1444),(1559,0,'\0','Notification box',1444),(1560,0,'\0','Trash box',1444),(1561,0,'\0','Spam box',1444),(1562,0,'\0','In box',1445),(1563,0,'\0','Out box',1445),(1564,0,'\0','Notification box',1445),(1565,0,'\0','Trash box',1445),(1566,0,'\0','Spam box',1445),(1567,0,'\0','In box',1446),(1568,0,'\0','Out box',1446),(1569,0,'\0','Notification box',1446),(1570,0,'\0','Trash box',1446),(1571,0,'\0','Spam box',1446),(1572,0,'\0','In box',1447),(1573,0,'\0','Out box',1447),(1574,0,'\0','Notification box',1447),(1575,0,'\0','Trash box',1447),(1576,0,'\0','Spam box',1447),(1577,0,'\0','In box',1448),(1578,0,'\0','Out box',1448),(1579,0,'\0','Notification box',1448),(1580,0,'\0','Trash box',1448),(1581,0,'\0','Spam box',1448),(1582,0,'\0','In box',1449),(1583,0,'\0','Out box',1449),(1584,0,'\0','Notification box',1449),(1585,0,'\0','Trash box',1449),(1586,0,'\0','Spam box',1449),(1587,0,'\0','In box',1450),(1588,0,'\0','Out box',1450),(1589,0,'\0','Notification box',1450),(1590,0,'\0','Trash box',1450),(1591,0,'\0','Spam box',1450),(1592,0,'\0','In box',1451),(1593,0,'\0','Out box',1451),(1594,0,'\0','Notification box',1451),(1595,0,'\0','Trash box',1451),(1596,0,'\0','Spam box',1451),(1597,0,'\0','In box',1437),(1598,0,'\0','Out box',1437),(1599,0,'\0','Notification box',1437),(1600,0,'\0','Trash box',1437),(1601,0,'\0','Spam box',1437),(1602,0,'\0','In box',1438),(1603,0,'\0','Out box',1438),(1604,0,'\0','Notification box',1438),(1605,0,'\0','Trash box',1438),(1606,0,'\0','Spam box',1438),(1607,0,'\0','In box',1439),(1608,0,'\0','Out box',1439),(1609,0,'\0','Notification box',1439),(1610,0,'\0','Trash box',1439),(1611,0,'\0','Spam box',1439),(1612,0,'\0','In box',1440),(1613,0,'\0','Out box',1440),(1614,0,'\0','Notification box',1440),(1615,0,'\0','Trash box',1440),(1616,0,'\0','Spam box',1440),(1617,0,'\0','In box',1441),(1618,0,'\0','Out box',1441),(1619,0,'\0','Notification box',1441),(1620,0,'\0','Trash box',1441),(1621,0,'\0','Spam box',1441),(1622,0,'\0','In box',1427),(1623,0,'\0','Out box',1427),(1624,0,'\0','Notification box',1427),(1625,0,'\0','Trash box',1427),(1626,0,'\0','Spam box',1427),(1627,0,'\0','In box',1428),(1628,0,'\0','Out box',1428),(1629,0,'\0','Notification box',1428),(1630,0,'\0','Trash box',1428),(1631,0,'\0','Spam box',1428),(1632,0,'\0','In box',1429),(1633,0,'\0','Out box',1429),(1634,0,'\0','Notification box',1429),(1635,0,'\0','Trash box',1429),(1636,0,'\0','Spam box',1429),(1637,0,'\0','In box',1430),(1638,0,'\0','Out box',1430),(1639,0,'\0','Notification box',1430),(1640,0,'\0','Trash box',1430),(1641,0,'\0','Spam box',1430),(1642,0,'\0','In box',1431),(1643,0,'\0','Out box',1431),(1644,0,'\0','Notification box',1431),(1645,0,'\0','Trash box',1431),(1646,0,'\0','Spam box',1431),(1647,0,'\0','In box',1432),(1648,0,'\0','Out box',1432),(1649,0,'\0','Notification box',1432),(1650,0,'\0','Trash box',1432),(1651,0,'\0','Spam box',1432),(1652,0,'\0','In box',1433),(1653,0,'\0','Out box',1433),(1654,0,'\0','Notification box',1433),(1655,0,'\0','Trash box',1433),(1656,0,'\0','Spam box',1433),(1657,0,'\0','In box',1434),(1658,0,'\0','Out box',1434),(1659,0,'\0','Notification box',1434),(1660,0,'\0','Trash box',1434),(1661,0,'\0','Spam box',1434),(1662,0,'\0','In box',1435),(1663,0,'\0','Out box',1435),(1664,0,'\0','Notification box',1435),(1665,0,'\0','Trash box',1435),(1666,0,'\0','Spam box',1435),(1667,0,'\0','In box',1436),(1668,0,'\0','Out box',1436),(1669,0,'\0','Notification box',1436),(1670,0,'\0','Trash box',1436),(1671,0,'\0','Spam box',1436),(1672,0,'\0','In box',1426),(1673,0,'\0','Out box',1426),(1674,0,'\0','Notification box',1426),(1675,0,'\0','Trash box',1426),(1676,0,'\0','Spam box',1426);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newscast`
--

LOCK TABLES `newscast` WRITE;
/*!40000 ALTER TABLE `newscast` DISABLE KEYS */;
INSERT INTO `newscast` VALUES (1452,0,'content new 1','2018-04-04 12:22:00','title new viagra 1'),(1453,0,'content new 2','2018-04-01 13:01:00','title new 2 viagra'),(1454,0,'content new 3','2018-04-03 13:33:00','title new 3'),(1455,0,'content new 4','2018-04-04 14:44:00','title new 4'),(1456,0,'content new 5','2018-04-05 15:55:00','title new 5'),(1457,0,'content new 6','2018-04-07 17:55:00','title new 6');
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
INSERT INTO `newscast_comment` VALUES (1452,1488),(1452,1489),(1452,1493),(1452,1494),(1454,1490),(1455,1491),(1456,1492),(1456,1495);
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
INSERT INTO `newscast_pictures` VALUES (1452,'http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png\n				'),(1452,'http://www.cantillana.es/opencms/export/sites/default/cantillana/galeriaInterior/noticias/Elreciclajetienesupunto.jpg\n				'),(1453,'http://www.rocianadelcondado.es/export/sites/rociana/.galleries/000126.jpg\n				'),(1454,'http://www.minambiente.gov.co/images/sala-de-prensa/imagenes-noticias/noticias_2015/diciembre/17-mayo-reciclaje.jpg\n				'),(1455,'http://www.jafcia.cl/wp-content/uploads/2016/11/noticia-1.jpg\n				'),(1456,'http://www.jafcia.cl/wp-content/uploads/2016/11/noticia-2.jpg\n				'),(1457,'http://www.jafcia.cl/wp-content/uploads/2016/11/noticia-2.jpg\n				');
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
INSERT INTO `opinable_opinion` VALUES (1686,1519),(1687,1520),(1688,1521),(1689,1523),(1498,1526);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinion`
--

LOCK TABLES `opinion` WRITE;
/*!40000 ALTER TABLE `opinion` DISABLE KEYS */;
INSERT INTO `opinion` VALUES (1519,0,'caption opinion 1','comment opinion 1','2018-03-04 00:00:00','http://slideplayer.es/slide/4019554/13/images/21/RECICLAJE+DE+PAPEL+GR%C3%81FICO+RESUMEN.jpg','title opinion 1',1442),(1520,0,'caption opinion 2','comment opinion 2','2018-02-04 00:00:00','http://vadecuentos.com/wp-content/uploads/2015/05/taller-infantil-creatividad-reciclaje-jueguetes-carton1.png','title opinion 2',1442),(1521,0,'caption opinion 3','comment opinion 3','2018-02-03 00:00:00','http://fece.org/wp-content/uploads/2016/12/materiales-reciclables-raee.jpg','title opinion 3',1444),(1522,0,'caption opinion 4','comment opinion 4','2018-04-04 00:00:00','https://culturaeinformacioninma.files.wordpress.com/2015/03/81dd0-por-qu25c325a9-reciclar.jpg','title opinion 4',1445),(1523,0,'caption opinion 5','comment opinion 5','2018-05-03 00:00:00','http://publicaciones.unicartagena.edu.co/images/catalogo/portadas/El-reciclaje-es-un-negocio-con-beneficio-economico-social-y-ambiental.jpg','title opinion 5',1446),(1524,0,'caption opinion  6','comment opinion 6','2018-03-03 00:00:00','http://publicaciones.unicartagena.edu.co/images/catalogo/portadas/El-reciclaje-es-un-negocio-con-beneficio-economico-social-y-ambiental.jpg','title opinion 6',1428),(1525,0,'caption opinon 7','comment opinion 7','2018-01-04 00:00:00','https://culturaeinformacioninma.files.wordpress.com/2015/03/81dd0-por-qu25c325a9-reciclar.jpg','title opinion 7',1428),(1526,0,'caption opinon 8','comment opinion 8','2018-01-04 00:00:00','https://culturaeinformacioninma.files.wordpress.com/2015/03/81dd0-por-qu25c325a9-reciclar.jpg','title opinion 8',1443);
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
  CONSTRAINT `FK_j9etl5bw3fdbgeunx12x8uslx` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recycler`
--

LOCK TABLES `recycler` WRITE;
/*!40000 ALTER TABLE `recycler` DISABLE KEYS */;
INSERT INTO `recycler` VALUES (1442,0,'Adress recycler 1','recycler1@acmerecycling.com','recycler 1','+34655555555','SEVILLA','surname recycler 1',1411),(1443,0,'Adress recycler 2','recycler2@acmerecycling.com','recycler 2','+34612555555','BILBAO','surname recycler 2',1412),(1444,0,'Adress recycler 3','recycler3@acmerecycling.com','recycler 3','+34613555555','GRANADA','surname recycler 3',1413),(1445,0,'Adress recycler 4','recycler4@acmerecycling.com','recycler 4','+34614555555','SEVILLA','surname recycler 4',1414),(1446,0,'Adress recycler 5','recycler5@acmerecycling.com','recycler 5','+34615555555','SEVILLA','surname recycler 5',1415);
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
INSERT INTO `recycler_comment` VALUES (1442,1488),(1442,1489),(1443,1493),(1443,1494),(1444,1490),(1444,1495),(1445,1491),(1446,1492);
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
INSERT INTO `recycler_course` VALUES (1442,1500),(1443,1498),(1444,1498);
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
  KEY `FK_e49ye2s4qr7xmbm5ietd056f5` (`assesment_id`),
  KEY `FK_h0j2w5l8lhry4fc3urybmt8q2` (`carrier_id`),
  CONSTRAINT `FK_h0j2w5l8lhry4fc3urybmt8q2` FOREIGN KEY (`carrier_id`) REFERENCES `carrier` (`id`),
  CONSTRAINT `FK_e49ye2s4qr7xmbm5ietd056f5` FOREIGN KEY (`assesment_id`) REFERENCES `assesment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1527,0,'DG180131DF','observation request 1','CLEAN POINT','title request 1',NULL,1432),(1528,1,'DG180231BB','observation request 2','FINISHED','title request 2',1539,1434),(1529,1,'DG180331CC','observation request 3','FINISHED','title request 3',1540,1434),(1530,0,'DG180431DD','observation request 4','IN COLLECTION','title request 4',NULL,1435),(1531,0,'DG180131EE','observation request 5','PENDING','title request 5',NULL,1436),(1532,0,'DG180731FF','observation request 6','CANCELLED','title request 6',NULL,1436);
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
INSERT INTO `request_cleanpoint` VALUES (1527,1533);
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
INSERT INTO `tabooword` VALUES (1504,0,'','sex'),(1505,0,'','sexo'),(1506,0,'','cialis'),(1507,0,'','viagra'),(1508,0,'\0','cialis 1');
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
INSERT INTO `useraccount` VALUES (1400,0,'','21232f297a57a5a743894a0e4a801fc3','admin'),(1401,0,'','c240642ddef994358c96da82c0361a58','manager1'),(1402,0,'','8df5127cd164b5bc2d2b78410a7eea0c','manager2'),(1403,0,'','2d3a5db4a2a9717b43698520a8de57d0','manager3'),(1404,0,'','e1ec6fc941af3ba79a4ac5242dd39735','manager4'),(1405,0,'\0','029cb1d27c0b9c551703ccba2591c334','manager5'),(1406,0,'','8d2f089b195fc8ca1415db70968a461f','carrier1'),(1407,0,'','e9c83d20abca1fe451b73b6f74d9f411','carrier2'),(1408,0,'','8dee391cf2bfda3504283d0dc1af7a2e','carrier3'),(1409,0,'','cde726b4067344e0cf4228f72f213c19','carrier4'),(1410,0,'','447b827b64e3dbffe93784f27b09f112','carrier5'),(1411,0,'','9125428c3007c097eab9a4afd9b0167b','recycler1'),(1412,0,'','39024b6a5dafff9f862b3f72a02a4293','recycler2'),(1413,0,'','93ca7571542659a3378f0e05c34b438a','recycler3'),(1414,0,'','6e6ffd409bf417b2088be41af53b8f4f','recycler4'),(1415,0,'','709116e0126b66542e3d4089234d6422','recycler5'),(1416,0,'','c9330587565205a5b8345f60c620ecc6','editor1'),(1417,0,'','0a96c5e164b4f259b4b8f6f565b55fe2','editor2'),(1418,0,'','8ae4e8e6f68f3f6cb50817e40111abd6','editor3'),(1419,0,'','a05298fc2d0052a29953bf41945cc109','editor4'),(1420,0,'\0','dbdcd9bbf4c35245b19be25d60f51480','editor5'),(1421,0,'','5cbd9d629096842872fdc665d2d03ba3','buyer1'),(1422,0,'','ba71d29d4efdd8753c516db594fab6d8','buyer2'),(1423,0,'','3cb52c98f366dad959eb21181107c7a7','buyer3'),(1424,0,'','1757397eb4f922f8c89b65f08333a96f','buyer4'),(1425,0,'\0','adeeaf80af67860d2a1e966d61e61841','buyer5');
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
INSERT INTO `useraccount_authorities` VALUES (1400,'ADMIN'),(1401,'MANAGER'),(1402,'MANAGER'),(1403,'MANAGER'),(1404,'MANAGER'),(1405,'MANAGER'),(1406,'CARRIER'),(1407,'CARRIER'),(1408,'CARRIER'),(1409,'CARRIER'),(1410,'CARRIER'),(1411,'RECYCLER'),(1412,'RECYCLER'),(1413,'RECYCLER'),(1414,'RECYCLER'),(1415,'RECYCLER'),(1416,'EDITOR'),(1417,'EDITOR'),(1418,'EDITOR'),(1419,'EDITOR'),(1420,'EDITOR'),(1421,'BUYER'),(1422,'BUYER'),(1423,'BUYER'),(1424,'BUYER'),(1425,'BUYER');
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

-- Dump completed on 2018-05-29 10:48:48
commit;