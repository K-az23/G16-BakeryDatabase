-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: cis4365spring.cccavv0abop7.us-east-1.rds.amazonaws.com    Database: cis4365springdb
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Allergy_Info`
--

DROP TABLE IF EXISTS `Allergy_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allergy_Info` (
  `Allergy_Info_ID` int NOT NULL,
  `Allergy_Details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Allergy_Info_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allergy_Info`
--

LOCK TABLES `Allergy_Info` WRITE;
/*!40000 ALTER TABLE `Allergy_Info` DISABLE KEYS */;
INSERT INTO `Allergy_Info` VALUES (1,'Contains gluten (wheat-based flour)'),(2,'Contains dairy (butter, cream cheese)'),(3,'Contains nuts (peanut butter)'),(4,'Contains eggs'),(5,'Contains soy or soy derivatives'),(6,'Contains tree nuts (almonds, walnuts)'),(7,'Contains artificial coloring'),(8,'Contains preservatives'),(9,'Contains sesame'),(10,'Contains shellfish (cross-contamination risk)');
/*!40000 ALTER TABLE `Allergy_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Allergy_Log`
--

DROP TABLE IF EXISTS `Allergy_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allergy_Log` (
  `Allergy_Log_ID` int NOT NULL,
  `Product_ID` int DEFAULT NULL,
  `Allergy_Info_ID` int DEFAULT NULL,
  `Last_Updated` date DEFAULT NULL,
  PRIMARY KEY (`Allergy_Log_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allergy_Log`
--

LOCK TABLES `Allergy_Log` WRITE;
/*!40000 ALTER TABLE `Allergy_Log` DISABLE KEYS */;
INSERT INTO `Allergy_Log` VALUES (1,1,1,'2024-03-01'),(2,2,2,'2024-03-02'),(3,3,3,'2024-03-03'),(4,4,4,'2024-03-04'),(5,5,5,'2024-03-05'),(6,6,6,'2024-03-06'),(7,7,7,'2024-03-07'),(8,8,8,'2024-03-08'),(9,9,9,'2024-03-09'),(10,10,10,'2024-03-10');
/*!40000 ALTER TABLE `Allergy_Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catering`
--

DROP TABLE IF EXISTS `Catering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Catering` (
  `Catering_ID` int NOT NULL,
  `Order_ID` int DEFAULT NULL,
  `Catering_Detail` text,
  PRIMARY KEY (`Catering_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catering`
--

LOCK TABLES `Catering` WRITE;
/*!40000 ALTER TABLE `Catering` DISABLE KEYS */;
INSERT INTO `Catering` VALUES (1,1,'Corporate breakfast platter'),(2,2,'Wedding dessert table'),(3,3,'Birthday party cupcakes'),(4,4,'Bridal shower treats'),(5,5,'Office holiday pastries'),(6,6,'Retirement luncheon'),(7,7,'Baby shower sweets'),(8,8,'Engagement cake buffet'),(9,9,'Non-profit event snacks'),(10,10,'Team building cookie bar');
/*!40000 ALTER TABLE `Catering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catering_Event`
--

DROP TABLE IF EXISTS `Catering_Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Catering_Event` (
  `Event_ID` int NOT NULL,
  `Event_Name` varchar(100) DEFAULT NULL,
  `Event_Date` date DEFAULT NULL,
  `Catering_ID` int DEFAULT NULL,
  PRIMARY KEY (`Event_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catering_Event`
--

LOCK TABLES `Catering_Event` WRITE;
/*!40000 ALTER TABLE `Catering_Event` DISABLE KEYS */;
INSERT INTO `Catering_Event` VALUES (1,'Houston Tech Summit','2025-04-15',1),(2,'Smith-Jones Wedding','2025-04-22',2),(3,'Ella\'s 10th Birthday','2025-04-29',3),(4,'Sophia\'s Bridal Bash','2025-05-06',4),(5,'Holiday Staff Party','2025-05-13',5),(6,'John\'s Retirement','2025-05-20',6),(7,'Emily\'s Baby Shower','2025-05-27',7),(8,'Taylor-Pat Engagement','2025-06-03',8),(9,'Community Outreach Fair','2025-06-10',9),(10,'Company Retreat','2025-06-17',10);
/*!40000 ALTER TABLE `Catering_Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Customer_ID` int NOT NULL,
  `Loyalty_Program_ID` int DEFAULT NULL,
  `Customer_Lname` varchar(50) DEFAULT NULL,
  `Customer_Fname` varchar(50) DEFAULT NULL,
  `Customer_Email` varchar(100) DEFAULT NULL,
  `Customer_Zip` varchar(10) DEFAULT NULL,
  `Customer_State` varchar(50) DEFAULT NULL,
  `Customer_Address` varchar(100) DEFAULT NULL,
  `Customer_City` varchar(50) DEFAULT NULL,
  `Join_Date` date DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,NULL,'Smith','John','john.smith@example.com','77001','TX','1231 Main St','Houston','2021-03-23'),(2,NULL,'Johnson','Emily','emily.johnson@example.com','77002','TX','1232 Main St','Houston','2021-04-21'),(3,NULL,'Brown','David','david.brown@example.com','77003','TX','1233 Main St','Houston','2022-10-31'),(4,NULL,'Williams','Sophia','sophia.williams@example.com','77004','TX','1234 Main St','Houston','2023-05-17'),(5,NULL,'Jones','Michael','michael.jones@example.com','77005','TX','1235 Main St','Houston','2020-02-24'),(6,NULL,'Garcia','Olivia','olivia.garcia@example.com','77006','TX','1236 Main St','Houston','2023-02-23'),(7,NULL,'Miller','Daniel','daniel.miller@example.com','77007','TX','1237 Main St','Houston','2021-02-11'),(8,NULL,'Davis','Emma','emma.davis@example.com','77008','TX','1238 Main St','Houston','2023-08-23'),(9,NULL,'Martinez','James','james.martinez@example.com','77009','TX','1239 Main St','Houston','2023-12-07'),(10,NULL,'Lopez','Ava','ava.lopez@example.com','770010','TX','12310 Main St','Houston','2023-01-21');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `Delivery_ID` int NOT NULL,
  `Packaging_ID` int DEFAULT NULL,
  `Delivery_Date` date DEFAULT NULL,
  `Delivery_Status` varchar(50) DEFAULT NULL,
  `Delivery_Zip` varchar(10) DEFAULT NULL,
  `Delivery_State` varchar(50) DEFAULT NULL,
  `Delivery_Address` varchar(100) DEFAULT NULL,
  `Delivery_City` varchar(50) DEFAULT NULL,
  `Delivery_Cost` decimal(10,2) DEFAULT NULL,
  `Store_Location` int DEFAULT NULL,
  PRIMARY KEY (`Delivery_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
INSERT INTO `Delivery` VALUES (1,1,'2024-03-04','Delivered','77010','TX','100 Bake Ave','Houston',16.61,1),(2,2,'2024-02-26','In Transit','77011','TX','101 Bake Ave','Houston',19.62,2),(3,3,'2024-03-08','Out for Delivery','77012','TX','102 Bake Ave','Houston',12.86,3),(4,4,'2024-02-10','Delivered','77013','TX','103 Bake Ave','Houston',14.36,4),(5,5,'2024-01-24','Cancelled','77014','TX','104 Bake Ave','Houston',7.41,5),(6,6,'2024-02-03','Delivered','77015','TX','105 Bake Ave','Houston',14.21,6),(7,7,'2024-01-06','Pending','77016','TX','106 Bake Ave','Houston',11.40,7),(8,8,'2024-02-18','Delivered','77017','TX','107 Bake Ave','Houston',15.24,8),(9,9,'2024-03-04','Rescheduled','77018','TX','108 Bake Ave','Houston',11.73,9),(10,10,'2024-04-04','Delivered','77019','TX','109 Bake Ave','Houston',9.25,10);
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discount` (
  `Discount_ID` int NOT NULL,
  `Discount_Amount` decimal(10,2) DEFAULT NULL,
  `Discount_Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Discount_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
INSERT INTO `Discount` VALUES (1,5.00,'Referral'),(2,10.00,'Summer Discount'),(3,10.00,'Spring Discount'),(4,10.00,'First Time'),(5,10.00,'Holiday'),(6,10.00,'Winter Discount'),(7,10.00,'Birthday'),(8,10.00,'Fall Discount'),(9,10.00,'Back to School'),(10,10.00,'Weekend Special');
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Employee_ID` int NOT NULL,
  `Role_ID` int DEFAULT NULL,
  `Employee_Fname` varchar(50) DEFAULT NULL,
  `Employee_Lname` varchar(50) DEFAULT NULL,
  `Employee_Email` varchar(100) DEFAULT NULL,
  `Employee_Phone` varchar(20) DEFAULT NULL,
  `Employee_Hire_Date` date DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Role_ID` (`Role_ID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `Role` (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,1,'Gideon','Dimaano','gideon.dimaano@company.com','123-456-7801','2019-05-27'),(2,2,'Julian-Angelo','Garcia','julianangelo.bantoggarcia@company.com','123-456-7802','2022-06-01'),(3,3,'Eric','Salgado','eric.salgado@company.com','123-456-7803','2022-07-24'),(4,4,'Syed','Shakil','syed.shakil@company.com','123-456-7804','2019-12-17'),(5,5,'Cole','Stillwell','cole.stillwell@company.com','123-456-7805','2021-12-29'),(6,6,'Jose','Tijerina','jose.tijerina@company.com','123-456-7806','2023-02-02'),(7,7,'Kevin','Zavala','kevin.zavala@company.com','123-456-7807','2020-05-16'),(8,8,'Alex','Bennett','alex.bennett@company.com','123-456-7808','2019-12-01'),(9,9,'Riley','Morris','riley.morris@company.com','123-456-7809','2021-08-04'),(10,10,'Taylor','Sanders','taylor.sanders@company.com','123-456-7810','2021-02-16');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `Equipment_ID` int NOT NULL AUTO_INCREMENT,
  `Equipment_Name` varchar(100) NOT NULL,
  `Date_of_Purchase` date DEFAULT NULL,
  `Inventory_ID` int DEFAULT NULL,
  `Date_Of_Maintenance` date DEFAULT NULL,
  PRIMARY KEY (`Equipment_ID`),
  KEY `fk_equipment_inventory` (`Inventory_ID`),
  CONSTRAINT `fk_equipment_inventory` FOREIGN KEY (`Inventory_ID`) REFERENCES `Inventory` (`Inventory_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,'Stand Mixer','2022-08-11',201,'2023-01-15'),(2,'Oven','2022-02-05',202,'2024-03-15'),(3,'Rolling Pin','2021-12-26',203,'2023-01-03'),(4,'Mixing Bowl','2020-03-02',204,'2024-03-20'),(5,'Measuring Cups','2022-07-24',205,'2024-02-17'),(6,'Baking Sheet','2022-11-02',206,'2024-01-28'),(7,'Cooling Rack','2020-10-15',207,'2023-02-06'),(8,'Whisk','2022-11-25',208,'2023-02-07'),(9,'Spatula','2022-05-27',209,'2023-04-03'),(10,'Piping Bag','2020-06-17',210,'2023-11-02');
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment_List`
--

DROP TABLE IF EXISTS `Equipment_List`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment_List` (
  `EquipmentList_ID` int NOT NULL AUTO_INCREMENT,
  `Recipe_ID` int DEFAULT NULL,
  `Equipment_ID` int DEFAULT NULL,
  PRIMARY KEY (`EquipmentList_ID`),
  KEY `fk_equipmentlist_recipe` (`Recipe_ID`),
  KEY `fk_equipmentlist_equipment` (`Equipment_ID`),
  CONSTRAINT `fk_equipmentlist_equipment` FOREIGN KEY (`Equipment_ID`) REFERENCES `Equipment` (`Equipment_ID`),
  CONSTRAINT `fk_equipmentlist_recipe` FOREIGN KEY (`Recipe_ID`) REFERENCES `Recipe` (`Recipe_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment_List`
--

LOCK TABLES `Equipment_List` WRITE;
/*!40000 ALTER TABLE `Equipment_List` DISABLE KEYS */;
INSERT INTO `Equipment_List` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `Equipment_List` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gift_Card`
--

DROP TABLE IF EXISTS `Gift_Card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gift_Card` (
  `Gift_Card_ID` int NOT NULL,
  `Gift_Card_Name` varchar(100) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Gift_Card_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gift_Card`
--

LOCK TABLES `Gift_Card` WRITE;
/*!40000 ALTER TABLE `Gift_Card` DISABLE KEYS */;
INSERT INTO `Gift_Card` VALUES (1,'GiftCard1',50.00),(2,'GiftCard2',50.00),(3,'GiftCard3',100.00),(4,'GiftCard4',75.00),(5,'GiftCard5',80.00),(6,'GiftCard6',200.00),(7,'GiftCard7',50.00),(8,'GiftCard8',200.00),(9,'GiftCard9',75.00),(10,'GiftCard10',40.00);
/*!40000 ALTER TABLE `Gift_Card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gift_Card_Log`
--

DROP TABLE IF EXISTS `Gift_Card_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gift_Card_Log` (
  `Customer_Gift_Card_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Gift_Card_ID` int DEFAULT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Expiration_Date` date DEFAULT NULL,
  `Balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Customer_Gift_Card_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gift_Card_Log`
--

LOCK TABLES `Gift_Card_Log` WRITE;
/*!40000 ALTER TABLE `Gift_Card_Log` DISABLE KEYS */;
INSERT INTO `Gift_Card_Log` VALUES (1,1,1,'2021-02-14','2024-07-04',25.00),(2,2,2,'2022-04-16','2024-10-22',25.00),(3,3,3,'2022-07-04','2024-04-08',50.00),(4,4,4,'2021-05-08','2024-12-26',37.50),(5,5,5,'2022-01-23','2024-02-05',40.00),(6,6,6,'2021-03-22','2024-01-24',100.00),(7,7,7,'2022-07-20','2024-12-04',25.00),(8,8,8,'2021-10-28','2024-04-26',100.00),(9,9,9,'2022-10-06','2024-05-28',37.50),(10,10,10,'2022-09-26','2024-02-10',20.00);
/*!40000 ALTER TABLE `Gift_Card_Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredient`
--

DROP TABLE IF EXISTS `Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredient` (
  `Ingredient_ID` int NOT NULL AUTO_INCREMENT,
  `Ingredient_Name` varchar(100) NOT NULL,
  `Quantity_in_Stock` int DEFAULT '0',
  `Inventory_ID` int DEFAULT NULL,
  PRIMARY KEY (`Ingredient_ID`),
  KEY `fk_ingredient_inventory` (`Inventory_ID`),
  CONSTRAINT `fk_ingredient_inventory` FOREIGN KEY (`Inventory_ID`) REFERENCES `Inventory` (`Inventory_ID`),
  CONSTRAINT `Ingredient_chk_1` CHECK ((`Quantity_in_Stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient`
--

LOCK TABLES `Ingredient` WRITE;
/*!40000 ALTER TABLE `Ingredient` DISABLE KEYS */;
INSERT INTO `Ingredient` VALUES (1,'Mixed Produce',120,201),(2,'All-Purpose Flour',80,202),(3,'Whole Milk',90,203),(4,'Wheat Berries',100,204),(5,'Frozen Berries',60,205),(6,'Ketchup',40,206),(7,'Brewed Coffee',150,207),(8,'Active Dry Yeast',1,208),(9,'Salted Butter',30,209),(10,'Mixed Spices',55,210);
/*!40000 ALTER TABLE `Ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredient_List`
--

DROP TABLE IF EXISTS `Ingredient_List`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredient_List` (
  `Ingredient_List_ID` int NOT NULL AUTO_INCREMENT,
  `Recipe_ID` int NOT NULL,
  `Ingredient_ID` int NOT NULL,
  PRIMARY KEY (`Ingredient_List_ID`),
  KEY `Recipe_ID` (`Recipe_ID`),
  KEY `Ingredient_ID` (`Ingredient_ID`),
  CONSTRAINT `Ingredient_List_ibfk_1` FOREIGN KEY (`Recipe_ID`) REFERENCES `Recipe` (`Recipe_ID`),
  CONSTRAINT `Ingredient_List_ibfk_2` FOREIGN KEY (`Ingredient_ID`) REFERENCES `Ingredient` (`Ingredient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient_List`
--

LOCK TABLES `Ingredient_List` WRITE;
/*!40000 ALTER TABLE `Ingredient_List` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ingredient_List` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventory` (
  `Inventory_ID` int NOT NULL AUTO_INCREMENT,
  `Supplier_ID` int NOT NULL,
  `Inventory_Type` varchar(50) DEFAULT NULL,
  `Last_Updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `Stock_Level` int DEFAULT NULL,
  `Store_Loc_ID` int DEFAULT NULL,
  PRIMARY KEY (`Inventory_ID`),
  KEY `Supplier_ID` (`Supplier_ID`),
  KEY `fk_inventory_store` (`Store_Loc_ID`),
  CONSTRAINT `fk_inventory_store` FOREIGN KEY (`Store_Loc_ID`) REFERENCES `Store_Location` (`Store_Loc_ID`),
  CONSTRAINT `Inventory_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `Supplier` (`Supplier_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (201,1,'Produce','2025-03-01 00:00:00',120,1),(202,2,'Flour','2025-03-02 00:00:00',80,1),(203,3,'Dairy','2025-03-03 00:00:00',90,1),(204,1,'Grain','2025-03-04 00:00:00',100,1),(205,2,'Frozen','2025-03-05 00:00:00',60,1),(206,3,'Condiment','2025-03-06 00:00:00',70,1),(207,1,'Beverage','2025-03-07 00:00:00',150,1),(208,2,'Yeast','2025-03-02 00:00:00',80,1),(209,3,'Butter','2025-03-09 00:00:00',40,1),(210,1,'Spices','2025-03-10 00:00:00',55,1);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice` (
  `Invoice_ID` int NOT NULL AUTO_INCREMENT,
  `Supplier_ID` int NOT NULL,
  `Store_Loc_ID` int NOT NULL,
  `Store_Amount` decimal(10,2) DEFAULT '0.00',
  `Invoice_Date` date NOT NULL,
  PRIMARY KEY (`Invoice_ID`),
  KEY `Supplier_ID` (`Supplier_ID`),
  KEY `Store_Loc_ID` (`Store_Loc_ID`),
  CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `Supplier` (`Supplier_ID`),
  CONSTRAINT `Invoice_ibfk_2` FOREIGN KEY (`Store_Loc_ID`) REFERENCES `Store_Location` (`Store_Loc_ID`),
  CONSTRAINT `Invoice_chk_1` CHECK ((`Store_Amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loyalty_Program`
--

DROP TABLE IF EXISTS `Loyalty_Program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loyalty_Program` (
  `Loyalty_Program_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Program_Name` varchar(100) DEFAULT NULL,
  `Points_Earned` int DEFAULT NULL,
  PRIMARY KEY (`Loyalty_Program_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loyalty_Program`
--

LOCK TABLES `Loyalty_Program` WRITE;
/*!40000 ALTER TABLE `Loyalty_Program` DISABLE KEYS */;
INSERT INTO `Loyalty_Program` VALUES (1,1,'Gold',508),(2,3,'Silver',470),(3,5,'Platinum',324),(4,9,'Bronze',241),(5,10,'Elite',621),(6,1,'Gold Plus',508),(7,3,'Silver Plus',470),(8,5,'Platinum Plus',324),(9,9,'Bronze Plus',241),(10,10,'Elite Plus',621);
/*!40000 ALTER TABLE `Loyalty_Program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nutritional_Info`
--

DROP TABLE IF EXISTS `Nutritional_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nutritional_Info` (
  `Nutritional_Info_ID` int NOT NULL,
  `Calories` int DEFAULT NULL,
  `Fat` decimal(5,2) DEFAULT NULL,
  `Carbohydrates` decimal(5,2) DEFAULT NULL,
  `Protein` decimal(5,2) DEFAULT NULL,
  `Last_Update_Date` date DEFAULT NULL,
  PRIMARY KEY (`Nutritional_Info_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nutritional_Info`
--

LOCK TABLES `Nutritional_Info` WRITE;
/*!40000 ALTER TABLE `Nutritional_Info` DISABLE KEYS */;
INSERT INTO `Nutritional_Info` VALUES (1,238,20.96,32.34,3.10,'2023-01-19'),(2,114,21.40,41.45,14.78,'2023-12-27'),(3,312,21.78,21.50,7.61,'2023-03-29'),(4,267,16.59,16.08,11.35,'2023-10-25'),(5,391,13.15,41.91,8.01,'2023-09-13'),(6,190,10.39,26.15,3.65,'2023-10-08'),(7,116,11.29,39.79,4.14,'2023-01-01'),(8,216,22.12,10.04,7.88,'2023-05-27'),(9,322,23.41,23.30,10.14,'2024-02-25'),(10,119,24.39,26.14,4.53,'2023-03-21');
/*!40000 ALTER TABLE `Nutritional_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `Order_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Payment_ID` int DEFAULT NULL,
  `Product_ID` int DEFAULT NULL,
  `Discount_ID` int DEFAULT NULL,
  `Package_ID` int DEFAULT NULL,
  `Catering_ID` int DEFAULT NULL,
  `Order_Date` date DEFAULT NULL,
  `Total_Amount` decimal(10,2) DEFAULT NULL,
  `Order_Status` varchar(50) DEFAULT NULL,
  `Order_Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,1,1,1,1,1,1,'2023-09-21',80.75,'Completed','In-Store'),(2,2,2,2,2,2,2,'2023-11-13',68.80,'Processing','Online'),(3,3,3,3,3,3,3,'2024-03-16',60.39,'Shipped','In-Store'),(4,4,4,4,4,4,4,'2024-03-20',28.86,'Completed','Online'),(5,5,5,5,5,5,5,'2023-07-10',72.88,'Cancelled','Online'),(6,6,6,6,6,6,6,'2024-03-26',38.10,'Processing','In-Store'),(7,7,7,7,7,7,7,'2023-11-18',29.67,'Completed','Online'),(8,8,8,8,8,8,8,'2024-03-31',22.22,'Shipped','In-Store'),(9,9,9,9,9,9,9,'2023-08-18',48.65,'Pending','Online'),(10,10,10,10,10,10,10,'2024-02-17',61.05,'Completed','In-Store');
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Package`
--

DROP TABLE IF EXISTS `Package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Package` (
  `Package_ID` int NOT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Package_Type` varchar(50) DEFAULT NULL,
  `Package_Cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Package_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `Package_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Package`
--

LOCK TABLES `Package` WRITE;
/*!40000 ALTER TABLE `Package` DISABLE KEYS */;
INSERT INTO `Package` VALUES (1,1,'Birthday Box',20.00),(2,2,'Wedding Tray',49.24),(3,3,'Breakfast Box',29.19),(4,4,'Dessert Sampler',17.17),(5,5,'Mini Pastry Set',42.45),(6,6,'Holiday Platter',46.88),(7,7,'Cookie Tin',25.58),(8,8,'Cupcake Crate',33.19),(9,9,'Bread Basket',34.59),(10,10,'Corporate Box',40.10);
/*!40000 ALTER TABLE `Package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `Payment_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Tax_ID` int DEFAULT NULL,
  `Order_ID` int DEFAULT NULL,
  `Payment_Date` date DEFAULT NULL,
  `Payment_Method` varchar(50) DEFAULT NULL,
  `Amount_Paid` decimal(10,2) DEFAULT NULL,
  `GiftCard_ID` int DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `fk_payment_giftcard` (`GiftCard_ID`),
  CONSTRAINT `fk_payment_giftcard` FOREIGN KEY (`GiftCard_ID`) REFERENCES `Gift_Card` (`Gift_Card_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,1,1,1,'2023-11-21','Credit Card',87.41,NULL),(2,2,2,2,'2024-03-28','Debit Card',74.48,NULL),(3,3,3,3,'2023-07-31','Cash',65.37,NULL),(4,4,4,4,'2024-02-16','Online Payment',31.24,NULL),(5,5,5,5,'2024-01-21','Credit Card',78.89,NULL),(6,6,6,6,'2023-06-19','Cash',41.24,NULL),(7,7,7,7,'2023-06-20','Credit Card',32.12,NULL),(8,8,8,8,'2024-01-14','Online Payment',24.05,NULL),(9,9,9,9,'2023-08-25','Debit Card',52.66,NULL),(10,10,10,10,'2024-02-18','Credit Card',66.09,NULL);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `Product_ID` int NOT NULL,
  `Recipe_ID` int DEFAULT NULL,
  `Nutrional_Info_ID` int DEFAULT NULL,
  `Inventory_ID` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Stock_Quantity` int DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,1,1,101,5.99,120,'Bakery'),(2,2,2,102,7.49,80,'Pastries'),(3,3,3,103,12.99,90,'Cakes'),(4,4,4,104,9.99,100,'Cupcakes'),(5,5,5,105,3.49,60,'Beverages'),(6,6,6,106,4.99,70,'Pastries'),(7,7,7,107,8.99,150,'Bakery'),(8,8,8,108,10.99,95,'Cakes'),(9,9,9,109,6.49,40,'Frozen'),(10,10,10,110,5.99,55,'Spices');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rating`
--

DROP TABLE IF EXISTS `Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rating` (
  `Rating_ID` int NOT NULL,
  `Rating_Score` int DEFAULT NULL,
  `Product_ID` int DEFAULT NULL,
  PRIMARY KEY (`Rating_ID`),
  KEY `fk_rating_product` (`Product_ID`),
  CONSTRAINT `fk_rating_product` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rating`
--

LOCK TABLES `Rating` WRITE;
/*!40000 ALTER TABLE `Rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipe` (
  `Recipe_ID` int NOT NULL AUTO_INCREMENT,
  `Cook_Time` int NOT NULL,
  `Prep_Time` int NOT NULL,
  PRIMARY KEY (`Recipe_ID`),
  CONSTRAINT `Recipe_chk_1` CHECK ((`Cook_Time` >= 0)),
  CONSTRAINT `Recipe_chk_2` CHECK ((`Prep_Time` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;
INSERT INTO `Recipe` VALUES (1,34,0),(2,45,20),(3,15,5),(4,30,15),(5,60,30),(6,25,12),(7,10,8),(8,50,25),(9,35,18),(10,40,20);
/*!40000 ALTER TABLE `Recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `Review_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Product_ID` int DEFAULT NULL,
  `Rating_ID` int DEFAULT NULL,
  `Review_Text` text,
  `Review_Date` date DEFAULT NULL,
  PRIMARY KEY (`Review_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES (1,1,101,5,'Amazing bread! The texture and taste are perfect.','2025-03-15'),(2,2,102,4,'Great selection of pastries, but the service was a bit slow.','2025-03-16'),(3,3,103,5,'The cakes are delicious! Best I\'ve had in the city.','2025-03-17'),(4,4,104,3,'The cupcakes were a bit dry. Could use more frosting.','2025-03-18'),(5,5,105,5,'Love the coffee! Perfect balance and great aroma.','2025-03-19'),(6,6,106,4,'The croissants were good, but a bit too buttery for my taste.','2025-03-20'),(7,7,107,5,'Everything I’ve tried here has been delicious. Highly recommend.','2025-03-21'),(8,8,108,4,'Very good pastries, but the store was a bit crowded during my visit.','2025-03-22'),(9,9,109,5,'I ordered a cake for an event and it was a huge hit. So glad I chose this bakery.','2025-03-23'),(10,10,110,2,'The cookies were stale, not impressed this time.','2025-03-24');
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `Role_ID` int NOT NULL,
  `Role_Name` varchar(50) DEFAULT NULL,
  `Role_Description` text,
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Bakery Manager','Manages bakery operations and staff'),(2,'Assistant Baker','Assists head baker with dough and baking tasks'),(3,'Pastry Chef','Prepares pastries and specialty desserts'),(4,'Front Counter Staff','Takes orders and handles customer service at the front'),(5,'Dishwasher','Washes dishes and keeps the kitchen clean'),(6,'Packaging Clerk','Packages baked goods for display and delivery'),(7,'Order Coordinator','Coordinates online and in-store orders'),(8,'Barista','Prepares coffee and beverages for customers'),(9,'Delivery Driver','Delivers orders to customers and events'),(10,'Bakery Cleaner','Maintains cleanliness of the bakery and equipment');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Store_Location`
--

DROP TABLE IF EXISTS `Store_Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Store_Location` (
  `Store_Loc_ID` int NOT NULL,
  `Store_Name` varchar(100) DEFAULT NULL,
  `Store_Zip` varchar(10) DEFAULT NULL,
  `Store_State` varchar(50) DEFAULT NULL,
  `Store_Address` varchar(255) DEFAULT NULL,
  `Store_City` varchar(100) DEFAULT NULL,
  `Store_Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Store_Loc_ID`),
  CONSTRAINT `Store_Location_chk_1` CHECK (regexp_like(`Store_Zip`,_utf8mb4'^[0-9]{5}(-[0-9]{4})?$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Store_Location`
--

LOCK TABLES `Store_Location` WRITE;
/*!40000 ALTER TABLE `Store_Location` DISABLE KEYS */;
INSERT INTO `Store_Location` VALUES (1,'Mamas Little Bakery','77001','TX','1001 Sugar St','Houston','713-555-1234');
/*!40000 ALTER TABLE `Store_Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `Supplier_ID` int NOT NULL AUTO_INCREMENT,
  `Supplier_Name` varchar(100) NOT NULL,
  `Supplier_Zip` varchar(10) NOT NULL,
  `Supplier_State` char(2) NOT NULL,
  `Supplier_Address` varchar(255) NOT NULL,
  `Store_City` varchar(100) NOT NULL,
  `Supplier_Email` varchar(100) DEFAULT NULL,
  `Supplier_Stock` int DEFAULT NULL,
  PRIMARY KEY (`Supplier_ID`),
  CONSTRAINT `Supplier_chk_1` CHECK (regexp_like(`Supplier_Zip`,_utf8mb4'^[0-9]{5}(-[0-9]{4})?$'))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'FreshFarm','78001','TX','7891 Supplier St','Houston','contact@freshfarm.com',422),(2,'BakersSupply','78002','TX','7892 Supplier St','Houston','contact@bakerssupply.com',171),(3,'DailyGoods','78003','TX','7893 Supplier St','Houston','contact@dailygoods.com',215),(4,'FoodMart','78004','TX','7894 Supplier St','Houston','contact@foodmart.com',147),(5,'BakePlus','78005','TX','7895 Supplier St','Houston','contact@bakeplus.com',43),(6,'ChefSource','78006','TX','7896 Supplier St','Houston','contact@chefsource.com',177),(7,'GourmetPro','78007','TX','7897 Supplier St','Houston','contact@gourmetpro.com',99),(8,'TastyLine','78008','TX','7898 Supplier St','Houston','contact@tastyline.com',351),(9,'NutriSupply','78009','TX','7899 Supplier St','Houston','contact@nutrisupply.com',246),(10,'MegaFoods','78001','TX','78910 Supplier St','Houston','contact@megafoods.com',240);
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tax`
--

DROP TABLE IF EXISTS `Tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tax` (
  `Tax_ID` int NOT NULL,
  `Tax_Amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Tax_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tax`
--

LOCK TABLES `Tax` WRITE;
/*!40000 ALTER TABLE `Tax` DISABLE KEYS */;
INSERT INTO `Tax` VALUES (1,6.66),(2,5.68),(3,4.98),(4,2.38),(5,6.01),(6,3.14),(7,2.45),(8,1.83),(9,4.01),(10,5.04);
/*!40000 ALTER TABLE `Tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Training`
--

DROP TABLE IF EXISTS `Training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Training` (
  `Training_ID` int NOT NULL,
  `Employee_ID` int DEFAULT NULL,
  `Training_Name` varchar(100) DEFAULT NULL,
  `Completion_Date` date DEFAULT NULL,
  PRIMARY KEY (`Training_ID`),
  KEY `Employee_ID` (`Employee_ID`),
  CONSTRAINT `Training_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Training`
--

LOCK TABLES `Training` WRITE;
/*!40000 ALTER TABLE `Training` DISABLE KEYS */;
INSERT INTO `Training` VALUES (1,1,'Customer Service Excellence','2025-02-20'),(2,2,'Food Safety & Hygiene','2025-03-02'),(3,3,'Advanced Baking Techniques','2025-03-10'),(4,4,'Inventory Management Systems','2025-03-12'),(5,5,'Barista Skills','2025-03-14'),(6,6,'Safety Protocols in the Kitchen','2025-03-16'),(7,7,'Team Leadership & Management','2025-03-18'),(8,8,'Customer Feedback Management','2025-03-20'),(9,9,'Catering Event Coordination','2025-03-22'),(10,10,'Food Presentation & Plating','2025-03-24');
/*!40000 ALTER TABLE `Training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Waste_Log`
--

DROP TABLE IF EXISTS `Waste_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Waste_Log` (
  `WasteLog_ID` int NOT NULL AUTO_INCREMENT,
  `Date_of_Waste` date NOT NULL,
  `Inventory_ID` int DEFAULT NULL,
  PRIMARY KEY (`WasteLog_ID`),
  KEY `fk_waste_inventory` (`Inventory_ID`),
  CONSTRAINT `fk_waste_inventory` FOREIGN KEY (`Inventory_ID`) REFERENCES `Inventory` (`Inventory_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Waste_Log`
--

LOCK TABLES `Waste_Log` WRITE;
/*!40000 ALTER TABLE `Waste_Log` DISABLE KEYS */;
INSERT INTO `Waste_Log` VALUES (1,'2025-03-15',201),(2,'2025-03-16',202),(3,'2025-03-17',203),(4,'2025-03-18',204),(5,'2025-03-19',205),(6,'2025-03-20',206),(7,'2025-03-21',207),(8,'2025-03-22',208),(9,'2025-03-23',209),(10,'2025-03-24',210);
/*!40000 ALTER TABLE `Waste_Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-16 22:28:44
