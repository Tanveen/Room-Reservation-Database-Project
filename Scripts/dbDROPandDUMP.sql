CREATE DATABASE  IF NOT EXISTS `RoomReserve` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `RoomReserve`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: RoomReserve
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('A101','Eva','h','Johnson','F','95 Ave',211232314),('A102','Maya','k','kellog','F','Waldemare st',211232344),('A103','George','hows','felma','F','North street',211233123),('A104','Angie','hoze','smith','F','9 University Ave',211233444),('A105','Neva','loe','Jith','F','7 lafayette',211236274),('A106','Guniya','junior','Huya','F','broad street',231098674),('A107','Shelja','senior','Johnson','F','95 Ave',232233123);
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Building`
--

LOCK TABLES `Building` WRITE;
/*!40000 ALTER TABLE `Building` DISABLE KEYS */;
INSERT INTO `Building` VALUES ('B101','Health science',0),('B102','Cartenson',1),('B103','Engineering',1),('B104','Mandeville',1),('B105','ABC',0),('B106','North Hall',0),('B107','Carlson Hall',1),('B108','Bodine Hall',0),('B109','Library',1);
/*!40000 ALTER TABLE `Building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Date`
--

LOCK TABLES `Date` WRITE;
/*!40000 ALTER TABLE `Date` DISABLE KEYS */;
INSERT INTO `Date` VALUES (12,'October',2017),(20,'January',2014),(12,'February',2015),(21,'March',2017),(2,'May',2017),(5,'April',2016),(9,'July',2016),(23,'July',2017),(11,'November',2017),(8,'October',2017),(5,'December',2017);
/*!40000 ALTER TABLE `Date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('D101','DepOne','EastCampus',1),('D102','Nursing','WestCampus',1),('D103','PayRoll','EastCampus',1),('D104','Bookstore','NorthCampus',0),('D105','Cafe','SouthCampus',1),('D106','Biomedical','MainCampus',1),('D107','Business','BehindCampus',0),('D108','Activity','EastCampus',0),('D109','Communication','NorthCampus',1),('D110','Admissions','MainCampus',1);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES ('E1','Electronic','R1'),('E10','Electronic','R8'),('E9','Projector','R7'),('E8','Extras','R9'),('E7','Simple','R6'),('E6','Stationary','R5'),('E5','Electronic','R4'),('E4','Accessory','R3'),('E3','Electronic','R3'),('E2','Simple','R2');
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Laboratory`
--

LOCK TABLES `Laboratory` WRITE;
/*!40000 ALTER TABLE `Laboratory` DISABLE KEYS */;
INSERT INTO `Laboratory` VALUES ('L101','Lab110','D101'),('L102','Lab110','D101'),('L103','Lab111','D102'),('L104','Lab112','D103'),('L105','Lab113','D104'),('L106','Lab114','D105'),('L107','Lab115','D106'),('L108','Lab116','D107'),('L109','Lab117','D108'),('L110','Lab118','D109');
/*!40000 ALTER TABLE `Laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Ratings`
--

LOCK TABLES `Ratings` WRITE;
/*!40000 ALTER TABLE `Ratings` DISABLE KEYS */;
INSERT INTO `Ratings` VALUES ('Rating1','Good and comfortable','R1'),('Rating11','Good and comfortable','R1'),('Rating10','Good environment','R4'),('Rating9','Easy accesible','R3'),('Rating8','Excellent and internet','R2'),('Rating8','Excellent and internet','R2'),('Rating7','Comfortable','R2'),('Rating6','Good','R9'),('Rating5','Good but no internet','R8'),('Rating4','No internet','R7'),('Rating3','Excellent','R1'),('Rating2','Good and Airy','R2');
/*!40000 ALTER TABLE `Ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES ('2017-02-12','2017-02-28','Reserve101'),('2017-03-12','2017-04-11','Reserve102'),('2017-04-13','2017-05-13','Reserve103'),('2017-05-14','2017-06-14','Reserve104'),('2017-06-15','2017-07-15','Reserve105'),('2017-07-16','2017-08-15','Reserve106'),('2017-08-16','2017-09-15','Reserve107'),('2017-09-16','2017-10-13','Reserve108'),('2017-10-16','2017-11-23','Reserve109'),('2017-11-16','2017-12-22','Reserve110'),('2017-01-01','2017-01-31','Reserve111');
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES ('R1',100,'single',1,'D101'),('R11',109,'single',1,'D108'),('R12',100,'single',1,'D103'),('R2',101,'single',1,'D102'),('R3',102,'double',1,'D102'),('R4',103,'single',1,'D103'),('R5',104,'double',1,'D104'),('R6',105,'single',1,'D105'),('R7',106,'double',1,'D101'),('R8',107,'single',1,'D106'),('R9',108,'double',1,'D107');
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES ('ST11','Johnny','Menns','M','Lafayette st',211232314,'Reserve101'),('ST12','Tanveen','Kaur','F','Broad Street',211232344,'Reserve102'),('ST13','Jaag','Josh','M','John St',211233123,'Reserve103'),('ST14','Anam','Menns','M','Linden AVe',211233444,'Reserve104'),('ST15','Harpreet','Kaur','F','Waldemere',211236274,'Reserve105'),('ST16','Joy','Ruya','M','Broad Ave',212036274,'Reserve106'),('ST17','Paul','Seyfert','M','Atlantic ave',212098674,'Reserve107'),('ST18','John','alex','M','Lafayette st',211232314,'Reserve107'),('ST19','Jinny','Taskin','M','Loan ave',231098674,'Reserve108');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('S1011234','Guniya','K','Kaur','F','Broad ave',211233123,'Reserve102'),('S1012123','Michael','K','Lolley','F','South Hall',212098674,'Reserve105'),('S1014009','Duane','K','Kellog','F','BlackRock',231098674,'Reserve106'),('S1014532','Pauline','K','Seyfert','F','Linden Ave',212036274,'Reserve103'),('S1014603','Tanveen','K','Makhija','F','95 University',211232314,'Reserve101'),('S1014609','Anita','K','George','F','9 North ave',211233444,'Reserve102'),('S1015643','Ellen','K','Ave','F','95 University',232233123,'Reserve107');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `University`
--

LOCK TABLES `University` WRITE;
/*!40000 ALTER TABLE `University` DISABLE KEYS */;
INSERT INTO `University` VALUES ('U101','University of Bristol'),('U102','University of London'),('U103','University of Minnetoba'),('U104','Fairfield University'),('U105','Sacred Heart University'),('U106','New Haven University'),('U107','University of Boston'),('U108','University of Bristol'),('U111','University of Bridgeport');
/*!40000 ALTER TABLE `University` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('Happy','Arora','Singh',211232314,'Urban street','M'),('Tanveen','A','Kaur',211232344,'Sector street','M'),('Jaag','Josh','huya',211233123,'Sec2t','M'),('Anam','Josh','SeyFert',211233444,'Sector 22t','M'),('Harpreet','Arora','Singh',211236274,'Univ street','F'),('Ellen','J','Laef',212036274,'Brooklyn street','F'),('Kellog','Junior','Hefta',212098674,'Brooklyn ave','M'),('john','h','smith',231098674,'waldemare st','M'),('Shrei','Junior','love',232233123,'North 2t','F');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'RoomReserve'
--

--
-- Dumping routines for database 'RoomReserve'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-17 17:02:35
