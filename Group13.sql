-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: uwezocharitydonationsys
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `charity`
--

DROP TABLE IF EXISTS `charity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charity` (
  `charity_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `descr` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`charity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charity`
--

LOCK TABLES `charity` WRITE;
/*!40000 ALTER TABLE `charity` DISABLE KEYS */;
INSERT INTO `charity` VALUES (201,'Winter Food Drive','Providing food to families','2024-06-11','2024-11-22'),(202,'Green Earth Alliance','Environmental Conservation','2024-06-11','2024-11-22'),(203,'Heart of Care','Offers free Medical assistance','2024-06-11','2024-11-22'),(204,'Children\'s Hope Society','Supports disadvantaged children','2024-06-11','2024-11-22'),(205,'Veteran Honour Fund','Donation for veteran mental health services','2024-06-11','2024-11-22'),(206,'World Wildlife Fund','Donation for the preservation of wildlife','2024-04-10','2024-12-31'),(207,'Pencils of Promise','Donations for building of schools and providing education','2024-06-04','2024-12-13'),(208,'Smile Train','Donations for palate surgeries','2023-03-12','2024-11-10'),(209,'The Salvation Army','Donations for Homelessness Support','2023-09-15','2024-12-10'),(210,'Red Cross','Donations for emergency assistance and disaster relief','2024-10-19','2024-11-10');
/*!40000 ALTER TABLE `charity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `donation_id` int NOT NULL,
  `donor_id` int DEFAULT NULL,
  `charity_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`donation_id`),
  KEY `donor_id` (`donor_id`),
  CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `donation` (`donation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (1,1,201,5000.00,'2024-11-21','Cash'),(2,2,202,60000.00,'2024-11-21','M-pesa'),(3,3,201,80500.00,'2024-11-20','Cash'),(4,4,201,58000.00,'2024-11-21','Cash'),(5,4,204,3000.00,'2024-11-23','M-pesa'),(6,6,206,50000.00,'2024-11-23','Cash'),(7,7,208,30000.00,'2024-11-23','Bank Transfer'),(8,8,207,23500.00,'2024-11-10','M-pesa'),(9,9,209,85000.00,'2024-11-21','Credit Card'),(10,10,210,45000.00,'2024-10-09','M-pesa');
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `donor_id` int NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`donor_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (1,'Sandra','Nyale','sandran@gmail.com','0712345678','23456'),(2,'Nelly','Murugi','nellymugz@gmail.com','0745231834','21567'),(3,'Elvis','Muraga','elvoer@gmail.com','0723492346','24356'),(4,'Joy','Kamau','jkamz@gmail.com','072456341','25678'),(5,'Joshua','Onchiri','jonch@gmail.com','0745267107','34567'),(6,'Dickson','Nyanchama','nyanchama45@gmail.com','0786452134','67890'),(7,'Rachel','Zoya','rzoya@gmail.com','0765342105','76780'),(8,'Nigel','Olande','nolande@gmail.com','0765432190','65489'),(9,'Elsa','Elvis','elsae@gmail.com','078632547','65432'),(10,'Emmanuel','Munene','emunene@gmail.com','078965321','54321');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `receipt_id` int NOT NULL,
  `donation_id` int DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `receipt_content` text,
  PRIMARY KEY (`receipt_id`),
  KEY `donation_id` (`donation_id`),
  CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`donation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (401,1,'2024-06-11',20000.00,'Donation for food distribution programs serving impoverished communities'),(402,2,'2024-06-11',55000.00,'Donation for environmental conservation efforts'),(403,3,'2024-06-11',45000.00,'Donation towards free health screening'),(404,4,'2024-06-11',65000.00,'Donation for child healthcare, education and family support services'),(405,5,'2024-06-11',40000.00,'Donation for veteran mental health services');
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `roles` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (501,'Gerald','Langiri','Chief Executive Officer','glangiri@gmail.com','078674325'),(502,'Esther','Wahome','Accountant','ewahome@gmail.com','0723156835'),(503,'Terrence','Njuguna','Donor Relations Coordinator','tnjuguna@gmail.com','0723196835'),(504,'Stacy','Wanjiru','Communications Manager','swanjiru@gmail.com','0790156835'),(505,'Maureen','Lucas','Program Manager','mlucas@gmail.com','0798156835');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_event`
--

DROP TABLE IF EXISTS `staff_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_event` (
  `staff_id` int NOT NULL,
  `charity_id` int NOT NULL,
  PRIMARY KEY (`staff_id`,`charity_id`),
  KEY `charity_id` (`charity_id`),
  CONSTRAINT `staff_event_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `staff_event_ibfk_2` FOREIGN KEY (`charity_id`) REFERENCES `charity` (`charity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_event`
--

LOCK TABLES `staff_event` WRITE;
/*!40000 ALTER TABLE `staff_event` DISABLE KEYS */;
INSERT INTO `staff_event` VALUES (501,201),(502,202),(503,203),(504,204),(505,205);
/*!40000 ALTER TABLE `staff_event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 19:50:22
