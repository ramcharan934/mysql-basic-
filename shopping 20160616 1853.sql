-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.66-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema shopping
--

CREATE DATABASE IF NOT EXISTS shopping;
USE shopping;

--
-- Temporary table structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;
DROP VIEW IF EXISTS `view1`;
CREATE TABLE `view1` (
  `itemcode` int(11),
  `itemname` varchar(15)
);

--
-- Definition of table `customertable`
--

DROP TABLE IF EXISTS `customertable`;
CREATE TABLE `customertable` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(20) DEFAULT NULL,
  `mobileno` bigint(20) DEFAULT NULL,
  `address1` varchar(15) DEFAULT NULL,
  `address2` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customertable`
--

/*!40000 ALTER TABLE `customertable` DISABLE KEYS */;
INSERT INTO `customertable` (`customerid`,`customername`,`mobileno`,`address1`,`address2`) VALUES 
 (101,'vidhya',9792233451,'Hampankatta','Managlore'),
 (102,'harish',9994512098,'Margansgate','Managlore'),
 (103,'prabhu',9883421789,'joothi','Managlore');
/*!40000 ALTER TABLE `customertable` ENABLE KEYS */;


--
-- Definition of table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `itemcode` int(11) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(15) DEFAULT NULL,
  `unitprice` int(11) NOT NULL,
  PRIMARY KEY (`itemcode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`itemcode`,`itemname`,`unitprice`) VALUES 
 (1,'LED TV',38000),
 (2,'Samsung Fridge',25000),
 (3,'AC',36000);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


--
-- Definition of table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `orderno` int(11) DEFAULT NULL,
  `itemno` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  KEY `f2` (`orderno`),
  KEY `f3` (`itemno`),
  CONSTRAINT `f2` FOREIGN KEY (`orderno`) REFERENCES `ordertable` (`orderno`),
  CONSTRAINT `f3` FOREIGN KEY (`itemno`) REFERENCES `item` (`itemcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetails`
--

/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` (`orderno`,`itemno`,`qty`) VALUES 
 (11,2,1),
 (11,3,1),
 (12,2,1),
 (13,3,2);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;


--
-- Definition of table `ordertable`
--

DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable` (
  `orderno` int(11) NOT NULL AUTO_INCREMENT,
  `orderdate` date DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderno`),
  KEY `f1` (`customerid`),
  CONSTRAINT `f1` FOREIGN KEY (`customerid`) REFERENCES `customertable` (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertable`
--

/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
INSERT INTO `ordertable` (`orderno`,`orderdate`,`customerid`) VALUES 
 (11,'2014-05-02',101),
 (12,'2014-05-03',102),
 (13,'2014-05-05',103);
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;


--
-- Definition of view `view1`
--

DROP TABLE IF EXISTS `view1`;
DROP VIEW IF EXISTS `view1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1` AS (select `item`.`itemcode` AS `itemcode`,`item`.`itemname` AS `itemname` from `item`);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
