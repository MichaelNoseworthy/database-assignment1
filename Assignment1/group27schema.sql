-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: group27schema
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `appointment_log`
--

DROP TABLE IF EXISTS `appointment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_log` (
  `Clinic_Staff_ID` int NOT NULL,
  `Patient_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  `Nurse_ID` int NOT NULL,
  `Medical_Log_ID` int NOT NULL,
  `Paid_Balance` decimal(9,2) DEFAULT NULL,
  `Appointment` datetime DEFAULT NULL,
  `Appointment_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Clinic_Staff_ID`,`Patient_ID`,`Doctor_ID`,`Nurse_ID`,`Medical_Log_ID`),
  KEY `fk_Clinic_Staff_has_Patient_Patient1_idx` (`Patient_ID`),
  KEY `fk_Clinic_Staff_has_Patient_Clinic_Staff1_idx` (`Clinic_Staff_ID`),
  KEY `fk_Appoitntment_Log_Doctor1_idx` (`Doctor_ID`),
  KEY `fk_Appoitntment_Log_Nurse1_idx` (`Nurse_ID`),
  KEY `fk_Appoitntment_Log_Medical_Log1_idx` (`Medical_Log_ID`),
  CONSTRAINT `fk_Appoitntment_Log_Doctor1` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`Doctor_ID`),
  CONSTRAINT `fk_Appoitntment_Log_Medical_Log1` FOREIGN KEY (`Medical_Log_ID`) REFERENCES `medical_log` (`Medical_Log_ID`),
  CONSTRAINT `fk_Appoitntment_Log_Nurse1` FOREIGN KEY (`Nurse_ID`) REFERENCES `nurse` (`Nurse_ID`),
  CONSTRAINT `fk_Clinic_Staff_has_Patient_Clinic_Staff1` FOREIGN KEY (`Clinic_Staff_ID`) REFERENCES `clinic_staff` (`Clinic_Staff_ID`),
  CONSTRAINT `fk_Clinic_Staff_has_Patient_Patient1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_log`
--

LOCK TABLES `appointment_log` WRITE;
/*!40000 ALTER TABLE `appointment_log` DISABLE KEYS */;
INSERT INTO `appointment_log` VALUES (117,1102,1,2002,2,0.00,'2020-01-31 12:30:00','Checked-in'),(117,1110,3,2006,10,0.00,'2019-07-14 07:25:00','Checked-in'),(117,1115,6,2002,15,25.00,'2020-12-20 00:00:00','No Show'),(118,1102,1,2004,5,0.00,'2020-02-09 08:33:00','Checked-in'),(118,1102,1,2006,4,15.00,'2020-02-05 07:00:00','Checked-in'),(118,1111,3,2003,11,0.00,'2019-07-14 02:30:00','Checked-in'),(118,1115,6,2001,6,0.00,'2020-06-20 00:00:00','Checked-in'),(119,1101,2,2001,1,0.00,'2020-03-20 09:00:00','Checked-in'),(119,1102,1,2005,7,50.00,'2020-12-03 01:00:00','Canceled'),(119,1112,5,2006,12,0.00,'2021-01-31 05:25:00','Left Without Treatment'),(119,1113,10,2005,13,50.00,'2020-12-01 08:00:00','Canceled'),(120,1108,7,2006,8,25.00,'2021-12-14 01:25:00','No Show'),(120,1109,4,2004,9,0.00,'2018-12-31 04:30:00','Checked-in'),(120,1114,2,2001,14,25.00,'2020-12-20 06:30:00','No Show'),(121,1102,1,2001,3,0.00,'2020-02-03 10:25:00','Checked-in');
/*!40000 ALTER TABLE `appointment_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_staff`
--

DROP TABLE IF EXISTS `clinic_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_staff` (
  `Clinic_Staff_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Province` char(2) DEFAULT NULL,
  `Postal_Code` varchar(6) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `Phone_Number` varchar(24) DEFAULT NULL,
  `SIN` char(9) DEFAULT NULL,
  PRIMARY KEY (`Clinic_Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_staff`
--

LOCK TABLES `clinic_staff` WRITE;
/*!40000 ALTER TABLE `clinic_staff` DISABLE KEYS */;
INSERT INTO `clinic_staff` VALUES (101,'John','Smith','443 Watson Ave','Toronto','ON','M1N7C7','s.john@fake.com','Doctor','6471234455','989102786'),(102,'Jan','Smithe','2356 John St','Toronto','ON','L1W2R5','smithejan@fake.com','Doctor','4161789987','123654987'),(103,'Raplh','Phines','104 Weather Rd','Scaboroguh','ON','M2C9L1','rphine@fake.com','Doctor','(416)-222-4128','364752145'),(104,'Zack','Jameson','7458 Hampton Blvd','Markham','ON','C4R3M2','zack.jameson@fake.com','Doctor','(905)-149-5589','753159456'),(105,'Kelly','April','345 Runningman Rd','Toronto ','ON','L1C5B9','april.kellie@fake.com','Doctor','(416)-654-7897','456159777'),(106,'Juanita','Stinson','1291 Commerse St','Scarborough','ON','L1W4C7','drstinson@fake.com','Doctor','(647)-665-4412','112559784'),(107,'Jamal','Stevens','987 Willowbrook Ave','Scarboroguh','ON','M4O9V0','jamalstevens@fake.com','Doctor','(416)-215-4889','665772145'),(108,'Jim','Halpert','7421 Bay St','Toronto','ON','R5C8Z9','halpertjim@fake.com','Doctor','(905)-778-4453','979464131'),(109,'Pam','Scott','45 Lacelle Blvd','Toronto','ON','C3V9B9','pammyscott@fake.com','Doctor','(416)-645-7799','555113479'),(110,'Juan','Rodrigo','100 Peter St','Toronto','ON','L5V9B1','rodrigoj@fake.com','Doctor','(416)-553-1466','221440001'),(111,'Janette','Hemming','987 Pickel Ave','Scarborough','ON','M1W7V3','hemmingjan@fake.com','Nurse','(416)-987-1134','102005377'),(112,'Amy','Xan','4111 Randell Rd','Markham','ON','W1M6Q2','amy.xan@fake.com','Nurse','(905)-741-5543','456722114'),(113,'Kevin','Man','75 Dovercourt Ave','Toronto','ON','B3C6J9','kevinman@fake.com','Nurse','(416)-001-3578','963214789'),(114,'Jake','Rende','541 John Street','Toronto','ON','M4N6N6','rendej@fake.com','Nurse','(647)-889-1002','001003546'),(115,'Kindra','Bennet','961 Roseway Crt','Scarborough','ON','L0V4T1','bennetkin@fake.com','Nurse','(647)-741-6643','102469999'),(116,'Whitney','Houston','14 Texas Rd','Etobicoke','ON','T6T9N0','houstonw@fake.com','Nurse','(905)-903-2231','977553111'),(117,'Jeff','Frank','778 Baldwin Ave','Scarborough','ON','M1N3E2','jefff@fake.com','Secetary','(905)-451-7895','112336549'),(118,'Emily','Carr','9123 Rex Road','Toronto','ON','L0V3M3','ecarr@fake.com','Secetary','(416)-316-0003','345789310'),(119,'Rachel','Wood','11-B Montana Crt','Toronto','ON','R4L4N4','woodrach@fake.com','Secetary','(647)-012-9915','991235789'),(120,'Francine','Dryer','78966 Round Rd','Scarborough','ON','O1O0I0','frandryer@fake.com','Secetary','(416)-111-9055','002321456'),(121,'Maxine','Randall','1-A Lexington Blvd','Markham','ON','7B0J1L','maxrand@fake.com','Secetary','(905)-123-0991','772354693'),(122,'Jack','Jensen','3123 Brailey Ln','Etobicoke','ON','L1W1C7','jjensen@fake.com','Admin','(905)-839-0766','456123989'),(123,'Arch','Benn','216 Balsam Rd','Toronto','ON','M4V9H1','arbenn@fake.com','Admin','(416)-629-1109','845132697'),(124,'Ryan','Reynolds','114 Homewood St','Toronto','ON','N3P0C0','rreynolds@fake.com','Manager','(416)-066-6111','666000444');
/*!40000 ALTER TABLE `clinic_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `Doctor_ID` int NOT NULL,
  `Clinic_Staff_ID` int NOT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Doctor_ID`),
  KEY `fk_Doctor_Clinic_Staff1_idx` (`Clinic_Staff_ID`),
  CONSTRAINT `fk_Doctor_Clinic_Staff1` FOREIGN KEY (`Clinic_Staff_ID`) REFERENCES `clinic_staff` (`Clinic_Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,101,'John','Smith'),(2,102,'Jan','Smithe'),(3,103,'Ralph','Phines'),(4,104,'Zack','Jameson'),(5,105,'Kelly','April'),(6,106,'Juanita','Stinson'),(7,107,'Jamal','Stevens'),(8,108,'Jim','Halpert'),(9,109,'Pam','Scott'),(10,110,'Juan','Rodrigo');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_log`
--

DROP TABLE IF EXISTS `medical_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_log` (
  `Medical_Log_ID` int NOT NULL,
  `Nurse_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  `Patient_ID` int NOT NULL,
  `Prescriptions` varchar(100) DEFAULT NULL,
  `Allergies` varchar(100) DEFAULT NULL,
  `Symptoms` varchar(50) DEFAULT NULL,
  `Visit_Reason` varchar(100) DEFAULT NULL,
  `Weight(lbs)` varchar(3) DEFAULT NULL,
  `Height(cm)` varchar(3) DEFAULT NULL,
  `Notes` varchar(100) DEFAULT NULL,
  `Temperature(C)` decimal(5,1) DEFAULT NULL,
  `Blood_Pressure(s/d)` varchar(7) DEFAULT NULL,
  `Diagnosis` varchar(100) DEFAULT NULL,
  `Treatment` varchar(100) DEFAULT NULL,
  `Tests` varchar(100) DEFAULT NULL,
  `Referrals` varchar(50) DEFAULT NULL,
  `Specialist_ID` int DEFAULT NULL,
  PRIMARY KEY (`Medical_Log_ID`),
  KEY `fk_Medical_Log_Nurse1_idx` (`Nurse_ID`),
  KEY `fk_Medical_Log_Doctor1_idx` (`Doctor_ID`),
  KEY `fk_Medical_Log_Patient1_idx` (`Patient_ID`),
  KEY `fk_Medical_Log_Specialist1_idx` (`Specialist_ID`),
  CONSTRAINT `fk_Medical_Log_Doctor1` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`Doctor_ID`),
  CONSTRAINT `fk_Medical_Log_Nurse1` FOREIGN KEY (`Nurse_ID`) REFERENCES `nurse` (`Nurse_ID`),
  CONSTRAINT `fk_Medical_Log_Patient1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  CONSTRAINT `fk_Medical_Log_Specialist1` FOREIGN KEY (`Specialist_ID`) REFERENCES `specialist` (`Specialist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_log`
--

LOCK TABLES `medical_log` WRITE;
/*!40000 ALTER TABLE `medical_log` DISABLE KEYS */;
INSERT INTO `medical_log` VALUES (1,2001,2,1101,'Tylenol 3','Peanuts','Back pain','back hurts','140','120','No notes yet',37.1,'120/70','Herniated Disk','Therapy and Chiro','X-ray','Bonesaw',1001),(2,2002,1,1102,'Oxycodone','Whipped Cream','Back pain','fell while on top of a chair now back is hurting','110','100','If it gets worse, must get surgery.',39.0,'120/80','Verterbrae stress fracture','Rest and drink prescription','X-ray','Bonesaw',1001),(3,2001,1,1102,'Refuses to take prescription','N/A','Leg broken','Helped a civilian from getting hit by a car','190','160','He\'s super strong',37.1,'120/80','Leg popped out of socket','Surgery','X-ray','Bonesaw',1001),(4,2006,1,1102,'Bio-Flu','N/A','Flu','Doctor\'s note','132','110','Just went to get a doc. Note',36.4,'110/50','Flu','Drink medicine','Blood Pressure check, and tonsil check','N/A',1003),(5,2004,1,1102,'N/A','N/A','Vomitting','Nausea and vomitting','111','100','Horribly sick, needs blood work',35.8,'160/80','Not yet known','Not yet known','Blood work and dialysis','Bluf',1010),(6,2003,1,1102,'Tramadol','Sun flower seeds','Chest pains','Chemo therapy','100','90','Chemo therapy',38.0,'120/80','Breast Cancer','Chemo Therapy','Ultrasound','Cancer1',1003),(7,2005,9,1114,'N/A','Anesthesia','Flu','Sprain','158','119','Went to get doc\'s note',36.9,'120/75','Flu','Drink meds','Blood pressure, and lung check','N/A',1005),(8,2006,7,1108,'Dipyridamole','Sun flower seeds','chest hurts','Emergency heart attack','270','140','Immediate surgery',36.7,'200/60','Heart attack','Surgery','Ultra sound, X-ray, blood work','Heart Burning',1006),(9,2004,4,1109,'Adderrall','Sesame seeds','Can\'t focus','Went to see doctor to get higher dose for prescription','90','90','N/A',36.2,'120/80','ADHD','Dring prescription','Cognitive test','N/A',1008),(10,2006,3,1110,'Anti-biotics','Opiods','Joint\'s hurting','Got cut by a rusty blade','150','132','Got cut by a blade and now is feeling horrible, must get admitted',37.5,'140/60','Tetanus infection','Drink anti-biotics and must observed by doctor','Physical exam','N/A',1009),(11,2003,3,1111,'Anti-biotics','Pork','Joint\'s hurting','Stepped on a rusty nail','155','121','stepped on a rusty nail and must be admitted',40.1,'100/60','Tetanus','Drink prescription','Physical','N/A',1005),(12,2006,5,1112,'zanamivir','powder','Coughing, nausea, feels ill','Might potentially has covid','132','111','Has covid',39.2,'120/75','Covid','Quarantine and drink prescription meds','Covid test','N/A',1009),(13,2005,10,1113,'N/A','N/A','N/A','Daily check up','110','98','Check up',38.3,'120/80','N/A','N/A','Physicals','N/A',1003),(14,2001,2,1114,'Tylenol 3','N/A','Pulled Muscle','Biceps torn off from work','190','102','Needs immediate surgery',41.1,'150/80','Biceps Tendon Tear','Surgery','X-ray, ultra sound','Bonesaw',1001),(15,2003,6,1115,'Chemo therapy','N/A','Lung Cancer','Chemo Therapy','90','90','Third round chemo',36.6,'110/60','Lung Cancer','Chemo Therapy','Blood work, Ultrasound','Cancer1',1002);
/*!40000 ALTER TABLE `medical_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `Nurse_ID` int NOT NULL,
  `Clinic_Staff_ID` int NOT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Nurse_ID`),
  KEY `fk_Nurse_Clinic_Staff1_idx` (`Clinic_Staff_ID`),
  CONSTRAINT `fk_Nurse_Clinic_Staff1` FOREIGN KEY (`Clinic_Staff_ID`) REFERENCES `clinic_staff` (`Clinic_Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (2001,111,'Janette','Henning'),(2002,112,'Amy','Xan'),(2003,113,'Kevin','Man'),(2004,114,'Jake','Rende'),(2005,115,'Kindra','Bennet'),(2006,116,'Whitney','Houston');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `Patient_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Age` varchar(3) DEFAULT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Gender` varchar(30) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Province` char(2) DEFAULT NULL,
  `Postal_Code` varchar(6) DEFAULT NULL,
  `Health_Card` varchar(12) DEFAULT NULL,
  `Patient_Type` varchar(45) DEFAULT NULL,
  `Family_Doctor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `fk_Patient_Doctor1_idx` (`Doctor_ID`),
  CONSTRAINT `fk_Patient_Doctor1` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1101,2,'Chris','Marino','29','(416)-771-0981','marino245@fake.com','Male','90 Niagara Ave','Toronto','ON','M1C0M1','152-987-102C','Enrolled','Dr. Smithe'),(1102,1,'Jennifer','White','40','(416)-091-8991','jwhite@fake.com','Female','7501 Dovercourt Rd','Toronto','ON','H1S5B0','987-111-300F','Enrolled','Dr. Smith'),(1103,2,'Kent','Clark','45','(647)-111-0912','kentman@fake.com','Male','1111 Pine St','Toronto','ON','C9P7Y7','245-013-943F','Enrolled','Dr. Smithe'),(1104,10,'Ralph','Wiggum','18','(905)-447-0236','ralwiggs@fake.com','Male','963 Agincourt St','Toronto','ON','B8C8C8','741-654-000E','Walk-In',''),(1105,6,'Lisa','McMann','22','(416)-201-3331','lmmann@fake.com','Female','14-B Dupont Ave','Toronto','ON','M1W2C1','977-001-325A','Enrolled','Dr. Stinson'),(1106,8,'Nancy','Marino','65','(416)-556-7416','n.marino@fake.com','Female','87 Blake Rd','Toronto','ON','M1C9M2','774-023-111C','Enrolled','Dr. Halpert'),(1107,9,'Jake','Trapper','33','(647)-007-8391','trapjake@fake.com','Male','123 Johson Crt','Toronto','ON','W8N1V9','333-749-661A','Walk-In',''),(1108,7,'Maurice','Johnson','75','(416)-121-0101','johnsonmaur@fake.com','Male','1111 Rally rd','Toronto','ON','M1C8O1','114-811-354F','Enrolled','Dr. Stevens'),(1109,4,'Anna','Mars','26','(647)-900-1782','amarsa@fake.com','Female','652 Queen St E','Toronto','ON','L5L8X0','669-789-210E','Walk-In',''),(1110,3,'Julien','Dillon','41','(416)-513-3452','juldil@fake.com','Male','2002 Car Rd','Toronto','ON','N1N3I3','123-927-111A','Enrolled','Dr. Phines'),(1111,3,'Mark','Dillon','17','(416)-512-3452','mdillon@fake.com','Male','2002 Car Rd','Toronto','ON','N1N3I3','354-987-324B','Enrolled','Dr.Phines'),(1112,5,'Martin','Michealson','70','(416)-911-1119','mmicheals@fake.com','Male','19 Rose Ln','Toronto','ON','V9P8Z9','654-953-930F','Enrolled','Dr. April'),(1113,10,'Mana','Mune','30','(905)-501-9910','mmune@fake.com','Female','2136 Spadina Ave','Toronto','ON','Z0Z9B1','430-364-821E','Walk-In',''),(1114,2,'Dan','Wiggum','52','(416)-888-3322','dwiggum@fake.com','Male','963 Agincourt St','Toronto','ON','N7P1M1','971-325-223F','Enrolled','Dr. Smithe'),(1115,6,'Courtney','Callum','37','(647)-543-2201','corcallum@fake.com','Female','933 Kelp Rd','Toronto','ON','M1W2B9','852-311-111E','Enrolled','Dr. Stinson');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_roll`
--

DROP TABLE IF EXISTS `pay_roll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_roll` (
  `Pay_Roll_ID` int NOT NULL,
  `Work_Schedule_ID` int NOT NULL,
  `Clinic_Staff_ID` int DEFAULT NULL,
  `Type_Of_Salary` varchar(45) DEFAULT NULL,
  `Rate_of_Pay` decimal(9,2) DEFAULT NULL,
  `Salary_Amount` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`Pay_Roll_ID`),
  KEY `fk_Pay_Roll_Work_Schedule1_idx` (`Work_Schedule_ID`),
  KEY `fk_Pay_Roll_Clinic_Staff1_idx` (`Clinic_Staff_ID`),
  CONSTRAINT `fk_Pay_Roll_Clinic_Staff1` FOREIGN KEY (`Clinic_Staff_ID`) REFERENCES `clinic_staff` (`Clinic_Staff_ID`),
  CONSTRAINT `fk_Pay_Roll_Work_Schedule1` FOREIGN KEY (`Work_Schedule_ID`) REFERENCES `work_schedule` (`Work_Schedule_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_roll`
--

LOCK TABLES `pay_roll` WRITE;
/*!40000 ALTER TABLE `pay_roll` DISABLE KEYS */;
INSERT INTO `pay_roll` VALUES (4001,1001,101,'Salary',0.00,11538.46),(4002,1002,102,'Salary',0.00,11538.46),(4003,1003,103,'Salary',0.00,11538.46),(4004,1004,104,'Salary',0.00,10576.92),(4005,1005,105,'Salary',0.00,10576.92),(4006,1006,106,'Salary',0.00,10576.92),(4007,1007,107,'Salary',0.00,8653.84),(4008,1008,108,'Salary',0.00,8653.84),(4009,1009,109,'Salary',0.00,8653.84),(4010,1010,110,'Salary',0.00,8653.84),(4011,1011,111,'Hourly',40.00,NULL),(4012,1012,112,'Hourly',40.00,NULL),(4013,1013,113,'Hourly',34.00,NULL),(4014,1014,114,'Hourly',34.00,NULL),(4015,1015,115,'Hourly',34.00,NULL),(4016,1016,116,'Hourly',29.00,NULL),(4017,1017,117,'Hourly',25.00,NULL),(4018,1018,118,'Hourly',25.00,NULL),(4019,1019,119,'Hourly',22.50,NULL),(4020,1020,120,'Hourly',22.50,NULL),(4021,1021,121,'Hourly',21.60,NULL),(4022,1022,122,'Hourly',26.00,NULL),(4023,1023,123,'Hourly',23.45,NULL),(4024,1024,124,'Hourly',48.00,NULL);
/*!40000 ALTER TABLE `pay_roll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialist` (
  `Specialist_ID` int NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Phone_Number` varchar(24) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  `Company_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Specialist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialist`
--

LOCK TABLES `specialist` WRITE;
/*!40000 ALTER TABLE `specialist` DISABLE KEYS */;
INSERT INTO `specialist` VALUES (1001,'230 Front St','(289)-902-4902','bonesaw@fake.ca','Bone and Muscle','Bonesaw'),(1002,'333 College St','(647)-456-2344','bluf@fake.ca','Blood and Flu','Bluf'),(1003,'479 Queen St','(416)-972-0484','heartburning@fake.ca','Heart Surgery','Heart Burning'),(1004,'323 Harbord St','(647)-902-3443','cc@fake.ca','Cancer treatment','Cancer1'),(1005,'230 Front St','(289)-902-4902','ultra@fake.ca','Ultra Sound','SoundUltra'),(1006,'444 Queen st','(647)-222-222','covid@fake.ca','Covid Treatment','Co-19'),(1007,'1469 Frank Rd','(416)-111-0091','chriopractor@fake.com','Chriopractor','Alignment co.'),(1008,'910 Bayview Ave','(416)-901-0012','sprainsrus@fake.com','Physiotherapy','Sprains and Pains'),(1009,'1343 Avenue St','(647)-012-9101','bloodlab@fake.ca','Blood Work','Health Link'),(1010,'1200 Danforth Ave','(416)-999-1122','osteobody@fake.com','Osteopath','Better U ');
/*!40000 ALTER TABLE `specialist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_schedule`
--

DROP TABLE IF EXISTS `work_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_schedule` (
  `Work_Schedule_ID` int NOT NULL,
  `Clinic_Staff_ID` int NOT NULL,
  `Shift` varchar(45) DEFAULT NULL,
  `Total_Hrs_Worked` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`Work_Schedule_ID`),
  KEY `fk_Work_Schedule_Clinic_Staff1_idx` (`Clinic_Staff_ID`),
  CONSTRAINT `fk_Work_Schedule_Clinic_Staff1` FOREIGN KEY (`Clinic_Staff_ID`) REFERENCES `clinic_staff` (`Clinic_Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_schedule`
--

LOCK TABLES `work_schedule` WRITE;
/*!40000 ALTER TABLE `work_schedule` DISABLE KEYS */;
INSERT INTO `work_schedule` VALUES (1001,101,'Day',30.00),(1002,102,'Day',30.00),(1003,103,'Night',30.00),(1004,104,'Day',30.00),(1005,105,'Night',30.00),(1006,106,'Day',30.00),(1007,107,'Night',30.00),(1008,108,'Day',30.00),(1009,109,'Night',30.00),(1010,110,'Night',30.00),(1011,111,'Day',30.00),(1012,112,'Night',28.00),(1013,113,'Night',29.00),(1014,114,'Day',30.00),(1015,115,'Day',30.00),(1016,116,'Night',30.00),(1017,117,'Day',30.00),(1018,118,'Day',30.00),(1019,119,'Day',30.00),(1020,120,'Night',25.00),(1021,121,'Night',25.00),(1022,122,'Day',30.00),(1023,123,'Day',30.00),(1024,124,'Day',30.00);
/*!40000 ALTER TABLE `work_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-10 23:01:40
