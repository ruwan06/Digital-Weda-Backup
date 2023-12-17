-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 24, 2022 at 10:10 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `miraclesnakes`
--
CREATE DATABASE IF NOT EXISTS `miraclesnakes` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `miraclesnakes`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `billNumber` int(12) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `age` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `pNumber` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nic` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoiceNumber` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `heder` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `prescName` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `prescription` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  `foter` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceNumber`, `name`, `heder`, `prescName`, `prescription`, `foter`, `date`) VALUES
(0, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `mediName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `MediDesc` varchar(1500) COLLATE utf8_unicode_ci NOT NULL,
  `photo1` mediumblob,
  `photo2` mediumblob,
  `photo3` mediumblob,
  PRIMARY KEY (`mediName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `printpresc`
--

CREATE TABLE IF NOT EXISTS `printpresc` (
  `prescName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `Prescription` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`prescName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `snakeprescription`
--

CREATE TABLE IF NOT EXISTS `snakeprescription` (
  `SPName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SPrescription` varchar(1500) COLLATE utf8_unicode_ci NOT NULL,
  `FK_Snake` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  KEY `FK_Snake` (`FK_Snake`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `snakes`
--

CREATE TABLE IF NOT EXISTS `snakes` (
  `SName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `SDesc` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `Simage1` mediumblob,
  `Simage2` mediumblob,
  `Simage3` mediumblob,
  PRIMARY KEY (`SName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `snakesymptom`
--

CREATE TABLE IF NOT EXISTS `snakesymptom` (
  `Symptom` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `FK_Snake` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  KEY `snakesymptom_ibfk_1` (`FK_Snake`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sn_symptop_prescription`
--

CREATE TABLE IF NOT EXISTS `sn_symptop_prescription` (
  `SN_symp_pres_Name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `SN_symp_pres` varchar(1500) COLLATE utf8_unicode_ci NOT NULL,
  `FK_Symptom` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `FK_Snake` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  KEY `FK_Symptom` (`FK_Symptom`),
  KEY `FK_Snake` (`FK_Snake`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `symptom`
--

CREATE TABLE IF NOT EXISTS `symptom` (
  `SymptomName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SymptomName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `symptomprescription`
--

CREATE TABLE IF NOT EXISTS `symptomprescription` (
  `prescName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `Prescription` varchar(1500) COLLATE utf8_unicode_ci NOT NULL,
  `SypmName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  KEY `SypmName` (`SypmName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `UserName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `userType` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
