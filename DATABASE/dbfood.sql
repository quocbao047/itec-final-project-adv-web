-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 16, 2022 at 06:28 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--

DROP TABLE IF EXISTS `tbadmin`;
CREATE TABLE IF NOT EXISTS `tbadmin` (
  `fld_id` int(10) NOT NULL AUTO_INCREMENT,
  `fld_username` varchar(30) NOT NULL,
  `fld_password` varchar(30) NOT NULL,
  PRIMARY KEY (`fld_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`fld_id`, `fld_username`, `fld_password`) VALUES
(1, 'admin@gmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `tbfood`
--

DROP TABLE IF EXISTS `tbfood`;
CREATE TABLE IF NOT EXISTS `tbfood` (
  `food_id` int(11) NOT NULL AUTO_INCREMENT,
  `fldvendor_id` int(11) NOT NULL,
  `foodname` varchar(100) NOT NULL,
  `cost` bigint(15) NOT NULL,
  `cuisines` varchar(50) NOT NULL,
  `paymentmode` varchar(50) NOT NULL,
  `fldimage` varchar(1000) NOT NULL,
  PRIMARY KEY (`food_id`),
  KEY `fldvendor_id` (`fldvendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbfood`
--

INSERT INTO `tbfood` (`food_id`, `fldvendor_id`, `foodname`, `cost`, `cuisines`, `paymentmode`, `fldimage`) VALUES
(2, 22, 'malai Kofta', 50, 'vegetable,veg', 'COD', '1469258122-malai-kofta.jpg'),
(3, 22, 'shahi panner', 20, 'vegetable', 'COD', 'Shahi-Paneer-Recipe.jpg'),
(4, 22, 'chola kulcha', 100, 'lunch', 'COD', 'maxresdefault.jpg'),
(5, 23, 'Pizza', 100, 'Medium Size, fast food', 'COD', 'phut_0.jpg'),
(6, 23, 'Pizza Full', 300, 'Fast food,full size', 'COD', 'phut_0.jpg'),
(7, 23, 'burger ', 50, 'Fast food', 'COD', 'photo-1534790566855-4cb788d389ec.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblcart`
--

DROP TABLE IF EXISTS `tblcart`;
CREATE TABLE IF NOT EXISTS `tblcart` (
  `fld_cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `fld_product_id` bigint(11) NOT NULL,
  `fld_customer_id` varchar(50) NOT NULL,
  PRIMARY KEY (`fld_cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

DROP TABLE IF EXISTS `tblcustomer`;
CREATE TABLE IF NOT EXISTS `tblcustomer` (
  `fld_cust_id` int(10) NOT NULL AUTO_INCREMENT,
  `fld_name` varchar(30) NOT NULL,
  `fld_email` varchar(30) NOT NULL,
  `fld_mobile` bigint(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`fld_cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`fld_cust_id`, `fld_name`, `fld_email`, `fld_mobile`, `password`) VALUES
(1, 'gajender', 'customer1@gmail.com', 7503515382, 'customer1'),
(2, 'sanjay', 'customer2@gmail.com', 7503515386, 'customer2'),
(3, 'saana', 'customer3@gmail.com', 7503515383, 'customer3'),
(4, 'admin', 'admin@gmail.com', 9867719666, 'admin123'),
(5, 'LE', 'baole765@gmail.com', 10902731597, 'XAMPP'),
(6, 'Minh', 'trung2309@gmail.com', 531890584, 'trung123');

-- --------------------------------------------------------

--
-- Table structure for table `tblmessage`
--

DROP TABLE IF EXISTS `tblmessage`;
CREATE TABLE IF NOT EXISTS `tblmessage` (
  `fld_msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `fld_name` varchar(50) NOT NULL,
  `fld_email` varchar(50) NOT NULL,
  `fld_phone` bigint(10) DEFAULT NULL,
  `fld_msg` varchar(200) NOT NULL,
  PRIMARY KEY (`fld_msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

DROP TABLE IF EXISTS `tblorder`;
CREATE TABLE IF NOT EXISTS `tblorder` (
  `fld_order_id` int(10) NOT NULL AUTO_INCREMENT,
  `fld_cart_id` bigint(10) NOT NULL,
  `fldvendor_id` bigint(10) DEFAULT NULL,
  `fld_food_id` bigint(10) DEFAULT NULL,
  `fld_email_id` varchar(50) DEFAULT NULL,
  `fld_payment` varchar(20) DEFAULT NULL,
  `fldstatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fld_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`fld_order_id`, `fld_cart_id`, `fldvendor_id`, `fld_food_id`, `fld_email_id`, `fld_payment`, `fldstatus`) VALUES
(1, 1, 21, 1, 'customer3@gmail.com', '50', 'Delivered'),
(2, 2, 22, 3, 'customer3@gmail.com', '20', 'Out Of Stock'),
(3, 3, 22, 2, 'admin@gmail.com', '50', 'cancelled'),
(4, 1, 23, 6, 'admin@gmail.com', '300', 'In Process'),
(5, 3, 22, 2, 'admin@gmail.com', '50', 'In Process');

-- --------------------------------------------------------

--
-- Table structure for table `tblvendor`
--

DROP TABLE IF EXISTS `tblvendor`;
CREATE TABLE IF NOT EXISTS `tblvendor` (
  `fldvendor_id` int(10) NOT NULL AUTO_INCREMENT,
  `fld_name` varchar(30) NOT NULL,
  `fld_email` varchar(50) NOT NULL,
  `fld_password` varchar(50) NOT NULL,
  `fld_mob` bigint(10) NOT NULL,
  `fld_phone` bigint(10) NOT NULL,
  `fld_address` varchar(50) NOT NULL,
  `fld_logo` varchar(250) NOT NULL,
  PRIMARY KEY (`fldvendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvendor`
--

INSERT INTO `tblvendor` (`fldvendor_id`, `fld_name`, `fld_email`, `fld_password`, `fld_mob`, `fld_phone`, `fld_address`, `fld_logo`) VALUES
(22, 'Hotel Radison', 'vendor1@gmail.com', 'vendor1', 7503515386, 114565457, 'noida', '46388969.jpg'),
(23, 'Hotel Piccaso', 'vendor2@gmail.com', 'vendor2', 7503515385, 114565457, 'C-33, SWARN PARK, MUNDKA', '46388969.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbsearch`
--

DROP TABLE IF EXISTS `tbsearch`;
CREATE TABLE IF NOT EXISTS `tbsearch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbfood`
--
ALTER TABLE `tbfood`
  ADD CONSTRAINT `tbfood_ibfk_1` FOREIGN KEY (`fldvendor_id`) REFERENCES `tblvendor` (`fldvendor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
