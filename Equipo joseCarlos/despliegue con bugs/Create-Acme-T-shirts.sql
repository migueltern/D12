start transaction;

create database `Acme-T-shirts`;

use `Acme-T-shirts`;

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';

create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';


grant select, insert, update, delete 
	on `Acme-T-shirts`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `Acme-T-shirts`.* to 'acme-manager'@'%';

-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-T-shirts
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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) NOT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (613,0,'Senda de la muerte 1','kratos@mail.com','Kratos','111111111','De Sparta','\0',597);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `accepted` bit(1) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `deal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5oddtxdjjelqow2j9son6rcgx` (`deal_id`),
  CONSTRAINT `FK_5oddtxdjjelqow2j9son6rcgx` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (700,0,'\0','Answer 1',697),(701,0,'','Answer 2',698);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `value` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `purchaseItem_id` int(11) DEFAULT NULL,
  `tshirt_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ow2jgayag1b7m6fvm2iqvg4k5` (`customer_id`),
  KEY `FK_1yli4enqjbea0ubsehrrqyfuy` (`purchaseItem_id`),
  KEY `FK_p4i2l8qyq6meg0ym8i8kblj35` (`tshirt_id`),
  CONSTRAINT `FK_p4i2l8qyq6meg0ym8i8kblj35` FOREIGN KEY (`tshirt_id`) REFERENCES `tshirt` (`id`),
  CONSTRAINT `FK_1yli4enqjbea0ubsehrrqyfuy` FOREIGN KEY (`purchaseItem_id`) REFERENCES `purchaseitem` (`id`),
  CONSTRAINT `FK_ow2jgayag1b7m6fvm2iqvg4k5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (665,0,'Assessment 1 Comment',4,614,NULL,663),(666,0,'Assessment 2 Comment',2,614,NULL,664),(667,0,'Assessment 3 Comment',1,615,NULL,664),(668,0,'Assessment 4 Comment',2,616,NULL,664);
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `categoryFather_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hjsgruldp9nngx9mhyqubl3l5` (`categoryFather_id`),
  CONSTRAINT `FK_hjsgruldp9nngx9mhyqubl3l5` FOREIGN KEY (`categoryFather_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (644,0,'Category Description 1','3D',NULL),(645,0,'Category Description 2','Abstract',NULL),(646,0,'Category Description 3','Anime',NULL),(647,0,'Category Description 4','Cartoon',NULL),(648,0,'Category Description 4','Cell Shading',NULL),(649,0,'Category Description 4','Realism',NULL),(650,0,'Category Description 4','Retro',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `maxDesignerBenefit` double NOT NULL,
  `minDesignerBenefit` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (792,0,20,1.5);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_materials`
--

DROP TABLE IF EXISTS `configuration_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_materials` (
  `Configuration_id` int(11) NOT NULL,
  `materials` varchar(255) DEFAULT NULL,
  KEY `FK_nnovxgx74n3tvs6lg61gc29ii` (`Configuration_id`),
  CONSTRAINT `FK_nnovxgx74n3tvs6lg61gc29ii` FOREIGN KEY (`Configuration_id`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_materials`
--

LOCK TABLES `configuration_materials` WRITE;
/*!40000 ALTER TABLE `configuration_materials` DISABLE KEYS */;
INSERT INTO `configuration_materials` VALUES (792,'Broadcloth'),(792,'Twill'),(792,'Chambray'),(792,'Denim'),(792,'Flannel'),(792,'Melange'),(792,'Herringbone'),(792,'Poplin'),(792,'Seersucker'),(792,'Linen');
/*!40000 ALTER TABLE `configuration_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_spamwords`
--

DROP TABLE IF EXISTS `configuration_spamwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_spamwords` (
  `Configuration_id` int(11) NOT NULL,
  `spamWords` varchar(255) DEFAULT NULL,
  KEY `FK_71ono8c3475iofflg3gestqeq` (`Configuration_id`),
  CONSTRAINT `FK_71ono8c3475iofflg3gestqeq` FOREIGN KEY (`Configuration_id`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_spamwords`
--

LOCK TABLES `configuration_spamwords` WRITE;
/*!40000 ALTER TABLE `configuration_spamwords` DISABLE KEYS */;
INSERT INTO `configuration_spamwords` VALUES (792,'Cialis'),(792,'Sex'),(792,'Sexo'),(792,'Viagra');
/*!40000 ALTER TABLE `configuration_spamwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) NOT NULL,
  `userAccount_id` int(11) NOT NULL,
  `pocket` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pwmktpkay2yx7v00mrwmuscl8` (`userAccount_id`),
  CONSTRAINT `FK_pwmktpkay2yx7v00mrwmuscl8` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (614,0,'Customer Address 1','customer1@mail.com','Customer Name 1','111111111','Customer Surname 1','\0',598,100),(615,0,'Customer Address 2','customer2@mail.com','Customer Name 2','111111112','Customer Surname 2','',599,200),(616,0,'Customer Address 3','customer3@mail.com','Customer Name 3','111111113','Customer Surname 3','\0',600,100);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal`
--

DROP TABLE IF EXISTS `deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deal` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `percentage` double NOT NULL,
  `sponsoredImage` varchar(255) DEFAULT NULL,
  `sponsor_id` int(11) NOT NULL,
  `tshirt_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_csud8xkeagovsr3cyuml6qm5t` (`sponsor_id`),
  KEY `FK_q7tw5f004a692u6k8b6knlfeo` (`tshirt_id`),
  CONSTRAINT `FK_q7tw5f004a692u6k8b6knlfeo` FOREIGN KEY (`tshirt_id`) REFERENCES `tshirt` (`id`),
  CONSTRAINT `FK_csud8xkeagovsr3cyuml6qm5t` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal`
--

LOCK TABLES `deal` WRITE;
/*!40000 ALTER TABLE `deal` DISABLE KEYS */;
INSERT INTO `deal` VALUES (697,0,'Comment Deal 1',10,'http://www.connexionpyc.com/images/nike_logo11.jpg',620,662),(698,0,'Comment Deal 2',20,'http://www.publicidadeuskadi.com/img/2013/03/rollingstonestonguelogo.jpg',620,663),(699,0,'Comment Deal 3',30,'https://adscreative.files.wordpress.com/2008/10/pepsi.jpg',620,663);
/*!40000 ALTER TABLE `deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design`
--

DROP TABLE IF EXISTS `design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `benefit` double NOT NULL,
  `benefits` double NOT NULL,
  `date` date DEFAULT NULL,
  `draft` bit(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `designer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1kwljhqm9fjwn828vvvvxrr4i` (`category_id`),
  KEY `FK_i3fkol6juagnwa1nv0nmhdco3` (`designer_id`),
  CONSTRAINT `FK_i3fkol6juagnwa1nv0nmhdco3` FOREIGN KEY (`designer_id`) REFERENCES `designer` (`id`),
  CONSTRAINT `FK_1kwljhqm9fjwn828vvvvxrr4i` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design`
--

LOCK TABLES `design` WRITE;
/*!40000 ALTER TABLE `design` DISABLE KEYS */;
INSERT INTO `design` VALUES (651,0,10,100,'2018-04-11','\0','https://orig00.deviantart.net/92f0/f/2008/101/b/0/b0a2f1700b270740.jpg',644,623),(652,0,20,200,'2018-02-11','\0','https://img00.deviantart.net/b332/i/2012/236/9/1/war_and_peace_by_jinzilla-d2pqjzc.jpg',645,624),(653,0,10,100,'2018-03-22','\0','https://orig00.deviantart.net/386d/f/2013/188/f/7/blowout2_by_falvie-d6cdf0z.png',646,624),(654,0,40,400,'2017-04-11','\0','https://orig00.deviantart.net/e15a/f/2007/012/c/e/un_gato__by_faboarts.jpg',646,625),(655,0,50,100,'2018-05-08','','https://img00.deviantart.net/93ea/i/2014/198/f/5/loss_by_imaginary_wolf-d7r3116.jpg',647,625),(656,0,60,120,'2018-05-20','\0','https://pre00.deviantart.net/bca9/th/pre/i/2018/130/5/2/weekly_portrait_study_by_rei_kaa-dcb71te.jpg',649,625);
/*!40000 ALTER TABLE `design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designclass`
--

DROP TABLE IF EXISTS `designclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designclass` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prize` double NOT NULL,
  `designer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_va4o5uw4jdfmoyjncwkg6xqf` (`designer_id`),
  CONSTRAINT `FK_va4o5uw4jdfmoyjncwkg6xqf` FOREIGN KEY (`designer_id`) REFERENCES `designer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designclass`
--

LOCK TABLES `designclass` WRITE;
/*!40000 ALTER TABLE `designclass` DISABLE KEYS */;
INSERT INTO `designclass` VALUES (675,0,'2018-11-16 00:00:00','Desing Class 1',10,623),(676,0,'2018-11-16 00:00:00','Desing Class 2',12,624),(677,0,'2018-10-16 00:00:00','Desing Class 3',1200,625),(678,0,'2018-09-16 00:00:00','Desing Class 4',100,625);
/*!40000 ALTER TABLE `designclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designclass_customer`
--

DROP TABLE IF EXISTS `designclass_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designclass_customer` (
  `designClasses_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  KEY `FK_89ddgl4dq0r14fk5l39hj9isp` (`customers_id`),
  KEY `FK_64awhxwg9uqdujngri5ojgxuq` (`designClasses_id`),
  CONSTRAINT `FK_64awhxwg9uqdujngri5ojgxuq` FOREIGN KEY (`designClasses_id`) REFERENCES `designclass` (`id`),
  CONSTRAINT `FK_89ddgl4dq0r14fk5l39hj9isp` FOREIGN KEY (`customers_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designclass_customer`
--

LOCK TABLES `designclass_customer` WRITE;
/*!40000 ALTER TABLE `designclass_customer` DISABLE KEYS */;
INSERT INTO `designclass_customer` VALUES (676,614),(676,615),(676,616),(677,614);
/*!40000 ALTER TABLE `designclass_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designclass_designer`
--

DROP TABLE IF EXISTS `designclass_designer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designclass_designer` (
  `DesignClass_id` int(11) NOT NULL,
  `designers_id` int(11) NOT NULL,
  KEY `FK_2mmp07pss5d1g4aq1du1bh0hq` (`designers_id`),
  KEY `FK_aasl7dt5901v8rdwjupgy2i12` (`DesignClass_id`),
  CONSTRAINT `FK_aasl7dt5901v8rdwjupgy2i12` FOREIGN KEY (`DesignClass_id`) REFERENCES `designclass` (`id`),
  CONSTRAINT `FK_2mmp07pss5d1g4aq1du1bh0hq` FOREIGN KEY (`designers_id`) REFERENCES `designer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designclass_designer`
--

LOCK TABLES `designclass_designer` WRITE;
/*!40000 ALTER TABLE `designclass_designer` DISABLE KEYS */;
INSERT INTO `designclass_designer` VALUES (675,624),(677,624);
/*!40000 ALTER TABLE `designclass_designer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designclass_materials`
--

DROP TABLE IF EXISTS `designclass_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designclass_materials` (
  `DesignClass_id` int(11) NOT NULL,
  `materials` varchar(255) DEFAULT NULL,
  KEY `FK_6174u345hfut6pf1kt7vh3yyj` (`DesignClass_id`),
  CONSTRAINT `FK_6174u345hfut6pf1kt7vh3yyj` FOREIGN KEY (`DesignClass_id`) REFERENCES `designclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designclass_materials`
--

LOCK TABLES `designclass_materials` WRITE;
/*!40000 ALTER TABLE `designclass_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `designclass_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designer`
--

DROP TABLE IF EXISTS `designer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) NOT NULL,
  `userAccount_id` int(11) NOT NULL,
  `pocket` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_d2iyxek3w4ay350xbxs79jhex` (`userAccount_id`),
  CONSTRAINT `FK_d2iyxek3w4ay350xbxs79jhex` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designer`
--

LOCK TABLES `designer` WRITE;
/*!40000 ALTER TABLE `designer` DISABLE KEYS */;
INSERT INTO `designer` VALUES (623,0,'Designer Address 1','designer1@mail.com','Designer Name 1','111111122','Designer Surname 1','\0',610,100),(624,0,'Designer Address 2','designer2@mail.com','Designer Name 2','111111123','Designer Surname 2','',611,200),(625,0,'Designer Address 3','designer3@mail.com','Designer Name 3','111111123','Designer Surname 3','\0',612,100);
/*!40000 ALTER TABLE `designer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designer_customer`
--

DROP TABLE IF EXISTS `designer_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designer_customer` (
  `designers_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  KEY `FK_nd5s76whrm54isfxxneyvd648` (`customers_id`),
  KEY `FK_86qi7pbja5xvc5ytvlqhergb0` (`designers_id`),
  CONSTRAINT `FK_86qi7pbja5xvc5ytvlqhergb0` FOREIGN KEY (`designers_id`) REFERENCES `designer` (`id`),
  CONSTRAINT `FK_nd5s76whrm54isfxxneyvd648` FOREIGN KEY (`customers_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designer_customer`
--

LOCK TABLES `designer_customer` WRITE;
/*!40000 ALTER TABLE `designer_customer` DISABLE KEYS */;
INSERT INTO `designer_customer` VALUES (623,614),(624,615),(624,616),(625,614),(625,615);
/*!40000 ALTER TABLE `designer_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilities`
--

DROP TABLE IF EXISTS `disponibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disponibilities` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_he2d24u1om1hhcqfki8riwpkg` (`producer_id`),
  CONSTRAINT `FK_he2d24u1om1hhcqfki8riwpkg` FOREIGN KEY (`producer_id`) REFERENCES `producer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilities`
--

LOCK TABLES `disponibilities` WRITE;
/*!40000 ALTER TABLE `disponibilities` DISABLE KEYS */;
INSERT INTO `disponibilities` VALUES (679,0,'#FFFFFF','Cotton',100,617),(680,0,'#FF00FF','Broadcloth',200,618),(681,0,'#00FF00','Pippon',300,618),(682,0,'#000000','Cotton',400,619),(683,0,'#0000FF','Pippon',500,619),(684,0,'#00FFFF','Twill',600,619);
/*!40000 ALTER TABLE `disponibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favouritelist`
--

DROP TABLE IF EXISTS `favouritelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favouritelist` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a4rjmylx3r740yvws933m7rfx` (`customer_id`),
  CONSTRAINT `FK_a4rjmylx3r740yvws933m7rfx` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favouritelist`
--

LOCK TABLES `favouritelist` WRITE;
/*!40000 ALTER TABLE `favouritelist` DISABLE KEYS */;
INSERT INTO `favouritelist` VALUES (669,0,'Description Favourite List 1','Name Favourite List 1',614),(670,0,'Description Favourite List 2','Name Favourite List 2',615),(671,0,'Description Favourite List 3','Name Favourite List 3',616);
/*!40000 ALTER TABLE `favouritelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favouritelist_tshirt`
--

DROP TABLE IF EXISTS `favouritelist_tshirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favouritelist_tshirt` (
  `favouriteLists_id` int(11) NOT NULL,
  `tshirts_id` int(11) NOT NULL,
  KEY `FK_2jvx6ulc15is55d00vcourglp` (`tshirts_id`),
  KEY `FK_jpusdea7429nh2bj1ekrfjx5v` (`favouriteLists_id`),
  CONSTRAINT `FK_jpusdea7429nh2bj1ekrfjx5v` FOREIGN KEY (`favouriteLists_id`) REFERENCES `favouritelist` (`id`),
  CONSTRAINT `FK_2jvx6ulc15is55d00vcourglp` FOREIGN KEY (`tshirts_id`) REFERENCES `tshirt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favouritelist_tshirt`
--

LOCK TABLES `favouritelist_tshirt` WRITE;
/*!40000 ALTER TABLE `favouritelist_tshirt` DISABLE KEYS */;
INSERT INTO `favouritelist_tshirt` VALUES (669,662),(670,663),(671,662),(671,663);
/*!40000 ALTER TABLE `favouritelist_tshirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `modifiable` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (702,0,'\0','in box',613),(703,0,'\0','out box',613),(704,0,'\0','trash box',613),(705,0,'\0','spam box',613),(706,0,'\0','notification box',613),(707,0,'\0','in box',617),(708,0,'\0','out box',617),(709,0,'\0','trash box',617),(710,0,'\0','spam box',617),(711,0,'\0','notification box',617),(712,0,'\0','in box',626),(713,0,'\0','out box',626),(714,0,'\0','trash box',626),(715,0,'\0','spam box',626),(716,0,'\0','notification box',626),(717,0,'\0','in box',623),(718,0,'\0','out box',623),(719,0,'\0','trash box',623),(720,0,'\0','spam box',623),(721,0,'\0','notification box',623),(722,0,'\0','in box',614),(723,0,'\0','out box',614),(724,0,'\0','trash box',614),(725,0,'\0','spam box',614),(726,0,'\0','notification box',614),(727,0,'\0','in box',615),(728,0,'\0','out box',615),(729,0,'\0','trash box',615),(730,0,'\0','spam box',615),(731,0,'\0','notification box',615),(732,0,'\0','in box',616),(733,0,'\0','out box',616),(734,0,'\0','trash box',616),(735,0,'\0','spam box',616),(736,0,'\0','notification box',616),(737,0,'\0','in box',620),(738,0,'\0','out box',620),(739,0,'\0','trash box',620),(740,0,'\0','spam box',620),(741,0,'\0','notification box',620),(742,0,'\0','in box',621),(743,0,'\0','out box',621),(744,0,'\0','trash box',621),(745,0,'\0','spam box',621),(746,0,'\0','notification box',621),(747,0,'\0','in box',622),(748,0,'\0','out box',622),(749,0,'\0','trash box',622),(750,0,'\0','spam box',622),(751,0,'\0','notification box',622),(752,0,'\0','in box',622),(753,0,'\0','out box',622),(754,0,'\0','trash box',622),(755,0,'\0','spam box',622),(756,0,'\0','notification box',622),(757,0,'\0','in box',622),(758,0,'\0','out box',622),(759,0,'\0','trash box',622),(760,0,'\0','spam box',622),(761,0,'\0','notification box',622),(762,0,'\0','in box',627),(763,0,'\0','out box',627),(764,0,'\0','trash box',627),(765,0,'\0','spam box',627),(766,0,'\0','notification box',627),(767,0,'\0','in box',628),(768,0,'\0','out box',628),(769,0,'\0','trash box',628),(770,0,'\0','spam box',628),(771,0,'\0','notification box',628),(772,0,'\0','in box',618),(773,0,'\0','out box',618),(774,0,'\0','trash box',618),(775,0,'\0','spam box',618),(776,0,'\0','notification box',618),(777,0,'\0','in box',619),(778,0,'\0','out box',619),(779,0,'\0','trash box',619),(780,0,'\0','spam box',619),(781,0,'\0','notification box',619),(782,0,'\0','notification box',624),(783,0,'\0','in box',624),(784,0,'\0','out box',624),(785,0,'\0','trash box',624),(786,0,'\0','spam box',624),(787,0,'\0','in box',625),(788,0,'\0','out box',625),(789,0,'\0','trash box',625),(790,0,'\0','spam box',625),(791,0,'\0','notification box',625);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
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
-- Table structure for table `mesage`
--

DROP TABLE IF EXISTS `mesage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesage` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `folder_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a5oo9jyvvg4wrc8esqpvtramk` (`folder_id`),
  CONSTRAINT `FK_a5oo9jyvvg4wrc8esqpvtramk` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesage`
--

LOCK TABLES `mesage` WRITE;
/*!40000 ALTER TABLE `mesage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneymovement`
--

DROP TABLE IF EXISTS `moneymovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneymovement` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `CVV` int(11) NOT NULL,
  `amount` double NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expirationMonth` int(11) NOT NULL,
  `expirationYear` int(11) NOT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneymovement`
--

LOCK TABLES `moneymovement` WRITE;
/*!40000 ALTER TABLE `moneymovement` DISABLE KEYS */;
INSERT INTO `moneymovement` VALUES (629,0,450,100,'VISA','2018-04-11 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',614),(630,0,450,200,'VISA','2018-11-06 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',615),(631,0,450,100,'VISA','2018-11-03 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',616),(632,0,450,100,'VISA','2018-04-11 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',620),(633,0,450,200,'VISA','2018-11-06 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',621),(634,0,450,100,'VISA','2018-11-03 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',622),(635,0,450,100,'VISA','2018-04-11 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',626),(636,0,450,200,'VISA','2018-11-06 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',627),(637,0,450,100,'VISA','2018-11-03 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',628),(638,0,450,100,'VISA','2018-04-11 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',623),(639,0,450,200,'VISA','2018-11-06 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',624),(640,0,450,100,'VISA','2018-11-03 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',625),(641,0,450,100,'VISA','2018-04-11 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',617),(642,0,450,200,'VISA','2018-11-06 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',618),(643,0,450,200,'VISA','2018-11-06 00:00:00','Money Added',2,2020,'Phaidros Randi','4000990618525905',619);
/*!40000 ALTER TABLE `moneymovement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) NOT NULL,
  `userAccount_id` int(11) NOT NULL,
  `pocket` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bi369mmiqqm7ho04vvmodqpef` (`userAccount_id`),
  CONSTRAINT `FK_bi369mmiqqm7ho04vvmodqpef` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (617,0,'Producer Address 1','producer1@mail.com','Producer Name 1','111111114','Producer Surname 1','\0',601,100),(618,0,'Producer Address 2','producer2@mail.com','Producer Name 2','111111115','Producer Surname 2','',602,200),(619,0,'Producer Address 3','producer3@mail.com','Producer Name 3','111111116','Producer Surname 3','\0',603,200);
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `prize` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_eaggubqxk4ldbhurh68cdakhi` (`customer_id`),
  CONSTRAINT `FK_eaggubqxk4ldbhurh68cdakhi` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (672,0,'2018-01-03 00:00:00',10,615),(673,0,'2018-01-02 00:00:00',20,615),(674,0,'2018-02-02 00:00:00',20,616);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseitem`
--

DROP TABLE IF EXISTS `purchaseitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseitem` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `prize` double NOT NULL,
  `shipment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `disponibilities_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `tshirt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5r8jkc7iwrttrij6yjk5q5980` (`disponibilities_id`),
  KEY `FK_s6sui4qxdg378tsyqpuftm7df` (`purchase_id`),
  KEY `FK_jrkvkhw2glgn93bd9uc0vf27o` (`tshirt_id`),
  CONSTRAINT `FK_jrkvkhw2glgn93bd9uc0vf27o` FOREIGN KEY (`tshirt_id`) REFERENCES `tshirt` (`id`),
  CONSTRAINT `FK_5r8jkc7iwrttrij6yjk5q5980` FOREIGN KEY (`disponibilities_id`) REFERENCES `disponibilities` (`id`),
  CONSTRAINT `FK_s6sui4qxdg378tsyqpuftm7df` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseitem`
--

LOCK TABLES `purchaseitem` WRITE;
/*!40000 ALTER TABLE `purchaseitem` DISABLE KEYS */;
INSERT INTO `purchaseitem` VALUES (793,0,'Purchase Item 1 Description',10,NULL,'GENERATED PETITION','Purchase Item 1 Title',681,672,662),(794,0,'Purchase Item 2 Description',20,'2018-02-12 00:00:00','SENT','Purchase Item 2 Title',680,673,663),(795,0,'Purchase Item 3 Description',20,'2018-02-13 00:00:00','OPEN INCIDENCE','Purchase Item 3 Title',684,674,664),(796,0,'Purchase Item 4 Description',20,'2018-02-12 00:00:00','SENT','Purchase Item 4 Title',679,673,663);
/*!40000 ALTER TABLE `purchaseitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cause` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `purchaseItem_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_raobdg9h2mwbwevdhmnxeetle` (`purchaseItem_id`),
  CONSTRAINT `FK_raobdg9h2mwbwevdhmnxeetle` FOREIGN KEY (`purchaseItem_id`) REFERENCES `purchaseitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (797,0,'Refund 3 Cause','2018-03-15 00:00:00','PENDING',795);
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_images`
--

DROP TABLE IF EXISTS `refund_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_images` (
  `Refund_id` int(11) NOT NULL,
  `images` varchar(255) DEFAULT NULL,
  KEY `FK_2aa37uavlbvhhgikogtcu7lkb` (`Refund_id`),
  CONSTRAINT `FK_2aa37uavlbvhhgikogtcu7lkb` FOREIGN KEY (`Refund_id`) REFERENCES `refund` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_images`
--

LOCK TABLES `refund_images` WRITE;
/*!40000 ALTER TABLE `refund_images` DISABLE KEYS */;
INSERT INTO `refund_images` VALUES (797,'https://grupobillingham.com/images/ff/70/432686d23b3914726cbe4daccc23/610-460-3/camiseta-100-algodon-hecom-135-barata-naranja.jpg\n				');
/*!40000 ALTER TABLE `refund_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `draftMode` bit(1) NOT NULL,
  `opinion` varchar(255) DEFAULT NULL,
  `design_id` int(11) DEFAULT NULL,
  `reporter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_37k780rxnykqkvx1t6ge5jx66` (`design_id`),
  KEY `FK_krxwe3tcmhy6nt65pp5b2c27r` (`reporter_id`),
  CONSTRAINT `FK_krxwe3tcmhy6nt65pp5b2c27r` FOREIGN KEY (`reporter_id`) REFERENCES `reporter` (`id`),
  CONSTRAINT `FK_37k780rxnykqkvx1t6ge5jx66` FOREIGN KEY (`design_id`) REFERENCES `design` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (685,0,'2018-03-02 00:00:00','\0','Opinion Report 1',652,626),(686,0,'2018-03-01 00:00:00','\0','Opinion Report 2',652,627),(687,0,'2018-03-01 00:00:00','\0','Opinion Report 3',653,627),(688,0,'2018-03-01 00:00:00','','Opinion Report 4',651,628),(689,0,'2018-03-01 00:00:00','','Opinion Report 5',652,628),(690,0,'2018-03-01 00:00:00','','Opinion Report 5',653,628);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporter`
--

DROP TABLE IF EXISTS `reporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporter` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) NOT NULL,
  `userAccount_id` int(11) NOT NULL,
  `pocket` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_t0u5ulcrr22aump7f2f8j3abu` (`userAccount_id`),
  CONSTRAINT `FK_t0u5ulcrr22aump7f2f8j3abu` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporter`
--

LOCK TABLES `reporter` WRITE;
/*!40000 ALTER TABLE `reporter` DISABLE KEYS */;
INSERT INTO `reporter` VALUES (626,0,'Reporter Address 1','reporter1@mail.com','Reporter Name 1','111111124','Reporter Surname 1','\0',607,100),(627,0,'Reporter Address 2','reporter2@mail.com','Reporter Name 2','111111125','Reporter Surname 2','',608,200),(628,0,'Reporter Address 3','reporter3@mail.com','Reporter Name 3','111111126','Reporter Surname 3','\0',609,100);
/*!40000 ALTER TABLE `reporter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcartitem`
--

DROP TABLE IF EXISTS `shoppingcartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcartitem` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `disponibilities_id` int(11) DEFAULT NULL,
  `tshirt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qgp984hy3qkqkyr4n1hbl4mol` (`customer_id`),
  KEY `FK_2j1tbb28af5ywrm64afxx9tc9` (`disponibilities_id`),
  KEY `FK_nkgei78ivu8ia1695tu4s72qh` (`tshirt_id`),
  CONSTRAINT `FK_nkgei78ivu8ia1695tu4s72qh` FOREIGN KEY (`tshirt_id`) REFERENCES `tshirt` (`id`),
  CONSTRAINT `FK_2j1tbb28af5ywrm64afxx9tc9` FOREIGN KEY (`disponibilities_id`) REFERENCES `disponibilities` (`id`),
  CONSTRAINT `FK_qgp984hy3qkqkyr4n1hbl4mol` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcartitem`
--

LOCK TABLES `shoppingcartitem` WRITE;
/*!40000 ALTER TABLE `shoppingcartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) NOT NULL,
  `userAccount_id` int(11) NOT NULL,
  `pocket` double NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_okfx8h0cn4eidh8ng563vowjc` (`userAccount_id`),
  CONSTRAINT `FK_okfx8h0cn4eidh8ng563vowjc` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (620,0,'Sponsor Address 1','sponsor1@mail.com','Sponsor Name 1','111111117','Sponsor Surname 1','\0',604,100,'Sponsor Brand 1'),(621,0,'Sponsor Address 2','sponsor2@mail.com','Sponsor Name 2','111111118','Sponsor Surname 2','',605,200,'Sponsor Brand 2'),(622,0,'Sponsor Address 3','sponsor3@mail.com','Sponsor Name 3','111111119','Sponsor Surname 3','\0',606,100,'Sponsor Brand 3');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshirt`
--

DROP TABLE IF EXISTS `tshirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tshirt` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount` double NOT NULL,
  `prize` double NOT NULL,
  `shipmentCost` double NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `deal_id` int(11) DEFAULT NULL,
  `design_id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ejpfddl9aw81wo6h2owmynbwa` (`deal_id`),
  KEY `FK_cpapwinro5n36d7sjn3r297iy` (`design_id`),
  KEY `FK_b8nuysk2cei0u2vohji2syerk` (`producer_id`),
  CONSTRAINT `FK_b8nuysk2cei0u2vohji2syerk` FOREIGN KEY (`producer_id`) REFERENCES `producer` (`id`),
  CONSTRAINT `FK_cpapwinro5n36d7sjn3r297iy` FOREIGN KEY (`design_id`) REFERENCES `design` (`id`),
  CONSTRAINT `FK_ejpfddl9aw81wo6h2owmynbwa` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshirt`
--

LOCK TABLES `tshirt` WRITE;
/*!40000 ALTER TABLE `tshirt` DISABLE KEYS */;
INSERT INTO `tshirt` VALUES (662,1,'\0','T-Shirt Description 1',4,12,2,'T-Shirt Title 1',697,651,618),(663,0,'\0','T-Shirt Description 2',20,20,0,'T-Shirt Title 2',NULL,652,618),(664,0,'\0','T-Shirt Description 3',4.5,35,10,'T-Shirt Title 3',NULL,653,619);
/*!40000 ALTER TABLE `tshirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshirt_customer`
--

DROP TABLE IF EXISTS `tshirt_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tshirt_customer` (
  `Tshirt_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  KEY `FK_b0k1puosxca3ibe7gj95ddl0h` (`customers_id`),
  KEY `FK_i3kmxskqbi2lb8k26730y08we` (`Tshirt_id`),
  CONSTRAINT `FK_i3kmxskqbi2lb8k26730y08we` FOREIGN KEY (`Tshirt_id`) REFERENCES `tshirt` (`id`),
  CONSTRAINT `FK_b0k1puosxca3ibe7gj95ddl0h` FOREIGN KEY (`customers_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshirt_customer`
--

LOCK TABLES `tshirt_customer` WRITE;
/*!40000 ALTER TABLE `tshirt_customer` DISABLE KEYS */;
INSERT INTO `tshirt_customer` VALUES (662,614),(662,614),(663,615),(663,616),(664,616);
/*!40000 ALTER TABLE `tshirt_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_date`
--

DROP TABLE IF EXISTS `up_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_date` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `dateUpdate` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `report_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g559g48n6ylasig252qafhyxu` (`report_id`),
  CONSTRAINT `FK_g559g48n6ylasig252qafhyxu` FOREIGN KEY (`report_id`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_date`
--

LOCK TABLES `up_date` WRITE;
/*!40000 ALTER TABLE `up_date` DISABLE KEYS */;
INSERT INTO `up_date` VALUES (691,0,'2018-03-01 10:00:00','Update Text 1',685),(692,0,'2018-03-02 12:00:00','Update Text 2',686),(693,0,'2018-03-01 13:00:00','Update Text 3',686),(694,0,'2018-04-01 15:30:00','Update Text 4',687),(695,0,'2018-03-01 14:10:00','Update Text 5',687),(696,0,'2018-05-01 17:23:00','Update Text 6',687);
/*!40000 ALTER TABLE `up_date` ENABLE KEYS */;
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
INSERT INTO `useraccount` VALUES (597,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(598,0,'ffbc4675f864e0e9aab8bdf7a0437010','customer1'),(599,0,'5ce4d191fd14ac85a1469fb8c29b7a7b','customer2'),(600,0,'033f7f6121501ae98285ad77f216d5e7','customer3'),(601,0,'d241610b8b0fe72211f7c97e44490bf3','producer1'),(602,0,'211cd297447bcffe0adb1549acbc8027','producer2'),(603,0,'d200e947051ceac468db08bbb25a2c7c','producer3'),(604,0,'42c63ad66d4dc07ed17753772bef96d6','sponsor1'),(605,0,'3dc67f80a03324e01b1640f45d107485','sponsor2'),(606,0,'857a54956061fdc1b88d7722cafe6519','sponsor3'),(607,0,'83dd21ce9d493ce5b77b6de111e7c6b8','reporter1'),(608,0,'1344fa4095b18c295a3db1a5041a8d8d','reporter2'),(609,0,'fbf4c8666bb6aab727b011548ad7e1e2','reporter3'),(610,0,'97285088ab6d156b8e6697796dbc3c02','designer1'),(611,0,'8218c5b2fd2e8558a937745134a34a9f','designer2'),(612,0,'2a29cf3b35c1a89f61dd90464e472ced','designer3');
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
INSERT INTO `useraccount_authorities` VALUES (597,'ADMIN'),(598,'CUSTOMER'),(599,'CUSTOMER'),(600,'CUSTOMER'),(601,'PRODUCER'),(602,'PRODUCER'),(603,'PRODUCER'),(604,'SPONSOR'),(605,'SPONSOR'),(606,'SPONSOR'),(607,'REPORTER'),(608,'REPORTER'),(609,'REPORTER'),(610,'DESIGNER'),(611,'DESIGNER'),(612,'DESIGNER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votedesign`
--

DROP TABLE IF EXISTS `votedesign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votedesign` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `design_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g9n1kkn5beatug0ij2mg6l2n9` (`customer_id`),
  KEY `FK_c4g16qgl3t8b7usr7gb1w1xgv` (`design_id`),
  CONSTRAINT `FK_c4g16qgl3t8b7usr7gb1w1xgv` FOREIGN KEY (`design_id`) REFERENCES `design` (`id`),
  CONSTRAINT `FK_g9n1kkn5beatug0ij2mg6l2n9` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votedesign`
--

LOCK TABLES `votedesign` WRITE;
/*!40000 ALTER TABLE `votedesign` DISABLE KEYS */;
INSERT INTO `votedesign` VALUES (657,0,1,614,651),(658,0,1,615,651),(659,0,1,616,652),(660,0,-1,615,653),(661,0,-1,614,653);
/*!40000 ALTER TABLE `votedesign` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-01  5:15:34
COMMIT;