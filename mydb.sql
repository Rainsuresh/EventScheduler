-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2017 at 02:23 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
  `acc_number` int(12) NOT NULL AUTO_INCREMENT,
  `cust_id` int(12) NOT NULL,
  `pwd` varchar(12) NOT NULL,
  `balance` int(15) NOT NULL,
  `card_num` int(12) NOT NULL,
  `expirydate` varchar(6) NOT NULL,
  `cvc` int(7) NOT NULL,
  `otp` int(5) NOT NULL DEFAULT '1111',
  PRIMARY KEY (`acc_number`),
  UNIQUE KEY `cust_id` (`cust_id`),
  UNIQUE KEY `cardnum` (`card_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10001 ;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`acc_number`, `cust_id`, `pwd`, `balance`, `card_num`, `expirydate`, `cvc`, `otp`) VALUES
(10000, 1111, 'root', 50000, 2222, '12/22', 2222, 1111);

-- --------------------------------------------------------

--
-- Table structure for table `emp99`
--

CREATE TABLE IF NOT EXISTS `emp99` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `salary` int(10) NOT NULL,
  `designation` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `emp99`
--

INSERT INTO `emp99` (`id`, `name`, `salary`, `designation`) VALUES
(1, 'suresh kumar', 28800, 'software developer'),
(4, 'sakthi', 100000, 'Creater'),
(8, 'siva frd', 100000, 'Creater'),
(9, 'muruga', 200000, 'Creater');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `e_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` varchar(12) NOT NULL,
  `organized_by` varchar(100) NOT NULL,
  `incharge` varchar(50) NOT NULL,
  `fees` int(4) NOT NULL DEFAULT '0',
  `status` varchar(4) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`e_id`, `name`, `date`, `organized_by`, `incharge`, `fees`, `status`) VALUES
(1, 'St Xaviers College Palayamkottai Job Fair 2017', '2017/11/01', 'St Xaviers College', 'Suresh', 500, 'yes'),
(2, 'St Xaviers College Palayamkottai Job Fair 2018', '2018/01/01', 'St Xaviers College', 'SixfireSuresh', 100, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `event_register`
--

CREATE TABLE IF NOT EXISTS `event_register` (
  `e_id` int(10) NOT NULL,
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `e_id` (`e_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `event_register`
--

INSERT INTO `event_register` (`e_id`, `c_id`, `email`) VALUES
(1, 38, 'sixfire@sixfire.com'),
(2, 55, 'suresh.collage@gmail.com'),
(2, 67, 'vimal@gmail.com'),
(1, 74, 'vimal@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `p_id` int(12) NOT NULL AUTO_INCREMENT,
  `c_id` int(10) NOT NULL,
  `paid_fees` int(12) NOT NULL DEFAULT '0',
  `paid_status` varchar(3) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `c_id` (`c_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`p_id`, `c_id`, `paid_fees`, `paid_status`) VALUES
(32, 38, 200, 'yes'),
(37, 55, 0, 'no'),
(51, 67, 200, 'yes'),
(53, 74, 200, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `e_id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `college_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(15) NOT NULL,
  `active` varchar(4) NOT NULL DEFAULT 'yes',
  `user_role_id` int(1) NOT NULL DEFAULT '2',
  UNIQUE KEY `email` (`email`),
  KEY `e_id` (`e_id`),
  KEY `user_role_id` (`user_role_id`),
  KEY `user_role_id_2` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`e_id`, `name`, `lastname`, `gender`, `college_name`, `email`, `pwd`, `active`, `user_role_id`) VALUES
(1, 'root', 'root', 'root', 'root', 'root', 'root', 'yes', 1),
(1, 'Arthi', 'Suresh', 'Female', 'sixfire', 'sixfire@sixfire.com', 'sixfire', 'yes', 2),
(2, 'suresh', 'M', 'Male', 'Suresh', 'suresh.collage@gmail.com', 'sixfire', 'yes', 2),
(2, 'suresh', 'M', 'Male', 'Suresh', 'vimal@gmail.com', 'sixfire', 'yes', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(1) NOT NULL,
  `authority` varchar(15) NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `authority`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_register`
--
ALTER TABLE `event_register`
  ADD CONSTRAINT `event_register_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `event` (`e_id`),
  ADD CONSTRAINT `event_register_ibfk_2` FOREIGN KEY (`email`) REFERENCES `register` (`email`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`c_id`) REFERENCES `event_register` (`c_id`);

--
-- Constraints for table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `event` (`e_id`),
  ADD CONSTRAINT `register_ibfk_2` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`user_role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
