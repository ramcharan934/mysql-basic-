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
-- Create schema ims
--

CREATE DATABASE IF NOT EXISTS ims;
USE ims;

--
-- Definition of table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `fees` int(11) NOT NULL,
  `dur` varchar(10) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`cid`,`cname`,`fees`,`dur`) VALUES 
 (11,'java',13000,'45'),
 (12,'c',3000,'5'),
 (13,'php',10000,'25'),
 (14,'c#',13000,'45'),
 (15,'networking',45000,'45');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL,
  `ename` varchar(10) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `f6` (`sid`),
  CONSTRAINT `f6` FOREIGN KEY (`sid`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`eid`,`ename`,`sid`) VALUES 
 (101,'aaa',102),
 (102,'bbb',103),
 (103,'ccc',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
CREATE TABLE `enroll` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0',
  `doj` date DEFAULT NULL,
  PRIMARY KEY (`sid`,`cid`),
  KEY `f4` (`cid`),
  CONSTRAINT `f4` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enroll`
--

/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` (`sid`,`cid`,`doj`) VALUES 
 (1,11,'2016-06-12'),
 (1,14,'2016-06-12'),
 (3,11,'2016-06-13');
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;


--
-- Definition of table `mobile`
--

DROP TABLE IF EXISTS `mobile`;
CREATE TABLE `mobile` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `mob` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`,`mob`),
  UNIQUE KEY `mob` (`mob`),
  UNIQUE KEY `mob_2` (`mob`),
  CONSTRAINT `f5` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobile`
--

/*!40000 ALTER TABLE `mobile` DISABLE KEYS */;
INSERT INTO `mobile` (`sid`,`mob`) VALUES 
 (3,7986541581),
 (1,8765432222),
 (2,9008745612);
/*!40000 ALTER TABLE `mobile` ENABLE KEYS */;


--
-- Definition of table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `stid` int(11) NOT NULL AUTO_INCREMENT,
  `basicpay` float(10,2) NOT NULL,
  `allow` float(8,2) NOT NULL,
  `ded` float(8,2) NOT NULL,
  PRIMARY KEY (`stid`),
  CONSTRAINT `f2` FOREIGN KEY (`stid`) REFERENCES `staff` (`stid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` (`stid`,`basicpay`,`allow`,`ded`) VALUES 
 (101,10000.00,1100.00,500.00),
 (102,9000.00,10000.00,500.00),
 (103,11000.00,1100.00,500.00);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;


--
-- Definition of table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `stid` int(11) NOT NULL AUTO_INCREMENT,
  `stname` varchar(20) NOT NULL,
  `mobno` bigint(20) NOT NULL,
  `cno` int(11) DEFAULT NULL,
  PRIMARY KEY (`stid`),
  KEY `f1` (`cno`),
  CONSTRAINT `f1` FOREIGN KEY (`cno`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`stid`,`stname`,`mobno`,`cno`) VALUES 
 (101,'deepa',9876543211,11),
 (102,'viji',9999912345,11),
 (103,'john',8907654321,12);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;


--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `mail` varchar(20) NOT NULL,
  `add1` varchar(20) NOT NULL,
  `add2` varchar(20) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`sid`,`sname`,`mail`,`add1`,`add2`) VALUES 
 (1,'uma','uma@gmail.com','morgansgate','mangalore'),
 (2,'vidhya','vidhya@gmail.com','morgansgate','mangalore'),
 (3,'anu','anu@yahoo.com','jeepu','mangalore');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
