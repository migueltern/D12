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
INSERT INTO `admin` VALUES (31,0,'Adress admin 1','admin@acmenewspaper.com','admin 1','+34611111111','SEVILLA','surname admin 1',30);
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
INSERT INTO `configurationsystem` VALUES (44,0,'https://okdiario.com/img/2017/05/03/planeta-655x368.jpg','http://www.masciudadania.es/wp-content/uploads/2016/04/z-Banner.jpg',2,'There are people who make the world work better, let\'s make it work by reducing pollution and recycling.','Our company Acme-Recycler is located in the capital of Andalucia, specifically in the Spanish municipality of the province of Seville.','Nuestra empresa Acme-Recycler se encuentra ubicada en la capital de Andalucía, concretamente en el municipio español de la provincia de Sevilla.',40,'Acme-Recycling','Hay gente que hace que el mundo funcione mejor, hagamos que funcione reduciendo la contaminación y reciclando.','The organization that takes care of the environment through recycling and eco-design of packaging in Spain. We make it possible for plastic containers, cans, paperboard, and any object can have a second chance.','La organización que cuida del medio ambiente a través del reciclaje y el ecodiseño de los envases en España. Hacemos posible que los envases de plástico, latas, cartón, y cualquier objeto puedan tener una segunda oportunidad. ');
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
INSERT INTO `configurationsystem_legislation` VALUES (44,50),(44,51),(44,52),(44,53);
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
INSERT INTO `configurationsystem_tabooword` VALUES (44,45),(44,46),(44,47),(44,48);
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
  `startDate` date DEFAULT NULL,
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
INSERT INTO `labelmaterial` VALUES (32,0,'','Baterias'),(33,0,'','Vidrio');
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
INSERT INTO `labelproduct` VALUES (34,0,'','Aluminio'),(35,0,'','Cemento'),(36,0,'','Papel'),(37,0,'','Pilas y baterias'),(38,0,'','Plastico'),(39,0,'','Ordenador'),(40,0,'','Telefono'),(41,0,'','Textil'),(42,0,'','Vidrio'),(43,0,'','Otros');
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
INSERT INTO `legislation` VALUES (50,0,'body 1','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 1'),(51,0,'body 2','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 2'),(52,0,'body 3','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 3'),(53,0,'body 4','http://www.mpcambiental.com/MPCAmbiental-imagenes/MPC-NoticiasMPC201206-01.png','title 4');
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
INSERT INTO `messagefolder` VALUES (54,0,'\0','In box',31),(55,0,'\0','Out box',31),(56,0,'\0','Notification box',31),(57,0,'\0','Trash box',31),(58,0,'\0','Spam box',31);
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
INSERT INTO `tabooword` VALUES (45,0,'','sex'),(46,0,'','sexo'),(47,0,'','cialis'),(48,0,'','viagra'),(49,0,'\0','cialis 1');
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
INSERT INTO `useraccount` VALUES (30,0,'','21232f297a57a5a743894a0e4a801fc3','admin');
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
INSERT INTO `useraccount_authorities` VALUES (30,'ADMIN');
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

-- Dump completed on 2018-06-08  9:51:55
