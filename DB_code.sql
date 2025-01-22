-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projekt
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Temporary view structure for view `activebids`
--

DROP TABLE IF EXISTS `activebids`;
/*!50001 DROP VIEW IF EXISTS `activebids`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `activebids` AS SELECT 
 1 AS `bid_id`,
 1 AS `item_id`,
 1 AS `price`,
 1 AS `bidder`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `bid_id` int NOT NULL AUTO_INCREMENT,
  `seller_id` int NOT NULL,
  `last_bidder` int DEFAULT NULL,
  `item_id` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`bid_id`),
  KEY `seller_id` (`seller_id`),
  KEY `last_bidder` (`last_bidder`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`last_bidder`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `bids_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (31,4,NULL,27,450),(32,5,NULL,28,35),(33,6,NULL,29,120),(34,7,NULL,30,800),(35,8,NULL,31,25),(36,9,NULL,32,40),(37,4,NULL,33,90),(38,5,NULL,34,1500),(39,6,NULL,35,130),(40,7,NULL,36,750),(41,8,2,37,100),(42,9,NULL,38,80);
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(30) NOT NULL,
  `cat_desc` varchar(255) NOT NULL,
  `items_of_cat` int DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'RTV','Automatically added category: ',2),(3,'Spozywcze','Automatically added category: ',2),(4,'Ubrania','Automatically added category: ',1),(5,'Elektronika','Automatically added category: ',9),(6,'Ksiazki','Automatically added category: ',3),(7,'Meble','Automatically added category: ',3),(8,'Odziez','Automatically added category: ',4),(9,'Sport','Automatically added category: ',5),(10,'Dom i ogrod','Automatically added category: ',2),(11,'Zabawki','Automatically added category: ',4),(12,'Instrumenty','Automatically added category: ',1),(13,'AGD','Automatically added category: ',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `user_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `employer_id` int NOT NULL,
  `sales` double DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `fk_corp` (`employer_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_corp` FOREIGN KEY (`employer_id`) REFERENCES `registeredcompanies` (`corp_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,'Szymon','Szal','2000-01-01',2,45),(5,'Adamowicz','Adam','1990-01-01',3,0);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `order_id` int NOT NULL,
  `sender` int NOT NULL,
  `reciever` int NOT NULL,
  `rating` double NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `sender` (`sender`),
  KEY `reciever` (`reciever`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `users` (`user_id`),
  CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`reciever`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,2,1.5,'towar tani, ale jawnie kradziony, zglosze jeszcze report !'),(2,6,2,9,'bardzo tani produkt, dobry zakup'),(3,3,2,6,'Tanio i w miare dobrze'),(4,9,2,1,'Gruszki ukradl z mojego ogrodu, nie polecam !'),(5,4,2,5,'srednie takie no'),(6,1,2,0,'czlowiek kradnie i sprzedaje, wstyd'),(7,1,2,0,'dalej kradnie'),(8,4,1,10,'Good price'),(9,4,5,10,'Good price'),(10,7,3,6,'Good price'),(11,7,8,6,'Good price'),(20,9,2,10,'super zamowienie, szybko przyszlo');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `seller_id` int NOT NULL,
  `cat_id` int NOT NULL,
  `item_name` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `bid_price` double DEFAULT NULL,
  `buy_price` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `listed` date NOT NULL,
  `bid_end` date DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_cat_id` (`cat_id`),
  KEY `fk_seller_id` (`seller_id`),
  CONSTRAINT `fk_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,1,2,'Pralka','Pralka co prawie nie jest zniszczona',NULL,600,1,'2025-01-20',NULL),(3,1,2,'Telewizor','Telewizor 4 cale, stan dobry',NULL,1300,1,'2025-01-20',NULL),(4,2,3,'Jablka','Dobre jablka, kradzione lecz tanie',NULL,1.5,410,'2025-01-20',NULL),(5,2,3,'Gruszki','Podle gruszki, ale polecam',NULL,0.99,83,'2025-01-20',NULL),(6,2,4,'Koszula flanelowa','Koszula flanelowa, stan dobry rozmiar M',NULL,50,2,'2025-01-20',NULL),(7,4,5,'Samsung Galaxy','S20, uzywany, ale w dobrym stanie.',NULL,1200,1,'2025-01-21',NULL),(8,4,6,'Zbrodnia i kara','Egzemplarz w twardej oprawie, lekkie uzycie.',NULL,40,2,'2025-01-20',NULL),(9,5,7,'Stol debowy','Solidny stol debowy, wymiary 120x80 cm.',NULL,350,1,'2025-01-19',NULL),(10,5,8,'Kurtka zimowa','Kurtka zimowa puchowa, rozmiar XL, jak nowa.',NULL,200,1,'2025-01-20',NULL),(11,6,9,'Rower gorski','Rower gorski z amortyzacja, model 2020, stan bardzo dobry.',NULL,1800,1,'2025-01-18',NULL),(12,6,5,'Laptop Lenovo','Laptop z procesorem i5, 8GB RAM, 256GB SSD.',NULL,2200,1,'2025-01-21',NULL),(13,7,10,'Kosiarka spalinowa','Uzywana kosiarka spalinowa, dziala bez zarzutu.',NULL,600,1,'2025-01-22',NULL),(14,7,11,'Klocki LEGO','Zestaw LEGO Technic, ponad 800 elementow.',NULL,300,1,'2025-01-19',NULL),(15,8,8,'Buty trekkingowe','Buty trekkingowe, rozmiar 42.',NULL,250,1,'2025-01-20',NULL),(16,8,5,'Kamera Sony','Kamera 4k, z karta pamieci 64GB.',NULL,1200,1,'2025-01-21',NULL),(17,9,7,'Komoda sosnowa','Komoda sosnowa, wymiary 100x50x80 cm.',NULL,400,1,'2025-01-19',NULL),(18,9,6,'Atlas geograficzny','Atlas w twardej oprawie, swietny stan.',NULL,30,3,'2025-01-22',NULL),(19,4,5,'Monitor 24\"','Monitor Full HD, matryca IPS.',NULL,600,1,'2025-01-21',NULL),(20,5,11,'Puzzle 1000 elementow','Puzzle krajobrazowe, nowe.',NULL,50,1,'2025-01-20',NULL),(21,6,9,'Hantle 10kg','Zestaw hantli 2x10kg, w dobrym stanie.',NULL,100,1,'2025-01-19',NULL),(22,7,10,'Lampa stojaca','Nowoczesna lampa LED, wysokosc 1.5m.',NULL,200,1,'2025-01-18',NULL),(23,8,5,'Sluchawki Sony','Bezprzewodowe sluchawki, kolor czarny.',NULL,900,1,'2025-01-20',NULL),(24,9,8,'Sukienka wieczorowa','Elegancka sukienka, rozmiar M, stan idealny.',NULL,300,1,'2025-01-19',NULL),(25,4,9,'Rakieta tenisowa','Rakieta tenisowa uzywana, ale w dobrym stanie.',NULL,150,1,'2025-01-21',NULL),(26,5,5,'Drukarka HP','Drukarka laserowa HP, dziala dobrze.',NULL,250,1,'2025-01-20',NULL),(27,4,11,'Dron','Dron z kamera, stan bardzo dobry.',450,NULL,1,'2025-01-22','2025-02-01'),(28,5,9,'Rolka masujaca','Rolka do masowania 45 cm.',35,NULL,1,'2025-01-23','2025-02-02'),(29,6,5,'Mysz komputerowa','Bezprzewodowa mysz z podświetleniem RGB.',120,NULL,1,'2025-01-24','2025-02-05'),(30,7,12,'Gitara akustyczna','Gitara akustyczna, prawie nowa.',800,NULL,1,'2025-01-25','2025-02-06'),(31,8,6,'Poradnik kulinarny','Poradnik gotowania',25,NULL,1,'2025-01-26','2025-02-07'),(32,9,8,'Kapelusz letni','Kapelusz unisex uniwersalny rozmiar.',40,NULL,1,'2025-01-27','2025-02-08'),(33,4,13,'Czajnik elektryczny','Czajnik elektryczny 1.7L, stan bardzo dobry.',90,NULL,1,'2025-01-28','2025-02-09'),(34,5,5,'Konsola do gier','Konsola do gier z dwoma kontrolerami, stan dobry.',1500,NULL,1,'2025-01-29','2025-02-10'),(35,6,7,'Krzeslo obrotowe','krzeslo biurowe obrotowe, troche uszkodzone.',130,NULL,1,'2025-01-30','2025-02-11'),(36,7,9,'Narty','Narty z wiazaniami, 170 cm.',750,NULL,1,'2025-01-31','2025-02-12'),(37,8,11,'Puzzle 3D','Zestaw puzzli 3D, model Taj Majal, nowy.',60,NULL,1,'2025-02-01','2025-02-14'),(38,9,5,'Powerbank','Powerbank 20000mAh, uzywany dwa miesiace.',80,NULL,1,'2025-02-02','2025-02-15');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_item` int NOT NULL,
  `order_user` int NOT NULL,
  `order_quantity` int NOT NULL DEFAULT '1',
  `order_price` double NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `order_user` (`order_user`),
  KEY `order_item` (`order_item`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_item`) REFERENCES `items` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `orders_chk_1` CHECK ((`order_price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,4,2,6,1.5,'2025-01-22 14:00:01'),(2,4,2,6,1.5,'2025-01-22 14:02:29'),(3,4,2,12,1.5,'2025-01-22 16:04:24'),(4,4,2,40,1.5,'2025-01-22 16:04:36'),(5,5,2,30,0.99,'2025-01-22 16:04:41'),(6,4,2,1,1.5,'2025-01-22 16:08:22'),(7,4,2,8,1.5,'2025-01-22 16:12:27'),(8,4,2,7,1.5,'2025-01-22 16:12:30'),(9,4,2,10,1.5,'2025-01-22 16:48:15'),(10,4,2,10,1.5,'2025-01-22 16:48:49'),(11,5,2,10,0.99,'2025-01-22 16:50:14'),(12,4,2,10,1.5,'2025-01-22 16:52:29'),(13,4,2,10,1.5,'2025-01-22 16:52:38'),(14,4,2,10,1.5,'2025-01-22 16:52:42'),(15,4,2,10,1.5,'2025-01-22 16:52:46'),(16,4,2,10,1.5,'2025-01-22 16:55:35'),(17,4,2,10,1.5,'2025-01-22 16:57:17'),(18,4,2,10,1.5,'2025-01-22 16:57:21'),(19,4,2,10,1.5,'2025-01-22 16:58:53'),(20,4,2,10,1.5,'2025-01-22 16:59:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `packages_in_transit`
--

DROP TABLE IF EXISTS `packages_in_transit`;
/*!50001 DROP VIEW IF EXISTS `packages_in_transit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `packages_in_transit` AS SELECT 
 1 AS `order_id`,
 1 AS `status`,
 1 AS `est_arrival`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `registeredcompanies`
--

DROP TABLE IF EXISTS `registeredcompanies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registeredcompanies` (
  `corp_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`corp_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `registeredcompanies_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeredcompanies`
--

LOCK TABLES `registeredcompanies` WRITE;
/*!40000 ALTER TABLE `registeredcompanies` DISABLE KEYS */;
INSERT INTO `registeredcompanies` VALUES (2,'Stolen Goods Inc.',2),(3,'Reputable Corp.',5);
/*!40000 ALTER TABLE `registeredcompanies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `reportee` int NOT NULL,
  `reported` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `report_date` date NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `reportee` (`reportee`),
  KEY `reported` (`reported`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`reportee`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`reported`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,1,2,'sprzedawanie kradzionego towaru','2025-01-21'),(2,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(3,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(4,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(5,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(6,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(7,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(8,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(9,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(10,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(11,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(12,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(13,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(14,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(15,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(16,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22'),(17,1,2,'sprzedaz kradzionych przedmiotow','2025-01-22');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `order_id` int NOT NULL,
  `status` varchar(40) NOT NULL,
  `est_arrival` date NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,'Processing','2025-01-29'),(2,'Processing','2025-01-29'),(3,'Processing','2025-01-29'),(4,'Processing','2025-01-29'),(5,'Processing','2025-01-29'),(6,'Processing','2025-01-29'),(7,'Processing','2025-01-29'),(8,'Processing','2025-01-29'),(9,'Processing','2025-01-29'),(10,'Processing','2025-01-29'),(11,'Processing','2025-01-29'),(12,'Processing','2025-01-29'),(13,'Processing','2025-01-29'),(14,'Processing','2025-01-29'),(15,'Processing','2025-01-29'),(16,'Processing','2025-01-29'),(17,'Processing','2025-01-29'),(18,'Processing','2025-01-29'),(19,'Processing','2025-01-29'),(20,'Processing','2025-01-29');
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `suspicious_users`
--

DROP TABLE IF EXISTS `suspicious_users`;
/*!50001 DROP VIEW IF EXISTS `suspicious_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `suspicious_users` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `rating`,
 1 AS `rating_count`,
 1 AS `total_reports`,
 1 AS `suspicion_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `rating` double DEFAULT '0',
  `rating_count` int DEFAULT '0',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `users_chk_1` CHECK ((`rating` <= 10))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Janowicz111','g1th4sl0','JanJanowicz@gmail.com',10,1),(2,'SSzal','pass554p','SzymonSzal@gmail.com',4.0625,8),(3,'aAAdam','aaapasswd','adamadam@gmail.com',6,1),(4,'Trzy','dwa','jedenmmm@gmail.com',0,0),(5,'AdamowiczAdam','hasslo','Aadam@gmail.com',10,1),(6,'BeataBorowicz','jaaa','Bbor@gmail.com',0,0),(7,'CecyliaCedar','ccccccccc111','Ccedarrr@gmail.com',0,0),(8,'DariaD','dDDD111','DDomaniecka@gmail.com',6,1),(9,'EmiEmilowicz','Eeeeeeeeeee','EEmmii@gmail.com',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `activebids`
--

/*!50001 DROP VIEW IF EXISTS `activebids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `activebids` AS select `b`.`bid_id` AS `bid_id`,`b`.`item_id` AS `item_id`,`b`.`price` AS `price`,`u`.`username` AS `bidder` from (`bids` `b` join `users` `u` on((`b`.`last_bidder` = `u`.`user_id`))) where (`b`.`price` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `packages_in_transit`
--

/*!50001 DROP VIEW IF EXISTS `packages_in_transit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `packages_in_transit` AS select `shipping`.`order_id` AS `order_id`,`shipping`.`status` AS `status`,`shipping`.`est_arrival` AS `est_arrival` from `shipping` where (`shipping`.`status` = 'Processing') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `suspicious_users`
--

/*!50001 DROP VIEW IF EXISTS `suspicious_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `suspicious_users` AS select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,`u`.`rating` AS `rating`,`u`.`rating_count` AS `rating_count`,count(`r`.`report_id`) AS `total_reports`,(case when (`is_suspicious`(`u`.`user_id`) = 1) then 'Suspicious' else 'Not Suspicious' end) AS `suspicion_status` from (`users` `u` left join `reports` `r` on((`u`.`user_id` = `r`.`reported`))) group by `u`.`user_id` having (`suspicion_status` = 'Suspicious') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-22 22:14:46
