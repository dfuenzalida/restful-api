-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: sample
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.1

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
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `DISCOUNT_CODE` char(1) NOT NULL,
  `ZIP` varchar(10) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `ADDRESSLINE1` varchar(30) DEFAULT NULL,
  `ADDRESSLINE2` varchar(30) DEFAULT NULL,
  `CITY` varchar(25) DEFAULT NULL,
  `STATE` char(2) DEFAULT NULL,
  `PHONE` char(12) DEFAULT NULL,
  `FAX` char(12) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `CREDIT_LIMIT` int(11) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  KEY `FOREIGNKEY_DISCOUNT_CODE` (`DISCOUNT_CODE`),
  KEY `FOREIGNKEY_ZIP` (`ZIP`),
  CONSTRAINT `CUSTOMER_ibfk_1` FOREIGN KEY (`DISCOUNT_CODE`) REFERENCES `DISCOUNT_CODE` (`DISCOUNT_CODE`),
  CONSTRAINT `CUSTOMER_ibfk_2` FOREIGN KEY (`ZIP`) REFERENCES `MICRO_MARKET` (`ZIP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (1,'N','95117','Jumbo Modified Corp','111 E. Las Olivas Blvd','Suite 51','Fort Lauderdale','FL','305-555-0188','305-555-0189','jumboeagle@example.com',100000),(2,'M','95035','New Enterprises','9754 Main Street','P.O. Box 567','Miami','FL','305-555-0148','305-555-0149','www.new.example.com',50000),(3,'L','12347','Small Bill Company','8585 South Upper Murray Drive','P.O. Box 456','Alanta','GA','555-555-0175','555-555-0176','www.smallbill.example.com',90000),(25,'M','85638','Wren Computers','8989 Red Albatross Drive','Suite 9897','Houston','TX','214-555-0133','214-555-0134','www.wrencomp.example.com',25000),(36,'H','94401','Bob Hosting Corp.','65653 Lake Road','Suite 2323','San Mateo','CA','650-555-0160','650-555-0161','www.bobhostcorp.example.com',65000),(106,'L','95035','Early CentralComp','829 E Flex Drive','Suite 853','San Jose','CA','408-555-0157','408-555-0150','www.centralcomp.example.com',26500),(149,'L','95117','John Valley Computers','4381 Kelly Valley Ave','Suite 77','Santa Clara','CA','408-555-0169','408-555-0167','www.johnvalley.example.com',70000),(409,'L','10095','Old Media Productions','4400 527th Street','Suite 562','New York','NY','212-555-0110','212-555-0111','www.oldmedia.example.com',10000),(410,'M','10096','Yankee Computer Repair Ltd','9653 211th Ave','Floor 4','New York','NY','212-555-0191','212-555-0197','www.nycompltd@repair.example.com',25000),(722,'N','48124','Big Car Parts','52963 Notouter Dr','Suite 35','Detroit','MI','313-555-0144','313-555-0145','www.bparts.example.com',50000),(753,'H','48128','Zed Motor Co','2267 NE Michigan Ave','Building 21','Dearborn','MI','313-555-0151','313-555-0152','www.parts@ford.example.com',5000000),(777,'L','48128','West Valley Inc.','88 Northsouth Drive','Building C','Dearborn','MI','313-555-0172','313-555-0171','www.westv.example.com',100000),(863,'N','94401','Big Network Systems','456 444th Street','Suite 45','Redwood City','CA','650-555-0181','650-555-0180','www.bignet.example.com',25000);
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISCOUNT_CODE`
--

DROP TABLE IF EXISTS `DISCOUNT_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DISCOUNT_CODE` (
  `DISCOUNT_CODE` char(1) NOT NULL,
  `RATE` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`DISCOUNT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISCOUNT_CODE`
--

LOCK TABLES `DISCOUNT_CODE` WRITE;
/*!40000 ALTER TABLE `DISCOUNT_CODE` DISABLE KEYS */;
INSERT INTO `DISCOUNT_CODE` VALUES ('H',16.00),('L',7.00),('M',11.00),('N',0.00);
/*!40000 ALTER TABLE `DISCOUNT_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANUFACTURER`
--

DROP TABLE IF EXISTS `MANUFACTURER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANUFACTURER` (
  `MANUFACTURER_ID` int(11) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `ADDRESSLINE1` varchar(30) DEFAULT NULL,
  `ADDRESSLINE2` varchar(30) DEFAULT NULL,
  `CITY` varchar(25) DEFAULT NULL,
  `STATE` char(2) DEFAULT NULL,
  `ZIP` char(10) DEFAULT NULL,
  `PHONE` varchar(12) DEFAULT NULL,
  `FAX` varchar(12) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `REP` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANUFACTURER`
--

LOCK TABLES `MANUFACTURER` WRITE;
/*!40000 ALTER TABLE `MANUFACTURER` DISABLE KEYS */;
INSERT INTO `MANUFACTURER` VALUES (19941212,'Birders United','4000 Cormorant Circle','Building 19','Burlington','OR','95051','206-555-0183','206-555-0179','bill@example.com','Bill Snider'),(19948494,'Computer Support Center','5632 Michigam Ave',' ','Dearborn','RI','48127','313-555-0181','313-555-0182','www.comsup.example.net','Sam Wright'),(19955564,'Birders United','4000 Cormorant Circle','Building 15','Burlington','OR','95051','206-555-0179','206-555-0179','phil@example.com','Phil Waters'),(19955565,'Birders United','4000 Cormorant Circle','Building 16','Burlington','OR','95051','206-555-0180','206-555-0179','birders@example.com','Birders'),(19955656,'Soft Circle Opticians','95 Eastway Clearview Drive','Building 1','Boston','MA','02100','617-555-0171','617-555-0172','www.softcircle@example.com','Alfred Nelson'),(19960022,'Super Computer Products','63 Garcia Rock Way','Floor 22','Albuqerque','NM','87119','505-555-0193','505-555-0193','www.supercomputer@example.com','Tom Cross'),(19963322,'Pauls Dairy','236 Hill Street Lane','Suite 6','Orlando','CA','94567','415-555-0140','415-555-0141','paulsdairy.example.com','John White'),(19963323,'Joseph Ironworks','7655 382nd Street','Suite 200','Mountainside','TX','94043','408-555-0122','408-555-0128','joseph.ironworks@example.com','John Green'),(19963324,'Nails and Screws','7654 First Avenue','Suite 1005','Ypsilanti','MI','94043','302-555-0191','302-555-0193','nails.screws@example.com','Fred Stanford'),(19963325,'Main Beauty Hair Salon','44 Overload Street','Building 150','Chicago','WA','94043','211-555-0182','211-555-0183','mainbeauty@example.com','7 of 9'),(19965794,'Easy Reach Telephones','975 El Camino Circle','Suite 4055','Santa Clara','VA','95051','408-555-0167','408-555-0168','www.easyreach@example.com','Walter James'),(19971233,'Bills Bank and Sons','5960 Inglewood Pkwy','Building C5','Pleasantville','WI','94588','408-555-0183','408-555-0184','www.billbank@example.com','Frank Smith'),(19974892,'Wilson Fish Co','20959 Whalers Ave','Building 3','San Jose','OH','95128','650-555-0133','408-555-0133','www.wilsonfish@example.com','Matthew Williams'),(19977346,'Upper Cargo Lift Services','2845 Smith Under Road','Suite 7','San Mateo','GA','94403','650-555-0171','650-555-0172','uppercargo.example.com','Frank Peters'),(19977347,'Super Savings Pharmacy','56 Broadway Lane','Floor 123','Oakland','NH','98123','510-555-0173','510-555-0173','superpharmace.example.com','Tom Brown'),(19977348,'Early Posting Corp','235 E Market St.','Suite 1','San David','CA','94567','415-555-0138','415-555-0139','superposting.example.com','John Adams'),(19977775,'Sams Photo Center','9447 West 13th Street','Suite 25','Reading','MN','01867','617-555-0177','617-555-0178','www.photctr@example.com','Laurie Brown'),(19978451,'All Sushi','399 San Pablo Ave','Building 600','Cleveland','CA','94530','650-555-0140','408-555-0143','www.allsushi@example.com','Teresa Ho'),(19980198,'Pleasant Enterprises','76342 865th Ave','Suite 450','New York','NY','10044','212-555-0184','212-555-0185','www.pleasant@example.com','Louis Lewis'),(19982461,'Soft Cables','9988 Main Upper Street','Suite 100','Indianapolis','IA','46290','650-555-0151','408-555-0152','www.cbales@example.com','Henry Adams'),(19984681,'Birders United','4000 Cormorant Circle','Building 17','Burlington','OR','95051','206-555-0181','206-555-0179','returnpalace@example.com','Nick Phillips'),(19984682,'Birders United','4000 Cormorant Circle','Building 18','Burlington','OR','95051','206-555-0182','206-555-0179','brian@example.com','Brian Brown'),(19984899,'Mike Recording Industries','5109 Union Street Road','Building 8A','San Alfred','CA','94123','415-555-0166','415-555-0165','www.mikerecording@example.com','Mike Black'),(19985590,'Birders United','4000 Cormorant Circle','Building 14','Burlington','OR','95051','206-555-0178','206-555-0179','ann.jones@example.com','Ann Jones'),(19985678,'Happy End Searching','5 81st Street','Suite 100','Mountain View','CA','94043','650-555-0102','408-555-0103','happysearching@example.com','John Snow'),(19986196,'James Deli','250 Marinade Blvd','Suite C','Novato','IL','94949','650-555-0144','408-555-0145','www.jdeli@example.net','Phil Jones'),(19986542,'Florenc Bakery','795 Stone Flour Road','Suite 4','Tombstone','DE','85638','602-555-0182','602-555-0188','florenc.example.com','Jeff Green'),(19986982,'Smith Bird Watching','4000 Finch Circle','Building 14','Santa Clara','CA','95051','650-555-0111','408-555-0112','www.sbw@example.com','Brian Washington'),(19987296,'Birders United','4000 Cormorant Circle','Building 20','Burlington','OR','95051','206-555-0184','206-555-0179','gerard@example.com','Jerry Young'),(19989719,'Fast Boards','1000 Van Nuys Lane','Suite 904537','Van Nuys','VT','91405','800-555-0173','800-555-0174','www.fboards@example.com','Julie Board');
/*!40000 ALTER TABLE `MANUFACTURER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MICRO_MARKET`
--

DROP TABLE IF EXISTS `MICRO_MARKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MICRO_MARKET` (
  `ZIP_CODE` varchar(10) NOT NULL,
  `RADIUS` double DEFAULT NULL,
  `AREA_LENGTH` double DEFAULT NULL,
  `AREA_WIDTH` double DEFAULT NULL,
  PRIMARY KEY (`ZIP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MICRO_MARKET`
--

LOCK TABLES `MICRO_MARKET` WRITE;
/*!40000 ALTER TABLE `MICRO_MARKET` DISABLE KEYS */;
INSERT INTO `MICRO_MARKET` VALUES ('10095',1987.854,975.875,865.681),('10096',1876.766,955.666,923.556),('12347',475.965,385.849,146.937),('48124',753.765,487.664,456.632),('48128',684.675,475.854,408.074),('85638',758.648,328.963,482.164),('94043',157.869,385.821,147.538),('94401',368.386,285.848,173.794),('95035',683.396,472.859,379.757),('95051',255.59,689.856,478.479),('95117',755.778,547.967,468.858);
/*!40000 ALTER TABLE `MICRO_MARKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT` (
  `PRODUCT_ID` int(11) NOT NULL,
  `MANUFACTURER_ID` int(11) NOT NULL,
  `PRODUCT_CODE` char(2) NOT NULL,
  `PURCHASE_COST` decimal(12,2) DEFAULT NULL,
  `QUANTITY_ON_HAND` int(11) DEFAULT NULL,
  `MARKUP` decimal(4,2) DEFAULT NULL,
  `AVAILABLE` varchar(5) DEFAULT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `FOREIGNKEY_MANUFACTURER_ID` (`MANUFACTURER_ID`),
  KEY `FOREIGNKEY_PRODUCT_CODE` (`PRODUCT_CODE`),
  CONSTRAINT `PRODUCT_ibfk_1` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `MANUFACTURER` (`MANUFACTURER_ID`),
  CONSTRAINT `PRODUCT_ibfk_2` FOREIGN KEY (`PRODUCT_CODE`) REFERENCES `PRODUCT_CODE` (`PROD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (948933,19941212,'MS',36.95,50,75.00,'TRUE','Computer Tool Kit'),(958888,19955564,'HW',799.99,0,1.50,'FALSE','Ultra Spacr 999Mhz Computer'),(958889,19955565,'HW',595.95,0,1.25,'FALSE','686 7Ghz Computer'),(964025,19963322,'SW',209.95,300,41.00,'TRUE','Jax WS Application Development Environment'),(964026,19963323,'SW',259.95,220,51.00,'TRUE','Java EE 6 Application Development Environment'),(964027,19963324,'SW',269.95,700,61.00,'TRUE','Java Application Development Environment'),(964028,19963325,'SW',219.95,300,32.00,'TRUE','NetBeans Development Environment'),(971266,19948494,'CB',25.95,500,30.00,'TRUE','Network Cable'),(975789,19977775,'BK',29.98,25,5.00,'TRUE','Learn Solaris 10'),(978493,19977346,'BK',19.95,100,5.00,'TRUE','Client Server Testing'),(978494,19977347,'BK',18.95,43,4.00,'TRUE','Learn Java in 1/2 hour'),(978495,19977348,'BK',24.99,0,1.00,'FALSE','Writing Web Service Applications'),(980001,19985678,'SW',1095.00,800000,8.25,'TRUE','Identity Server'),(980002,19960022,'MS',75.00,0,12.00,'FALSE','Corporate Expense Survey'),(980005,19986982,'SW',11500.99,500,55.25,'TRUE','Accounting Application'),(980025,19974892,'HW',2095.99,3000,15.75,'TRUE','1Ghz Sun Blade Computer'),(980030,19986196,'FW',59.95,250,40.00,'TRUE','10Gb Ram'),(980031,19986542,'SW',595.95,75,14.00,'TRUE','Sun Studio C++'),(980032,19978451,'FW',39.95,50,25.50,'TRUE','Sound Card'),(980122,19985590,'HW',1400.95,100,25.00,'TRUE','Solaris x86 Computer'),(980500,19980198,'BK',29.95,1000,33.00,'TRUE','Learn NetBeans'),(980601,19971233,'HW',2000.95,2000,25.00,'TRUE','300Mhz Pentium Computer'),(984666,19987296,'HW',199.95,25,45.00,'TRUE','Flat screen Monitor'),(985510,19984899,'HW',595.00,800,5.75,'TRUE','24 inch Digital Monitor'),(986420,19955656,'SW',49.95,0,5.25,'FALSE','Directory Server'),(986710,19982461,'CB',15.98,400,30.00,'TRUE','Printer Cable'),(986712,19989719,'HW',69.95,1000,10.50,'TRUE','512X IDE DVD-ROM'),(986733,19984681,'HW',69.98,400,55.00,'TRUE','A1 900 watts Speakers'),(986734,19984682,'HW',49.95,200,65.00,'TRUE','Mini Computer Speakers'),(988765,19965794,'HW',10.95,25,9.75,'TRUE','104-Key Keyboard');
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_CODE`
--

DROP TABLE IF EXISTS `PRODUCT_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_CODE` (
  `PROD_CODE` char(2) NOT NULL,
  `DISCOUNT_CODE` char(1) NOT NULL,
  `DESCRIPTION` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PROD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_CODE`
--

LOCK TABLES `PRODUCT_CODE` WRITE;
/*!40000 ALTER TABLE `PRODUCT_CODE` DISABLE KEYS */;
INSERT INTO `PRODUCT_CODE` VALUES ('BK','L','Books'),('CB','N','Cables'),('FW','L','Firmware'),('HW','H','Hardware'),('MS','N','Misc'),('SW','M','Software');
/*!40000 ALTER TABLE `PRODUCT_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PURCHASE_ORDER`
--

DROP TABLE IF EXISTS `PURCHASE_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE_ORDER` (
  `ORDER_NUM` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `QUANTITY` smallint(6) DEFAULT NULL,
  `SHIPPING_COST` decimal(12,2) DEFAULT NULL,
  `SALES_DATE` date DEFAULT NULL,
  `SHIPPING_DATE` date DEFAULT NULL,
  `FREIGHT_COMPANY` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ORDER_NUM`),
  KEY `FOREIGNKEY_CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FOREIGNKEY_PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `PURCHASE_ORDER_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `PURCHASE_ORDER_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE_ORDER`
--

LOCK TABLES `PURCHASE_ORDER` WRITE;
/*!40000 ALTER TABLE `PURCHASE_ORDER` DISABLE KEYS */;
INSERT INTO `PURCHASE_ORDER` VALUES (10398001,1,980001,10,449.00,'2011-05-24','2011-05-24','Poney Express'),(10398002,2,980005,8,359.99,'2011-05-24','2011-05-24','Poney Express'),(10398003,2,980025,25,275.00,'2011-05-24','2011-05-24','Poney Express'),(10398004,3,980030,10,275.00,'2011-05-24','2011-05-24','Poney Express'),(10398005,1,980032,100,459.00,'2011-05-24','2011-05-24','Poney Express'),(10398006,36,986710,60,55.00,'2011-05-24','2011-05-24','Slow Snail'),(10398007,36,985510,120,65.00,'2011-05-24','2011-05-24','Slow Snail'),(10398008,106,988765,500,265.00,'2011-05-24','2011-05-24','Slow Snail'),(10398009,149,986420,1000,700.00,'2011-05-24','2011-05-24','Western Fast'),(10398010,863,986712,100,25.00,'2011-05-24','2011-05-24','Slow Snail'),(20198001,777,971266,75,105.00,'2011-05-24','2011-05-24','We deliver'),(20598100,753,980601,100,200.99,'2011-05-24','2011-05-24','We deliver'),(20598101,722,980500,250,2500.00,'2011-05-24','2011-05-24','Coastal Freight'),(30198001,409,980001,50,2000.99,'2011-05-24','2011-05-24','Southern Delivery Service'),(30298004,410,980031,100,700.00,'2011-05-24','2011-05-24','FR Express');
/*!40000 ALTER TABLE `PURCHASE_ORDER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-02 19:17:12
