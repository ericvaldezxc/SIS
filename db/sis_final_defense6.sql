-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2019 at 05:22 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sis_final_defense6`
--

-- --------------------------------------------------------

--
-- Table structure for table `r_academic_year`
--

CREATE TABLE `r_academic_year` (
  `Academic_Year_ID` int(11) NOT NULL,
  `Academic_Year_Code` varchar(100) NOT NULL,
  `Academic_Year_Description` varchar(100) NOT NULL,
  `Academic_Year_Active_Flag` enum('Present','Used','Not Used','To be Used') NOT NULL DEFAULT 'Not Used',
  `Academic_Year_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Academic_Year_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Academic_Year_Date_Update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_academic_year`
--

INSERT INTO `r_academic_year` (`Academic_Year_ID`, `Academic_Year_Code`, `Academic_Year_Description`, `Academic_Year_Active_Flag`, `Academic_Year_Display_Status`, `Academic_Year_Date_Added`, `Academic_Year_Date_Update`) VALUES
(1, 'Nw8ZppgQPxdZ4/lI7MWohg==', 'WzMwG7yRvn3aAvKlxQNzNA==', 'Used', 'Active', '2018-08-02 04:10:43', '2018-10-23 23:30:05'),
(2, 'qEmiI5/0XZY1EFyZ3Pnk6w==', 'mcctP57D/WKwY5t8ETo/jg==', 'Used', 'Active', '2018-08-02 04:11:03', '2018-10-23 21:23:34'),
(3, '0fAtwElD4mZI0N+Nrsxb3g==', 'KrWaPpJ3me479gIH9Ul4WQ==', 'Used', 'Active', '2018-08-02 04:11:30', '2018-10-21 21:33:31'),
(4, 'ELaf4pXwa3mc3exdJrGzSQ==', '0WjdYtbrdVQWbuEaq4wf9Q==', 'Used', 'Active', '2018-08-02 04:11:31', '2018-10-21 21:33:01'),
(5, 'I55TkYDcsryi1XAtHpHVFQ==', 'EvGOxhu8NTTxzbzUK6Hpkw==', 'Used', 'Active', '2018-09-09 15:40:42', '2018-10-24 02:21:44'),
(6, 'p7pC1UjVvFuljSCpKRq7kQ==', 'keorA2JkN3nuk0zDI0qIyg==', 'Used', 'Active', '2018-10-10 19:11:52', '2019-02-04 22:12:20'),
(7, 'E8j4hVZVg5qV4n1dqWnp7Q==', 'HnbFoINMrY9h7ODvTWc9cQ==', 'Used', 'Active', '2018-10-12 23:21:54', '2019-03-27 00:17:05'),
(8, '5sCwAzJZt8hEeEhI8d8wJw==', 'sa83ooCLIzWuPZ6gLLCC8g==', 'Present', 'Active', '2018-10-13 03:58:28', '2019-03-27 00:17:09'),
(9, 'fz8ZdAsExB/Z52zCEKd1xA==', 'EXFa5APhuZpEmMn9iDk+Ow==', 'To be Used', 'Active', '2018-10-13 05:41:16', '2018-10-21 21:33:31');

-- --------------------------------------------------------

--
-- Table structure for table `r_admin`
--

CREATE TABLE `r_admin` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_First_Name` varchar(100) NOT NULL,
  `Admin_Middle_Name` varchar(100) NOT NULL,
  `Admin_Last_Name` varchar(100) NOT NULL,
  `Admin_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Admin_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Admin_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_admin`
--

INSERT INTO `r_admin` (`Admin_ID`, `Admin_First_Name`, `Admin_Middle_Name`, `Admin_Last_Name`, `Admin_Display_Status`, `Admin_Date_Added`, `Admin_Date_Updated`) VALUES
(2, 'YEtxmhwpaUX5E9xNcmL0YA==', 'Plm+4blDu99iSdAlQ6HDOw==', 'CK1ST42XWtXYwKep6B039Q==', 'Active', '2018-07-27 16:28:32', '2018-07-27 19:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `r_awards`
--

CREATE TABLE `r_awards` (
  `Awards_ID` int(11) NOT NULL,
  `Awards_Code` varchar(100) NOT NULL,
  `Awards_Description` varchar(100) NOT NULL,
  `Awards_Discount_Perecentage` int(11) NOT NULL,
  `Awards_MinimunGWA` float NOT NULL,
  `Awards_MinimunGrade` float NOT NULL,
  `Awards_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Awards_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Awards_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_awards`
--

INSERT INTO `r_awards` (`Awards_ID`, `Awards_Code`, `Awards_Description`, `Awards_Discount_Perecentage`, `Awards_MinimunGWA`, `Awards_MinimunGrade`, `Awards_Display_Status`, `Awards_Date_Added`, `Awards_Date_Updated`) VALUES
(1, 'DL', 'Deans Lister', 75, 1.5, 2.75, 'Active', '2018-10-12 03:45:50', '2018-10-12 03:57:58');

-- --------------------------------------------------------

--
-- Table structure for table `r_campus`
--

CREATE TABLE `r_campus` (
  `Campus_ID` int(11) NOT NULL,
  `Campus_Code` varchar(100) NOT NULL,
  `Campus_Name` varchar(100) NOT NULL,
  `Campus_Address` varchar(500) NOT NULL,
  `Campus_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Campus_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Campus_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_campus`
--

INSERT INTO `r_campus` (`Campus_ID`, `Campus_Code`, `Campus_Name`, `Campus_Address`, `Campus_Display_Status`, `Campus_Date_Added`, `Campus_Date_Updated`) VALUES
(1, '9MzEpGHDLzrTqfuU7IGSoQ==', 'Rq1HODXTbrTHi3O5M0Pf9PF2Jidi9EscWAdJ2tArgQXBP/bXvFhfseMpkqSmg8xdxABv+agNpwHbt4SmjaeeXA==', 'AfY3B9zwzpSx50hezTLNr/ObnVzqoXvhr0nBC5+5iCI=', 'Active', '2018-08-02 04:31:50', '2018-08-02 04:31:50'),
(2, 'J6kQ1Mh0VQAq2tI+gxodew==', 'Rq1HODXTbrTHi3O5M0Pf9PF2Jidi9EscWAdJ2tArgQVonvLTaDrlZ2j8dtSqtNc0', 'Rq1HODXTbrTHi3O5M0Pf9PF2Jidi9EscWAdJ2tArgQXHp/dASSnl7xHNdm9oK5ISVzn5Oj/gEfTnrmmAPgIcuQ==', 'Active', '2018-08-02 04:32:24', '2018-08-23 15:24:07'),
(3, '8JRTHRIfr3As583KCwhXZA==', '8JRTHRIfr3As583KCwhXZA==', '8JRTHRIfr3As583KCwhXZA==', 'Active', '2018-08-02 23:43:14', '2018-08-02 23:43:14');

-- --------------------------------------------------------

--
-- Table structure for table `r_campus_course`
--

CREATE TABLE `r_campus_course` (
  `Campus_Course_ID` int(11) NOT NULL,
  `Campus_Course_CourseID` int(11) NOT NULL,
  `Campus_Course_CampusID` int(11) NOT NULL,
  `Campus_Course_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Campus_Course_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Campus_Course_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_campus_course`
--

INSERT INTO `r_campus_course` (`Campus_Course_ID`, `Campus_Course_CourseID`, `Campus_Course_CampusID`, `Campus_Course_Display_Status`, `Campus_Course_Date_Added`, `Campus_Course_Date_Updated`) VALUES
(6, 17, 1, 'Active', '2018-08-20 22:38:46', '2018-08-20 22:38:46'),
(7, 17, 2, 'Active', '2018-08-20 22:38:46', '2018-08-20 22:38:46'),
(8, 18, 2, 'Active', '2018-09-01 14:47:39', '2018-09-01 14:47:39'),
(9, 18, 1, 'Active', '2018-09-01 14:47:39', '2018-09-01 14:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `r_cashier`
--

CREATE TABLE `r_cashier` (
  `Cashier_ID` int(11) NOT NULL,
  `Cashier_First_Name` varchar(200) NOT NULL,
  `Cashier_Middle_Name` varchar(200) NOT NULL,
  `Cashier_Last_Name` varchar(200) NOT NULL,
  `Cashier_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Cashier_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Cashier_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_cashier`
--

INSERT INTO `r_cashier` (`Cashier_ID`, `Cashier_First_Name`, `Cashier_Middle_Name`, `Cashier_Last_Name`, `Cashier_Display_Status`, `Cashier_Date_Added`, `Cashier_Date_Updated`) VALUES
(1, 'YEtxmhwpaUX5E9xNcmL0YA==', 'Plm+4blDu99iSdAlQ6HDOw==', 'CK1ST42XWtXYwKep6B039Q==', 'Active', '2018-08-02 14:12:09', '2018-08-02 14:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `r_course`
--

CREATE TABLE `r_course` (
  `Course_ID` int(11) NOT NULL,
  `Course_Code` varchar(100) DEFAULT NULL,
  `Course_Description` varchar(100) DEFAULT NULL,
  `Course_Years` int(11) NOT NULL,
  `Course_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Course_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Course_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_course`
--

INSERT INTO `r_course` (`Course_ID`, `Course_Code`, `Course_Description`, `Course_Years`, `Course_Display_Status`, `Course_Date_Added`, `Course_Date_Updated`) VALUES
(17, 'lcppOKK5pTkV/cBXHxenhQ==', 'jIfgeSiidraBf4ezTp/2WMf55jtPwW4j3EEdgsjTHiR+wJiEeBaozlbkxa1GAV+2', 4, 'Active', '2018-08-20 22:38:46', '2018-08-20 22:38:46'),
(18, 'sFm1jYcG/rhj1tYVu0THFQ==', 'mI7uBb9KoW17jXbrQ1a4l8p2HUmnmoGhCBPBV+kroHKagv8vqTNHA7fRDc21GFq+', 4, 'Active', '2018-09-01 14:47:38', '2018-09-01 14:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `r_course_fee`
--

CREATE TABLE `r_course_fee` (
  `Course_Fee_ID` int(11) NOT NULL,
  `Course_Fee_CourseID` int(11) NOT NULL,
  `Course_Fee_AcademicYearID` int(11) NOT NULL,
  `Course_Fee_YearLevel` enum('1','2','3','4','5') NOT NULL,
  `Course_Fee_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Course_Fee_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Course_Fee_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_course_fee`
--

INSERT INTO `r_course_fee` (`Course_Fee_ID`, `Course_Fee_CourseID`, `Course_Fee_AcademicYearID`, `Course_Fee_YearLevel`, `Course_Fee_Display_Status`, `Course_Fee_Date_Added`, `Course_Fee_Date_Updated`) VALUES
(1, 17, 2, '1', 'Active', '2018-08-26 17:35:36', '2018-08-26 17:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `r_course_fee_items`
--

CREATE TABLE `r_course_fee_items` (
  `Course_Fee_Item_ID` int(11) NOT NULL,
  `Course_Fee_Item_CourseFeeID` int(11) NOT NULL,
  `Course_Fee_Item_FeeID` int(11) NOT NULL,
  `Course_Fee_Item_Amount` decimal(10,2) NOT NULL,
  `Course_Fee_Item_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Course_Fee_Item_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Course_Fee_Item_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_course_fee_items`
--

INSERT INTO `r_course_fee_items` (`Course_Fee_Item_ID`, `Course_Fee_Item_CourseFeeID`, `Course_Fee_Item_FeeID`, `Course_Fee_Item_Amount`, `Course_Fee_Item_Display_Status`, `Course_Fee_Item_Date_Added`, `Course_Fee_Item_Date_Updated`) VALUES
(1, 1, 6, '100.00', 'Active', '2018-08-26 17:35:36', '2018-08-26 17:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `r_curriculum`
--

CREATE TABLE `r_curriculum` (
  `Curriculum_ID` int(11) NOT NULL,
  `Curriculum_Code` varchar(100) NOT NULL,
  `Curriculum_SemesterID` int(11) NOT NULL,
  `Curriculum_CourseID` int(11) NOT NULL,
  `Curriculum_CurriculumYearID` int(11) NOT NULL,
  `Curriculum_YearLevel` enum('First Year','Second Year','Third Year','Fourth Year','Fifth Year') NOT NULL,
  `Curriculum_Max_Credited_Unit` int(11) NOT NULL,
  `Curriculum_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Curriculum_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Curriculum_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_curriculum`
--

INSERT INTO `r_curriculum` (`Curriculum_ID`, `Curriculum_Code`, `Curriculum_SemesterID`, `Curriculum_CourseID`, `Curriculum_CurriculumYearID`, `Curriculum_YearLevel`, `Curriculum_Max_Credited_Unit`, `Curriculum_Display_Status`, `Curriculum_Date_Added`, `Curriculum_Date_Updated`) VALUES
(59, '+VLDRNNaeotxYY+AefAXXA==', 8, 17, 1, 'First Year', 26, 'Active', '2018-08-30 16:59:22', '2018-09-24 20:20:22'),
(60, 'hhJ6I5M1+a8eUF6TdxtPyw==', 9, 17, 1, 'First Year', 27, 'Active', '2018-08-30 16:59:48', '2018-09-24 20:56:55'),
(61, 'tNMw0x0OjbZRt58Sxh4Vtw==', 8, 17, 1, 'Second Year', 26, 'Active', '2018-08-30 17:01:02', '2018-10-10 17:38:57'),
(62, 'y3nr8zTapSoNS89L2tWLUg==', 8, 18, 1, 'First Year', 20, 'Active', '2018-09-01 14:48:36', '2018-10-12 20:21:37'),
(63, 'XymmuEw2PAWoONqqtlkBpQ==', 9, 17, 1, 'Second Year', 23, 'Active', '2018-09-02 15:58:59', '2018-10-10 17:40:39'),
(64, 'LtIAyXvIorDCteOIFZ2gUw==', 8, 17, 1, 'Third Year', 24, 'Active', '2018-09-03 22:33:15', '2018-10-10 17:42:23'),
(65, '0QmHFVqvR9703StJvWisBg==', 9, 17, 1, 'Third Year', 21, 'Active', '2018-09-09 21:01:45', '2018-10-10 17:42:43'),
(66, 'uu9KkCMUNmEQplnsS3qozw==', 8, 17, 1, 'Fourth Year', 21, 'Active', '2018-09-09 21:21:56', '2018-10-10 19:36:49'),
(67, 'bTJIh9A69DRFE0wXaAZNjg==', 9, 18, 1, 'First Year', 22, 'Active', '2018-09-12 23:43:01', '2018-10-12 20:21:43'),
(68, 'GWxwEBtbh0pNqHz3h31Hxw==', 8, 17, 2, 'First Year', 23, 'Active', '2018-10-06 15:23:39', '2018-10-12 16:37:50'),
(69, 'Bri21EGP0gORl2NcXal7iA==', 10, 17, 1, 'Third Year', 3, 'Active', '2018-10-11 21:33:32', '2018-10-11 21:33:32'),
(70, 'lLWRBMFTy99+qbJ5tIOnRg==', 8, 18, 1, 'Second Year', 20, 'Active', '2018-10-11 22:01:29', '2018-10-12 20:21:48'),
(71, 'nZ8x5CgFMGPpXHzU1ktwPQ==', 9, 18, 1, 'Second Year', 18, 'Active', '2018-10-11 22:04:24', '2018-10-12 20:21:52'),
(72, 'grB68DbWio0fIfVcY9aerA==', 8, 18, 1, 'Third Year', 18, 'Active', '2018-10-11 22:07:30', '2018-10-12 20:21:55'),
(73, '3CX4V0s/KONdSMaqM9VTDg==', 9, 18, 1, 'Third Year', 18, 'Active', '2018-10-11 22:09:08', '2018-10-12 20:21:59'),
(74, '5L5+Zl8UUUybIqpSYtmoGg==', 8, 18, 1, 'Fourth Year', 21, 'Active', '2018-10-11 22:11:30', '2018-10-12 20:22:03'),
(75, 'f3rgfxGO8/sGsVsRRsdPuw==', 9, 18, 1, 'Fourth Year', 3, 'Active', '2018-10-11 22:13:36', '2018-10-12 20:22:07'),
(76, '7dX2S2DdDGrfPixayf+1dA==', 9, 17, 1, 'Fourth Year', 9, 'Active', '2018-10-12 14:56:19', '2018-10-12 16:25:08'),
(77, '+VLDRNNaeotxYY+AefAXXA==a', 10, 17, 2, 'First Year', 23, 'Active', '2018-10-12 16:35:38', '2018-10-12 17:30:59'),
(78, 'VymJAyDp9IE5UpcdKWfdrg==', 9, 17, 2, 'First Year', 25, 'Active', '2018-10-12 16:39:40', '2018-10-12 18:27:19'),
(79, '+K9khoXYRe60HfigGTgWYg==', 8, 17, 2, 'Second Year', 23, 'Active', '2018-10-12 16:47:32', '2018-10-12 16:48:02'),
(80, 'AHY7t0gg/cp9t6WiHSZC1g==', 9, 17, 2, 'Second Year', 20, 'Active', '2018-10-12 16:49:28', '2018-10-12 16:49:51'),
(81, 'VJw76sYfaMdSYi+xaOf/1w==', 8, 17, 2, 'Third Year', 21, 'Active', '2018-10-12 16:51:07', '2018-10-12 16:51:29'),
(82, 'FhFim33jpp3KyXdiWHO/CA==', 9, 17, 2, 'Third Year', 18, 'Active', '2018-10-12 16:52:44', '2018-10-12 16:53:07'),
(83, '491gTeE8RwOOZt54evTclw==', 8, 17, 2, 'Fourth Year', 18, 'Active', '2018-10-12 16:54:59', '2018-10-12 16:55:15'),
(84, 'UDOe4tI1se2KoiuXDOMPwA==', 9, 17, 2, 'Fourth Year', 9, 'Active', '2018-10-12 16:55:39', '2018-10-12 16:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `r_curriculumitem`
--

CREATE TABLE `r_curriculumitem` (
  `CurriculumItem_ID` int(11) NOT NULL,
  `CurriculumItem_CurriculumID` int(11) NOT NULL,
  `CurriculumItem_SubjectID` int(11) NOT NULL,
  `CurriculumItem_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `CurriculumItem_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CurriculumItem_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_curriculumitem`
--

INSERT INTO `r_curriculumitem` (`CurriculumItem_ID`, `CurriculumItem_CurriculumID`, `CurriculumItem_SubjectID`, `CurriculumItem_Display_Status`, `CurriculumItem_Date_Added`, `CurriculumItem_Date_Updated`) VALUES
(86, 59, 67, 'Active', '2018-08-30 16:59:22', '2018-09-24 20:03:17'),
(87, 59, 66, 'Active', '2018-08-30 16:59:22', '2018-09-24 20:03:18'),
(88, 59, 72, 'Inactive', '2018-08-30 16:59:22', '2018-09-09 21:51:15'),
(89, 59, 80, 'Active', '2018-08-30 16:59:22', '2018-09-24 20:03:18'),
(90, 60, 69, 'Active', '2018-08-30 16:59:48', '2018-10-10 17:39:17'),
(91, 60, 81, 'Active', '2018-08-30 16:59:48', '2018-10-10 17:39:18'),
(92, 60, 68, 'Active', '2018-08-30 16:59:48', '2018-10-10 17:39:17'),
(93, 61, 74, 'Inactive', '2018-08-30 17:01:02', '2018-09-09 22:10:29'),
(94, 61, 73, 'Inactive', '2018-08-30 17:01:02', '2018-09-09 22:10:29'),
(95, 62, 74, 'Inactive', '2018-09-01 14:48:36', '2018-10-06 20:13:36'),
(96, 62, 71, 'Inactive', '2018-09-01 14:48:36', '2018-10-06 20:13:36'),
(97, 62, 80, 'Active', '2018-09-01 14:48:36', '2018-10-12 18:27:06'),
(98, 63, 79, 'Inactive', '2018-09-02 15:58:59', '2018-09-02 15:59:09'),
(99, 63, 68, 'Inactive', '2018-09-02 15:58:59', '2018-09-09 22:30:10'),
(100, 64, 77, 'Inactive', '2018-09-03 22:33:15', '2018-09-09 20:58:47'),
(101, 64, 88, 'Active', '2018-09-09 20:58:47', '2018-10-10 17:42:23'),
(102, 64, 96, 'Active', '2018-09-09 20:58:48', '2018-10-10 17:42:23'),
(103, 64, 90, 'Active', '2018-09-09 20:58:48', '2018-10-10 17:42:23'),
(104, 64, 98, 'Active', '2018-09-09 20:58:48', '2018-10-10 17:42:23'),
(105, 64, 104, 'Active', '2018-09-09 20:58:48', '2018-10-10 17:42:23'),
(106, 64, 106, 'Active', '2018-09-09 20:58:48', '2018-10-10 17:42:23'),
(107, 64, 117, 'Active', '2018-09-09 20:58:48', '2018-10-10 17:42:23'),
(108, 64, 130, 'Active', '2018-09-09 20:58:48', '2018-10-10 17:42:23'),
(109, 65, 94, 'Active', '2018-09-09 21:01:45', '2018-10-10 17:42:44'),
(110, 65, 74, 'Active', '2018-09-09 21:01:45', '2018-10-10 17:42:44'),
(111, 65, 93, 'Active', '2018-09-09 21:01:45', '2018-10-10 17:42:44'),
(112, 65, 110, 'Active', '2018-09-09 21:01:45', '2018-10-10 17:42:44'),
(113, 65, 118, 'Active', '2018-09-09 21:01:45', '2018-10-10 17:42:44'),
(114, 65, 119, 'Active', '2018-09-09 21:01:45', '2018-10-10 17:42:44'),
(115, 65, 107, 'Active', '2018-09-09 21:01:45', '2018-10-10 17:42:44'),
(116, 66, 112, 'Active', '2018-09-09 21:21:56', '2018-10-10 19:36:49'),
(117, 66, 113, 'Active', '2018-09-09 21:21:56', '2018-10-10 19:36:49'),
(118, 66, 73, 'Active', '2018-09-09 21:21:56', '2018-10-10 19:36:49'),
(119, 66, 109, 'Active', '2018-09-09 21:21:56', '2018-10-10 19:36:49'),
(120, 66, 114, 'Active', '2018-09-09 21:21:56', '2018-10-10 19:36:49'),
(121, 66, 115, 'Active', '2018-09-09 21:21:56', '2018-10-10 19:36:49'),
(122, 66, 116, 'Active', '2018-09-09 21:21:56', '2018-10-10 19:36:49'),
(123, 59, 75, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:18'),
(124, 59, 87, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:18'),
(125, 59, 78, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:17'),
(126, 59, 70, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:17'),
(127, 59, 121, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:18'),
(128, 59, 122, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:18'),
(129, 60, 76, 'Active', '2018-09-09 21:53:27', '2018-10-10 17:39:18'),
(130, 60, 71, 'Active', '2018-09-09 21:53:27', '2018-10-10 17:39:18'),
(131, 60, 100, 'Active', '2018-09-09 21:53:27', '2018-10-10 17:39:18'),
(132, 60, 101, 'Active', '2018-09-09 21:53:27', '2018-10-10 17:39:17'),
(133, 60, 79, 'Active', '2018-09-09 21:53:27', '2018-10-10 17:39:18'),
(134, 61, 92, 'Active', '2018-09-09 22:10:29', '2018-10-10 17:38:58'),
(135, 61, 89, 'Active', '2018-09-09 22:10:29', '2018-10-10 17:38:58'),
(136, 61, 72, 'Active', '2018-09-09 22:10:29', '2018-10-10 17:38:58'),
(137, 61, 77, 'Active', '2018-09-09 22:10:29', '2018-10-10 17:38:58'),
(138, 61, 102, 'Active', '2018-09-09 22:10:29', '2018-10-10 17:38:58'),
(139, 61, 103, 'Active', '2018-09-09 22:10:29', '2018-10-10 17:38:58'),
(140, 61, 124, 'Active', '2018-09-09 22:10:29', '2018-10-10 17:38:58'),
(141, 61, 131, 'Active', '2018-09-09 22:10:29', '2018-10-10 17:38:58'),
(142, 61, 133, 'Active', '2018-09-09 22:10:29', '2018-10-10 17:38:58'),
(143, 60, 134, 'Active', '2018-09-09 22:24:55', '2018-10-10 17:39:18'),
(144, 63, 97, 'Active', '2018-09-09 22:30:10', '2018-10-10 17:40:39'),
(145, 63, 91, 'Active', '2018-09-09 22:30:10', '2018-10-10 17:40:39'),
(146, 63, 95, 'Active', '2018-09-09 22:30:10', '2018-10-10 17:40:39'),
(147, 63, 99, 'Active', '2018-09-09 22:30:10', '2018-10-10 17:40:39'),
(148, 63, 120, 'Active', '2018-09-09 22:30:10', '2018-10-10 17:40:39'),
(149, 63, 105, 'Active', '2018-09-09 22:30:10', '2018-10-10 17:40:39'),
(150, 63, 125, 'Active', '2018-09-09 22:30:10', '2018-10-10 17:40:39'),
(151, 63, 132, 'Active', '2018-09-09 22:30:10', '2018-10-10 17:40:39'),
(152, 67, 68, 'Inactive', '2018-09-12 23:45:12', '2019-02-04 21:49:54'),
(153, 62, 65, 'Inactive', '2018-09-24 18:20:06', '2018-10-06 20:13:36'),
(154, 68, 72, 'Inactive', '2018-10-06 15:23:39', '2018-10-06 20:16:09'),
(155, 68, 66, 'Active', '2018-10-06 15:23:39', '2018-10-12 16:37:51'),
(156, 68, 74, 'Inactive', '2018-10-06 15:23:39', '2018-10-06 20:16:09'),
(157, 68, 81, 'Inactive', '2018-10-06 15:23:39', '2018-10-06 20:16:09'),
(158, 62, 70, 'Active', '2018-10-06 20:13:36', '2018-10-12 18:27:06'),
(159, 62, 87, 'Active', '2018-10-06 20:13:36', '2018-10-12 18:27:06'),
(160, 62, 75, 'Active', '2018-10-06 20:13:36', '2018-10-12 18:27:06'),
(161, 68, 70, 'Active', '2018-10-06 20:16:10', '2018-10-12 16:37:51'),
(162, 68, 67, 'Active', '2018-10-06 20:16:10', '2018-10-12 16:37:51'),
(163, 68, 80, 'Active', '2018-10-06 20:16:10', '2018-10-12 16:37:51'),
(165, 70, 99, 'Active', '2018-10-11 22:01:29', '2018-10-12 18:28:07'),
(166, 70, 135, 'Active', '2018-10-11 22:01:29', '2018-10-12 18:28:07'),
(167, 70, 124, 'Active', '2018-10-11 22:01:29', '2018-10-12 18:28:07'),
(168, 70, 137, 'Active', '2018-10-11 22:01:29', '2018-10-12 18:28:07'),
(169, 70, 77, 'Active', '2018-10-11 22:01:29', '2018-10-12 18:28:07'),
(170, 70, 66, 'Active', '2018-10-11 22:01:29', '2018-10-12 18:28:07'),
(171, 71, 136, 'Active', '2018-10-11 22:04:24', '2019-02-04 21:51:51'),
(172, 71, 138, 'Active', '2018-10-11 22:04:24', '2019-02-04 21:51:51'),
(173, 71, 74, 'Active', '2018-10-11 22:04:24', '2019-02-04 21:51:51'),
(174, 71, 89, 'Inactive', '2018-10-11 22:04:24', '2019-02-04 21:51:51'),
(175, 71, 116, 'Active', '2018-10-11 22:04:24', '2019-02-04 21:51:51'),
(176, 72, 139, 'Active', '2018-10-11 22:07:30', '2019-02-04 21:52:10'),
(177, 72, 141, 'Active', '2018-10-11 22:07:30', '2019-02-04 21:52:10'),
(178, 72, 140, 'Active', '2018-10-11 22:07:30', '2019-02-04 21:52:10'),
(179, 72, 145, 'Active', '2018-10-11 22:07:30', '2019-02-04 21:52:10'),
(180, 72, 90, 'Inactive', '2018-10-11 22:07:30', '2019-02-04 21:52:10'),
(181, 73, 144, 'Active', '2018-10-11 22:09:08', '2019-02-04 21:52:27'),
(182, 73, 142, 'Active', '2018-10-11 22:09:08', '2019-02-04 21:52:27'),
(183, 73, 98, 'Active', '2018-10-11 22:09:08', '2019-02-04 21:52:27'),
(184, 73, 146, 'Active', '2018-10-11 22:09:08', '2019-02-04 21:52:27'),
(185, 73, 91, 'Inactive', '2018-10-11 22:09:08', '2019-02-04 21:52:27'),
(186, 74, 150, 'Active', '2018-10-11 22:11:31', '2018-10-12 18:28:49'),
(187, 74, 73, 'Active', '2018-10-11 22:11:31', '2018-10-12 18:28:49'),
(188, 74, 147, 'Active', '2018-10-11 22:11:31', '2018-10-12 18:28:49'),
(189, 74, 152, 'Active', '2018-10-11 22:11:31', '2018-10-12 18:28:49'),
(190, 74, 151, 'Active', '2018-10-11 22:11:31', '2018-10-12 18:28:49'),
(191, 74, 153, 'Active', '2018-10-11 22:11:31', '2018-10-12 18:28:49'),
(192, 75, 148, 'Active', '2018-10-11 22:13:36', '2018-10-12 18:29:03'),
(193, 75, 149, 'Active', '2018-10-11 22:13:36', '2018-10-12 18:29:03'),
(194, 62, 122, 'Active', '2018-10-11 22:24:50', '2018-10-12 18:27:06'),
(195, 62, 121, 'Active', '2018-10-11 22:24:50', '2018-10-12 18:27:06'),
(196, 62, 78, 'Active', '2018-10-11 22:24:50', '2018-10-12 18:27:06'),
(197, 67, 69, 'Active', '2018-10-11 22:27:46', '2019-02-04 21:49:55'),
(198, 67, 71, 'Active', '2018-10-11 22:27:46', '2019-02-04 21:49:55'),
(199, 67, 134, 'Active', '2018-10-11 22:27:46', '2019-02-04 21:49:55'),
(200, 67, 76, 'Active', '2018-10-11 22:27:46', '2019-02-04 21:49:55'),
(201, 67, 79, 'Active', '2018-10-11 22:27:46', '2019-02-04 21:49:55'),
(202, 67, 81, 'Active', '2018-10-11 22:27:46', '2019-02-04 21:49:55'),
(203, 76, 154, 'Inactive', '2018-10-12 14:56:19', '2018-10-12 16:25:08'),
(204, 76, 108, 'Active', '2018-10-12 16:25:09', '2018-10-12 16:25:09'),
(205, 69, 111, 'Active', '2018-10-12 16:32:52', '2018-10-12 16:32:52'),
(206, 77, 70, 'Active', '2018-10-12 16:35:38', '2018-10-12 16:35:38'),
(207, 77, 78, 'Active', '2018-10-12 16:35:38', '2018-10-12 16:35:38'),
(208, 77, 67, 'Active', '2018-10-12 16:35:38', '2018-10-12 16:35:38'),
(209, 77, 87, 'Active', '2018-10-12 16:35:38', '2018-10-12 16:35:38'),
(210, 77, 75, 'Active', '2018-10-12 16:35:38', '2018-10-12 16:35:38'),
(211, 77, 122, 'Active', '2018-10-12 16:35:38', '2018-10-12 16:35:38'),
(212, 77, 121, 'Active', '2018-10-12 16:35:38', '2018-10-12 16:35:38'),
(213, 77, 80, 'Active', '2018-10-12 16:35:38', '2018-10-12 16:35:38'),
(214, 68, 75, 'Active', '2018-10-12 16:37:51', '2018-10-12 16:37:51'),
(215, 68, 122, 'Active', '2018-10-12 16:37:51', '2018-10-12 16:37:51'),
(216, 68, 121, 'Active', '2018-10-12 16:37:51', '2018-10-12 16:37:51'),
(217, 68, 78, 'Active', '2018-10-12 16:37:51', '2018-10-12 16:37:51'),
(218, 78, 71, 'Active', '2018-10-12 16:39:40', '2018-10-12 18:27:19'),
(219, 78, 69, 'Active', '2018-10-12 16:39:40', '2018-10-12 18:27:19'),
(220, 78, 101, 'Active', '2018-10-12 16:39:40', '2018-10-12 18:27:19'),
(221, 78, 68, 'Active', '2018-10-12 16:39:40', '2018-10-12 18:27:19'),
(222, 78, 76, 'Active', '2018-10-12 16:39:40', '2018-10-12 18:27:19'),
(223, 78, 100, 'Active', '2018-10-12 16:39:41', '2018-10-12 18:27:20'),
(224, 78, 134, 'Active', '2018-10-12 16:39:41', '2018-10-12 18:27:20'),
(225, 78, 81, 'Active', '2018-10-12 16:39:41', '2018-10-12 18:27:20'),
(226, 79, 102, 'Active', '2018-10-12 16:47:32', '2018-10-12 16:47:32'),
(227, 79, 103, 'Active', '2018-10-12 16:47:32', '2018-10-12 16:47:32'),
(228, 79, 77, 'Active', '2018-10-12 16:47:32', '2018-10-12 16:47:32'),
(229, 79, 133, 'Active', '2018-10-12 16:47:32', '2018-10-12 16:47:32'),
(230, 79, 89, 'Active', '2018-10-12 16:47:32', '2018-10-12 16:47:32'),
(231, 79, 92, 'Active', '2018-10-12 16:47:32', '2018-10-12 16:47:32'),
(232, 79, 124, 'Active', '2018-10-12 16:47:32', '2018-10-12 16:47:32'),
(233, 79, 72, 'Active', '2018-10-12 16:47:32', '2018-10-12 16:47:32'),
(234, 80, 95, 'Active', '2018-10-12 16:49:28', '2018-10-12 16:49:28'),
(235, 80, 99, 'Active', '2018-10-12 16:49:28', '2018-10-12 16:49:28'),
(236, 80, 97, 'Active', '2018-10-12 16:49:28', '2018-10-12 16:49:28'),
(237, 80, 125, 'Active', '2018-10-12 16:49:28', '2018-10-12 16:49:28'),
(238, 80, 105, 'Active', '2018-10-12 16:49:28', '2018-10-12 16:49:28'),
(239, 80, 91, 'Active', '2018-10-12 16:49:28', '2018-10-12 16:49:28'),
(240, 80, 132, 'Active', '2018-10-12 16:49:28', '2018-10-12 16:49:28'),
(241, 81, 106, 'Active', '2018-10-12 16:51:07', '2018-10-12 16:51:07'),
(242, 81, 96, 'Active', '2018-10-12 16:51:07', '2018-10-12 16:51:07'),
(243, 81, 90, 'Active', '2018-10-12 16:51:07', '2018-10-12 16:51:07'),
(244, 81, 88, 'Active', '2018-10-12 16:51:07', '2018-10-12 16:51:07'),
(245, 81, 117, 'Active', '2018-10-12 16:51:07', '2018-10-12 16:51:07'),
(246, 81, 104, 'Active', '2018-10-12 16:51:07', '2018-10-12 16:51:07'),
(247, 81, 98, 'Active', '2018-10-12 16:51:07', '2018-10-12 16:51:07'),
(248, 82, 107, 'Active', '2018-10-12 16:52:44', '2018-10-12 16:52:44'),
(249, 82, 93, 'Active', '2018-10-12 16:52:44', '2018-10-12 16:52:44'),
(250, 82, 118, 'Active', '2018-10-12 16:52:44', '2018-10-12 16:52:44'),
(251, 82, 119, 'Active', '2018-10-12 16:52:44', '2018-10-12 16:52:44'),
(252, 82, 94, 'Active', '2018-10-12 16:52:44', '2018-10-12 16:52:44'),
(253, 82, 110, 'Active', '2018-10-12 16:52:44', '2018-10-12 16:52:44'),
(254, 83, 109, 'Active', '2018-10-12 16:54:59', '2018-10-12 16:54:59'),
(255, 83, 112, 'Active', '2018-10-12 16:54:59', '2018-10-12 16:54:59'),
(256, 83, 116, 'Active', '2018-10-12 16:54:59', '2018-10-12 16:54:59'),
(257, 83, 115, 'Active', '2018-10-12 16:54:59', '2018-10-12 16:54:59'),
(258, 83, 114, 'Active', '2018-10-12 16:54:59', '2018-10-12 16:54:59'),
(259, 83, 113, 'Active', '2018-10-12 16:54:59', '2018-10-12 16:54:59'),
(260, 84, 108, 'Active', '2018-10-12 16:55:39', '2018-10-12 16:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `r_curriculumyear`
--

CREATE TABLE `r_curriculumyear` (
  `CurriculumYear_ID` int(11) NOT NULL,
  `CurriculumYear_Code` varchar(200) NOT NULL,
  `CurriculumYear_Description` varchar(200) NOT NULL,
  `CurriculumYear_Ative_Flag` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive',
  `CurriculumYear_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `CurriculumYear_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CurriculumYear_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_curriculumyear`
--

INSERT INTO `r_curriculumyear` (`CurriculumYear_ID`, `CurriculumYear_Code`, `CurriculumYear_Description`, `CurriculumYear_Ative_Flag`, `CurriculumYear_Display_Status`, `CurriculumYear_Date_Added`, `CurriculumYear_Date_Updated`) VALUES
(1, 'qEmiI5/0XZY1EFyZ3Pnk6w==', 'mcctP57D/WKwY5t8ETo/jg==', 'Active', 'Active', '2018-08-02 07:14:09', '2018-10-12 18:15:01'),
(2, 'JYAxs5DNonwjmZquAxcc/A==', '2nlX+AOfrgX4Eh4PuvjsUg==', 'Inactive', 'Active', '2018-08-09 12:10:32', '2018-10-12 18:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `r_degree`
--

CREATE TABLE `r_degree` (
  `Degree_ID` int(11) NOT NULL,
  `Degree_Code` varchar(100) NOT NULL,
  `Degree_Description` varchar(100) NOT NULL,
  `Degree_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Degree_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Degree_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_degree`
--

INSERT INTO `r_degree` (`Degree_ID`, `Degree_Code`, `Degree_Description`, `Degree_Display_Status`, `Degree_Date_Added`, `Degree_Date_Updated`) VALUES
(1, 'MIT', 'Masteral in Information Technology', 'Active', '2018-08-29 17:53:23', '2018-08-29 17:53:23'),
(2, 'ME-S', 'Masteral in Education major in Science', 'Active', '2018-09-04 14:17:13', '2018-09-04 14:17:13'),
(3, 'ME-H', 'Masteral in Education major in History', 'Active', '2018-09-04 14:18:01', '2018-09-04 14:18:01'),
(4, 'ME-P', 'Masteral in Education major in Pyschology', 'Active', '2018-09-04 14:20:53', '2018-09-04 14:20:53'),
(5, 'ME-M', 'Masteral in Education major in Math', 'Active', '2018-09-04 14:20:53', '2018-09-04 14:20:53'),
(6, 'MA', 'Masteral in Accountancy ', 'Active', '2018-09-04 14:23:45', '2018-09-04 14:23:45'),
(7, 'MAF', 'Master of Applied Finance', 'Active', '2018-09-04 14:25:17', '2018-09-04 14:25:17'),
(8, 'MEcon', 'Master of Economics', 'Active', '2018-09-04 14:25:17', '2018-09-04 14:25:17'),
(9, 'MMC', 'Master of Mass Communication', 'Active', '2018-09-04 14:26:27', '2018-09-04 14:26:27'),
(10, 'MMPhy', 'Master of Physics', 'Active', '2018-09-04 14:26:27', '2018-09-04 14:26:27'),
(11, 'MSHRD', 'Master of Science in Human Resource Development', 'Active', '2018-09-04 14:27:55', '2018-09-04 14:27:55'),
(12, 'MST', 'Master of Science in Taxation', 'Active', '2018-09-04 14:27:55', '2018-09-04 14:27:55'),
(13, 'MSM', 'Master of Science in Management', 'Active', '2018-09-04 14:29:41', '2018-09-04 14:29:41'),
(14, 'MH', 'Master of Humanities', 'Active', '2018-09-04 14:29:41', '2018-09-04 14:29:41'),
(15, 'MC', 'Master of Counseling', 'Active', '2018-09-04 14:30:08', '2018-09-04 14:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `r_documents`
--

CREATE TABLE `r_documents` (
  `Documents_ID` int(11) NOT NULL,
  `Documents_Description` varchar(200) NOT NULL,
  `Documents_Mandatory` enum('Yes','No') NOT NULL,
  `Documents_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Documents_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Documents_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_documents`
--

INSERT INTO `r_documents` (`Documents_ID`, `Documents_Description`, `Documents_Mandatory`, `Documents_Display_Status`, `Documents_Date_Added`, `Documents_Date_Updated`) VALUES
(3, 'CGGHScsAWoVVbd9g4j72pg==', 'Yes', 'Active', '2018-09-04 15:45:34', '2018-09-04 15:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `r_educational_attainment`
--

CREATE TABLE `r_educational_attainment` (
  `Educational_Attainment_ID` int(11) NOT NULL,
  `Educational_Attainment_School` varchar(100) NOT NULL,
  `Educational_Attainment_School_Level` enum('Elementary','High School','Senior High School','Vocational Technology','College') NOT NULL,
  `Educational_Attainment_Address` varchar(100) NOT NULL,
  `Educational_Attainment_School_Course` varchar(100) NOT NULL,
  `Educational_Attainment_Inclusive_Year` varchar(100) NOT NULL,
  `Educational_Attainment_StudentAccountID` int(11) NOT NULL,
  `Educational_Attainment_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Educational_Attainment_Date_Added` datetime DEFAULT CURRENT_TIMESTAMP,
  `Educational_Attainment_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_faculty_degree`
--

CREATE TABLE `r_faculty_degree` (
  `Faculty_Degree_ID` int(11) NOT NULL,
  `Faculty_Degree_ProfessorID` int(11) NOT NULL,
  `Faculty_Degree_DegreeID` int(11) NOT NULL,
  `Faculty_Degree_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Faculty_Degree_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Faculty_Degree_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_faculty_degree`
--

INSERT INTO `r_faculty_degree` (`Faculty_Degree_ID`, `Faculty_Degree_ProfessorID`, `Faculty_Degree_DegreeID`, `Faculty_Degree_Display_Status`, `Faculty_Degree_Date_Added`, `Faculty_Degree_Date_Updated`) VALUES
(6, 8, 1, 'Active', '2018-09-04 14:33:14', '2018-09-06 17:49:37'),
(7, 9, 1, 'Active', '2018-09-04 14:33:30', '2018-09-04 15:49:26'),
(8, 10, 6, 'Active', '2018-09-04 14:34:47', '2018-09-16 15:35:04'),
(9, 11, 13, 'Active', '2018-09-04 14:35:43', '2018-09-13 12:37:27'),
(10, 12, 9, 'Active', '2018-09-04 14:39:14', '2018-09-16 15:33:01'),
(11, 13, 9, 'Active', '2018-09-04 14:41:35', '2018-09-04 14:41:35'),
(12, 14, 14, 'Active', '2018-09-04 14:43:48', '2018-09-04 14:43:48'),
(13, 15, 3, 'Active', '2018-09-04 14:44:58', '2018-09-04 14:44:58'),
(14, 16, 5, 'Active', '2018-09-04 14:46:09', '2019-03-27 00:12:58'),
(15, 17, 3, 'Active', '2018-09-04 14:47:35', '2018-09-04 14:47:35'),
(16, 18, 1, 'Active', '2018-10-10 01:31:36', '2018-10-12 21:49:35'),
(17, 19, 4, 'Active', '2018-10-19 00:42:59', '2018-10-19 00:42:59'),
(18, 20, 3, 'Active', '2018-10-19 00:46:53', '2018-10-19 00:46:53'),
(19, 21, 3, 'Active', '2018-10-19 00:48:13', '2018-10-19 00:48:13'),
(20, 22, 5, 'Active', '2018-10-19 00:49:13', '2018-10-19 00:49:13'),
(21, 23, 5, 'Active', '2018-10-19 00:52:09', '2018-10-19 00:52:09'),
(22, 24, 3, 'Active', '2018-10-19 01:21:21', '2018-10-19 01:21:21'),
(23, 25, 3, 'Active', '2018-10-19 01:23:18', '2018-10-19 01:23:18'),
(24, 26, 6, 'Active', '2018-10-19 01:24:41', '2018-10-19 01:24:41'),
(25, 27, 3, 'Active', '2018-10-19 01:27:22', '2018-10-19 01:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `r_faculty_subject`
--

CREATE TABLE `r_faculty_subject` (
  `Faculty_Subject_ID` int(11) NOT NULL,
  `Faculty_Subject_SubjectID` int(11) NOT NULL,
  `Faculty_Subject_ProfessorID` int(11) NOT NULL,
  `Faculty_Subject_Display_Status` enum('Active','Inactive') NOT NULL,
  `Faculty_Subject_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Faculty_Subject_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_faculty_subject`
--

INSERT INTO `r_faculty_subject` (`Faculty_Subject_ID`, `Faculty_Subject_SubjectID`, `Faculty_Subject_ProfessorID`, `Faculty_Subject_Display_Status`, `Faculty_Subject_Date_Added`, `Faculty_Subject_Date_Updated`) VALUES
(36, 66, 8, 'Active', '2018-09-04 14:33:14', '2018-09-06 17:49:37'),
(37, 68, 8, 'Active', '2018-09-04 14:33:14', '2018-09-06 17:49:37'),
(38, 66, 9, 'Active', '2018-09-04 14:33:30', '2018-09-04 15:49:26'),
(39, 68, 9, 'Active', '2018-09-04 14:33:31', '2018-09-04 15:49:26'),
(40, 65, 10, 'Active', '2018-09-04 14:34:47', '2018-09-16 15:35:04'),
(41, 78, 11, 'Active', '2018-09-04 14:35:43', '2018-09-13 12:37:27'),
(42, 75, 12, 'Active', '2018-09-04 14:39:15', '2018-09-16 15:33:00'),
(43, 77, 12, 'Active', '2018-09-04 14:39:15', '2018-09-16 15:33:00'),
(44, 76, 13, 'Active', '2018-09-04 14:41:35', '2018-09-04 14:41:35'),
(45, 74, 14, 'Active', '2018-09-04 14:43:48', '2018-09-04 14:43:48'),
(46, 82, 14, 'Active', '2018-09-04 14:43:49', '2018-09-04 14:43:49'),
(47, 72, 15, 'Active', '2018-09-04 14:44:58', '2018-09-04 14:44:58'),
(48, 73, 15, 'Active', '2018-09-04 14:44:59', '2018-09-04 14:44:59'),
(49, 78, 16, 'Active', '2018-09-04 14:46:09', '2019-03-27 00:12:58'),
(50, 79, 16, 'Active', '2018-09-04 14:46:09', '2019-03-27 00:12:58'),
(51, 70, 17, 'Active', '2018-09-04 14:47:35', '2018-09-04 14:47:35'),
(52, 71, 17, 'Active', '2018-09-04 14:47:35', '2018-09-04 14:47:35'),
(53, 67, 9, 'Active', '2018-09-04 15:49:26', '2018-09-04 15:49:26'),
(54, 82, 10, 'Active', '2018-09-04 15:50:17', '2018-09-16 15:35:04'),
(55, 85, 10, 'Active', '2018-09-04 15:50:17', '2018-09-16 15:35:04'),
(56, 83, 10, 'Active', '2018-09-04 15:50:39', '2018-09-16 15:35:04'),
(57, 84, 10, 'Active', '2018-09-04 15:50:39', '2018-09-16 15:35:04'),
(58, 69, 8, 'Active', '2018-09-06 17:49:37', '2018-09-06 17:49:37'),
(59, 121, 11, 'Active', '2018-09-13 12:36:28', '2018-09-13 12:37:27'),
(60, 87, 11, 'Active', '2018-09-13 12:37:27', '2018-09-13 12:37:27'),
(61, 122, 10, 'Active', '2018-09-13 12:38:15', '2018-09-16 15:35:04'),
(62, 100, 12, 'Active', '2018-09-16 15:33:00', '2018-09-16 15:33:00'),
(63, 101, 12, 'Active', '2018-09-16 15:33:00', '2018-09-16 15:33:00'),
(64, 102, 12, 'Active', '2018-09-16 15:33:01', '2018-09-16 15:33:01'),
(65, 103, 12, 'Active', '2018-09-16 15:33:01', '2018-09-16 15:33:01'),
(66, 104, 12, 'Active', '2018-09-16 15:33:01', '2018-09-16 15:33:01'),
(67, 105, 12, 'Active', '2018-09-16 15:33:01', '2018-09-16 15:33:01'),
(68, 106, 12, 'Active', '2018-09-16 15:33:01', '2018-09-16 15:33:01'),
(69, 107, 12, 'Active', '2018-09-16 15:33:01', '2018-09-16 15:33:01'),
(70, 108, 12, 'Active', '2018-09-16 15:33:01', '2018-09-16 15:33:01'),
(71, 109, 12, 'Active', '2018-09-16 15:33:01', '2018-09-16 15:33:01'),
(72, 123, 10, 'Active', '2018-09-16 15:35:04', '2018-09-16 15:35:04'),
(73, 124, 10, 'Active', '2018-09-16 15:35:04', '2018-09-16 15:35:04'),
(74, 125, 10, 'Active', '2018-09-16 15:35:04', '2018-09-16 15:35:04'),
(75, 134, 10, 'Active', '2018-09-16 15:35:04', '2018-09-16 15:35:04'),
(76, 65, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:32'),
(77, 66, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:32'),
(78, 67, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(79, 68, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(80, 69, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(81, 70, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(82, 71, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(83, 72, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(84, 73, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(85, 74, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(86, 75, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(87, 76, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(88, 77, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(89, 78, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:33'),
(90, 79, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:34'),
(91, 86, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:34'),
(92, 87, 18, 'Active', '2018-10-10 01:31:37', '2018-10-12 21:49:34'),
(93, 88, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(94, 89, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(95, 90, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(96, 91, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(97, 92, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(98, 93, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(99, 94, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(100, 95, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(101, 96, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(102, 97, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(103, 98, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:34'),
(104, 99, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(105, 100, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(106, 101, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(107, 102, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(108, 103, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(109, 104, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(110, 105, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(111, 106, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(112, 107, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(113, 108, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(114, 109, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(115, 110, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(116, 111, 18, 'Active', '2018-10-10 01:31:38', '2018-10-12 21:49:35'),
(117, 112, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:35'),
(118, 113, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(119, 114, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(120, 115, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(121, 116, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(122, 117, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(123, 118, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(124, 119, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(125, 120, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(126, 121, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(127, 130, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(128, 131, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(129, 132, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(130, 133, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:36'),
(131, 80, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:34'),
(132, 81, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:34'),
(133, 82, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:34'),
(134, 83, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:34'),
(135, 84, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:34'),
(136, 85, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:34'),
(137, 122, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:34'),
(138, 123, 18, 'Active', '2018-10-10 01:31:39', '2018-10-12 21:49:34'),
(139, 124, 18, 'Active', '2018-10-10 01:31:40', '2018-10-12 21:49:34'),
(140, 125, 18, 'Active', '2018-10-10 01:31:40', '2018-10-12 21:49:34'),
(141, 126, 18, 'Active', '2018-10-10 01:31:40', '2018-10-12 21:49:34'),
(142, 127, 18, 'Active', '2018-10-10 01:31:40', '2018-10-12 21:49:34'),
(143, 128, 18, 'Active', '2018-10-10 01:31:40', '2018-10-12 21:49:34'),
(144, 129, 18, 'Active', '2018-10-10 01:31:40', '2018-10-12 21:49:35'),
(145, 134, 18, 'Active', '2018-10-10 01:31:40', '2018-10-12 21:49:35'),
(146, 135, 18, 'Active', '2018-10-12 21:49:32', '2018-10-12 21:49:36'),
(147, 136, 18, 'Active', '2018-10-12 21:49:32', '2018-10-12 21:49:36'),
(148, 137, 18, 'Active', '2018-10-12 21:49:32', '2018-10-12 21:49:36'),
(149, 138, 18, 'Active', '2018-10-12 21:49:32', '2018-10-12 21:49:36'),
(150, 139, 18, 'Active', '2018-10-12 21:49:32', '2018-10-12 21:49:36'),
(151, 140, 18, 'Active', '2018-10-12 21:49:32', '2018-10-12 21:49:32'),
(152, 141, 18, 'Active', '2018-10-12 21:49:32', '2018-10-12 21:49:32'),
(153, 142, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(154, 143, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(155, 144, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(156, 145, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(157, 146, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(158, 147, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(159, 148, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(160, 149, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(161, 150, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(162, 151, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(163, 152, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(164, 153, 18, 'Active', '2018-10-12 21:49:33', '2018-10-12 21:49:33'),
(165, 154, 18, 'Active', '2018-10-12 21:49:34', '2018-10-12 21:49:34'),
(166, 65, 19, 'Active', '2018-10-19 00:42:59', '2018-10-19 00:42:59'),
(167, 65, 20, 'Active', '2018-10-19 00:46:53', '2018-10-19 00:46:53'),
(168, 66, 21, 'Active', '2018-10-19 00:48:13', '2018-10-19 00:48:13'),
(169, 67, 22, 'Active', '2018-10-19 00:49:13', '2018-10-19 00:49:13'),
(170, 68, 23, 'Active', '2018-10-19 00:52:09', '2018-10-19 00:52:09'),
(171, 66, 24, 'Active', '2018-10-19 01:21:22', '2018-10-19 01:21:22'),
(172, 67, 25, 'Active', '2018-10-19 01:23:18', '2018-10-19 01:23:18'),
(173, 67, 26, 'Active', '2018-10-19 01:24:41', '2018-10-19 01:24:41'),
(174, 68, 26, 'Active', '2018-10-19 01:24:41', '2018-10-19 01:24:41'),
(175, 67, 27, 'Active', '2018-10-19 01:27:22', '2018-10-19 01:27:22'),
(176, 142, 16, 'Active', '2019-03-27 00:12:58', '2019-03-27 00:12:58'),
(177, 144, 16, 'Active', '2019-03-27 00:12:58', '2019-03-27 00:12:58'),
(178, 146, 16, 'Active', '2019-03-27 00:12:58', '2019-03-27 00:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `r_fee`
--

CREATE TABLE `r_fee` (
  `Fee_ID` int(11) NOT NULL,
  `Fee_Code` varchar(100) NOT NULL,
  `Fee_Type` enum('Basic','Laboratory','Miscellaneous','Other') NOT NULL DEFAULT 'Basic',
  `Fee_Description` varchar(100) NOT NULL,
  `Fee_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Fee_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fee_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_fee`
--

INSERT INTO `r_fee` (`Fee_ID`, `Fee_Code`, `Fee_Type`, `Fee_Description`, `Fee_Display_Status`, `Fee_Date_Added`, `Fee_Date_Updated`) VALUES
(1, '42ZRjdyDnZ8yd6Ij1ZK/rA==', 'Basic', 'cSnJkkz9pXcynsQwlSpvJA==', 'Active', '2018-08-02 04:13:40', '2018-08-02 04:13:40'),
(2, 'o5MzTS0lx0J9pt+rKELnZA==', 'Basic', 'pXtNL/C18SWl1gX1uW/kzQ==', 'Active', '2018-08-02 04:14:13', '2018-08-02 04:14:13'),
(3, '+KCf0DJHsulp0u7/A3sirQ==', 'Basic', 'xAlYxqzTwEYseaBvX23yqxA30lXjdcsggcukKbQQhTg=', 'Active', '2018-08-02 04:14:28', '2018-08-02 04:14:28'),
(4, '3x1xwlOdU510K0qGPB54IA==', 'Basic', 'Wb/W1PdiE4ebAyDeCaKDttAUJ82go9SyQskDXkYXTLM=', 'Active', '2018-08-02 04:14:43', '2018-08-02 04:14:43'),
(5, '9prg8G8jM/LSL2QlIFSLBw==', 'Laboratory', '0LbOhlCbet/3FOJlwoggkw==', 'Active', '2018-08-02 04:15:06', '2018-08-02 04:16:07'),
(6, 'N1HF1+NSMw6fef8Mor0ubg==', 'Laboratory', 'kvk9VYAB2K14JPHWoYGOEg==', 'Active', '2018-08-02 04:15:20', '2018-08-02 04:16:10'),
(7, 'jGD7rk6IpAN9E1X8GSXH+g==', 'Laboratory', '4UwpxaElmVjcYzMQAyu8ykV1rdrCM3VSpYLJQ9I+H98=', 'Active', '2018-08-02 04:15:32', '2018-08-02 04:16:04'),
(8, '9CPH3NTrm+QH+XoanQF5uw==', 'Laboratory', '4UwpxaElmVjcYzMQAyu8ykV1rdrCM3VSpYLJQ9I+H98=', 'Active', '2018-08-02 04:15:43', '2018-08-02 04:16:00'),
(9, 'TZiuzU6Ewn5LOaoDAEvCRg==', 'Miscellaneous', 'bZvYBRE1RjEq7vokD5Pc/b+ecRQqAjTqGFxpD7WIw6k=', 'Active', '2018-08-02 04:16:31', '2018-08-02 04:17:57'),
(10, 'J7UNz1R9jCf23qUlt3Pi3g==', 'Miscellaneous', 'CafpCQx5thSvB3VGJ34UmhH0/qJKHMZHWcaILUcyH8w=', 'Active', '2018-08-02 04:16:43', '2018-08-02 04:18:01'),
(11, 'PoBPH/JYOc6AQXght9yqWA==', 'Miscellaneous', 'c1zPBdHcghI4cpYhWTBJQw==', 'Active', '2018-08-02 04:16:56', '2018-08-02 04:18:05'),
(12, '8yGyIvV+mYx5mlqkD1NYSw==', 'Other', '3uDL9tT7s+e7c74npQeImGSQnqqwmPDzyuuvXjQC+Z4=', 'Active', '2018-08-02 04:18:31', '2018-08-02 04:19:07'),
(13, '9dpOXH9FL0ZyPJuWsVOfBg==', 'Other', 'TO0pEpBkgjDacwSIyUCyTA==', 'Active', '2018-08-02 04:18:47', '2018-08-02 04:19:10'),
(14, 'R+8NtMaLv2NG0IcVypjKDw==', 'Other', 'ppSkgMlC6frmSWN4HIHvdw==', 'Active', '2018-08-02 04:18:59', '2018-08-02 04:19:15'),
(15, 'B1CbGbdifFooO7iM1gsBBg==', 'Other', 'If1RdxOUvrPxbqdbGeyiBPIogE8f2ARj+wkozTayYOo=', 'Active', '2018-08-02 04:20:21', '2018-08-02 04:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `r_grade_opening`
--

CREATE TABLE `r_grade_opening` (
  `Grade_Opening_ID` int(11) NOT NULL,
  `Grade_Opening_Open` enum('Yes','No') NOT NULL,
  `Grade_Opening_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Grade_Opening_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Grade_Opening_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_grade_opening`
--

INSERT INTO `r_grade_opening` (`Grade_Opening_ID`, `Grade_Opening_Open`, `Grade_Opening_Display_Status`, `Grade_Opening_Date_Added`, `Grade_Opening_Date_Updated`) VALUES
(1, 'Yes', 'Active', '2018-08-19 18:04:29', '2019-02-13 23:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `r_mandatory_fee`
--

CREATE TABLE `r_mandatory_fee` (
  `Mandatory_Fee_ID` int(11) NOT NULL,
  `Mandatory_Fee_AcademicYearID` int(11) NOT NULL,
  `Mandatory_Fee_FeeID` int(11) NOT NULL,
  `Mandatory_Fee_Amount` decimal(10,2) NOT NULL,
  `Mandatory_Fee_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Mandatory_Fee_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Mandatory_Fee_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_mandatory_fee`
--

INSERT INTO `r_mandatory_fee` (`Mandatory_Fee_ID`, `Mandatory_Fee_AcademicYearID`, `Mandatory_Fee_FeeID`, `Mandatory_Fee_Amount`, `Mandatory_Fee_Display_Status`, `Mandatory_Fee_Date_Added`, `Mandatory_Fee_Date_Updated`) VALUES
(1, 2, 4, '1100.00', 'Active', '2018-08-02 04:23:27', '2018-10-12 15:15:19'),
(2, 5, 4, '1100.00', 'Active', '2018-10-12 20:07:48', '2018-10-12 20:07:48'),
(3, 6, 4, '1100.00', 'Active', '2018-10-12 22:29:52', '2018-10-12 22:29:52'),
(4, 7, 4, '1100.00', 'Active', '2018-10-12 23:22:49', '2018-10-12 23:22:49'),
(5, 1, 4, '1100.00', 'Active', '2018-10-23 21:24:20', '2018-10-23 21:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `r_prerequisite`
--

CREATE TABLE `r_prerequisite` (
  `Prerequisite_ID` int(11) NOT NULL,
  `Prerequisite_Main_SubjectID` int(11) NOT NULL,
  `Prerequisite_Prequisite_SubjectID` int(11) NOT NULL,
  `Prerequisite_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Prerequisite_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Prerequisite_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_prerequisite`
--

INSERT INTO `r_prerequisite` (`Prerequisite_ID`, `Prerequisite_Main_SubjectID`, `Prerequisite_Prequisite_SubjectID`, `Prerequisite_Display_Status`, `Prerequisite_Date_Added`, `Prerequisite_Date_Updated`) VALUES
(1, 69, 78, 'Active', '2018-10-12 16:14:42', '2018-10-12 16:14:42'),
(2, 101, 67, 'Active', '2018-10-12 16:15:05', '2018-10-12 16:15:05'),
(3, 71, 70, 'Active', '2018-10-12 16:15:26', '2018-10-12 16:15:26'),
(4, 68, 66, 'Active', '2018-10-12 16:15:48', '2018-10-12 16:15:48'),
(5, 76, 75, 'Active', '2018-10-12 16:16:07', '2018-10-12 16:16:07'),
(6, 102, 67, 'Active', '2018-10-12 16:16:31', '2018-10-12 16:16:31'),
(7, 92, 100, 'Active', '2018-10-12 16:16:54', '2018-10-12 16:16:54'),
(8, 89, 68, 'Active', '2018-10-12 16:17:20', '2018-10-12 16:17:20'),
(9, 103, 68, 'Active', '2018-10-12 16:17:45', '2018-10-12 16:17:45'),
(10, 77, 76, 'Active', '2018-10-12 16:18:04', '2018-10-12 16:18:04'),
(11, 133, 78, 'Active', '2018-10-12 16:18:25', '2018-10-12 16:18:25'),
(12, 97, 92, 'Active', '2018-10-12 16:19:00', '2018-10-12 16:19:00'),
(13, 99, 78, 'Active', '2018-10-12 16:19:15', '2018-10-12 16:19:15'),
(14, 95, 68, 'Active', '2018-10-12 16:19:55', '2018-10-12 16:19:55'),
(15, 91, 67, 'Active', '2018-10-12 16:20:20', '2018-10-12 16:20:20'),
(16, 90, 89, 'Active', '2018-10-12 16:20:41', '2018-10-12 16:20:41'),
(17, 96, 105, 'Active', '2018-10-12 16:21:02', '2018-10-12 16:21:02'),
(18, 106, 105, 'Active', '2018-10-12 16:21:28', '2018-10-12 16:21:28'),
(19, 88, 77, 'Active', '2018-10-12 16:21:57', '2018-10-12 16:21:57'),
(20, 93, 105, 'Active', '2018-10-12 16:22:24', '2018-10-12 16:22:24'),
(21, 107, 106, 'Active', '2018-10-12 16:22:59', '2018-10-12 16:22:59'),
(22, 94, 104, 'Active', '2018-10-12 16:23:19', '2018-10-12 16:23:19'),
(23, 109, 107, 'Active', '2018-10-12 16:23:38', '2018-10-12 16:23:38'),
(24, 108, 107, 'Active', '2018-10-12 16:24:05', '2018-10-12 16:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `r_professor`
--

CREATE TABLE `r_professor` (
  `Professor_ID` int(11) NOT NULL,
  `Professor_Code` varchar(100) NOT NULL,
  `Professor_FirstName` varchar(100) NOT NULL,
  `Professor_MiddleName` varchar(100) NOT NULL,
  `Professor_LastName` varchar(100) NOT NULL,
  `Professor_EmailAddress` varchar(100) NOT NULL,
  `Professor_ContactNumber` varchar(11) NOT NULL,
  `Professor_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Professor_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Professor_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_professor`
--

INSERT INTO `r_professor` (`Professor_ID`, `Professor_Code`, `Professor_FirstName`, `Professor_MiddleName`, `Professor_LastName`, `Professor_EmailAddress`, `Professor_ContactNumber`, `Professor_Display_Status`, `Professor_Date_Added`, `Professor_Date_Updated`) VALUES
(8, '2018-00001', 'olYyybuAZHiS4jCCacsUBA==', '0dhMKWstS4s5FYkBC229bA==', 'QdxIznjBUgbBn9QRU+VNIQ==', '', '', 'Active', '2018-09-04 14:33:14', '2018-09-04 14:33:14'),
(9, '2018-00002', 'YRC8WFcoWjTYQ8ynLCZhWw==', '0dhMKWstS4s5FYkBC229bA==', 'QdxIznjBUgbBn9QRU+VNIQ==', '', '', 'Active', '2018-09-04 14:33:30', '2018-09-04 15:49:01'),
(10, '2018-00003', 'J4jgpR7vdpDsx1uS165JEA==', 'P94fxJOe/d1qfqcMtmdoKw==', 'ZSlTlOa/54DT9OJi4P1VKQ==', '', '', 'Active', '2018-09-04 14:34:47', '2018-09-04 14:34:47'),
(11, '2018-00004', 'nUMUy0qv7qn69o15cyiHWw==', 'wsCoVpCqpD7EPIGSDzaOBg==', 'FbKbciGFt+Xm0H7X+OnAiQ==', '', '', 'Active', '2018-09-04 14:35:42', '2018-09-04 14:35:42'),
(12, '2018-00005', 'yfNoUUL+O+DsHadVGQej4Q==', 'HmuLvEkMrk9Ceitmnd9nOQ==', 'cupuhIl2U9hgq3wVIcTNOQ==', '', '', 'Active', '2018-09-04 14:39:14', '2018-09-04 14:39:14'),
(13, '2018-00006', 'CL7qsZtcoz2lsI2R+sojMA==', 'ddv187lL70qIr63TzXyplA==', 'T7WYETlR1Nse+A1BR9pCYg==', '', '', 'Active', '2018-09-04 14:41:35', '2018-09-04 14:41:35'),
(14, '2018-00007', 'RZidhSb5M+V1ZqVjrbfB1w==', 'qqaScO+OUW0e11CUpP5YHg==', 'jkDLSHwFqlb7G3rLLZXIgA==', '', '', 'Active', '2018-09-04 14:43:48', '2018-09-04 14:43:48'),
(15, '2018-00008', '2KcyGvZI6FBelrMhltzZNg==', '2j1sdImV4xSOPy+KFPdc9A==', 'jkDLSHwFqlb7G3rLLZXIgA==', '', '', 'Active', '2018-09-04 14:44:58', '2018-09-04 14:44:58'),
(16, '2018-00009', 'byPkUYDPpNHQb93paBdFLA==', '2j1sdImV4xSOPy+KFPdc9A==', 'CH9a4rZhtbU/aMhmSMb6Aw==', '', '', 'Active', '2018-09-04 14:46:08', '2018-09-04 14:46:08'),
(17, '2018-00010', 't6niRAaYf1yhyfc8z4yvaw==', 'irWy92C3JmBqJGdNMhO0dg==', 'jiSXlwqztP6v1af2xmDpug==', '', '', 'Active', '2018-09-04 14:47:35', '2018-09-04 14:47:35'),
(18, '2018-00011', 'cGxiorg2kPLo4ZewCiuR3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'M6m6/96PdBJX2kQBrwa4ZQ==', '', '', 'Active', '2018-10-10 01:31:36', '2018-10-10 01:31:36'),
(19, '2018-00012', 'CmQUM544qewgkJKcqJHGlQ==', 'uyRCromTlt0mM0JPmZSLCw==', 'cphFltqblKd220002K/UKA==', 'null', 'null', 'Active', '2018-10-19 00:42:58', '2018-10-19 00:42:58'),
(20, '2018-00013', 'KN2gYaTNbGSzsb4AuyOF9Q==', 'uyRCromTlt0mM0JPmZSLCw==', 'Bdm07lh+NKGgTM5lS968Zw==', 'null', 'null', 'Active', '2018-10-19 00:46:53', '2018-10-19 00:46:53'),
(21, '2018-00014', '29e2NfjG5CwlQsFLxfk76w==', 'uyRCromTlt0mM0JPmZSLCw==', 'NtYHhfaA5ZqWvFzDZ4XpCg==', 'null', 'null', 'Active', '2018-10-19 00:48:13', '2018-10-19 00:48:13'),
(22, '2018-00015', '2501HeecPSn7XOYFhU7ydQ==', 'uyRCromTlt0mM0JPmZSLCw==', 'Jgr31CjZevP7SJNMPmn2xw==', 'null', 'null', 'Active', '2018-10-19 00:49:13', '2018-10-19 00:49:13'),
(23, '2018-00016', 'qb7wZ6LiFWWcdK89BK5bGQ==', 'uyRCromTlt0mM0JPmZSLCw==', 'SfNSvw6DAD6eLx0f5Pq1lQ==', 'null', 'null', 'Active', '2018-10-19 00:52:08', '2018-10-19 00:52:08'),
(24, '2018-00017', 'cdpELDsp/a1VQgO2q37rwA==', 'uyRCromTlt0mM0JPmZSLCw==', 'vdQU9wHCTyoKdwa5tWhMAg==', 'null', 'null', 'Active', '2018-10-19 01:21:21', '2018-10-19 01:21:21'),
(25, '2018-00018', 'SNJdmFDk5x/2bI3S5y6Zsg==', 'uyRCromTlt0mM0JPmZSLCw==', '1EeRPvIDVhZsXLRyy5DGbA==', 'null', 'null', 'Active', '2018-10-19 01:23:18', '2018-10-19 01:23:18'),
(26, '2018-00019', 'UqRzFe0RuXP8cxkQf552bg==', 'uyRCromTlt0mM0JPmZSLCw==', 'WqsuIJvAwKKS+7PU9KjVWQ==', 'null', 'null', 'Active', '2018-10-19 01:24:40', '2018-10-19 01:24:40'),
(27, '2018-00020', 'lMYRqprDjE5XBxEkiLaQ2w==', 'uyRCromTlt0mM0JPmZSLCw==', 'Ib6QpBpyMycdv+OWBtjoOw==', 'ericvaldezxc@gmail.com', '', 'Active', '2018-10-19 01:27:02', '2018-10-19 01:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `r_registation_opening`
--

CREATE TABLE `r_registation_opening` (
  `Registation_Opening_ID` int(11) NOT NULL,
  `Registation_Opening_CourseID` int(11) DEFAULT NULL,
  `Registation_Opening_YearLevel` enum('First Year','Second Year','Third Year','Fourth Year','Fifth Year') NOT NULL,
  `Registation_Opening_Status` enum('Yes','No') NOT NULL,
  `Registation_Opening_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Registation_Opening_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Registation_Opening_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_registation_opening`
--

INSERT INTO `r_registation_opening` (`Registation_Opening_ID`, `Registation_Opening_CourseID`, `Registation_Opening_YearLevel`, `Registation_Opening_Status`, `Registation_Opening_Display_Status`, `Registation_Opening_Date_Added`, `Registation_Opening_Date_Updated`) VALUES
(1, 17, 'First Year', 'Yes', 'Active', '2018-08-21 16:58:43', '2018-09-01 17:14:23'),
(2, 17, 'Second Year', 'Yes', 'Active', '2018-08-21 16:58:43', '2018-10-13 05:49:31'),
(3, 17, 'Third Year', 'Yes', 'Active', '2018-08-21 16:58:43', '2018-10-23 21:03:16'),
(4, 17, 'Fourth Year', 'Yes', 'Active', '2018-08-21 16:58:43', '2018-10-23 21:03:16'),
(5, 17, 'Fifth Year', 'No', 'Active', '2018-08-21 16:58:44', '2018-10-13 04:30:35'),
(6, 18, 'First Year', 'Yes', 'Active', '2018-10-12 19:44:12', '2018-10-12 19:44:12'),
(7, 18, 'Second Year', 'Yes', 'Active', '2018-10-12 19:44:12', '2019-02-13 22:56:36'),
(8, 18, 'Third Year', 'Yes', 'Active', '2018-10-12 19:44:12', '2019-02-13 22:56:36'),
(9, 18, 'Fourth Year', 'Yes', 'Active', '2018-10-12 19:44:12', '2019-02-13 22:56:36'),
(10, 18, 'Fifth Year', 'No', 'Active', '2018-10-12 19:44:12', '2018-10-13 04:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `r_registrar`
--

CREATE TABLE `r_registrar` (
  `Registrar_ID` int(11) NOT NULL,
  `Registrar_First_Name` varchar(200) NOT NULL,
  `Registrar_Middle_Name` varchar(200) NOT NULL,
  `Registrar_Last_Name` varchar(200) NOT NULL,
  `Registrar_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Registrar_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Registrar_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_registrar`
--

INSERT INTO `r_registrar` (`Registrar_ID`, `Registrar_First_Name`, `Registrar_Middle_Name`, `Registrar_Last_Name`, `Registrar_Display_Status`, `Registrar_Date_Added`, `Registrar_Date_Updated`) VALUES
(1, 'YEtxmhwpaUX5E9xNcmL0YA==', 'Plm+4blDu99iSdAlQ6HDOw==', 'CK1ST42XWtXYwKep6B039Q==', 'Active', '2018-07-29 09:29:33', '2018-07-29 09:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `r_room`
--

CREATE TABLE `r_room` (
  `Room_ID` int(11) NOT NULL,
  `Room_Code` varchar(100) NOT NULL,
  `Room_CampusID` int(11) NOT NULL,
  `Room_Description` varchar(100) NOT NULL,
  `Room_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Room_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Room_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_room`
--

INSERT INTO `r_room` (`Room_ID`, `Room_Code`, `Room_CampusID`, `Room_Description`, `Room_Display_Status`, `Room_Date_Added`, `Room_Date_Updated`) VALUES
(1, 'edcmYZ6p60DmloUEjfaG/A==', 2, 'hMdMPkmW/+oEJdW8w4fqDw==', 'Active', '2018-08-05 15:53:11', '2018-08-20 23:53:17'),
(2, 'aTvCPjV+EyFfmG97T7yAFA==', 2, 'aTvCPjV+EyFfmG97T7yAFA==', 'Active', '2018-08-05 15:55:43', '2018-08-20 23:53:19'),
(3, 'Ei9Ovwm+4IyyTY1aaqjyQg==', 1, '97TYgdsyCNAS0+qbvDcjdY//9SQWST9XqSxkd9a1ll4=', 'Active', '2018-09-04 13:57:17', '2018-09-04 13:57:17'),
(4, '9J+FwdlyEeJJ5Bk9vow3Mg==', 2, 'Xn1wSwNwMa4D2ecV6Ow1BGBqHlWNzx/HLOLpzXkQS2o=', 'Active', '2018-09-04 14:06:50', '2018-09-04 14:06:50'),
(5, 'iftd0BJAAOpyfSEqQIJRqQ==', 2, 'Xn1wSwNwMa4D2ecV6Ow1BJaPBTOuT9P9fpj+TMuIkaE=', 'Active', '2018-09-04 14:07:59', '2018-09-04 14:07:59'),
(6, 'vj7NfQ0fvKAYEVilBQ8iRw==', 2, 'Xn1wSwNwMa4D2ecV6Ow1BMDTO+nuGGWPqKu4Q/XkQzs=', 'Active', '2018-09-04 14:08:26', '2018-09-04 14:08:26'),
(7, 'SYhEv8eGWbPA2mN7O7ZxKA==', 2, 'Xn1wSwNwMa4D2ecV6Ow1BF3ElxLV+CAcDRh9XYONq2o=', 'Active', '2018-09-04 14:08:55', '2018-09-04 14:08:55'),
(8, 'vX9aqD6fAsDrGPJNTDQxuw==', 2, 'Xn1wSwNwMa4D2ecV6Ow1BMGEJW2CSzbSLo9azFjqOdU=', 'Active', '2018-09-04 14:09:18', '2018-09-04 14:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `r_scholarship`
--

CREATE TABLE `r_scholarship` (
  `Scholarship_ID` int(11) NOT NULL,
  `Scholarship_Code` varchar(100) NOT NULL,
  `Scholarship_Description` varchar(100) NOT NULL,
  `Scholarship_Percentage` decimal(11,2) NOT NULL,
  `Scholarship_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Scholarship_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Scholarship_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_scholarship`
--

INSERT INTO `r_scholarship` (`Scholarship_ID`, `Scholarship_Code`, `Scholarship_Description`, `Scholarship_Percentage`, `Scholarship_Display_Status`, `Scholarship_Date_Added`, `Scholarship_Date_Updated`) VALUES
(1, 'SYDP', 'Scholarship and Youth Development Program', '100.00', 'Active', '2018-09-17 18:49:42', '2018-09-17 19:02:37'),
(2, 'PG', 'Philippines Government', '100.00', 'Active', '2018-09-19 15:30:28', '2018-09-19 15:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `r_school_guard`
--

CREATE TABLE `r_school_guard` (
  `School_Guard_ID` int(11) NOT NULL,
  `School_Guard_Number` varchar(100) NOT NULL,
  `School_Guard_First_Name` varchar(100) NOT NULL,
  `School_Guard_Middl_Name` varchar(100) NOT NULL,
  `School_Guard_Last_Name` varchar(100) NOT NULL,
  `School_Guard_Access` enum('Yes','No') NOT NULL,
  `School_Guard_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `School_Guard_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `School_Guard_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_school_guard`
--

INSERT INTO `r_school_guard` (`School_Guard_ID`, `School_Guard_Number`, `School_Guard_First_Name`, `School_Guard_Middl_Name`, `School_Guard_Last_Name`, `School_Guard_Access`, `School_Guard_Display_Status`, `School_Guard_Date_Added`, `School_Guard_Date_Updated`) VALUES
(5, '2018-00001-GU', 't6niRAaYf1yhyfc8z4yvaw==', 'uyRCromTlt0mM0JPmZSLCw==', 'c+L3OkCntwYGRON+vJijYQ==', 'Yes', 'Active', '2018-09-10 21:19:59', '2018-09-10 21:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `r_section`
--

CREATE TABLE `r_section` (
  `Section_ID` int(11) NOT NULL,
  `Section_Code` varchar(100) NOT NULL,
  `Section_Section` varchar(100) NOT NULL,
  `Section_Year` enum('First Year','Second Year','Third Year','Fourth Year','Fifth Year') NOT NULL,
  `Section_CampusID` int(11) NOT NULL,
  `Section_CourseID` int(11) NOT NULL,
  `Section_Display_Status` enum('Active','Inactive') NOT NULL,
  `Section_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Section_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_section`
--

INSERT INTO `r_section` (`Section_ID`, `Section_Code`, `Section_Section`, `Section_Year`, `Section_CampusID`, `Section_CourseID`, `Section_Display_Status`, `Section_Date_Added`, `Section_Date_Updated`) VALUES
(6, 'BSIT-CM 1-1', '1', 'First Year', 2, 17, 'Active', '2018-08-20 22:38:59', '2018-08-20 22:38:59'),
(7, 'BSIT-CM 2-1', '1', 'Second Year', 2, 17, 'Active', '2018-08-20 22:39:12', '2018-08-20 22:39:12'),
(8, 'BSIT-CM 1-2', '2', 'First Year', 2, 17, 'Active', '2018-08-23 02:33:03', '2018-08-23 02:33:03'),
(9, 'BBTE-CM 1-1', '1', 'First Year', 2, 18, 'Active', '2018-09-01 14:47:50', '2018-09-01 14:47:50'),
(10, 'BSIT-CM 3-1', '1', 'Third Year', 2, 17, 'Active', '2018-09-09 20:55:01', '2018-09-09 20:55:01'),
(11, 'BSIT-CM 4-1', '1', 'Fourth Year', 2, 17, 'Active', '2018-09-09 21:23:24', '2018-09-09 21:23:24'),
(12, 'BBTE-CM 2-1', '1', 'Second Year', 2, 18, 'Active', '2018-10-12 20:13:46', '2018-10-12 20:13:46'),
(13, 'BBTE-CM 3-1', '1', 'Third Year', 2, 18, 'Active', '2018-10-12 20:14:11', '2018-10-12 20:14:11'),
(14, 'BBTE-CM 4-1', '1', 'Fourth Year', 2, 18, 'Active', '2018-10-12 20:14:27', '2018-10-12 20:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `r_semester`
--

CREATE TABLE `r_semester` (
  `Semester_ID` int(11) NOT NULL,
  `Semester_Code` varchar(100) NOT NULL,
  `Semester_Description` varchar(100) NOT NULL,
  `Semester_Sequence` enum('1','2','3','4') NOT NULL,
  `Semester_Active_Flag` enum('Active','Inactive','To be Used') NOT NULL DEFAULT 'Inactive',
  `Semester_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Semester_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Semester_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_semester`
--

INSERT INTO `r_semester` (`Semester_ID`, `Semester_Code`, `Semester_Description`, `Semester_Sequence`, `Semester_Active_Flag`, `Semester_Display_Status`, `Semester_Date_Added`, `Semester_Date_Updated`) VALUES
(8, 'JAf1Hlc/Gtb6XCm1y7MiAA==', 'P7I0qX/sDmywrwb6zWrZbg==', '1', 'Inactive', 'Active', '2018-07-30 20:11:28', '2018-07-30 20:11:28'),
(9, '3w7k0lW7Bk1hW5/L8WHQkA==', '9+EqntrFg0c/CreWSDoTWw==', '2', 'Active', 'Active', '2018-07-30 20:12:16', '2018-07-30 20:12:16'),
(10, 'rYpY2pWQC5nB+Z1mTYXlrg==', 'fmdICxI2e5LZ2HRD0TVLhQ==', '3', 'Inactive', 'Active', '2018-07-30 20:12:16', '2018-07-30 20:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `r_student_application`
--

CREATE TABLE `r_student_application` (
  `Student_Application_ID` int(11) NOT NULL,
  `Student_Application_StudentProfileID` int(11) NOT NULL,
  `Student_Application_Application_Number` varchar(100) NOT NULL,
  `Student_Application_Display_Status` enum('Active','Inactive') NOT NULL,
  `Student_Application_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Student_Application_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_student_application`
--

INSERT INTO `r_student_application` (`Student_Application_ID`, `Student_Application_StudentProfileID`, `Student_Application_Application_Number`, `Student_Application_Display_Status`, `Student_Application_Date_Added`, `Student_Application_Date_Updated`) VALUES
(34, 35, '2018-00001', 'Active', '2018-10-23 14:47:10', '2018-10-23 14:47:10'),
(35, 36, '2018-00002', 'Active', '2018-10-23 14:50:00', '2018-10-23 14:50:00'),
(36, 37, '2018-00003', 'Active', '2018-10-23 14:52:42', '2018-10-23 14:52:42'),
(37, 38, '2018-00004', 'Active', '2018-10-23 14:57:16', '2018-10-23 14:57:16'),
(38, 39, '2018-00005', 'Active', '2018-10-23 20:09:03', '2018-10-23 20:09:03'),
(39, 40, '2018-00006', 'Active', '2018-10-23 20:11:00', '2018-10-23 20:11:00'),
(40, 41, '2018-00007', 'Active', '2018-10-23 21:42:44', '2018-10-23 21:42:44'),
(41, 42, '2018-00008', 'Active', '2018-10-23 21:43:45', '2018-10-23 21:43:45'),
(42, 43, '2018-00009', 'Active', '2018-10-23 21:44:55', '2018-10-23 21:44:55'),
(43, 44, '2018-00010', 'Active', '2018-10-23 21:46:29', '2018-10-23 21:46:29'),
(44, 45, '2018-00011', 'Active', '2018-10-23 21:47:23', '2018-10-23 21:47:23'),
(45, 46, '2018-00012', 'Active', '2018-10-23 21:54:19', '2018-10-23 21:54:19'),
(46, 47, '2018-00013', 'Active', '2018-10-23 23:54:08', '2018-10-23 23:54:08'),
(47, 48, '2018-00014', 'Active', '2018-10-23 23:55:22', '2018-10-23 23:55:22'),
(48, 49, '2018-00015', 'Active', '2018-10-23 23:56:58', '2018-10-23 23:56:58'),
(49, 50, '2018-00016', 'Active', '2018-10-23 23:58:03', '2018-10-23 23:58:03'),
(50, 51, '2018-00017', 'Active', '2018-10-23 23:59:49', '2018-10-23 23:59:49'),
(51, 52, '2018-00018', 'Active', '2018-10-24 00:01:13', '2018-10-24 00:01:13'),
(52, 53, '2018-00019', 'Active', '2018-10-24 03:04:50', '2018-10-24 03:04:50'),
(53, 54, '2018-00020', 'Active', '2018-10-24 03:05:55', '2018-10-24 03:05:55'),
(54, 55, '2018-00021', 'Active', '2018-10-24 03:07:22', '2018-10-24 03:07:22'),
(55, 56, '2018-00022', 'Active', '2018-10-24 03:09:45', '2018-10-24 03:09:45'),
(56, 57, '2018-00023', 'Active', '2018-10-24 03:11:07', '2018-10-24 03:11:07'),
(57, 58, '2018-00024', 'Active', '2018-10-24 03:12:08', '2018-10-24 03:12:08'),
(58, 59, '2019-00001', 'Active', '2019-02-04 23:07:15', '2019-02-04 23:07:15'),
(59, 60, '2019-00002', 'Active', '2019-02-04 23:08:39', '2019-02-04 23:08:39'),
(60, 61, '2019-00003', 'Active', '2019-02-04 23:09:52', '2019-02-04 23:09:52'),
(61, 62, '2019-00004', 'Active', '2019-02-04 23:18:23', '2019-02-04 23:18:23'),
(62, 63, '2019-00005', 'Active', '2019-02-04 23:19:35', '2019-02-04 23:19:35'),
(63, 64, '2019-00006', 'Active', '2019-02-04 23:20:38', '2019-02-04 23:20:38'),
(64, 65, '2019-00007', 'Active', '2019-02-13 21:38:11', '2019-02-13 21:38:11'),
(65, 66, '2019-00008', 'Active', '2019-02-13 21:39:52', '2019-02-13 21:39:52'),
(66, 67, '2019-00009', 'Active', '2019-02-13 21:45:35', '2019-02-13 21:45:35'),
(67, 68, '2019-00010', 'Active', '2019-02-13 22:15:55', '2019-02-13 22:15:55'),
(68, 69, '2019-00011', 'Active', '2019-02-13 22:16:53', '2019-02-13 22:16:53'),
(69, 70, '2019-00012', 'Active', '2019-02-13 22:17:52', '2019-02-13 22:17:52'),
(70, 71, '2019-00013', 'Active', '2019-03-26 14:11:19', '2019-03-26 14:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `r_student_document`
--

CREATE TABLE `r_student_document` (
  `Student_Document_ID` int(11) NOT NULL,
  `Student_Document_StudentApplicationID` int(11) NOT NULL,
  `Student_Document_DocumentID` int(11) NOT NULL,
  `Student_Document_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Student_Document_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Student_Document_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_student_document`
--

INSERT INTO `r_student_document` (`Student_Document_ID`, `Student_Document_StudentApplicationID`, `Student_Document_DocumentID`, `Student_Document_Display_Status`, `Student_Document_Date_Added`, `Student_Document_Date_Updated`) VALUES
(34, 34, 3, 'Active', '2018-10-23 20:03:42', '2018-10-23 20:03:42'),
(35, 36, 3, 'Active', '2018-10-23 20:03:53', '2018-10-23 20:03:53'),
(36, 35, 3, 'Active', '2018-10-23 20:03:59', '2018-10-23 20:03:59'),
(37, 37, 3, 'Active', '2018-10-23 20:04:06', '2018-10-23 20:04:06'),
(38, 38, 3, 'Active', '2018-10-23 20:11:10', '2018-10-23 20:11:10'),
(39, 39, 3, 'Active', '2018-10-23 20:11:15', '2018-10-23 20:11:15'),
(40, 40, 3, 'Active', '2018-10-23 21:54:38', '2018-10-23 21:54:38'),
(41, 41, 3, 'Active', '2018-10-23 21:54:44', '2018-10-23 21:54:44'),
(42, 42, 3, 'Active', '2018-10-23 21:54:50', '2018-10-23 21:54:50'),
(43, 43, 3, 'Active', '2018-10-23 21:54:57', '2018-10-23 21:54:57'),
(44, 44, 3, 'Active', '2018-10-23 21:55:03', '2018-10-23 21:55:03'),
(45, 45, 3, 'Active', '2018-10-23 21:55:11', '2018-10-23 21:55:11'),
(46, 46, 3, 'Active', '2018-10-24 00:01:31', '2018-10-24 00:01:31'),
(47, 47, 3, 'Active', '2018-10-24 00:01:37', '2018-10-24 00:01:37'),
(48, 48, 3, 'Active', '2018-10-24 00:01:43', '2018-10-24 00:01:43'),
(49, 49, 3, 'Active', '2018-10-24 00:01:49', '2018-10-24 00:01:49'),
(50, 50, 3, 'Active', '2018-10-24 00:01:56', '2018-10-24 00:01:56'),
(51, 51, 3, 'Active', '2018-10-24 00:02:04', '2018-10-24 00:02:04'),
(52, 52, 3, 'Active', '2018-10-24 03:12:32', '2018-10-24 03:12:32'),
(53, 53, 3, 'Active', '2018-10-24 03:12:38', '2018-10-24 03:12:38'),
(54, 54, 3, 'Active', '2018-10-24 03:12:44', '2018-10-24 03:12:44'),
(55, 55, 3, 'Active', '2018-10-24 03:12:49', '2018-10-24 03:12:49'),
(56, 56, 3, 'Active', '2018-10-24 03:12:55', '2018-10-24 03:12:55'),
(57, 57, 3, 'Active', '2018-10-24 03:13:02', '2018-10-24 03:13:02'),
(58, 58, 3, 'Active', '2019-02-04 23:10:11', '2019-02-04 23:10:11'),
(59, 59, 3, 'Active', '2019-02-04 23:10:16', '2019-02-04 23:10:16'),
(60, 60, 3, 'Active', '2019-02-04 23:10:24', '2019-02-04 23:10:24'),
(61, 61, 3, 'Active', '2019-02-04 23:20:45', '2019-02-04 23:20:45'),
(62, 62, 3, 'Active', '2019-02-04 23:20:50', '2019-02-04 23:20:50'),
(63, 63, 3, 'Active', '2019-02-04 23:20:55', '2019-02-04 23:20:55'),
(64, 64, 3, 'Active', '2019-02-13 22:01:13', '2019-02-13 22:01:13'),
(65, 65, 3, 'Active', '2019-02-13 22:01:20', '2019-02-13 22:01:20'),
(66, 66, 3, 'Active', '2019-02-13 22:01:28', '2019-02-13 22:01:28'),
(67, 69, 3, 'Active', '2019-02-13 22:45:57', '2019-02-13 22:45:57'),
(68, 68, 3, 'Active', '2019-02-13 22:46:05', '2019-02-13 22:46:05'),
(69, 67, 3, 'Active', '2019-02-13 22:47:37', '2019-02-13 22:47:37');

-- --------------------------------------------------------

--
-- Table structure for table `r_student_profile`
--

CREATE TABLE `r_student_profile` (
  `Student_Profile_ID` int(11) NOT NULL,
  `Student_Profile_First_Name` varchar(100) NOT NULL,
  `Student_Profile_Middle_Name` varchar(100) NOT NULL,
  `Student_Profile_Last_Name` varchar(100) NOT NULL,
  `Student_Profile_Guardian_Contact_Number` varchar(100) DEFAULT NULL,
  `Student_Profile_Guardian_Name` varchar(100) DEFAULT NULL,
  `Student_Profile_Date_Of_Birth` date NOT NULL,
  `Student_Profile_Place_Of_Birth` varchar(100) NOT NULL,
  `Student_Profile_Gender` enum('Male','Female') NOT NULL,
  `Student_Profile_Civil_Status` varchar(100) NOT NULL,
  `Student_Profile_Address` varchar(500) NOT NULL,
  `Student_Profile_Contact_Number` varchar(100) NOT NULL,
  `Student_Profile_Email_Address` varchar(100) NOT NULL,
  `Student_Profile_Display_Status` enum('Active','Inactve') NOT NULL DEFAULT 'Active',
  `Student_Profile_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Student_Profile_Date_Updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_student_profile`
--

INSERT INTO `r_student_profile` (`Student_Profile_ID`, `Student_Profile_First_Name`, `Student_Profile_Middle_Name`, `Student_Profile_Last_Name`, `Student_Profile_Guardian_Contact_Number`, `Student_Profile_Guardian_Name`, `Student_Profile_Date_Of_Birth`, `Student_Profile_Place_Of_Birth`, `Student_Profile_Gender`, `Student_Profile_Civil_Status`, `Student_Profile_Address`, `Student_Profile_Contact_Number`, `Student_Profile_Email_Address`, `Student_Profile_Display_Status`, `Student_Profile_Date_Added`, `Student_Profile_Date_Updated`) VALUES
(35, 'XyctuYNgOwUgfYTrlYaiBw==', 'JS8sIjJwLxt1F+Yi8P/H0g==', '8Mb5BVG/XlV5OhrEHO/ONA==', '', '', '2001-01-01', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', 'jW9FGvp8FF6GGcF2E4BelSa1T77Jjj9Pu+Mxv8zORtWtk3QYrw8wC9srhiNBPI+S', 'vXedykv2zpzF02dQrPFOpA==', 'bUNTqsGVvgOLGKG2eQxf175ZG85GbnJLkM04hzm7jWg=', 'Active', '2018-10-23 14:47:10', '2019-03-26 14:17:16'),
(36, 'MIFKdueHuPXyQOLL/XQKPA==', 'iG7AFQ2YcEUoDd8zgKexRg==', 'sBELLXzjRyE5JJRP/NyEBA==', '', '', '2001-01-01', 'TVMDMS+RbuXMApExWaeiaA==', 'Male', 'Single', 'qJy3gZobeCXCfxsrm8liUzZLnPyU8QB/IUrwuexvrys3Z306q/OpBpode5kFMeWC', 'e9atIM6Tv+8khB0u/Dc+rw==', 'VaWzvqTo+92g05X/ztUaIGhSQAjuHP8u1TcaD9Csisg=', 'Active', '2018-10-23 14:50:00', '2019-03-26 14:15:22'),
(37, 'si5QFuam6UK8fUMcpgXiCA==', 'dfU3e+rRKQM48/AH6xWAcA==', '0EnJY56SOCdDugDs6lsJ9w==', '', '', '2001-01-01', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', 'oL8NfAhBuXmGccHLHnmbyL+totOy3zskGBDBALzteMfy8NlKripJRSRwxzO1pfOsKNKoozxp6hTwZDYjaz3heJ08SFvDiF6IJsCLv2Q/J3k=', 'h4jz6wuJx2Juow4XjxGYAQ==', 'ZO1OZDWHnbvce5JROtJOheVf8MWkROdwbSlR7Y6UxdI=', 'Active', '2018-10-23 14:52:42', '2019-03-26 14:15:22'),
(38, 'jP+ALZ2xB9tV7IFRtwHT2Q==', '3foWWDkwYMRVxJwlqsDGNA==', 'KMIxqLKioyjBVYaCWkTE+w==', '', '', '2001-01-01', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '4K4johYzz1M4++njEn00/g==', 'qAq92RNR4KfRBMT3LfvkrQ==', 'Tjmdqv1abSSD4huiRA+LH83WD+lPGKM7VGbeIPMTT4c=', 'Active', '2018-10-23 14:57:16', '2019-03-26 14:15:22'),
(39, 'wySRrXg7fM01u1ZYg/dwWg==', 'qrK90Rz14y7adpp5jHgUvg==', 'Y+eCGYlaarTgmvrneRsbqg==', '', '', '2000-01-03', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', 'OL2EtiykJjeDE0INl44CFqByP2kYzZaWxwsbsVH2bdU=', 'HcYXRB5mSKPE0+rm+Li23g==', 'ha2KWWmiLiDFTv1kuWo9roGZrySuEnk/mvnu8sSjKsM=', 'Active', '2018-10-23 20:09:03', '2019-03-26 14:15:22'),
(40, 'I3qy6smOrlScuG2Nyajn6g==', 'Q8tW2FFRSSvVIeczPzksWA==', 'exKDPtMoQo2UAaKFfhU3Ig==', '', '', '1999-12-31', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', 'jW9FGvp8FF6GGcF2E4BelSa1T77Jjj9Pu+Mxv8zORtUheqXzBsib2ES2FsAr/uGK', 'yAFNIBIHBjN99JTZs3QYCA==', 'njm6HxLcwRtBB83N0eWazn4LCMNEQ1+wP/s37ezZJp8=', 'Active', '2018-10-23 20:11:00', '2019-03-26 14:15:22'),
(41, 'V4LZw/YlLtLKP994U4OmaQ==', 'SLhVxDslHLD/VCeKcT3RuQ==', 'qqy/rmJxHHNKuZVxwGRLbw==', '', '', '2000-04-21', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'tVpwfqzS1RNqArE4luPjGg==', 'o8EGAa45VO15tCsXP8YIXOOzjy8SqkASbOs9ipkL7ko=', 'Active', '2018-10-23 21:42:44', '2019-03-26 14:15:22'),
(42, 'T5iz/B3cCV7gv3DDU4TAuA==', 'hluc0eof2WnfnGbYlW2tYQ==', 'yslKsxl60SCScHb2lBq5Kg==', '', '', '1999-06-14', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', 'jW9FGvp8FF6GGcF2E4BelQIDuQO23f7E5fxO27nyNpk=', 'rssWd0fmXoSV0ADL5VGL1g==', '1DXn1AWGu30tRVa3saBIQ2Sn/GZ3VfRYZZVbBtlNE/0=', 'Active', '2018-10-23 21:43:45', '2019-03-26 14:15:23'),
(43, 'EYaRXy2A8FKfREzVx/z/Bw==', 'Gf02BrLOUdvV3fYXt+AzCQ==', '5TSDzJAorbBq2gWZRmYr+w==', '', '', '1998-03-12', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', 'pHD3wLvIV/NTq+Vxw7TIbFoJdKDsng+miJPq+foNKFA=', 'TJoqIf2OUsFA75y6GaguAQ==', 'wi1je1fdn0TWGmTY/aH7SoPZOlCE61c/MNMWUoVR38w=', 'Active', '2018-10-23 21:44:55', '2019-03-26 14:15:23'),
(44, 'J8QOHvDrC7JRCV1VcJz5Pw==', 'SGoRGKV5rEQzDKniutsCdA==', 'XVblgGG13OPeU4BBtxTyKg==', '', '', '2000-01-15', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'Y7GAlVPAQ2xFA7WO+W6G4Q==', 'o9lBDapucwfAFzYRQIZuiUX7txEFnK48YTq3mJdvpG4=', 'Active', '2018-10-23 21:46:28', '2019-03-26 14:15:23'),
(45, 'caYXb5bH2gY8vB2BEGf7yQ==', 'OxPJb0J1lvi+2v8FEPFz8g==', 'hluc0eof2WnfnGbYlW2tYQ==', '', '', '1999-04-14', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'R4sdRCS50x3evtSppX95kg==', 'kFGClJK6TXbHm8jZFeAi6NmqqyOlNIDgJdKz8cjjEW0=', 'Active', '2018-10-23 21:47:23', '2019-03-26 14:15:23'),
(46, '+O3/wpI4TweXwRwGUhE/wg==', 'uqFReIQjRdt4EXLSIQipMQ==', 'dVb6a8P+OYMWRC7tNemGiw==', '', '', '1998-07-17', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'nuTswMIglvUbfpoHe0ZCIw==', 'Qpf7p3r5d9HquVDRWkQfz8eon0Cg+lOUdZJ2JJHJDoM=', 'Active', '2018-10-23 21:54:19', '2019-03-26 14:15:23'),
(47, '350Wm9nOZXrfZsJaaqTHNA==', 'OxPJb0J1lvi+2v8FEPFz8g==', 'Ghn86hKWYQth/3NWWGmSGQ==', '', '', '2000-07-12', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'zu/DjTWf0X/wjKFGAOLPFw==', 'jWnc+c1+1kvVOci0tOWmimUWQ2pQA9vtNffnEbm1/AQ=', 'Active', '2018-10-23 23:54:08', '2019-03-26 14:15:23'),
(48, 'A7qBlNl4BCYAXEZZ6OZr6g==', 'ive5rk3Z/JY3RDl8c2Ei/Q==', 'rX14IaCsaJQ8sE7+QmbDAg==', '', '', '1999-04-06', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'dTJgAdr4M4DCxvFI5w47nA==', 'Nhojb46Pe7SBiP/4+sX7Id8Equ5m5ArdL2Sz/R85vDs=', 'Active', '2018-10-23 23:55:22', '2019-03-26 14:15:23'),
(49, 'oKoZkhgt82SnFW6bhJt4tA==', 'bPFn/PYmFSIA2AiTjSCafw==', 'JRKAmHFeZKK9wGFa+669Yg==', '', '', '1998-09-06', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'gE3lvXD1z7mjUQYo+nqHbw==', 'VRQjSC2KOnm10Rz1ZXh62l+RcSFKj4EB3qv92Xa+W0c=', 'Active', '2018-10-23 23:56:57', '2019-03-26 14:15:23'),
(50, 'f6a98+RkyZcZQLLDNfbT3w==', '5TSDzJAorbBq2gWZRmYr+w==', 'WgNAE6HPrwfC87Jhe1g/yA==', '', '', '2000-10-04', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', '7lMX+3/1p3G3C5uF4GoYtQ==', 'RQXcqWzp5xi9U4kpBGFvFBuPUWw8fPlJjhNCGLOxYS8=', 'Active', '2018-10-23 23:58:03', '2019-03-26 14:15:23'),
(51, 'TdCnf3EehCcQno2gdw3LfA==', 'GRuUa/YpP/cg4S7aCadGTw==', 'T7WYETlR1Nse+A1BR9pCYg==', '', '', '1999-12-18', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'mv5ckuV9bzw0tvdamsdyhg==', 'lrTfAjnxrUMtvm4fxhkRd91ry7gqd8wI3IlKDKVxxpo=', 'Active', '2018-10-23 23:59:49', '2019-03-26 14:15:23'),
(52, 't6niRAaYf1yhyfc8z4yvaw==', 'DJOe4UgXidX7dZ/YFxvF2g==', 'gq4Fgnt6Z83pR28+U/sPYg==', '', '', '1998-07-13', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'h1E2j/Mh0lsdb+ZxOIAhJg==', 'gGkUcLCe5u39CYyCo7sO5vyMYiAudJ2prX0ShUrHpkw=', 'Active', '2018-10-24 00:01:13', '2019-03-26 14:15:23'),
(53, 'gGDFRJ/rvpWNdbPQ2eHxpw==', 'SlWSEPVqVzeQVKtNd1jEvw==', 'S313bEzHP/myvnyM3DalRw==', '', '', '1998-07-06', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'p8o9Egc1UPg4NPvm6Ms7yQ==', 'i88mYwVo8h2f4K9A9najWb3trt33wSPDzmincOQ+4Pc=', 'Active', '2018-10-24 03:04:50', '2019-03-26 14:15:23'),
(54, 'WvetF2y4tZMsvVcHKFcC3g==', 'Bw2sSHuQf+XcEhTsen30Pg==', '93r6tkJU2nCjKlHls5qS9w==', '', '', '1999-02-09', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'iZvfHzt/jy5qxuwwrsy3vQ==', '3q81kGTQlrZnUvLUP8Yr8LQcEPkvxFzkseYFcXD6V8s=', 'Active', '2018-10-24 03:05:55', '2019-03-26 14:15:24'),
(55, 'rX5/bTzCVhuFnWivqaDKaQ==', 'im1lc/3Oo6RZVZUVVAABow==', 'TG3D7KdLVqlFOZNApwIyZw==', '', '', '2000-08-08', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'JA38DMPFxXyZU/7henTKbw==', 'Ce+kOiEMnIf8Ax0e+2TCzW97CWPHAzrPrff+AyWP3Dg=', 'Active', '2018-10-24 03:07:22', '2019-03-26 14:15:24'),
(56, 'sa8GUwT6mYWHcFSVRCEFZw==', 'bHZctz/ee7QWyT0lMDMo5A==', 'nV7ULOUxpXFG6bPLbAI4Ig==', '', '', '1999-02-09', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', '1dQ8AyoLymkhWbJdUYah7Q==', 'yGVzAzP2E0fE84RR6odBuYgbGxomSL/IOtBLX3JQN3s=', 'Active', '2018-10-24 03:09:45', '2019-03-26 14:15:24'),
(57, '5PtmSHJbb8WbVvobgWc01Q==', '/bLZT4xtN+mmuxk9FzZK9A==', 'QM1F+fmrd1uLhcVLxRyLBg==', '', '', '2000-03-04', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'UrJrEbqds0PhA80dfOzPuw==', 'KMfXBOBuxAenfcDq8k/ZwdZ4zMmuALXwT11024x6iGw=', 'Active', '2018-10-24 03:11:07', '2019-03-26 14:15:24'),
(58, 'MPD/Dand6LKnrDfzhUfkUw==', 'ZtORNQGTqqkBoj/bb/EpBQ==', '0XGaHzQ6mLE9I3e1VEQ3yg==', '', '', '1999-02-03', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'k6vhHEovJ8EfCMP6fhrkrA==', 'yVyiu8GMAglFmQIOYLNyt6ItGNQ9z9EAY9NfXyBAXAo=', 'Active', '2018-10-24 03:12:08', '2019-03-26 14:15:24'),
(59, 'aU+TDf5uQXuDZt6yNFXGbQ==', 'zcF7sN4Tzs8CuDuM6sDSwQ==', 'gUTUGOe1o7JAFO3H8cqCLQ==', '', '', '2002-02-03', 'YEqCLGdPyKAlv0KrirXkWA==', 'Female', 'Single', 'ffQYFGigDfB1L+kXpNFtKw==', '1asFsjIvZ9mJMNTc2OAosQ==', 'btwcYhK/EDAK7p5xtjl3o3vlwv/rv+oMEyMF/G4Pcsc=', 'Active', '2019-02-04 23:07:15', '2019-03-26 14:15:24'),
(60, 'XyctuYNgOwUgfYTrlYaiBw==', '7Lo56vclb5jMPHP7lvyj8g==', 'wdqjOA44vyqo10jzeAONQA==', '', '', '2001-06-04', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'CILlyBDB90NJFlzDUV1oeQ==', 'KIsFoNSdJEkVwA4GVbVzSy4ttwhiVsOTYibG8BkAWKI=', 'Active', '2019-02-04 23:08:39', '2019-03-26 14:15:24'),
(61, 'Or+UJjpRof5MFbBYwY+7fw==', 'hvCOc30RXijzO0JxLagwHg==', '0KVbftPQgdGbvtpaN8VsKA==', '', '', '2001-09-25', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', 'OL2EtiykJjeDE0INl44CFqByP2kYzZaWxwsbsVH2bdU=', '8KWzTHnvBJeSOPXr4X5uNQ==', 'PRUphrbZncwuTpg+juoTGoCVqHK6N5IzNSjSU/PX9dY=', 'Active', '2019-02-04 23:09:52', '2019-03-26 14:15:24'),
(62, '13KzoEmfac+AlFk3piRFSg==', 'aWdxkRRBxW5QxDudW1s6bA==', 'J6paDNY4ldkyOd3w4ZHb9Q==', '', '', '2001-05-16', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'O1DODpi1u9gc/VgjYWgmEA==', 'xR3rDjrxC7xk92Ra1UYWNonzJa5hJdc7hb9s+YYSugM=', 'Active', '2019-02-04 23:18:23', '2019-03-26 14:15:24'),
(63, '2eGUKEjyyp8x9uAGzbn+Bg==', 'GtN1sCRbyAHpW3npqCtXeQ==', 'MTqNRKP1pHRq7203FXT6FA==', '', '', '2000-10-20', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'CHo/dJlTkCvs4cFMskyrsw==', 'mDYgiJdqSuf1V9PmcvWI8777m4/TpZTqRrhrhye2hjU=', 'Active', '2019-02-04 23:19:35', '2019-03-26 14:15:24'),
(64, 'RNZp5xhAJH6/pscHztsgKQ==', 'i0a5RNRfeUQqV3p7MBGdTQ==', '73NEQlnkpaT4ocDuEwXTbg==', '', '', '2002-07-18', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'pf7YYlBx17uThcvwPQ36EA==', 'zgFREfrc4+g1FaboQsq+qXhZFmNNjA/OFDWy3Csu6AQ=', 'Active', '2019-02-04 23:20:37', '2019-03-26 14:15:24'),
(65, 'eppH95LdPN9ZqiMzsARFpQ==', 'W0IexCV3k142mPkmhmZO4A==', 'Jde4IdsiUYa+MG5Zp+7XWQ==', '', '', '2000-06-03', 'YEqCLGdPyKAlv0KrirXkWA==', 'Male', 'Single', 'ffQYFGigDfB1L+kXpNFtKw==', 'rlSYO4HY5HHmoTvcR8AUjQ==', 'pG9qWe53VJxbAZU+9TbKSs3WbmLWO1ACMU7b/TPejD0=', 'Active', '2019-02-13 21:38:11', '2019-03-26 14:15:25'),
(66, 'P31hr2jPzqm9Qch7TAhC1Q==', 'exKDPtMoQo2UAaKFfhU3Ig==', '73NEQlnkpaT4ocDuEwXTbg==', '', '', '2000-06-24', 'YEqCLGdPyKAlv0KrirXkWA==', 'Female', 'Single', 'ffQYFGigDfB1L+kXpNFtKw==', 'PfYTIGukHsdwQuCrdB7ETg==', 'ByoEZsFq8J8NCeY5sqCF2pkz1nYN3eGCAm4g45f3L3Q=', 'Active', '2019-02-13 21:39:51', '2019-03-26 14:15:25'),
(67, 'omOs5tKRA009zdbcWn3R1Q==', 'JS8sIjJwLxt1F+Yi8P/H0g==', 'iG7AFQ2YcEUoDd8zgKexRg==', '', '', '2000-09-23', 'YEqCLGdPyKAlv0KrirXkWA==', 'Female', 'Single', 'ffQYFGigDfB1L+kXpNFtKw==', 'iQgrOptERFawHILCHqP9HQ==', 'AMMb0D51WDu4a9wC7QXTjeT2gHHX9vhMfFhW2c+pJBo=', 'Active', '2019-02-13 21:45:35', '2019-03-26 14:15:25'),
(68, 'kUD9f9i2Av4Ww/LxSR977Q==', 'SGoRGKV5rEQzDKniutsCdA==', '4w/w9z0lEiXyIeVW7TkF0Q==', '', '', '2000-09-11', 'YEqCLGdPyKAlv0KrirXkWA==', 'Female', 'Single', 'ffQYFGigDfB1L+kXpNFtKw==', 'qCCjOzCOpLpdetVcD4v/3A==', '2r19tObYDfKQm+P142wWVKUQdENb4uoTPD+iCQrsvqI=', 'Active', '2019-02-13 22:15:54', '2019-03-26 14:15:25'),
(69, '0kecGQyZ8vPrh3p/sChaVw==', 'eGuI/nxxEeK83AsLIkYpYQ==', 'MQ78pWQyKAB+ZVhUBTuI9g==', '', '', '2000-02-14', 'YEqCLGdPyKAlv0KrirXkWA==', 'Male', 'Single', 'ffQYFGigDfB1L+kXpNFtKw==', 'SGonanu6L0dFinn+RwnNpA==', 'ZMEnFerV2v46gHO1Izt/b1GazkyxC/2kVgsdDgWsnlI=', 'Active', '2019-02-13 22:16:53', '2019-03-26 14:15:25'),
(70, 'jJDzTh0Ug/n+d0trvh/XqQ==', 'NMY13Dd7VmnmQ5a9Dn1DRA==', 'qqy/rmJxHHNKuZVxwGRLbw==', '', '', '2001-05-19', 'YEqCLGdPyKAlv0KrirXkWA==', 'Male', 'Single', 'ffQYFGigDfB1L+kXpNFtKw==', '3miCR0dnnLwDcdz3w+Ar9w==', '+MEJ1dIXCjwUA/5boGst3+aYMSb9aPX3vdufUoP03TU=', 'Active', '2019-02-13 22:17:52', '2019-03-26 14:17:16'),
(71, 'LXempSSaiMyNMrxzjtUnKg==', 'uyRCromTlt0mM0JPmZSLCw==', 'XN6wwa//lWcTfX4gFE4yFw==', '', '', '1999-12-08', 'Dyil7ixLUdpHXZWqUJB0AQ==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2019-03-26 14:11:19', '2019-03-26 14:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `r_subject`
--

CREATE TABLE `r_subject` (
  `Subject_ID` int(11) NOT NULL,
  `Subject_Code` varchar(100) NOT NULL,
  `Subject_Description` varchar(100) NOT NULL,
  `Subject_Lecture_Units` int(11) NOT NULL DEFAULT '0',
  `Subject_Laboratory_Units` int(11) NOT NULL DEFAULT '0',
  `Subject_Lecture_Hours` int(11) NOT NULL DEFAULT '0',
  `Subject_Laboratory_Hours` int(11) NOT NULL DEFAULT '0',
  `Subject_Tuition_Hours` int(11) NOT NULL DEFAULT '0',
  `Subject_Type` enum('Academic','Non-Academic') NOT NULL,
  `Subject_Group` int(11) DEFAULT NULL,
  `Subject_Credited_Units` int(11) NOT NULL DEFAULT '0',
  `Subject_Display_Stat` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Subject_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Subject_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_subject`
--

INSERT INTO `r_subject` (`Subject_ID`, `Subject_Code`, `Subject_Description`, `Subject_Lecture_Units`, `Subject_Laboratory_Units`, `Subject_Lecture_Hours`, `Subject_Laboratory_Hours`, `Subject_Tuition_Hours`, `Subject_Type`, `Subject_Group`, `Subject_Credited_Units`, `Subject_Display_Stat`, `Subject_Date_Added`, `Subject_Date_Updated`) VALUES
(65, 'xH7ePEaWNbprZ/O6ANQRhw==', '8Jkxas+nuHOHtw+kBjh0ioRfO6tsRdLZc/0nzkzWt5I=', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-07-30 19:11:50', '2018-09-13 00:13:02'),
(66, 'CeIl1Elz9hPJWNJOZ1xLtA==', 'KhB8qIyylgXxqOlL1n5QINZ438BPqqHO6Wr5ykZG6/vb5jlFH9WvDmOINZ+31Vghcb6AmD7S3X85Ji8l5lLV0Q==', 2, 1, 2, 3, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:12:15', '2018-08-02 06:03:11'),
(67, 'QUTN3cNHxr+i8vpKAl7g6w==', 'N9zSAZx9L+fS8U40tuoMiZpjVZIIRcbBi0j24QaeSRMsvWiRgec/qvjcUA3DJN6z', 2, 1, 2, 3, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:12:57', '2018-08-02 06:03:18'),
(68, '0QHU1UkMdZM9mX2pRNxHuQ==', 'itzqSddl8THd/ZNOAXbAEw==', 2, 1, 2, 3, 3, 'Academic', NULL, 3, 'Active', '2018-07-30 19:14:31', '2018-09-03 21:12:44'),
(69, '22VkeEJJDPg4341vpxADJA==', '2C+tjiDifDw8KBiID2x38kCjhGOsI0nEAgZpj++EruxBcblKHax1QGYdsaOQ7KSz', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-07-30 19:15:04', '2018-09-06 17:52:50'),
(70, '6bPMKx4UE9Ydatalk582Zw==', 's1x/ZZx9PU9KKa1R1on5b8cdh2xXAXfV77CO9cBUK2MsRkN/CLS0vtZ3+CHoWjM2', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-07-30 19:15:34', '2018-09-02 15:03:27'),
(71, 'Dff9+GMBIe+FqCbvNP9qaA==', 'o/fOHE4UsHykF+GPrvk4Hsh/voMs2k3QogME0ncFxuE/YQGndKT5ljTI5txe1mtI', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-07-30 19:15:53', '2018-10-12 16:15:26'),
(72, 'Sj1LAzaGAofW1MwTgPTo3Q==', 'hkKBoN2MbbsJWOFWpqsjSXsL6EongZeCFe1cdBN9Uo0R6Q9I34/iNaa8VApebT2g', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:16:08', '2018-07-30 19:16:08'),
(73, 'vsDRVTBKRUw5m+hIAQLk+g==', 'ApjXPc6XZRXuJizT/YmgxQV6NOlExVrjqo19tP+dIvYPI1PXijZ9uEfQ3L2FLimU', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:16:25', '2018-07-30 19:16:25'),
(74, '6NQGA7ZJOeYRvD9/s2Ztrg==', '949544fRUWyxIQIa+PxLel3MpEqz7w2CLz73M7VRoqE=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:16:42', '2018-07-30 19:16:42'),
(75, 'KvbJ6WzKrFEB1+DLHng+GQ==', 'Ene5pJ6t7Bo9Lc1/IGrfHJ3avG2cz8n132FlLgCdLnlCddil/xIMVwVNpm98qP0+', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:16:59', '2018-07-30 19:16:59'),
(76, 'zEuJ4MmbtWtmjZ640rocvg==', 'NskNzI6T706Wv7hkAfwcxEeM2BBQf/xqMmQ0P4QCTnw=', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-07-30 19:17:14', '2018-10-12 16:16:07'),
(77, 't+YP/GXIaxGDzsKM2QPXxg==', '7aR0BJRU799yr1GBkuRAXei1/lyOh4pui17PwFXAvto=', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-07-30 19:17:38', '2018-10-12 16:18:04'),
(78, 'XJf0kdFO3vw55L0APpPIKg==', 'aG0z4wspUvg8hlfXYoMYsg==', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:18:03', '2018-07-30 19:18:03'),
(79, 'zN3nft48KV88eMysv80Vmw==', 'oSPbPQMTMGLdDSmkyhDrbQd5sPgo6J4AuLim2Do+4mLWQ7XIB5y6cl2Zrt80F9R0', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:18:29', '2018-07-30 19:18:29'),
(80, 'SbIUtEsH115Ql6HPMxi39A==', '+LHuJDgP+iT5LW3q6dUDWQ==', 3, 0, 3, 0, 3, 'Non-Academic', 0, 3, 'Active', '2018-07-30 19:46:11', '2018-07-30 19:46:11'),
(81, 'JzBLnP0WA5icTSbuXtSaUw==', 'ORDOBPDvvC6HM/kHhw4tIA==', 3, 0, 3, 0, 3, 'Non-Academic', 0, 3, 'Active', '2018-07-30 19:46:24', '2018-07-30 19:46:24'),
(82, 'MI6XosgO5h106L7LPx08yA==', 'Zus95WrUIt3kpPIKkDvsh+k8/ViPW574tEjY90dNrxgmcmNBwK/ZoMO+V+NvQ7xg', 3, 0, 3, 0, 3, 'Non-Academic', 80, 3, 'Active', '2018-07-30 19:47:03', '2018-07-30 19:47:03'),
(83, '2+c5lyP1MXPUk/mNdyJhVw==', 'p3Epn713d5L3HdKSxJQp/DePVoPRIxMjhVbSRQ6dhPKkTch5TdvrnBRwkurijCzr', 3, 0, 3, 0, 3, 'Non-Academic', 80, 3, 'Active', '2018-07-30 19:47:27', '2018-07-30 19:47:27'),
(84, 'hq98mJdu/MoelVZfQR3LNw==', 'p3Epn713d5L3HdKSxJQp/DePVoPRIxMjhVbSRQ6dhPLLnP/XTE5W5ZzFY8736O8H', 2, 0, 3, 0, 3, 'Non-Academic', 81, 3, 'Active', '2018-08-21 21:37:26', '2018-08-21 21:37:26'),
(85, '0AyW1OoSyHoTO9M5yWR/nw==', 'Zus95WrUIt3kpPIKkDvsh06TdII2EHuPt3fHNYxiBQbKvwKInXX2jmINtoPKnQ/c', 3, 0, 3, 0, 3, 'Non-Academic', 81, 3, 'Active', '2018-08-21 21:38:09', '2018-08-21 21:38:09'),
(86, 'k0rDIFmDxKq2d1nSPUjqKA==', '8Jkxas+nuHOHtw+kBjh0ioRfO6tsRdLZc/0nzkzWt5I=', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-09-05 21:56:52', '2018-09-06 17:50:30'),
(87, '4LxDhvXMWqBMCFnVXJc8ZA==', 't5a7ymD9Jb37vRi8gnxDgMLcM8nX4DbkR3uUrw12bbQ=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:04:39', '2018-09-05 22:04:39'),
(88, 'dkv7AU/Squa0ll5UUC/YmA==', 'tiD1R05ZJVvozOWS4w66uUzHmqqRvHg1siTm3UPNLHbHtY8fXxu8O+MoIa02yKh8djhsQhWixHQu2raO4sZ0oQ==', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-09-05 22:05:53', '2018-10-12 16:21:57'),
(89, 'k+eAaXKm8mMn9mBIY2VZ9A==', '1KGAxrEn2lVaXPZP9KpQLs1KA1TQeoXJ5OQH2xLkpSM=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:07:11', '2018-10-12 16:17:20'),
(90, 'NvDCAmXFodYARJbCxelTmw==', 'Cn9DxpMcwvhT6MU7VSqtS/HlG8/5/CY7/OlnUxURhFw=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:08:09', '2018-10-12 16:20:41'),
(91, 'aloXwX5mQpauoCsKXDeKTg==', 'giqiBLiOb8a9e//0w76Q9YVJaWUiFJ40v5B54mPSsak=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:08:59', '2018-10-12 16:20:20'),
(92, 'PVeapUC0ZyXzQfTFEr4WyA==', 'r7kpUfcs61EpXvbRnK6zR8L+UO+uujOMayYWRgosv/vu1gXjLznIgExCbDjMgIqc', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:09:39', '2018-10-12 16:16:54'),
(93, 'RCdB3qBMhInXJ4sFAVLiQA==', 'fEPcyye28BV/0mS+S1drvcG1gtU8c1zVgjTkbmGvhgk=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:10:10', '2018-10-12 16:22:24'),
(94, '3Q4Ki0ejOUDdwoyDtlvBWQ==', '9s2yY8EnvgNiMSmLq6FPSw==', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:10:38', '2018-10-12 16:23:19'),
(95, 'RwcydLZk7u9xspocYa3Qyw==', 'E3gjvQhMQBQ0w/eStHopDyR+yM9GLs/F86kKsciq5KM=', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-09-05 22:11:17', '2018-10-12 16:19:55'),
(96, '/PT6EdwL1UAsp/2ekCoUCA==', 'v5xFudslZokofnvUdJlbKlfDPzQkV7AG+HRL6WfPyiE=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:12:16', '2018-10-12 16:21:02'),
(97, '2yO52oSGa0rcn7fh/ca2uA==', 'q9J40aq2KbN6ctTSKa48ZWm9mh3S706RQa5ZMMXzcnc=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:13:02', '2018-10-12 16:18:59'),
(98, 'WLJ4kXyddrvv8JMMhKV/Ag==', 'KhB8qIyylgXxqOlL1n5QII1bzDsdLZTtBhFtRigBfhw=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:13:40', '2018-09-05 22:13:40'),
(99, 'sp5+O5ZQ6Ajo8fr0ksw/Ag==', 'Hjqm4J+Ta/iPvjgdE8ZapRepVKN1wGTjOE52hXZTaGv0lbCDTOPo02hbnzHouWy3P3pgg0eN13aI0ENE+OGNqw==', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-09-05 22:14:48', '2018-10-12 16:19:15'),
(100, 'twHAAiCsj1ItyJvAhxpC4A==', 'lXbNCpegK5uABQ1ET8Ve9aAYhNiTTfQNHQVEgz3Adv7vcMMNUUvtJh5GCl7f6Dn5', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:16:56', '2018-09-05 22:16:56'),
(101, 'QtvGPzySpOfjdQGjuZ12aA==', 'xeJqbug0ZQPWF9NMbYOCejOCofs9boJav8GU/8pfhgo=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:17:51', '2018-10-12 16:15:05'),
(102, 'UlcOjYyIgkH/iNiH2ApVVQ==', 'dICI4MCHVWcJHmIduQeHbp/vrF3cgQPpQBZcMlG8cok=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:18:29', '2018-10-12 16:16:31'),
(103, 't1qgEPbGnESBXod3Cw7nUg==', 'AFOkC4LKrCYRrS5rGy3I3g==', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:19:45', '2018-10-12 16:17:45'),
(104, 'ISyKujFu9oUrH9Z6l75Pvg==', 'MXf+ZkvkJbwKCt0hvZz1Vw==', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:20:42', '2018-09-05 22:20:42'),
(105, 'xCPbvG8EQpBs/Jgk5ueX0A==', 'ASvN9+PtBb8gYIj3x95YX/C4OhRQoijPn8i2av4bKd0=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:21:22', '2018-09-05 22:21:22'),
(106, 'YyYjybhcuGvszhxpppeG5w==', 'ASvN9+PtBb8gYIj3x95YX4TZIyvG2pXleRp7jCBAQY8=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:21:58', '2018-10-12 16:21:27'),
(107, '6cDveRj9T1dzdQFSqZf8sQ==', 'QEN0YCXOyy3LJdCXK6/T5qVVp/f5pARvt7JMJt1nH2A=', 2, 1, 2, 3, 5, 'Academic', NULL, 3, 'Active', '2018-09-05 22:22:37', '2018-10-12 16:22:59'),
(108, '9ccTw/Q5U0IRkowAJCoj4A==', 'OHpgFEDIOAReUYC6MHJMjw==', 9, 9, 9, 0, 9, 'Academic', NULL, 9, 'Active', '2018-09-05 22:23:49', '2018-10-12 16:24:04'),
(109, 'AlT/6edA174zMCvUDpSjGA==', 'ZuUf7pttfZw/O9ENqhkpspYrtBzHm0wQyo/G6MWuMM4=', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-09-05 22:24:39', '2018-10-12 16:23:38'),
(110, '8pl62XzwR0xpKiClyY66Kw==', 'FYieKCts9fFJgPcfJTxixA==', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:25:20', '2018-09-05 22:25:20'),
(111, '7x4Fm9Vt7drgFSxHV1GWXA==', 'apuCvA8IO+YaqmLuMv8WuA==', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:26:03', '2018-09-05 22:26:03'),
(112, 'uGF7vvEatnOdM8MALkA6Ag==', '31L+YTEDhI1A63Hpvq/N6Q==', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:26:32', '2018-09-05 22:26:32'),
(113, 'NgTWsLW65WsTfrxtuIShsA==', 'xKS+VOrhjTetTZD2HRkaxg==', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:27:04', '2018-09-05 22:27:04'),
(114, 'oJafZzd7HmYPhx/j8v/TwA==', 'yXWPNxhM6LFIfOOxJtx66d29EHLDzLrBVHegWURGLZI=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:27:40', '2018-09-05 22:27:40'),
(115, 'uLpP/rR/Zjg/bsWTjnwmbA==', 'yXWPNxhM6LFIfOOxJtx66YWxz46r6H1MXyDwhetKoPk=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:28:14', '2018-09-05 22:28:14'),
(116, 'BUNgjTcgSIxbl8dhpFdPUA==', 'sr+UoxUTTXmIMH9i1kAhScyBGF1BazGOGT6lNdpUqi4=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:28:54', '2018-09-05 22:28:54'),
(117, 't1ifBeaxqGYE9x8JDB8NFw==', 'mblbrRH8+Tr0TeObO3RyL4wYUDl5MkULHLiZSSAEuGQsweHjD7sv4/bW2Bcdhqsf', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:29:37', '2018-09-05 22:29:37'),
(118, 'qV7c0HivhZyH3bhqnJDxbQ==', 'bkdKGfr8XVKouvlVYICq7ngXCHGfS1zPz+OOb9/WTSI=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:30:13', '2018-09-05 22:30:13'),
(119, 'YyAj4qxJvpQHRRSIvkQa8A==', 'LIAlt3WvBRSY9KKkFhWnxg==', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:31:07', '2018-09-05 22:31:07'),
(120, 'p+9FPtRe6Rb1e69SPBhIsg==', 'VK7cX/XspdWh2UftmTxjiTDDaChKShC0rRMJdZZQ8aw=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:31:43', '2018-09-05 22:31:43'),
(121, 'tURSPTRG4FRG/WqUaqpqCg==', '9kzejyWOzcPCx5zP+qbu+ZaClZYgDvdOk55eBQK8wZk=', 2, 1, 2, 1, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:32:39', '2018-09-05 22:32:39'),
(122, 'wV16yUTKgtuJnJWajWP6eg==', 'Z7CyWKG9f3rIuNd0PiekQf+WrYVAeaSxrmz7lCEyNhVXQr1CMbxVpaQIu0N5aBw/i7vpE6wrKau15lkkSNU2Gg==', 2, 0, 2, 0, 2, 'Non-Academic', 0, 2, 'Active', '2018-09-05 22:34:04', '2018-09-05 22:34:04'),
(123, 'xITxslqHCsnBVt/8ioFCYw==', 'SATiaEzg/L84tAek6K801bcV6YNF2odnICsp5DFTnWo=', 2, 0, 2, 0, 2, 'Non-Academic', 0, 2, 'Active', '2018-09-05 22:35:29', '2018-09-05 22:35:29'),
(124, 'e68lSBq8ycLjmDhOHwWcjw==', 'nBw/yJOpxTNDRAN96rYMXtNVpHhKrPSPYTt4OYMfarMU9rLl/RSzTmwCrl1veb0e', 2, 0, 2, 0, 2, 'Non-Academic', 0, 2, 'Active', '2018-09-05 22:35:59', '2018-09-05 22:35:59'),
(125, 'KPwtefwry+Y5Vw3hFWhpRQ==', 'CDXehVHewAHQRpgEKdjGTumwTFcawvVTVYo+PYrDiB8=', 2, 0, 2, 0, 2, 'Non-Academic', 0, 2, 'Active', '2018-09-05 22:37:07', '2018-09-05 22:37:07'),
(126, 'jnVxMy9rKlIPnspM77u7CA==', 'VR81jKuolh17UNtJEa98UQ==', 2, 0, 2, 0, 2, 'Non-Academic', 0, 2, 'Active', '2018-09-05 22:37:44', '2018-09-05 22:37:44'),
(127, 'whqL5vuMIVn6Nm5e5HTq9w==', 'betudoDQdTvtIO8FuIfxhg==', 2, 0, 2, 0, 2, 'Non-Academic', 0, 2, 'Active', '2018-09-05 22:38:39', '2018-09-05 22:38:39'),
(128, 'GP230Verffxi1JLfcggLMw==', 'X8+ZnTx0K/nNN+gPQzOY/g==', 2, 0, 2, 0, 2, 'Non-Academic', 0, 2, 'Active', '2018-09-05 22:39:04', '2018-09-05 22:39:04'),
(129, 'W1+YtFP/ox78AF/QFwXkfQ==', 'WLevfbTjMJFc+h3OoiVb4Q==', 2, 0, 2, 0, 2, 'Non-Academic', 0, 2, 'Active', '2018-09-05 22:39:30', '2018-09-05 22:39:30'),
(130, 'VVwvPWeyTb/zgOKpTVkXqg==', 'CRFvMJU3E3VgNXLYQhaARg==', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:40:06', '2018-09-05 22:40:06'),
(131, 'T5tzOR+8RV5IbrRl8eCK3g==', '9PFcs1pNMqLjtMHqzrzzKql9PU9wdR3B1RQcA03zsom6LP4xL+CbTIe4NnCV8+a+bz6KpdVJUlXAqeDG35R7Ag==', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:40:56', '2018-09-05 22:40:56'),
(132, '8KZ6R7W3OXsxmUNgdvFE2A==', 'JYpQXPiBlCKe4bcFIW6bH1xN3UXI7snWz+lclENaKSA=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:41:30', '2018-09-05 22:41:30'),
(133, 'QIrOmnCZ8grvfN/XJ0zKIw==', 'pkiVr68e0/f/MdhGyHtLcUiwr4LoxslfmNC7CzRvbZI=', 3, 0, 3, 0, 3, 'Academic', NULL, 3, 'Active', '2018-09-05 22:44:01', '2018-10-12 16:18:25'),
(134, '0qpavAYEIG/fJzL7aMXetg==', 'WM/edWF3MTcefuy7rNdc22O1gX8jQ/KBlBWOizqxZ3yOf6ZREpcvtxPyi9SUtgT6', 3, 0, 3, 0, 3, 'Non-Academic', 0, 3, 'Active', '2018-09-09 21:54:49', '2018-09-09 21:54:49'),
(135, 'PYr4b3Mu9uJ8mMxu5m94Pw==', 'n8/6swZm1GjJ5B2x/Sqm1ixB5mfIcma7F2M6wZLC2SQ=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:40:29', '2018-10-11 21:40:29'),
(136, '4ia2IFIK8TAmhIAhM8+3wQ==', '6mUHU/VwXPKl1Yf/kZyGurzmX1bWX/o696SVG56PdxQ=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:41:35', '2018-10-11 21:41:35'),
(137, 'XSu0PWSa972DbGY4txIDbA==', 'eumJaSZlAz1iYlx2UD0URz3iG2wxDt57B9nO+7/kprM=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:43:02', '2018-10-11 21:43:02'),
(138, '/OQUbgPoib06r6LUzrO4PA==', 'nj/N6EKucf2rAyhjoxMIaVbF4jiwDZkrq66SgkH73a/UqpRdL92lIINFt6ZehzwB', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:43:54', '2018-10-11 21:43:54'),
(139, '4CzTYylABm81AF/OZW8URQ==', 'A0HHJzfUleAYVvi7Y1gpTw==', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:45:34', '2018-10-11 21:45:34'),
(140, 'RhQZQNwqjnUPz8TJf1Ga9g==', '3Th0gYDPxarQ1/AeDJjS67PWwcPd/+65rHagS9dJwWw=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:46:07', '2018-10-11 21:46:07'),
(141, 'a+YBBk6bKa6SqImC29WzmA==', 'FpSCi26GlQPVUog93zA/H/WI/vXJ7DmqmtxZh+ydo7bYLuC4jn2xDJNqTApGvLmn', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:47:14', '2018-10-11 21:47:14'),
(142, 'zK77Y5IjL2c3TALr9ffrJQ==', 'DDbI45j60lpde798AKz8Tjo+Gyhar9QmSYWiMliMY6M=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:47:40', '2018-10-11 21:47:40'),
(143, 'NViPhQiZ9i0kq38ZU84mGQ==', 'IizxEezI/b5gzbhpAw01ojPMFUX9m2tJY36rd1FrSp1Wbh/5fvVNdDmvbxDebYRwLnkk8lefYUT5dRSxC5mK0Q==', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:48:28', '2018-10-11 21:48:28'),
(144, 'Q8I5sbA1Ef0+0msSTxw6dg==', 'eyXTwINI5AegpoPSAxWbShEO8ylHeCTtewaFPuBG1as=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:49:03', '2018-10-11 21:49:03'),
(145, 'fkmIQ1/sVThny5nEHUl9Rw==', 'KRBq4fGM9l2g+XOf8/Wt5SdqLeYZXRuETe3Sd+73d+br3bK935YR1vAAqWmQTsgP', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:49:25', '2018-10-11 21:49:25'),
(146, 'g/4aIyXYoZv/bcYIXZjHYA==', 'vCHXg2CRRRqZ9CFOrCDYWDUUzbALFvtbtidthKKzYpU8XAqsFWidtdLvhZW8IGpa', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:49:52', '2018-10-11 21:49:52'),
(147, 'XBZ/Jg5XXDr+ovwRvq/CPQ==', 'qT5DHx+bdEaE/KdS2fW7uBKOEg7PgaXVgKHCFtFPMj8=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:50:39', '2018-10-11 21:50:39'),
(148, 'Tja4Sr/8hqHRqdzjUdVR4A==', '4SNw6HByPWbhOj8s7QfPiXsJ+NlNwHVWrwcAN82SaqWiqW+kR9YlpTDl5KKB1ko4', 1, 0, 1, 0, 1, 'Academic', 0, 1, 'Active', '2018-10-11 21:51:19', '2018-10-11 21:51:19'),
(149, 'G15EXQIn5xJ2OY9hULwFfw==', 'LHQe7BB02SFmnI8AUxA31/luwaYl9f0IZgm/TZzEHLPHhIXQhvObfGbxHHwyCqhMoXH4jv7r3L/e1U43G1RBUg==', 1, 0, 1, 0, 1, 'Academic', NULL, 1, 'Active', '2018-10-11 21:51:34', '2018-10-11 22:12:49'),
(150, 'GTjymszFYqGV42yGc7l3Ew==', 'oVYjsAYa/ljVO8OF3C5zn3mID1/WW+aei3Uw8BuuzWU=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:52:06', '2018-10-11 21:52:06'),
(151, 'fnUFacip9aSnML7Q98ojLg==', 'Y7o2XW20W+8nz4rv+RCD3SFdlxsnq2QK91jcU0No9CI=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:52:29', '2018-10-11 21:52:29'),
(152, 'xXpaeGQxJVxJ5KFZR/Mj7w==', 'WUrRkFWbKe35dyjcXQM7AlJk6Sl6INuX7936f9+RWdeV3Uwmfglq3oz1gQnX7AD0', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:52:52', '2018-10-11 21:52:52'),
(153, 'eKCuPzbbg1OQwLWDucnrDA==', '1Ei2nmhVl+cE4pV0CS2W2i0kC4i6Jd/iSyMtbFuPV80=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-11 21:53:17', '2018-10-11 21:53:17'),
(154, 'Qbyoobavc4/A4ifpYENZqQ==', '5xF9fyi/E1ZXKZj6dK7ByQ==', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-10-12 14:55:36', '2018-10-12 14:55:36');

-- --------------------------------------------------------

--
-- Table structure for table `r_subject_fee`
--

CREATE TABLE `r_subject_fee` (
  `Subject_Fee_ID` int(11) NOT NULL,
  `Subject_Fee_AcademicYearID` int(11) NOT NULL,
  `Subject_Fee_SubjectID` int(11) NOT NULL,
  `Subject_Fee_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Subject_Fee_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Subject_Fee_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_subject_fee_items`
--

CREATE TABLE `r_subject_fee_items` (
  `Subject_Fee_Items_ID` int(11) NOT NULL,
  `Subject_Fee_Items_SubjectFeeID` int(11) NOT NULL,
  `Subject_Fee_Items_FeeID` int(11) NOT NULL,
  `Subject_Fee_Items_Amount` decimal(10,2) NOT NULL,
  `Subject_Fee_Items_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Subject_Fee_Items_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Subject_Fee_Items_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_tuition_fee`
--

CREATE TABLE `r_tuition_fee` (
  `Tuition_Fee_ID` int(11) NOT NULL,
  `Tuition_Fee_AcademicYearID` int(11) NOT NULL,
  `Tuition_Fee_CourseID` int(11) NOT NULL,
  `Tuition_Fee_Year_Level` enum('1','2','3','4','5') NOT NULL,
  `Tuition_Fee_Amount` decimal(10,2) NOT NULL,
  `Tuition_Fee_Display_Status` enum('Active','Inactive') NOT NULL,
  `Tuition_Fee_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Tuition_Fee_Date-Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_unit_fee`
--

CREATE TABLE `r_unit_fee` (
  `Unit_Fee_ID` int(11) NOT NULL,
  `Unit_Fee_Description` varchar(200) NOT NULL,
  `Unit_Fee_Amount` decimal(10,2) NOT NULL,
  `Unit_Fee_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Unit_Fee_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Unit_Fee_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_unit_fee`
--

INSERT INTO `r_unit_fee` (`Unit_Fee_ID`, `Unit_Fee_Description`, `Unit_Fee_Amount`, `Unit_Fee_Display_Status`, `Unit_Fee_Date_Added`, `Unit_Fee_Date_Updated`) VALUES
(2, 'pHay1L+45QHi7eKcZH2+Mg==', '300.00', 'Active', '2018-08-20 22:47:00', '2018-08-20 22:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `r_user_account`
--

CREATE TABLE `r_user_account` (
  `User_Account_ID` int(11) NOT NULL,
  `User_Account_Reference` int(11) NOT NULL,
  `User_Account_Type` enum('Registrar','Student','Faculty','Admin','Cashier','Guard') NOT NULL,
  `User_Account_Username` varchar(100) NOT NULL,
  `User_Account_Password` varchar(100) NOT NULL,
  `User_Account_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `User_Account_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `User_Account_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_user_account`
--

INSERT INTO `r_user_account` (`User_Account_ID`, `User_Account_Reference`, `User_Account_Type`, `User_Account_Username`, `User_Account_Password`, `User_Account_Display_Status`, `User_Account_Date_Added`, `User_Account_Date_Updated`) VALUES
(2, 2, 'Admin', 'y+mVyG5T+ATd37oOK30C5A==', 'y+mVyG5T+ATd37oOK30C5A==', 'Active', '2018-07-27 16:28:55', '2018-07-27 19:02:39'),
(3, 1, 'Registrar', 'dmncaAX9FRAIBHjb4acBeg==', 'dmncaAX9FRAIBHjb4acBeg==', 'Active', '2018-07-29 09:30:51', '2018-07-29 09:30:51'),
(4, 1, 'Cashier', 'mN4YjK/gxTX+IIx+gIBsFA==', 'mN4YjK/gxTX+IIx+gIBsFA==', 'Active', '2018-08-02 14:14:50', '2018-08-02 14:14:50'),
(20, 5, 'Faculty', 'gu1lL4wf7RCapJENXiuyPQ==', 'gu1lL4wf7RCapJENXiuyPQ==', 'Active', '2018-08-30 17:02:34', '2018-08-30 17:02:34'),
(23, 6, 'Faculty', 'eeNTOfE46teUCDiKhEWlUA==', 'eeNTOfE46teUCDiKhEWlUA==', 'Active', '2018-08-31 01:15:29', '2018-08-31 01:15:29'),
(25, 7, 'Faculty', 'k6IXfpOwTkFgxQ2YVWdzVQ==', 'k6IXfpOwTkFgxQ2YVWdzVQ==', 'Active', '2018-09-01 15:27:02', '2018-09-01 15:27:02'),
(29, 8, 'Faculty', 'gu1lL4wf7RCapJENXiuyPQ==', 'gu1lL4wf7RCapJENXiuyPQ==', 'Active', '2018-09-04 14:33:14', '2018-09-04 14:33:14'),
(30, 9, 'Faculty', 'eeNTOfE46teUCDiKhEWlUA==', 'eeNTOfE46teUCDiKhEWlUA==', 'Active', '2018-09-04 14:33:30', '2018-09-04 14:33:30'),
(31, 10, 'Faculty', 'k6IXfpOwTkFgxQ2YVWdzVQ==', 'k6IXfpOwTkFgxQ2YVWdzVQ==', 'Active', '2018-09-04 14:34:47', '2018-09-04 14:34:47'),
(32, 11, 'Faculty', '/E09iG7+BnJNKmwDWRLp8w==', '/E09iG7+BnJNKmwDWRLp8w==', 'Active', '2018-09-04 14:35:43', '2018-09-04 14:35:43'),
(33, 12, 'Faculty', '20KPeQciPfYF+UBhFE/dxg==', '20KPeQciPfYF+UBhFE/dxg==', 'Active', '2018-09-04 14:39:14', '2018-09-04 14:39:14'),
(34, 13, 'Faculty', 'HbxloNFMAjyJFr3VeN024A==', 'HbxloNFMAjyJFr3VeN024A==', 'Active', '2018-09-04 14:41:35', '2018-09-04 14:41:35'),
(35, 14, 'Faculty', '7BzvKv1SFkBIhcFVfuUx/w==', '7BzvKv1SFkBIhcFVfuUx/w==', 'Active', '2018-09-04 14:43:48', '2018-09-04 14:43:48'),
(36, 15, 'Faculty', 'rwXrq1axOfu/oPh2T/MVaw==', 'rwXrq1axOfu/oPh2T/MVaw==', 'Active', '2018-09-04 14:44:58', '2018-09-04 14:44:58'),
(37, 16, 'Faculty', 'w/nhYQuOZ+zb99FTFPonAQ==', 'w/nhYQuOZ+zb99FTFPonAQ==', 'Active', '2018-09-04 14:46:08', '2018-09-04 14:46:08'),
(38, 17, 'Faculty', 'mi+Ao6OYKoW/618/MMOVlw==', 'mi+Ao6OYKoW/618/MMOVlw==', 'Active', '2018-09-04 14:47:35', '2018-09-04 14:47:35'),
(43, 5, 'Guard', 'XkZnoUnA2ZCh+56rXhBCfw==', 'XkZnoUnA2ZCh+56rXhBCfw==', 'Active', '2018-09-10 21:19:59', '2018-09-10 21:19:59'),
(51, 18, 'Faculty', 'yd+DYr7LVPQqdL5pBF4LpQ==', 'yd+DYr7LVPQqdL5pBF4LpQ==', 'Active', '2018-10-10 01:31:36', '2018-10-10 01:31:36'),
(77, 19, 'Faculty', 'WOmE44dyTx++N6bEuWy9KA==', 'QibYEh4KZOMIxF17i1g4cQ==', 'Active', '2018-10-19 00:42:59', '2018-10-19 00:42:59'),
(78, 20, 'Faculty', 'Rsuo2KLrs++1tOy9mupTAQ==', 'XWe/c8X/rJVhtHXKO6cIvg==', 'Active', '2018-10-19 00:46:53', '2018-10-19 00:46:53'),
(79, 21, 'Faculty', 'Rb23V7p3NsmrWP8d2jOC6A==', 'cHIrN0AviJqyvbIyXMcttQ==', 'Active', '2018-10-19 00:48:13', '2018-10-19 00:48:13'),
(80, 22, 'Faculty', 'wR/70P9y7SNMf3JGAS2pMQ==', 'egdxIo7wcCwtL5UjKeW3rQ==', 'Active', '2018-10-19 00:49:13', '2018-10-19 00:49:13'),
(81, 23, 'Faculty', '/P2NxZ9hJzopifWchQdJfQ==', 'EmeaDi06iG548U1yy8ehGg==', 'Active', '2018-10-19 00:52:08', '2018-10-19 00:52:08'),
(82, 24, 'Faculty', 'GnIVoGroPIHtsEjPjobMUQ==', 'I2rPBu8ncJDSdKhckfQaEw==', 'Active', '2018-10-19 01:21:21', '2018-10-19 01:21:21'),
(83, 25, 'Faculty', 'zUX06OVdXg7xFZ2cywFnWQ==', 'icn28JiZs7shtzNMJOhoxg==', 'Active', '2018-10-19 01:23:18', '2018-10-19 01:23:18'),
(84, 26, 'Faculty', 'PvuBkwm0cJSpZAiwsuYqiw==', 'fzC7SvwqgyWq503B4Yf9lA==', 'Active', '2018-10-19 01:24:41', '2018-10-19 01:24:41'),
(85, 27, 'Faculty', 'Tnd4KWO9ZQwDWMscFYH23g==', 'pRulmKsnTjPpkh4/sX3DGw==', 'Active', '2018-10-19 01:27:21', '2018-10-19 01:27:21'),
(87, 34, 'Student', 'OdICL0b4JffaA+iN8N2KnQ==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 20:05:01', '2018-10-23 20:16:47'),
(88, 35, 'Student', 'vUhkbStK1Suay8gSvPR1xA==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 20:06:11', '2018-10-23 20:17:13'),
(89, 36, 'Student', 'X25gHwy8AqQsBIyqq2JPAA==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 20:07:01', '2018-10-23 20:17:21'),
(90, 37, 'Student', 'GXIl2xL3IN7MrFU908zj5w==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 20:13:00', '2018-10-23 20:17:29'),
(91, 38, 'Student', '0dU1vp1w0nguzDr36v8TaA==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 20:13:30', '2018-10-23 20:17:34'),
(92, 39, 'Student', 'C3Xc+Fzy3hRF8TaEOUMU9g==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 20:14:39', '2018-10-23 20:17:39'),
(93, 40, 'Student', 'V6UgACuQm57ERMO502DN0Q==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 21:55:49', '2018-10-23 22:04:47'),
(94, 41, 'Student', '7MT6gqkbVmaTOahbobNAIQ==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 21:57:07', '2018-10-23 22:04:53'),
(95, 42, 'Student', 'fYEycVG2/WAqB0IDjcPlDQ==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 21:57:44', '2018-10-23 22:05:11'),
(96, 43, 'Student', 'YmBajRLDeOLuQhQCcb8SXg==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 21:58:26', '2018-10-23 22:05:16'),
(97, 44, 'Student', 'E/4mAgfiOt02DbLQWEBOAg==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 21:59:15', '2018-10-23 22:05:22'),
(98, 45, 'Student', 'QvF9ZotlUBrTmbA0roC0KA==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-23 21:59:57', '2018-10-23 22:05:26'),
(99, 46, 'Student', '46eJtgDuzv5UPx7CGtYbeA==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 00:02:40', '2018-10-24 00:14:19'),
(100, 47, 'Student', 'KSx/Cpedxd1ekHG2l9xMFw==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 00:03:40', '2018-10-24 00:14:27'),
(101, 48, 'Student', 'RzbiqSHKbgbtJa4CiCDDyw==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 00:04:26', '2018-10-24 00:14:36'),
(102, 49, 'Student', '7B19YAGYlK7IyidKfuIHSA==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 00:05:15', '2018-10-24 00:14:42'),
(103, 50, 'Student', 'kc5Z6fpgIbqJXUn/jB8EHw==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 00:05:52', '2018-10-24 00:14:48'),
(104, 51, 'Student', 'i6vjIbxfe9xxyC7tBIcKkw==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 00:06:37', '2018-10-24 00:14:53'),
(105, 52, 'Student', 'we4L/8znOWXUe7+0ZFL6dQ==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 03:13:28', '2018-10-24 03:26:15'),
(106, 53, 'Student', 'nYcPzEGI5EJlx2Dkr8DDIg==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 03:14:07', '2018-10-24 03:26:21'),
(107, 54, 'Student', 'rnDA11IeQFM9Qfew+AB37A==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 03:14:45', '2018-10-24 03:26:27'),
(108, 55, 'Student', 'NAG/KsPtv9KzUIIva5nebQ==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 03:15:26', '2018-10-24 03:26:32'),
(109, 56, 'Student', 'yP10xnRjPgBz7Oiz7BYS/g==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 03:16:12', '2018-10-24 03:26:38'),
(110, 57, 'Student', 'mI2Xua97LcIdpWUC8momDg==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2018-10-24 03:16:46', '2018-10-24 03:26:46'),
(111, 58, 'Student', 'zcqbJoAz6zrs8TBZGMA1Yw==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-04 23:11:14', '2019-02-05 11:27:36'),
(112, 59, 'Student', 'ORp+HgfPLrhdjAuVB8+hfw==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-04 23:12:08', '2019-02-05 11:27:42'),
(113, 60, 'Student', '8YWUww6XkAJ6mbvYkNG8QA==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-04 23:13:47', '2019-02-05 11:27:45'),
(114, 61, 'Student', 'SOmBE9k00zxj5CcS31//Xw==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-04 23:27:45', '2019-02-05 11:27:49'),
(115, 62, 'Student', 'HjEQw6+MjXg4XGj+E+0PUg==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-04 23:32:05', '2019-02-05 11:35:37'),
(116, 63, 'Student', 'rbVAJFdqwG9opc1XaNCxSg==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-04 23:32:48', '2019-02-05 11:27:56'),
(117, 64, 'Student', 'ALJFUF535led6+B2i6K1cg==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-13 22:48:40', '2019-02-13 23:07:34'),
(118, 65, 'Student', '+NsO6HynC0uCkiS1EtncQA==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-13 22:50:11', '2019-02-13 23:07:40'),
(119, 66, 'Student', 'o+X3EpJ5OuOcBkogYcBiqw==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-13 22:51:07', '2019-02-13 23:07:45'),
(120, 67, 'Student', 'PPnFDi3QP3XtV1ha+7Ieww==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-13 22:52:11', '2019-02-13 23:07:53'),
(121, 68, 'Student', 'MC/k8mai/FUpBelCKM0xng==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-13 22:52:46', '2019-02-13 23:08:00'),
(122, 69, 'Student', 'ej4H2zGLhnDIaf7PtJcvDQ==', 'DuMqCin4bmT/RYZH/nn6xw==', 'Active', '2019-02-13 22:53:17', '2019-02-13 23:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `t_announcement`
--

CREATE TABLE `t_announcement` (
  `announcement_id` int(11) NOT NULL,
  `announcement_name` varchar(500) NOT NULL,
  `announcement_description` varchar(500) NOT NULL,
  `announcement_active_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `announcement_date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `announcement_date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_announcement`
--

INSERT INTO `t_announcement` (`announcement_id`, `announcement_name`, `announcement_description`, `announcement_active_status`, `announcement_date_added`, `announcement_date_updated`) VALUES
(1, 'PUP ranks fifth in Mech Eng\'g Licensure Exam', 'Vilmar Agustin Cabanero from PUP Sta. Mesa ranked fifth in the recently concluded February 2019 MechVilmar Agustin Cabanero from PUP Sta. Mesa ranked fifth in the recently concluded February 2019 Mechanical Engineering Licensure Examination. Cabanero posted a 90.55 percentage. ', 'Active', '2019-03-26 09:57:16', '2019-03-26 10:25:51'),
(2, 'sample', 'Lorem epsudimLorem epsudimLorem epsudimLorem epsudimLorem epsudimLorem epsudimLorem epsudimLorem epsudimLorem epsudimLorem epsudim', 'Active', '2019-03-26 14:17:50', '2019-03-26 14:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `t_assign_section_fee_item`
--

CREATE TABLE `t_assign_section_fee_item` (
  `Assign_Section_Fee_Item_ID` int(11) NOT NULL,
  `Assign_Section_Fee_Item_Section_ID` int(11) NOT NULL,
  `Assign_Section_Fee_Item_Fee_ID` int(11) NOT NULL,
  `Assign_Section_Fee_Item_Display_Status` enum('Active','Inactive') NOT NULL,
  `Assign_Section_Fee_Item_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Assign_Section_Fee_Item_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_breakdown_fee`
--

CREATE TABLE `t_breakdown_fee` (
  `Breakdown_Fee_ID` int(11) NOT NULL,
  `Breakdown_Fee_Student_Account_ID` int(11) NOT NULL,
  `Breakdown_Fee_Semester_ID` int(11) NOT NULL,
  `Breakdown_Fee_AcademicYearID` int(11) NOT NULL,
  `Breakdown_Fee_Description` varchar(100) NOT NULL,
  `Breakdown_Fee_Amount` decimal(10,2) NOT NULL,
  `Breakdown_Fee_Type` varchar(100) NOT NULL,
  `Breakdown_Fee_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Breakdown_Fee_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Breakdown_Fee_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_breakdown_fee`
--

INSERT INTO `t_breakdown_fee` (`Breakdown_Fee_ID`, `Breakdown_Fee_Student_Account_ID`, `Breakdown_Fee_Semester_ID`, `Breakdown_Fee_AcademicYearID`, `Breakdown_Fee_Description`, `Breakdown_Fee_Amount`, `Breakdown_Fee_Type`, `Breakdown_Fee_Display_Status`, `Breakdown_Fee_Date_Added`, `Breakdown_Fee_Date_Updated`) VALUES
(182, 34, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 20:05:01', '2018-10-23 20:05:01'),
(183, 34, 8, 2, 'LABORATORY (CA)', '100.00', 'Enrollment', 'Active', '2018-10-23 20:05:01', '2018-10-23 20:05:01'),
(184, 34, 8, 2, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-23 20:05:01', '2018-10-23 20:05:01'),
(185, 35, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 20:06:11', '2018-10-23 20:06:11'),
(186, 35, 8, 2, 'LABORATORY (CA)', '100.00', 'Enrollment', 'Active', '2018-10-23 20:06:11', '2018-10-23 20:06:11'),
(187, 35, 8, 2, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-23 20:06:11', '2018-10-23 20:06:11'),
(188, 36, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 20:07:01', '2018-10-23 20:07:01'),
(189, 36, 8, 2, 'LABORATORY (CA)', '100.00', 'Enrollment', 'Active', '2018-10-23 20:07:01', '2018-10-23 20:07:01'),
(190, 36, 8, 2, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-23 20:07:01', '2018-10-23 20:07:01'),
(191, 37, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 20:13:00', '2018-10-23 20:13:00'),
(192, 37, 8, 2, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-23 20:13:00', '2018-10-23 20:13:00'),
(193, 38, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 20:13:30', '2018-10-23 20:13:30'),
(194, 38, 8, 2, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-23 20:13:30', '2018-10-23 20:13:30'),
(195, 39, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 20:14:39', '2018-10-23 20:14:39'),
(196, 39, 8, 2, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-23 20:14:39', '2018-10-23 20:14:39'),
(197, 34, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:03:50', '2018-10-23 21:03:50'),
(198, 34, 9, 2, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-23 21:03:51', '2018-10-23 21:03:51'),
(199, 35, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(200, 35, 9, 2, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-23 21:04:33', '2018-10-23 21:04:33'),
(201, 36, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:05:20', '2018-10-23 21:05:20'),
(202, 36, 9, 2, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-23 21:05:20', '2018-10-23 21:05:20'),
(203, 37, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:06:48', '2018-10-23 21:06:48'),
(204, 37, 9, 2, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-23 21:06:48', '2018-10-23 21:06:48'),
(205, 38, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:07:38', '2018-10-23 21:07:38'),
(206, 38, 9, 2, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-23 21:07:38', '2018-10-23 21:07:38'),
(207, 39, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:08:28', '2018-10-23 21:08:28'),
(208, 39, 9, 2, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-23 21:08:28', '2018-10-23 21:08:28'),
(209, 40, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:55:50', '2018-10-23 21:55:50'),
(210, 40, 8, 1, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-23 21:55:50', '2018-10-23 21:55:50'),
(211, 41, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:57:07', '2018-10-23 21:57:07'),
(212, 41, 8, 1, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-23 21:57:07', '2018-10-23 21:57:07'),
(213, 42, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:57:44', '2018-10-23 21:57:44'),
(214, 42, 8, 1, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-23 21:57:44', '2018-10-23 21:57:44'),
(215, 43, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:58:26', '2018-10-23 21:58:26'),
(216, 43, 8, 1, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-23 21:58:26', '2018-10-23 21:58:26'),
(217, 44, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(218, 44, 8, 1, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(219, 45, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 21:59:57', '2018-10-23 21:59:57'),
(220, 45, 8, 1, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-23 21:59:57', '2018-10-23 21:59:57'),
(221, 34, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(222, 34, 8, 1, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(223, 35, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(224, 35, 8, 1, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(225, 36, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(226, 36, 8, 1, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(227, 37, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:02:43', '2018-10-23 22:02:43'),
(228, 37, 8, 1, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2018-10-23 22:02:43', '2018-10-23 22:02:43'),
(229, 38, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:03:21', '2018-10-23 22:03:21'),
(230, 38, 8, 1, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2018-10-23 22:03:21', '2018-10-23 22:03:21'),
(231, 39, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:03:53', '2018-10-23 22:03:53'),
(232, 39, 8, 1, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2018-10-23 22:03:53', '2018-10-23 22:03:53'),
(233, 34, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(234, 34, 9, 1, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(235, 35, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:52:55', '2018-10-23 22:52:55'),
(236, 35, 9, 1, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-23 22:52:55', '2018-10-23 22:52:55'),
(237, 36, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(238, 36, 9, 1, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(239, 37, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:53:50', '2018-10-23 22:53:50'),
(240, 37, 9, 1, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-23 22:53:50', '2018-10-23 22:53:50'),
(241, 38, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:54:13', '2018-10-23 22:54:13'),
(242, 38, 9, 1, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-23 22:54:13', '2018-10-23 22:54:13'),
(243, 39, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:54:36', '2018-10-23 22:54:36'),
(244, 39, 9, 1, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-23 22:54:36', '2018-10-23 22:54:36'),
(245, 40, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(246, 40, 9, 1, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(247, 41, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(248, 41, 9, 1, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-23 22:55:55', '2018-10-23 22:55:55'),
(249, 42, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:56:25', '2018-10-23 22:56:25'),
(250, 42, 9, 1, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-23 22:56:25', '2018-10-23 22:56:25'),
(251, 43, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:57:09', '2018-10-23 22:57:09'),
(252, 43, 9, 1, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-23 22:57:09', '2018-10-23 22:57:09'),
(253, 44, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:57:49', '2018-10-23 22:57:49'),
(254, 44, 9, 1, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-23 22:57:49', '2018-10-23 22:57:49'),
(255, 45, 9, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-23 22:58:58', '2018-10-23 22:58:58'),
(256, 45, 9, 1, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-23 22:58:58', '2018-10-23 22:58:58'),
(257, 46, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:02:41', '2018-10-24 00:02:41'),
(258, 46, 8, 5, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-24 00:02:41', '2018-10-24 00:02:41'),
(259, 47, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:03:40', '2018-10-24 00:03:40'),
(260, 47, 8, 5, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-24 00:03:40', '2018-10-24 00:03:40'),
(261, 48, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(262, 48, 8, 5, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(263, 49, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:05:15', '2018-10-24 00:05:15'),
(264, 49, 8, 5, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-24 00:05:15', '2018-10-24 00:05:15'),
(265, 50, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:05:52', '2018-10-24 00:05:52'),
(266, 50, 8, 5, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-24 00:05:52', '2018-10-24 00:05:52'),
(267, 51, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(268, 51, 8, 5, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(269, 34, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(270, 34, 8, 5, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(271, 35, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(272, 35, 8, 5, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(273, 36, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(274, 36, 8, 5, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(275, 37, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:09:07', '2018-10-24 00:09:07'),
(276, 37, 8, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 00:09:07', '2018-10-24 00:09:07'),
(277, 38, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:09:36', '2018-10-24 00:09:36'),
(278, 38, 8, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 00:09:36', '2018-10-24 00:09:36'),
(279, 39, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:10:01', '2018-10-24 00:10:01'),
(280, 39, 8, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 00:10:01', '2018-10-24 00:10:01'),
(281, 40, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(282, 40, 8, 5, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(283, 41, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:11:10', '2018-10-24 00:11:10'),
(284, 41, 8, 5, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-24 00:11:10', '2018-10-24 00:11:10'),
(285, 42, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:11:58', '2018-10-24 00:11:58'),
(286, 42, 8, 5, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-24 00:11:58', '2018-10-24 00:11:58'),
(287, 43, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:12:40', '2018-10-24 00:12:40'),
(288, 43, 8, 5, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2018-10-24 00:12:40', '2018-10-24 00:12:40'),
(289, 44, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:13:07', '2018-10-24 00:13:07'),
(290, 44, 8, 5, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2018-10-24 00:13:07', '2018-10-24 00:13:07'),
(291, 45, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 00:13:42', '2018-10-24 00:13:42'),
(292, 45, 8, 5, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2018-10-24 00:13:42', '2018-10-24 00:13:42'),
(293, 34, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:35:04', '2018-10-24 01:35:04'),
(294, 34, 9, 5, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2018-10-24 01:35:04', '2018-10-24 01:35:04'),
(295, 35, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:35:32', '2018-10-24 01:35:32'),
(296, 35, 9, 5, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2018-10-24 01:35:32', '2018-10-24 01:35:32'),
(297, 36, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:35:59', '2018-10-24 01:35:59'),
(298, 36, 9, 5, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2018-10-24 01:36:00', '2018-10-24 01:36:00'),
(299, 37, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:36:27', '2018-10-24 01:36:27'),
(300, 37, 9, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 01:36:27', '2018-10-24 01:36:27'),
(301, 38, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:36:46', '2018-10-24 01:36:46'),
(302, 38, 9, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 01:36:46', '2018-10-24 01:36:46'),
(303, 39, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:37:23', '2018-10-24 01:37:23'),
(304, 39, 9, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 01:37:23', '2018-10-24 01:37:23'),
(305, 40, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:37:50', '2018-10-24 01:37:50'),
(306, 40, 9, 5, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 01:37:50', '2018-10-24 01:37:50'),
(307, 41, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(308, 41, 9, 5, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(309, 42, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:39:26', '2018-10-24 01:39:26'),
(310, 42, 9, 5, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 01:39:26', '2018-10-24 01:39:26'),
(311, 43, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:39:54', '2018-10-24 01:39:54'),
(312, 43, 9, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 01:39:54', '2018-10-24 01:39:54'),
(313, 44, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:40:23', '2018-10-24 01:40:23'),
(314, 44, 9, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 01:40:23', '2018-10-24 01:40:23'),
(315, 45, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:40:54', '2018-10-24 01:40:54'),
(316, 45, 9, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 01:40:54', '2018-10-24 01:40:54'),
(317, 46, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(318, 46, 9, 5, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 01:41:41', '2018-10-24 01:41:41'),
(319, 47, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:42:24', '2018-10-24 01:42:24'),
(320, 47, 9, 5, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 01:42:24', '2018-10-24 01:42:24'),
(321, 48, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(322, 48, 9, 5, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(323, 49, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:43:33', '2018-10-24 01:43:33'),
(324, 49, 9, 5, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-24 01:43:33', '2018-10-24 01:43:33'),
(325, 50, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:44:16', '2018-10-24 01:44:16'),
(326, 50, 9, 5, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-24 01:44:16', '2018-10-24 01:44:16'),
(327, 51, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 01:44:50', '2018-10-24 01:44:50'),
(328, 51, 9, 5, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-24 01:44:50', '2018-10-24 01:44:50'),
(329, 34, 10, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 02:17:46', '2018-10-24 02:17:46'),
(330, 34, 10, 5, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-24 02:17:46', '2018-10-24 02:17:46'),
(331, 35, 10, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 02:18:06', '2018-10-24 02:18:06'),
(332, 35, 10, 5, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-24 02:18:06', '2018-10-24 02:18:06'),
(333, 36, 10, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 02:18:22', '2018-10-24 02:18:22'),
(334, 36, 10, 5, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-24 02:18:22', '2018-10-24 02:18:22'),
(335, 52, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:13:28', '2018-10-24 03:13:28'),
(336, 52, 8, 6, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-24 03:13:28', '2018-10-24 03:13:28'),
(337, 53, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:14:07', '2018-10-24 03:14:07'),
(338, 53, 8, 6, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(339, 54, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:14:45', '2018-10-24 03:14:45'),
(340, 54, 8, 6, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(341, 55, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:15:26', '2018-10-24 03:15:26'),
(342, 55, 8, 6, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-24 03:15:26', '2018-10-24 03:15:26'),
(343, 56, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:16:12', '2018-10-24 03:16:12'),
(344, 56, 8, 6, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-24 03:16:13', '2018-10-24 03:16:13'),
(345, 57, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:16:46', '2018-10-24 03:16:46'),
(346, 57, 8, 6, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-24 03:16:46', '2018-10-24 03:16:46'),
(347, 34, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:17:20', '2018-10-24 03:17:20'),
(348, 34, 8, 6, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2018-10-24 03:17:20', '2018-10-24 03:17:20'),
(349, 35, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:17:44', '2018-10-24 03:17:44'),
(350, 35, 8, 6, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2018-10-24 03:17:44', '2018-10-24 03:17:44'),
(351, 36, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:18:06', '2018-10-24 03:18:06'),
(352, 36, 8, 6, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2018-10-24 03:18:07', '2018-10-24 03:18:07'),
(353, 37, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:18:45', '2018-10-24 03:18:45'),
(354, 37, 8, 6, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-24 03:18:45', '2018-10-24 03:18:45'),
(355, 38, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:19:07', '2018-10-24 03:19:07'),
(356, 38, 8, 6, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-24 03:19:07', '2018-10-24 03:19:07'),
(357, 39, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:19:50', '2018-10-24 03:19:50'),
(358, 39, 8, 6, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-24 03:19:50', '2018-10-24 03:19:50'),
(359, 40, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:20:15', '2018-10-24 03:20:15'),
(360, 40, 8, 6, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2018-10-24 03:20:15', '2018-10-24 03:20:15'),
(361, 41, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(362, 41, 8, 6, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(363, 42, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(364, 42, 8, 6, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(365, 43, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:21:32', '2018-10-24 03:21:32'),
(366, 43, 8, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 03:21:32', '2018-10-24 03:21:32'),
(367, 44, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:21:52', '2018-10-24 03:21:52'),
(368, 44, 8, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 03:21:52', '2018-10-24 03:21:52'),
(369, 45, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:22:17', '2018-10-24 03:22:17'),
(370, 45, 8, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 03:22:17', '2018-10-24 03:22:17'),
(371, 46, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(372, 46, 8, 6, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(373, 47, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(374, 47, 8, 6, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(375, 48, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:23:42', '2018-10-24 03:23:42'),
(376, 48, 8, 6, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-24 03:23:42', '2018-10-24 03:23:42'),
(377, 49, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:24:13', '2018-10-24 03:24:13'),
(378, 49, 8, 6, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2018-10-24 03:24:13', '2018-10-24 03:24:13'),
(379, 50, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:24:40', '2018-10-24 03:24:40'),
(380, 50, 8, 6, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2018-10-24 03:24:40', '2018-10-24 03:24:40'),
(381, 51, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 03:25:16', '2018-10-24 03:25:16'),
(382, 51, 8, 6, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2018-10-24 03:25:16', '2018-10-24 03:25:16'),
(383, 34, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:28:24', '2018-10-24 04:28:24'),
(384, 34, 9, 6, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2018-10-24 04:28:24', '2018-10-24 04:28:24'),
(385, 35, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:28:40', '2018-10-24 04:28:40'),
(386, 35, 9, 6, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2018-10-24 04:28:40', '2018-10-24 04:28:40'),
(387, 36, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:28:57', '2018-10-24 04:28:57'),
(388, 36, 9, 6, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2018-10-24 04:28:57', '2018-10-24 04:28:57'),
(389, 37, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:29:18', '2018-10-24 04:29:18'),
(390, 37, 9, 6, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2018-10-24 04:29:18', '2018-10-24 04:29:18'),
(391, 38, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:29:35', '2018-10-24 04:29:35'),
(392, 38, 9, 6, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2018-10-24 04:29:35', '2018-10-24 04:29:35'),
(393, 39, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:30:14', '2018-10-24 04:30:14'),
(394, 39, 9, 6, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2018-10-24 04:30:14', '2018-10-24 04:30:14'),
(395, 40, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:30:45', '2018-10-24 04:30:45'),
(396, 40, 9, 6, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2018-10-24 04:30:45', '2018-10-24 04:30:45'),
(397, 41, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:31:14', '2018-10-24 04:31:14'),
(398, 41, 9, 6, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2018-10-24 04:31:14', '2018-10-24 04:31:14'),
(399, 42, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:31:45', '2018-10-24 04:31:45'),
(400, 42, 9, 6, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2018-10-24 04:31:45', '2018-10-24 04:31:45'),
(401, 43, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:32:18', '2018-10-24 04:32:18'),
(402, 43, 9, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 04:32:18', '2018-10-24 04:32:18'),
(403, 44, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:32:37', '2018-10-24 04:32:37'),
(404, 44, 9, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 04:32:37', '2018-10-24 04:32:37'),
(405, 45, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:32:55', '2018-10-24 04:32:55'),
(406, 45, 9, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 04:32:56', '2018-10-24 04:32:56'),
(407, 46, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(408, 46, 9, 6, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(409, 47, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:34:04', '2018-10-24 04:34:04'),
(410, 47, 9, 6, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 04:34:04', '2018-10-24 04:34:04'),
(411, 48, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:34:29', '2018-10-24 04:34:29'),
(412, 48, 9, 6, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 04:34:29', '2018-10-24 04:34:29'),
(413, 49, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:35:05', '2018-10-24 04:35:05'),
(414, 49, 9, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 04:35:05', '2018-10-24 04:35:05'),
(415, 51, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:36:10', '2018-10-24 04:36:10'),
(416, 51, 9, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 04:36:10', '2018-10-24 04:36:10'),
(417, 52, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(418, 52, 9, 6, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(419, 53, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(420, 53, 9, 6, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(421, 54, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:38:00', '2018-10-24 04:38:00'),
(422, 54, 9, 6, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-24 04:38:00', '2018-10-24 04:38:00'),
(423, 55, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:38:41', '2018-10-24 04:38:41'),
(424, 55, 9, 6, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-24 04:38:41', '2018-10-24 04:38:41'),
(425, 56, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:39:29', '2018-10-24 04:39:29'),
(426, 56, 9, 6, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-24 04:39:29', '2018-10-24 04:39:29'),
(427, 57, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 04:40:07', '2018-10-24 04:40:07'),
(428, 57, 9, 6, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-24 04:40:07', '2018-10-24 04:40:07'),
(429, 50, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 05:03:02', '2018-10-24 05:03:02'),
(430, 50, 9, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-24 05:03:02', '2018-10-24 05:03:02'),
(431, 40, 10, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 05:13:44', '2018-10-24 05:13:44'),
(432, 40, 10, 6, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-24 05:13:44', '2018-10-24 05:13:44'),
(433, 41, 10, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 05:14:01', '2018-10-24 05:14:01'),
(434, 41, 10, 6, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-24 05:14:01', '2018-10-24 05:14:01'),
(435, 42, 10, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-24 05:14:18', '2018-10-24 05:14:18'),
(436, 42, 10, 6, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-24 05:14:18', '2018-10-24 05:14:18'),
(437, 58, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:11:14', '2019-02-04 23:11:14'),
(438, 58, 8, 7, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(439, 59, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(440, 59, 8, 7, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(441, 60, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(442, 60, 8, 7, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(443, 61, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:27:45', '2019-02-04 23:27:45'),
(444, 61, 8, 7, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2019-02-04 23:27:45', '2019-02-04 23:27:45'),
(445, 62, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(446, 62, 8, 7, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(447, 63, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:32:48', '2019-02-04 23:32:48'),
(448, 63, 8, 7, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2019-02-04 23:32:48', '2019-02-04 23:32:48'),
(449, 40, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:33:52', '2019-02-04 23:33:52'),
(450, 40, 8, 7, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2019-02-04 23:33:52', '2019-02-04 23:33:52'),
(451, 41, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:34:19', '2019-02-04 23:34:19'),
(452, 41, 8, 7, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2019-02-04 23:34:19', '2019-02-04 23:34:19'),
(453, 42, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:34:47', '2019-02-04 23:34:47'),
(454, 42, 8, 7, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2019-02-04 23:34:47', '2019-02-04 23:34:47'),
(455, 43, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:35:25', '2019-02-04 23:35:25'),
(456, 43, 8, 7, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-04 23:35:25', '2019-02-04 23:35:25'),
(457, 44, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:35:49', '2019-02-04 23:35:49'),
(458, 44, 8, 7, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-04 23:35:49', '2019-02-04 23:35:49'),
(459, 45, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:36:20', '2019-02-04 23:36:20'),
(460, 45, 8, 7, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-04 23:36:20', '2019-02-04 23:36:20'),
(461, 46, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:36:54', '2019-02-04 23:36:54'),
(462, 46, 8, 7, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2019-02-04 23:36:54', '2019-02-04 23:36:54'),
(463, 47, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:37:24', '2019-02-04 23:37:24'),
(464, 47, 8, 7, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2019-02-04 23:37:25', '2019-02-04 23:37:25'),
(465, 48, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(466, 48, 8, 7, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(467, 49, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:38:23', '2019-02-04 23:38:23'),
(468, 49, 8, 7, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-04 23:38:23', '2019-02-04 23:38:23'),
(469, 50, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:38:51', '2019-02-04 23:38:51'),
(470, 50, 8, 7, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-04 23:38:52', '2019-02-04 23:38:52'),
(471, 51, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:39:17', '2019-02-04 23:39:17'),
(472, 51, 8, 7, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-04 23:39:17', '2019-02-04 23:39:17'),
(473, 52, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(474, 52, 8, 7, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(475, 53, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:40:25', '2019-02-04 23:40:25'),
(476, 53, 8, 7, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2019-02-04 23:40:25', '2019-02-04 23:40:25'),
(477, 54, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:40:54', '2019-02-04 23:40:54'),
(478, 54, 8, 7, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2019-02-04 23:40:54', '2019-02-04 23:40:54'),
(479, 55, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:41:45', '2019-02-04 23:41:45'),
(480, 55, 8, 7, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2019-02-04 23:41:45', '2019-02-04 23:41:45'),
(481, 56, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:42:14', '2019-02-04 23:42:14'),
(482, 56, 8, 7, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2019-02-04 23:42:14', '2019-02-04 23:42:14'),
(483, 57, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-04 23:42:48', '2019-02-04 23:42:48'),
(484, 57, 8, 7, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2019-02-04 23:42:48', '2019-02-04 23:42:48'),
(485, 52, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:49:37', '2019-02-05 10:49:37'),
(486, 52, 9, 7, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-05 10:49:37', '2019-02-05 10:49:37'),
(487, 53, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:50:03', '2019-02-05 10:50:03'),
(488, 53, 9, 7, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-05 10:50:03', '2019-02-05 10:50:03'),
(489, 54, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(490, 54, 9, 7, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(491, 55, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:50:53', '2019-02-05 10:50:53'),
(492, 55, 9, 7, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-05 10:50:53', '2019-02-05 10:50:53'),
(493, 56, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:51:13', '2019-02-05 10:51:13'),
(494, 56, 9, 7, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-05 10:51:13', '2019-02-05 10:51:13'),
(495, 57, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:51:32', '2019-02-05 10:51:32'),
(496, 57, 9, 7, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-05 10:51:32', '2019-02-05 10:51:32'),
(497, 46, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:52:08', '2019-02-05 10:52:08'),
(498, 46, 9, 7, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2019-02-05 10:52:08', '2019-02-05 10:52:08'),
(499, 47, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:52:31', '2019-02-05 10:52:31'),
(500, 47, 9, 7, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2019-02-05 10:52:31', '2019-02-05 10:52:31'),
(501, 48, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:52:51', '2019-02-05 10:52:51'),
(502, 48, 9, 7, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2019-02-05 10:52:51', '2019-02-05 10:52:51'),
(503, 49, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:53:13', '2019-02-05 10:53:13'),
(504, 49, 9, 7, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-05 10:53:13', '2019-02-05 10:53:13'),
(505, 50, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:53:38', '2019-02-05 10:53:38'),
(506, 50, 9, 7, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-05 10:53:38', '2019-02-05 10:53:38'),
(507, 51, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:53:59', '2019-02-05 10:53:59'),
(508, 51, 9, 7, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-05 10:53:59', '2019-02-05 10:53:59'),
(509, 40, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:55:19', '2019-02-05 10:55:19'),
(510, 40, 9, 7, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2019-02-05 10:55:19', '2019-02-05 10:55:19'),
(511, 41, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:55:35', '2019-02-05 10:55:35'),
(512, 41, 9, 7, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2019-02-05 10:55:35', '2019-02-05 10:55:35'),
(513, 42, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:55:50', '2019-02-05 10:55:50'),
(514, 42, 9, 7, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2019-02-05 10:55:50', '2019-02-05 10:55:50'),
(515, 43, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:56:09', '2019-02-05 10:56:09'),
(516, 43, 9, 7, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2019-02-05 10:56:09', '2019-02-05 10:56:09'),
(517, 44, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:56:25', '2019-02-05 10:56:25'),
(518, 44, 9, 7, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2019-02-05 10:56:25', '2019-02-05 10:56:25'),
(519, 45, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 10:56:41', '2019-02-05 10:56:41'),
(520, 45, 9, 7, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2019-02-05 10:56:41', '2019-02-05 10:56:41'),
(521, 58, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 11:32:33', '2019-02-05 11:32:33'),
(522, 58, 9, 7, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-05 11:32:33', '2019-02-05 11:32:33'),
(523, 59, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(524, 59, 9, 7, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(525, 60, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 11:33:45', '2019-02-05 11:33:45'),
(526, 60, 9, 7, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-05 11:33:45', '2019-02-05 11:33:45'),
(527, 61, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 11:34:34', '2019-02-05 11:34:34'),
(528, 61, 9, 7, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-05 11:34:34', '2019-02-05 11:34:34'),
(529, 62, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 11:36:21', '2019-02-05 11:36:21'),
(530, 62, 9, 7, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-05 11:36:21', '2019-02-05 11:36:21'),
(531, 63, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2019-02-05 11:37:04', '2019-02-05 11:37:04'),
(532, 63, 9, 7, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-05 11:37:04', '2019-02-05 11:37:04'),
(533, 64, 8, 8, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(534, 65, 8, 8, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(535, 66, 8, 8, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(536, 67, 8, 8, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2019-02-13 22:52:11', '2019-02-13 22:52:11'),
(537, 68, 8, 8, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2019-02-13 22:52:46', '2019-02-13 22:52:46'),
(538, 69, 8, 8, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2019-02-13 22:53:17', '2019-02-13 22:53:17'),
(539, 46, 8, 8, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2019-02-13 23:09:59', '2019-02-13 23:09:59'),
(540, 47, 8, 8, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2019-02-13 23:10:49', '2019-02-13 23:10:49'),
(541, 48, 8, 8, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2019-02-13 23:11:10', '2019-02-13 23:11:10'),
(542, 49, 8, 8, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-13 23:11:47', '2019-02-13 23:11:47'),
(543, 50, 8, 8, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-13 23:12:16', '2019-02-13 23:12:16'),
(544, 52, 8, 8, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2019-02-13 23:12:44', '2019-02-13 23:12:44'),
(545, 53, 8, 8, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2019-02-13 23:13:17', '2019-02-13 23:13:17'),
(546, 54, 8, 8, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2019-02-13 23:13:45', '2019-02-13 23:13:45'),
(547, 55, 8, 8, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-13 23:14:08', '2019-02-13 23:14:08'),
(548, 56, 8, 8, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-13 23:14:27', '2019-02-13 23:14:27'),
(549, 57, 8, 8, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-13 23:14:49', '2019-02-13 23:14:49'),
(550, 58, 8, 8, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2019-02-13 23:15:40', '2019-02-13 23:15:40'),
(551, 59, 8, 8, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2019-02-13 23:16:06', '2019-02-13 23:16:06'),
(552, 60, 8, 8, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(553, 61, 8, 8, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2019-02-13 23:17:10', '2019-02-13 23:17:10'),
(554, 62, 8, 8, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2019-02-13 23:17:44', '2019-02-13 23:17:44'),
(555, 63, 8, 8, 'Academic (17 Tuition Unit)', '5100.00', 'Enrollment', 'Active', '2019-02-13 23:18:09', '2019-02-13 23:18:09'),
(556, 51, 8, 8, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-14 14:17:00', '2019-02-14 14:17:00'),
(557, 46, 9, 8, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2019-02-14 14:50:01', '2019-02-14 14:50:01'),
(558, 47, 9, 8, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2019-02-14 14:50:21', '2019-02-14 14:50:21'),
(559, 48, 9, 8, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2019-02-14 14:50:36', '2019-02-14 14:50:36'),
(560, 49, 9, 8, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2019-02-14 14:51:21', '2019-02-14 14:51:21'),
(561, 50, 9, 8, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2019-02-14 14:51:48', '2019-02-14 14:51:48'),
(562, 51, 9, 8, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2019-02-14 14:52:04', '2019-02-14 14:52:04'),
(563, 52, 9, 8, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2019-02-14 14:52:31', '2019-02-14 14:52:31'),
(564, 53, 9, 8, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2019-02-14 14:52:51', '2019-02-14 14:52:51'),
(565, 54, 9, 8, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2019-02-14 14:53:11', '2019-02-14 14:53:11'),
(566, 55, 9, 8, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-14 14:53:31', '2019-02-14 14:53:31'),
(567, 56, 9, 8, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-14 14:53:47', '2019-02-14 14:53:47'),
(568, 57, 9, 8, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-14 14:54:11', '2019-02-14 14:54:11'),
(569, 58, 9, 8, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-14 14:54:36', '2019-02-14 14:54:36'),
(570, 59, 9, 8, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-14 14:55:10', '2019-02-14 14:55:10'),
(571, 60, 9, 8, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-14 14:55:30', '2019-02-14 14:55:30'),
(572, 61, 9, 8, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-14 14:55:57', '2019-02-14 14:55:57'),
(573, 62, 9, 8, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-14 14:56:22', '2019-02-14 14:56:22'),
(574, 63, 9, 8, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2019-02-14 14:56:55', '2019-02-14 14:56:55'),
(575, 64, 9, 8, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(576, 65, 9, 8, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-14 14:58:01', '2019-02-14 14:58:01'),
(577, 66, 9, 8, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2019-02-14 14:58:33', '2019-02-14 14:58:33'),
(578, 67, 9, 8, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-14 14:59:15', '2019-02-14 14:59:15'),
(579, 68, 9, 8, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-14 14:59:43', '2019-02-14 14:59:43'),
(580, 69, 9, 8, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2019-02-14 15:00:24', '2019-02-14 15:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `t_enrollment`
--

CREATE TABLE `t_enrollment` (
  `Enrollment_ID` int(11) NOT NULL,
  `Enrollment_Student_Account_ID` int(11) NOT NULL,
  `Enrollment_Academic_Year_ID` int(11) NOT NULL,
  `Enrollment_Course_ID` int(11) NOT NULL,
  `Enrollment_Semester_ID` int(11) NOT NULL,
  `Enrollment_Section_ID` int(11) NOT NULL,
  `Enrollment_Assign_Section_Curriculum_ID` int(11) NOT NULL,
  `Enrollment_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Enrollment_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Enrollment_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_enrollment_status`
--

CREATE TABLE `t_enrollment_status` (
  `Enrollment_Status_ID` int(11) NOT NULL,
  `Enrollment_Status_Section_ID` int(11) NOT NULL,
  `Enrollment_Status_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Enrollment_Status_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Enrollment_Status_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_graduate`
--

CREATE TABLE `t_graduate` (
  `Graduate_ID` int(11) NOT NULL,
  `Graduate_StudentAccountID` int(11) NOT NULL,
  `Graduate_AcademicYearID` int(11) NOT NULL,
  `Graduate_SemesterID` int(11) NOT NULL,
  `Graduate_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Graduate_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Graduate_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_graduate`
--

INSERT INTO `t_graduate` (`Graduate_ID`, `Graduate_StudentAccountID`, `Graduate_AcademicYearID`, `Graduate_SemesterID`, `Graduate_Display_Status`, `Graduate_Date_Added`, `Graduate_Date_Updated`) VALUES
(1, 34, 6, 10, 'Active', '2019-02-04 22:10:07', '2019-02-04 22:10:07'),
(2, 35, 6, 10, 'Active', '2019-02-04 22:10:15', '2019-02-04 22:10:15'),
(3, 36, 6, 10, 'Active', '2019-02-04 22:10:15', '2019-02-04 22:10:15'),
(4, 37, 6, 10, 'Active', '2019-02-04 22:10:16', '2019-02-04 22:10:16'),
(5, 38, 6, 10, 'Active', '2019-02-04 22:10:16', '2019-02-04 22:10:16'),
(6, 39, 6, 10, 'Active', '2019-02-04 22:10:16', '2019-02-04 22:10:16'),
(7, 40, 7, 9, 'Active', '2019-02-13 13:38:30', '2019-02-13 13:38:30'),
(8, 41, 7, 9, 'Active', '2019-02-13 13:38:30', '2019-02-13 13:38:30'),
(9, 42, 7, 9, 'Active', '2019-02-13 13:38:31', '2019-02-13 13:38:31'),
(10, 43, 7, 9, 'Active', '2019-02-13 13:38:31', '2019-02-13 13:38:31'),
(11, 44, 7, 9, 'Active', '2019-02-13 13:38:31', '2019-02-13 13:38:31'),
(12, 45, 7, 9, 'Active', '2019-02-13 13:38:31', '2019-02-13 13:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `t_payable_history`
--

CREATE TABLE `t_payable_history` (
  `Payable_History_ID` int(11) NOT NULL,
  `Payable_History_Student_Account_ID` int(11) NOT NULL,
  `Payable_History_Semester_ID` int(11) NOT NULL,
  `Payable_History_AcademicYearID` int(11) NOT NULL,
  `Payable_History_Year_Level` enum('First Year','Second Year','Third Year','Fourth Year','Fifth Year') NOT NULL,
  `Payable_History_Description` varchar(100) NOT NULL,
  `Payable_History_Type` enum('Assessment','Payment') NOT NULL,
  `Payable_History_Amount` decimal(10,2) NOT NULL,
  `Payable_History_Balance` decimal(10,2) NOT NULL,
  `Payable_History_ScholarshipID` int(11) DEFAULT NULL,
  `Payable_History_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Payable_History_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Payable_History_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_payable_history`
--

INSERT INTO `t_payable_history` (`Payable_History_ID`, `Payable_History_Student_Account_ID`, `Payable_History_Semester_ID`, `Payable_History_AcademicYearID`, `Payable_History_Year_Level`, `Payable_History_Description`, `Payable_History_Type`, `Payable_History_Amount`, `Payable_History_Balance`, `Payable_History_ScholarshipID`, `Payable_History_Date_Added`, `Payable_History_Date_Updated`, `Payable_History_Display_Status`) VALUES
(310, 34, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '9000.00', '9000.00', NULL, '2018-10-23 20:05:02', '2018-10-23 20:05:02', 'Active'),
(311, 35, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '9000.00', '9000.00', NULL, '2018-10-23 20:06:12', '2018-10-23 20:06:12', 'Active'),
(312, 36, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '9000.00', '9000.00', NULL, '2018-10-23 20:07:02', '2018-10-23 20:07:02', 'Active'),
(313, 36, 8, 2, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '9000.00', '0.00', 2, '2018-10-23 20:07:02', '2018-10-23 20:07:02', 'Active'),
(314, 37, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-23 20:13:01', '2018-10-23 20:13:01', 'Active'),
(315, 38, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-23 20:13:31', '2018-10-23 20:13:31', 'Active'),
(316, 39, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-23 20:14:41', '2018-10-23 20:14:41', 'Active'),
(317, 39, 8, 2, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7100.00', '0.00', 2, '2018-10-23 20:14:41', '2018-10-23 20:14:41', 'Active'),
(318, 34, 8, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9000.00', '0.00', NULL, '2018-10-23 20:18:39', '2018-10-23 20:18:39', 'Active'),
(319, 35, 8, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9000.00', '0.00', NULL, '2018-10-23 20:19:12', '2018-10-23 20:19:12', 'Active'),
(320, 37, 8, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2018-10-23 20:19:37', '2018-10-23 20:19:37', 'Active'),
(321, 38, 8, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2018-10-23 20:19:53', '2018-10-23 20:19:53', 'Active'),
(322, 36, 8, 2, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '9000.00', '-9000.00', 2, '2018-10-23 20:32:27', '2018-10-23 20:32:27', 'Active'),
(323, 39, 8, 2, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7100.00', '-7100.00', 2, '2018-10-23 20:32:27', '2018-10-23 20:32:27', 'Active'),
(324, 34, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-23 21:03:51', '2018-10-23 21:03:51', 'Active'),
(325, 35, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-23 21:04:33', '2018-10-23 21:04:33', 'Active'),
(326, 36, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '-9000.00', '1400.00', NULL, '2018-10-23 21:05:20', '2018-10-23 21:05:20', 'Active'),
(327, 37, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-23 21:06:48', '2018-10-23 21:06:48', 'Active'),
(328, 38, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-23 21:07:38', '2018-10-23 21:07:38', 'Active'),
(329, 39, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-600.00', NULL, '2018-10-23 21:08:28', '2018-10-23 21:08:28', 'Active'),
(330, 34, 9, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-23 21:09:00', '2018-10-23 21:09:00', 'Active'),
(331, 35, 9, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-23 21:09:21', '2018-10-23 21:09:21', 'Active'),
(332, 37, 9, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-23 21:09:43', '2018-10-23 21:09:43', 'Active'),
(333, 38, 9, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-23 21:09:54', '2018-10-23 21:09:54', 'Active'),
(334, 36, 9, 2, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-9000.00', 2, '2018-10-23 21:10:50', '2018-10-23 21:10:50', 'Active'),
(335, 39, 9, 2, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '6500.00', '-7100.00', 2, '2018-10-23 21:10:51', '2018-10-23 21:10:51', 'Active'),
(336, 40, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-10-23 21:55:51', '2018-10-23 21:55:51', 'Active'),
(337, 41, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-10-23 21:57:08', '2018-10-23 21:57:08', 'Active'),
(338, 41, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '0.00', 1, '2018-10-23 21:57:08', '2018-10-23 21:57:08', 'Active'),
(339, 42, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-10-23 21:57:45', '2018-10-23 21:57:45', 'Active'),
(340, 43, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-23 21:58:27', '2018-10-23 21:58:27', 'Active'),
(341, 44, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-23 21:59:15', '2018-10-23 21:59:15', 'Active'),
(342, 44, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7100.00', '0.00', 1, '2018-10-23 21:59:15', '2018-10-23 21:59:15', 'Active'),
(343, 45, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-23 21:59:58', '2018-10-23 21:59:58', 'Active'),
(344, 34, 8, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2018-10-23 22:00:57', '2018-10-23 22:00:57', 'Active'),
(345, 35, 8, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2018-10-23 22:01:26', '2018-10-23 22:01:26', 'Active'),
(346, 36, 8, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-9000.00', '2300.00', NULL, '2018-10-23 22:01:49', '2018-10-23 22:01:49', 'Active'),
(347, 37, 8, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6200.00', NULL, '2018-10-23 22:02:43', '2018-10-23 22:02:43', 'Active'),
(348, 38, 8, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6200.00', NULL, '2018-10-23 22:03:21', '2018-10-23 22:03:21', 'Active'),
(349, 39, 8, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-900.00', NULL, '2018-10-23 22:03:53', '2018-10-23 22:03:53', 'Active'),
(350, 34, 8, 1, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2018-10-23 22:06:57', '2018-10-23 22:06:57', 'Active'),
(351, 35, 8, 1, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2018-10-23 22:07:12', '2018-10-23 22:07:12', 'Active'),
(352, 37, 8, 1, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '6200.00', '0.00', NULL, '2018-10-23 22:07:29', '2018-10-23 22:07:29', 'Active'),
(353, 38, 8, 1, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '6200.00', '0.00', NULL, '2018-10-23 22:07:41', '2018-10-23 22:07:41', 'Active'),
(354, 40, 8, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8900.00', '0.00', NULL, '2018-10-23 22:07:56', '2018-10-23 22:07:56', 'Active'),
(355, 42, 8, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8900.00', '0.00', NULL, '2018-10-23 22:08:09', '2018-10-23 22:08:09', 'Active'),
(356, 43, 8, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2018-10-23 22:08:27', '2018-10-23 22:08:27', 'Active'),
(357, 45, 8, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2018-10-23 22:08:40', '2018-10-23 22:08:40', 'Active'),
(358, 36, 8, 1, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '11300.00', '-9000.00', 2, '2018-10-23 22:09:28', '2018-10-23 22:09:28', 'Active'),
(359, 39, 8, 1, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '6200.00', '-7100.00', 2, '2018-10-23 22:09:29', '2018-10-23 22:09:29', 'Active'),
(360, 41, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '-8900.00', 1, '2018-10-23 22:12:07', '2018-10-23 22:12:07', 'Active'),
(361, 44, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7100.00', '-7100.00', 1, '2018-10-23 22:12:08', '2018-10-23 22:12:08', 'Active'),
(362, 34, 9, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-23 22:52:31', '2018-10-23 22:52:31', 'Active'),
(363, 35, 9, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-23 22:52:55', '2018-10-23 22:52:55', 'Active'),
(364, 36, 9, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-9000.00', '1400.00', NULL, '2018-10-23 22:53:17', '2018-10-23 22:53:17', 'Active'),
(365, 37, 9, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-23 22:53:51', '2018-10-23 22:53:51', 'Active'),
(366, 38, 9, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-23 22:54:13', '2018-10-23 22:54:13', 'Active'),
(367, 39, 9, 1, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-2400.00', NULL, '2018-10-23 22:54:36', '2018-10-23 22:54:36', 'Active'),
(368, 40, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-23 22:55:19', '2018-10-23 22:55:19', 'Active'),
(369, 41, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '1500.00', NULL, '2018-10-23 22:55:55', '2018-10-23 22:55:55', 'Active'),
(370, 42, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-23 22:56:25', '2018-10-23 22:56:25', 'Active'),
(371, 43, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-23 22:57:09', '2018-10-23 22:57:09', 'Active'),
(372, 44, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-600.00', NULL, '2018-10-23 22:57:50', '2018-10-23 22:57:50', 'Active'),
(373, 45, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-23 22:58:58', '2018-10-23 22:58:58', 'Active'),
(374, 34, 9, 1, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-23 22:59:31', '2018-10-23 22:59:31', 'Active'),
(375, 35, 9, 1, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-23 22:59:43', '2018-10-23 22:59:43', 'Active'),
(376, 37, 9, 1, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-23 22:59:55', '2018-10-23 22:59:55', 'Active'),
(377, 38, 9, 1, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-23 23:00:05', '2018-10-23 23:00:05', 'Active'),
(378, 40, 9, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-23 23:00:21', '2018-10-23 23:00:21', 'Active'),
(379, 42, 9, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-23 23:00:35', '2018-10-23 23:00:35', 'Active'),
(380, 43, 9, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-23 23:00:48', '2018-10-23 23:00:48', 'Active'),
(381, 45, 9, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-23 23:01:01', '2018-10-23 23:01:01', 'Active'),
(382, 36, 9, 1, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-9000.00', 2, '2018-10-23 23:01:49', '2018-10-23 23:01:49', 'Active'),
(383, 39, 9, 1, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '4700.00', '-7100.00', 2, '2018-10-23 23:01:49', '2018-10-23 23:01:49', 'Active'),
(384, 36, 9, 1, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-19400.00', 1, '2018-10-23 23:02:18', '2018-10-23 23:02:18', 'Active'),
(385, 39, 9, 1, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '4700.00', '-11800.00', 1, '2018-10-23 23:02:19', '2018-10-23 23:02:19', 'Active'),
(386, 41, 9, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-8900.00', 1, '2018-10-23 23:02:20', '2018-10-23 23:02:20', 'Active'),
(387, 44, 9, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '6500.00', '-7100.00', 1, '2018-10-23 23:02:21', '2018-10-23 23:02:21', 'Active'),
(388, 46, 8, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-10-24 00:02:42', '2018-10-24 00:02:42', 'Active'),
(389, 47, 8, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-10-24 00:03:41', '2018-10-24 00:03:41', 'Active'),
(390, 48, 8, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-10-24 00:04:26', '2018-10-24 00:04:26', 'Active'),
(391, 48, 8, 5, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '0.00', 2, '2018-10-24 00:04:26', '2018-10-24 00:04:26', 'Active'),
(392, 49, 8, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-24 00:05:16', '2018-10-24 00:05:16', 'Active'),
(393, 50, 8, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-24 00:05:53', '2018-10-24 00:05:53', 'Active'),
(394, 51, 8, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-24 00:06:37', '2018-10-24 00:06:37', 'Active'),
(395, 51, 8, 5, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7100.00', '0.00', 2, '2018-10-24 00:06:37', '2018-10-24 00:06:37', 'Active'),
(396, 34, 8, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10700.00', NULL, '2018-10-24 00:07:20', '2018-10-24 00:07:20', 'Active'),
(397, 35, 8, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10700.00', NULL, '2018-10-24 00:07:53', '2018-10-24 00:07:53', 'Active'),
(398, 36, 8, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-19400.00', '-8700.00', NULL, '2018-10-24 00:08:25', '2018-10-24 00:08:25', 'Active'),
(399, 37, 8, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 00:09:07', '2018-10-24 00:09:07', 'Active'),
(400, 38, 8, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 00:09:36', '2018-10-24 00:09:36', 'Active'),
(401, 39, 8, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-11800.00', '-7100.00', NULL, '2018-10-24 00:10:01', '2018-10-24 00:10:01', 'Active'),
(402, 40, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2018-10-24 00:10:45', '2018-10-24 00:10:45', 'Active'),
(403, 41, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '2400.00', NULL, '2018-10-24 00:11:10', '2018-10-24 00:11:10', 'Active'),
(404, 42, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2018-10-24 00:11:58', '2018-10-24 00:11:58', 'Active'),
(405, 43, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6200.00', NULL, '2018-10-24 00:12:40', '2018-10-24 00:12:40', 'Active'),
(406, 44, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-900.00', NULL, '2018-10-24 00:13:07', '2018-10-24 00:13:07', 'Active'),
(407, 45, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6200.00', NULL, '2018-10-24 00:13:42', '2018-10-24 00:13:42', 'Active'),
(408, 34, 8, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '10700.00', '0.00', NULL, '2018-10-24 00:16:14', '2018-10-24 00:16:14', 'Active'),
(409, 35, 8, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '10700.00', '0.00', NULL, '2018-10-24 00:16:30', '2018-10-24 00:16:30', 'Active'),
(410, 37, 8, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 00:16:40', '2018-10-24 00:16:40', 'Active'),
(411, 38, 8, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 00:16:53', '2018-10-24 00:16:53', 'Active'),
(412, 40, 8, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2018-10-24 00:17:07', '2018-10-24 00:17:07', 'Active'),
(413, 42, 8, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2018-10-24 00:17:21', '2018-10-24 00:17:21', 'Active'),
(414, 43, 8, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '6200.00', '0.00', NULL, '2018-10-24 00:17:34', '2018-10-24 00:17:34', 'Active'),
(415, 45, 8, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '6200.00', '0.00', NULL, '2018-10-24 00:17:47', '2018-10-24 00:17:47', 'Active'),
(416, 46, 8, 5, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8900.00', '0.00', NULL, '2018-10-24 00:18:06', '2018-10-24 00:18:06', 'Active'),
(417, 47, 8, 5, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8900.00', '0.00', NULL, '2018-10-24 00:18:18', '2018-10-24 00:18:18', 'Active'),
(418, 49, 8, 5, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2018-10-24 00:18:34', '2018-10-24 00:18:34', 'Active'),
(419, 50, 8, 5, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2018-10-24 00:18:50', '2018-10-24 00:18:50', 'Active'),
(420, 41, 8, 5, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '11300.00', '-8900.00', 1, '2018-10-24 00:20:32', '2018-10-24 00:20:32', 'Active'),
(421, 44, 8, 5, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '6200.00', '-7100.00', 1, '2018-10-24 00:20:32', '2018-10-24 00:20:32', 'Active'),
(422, 36, 8, 5, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10700.00', '-19400.00', 2, '2018-10-24 00:24:11', '2018-10-24 00:24:11', 'Active'),
(423, 39, 8, 5, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '4700.00', '-11800.00', 2, '2018-10-24 00:24:12', '2018-10-24 00:24:12', 'Active'),
(424, 48, 8, 5, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '-8900.00', 2, '2018-10-24 00:24:12', '2018-10-24 00:24:12', 'Active'),
(425, 34, 9, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9800.00', NULL, '2018-10-24 01:35:04', '2018-10-24 01:35:04', 'Active'),
(426, 35, 9, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9800.00', NULL, '2018-10-24 01:35:32', '2018-10-24 01:35:32', 'Active'),
(427, 36, 9, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-19400.00', '-9600.00', NULL, '2018-10-24 01:36:00', '2018-10-24 01:36:00', 'Active'),
(428, 37, 9, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 01:36:27', '2018-10-24 01:36:27', 'Active'),
(429, 38, 9, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 01:36:46', '2018-10-24 01:36:46', 'Active'),
(430, 39, 9, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-11800.00', '-7100.00', NULL, '2018-10-24 01:37:23', '2018-10-24 01:37:23', 'Active'),
(431, 40, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-24 01:37:50', '2018-10-24 01:37:50', 'Active'),
(432, 41, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '1500.00', NULL, '2018-10-24 01:38:21', '2018-10-24 01:38:21', 'Active'),
(433, 42, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-24 01:39:26', '2018-10-24 01:39:26', 'Active'),
(434, 43, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 01:39:54', '2018-10-24 01:39:54', 'Active'),
(435, 44, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-2400.00', NULL, '2018-10-24 01:40:23', '2018-10-24 01:40:23', 'Active'),
(436, 45, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 01:40:54', '2018-10-24 01:40:54', 'Active'),
(437, 46, 9, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-24 01:41:41', '2018-10-24 01:41:41', 'Active'),
(438, 47, 9, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-24 01:42:24', '2018-10-24 01:42:24', 'Active'),
(439, 48, 9, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '1500.00', NULL, '2018-10-24 01:42:59', '2018-10-24 01:42:59', 'Active'),
(440, 49, 9, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-24 01:43:33', '2018-10-24 01:43:33', 'Active'),
(441, 50, 9, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-24 01:44:16', '2018-10-24 01:44:16', 'Active'),
(442, 51, 9, 5, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-24 01:44:50', '2018-10-24 01:44:50', 'Active'),
(443, 34, 9, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '9800.00', '0.00', NULL, '2018-10-24 01:45:20', '2018-10-24 01:45:20', 'Active'),
(444, 35, 9, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '9800.00', '0.00', NULL, '2018-10-24 01:45:36', '2018-10-24 01:45:36', 'Active'),
(445, 37, 9, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 01:45:48', '2018-10-24 01:45:48', 'Active'),
(446, 38, 9, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 01:46:01', '2018-10-24 01:46:01', 'Active'),
(447, 40, 9, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-24 01:46:15', '2018-10-24 01:46:15', 'Active'),
(448, 42, 9, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-24 01:46:27', '2018-10-24 01:46:27', 'Active'),
(449, 43, 9, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 01:46:44', '2018-10-24 01:46:44', 'Active'),
(450, 45, 9, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 01:46:57', '2018-10-24 01:46:57', 'Active'),
(451, 46, 9, 5, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-24 01:47:26', '2018-10-24 01:47:26', 'Active'),
(452, 47, 9, 5, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-24 01:47:37', '2018-10-24 01:47:37', 'Active'),
(453, 49, 9, 5, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-24 01:48:05', '2018-10-24 01:48:05', 'Active'),
(454, 50, 9, 5, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-24 01:48:17', '2018-10-24 01:48:17', 'Active'),
(455, 36, 9, 5, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '9800.00', '-19400.00', 2, '2018-10-24 01:50:37', '2018-10-24 01:50:37', 'Active'),
(456, 39, 9, 5, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '4700.00', '-11800.00', 2, '2018-10-24 01:50:37', '2018-10-24 01:50:37', 'Active'),
(457, 48, 9, 5, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-8900.00', 2, '2018-10-24 01:50:37', '2018-10-24 01:50:37', 'Active'),
(458, 41, 9, 5, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-8900.00', 1, '2018-10-24 01:50:55', '2018-10-24 01:50:55', 'Active'),
(459, 44, 9, 5, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '4700.00', '-7100.00', 1, '2018-10-24 01:50:56', '2018-10-24 01:50:56', 'Active'),
(460, 51, 9, 5, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-24 01:51:26', '2018-10-24 01:51:26', 'Active'),
(461, 34, 10, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '2600.00', NULL, '2018-10-24 02:17:46', '2018-10-24 02:17:46', 'Active'),
(462, 35, 10, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '2600.00', NULL, '2018-10-24 02:18:06', '2018-10-24 02:18:06', 'Active'),
(463, 36, 10, 5, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-19400.00', '-16800.00', NULL, '2018-10-24 02:18:22', '2018-10-24 02:18:22', 'Active'),
(464, 34, 10, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '2600.00', '0.00', NULL, '2018-10-24 02:18:47', '2018-10-24 02:18:47', 'Active'),
(465, 35, 10, 5, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '2600.00', '0.00', NULL, '2018-10-24 02:18:58', '2018-10-24 02:18:58', 'Active'),
(466, 36, 10, 5, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '2600.00', '-19400.00', 2, '2018-10-24 02:20:12', '2018-10-24 02:20:12', 'Active'),
(467, 52, 8, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-10-24 03:13:30', '2018-10-24 03:13:30', 'Active'),
(468, 53, 8, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-10-24 03:14:08', '2018-10-24 03:14:08', 'Active'),
(469, 54, 8, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-10-24 03:14:46', '2018-10-24 03:14:46', 'Active'),
(470, 54, 8, 6, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '0.00', 1, '2018-10-24 03:14:46', '2018-10-24 03:14:46', 'Active'),
(471, 55, 8, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-24 03:15:27', '2018-10-24 03:15:27', 'Active'),
(472, 55, 8, 6, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7100.00', '0.00', 1, '2018-10-24 03:15:27', '2018-10-24 03:15:27', 'Active'),
(473, 56, 8, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-24 03:16:13', '2018-10-24 03:16:13', 'Active'),
(474, 57, 8, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2018-10-24 03:16:47', '2018-10-24 03:16:47', 'Active'),
(475, 34, 8, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '8600.00', NULL, '2018-10-24 03:17:20', '2018-10-24 03:17:20', 'Active'),
(476, 35, 8, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '8600.00', NULL, '2018-10-24 03:17:44', '2018-10-24 03:17:44', 'Active'),
(477, 36, 8, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-19400.00', '-10800.00', NULL, '2018-10-24 03:18:07', '2018-10-24 03:18:07', 'Active'),
(478, 37, 8, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-24 03:18:45', '2018-10-24 03:18:45', 'Active'),
(479, 38, 8, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-24 03:19:07', '2018-10-24 03:19:07', 'Active'),
(480, 39, 8, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-11800.00', '-5300.00', NULL, '2018-10-24 03:19:50', '2018-10-24 03:19:50', 'Active'),
(481, 40, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10700.00', NULL, '2018-10-24 03:20:15', '2018-10-24 03:20:15', 'Active'),
(482, 41, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '1800.00', NULL, '2018-10-24 03:20:40', '2018-10-24 03:20:40', 'Active'),
(483, 42, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10700.00', NULL, '2018-10-24 03:21:06', '2018-10-24 03:21:06', 'Active'),
(484, 43, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 03:21:32', '2018-10-24 03:21:32', 'Active'),
(485, 44, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-2400.00', NULL, '2018-10-24 03:21:52', '2018-10-24 03:21:52', 'Active'),
(486, 45, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 03:22:17', '2018-10-24 03:22:17', 'Active'),
(487, 46, 8, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2018-10-24 03:22:43', '2018-10-24 03:22:43', 'Active'),
(488, 47, 8, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2018-10-24 03:23:16', '2018-10-24 03:23:16', 'Active'),
(489, 48, 8, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '2400.00', NULL, '2018-10-24 03:23:42', '2018-10-24 03:23:42', 'Active'),
(490, 49, 8, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6200.00', NULL, '2018-10-24 03:24:13', '2018-10-24 03:24:13', 'Active'),
(491, 50, 8, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6200.00', NULL, '2018-10-24 03:24:40', '2018-10-24 03:24:40', 'Active'),
(492, 51, 8, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6200.00', NULL, '2018-10-24 03:25:16', '2018-10-24 03:25:16', 'Active'),
(493, 34, 8, 6, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '8600.00', '0.00', NULL, '2018-10-24 03:27:17', '2018-10-24 03:27:17', 'Active'),
(494, 35, 8, 6, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '8600.00', '0.00', NULL, '2018-10-24 03:27:31', '2018-10-24 03:27:31', 'Active'),
(495, 37, 8, 6, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-24 03:27:42', '2018-10-24 03:27:42', 'Active'),
(496, 38, 8, 6, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-24 03:27:53', '2018-10-24 03:27:53', 'Active'),
(497, 40, 8, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '10700.00', '0.00', NULL, '2018-10-24 03:28:20', '2018-10-24 03:28:20', 'Active'),
(498, 42, 8, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '10700.00', '0.00', NULL, '2018-10-24 03:28:33', '2018-10-24 03:28:33', 'Active'),
(499, 43, 8, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 03:28:45', '2018-10-24 03:28:45', 'Active'),
(500, 45, 8, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 03:28:59', '2018-10-24 03:28:59', 'Active'),
(501, 46, 8, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2018-10-24 03:29:12', '2018-10-24 03:29:12', 'Active'),
(502, 47, 8, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2018-10-24 03:29:24', '2018-10-24 03:29:24', 'Active'),
(503, 49, 8, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '6200.00', '0.00', NULL, '2018-10-24 03:29:38', '2018-10-24 03:29:38', 'Active'),
(504, 50, 8, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '6200.00', '0.00', NULL, '2018-10-24 03:29:49', '2018-10-24 03:29:49', 'Active'),
(505, 51, 8, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '6200.00', '0.00', NULL, '2018-10-24 03:30:01', '2018-10-24 03:30:01', 'Active'),
(506, 52, 8, 6, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8900.00', '0.00', NULL, '2018-10-24 03:30:15', '2018-10-24 03:30:15', 'Active'),
(507, 53, 8, 6, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8900.00', '0.00', NULL, '2018-10-24 03:30:27', '2018-10-24 03:30:27', 'Active'),
(508, 56, 8, 6, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2018-10-24 03:30:41', '2018-10-24 03:30:41', 'Active'),
(509, 57, 8, 6, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2018-10-24 03:30:56', '2018-10-24 03:30:56', 'Active'),
(510, 36, 8, 6, 'Fourth Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8600.00', '-19400.00', 2, '2018-10-24 03:31:50', '2018-10-24 03:31:50', 'Active'),
(511, 39, 8, 6, 'Fourth Year', 'SCHOLARSHIP PAYMENT', 'Payment', '6500.00', '-11800.00', 2, '2018-10-24 03:31:51', '2018-10-24 03:31:51', 'Active'),
(512, 48, 8, 6, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '11300.00', '-8900.00', 2, '2018-10-24 03:31:51', '2018-10-24 03:31:51', 'Active'),
(513, 41, 8, 6, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10700.00', '-8900.00', 1, '2018-10-24 03:36:26', '2018-10-24 03:36:26', 'Active'),
(514, 44, 8, 6, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '4700.00', '-7100.00', 1, '2018-10-24 03:36:27', '2018-10-24 03:36:27', 'Active'),
(515, 54, 8, 6, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '-8900.00', 1, '2018-10-24 03:36:27', '2018-10-24 03:36:27', 'Active'),
(516, 55, 8, 6, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7100.00', '-7100.00', 1, '2018-10-24 03:36:27', '2018-10-24 03:36:27', 'Active'),
(517, 34, 9, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3800.00', NULL, '2018-10-24 04:28:24', '2018-10-24 04:28:24', 'Active'),
(518, 35, 9, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3800.00', NULL, '2018-10-24 04:28:40', '2018-10-24 04:28:40', 'Active'),
(519, 36, 9, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-19400.00', '-15600.00', NULL, '2018-10-24 04:28:57', '2018-10-24 04:28:57', 'Active'),
(520, 37, 9, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '1700.00', NULL, '2018-10-24 04:29:18', '2018-10-24 04:29:18', 'Active'),
(521, 38, 9, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '1700.00', NULL, '2018-10-24 04:29:35', '2018-10-24 04:29:35', 'Active'),
(522, 39, 9, 6, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-11800.00', '-10100.00', NULL, '2018-10-24 04:30:14', '2018-10-24 04:30:14', 'Active'),
(523, 40, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9800.00', NULL, '2018-10-24 04:30:45', '2018-10-24 04:30:45', 'Active'),
(524, 41, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '900.00', NULL, '2018-10-24 04:31:14', '2018-10-24 04:31:14', 'Active'),
(525, 42, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9800.00', NULL, '2018-10-24 04:31:45', '2018-10-24 04:31:45', 'Active'),
(526, 43, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 04:32:18', '2018-10-24 04:32:18', 'Active'),
(527, 44, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-2400.00', NULL, '2018-10-24 04:32:37', '2018-10-24 04:32:37', 'Active'),
(528, 45, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 04:32:56', '2018-10-24 04:32:56', 'Active'),
(529, 46, 9, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-24 04:33:44', '2018-10-24 04:33:44', 'Active'),
(530, 47, 9, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-24 04:34:04', '2018-10-24 04:34:04', 'Active'),
(531, 48, 9, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '1500.00', NULL, '2018-10-24 04:34:29', '2018-10-24 04:34:29', 'Active'),
(532, 49, 9, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 04:35:05', '2018-10-24 04:35:05', 'Active'),
(533, 51, 9, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 04:36:10', '2018-10-24 04:36:10', 'Active'),
(534, 52, 9, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-24 04:36:50', '2018-10-24 04:36:50', 'Active'),
(535, 53, 9, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-24 04:37:24', '2018-10-24 04:37:24', 'Active'),
(536, 54, 9, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '1500.00', NULL, '2018-10-24 04:38:00', '2018-10-24 04:38:00', 'Active'),
(537, 55, 9, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-600.00', NULL, '2018-10-24 04:38:41', '2018-10-24 04:38:41', 'Active'),
(538, 56, 9, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-24 04:39:29', '2018-10-24 04:39:29', 'Active'),
(539, 57, 9, 6, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-24 04:40:07', '2018-10-24 04:40:07', 'Active'),
(540, 34, 9, 6, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '3800.00', '0.00', NULL, '2018-10-24 04:40:32', '2018-10-24 04:40:32', 'Active'),
(541, 35, 9, 6, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '3800.00', '0.00', NULL, '2018-10-24 04:40:45', '2018-10-24 04:40:45', 'Active'),
(542, 37, 9, 6, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '1700.00', '0.00', NULL, '2018-10-24 04:40:57', '2018-10-24 04:40:57', 'Active'),
(543, 38, 9, 6, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '1700.00', '0.00', NULL, '2018-10-24 04:41:09', '2018-10-24 04:41:09', 'Active'),
(544, 40, 9, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '9800.00', '0.00', NULL, '2018-10-24 04:41:31', '2018-10-24 04:41:31', 'Active'),
(545, 42, 9, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '9800.00', '0.00', NULL, '2018-10-24 04:41:44', '2018-10-24 04:41:44', 'Active'),
(546, 43, 9, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 04:41:55', '2018-10-24 04:41:55', 'Active'),
(547, 45, 9, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 04:42:12', '2018-10-24 04:42:12', 'Active'),
(548, 46, 9, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-24 04:42:33', '2018-10-24 04:42:33', 'Active'),
(549, 47, 9, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-24 04:42:50', '2018-10-24 04:42:50', 'Active'),
(550, 49, 9, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 04:43:06', '2018-10-24 04:43:06', 'Active'),
(551, 51, 9, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 04:43:19', '2018-10-24 04:43:19', 'Active'),
(552, 52, 9, 6, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-24 04:43:31', '2018-10-24 04:43:31', 'Active'),
(553, 53, 9, 6, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-24 04:43:44', '2018-10-24 04:43:44', 'Active'),
(554, 56, 9, 6, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-24 04:43:59', '2018-10-24 04:43:59', 'Active'),
(555, 57, 9, 6, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-24 04:44:09', '2018-10-24 04:44:09', 'Active'),
(556, 36, 9, 6, 'Fourth Year', 'SCHOLARSHIP PAYMENT', 'Payment', '3800.00', '-19400.00', 2, '2018-10-24 04:45:16', '2018-10-24 04:45:16', 'Active'),
(557, 39, 9, 6, 'Fourth Year', 'SCHOLARSHIP PAYMENT', 'Payment', '1700.00', '-11800.00', 2, '2018-10-24 04:45:16', '2018-10-24 04:45:16', 'Active'),
(558, 48, 9, 6, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-8900.00', 2, '2018-10-24 04:45:16', '2018-10-24 04:45:16', 'Active'),
(559, 41, 9, 6, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '9800.00', '-8900.00', 1, '2018-10-24 04:45:42', '2018-10-24 04:45:42', 'Active'),
(560, 44, 9, 6, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '4700.00', '-7100.00', 1, '2018-10-24 04:45:42', '2018-10-24 04:45:42', 'Active'),
(561, 54, 9, 6, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-8900.00', 1, '2018-10-24 04:45:42', '2018-10-24 04:45:42', 'Active'),
(562, 55, 9, 6, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '6500.00', '-7100.00', 1, '2018-10-24 04:45:43', '2018-10-24 04:45:43', 'Active'),
(563, 50, 9, 6, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-24 05:03:02', '2018-10-24 05:03:02', 'Active'),
(564, 40, 10, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '2600.00', NULL, '2018-10-24 05:13:44', '2018-10-24 05:13:44', 'Active'),
(565, 41, 10, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '-6300.00', NULL, '2018-10-24 05:14:01', '2018-10-24 05:14:01', 'Active'),
(566, 42, 10, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '2600.00', NULL, '2018-10-24 05:14:18', '2018-10-24 05:14:18', 'Active'),
(567, 41, 10, 6, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '2600.00', '-8900.00', 1, '2018-10-24 05:15:58', '2018-10-24 05:15:58', 'Active'),
(568, 40, 10, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '2600.00', '0.00', NULL, '2018-10-24 05:16:32', '2018-10-24 05:16:32', 'Active'),
(569, 42, 10, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '2600.00', '0.00', NULL, '2018-10-24 05:16:45', '2018-10-24 05:16:45', 'Active'),
(570, 50, 10, 6, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-24 05:17:19', '2018-10-24 05:17:19', 'Active'),
(571, 58, 8, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2019-02-04 23:11:15', '2019-02-04 23:11:15', 'Active'),
(572, 58, 8, 7, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '0.00', 1, '2019-02-04 23:11:15', '2019-02-04 23:11:15', 'Active'),
(573, 59, 8, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2019-02-04 23:12:08', '2019-02-04 23:12:08', 'Active'),
(574, 60, 8, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2019-02-04 23:13:47', '2019-02-04 23:13:47', 'Active'),
(575, 61, 8, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2019-02-04 23:27:46', '2019-02-04 23:27:46', 'Active'),
(576, 61, 8, 7, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7100.00', '0.00', 1, '2019-02-04 23:27:46', '2019-02-04 23:27:46', 'Active'),
(577, 62, 8, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2019-02-04 23:32:05', '2019-02-04 23:32:05', 'Active'),
(578, 63, 8, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7100.00', '7100.00', NULL, '2019-02-04 23:32:49', '2019-02-04 23:32:49', 'Active'),
(579, 40, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '8600.00', NULL, '2019-02-04 23:33:52', '2019-02-04 23:33:52', 'Active'),
(580, 41, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '-300.00', NULL, '2019-02-04 23:34:19', '2019-02-04 23:34:19', 'Active'),
(581, 42, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '8600.00', NULL, '2019-02-04 23:34:47', '2019-02-04 23:34:47', 'Active'),
(582, 43, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2019-02-04 23:35:25', '2019-02-04 23:35:25', 'Active'),
(583, 44, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-600.00', NULL, '2019-02-04 23:35:49', '2019-02-04 23:35:49', 'Active'),
(584, 45, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2019-02-04 23:36:20', '2019-02-04 23:36:20', 'Active'),
(585, 46, 8, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10700.00', NULL, '2019-02-04 23:36:54', '2019-02-04 23:36:54', 'Active'),
(586, 47, 8, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10700.00', NULL, '2019-02-04 23:37:25', '2019-02-04 23:37:25', 'Active'),
(587, 48, 8, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '1800.00', NULL, '2019-02-04 23:37:56', '2019-02-04 23:37:56', 'Active'),
(588, 49, 8, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2019-02-04 23:38:23', '2019-02-04 23:38:23', 'Active'),
(589, 50, 8, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2019-02-04 23:38:52', '2019-02-04 23:38:52', 'Active'),
(590, 51, 8, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2019-02-04 23:39:17', '2019-02-04 23:39:17', 'Active'),
(591, 52, 8, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2019-02-04 23:39:49', '2019-02-04 23:39:49', 'Active'),
(592, 53, 8, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2019-02-04 23:40:25', '2019-02-04 23:40:25', 'Active'),
(593, 54, 8, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '2400.00', NULL, '2019-02-04 23:40:54', '2019-02-04 23:40:54', 'Active'),
(594, 55, 8, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-900.00', NULL, '2019-02-04 23:41:45', '2019-02-04 23:41:45', 'Active'),
(595, 56, 8, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6200.00', NULL, '2019-02-04 23:42:14', '2019-02-04 23:42:14', 'Active'),
(596, 57, 8, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6200.00', NULL, '2019-02-04 23:42:48', '2019-02-04 23:42:48', 'Active'),
(597, 39, 8, 7, 'Fourth Year', 'OFFSET', 'Assessment', '-11800.00', '0.00', NULL, '2019-02-04 23:44:21', '2019-02-04 23:44:21', 'Active'),
(598, 36, 8, 7, 'Fourth Year', 'OFFSET', 'Assessment', '-19400.00', '0.00', NULL, '2019-02-04 23:44:35', '2019-02-04 23:44:35', 'Active'),
(599, 40, 8, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '8600.00', '0.00', NULL, '2019-02-04 23:44:50', '2019-02-04 23:44:50', 'Active'),
(600, 42, 8, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '8600.00', '0.00', NULL, '2019-02-04 23:45:05', '2019-02-04 23:45:05', 'Active'),
(601, 43, 8, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2019-02-04 23:45:18', '2019-02-04 23:45:18', 'Active'),
(602, 45, 8, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2019-02-04 23:45:37', '2019-02-04 23:45:37', 'Active'),
(603, 46, 8, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '10700.00', '0.00', NULL, '2019-02-04 23:45:52', '2019-02-04 23:45:52', 'Active'),
(604, 47, 8, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '10700.00', '0.00', NULL, '2019-02-04 23:46:03', '2019-02-04 23:46:03', 'Active'),
(605, 49, 8, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2019-02-04 23:46:37', '2019-02-04 23:46:37', 'Active'),
(606, 50, 8, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2019-02-04 23:46:51', '2019-02-04 23:46:51', 'Active'),
(607, 51, 8, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2019-02-04 23:47:04', '2019-02-04 23:47:04', 'Active'),
(608, 52, 8, 7, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2019-02-04 23:47:17', '2019-02-04 23:47:17', 'Active'),
(609, 53, 8, 7, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2019-02-04 23:47:28', '2019-02-04 23:47:28', 'Active'),
(610, 54, 8, 7, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '2400.00', '0.00', NULL, '2019-02-04 23:47:53', '2019-02-04 23:47:53', 'Active'),
(611, 48, 8, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '1800.00', '0.00', NULL, '2019-02-04 23:48:12', '2019-02-04 23:48:12', 'Active'),
(612, 56, 8, 7, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '6200.00', '0.00', NULL, '2019-02-04 23:48:26', '2019-02-04 23:48:26', 'Active'),
(613, 57, 8, 7, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '6200.00', '0.00', NULL, '2019-02-04 23:48:40', '2019-02-04 23:48:40', 'Active'),
(614, 59, 8, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8900.00', '0.00', NULL, '2019-02-04 23:48:56', '2019-02-04 23:48:56', 'Active'),
(615, 60, 8, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8900.00', '0.00', NULL, '2019-02-04 23:49:08', '2019-02-04 23:49:08', 'Active'),
(616, 62, 8, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2019-02-04 23:49:21', '2019-02-04 23:49:21', 'Active'),
(617, 63, 8, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7100.00', '0.00', NULL, '2019-02-04 23:49:32', '2019-02-04 23:49:32', 'Active'),
(618, 41, 8, 7, 'Fourth Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8600.00', '-8900.00', 1, '2019-02-04 23:52:23', '2019-02-04 23:52:23', 'Active'),
(619, 44, 8, 7, 'Fourth Year', 'SCHOLARSHIP PAYMENT', 'Payment', '6500.00', '-7100.00', 1, '2019-02-04 23:52:23', '2019-02-04 23:52:23', 'Active'),
(620, 54, 8, 7, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '11300.00', '-11300.00', 1, '2019-02-04 23:52:23', '2019-02-04 23:52:23', 'Active'),
(621, 55, 8, 7, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '6200.00', '-7100.00', 1, '2019-02-04 23:52:23', '2019-02-04 23:52:23', 'Active'),
(622, 52, 9, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2019-02-05 10:49:37', '2019-02-05 10:49:37', 'Active'),
(623, 53, 9, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2019-02-05 10:50:03', '2019-02-05 10:50:03', 'Active'),
(624, 54, 9, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-11300.00', '-900.00', NULL, '2019-02-05 10:50:31', '2019-02-05 10:50:31', 'Active'),
(625, 55, 9, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-2400.00', NULL, '2019-02-05 10:50:53', '2019-02-05 10:50:53', 'Active'),
(626, 56, 9, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2019-02-05 10:51:14', '2019-02-05 10:51:14', 'Active'),
(627, 57, 9, 7, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2019-02-05 10:51:32', '2019-02-05 10:51:32', 'Active'),
(628, 46, 9, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9800.00', NULL, '2019-02-05 10:52:08', '2019-02-05 10:52:08', 'Active'),
(629, 47, 9, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9800.00', NULL, '2019-02-05 10:52:31', '2019-02-05 10:52:31', 'Active'),
(630, 48, 9, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9800.00', NULL, '2019-02-05 10:52:51', '2019-02-05 10:52:51', 'Active'),
(631, 49, 9, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2019-02-05 10:53:13', '2019-02-05 10:53:13', 'Active'),
(632, 50, 9, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2019-02-05 10:53:38', '2019-02-05 10:53:38', 'Active'),
(633, 51, 9, 7, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2019-02-05 10:53:59', '2019-02-05 10:53:59', 'Active'),
(634, 40, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3800.00', NULL, '2019-02-05 10:55:19', '2019-02-05 10:55:19', 'Active'),
(635, 41, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-8900.00', '-5100.00', NULL, '2019-02-05 10:55:35', '2019-02-05 10:55:35', 'Active'),
(636, 42, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3800.00', NULL, '2019-02-05 10:55:50', '2019-02-05 10:55:50', 'Active'),
(637, 43, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '1700.00', NULL, '2019-02-05 10:56:09', '2019-02-05 10:56:09', 'Active'),
(638, 44, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-5400.00', NULL, '2019-02-05 10:56:25', '2019-02-05 10:56:25', 'Active'),
(639, 45, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '1700.00', NULL, '2019-02-05 10:56:41', '2019-02-05 10:56:41', 'Active'),
(640, 40, 9, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '3800.00', '0.00', NULL, '2019-02-05 10:57:30', '2019-02-05 10:57:30', 'Active'),
(641, 42, 9, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '3800.00', '0.00', NULL, '2019-02-05 10:57:43', '2019-02-05 10:57:43', 'Active'),
(642, 43, 9, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '1700.00', '0.00', NULL, '2019-02-05 10:57:56', '2019-02-05 10:57:56', 'Active'),
(643, 45, 9, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '1700.00', '0.00', NULL, '2019-02-05 10:58:07', '2019-02-05 10:58:07', 'Active'),
(644, 46, 9, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '9800.00', '0.00', NULL, '2019-02-05 10:58:26', '2019-02-05 10:58:26', 'Active'),
(645, 47, 9, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '9800.00', '0.00', NULL, '2019-02-05 10:58:36', '2019-02-05 10:58:36', 'Active'),
(646, 48, 9, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '9800.00', '0.00', NULL, '2019-02-05 10:58:45', '2019-02-05 10:58:45', 'Active'),
(647, 49, 9, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2019-02-05 10:58:59', '2019-02-05 10:58:59', 'Active');
INSERT INTO `t_payable_history` (`Payable_History_ID`, `Payable_History_Student_Account_ID`, `Payable_History_Semester_ID`, `Payable_History_AcademicYearID`, `Payable_History_Year_Level`, `Payable_History_Description`, `Payable_History_Type`, `Payable_History_Amount`, `Payable_History_Balance`, `Payable_History_ScholarshipID`, `Payable_History_Date_Added`, `Payable_History_Date_Updated`, `Payable_History_Display_Status`) VALUES
(648, 50, 9, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2019-02-05 10:59:12', '2019-02-05 10:59:12', 'Active'),
(649, 51, 9, 7, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2019-02-05 10:59:22', '2019-02-05 10:59:22', 'Active'),
(650, 52, 9, 7, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2019-02-05 10:59:34', '2019-02-05 10:59:34', 'Active'),
(651, 53, 9, 7, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2019-02-05 10:59:45', '2019-02-05 10:59:45', 'Active'),
(652, 56, 9, 7, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2019-02-05 11:00:00', '2019-02-05 11:00:00', 'Active'),
(653, 57, 9, 7, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2019-02-05 11:00:10', '2019-02-05 11:00:10', 'Active'),
(654, 41, 9, 7, 'Fourth Year', 'SCHOLARSHIP PAYMENT', 'Payment', '3800.00', '-8900.00', 2, '2019-02-05 11:01:06', '2019-02-05 11:01:06', 'Active'),
(655, 44, 9, 7, 'Fourth Year', 'SCHOLARSHIP PAYMENT', 'Payment', '1700.00', '-7100.00', 2, '2019-02-05 11:01:06', '2019-02-05 11:01:06', 'Active'),
(656, 54, 9, 7, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-11300.00', 2, '2019-02-05 11:01:06', '2019-02-05 11:01:06', 'Active'),
(657, 55, 9, 7, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '4700.00', '-7100.00', 2, '2019-02-05 11:01:07', '2019-02-05 11:01:07', 'Active'),
(658, 58, 9, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2019-02-05 11:32:33', '2019-02-05 11:32:33', 'Active'),
(659, 59, 9, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2019-02-05 11:33:09', '2019-02-05 11:33:09', 'Active'),
(660, 60, 9, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2019-02-05 11:33:45', '2019-02-05 11:33:45', 'Active'),
(661, 61, 9, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2019-02-05 11:34:34', '2019-02-05 11:34:34', 'Active'),
(662, 62, 9, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2019-02-05 11:36:21', '2019-02-05 11:36:21', 'Active'),
(663, 63, 9, 7, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2019-02-05 11:37:04', '2019-02-05 11:37:04', 'Active'),
(664, 58, 9, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2019-02-05 11:37:43', '2019-02-05 11:37:43', 'Active'),
(665, 59, 9, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2019-02-05 11:37:55', '2019-02-05 11:37:55', 'Active'),
(666, 60, 9, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2019-02-05 11:38:09', '2019-02-05 11:38:09', 'Active'),
(667, 61, 9, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2019-02-05 11:38:19', '2019-02-05 11:38:19', 'Active'),
(668, 62, 9, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2019-02-05 11:38:29', '2019-02-05 11:38:29', 'Active'),
(669, 63, 9, 7, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2019-02-05 11:38:43', '2019-02-05 11:38:43', 'Active'),
(670, 64, 8, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7800.00', '7800.00', NULL, '2019-02-13 22:48:41', '2019-02-13 22:48:41', 'Active'),
(671, 64, 8, 8, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7800.00', '0.00', 1, '2019-02-13 22:48:41', '2019-02-13 22:48:41', 'Active'),
(672, 65, 8, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7800.00', '7800.00', NULL, '2019-02-13 22:50:11', '2019-02-13 22:50:11', 'Active'),
(673, 66, 8, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7800.00', '7800.00', NULL, '2019-02-13 22:51:08', '2019-02-13 22:51:08', 'Active'),
(674, 67, 8, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '6000.00', '6000.00', NULL, '2019-02-13 22:52:11', '2019-02-13 22:52:11', 'Active'),
(675, 67, 8, 8, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '6000.00', '0.00', 1, '2019-02-13 22:52:11', '2019-02-13 22:52:11', 'Active'),
(676, 68, 8, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '6000.00', '6000.00', NULL, '2019-02-13 22:52:46', '2019-02-13 22:52:46', 'Active'),
(677, 69, 8, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '6000.00', '6000.00', NULL, '2019-02-13 22:53:18', '2019-02-13 22:53:18', 'Active'),
(678, 46, 8, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '7500.00', NULL, '2019-02-13 23:09:59', '2019-02-13 23:09:59', 'Active'),
(679, 47, 8, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '7500.00', NULL, '2019-02-13 23:10:49', '2019-02-13 23:10:49', 'Active'),
(680, 48, 8, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '7500.00', NULL, '2019-02-13 23:11:10', '2019-02-13 23:11:10', 'Active'),
(681, 49, 8, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5400.00', NULL, '2019-02-13 23:11:47', '2019-02-13 23:11:47', 'Active'),
(682, 50, 8, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5400.00', NULL, '2019-02-13 23:12:16', '2019-02-13 23:12:16', 'Active'),
(683, 52, 8, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9600.00', NULL, '2019-02-13 23:12:44', '2019-02-13 23:12:44', 'Active'),
(684, 53, 8, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9600.00', NULL, '2019-02-13 23:13:17', '2019-02-13 23:13:17', 'Active'),
(685, 54, 8, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-11300.00', '-1700.00', NULL, '2019-02-13 23:13:45', '2019-02-13 23:13:45', 'Active'),
(686, 55, 8, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7100.00', '-3500.00', NULL, '2019-02-13 23:14:08', '2019-02-13 23:14:08', 'Active'),
(687, 56, 8, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3600.00', NULL, '2019-02-13 23:14:27', '2019-02-13 23:14:27', 'Active'),
(688, 57, 8, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3600.00', NULL, '2019-02-13 23:14:49', '2019-02-13 23:14:49', 'Active'),
(689, 58, 8, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10200.00', NULL, '2019-02-13 23:15:40', '2019-02-13 23:15:40', 'Active'),
(690, 59, 8, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10200.00', NULL, '2019-02-13 23:16:06', '2019-02-13 23:16:06', 'Active'),
(691, 60, 8, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10200.00', NULL, '2019-02-13 23:16:37', '2019-02-13 23:16:37', 'Active'),
(692, 61, 8, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5100.00', NULL, '2019-02-13 23:17:10', '2019-02-13 23:17:10', 'Active'),
(693, 62, 8, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5100.00', NULL, '2019-02-13 23:17:44', '2019-02-13 23:17:44', 'Active'),
(694, 63, 8, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5100.00', NULL, '2019-02-13 23:18:09', '2019-02-13 23:18:09', 'Active'),
(695, 41, 8, 8, 'Fourth Year', 'OFFSET', 'Assessment', '-8900.00', '0.00', NULL, '2019-02-13 23:22:16', '2019-02-13 23:22:16', 'Active'),
(696, 44, 8, 8, 'Fourth Year', 'OFFSET', 'Assessment', '-7100.00', '0.00', NULL, '2019-02-13 23:22:29', '2019-02-13 23:22:29', 'Active'),
(697, 46, 8, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '7500.00', '0.00', NULL, '2019-02-13 23:23:51', '2019-02-13 23:23:51', 'Active'),
(698, 47, 8, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '7500.00', '0.00', NULL, '2019-02-13 23:24:21', '2019-02-13 23:24:21', 'Active'),
(699, 48, 8, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '7500.00', '0.00', NULL, '2019-02-13 23:24:34', '2019-02-13 23:24:34', 'Active'),
(700, 49, 8, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '5400.00', '0.00', NULL, '2019-02-13 23:24:46', '2019-02-13 23:24:46', 'Active'),
(701, 50, 8, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '5400.00', '0.00', NULL, '2019-02-13 23:24:57', '2019-02-13 23:24:57', 'Active'),
(702, 52, 8, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '9600.00', '0.00', NULL, '2019-02-13 23:25:11', '2019-02-13 23:25:11', 'Active'),
(703, 53, 8, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '9600.00', '0.00', NULL, '2019-02-13 23:25:23', '2019-02-13 23:25:23', 'Active'),
(704, 56, 8, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '3600.00', '0.00', NULL, '2019-02-13 23:25:59', '2019-02-13 23:25:59', 'Active'),
(705, 57, 8, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '3600.00', '0.00', NULL, '2019-02-13 23:26:14', '2019-02-13 23:26:14', 'Active'),
(706, 58, 8, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10200.00', '0.00', NULL, '2019-02-13 23:26:29', '2019-02-13 23:26:29', 'Active'),
(707, 59, 8, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10200.00', '0.00', NULL, '2019-02-13 23:26:47', '2019-02-13 23:26:47', 'Active'),
(708, 60, 8, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10200.00', '0.00', NULL, '2019-02-13 23:26:59', '2019-02-13 23:26:59', 'Active'),
(709, 61, 8, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '5100.00', '0.00', NULL, '2019-02-13 23:27:13', '2019-02-13 23:27:13', 'Active'),
(710, 62, 8, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '5100.00', '0.00', NULL, '2019-02-13 23:27:25', '2019-02-13 23:27:25', 'Active'),
(711, 63, 8, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '5100.00', '0.00', NULL, '2019-02-13 23:27:41', '2019-02-13 23:27:41', 'Active'),
(712, 65, 8, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7800.00', '0.00', NULL, '2019-02-13 23:28:01', '2019-02-13 23:28:01', 'Active'),
(713, 66, 8, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7800.00', '0.00', NULL, '2019-02-13 23:28:14', '2019-02-13 23:28:14', 'Active'),
(714, 68, 8, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6000.00', '0.00', NULL, '2019-02-13 23:28:29', '2019-02-13 23:28:29', 'Active'),
(715, 69, 8, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6000.00', '0.00', NULL, '2019-02-13 23:28:41', '2019-02-13 23:28:41', 'Active'),
(716, 51, 8, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5400.00', NULL, '2019-02-14 14:17:00', '2019-02-14 14:17:00', 'Active'),
(717, 51, 8, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '5400.00', '0.00', NULL, '2019-02-14 14:17:26', '2019-02-14 14:17:26', 'Active'),
(718, 46, 9, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '2700.00', NULL, '2019-02-14 14:50:01', '2019-02-14 14:50:01', 'Active'),
(719, 47, 9, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '2700.00', NULL, '2019-02-14 14:50:21', '2019-02-14 14:50:21', 'Active'),
(720, 48, 9, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '2700.00', NULL, '2019-02-14 14:50:36', '2019-02-14 14:50:36', 'Active'),
(721, 49, 9, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '600.00', NULL, '2019-02-14 14:51:21', '2019-02-14 14:51:21', 'Active'),
(722, 50, 9, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '600.00', NULL, '2019-02-14 14:51:48', '2019-02-14 14:51:48', 'Active'),
(723, 51, 9, 8, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '600.00', NULL, '2019-02-14 14:52:04', '2019-02-14 14:52:04', 'Active'),
(724, 52, 9, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '8700.00', NULL, '2019-02-14 14:52:31', '2019-02-14 14:52:31', 'Active'),
(725, 53, 9, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '8700.00', NULL, '2019-02-14 14:52:51', '2019-02-14 14:52:51', 'Active'),
(726, 54, 9, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-1700.00', '7000.00', NULL, '2019-02-14 14:53:11', '2019-02-14 14:53:11', 'Active'),
(727, 55, 9, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-3500.00', '100.00', NULL, '2019-02-14 14:53:31', '2019-02-14 14:53:31', 'Active'),
(728, 56, 9, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3600.00', NULL, '2019-02-14 14:53:47', '2019-02-14 14:53:47', 'Active'),
(729, 57, 9, 8, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3600.00', NULL, '2019-02-14 14:54:11', '2019-02-14 14:54:11', 'Active'),
(730, 58, 9, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9300.00', NULL, '2019-02-14 14:54:36', '2019-02-14 14:54:36', 'Active'),
(731, 59, 9, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9300.00', NULL, '2019-02-14 14:55:10', '2019-02-14 14:55:10', 'Active'),
(732, 60, 9, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9300.00', NULL, '2019-02-14 14:55:30', '2019-02-14 14:55:30', 'Active'),
(733, 61, 9, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3600.00', NULL, '2019-02-14 14:55:57', '2019-02-14 14:55:57', 'Active'),
(734, 62, 9, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3600.00', NULL, '2019-02-14 14:56:23', '2019-02-14 14:56:23', 'Active'),
(735, 63, 9, 8, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3600.00', NULL, '2019-02-14 14:56:55', '2019-02-14 14:56:55', 'Active'),
(736, 64, 9, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9300.00', NULL, '2019-02-14 14:57:32', '2019-02-14 14:57:32', 'Active'),
(737, 65, 9, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9300.00', NULL, '2019-02-14 14:58:01', '2019-02-14 14:58:01', 'Active'),
(738, 66, 9, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9300.00', NULL, '2019-02-14 14:58:33', '2019-02-14 14:58:33', 'Active'),
(739, 67, 9, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5400.00', NULL, '2019-02-14 14:59:15', '2019-02-14 14:59:15', 'Active'),
(740, 68, 9, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5400.00', NULL, '2019-02-14 14:59:43', '2019-02-14 14:59:43', 'Active'),
(741, 69, 9, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5400.00', NULL, '2019-02-14 15:00:24', '2019-02-14 15:00:24', 'Active'),
(742, 46, 9, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '2700.00', '0.00', NULL, '2019-02-14 15:01:58', '2019-02-14 15:01:58', 'Active'),
(743, 47, 9, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '2700.00', '0.00', NULL, '2019-02-14 15:02:08', '2019-02-14 15:02:08', 'Active'),
(744, 48, 9, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '2700.00', '0.00', NULL, '2019-02-14 15:02:30', '2019-02-14 15:02:30', 'Active'),
(745, 49, 9, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '600.00', '0.00', NULL, '2019-02-14 15:02:45', '2019-02-14 15:02:45', 'Active'),
(746, 50, 9, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '600.00', '0.00', NULL, '2019-02-14 15:02:55', '2019-02-14 15:02:55', 'Active'),
(747, 51, 9, 8, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '600.00', '0.00', NULL, '2019-02-14 15:03:05', '2019-02-14 15:03:05', 'Active'),
(748, 52, 9, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '8700.00', '0.00', NULL, '2019-02-14 15:03:16', '2019-02-14 15:03:16', 'Active'),
(749, 53, 9, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '8700.00', '0.00', NULL, '2019-02-14 15:03:28', '2019-02-14 15:03:28', 'Active'),
(750, 54, 9, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '7000.00', '0.00', NULL, '2019-02-14 15:03:39', '2019-02-14 15:03:39', 'Active'),
(751, 55, 9, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '100.00', '0.00', NULL, '2019-02-14 15:03:50', '2019-02-14 15:03:50', 'Active'),
(752, 56, 9, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '3600.00', '0.00', NULL, '2019-02-14 15:04:01', '2019-02-14 15:04:01', 'Active'),
(753, 57, 9, 8, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '3600.00', '0.00', NULL, '2019-02-14 15:04:14', '2019-02-14 15:04:14', 'Active'),
(754, 58, 9, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '9300.00', '0.00', NULL, '2019-02-14 15:04:23', '2019-02-14 15:04:23', 'Active'),
(755, 59, 9, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '9300.00', '0.00', NULL, '2019-02-14 15:04:35', '2019-02-14 15:04:35', 'Active'),
(756, 60, 9, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '9300.00', '0.00', NULL, '2019-02-14 15:04:47', '2019-02-14 15:04:47', 'Active'),
(757, 61, 9, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '3600.00', '0.00', NULL, '2019-02-14 15:04:58', '2019-02-14 15:04:58', 'Active'),
(758, 62, 9, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '3600.00', '0.00', NULL, '2019-02-14 15:05:18', '2019-02-14 15:05:18', 'Active'),
(759, 63, 9, 8, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '3600.00', '0.00', NULL, '2019-02-14 15:05:36', '2019-02-14 15:05:36', 'Active'),
(760, 64, 9, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9300.00', '0.00', NULL, '2019-02-14 15:05:48', '2019-02-14 15:05:48', 'Active'),
(761, 65, 9, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9300.00', '0.00', NULL, '2019-02-14 15:06:00', '2019-02-14 15:06:00', 'Active'),
(762, 66, 9, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9300.00', '0.00', NULL, '2019-02-14 15:06:15', '2019-02-14 15:06:15', 'Active'),
(763, 67, 9, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '5400.00', '0.00', NULL, '2019-02-14 15:06:29', '2019-02-14 15:06:29', 'Active'),
(764, 68, 9, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '5400.00', '0.00', NULL, '2019-02-14 15:06:39', '2019-02-14 15:06:39', 'Active'),
(765, 69, 9, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '5400.00', '0.00', NULL, '2019-02-14 15:06:50', '2019-02-14 15:06:50', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `t_payment`
--

CREATE TABLE `t_payment` (
  `Payment_ID` int(11) NOT NULL,
  `Payment_Student_Account_ID` int(11) NOT NULL,
  `Payment_Balance` decimal(10,2) NOT NULL,
  `Payment_Display_Status` enum('Active','Inactive') NOT NULL,
  `Payment_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Payment_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_payment`
--

INSERT INTO `t_payment` (`Payment_ID`, `Payment_Student_Account_ID`, `Payment_Balance`, `Payment_Display_Status`, `Payment_Date_Added`, `Payment_Date_Updated`) VALUES
(34, 34, '0.00', 'Active', '2018-10-23 20:05:01', '2018-10-24 04:40:32'),
(35, 35, '0.00', 'Active', '2018-10-23 20:06:11', '2018-10-24 04:40:45'),
(36, 36, '0.00', 'Active', '2018-10-23 20:07:02', '2019-02-04 23:44:35'),
(37, 37, '0.00', 'Active', '2018-10-23 20:13:00', '2018-10-24 04:40:57'),
(38, 38, '0.00', 'Active', '2018-10-23 20:13:30', '2018-10-24 04:41:09'),
(39, 39, '0.00', 'Active', '2018-10-23 20:14:40', '2019-02-04 23:44:21'),
(40, 40, '0.00', 'Active', '2018-10-23 21:55:50', '2019-02-05 10:57:30'),
(41, 41, '0.00', 'Active', '2018-10-23 21:57:07', '2019-02-13 23:22:16'),
(42, 42, '0.00', 'Active', '2018-10-23 21:57:44', '2019-02-05 10:57:43'),
(43, 43, '0.00', 'Active', '2018-10-23 21:58:26', '2019-02-05 10:57:56'),
(44, 44, '0.00', 'Active', '2018-10-23 21:59:15', '2019-02-13 23:22:29'),
(45, 45, '0.00', 'Active', '2018-10-23 21:59:58', '2019-02-05 10:58:07'),
(46, 46, '0.00', 'Active', '2018-10-24 00:02:41', '2019-02-14 15:01:58'),
(47, 47, '0.00', 'Active', '2018-10-24 00:03:40', '2019-02-14 15:02:08'),
(48, 48, '0.00', 'Active', '2018-10-24 00:04:26', '2019-02-14 15:02:30'),
(49, 49, '0.00', 'Active', '2018-10-24 00:05:15', '2019-02-14 15:02:45'),
(50, 50, '0.00', 'Active', '2018-10-24 00:05:52', '2019-02-14 15:02:54'),
(51, 51, '0.00', 'Active', '2018-10-24 00:06:37', '2019-02-14 15:03:05'),
(52, 52, '0.00', 'Active', '2018-10-24 03:13:29', '2019-02-14 15:03:16'),
(53, 53, '0.00', 'Active', '2018-10-24 03:14:08', '2019-02-14 15:03:28'),
(54, 54, '0.00', 'Active', '2018-10-24 03:14:46', '2019-02-14 15:03:39'),
(55, 55, '0.00', 'Active', '2018-10-24 03:15:26', '2019-02-14 15:03:50'),
(56, 56, '0.00', 'Active', '2018-10-24 03:16:13', '2019-02-14 15:04:01'),
(57, 57, '0.00', 'Active', '2018-10-24 03:16:46', '2019-02-14 15:04:13'),
(58, 58, '0.00', 'Active', '2019-02-04 23:11:15', '2019-02-14 15:04:23'),
(59, 59, '0.00', 'Active', '2019-02-04 23:12:08', '2019-02-14 15:04:35'),
(60, 60, '0.00', 'Active', '2019-02-04 23:13:47', '2019-02-14 15:04:47'),
(61, 61, '0.00', 'Active', '2019-02-04 23:27:45', '2019-02-14 15:04:58'),
(62, 62, '0.00', 'Active', '2019-02-04 23:32:05', '2019-02-14 15:05:18'),
(63, 63, '0.00', 'Active', '2019-02-04 23:32:48', '2019-02-14 15:05:36'),
(64, 64, '0.00', 'Active', '2019-02-13 22:48:40', '2019-02-14 15:05:48'),
(65, 65, '0.00', 'Active', '2019-02-13 22:50:11', '2019-02-14 15:06:00'),
(66, 66, '0.00', 'Active', '2019-02-13 22:51:07', '2019-02-14 15:06:15'),
(67, 67, '0.00', 'Active', '2019-02-13 22:52:11', '2019-02-14 15:06:29'),
(68, 68, '0.00', 'Active', '2019-02-13 22:52:46', '2019-02-14 15:06:39'),
(69, 69, '0.00', 'Active', '2019-02-13 22:53:17', '2019-02-14 15:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `t_payment_history`
--

CREATE TABLE `t_payment_history` (
  `Payment_History_ID` int(11) NOT NULL,
  `Payment_History_Payment_ID` int(11) NOT NULL,
  `Payment_History_Paymount_Amount` int(11) NOT NULL,
  `Payment_History_Remaining_Balance` int(11) NOT NULL,
  `Payment_History_Display_Status` enum('Active','Inactive') NOT NULL,
  `Payment_History_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Payment_History_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_payment_log`
--

CREATE TABLE `t_payment_log` (
  `Payment_Log_ID` int(11) NOT NULL,
  `Payment_Log_StudentAccountID` int(11) NOT NULL,
  `Payment_Log_OR_Number` varchar(100) NOT NULL,
  `Payment_Log_SemesterID` int(11) NOT NULL,
  `Payment_Log_AcademicyYearID` int(11) NOT NULL,
  `Payment_Log_Paymount_Amount` decimal(10,2) NOT NULL,
  `Payment_Log_Remaining_Balance` decimal(10,2) NOT NULL,
  `Payment_Log_Type` enum('Offset','Payment') NOT NULL,
  `Payment_Log_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Payment_Log_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Payment_Log_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_payment_log`
--

INSERT INTO `t_payment_log` (`Payment_Log_ID`, `Payment_Log_StudentAccountID`, `Payment_Log_OR_Number`, `Payment_Log_SemesterID`, `Payment_Log_AcademicyYearID`, `Payment_Log_Paymount_Amount`, `Payment_Log_Remaining_Balance`, `Payment_Log_Type`, `Payment_Log_Display_Status`, `Payment_Log_Date_Added`, `Payment_Log_Date_Updated`) VALUES
(100, 34, '2018-00001-PA', 8, 2, '9000.00', '0.00', 'Payment', 'Active', '2018-10-23 20:18:39', '2018-10-23 20:18:39'),
(101, 35, '2018-00002-PA', 8, 2, '9000.00', '0.00', 'Payment', 'Active', '2018-10-23 20:19:12', '2018-10-23 20:19:12'),
(102, 37, '2018-00003-PA', 8, 2, '7100.00', '0.00', 'Payment', 'Active', '2018-10-23 20:19:37', '2018-10-23 20:19:37'),
(103, 38, '2018-00004-PA', 8, 2, '7100.00', '0.00', 'Payment', 'Active', '2018-10-23 20:19:53', '2018-10-23 20:19:53'),
(104, 34, '2018-00005-PA', 9, 2, '10400.00', '0.00', 'Payment', 'Active', '2018-10-23 21:09:00', '2018-10-23 21:09:00'),
(105, 35, '2018-00006-PA', 9, 2, '10400.00', '0.00', 'Payment', 'Active', '2018-10-23 21:09:21', '2018-10-23 21:09:21'),
(106, 37, '2018-00007-PA', 9, 2, '6500.00', '0.00', 'Payment', 'Active', '2018-10-23 21:09:43', '2018-10-23 21:09:43'),
(107, 38, '2018-00008-PA', 9, 2, '6500.00', '0.00', 'Payment', 'Active', '2018-10-23 21:09:54', '2018-10-23 21:09:54'),
(108, 34, '2018-00009-PA', 8, 1, '11300.00', '0.00', 'Payment', 'Active', '2018-10-23 22:06:57', '2018-10-23 22:06:57'),
(109, 35, '2018-00010-PA', 8, 1, '11300.00', '0.00', 'Payment', 'Active', '2018-10-23 22:07:12', '2018-10-23 22:07:12'),
(110, 37, '2018-00011-PA', 8, 1, '6200.00', '0.00', 'Payment', 'Active', '2018-10-23 22:07:29', '2018-10-23 22:07:29'),
(111, 38, '2018-00012-PA', 8, 1, '6200.00', '0.00', 'Payment', 'Active', '2018-10-23 22:07:42', '2018-10-23 22:07:42'),
(112, 40, '2018-00013-PA', 8, 1, '8900.00', '0.00', 'Payment', 'Active', '2018-10-23 22:07:56', '2018-10-23 22:07:56'),
(113, 42, '2018-00014-PA', 8, 1, '8900.00', '0.00', 'Payment', 'Active', '2018-10-23 22:08:09', '2018-10-23 22:08:09'),
(114, 43, '2018-00015-PA', 8, 1, '7100.00', '0.00', 'Payment', 'Active', '2018-10-23 22:08:27', '2018-10-23 22:08:27'),
(115, 45, '2018-00016-PA', 8, 1, '7100.00', '0.00', 'Payment', 'Active', '2018-10-23 22:08:40', '2018-10-23 22:08:40'),
(116, 34, '2018-00017-PA', 9, 1, '10400.00', '0.00', 'Payment', 'Active', '2018-10-23 22:59:31', '2018-10-23 22:59:31'),
(117, 35, '2018-00018-PA', 9, 1, '10400.00', '0.00', 'Payment', 'Active', '2018-10-23 22:59:43', '2018-10-23 22:59:43'),
(118, 37, '2018-00019-PA', 9, 1, '4700.00', '0.00', 'Payment', 'Active', '2018-10-23 22:59:55', '2018-10-23 22:59:55'),
(119, 38, '2018-00020-PA', 9, 1, '4700.00', '0.00', 'Payment', 'Active', '2018-10-23 23:00:05', '2018-10-23 23:00:05'),
(120, 40, '2018-00021-PA', 9, 1, '10400.00', '0.00', 'Payment', 'Active', '2018-10-23 23:00:21', '2018-10-23 23:00:21'),
(121, 42, '2018-00022-PA', 9, 1, '10400.00', '0.00', 'Payment', 'Active', '2018-10-23 23:00:35', '2018-10-23 23:00:35'),
(122, 43, '2018-00023-PA', 9, 1, '6500.00', '0.00', 'Payment', 'Active', '2018-10-23 23:00:48', '2018-10-23 23:00:48'),
(123, 45, '2018-00024-PA', 9, 1, '6500.00', '0.00', 'Payment', 'Active', '2018-10-23 23:01:01', '2018-10-23 23:01:01'),
(124, 34, '2018-00025-PA', 8, 5, '10700.00', '0.00', 'Payment', 'Active', '2018-10-24 00:16:14', '2018-10-24 00:16:14'),
(125, 35, '2018-00026-PA', 8, 5, '10700.00', '0.00', 'Payment', 'Active', '2018-10-24 00:16:30', '2018-10-24 00:16:30'),
(126, 37, '2018-00027-PA', 8, 5, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 00:16:40', '2018-10-24 00:16:40'),
(127, 38, '2018-00028-PA', 8, 5, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 00:16:53', '2018-10-24 00:16:53'),
(128, 40, '2018-00029-PA', 8, 5, '11300.00', '0.00', 'Payment', 'Active', '2018-10-24 00:17:07', '2018-10-24 00:17:07'),
(129, 42, '2018-00030-PA', 8, 5, '11300.00', '0.00', 'Payment', 'Active', '2018-10-24 00:17:21', '2018-10-24 00:17:21'),
(130, 43, '2018-00031-PA', 8, 5, '6200.00', '0.00', 'Payment', 'Active', '2018-10-24 00:17:34', '2018-10-24 00:17:34'),
(131, 45, '2018-00032-PA', 8, 5, '6200.00', '0.00', 'Payment', 'Active', '2018-10-24 00:17:47', '2018-10-24 00:17:47'),
(132, 46, '2018-00033-PA', 8, 5, '8900.00', '0.00', 'Payment', 'Active', '2018-10-24 00:18:06', '2018-10-24 00:18:06'),
(133, 47, '2018-00034-PA', 8, 5, '8900.00', '0.00', 'Payment', 'Active', '2018-10-24 00:18:18', '2018-10-24 00:18:18'),
(134, 49, '2018-00035-PA', 8, 5, '7100.00', '0.00', 'Payment', 'Active', '2018-10-24 00:18:34', '2018-10-24 00:18:34'),
(135, 50, '2018-00036-PA', 8, 5, '7100.00', '0.00', 'Payment', 'Active', '2018-10-24 00:18:50', '2018-10-24 00:18:50'),
(136, 34, '2018-00037-PA', 9, 5, '9800.00', '0.00', 'Payment', 'Active', '2018-10-24 01:45:20', '2018-10-24 01:45:20'),
(137, 35, '2018-00038-PA', 9, 5, '9800.00', '0.00', 'Payment', 'Active', '2018-10-24 01:45:36', '2018-10-24 01:45:36'),
(138, 37, '2018-00039-PA', 9, 5, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 01:45:48', '2018-10-24 01:45:48'),
(139, 38, '2018-00040-PA', 9, 5, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 01:46:01', '2018-10-24 01:46:01'),
(140, 40, '2018-00041-PA', 9, 5, '10400.00', '0.00', 'Payment', 'Active', '2018-10-24 01:46:15', '2018-10-24 01:46:15'),
(141, 42, '2018-00042-PA', 9, 5, '10400.00', '0.00', 'Payment', 'Active', '2018-10-24 01:46:27', '2018-10-24 01:46:27'),
(142, 43, '2018-00043-PA', 9, 5, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 01:46:44', '2018-10-24 01:46:44'),
(143, 45, '2018-00044-PA', 9, 5, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 01:46:57', '2018-10-24 01:46:57'),
(144, 46, '2018-00045-PA', 9, 5, '10400.00', '0.00', 'Payment', 'Active', '2018-10-24 01:47:26', '2018-10-24 01:47:26'),
(145, 47, '2018-00046-PA', 9, 5, '10400.00', '0.00', 'Payment', 'Active', '2018-10-24 01:47:37', '2018-10-24 01:47:37'),
(146, 49, '2018-00047-PA', 9, 5, '6500.00', '0.00', 'Payment', 'Active', '2018-10-24 01:48:05', '2018-10-24 01:48:05'),
(147, 50, '2018-00048-PA', 9, 5, '6500.00', '0.00', 'Payment', 'Active', '2018-10-24 01:48:17', '2018-10-24 01:48:17'),
(148, 51, '2018-00049-PA', 9, 5, '6500.00', '0.00', 'Payment', 'Active', '2018-10-24 01:51:26', '2018-10-24 01:51:26'),
(149, 34, '2018-00050-PA', 10, 5, '2600.00', '0.00', 'Payment', 'Active', '2018-10-24 02:18:47', '2018-10-24 02:18:47'),
(150, 35, '2018-00051-PA', 10, 5, '2600.00', '0.00', 'Payment', 'Active', '2018-10-24 02:18:58', '2018-10-24 02:18:58'),
(151, 34, '2018-00052-PA', 8, 6, '8600.00', '0.00', 'Payment', 'Active', '2018-10-24 03:27:17', '2018-10-24 03:27:17'),
(152, 35, '2018-00053-PA', 8, 6, '8600.00', '0.00', 'Payment', 'Active', '2018-10-24 03:27:31', '2018-10-24 03:27:31'),
(153, 37, '2018-00054-PA', 8, 6, '6500.00', '0.00', 'Payment', 'Active', '2018-10-24 03:27:42', '2018-10-24 03:27:42'),
(154, 38, '2018-00055-PA', 8, 6, '6500.00', '0.00', 'Payment', 'Active', '2018-10-24 03:27:53', '2018-10-24 03:27:53'),
(155, 40, '2018-00056-PA', 8, 6, '10700.00', '0.00', 'Payment', 'Active', '2018-10-24 03:28:20', '2018-10-24 03:28:20'),
(156, 42, '2018-00057-PA', 8, 6, '10700.00', '0.00', 'Payment', 'Active', '2018-10-24 03:28:33', '2018-10-24 03:28:33'),
(157, 43, '2018-00058-PA', 8, 6, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 03:28:45', '2018-10-24 03:28:45'),
(158, 45, '2018-00059-PA', 8, 6, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 03:28:59', '2018-10-24 03:28:59'),
(159, 46, '2018-00060-PA', 8, 6, '11300.00', '0.00', 'Payment', 'Active', '2018-10-24 03:29:12', '2018-10-24 03:29:12'),
(160, 47, '2018-00061-PA', 8, 6, '11300.00', '0.00', 'Payment', 'Active', '2018-10-24 03:29:24', '2018-10-24 03:29:24'),
(161, 49, '2018-00062-PA', 8, 6, '6200.00', '0.00', 'Payment', 'Active', '2018-10-24 03:29:38', '2018-10-24 03:29:38'),
(162, 50, '2018-00063-PA', 8, 6, '6200.00', '0.00', 'Payment', 'Active', '2018-10-24 03:29:49', '2018-10-24 03:29:49'),
(163, 51, '2018-00064-PA', 8, 6, '6200.00', '0.00', 'Payment', 'Active', '2018-10-24 03:30:01', '2018-10-24 03:30:01'),
(164, 52, '2018-00065-PA', 8, 6, '8900.00', '0.00', 'Payment', 'Active', '2018-10-24 03:30:15', '2018-10-24 03:30:15'),
(165, 53, '2018-00066-PA', 8, 6, '8900.00', '0.00', 'Payment', 'Active', '2018-10-24 03:30:27', '2018-10-24 03:30:27'),
(166, 56, '2018-00067-PA', 8, 6, '7100.00', '0.00', 'Payment', 'Active', '2018-10-24 03:30:41', '2018-10-24 03:30:41'),
(167, 57, '2018-00068-PA', 8, 6, '7100.00', '0.00', 'Payment', 'Active', '2018-10-24 03:30:56', '2018-10-24 03:30:56'),
(168, 34, '2018-00069-PA', 9, 6, '3800.00', '0.00', 'Payment', 'Active', '2018-10-24 04:40:32', '2018-10-24 04:40:32'),
(169, 35, '2018-00070-PA', 9, 6, '3800.00', '0.00', 'Payment', 'Active', '2018-10-24 04:40:45', '2018-10-24 04:40:45'),
(170, 37, '2018-00071-PA', 9, 6, '1700.00', '0.00', 'Payment', 'Active', '2018-10-24 04:40:57', '2018-10-24 04:40:57'),
(171, 38, '2018-00072-PA', 9, 6, '1700.00', '0.00', 'Payment', 'Active', '2018-10-24 04:41:09', '2018-10-24 04:41:09'),
(172, 40, '2018-00073-PA', 9, 6, '9800.00', '0.00', 'Payment', 'Active', '2018-10-24 04:41:31', '2018-10-24 04:41:31'),
(173, 42, '2018-00074-PA', 9, 6, '9800.00', '0.00', 'Payment', 'Active', '2018-10-24 04:41:44', '2018-10-24 04:41:44'),
(174, 43, '2018-00075-PA', 9, 6, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 04:41:55', '2018-10-24 04:41:55'),
(175, 45, '2018-00076-PA', 9, 6, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 04:42:12', '2018-10-24 04:42:12'),
(176, 46, '2018-00077-PA', 9, 6, '10400.00', '0.00', 'Payment', 'Active', '2018-10-24 04:42:33', '2018-10-24 04:42:33'),
(177, 47, '2018-00078-PA', 9, 6, '10400.00', '0.00', 'Payment', 'Active', '2018-10-24 04:42:50', '2018-10-24 04:42:50'),
(178, 49, '2018-00079-PA', 9, 6, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 04:43:06', '2018-10-24 04:43:06'),
(179, 51, '2018-00080-PA', 9, 6, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 04:43:19', '2018-10-24 04:43:19'),
(180, 52, '2018-00081-PA', 9, 6, '10400.00', '0.00', 'Payment', 'Active', '2018-10-24 04:43:31', '2018-10-24 04:43:31'),
(181, 53, '2018-00082-PA', 9, 6, '10400.00', '0.00', 'Payment', 'Active', '2018-10-24 04:43:44', '2018-10-24 04:43:44'),
(182, 56, '2018-00083-PA', 9, 6, '6500.00', '0.00', 'Payment', 'Active', '2018-10-24 04:43:59', '2018-10-24 04:43:59'),
(183, 57, '2018-00084-PA', 9, 6, '6500.00', '0.00', 'Payment', 'Active', '2018-10-24 04:44:09', '2018-10-24 04:44:09'),
(184, 40, '2018-00085-PA', 10, 6, '2600.00', '0.00', 'Payment', 'Active', '2018-10-24 05:16:32', '2018-10-24 05:16:32'),
(185, 42, '2018-00086-PA', 10, 6, '2600.00', '0.00', 'Payment', 'Active', '2018-10-24 05:16:45', '2018-10-24 05:16:45'),
(186, 50, '2018-00087-PA', 10, 6, '4700.00', '0.00', 'Payment', 'Active', '2018-10-24 05:17:19', '2018-10-24 05:17:19'),
(187, 39, '2019-00001-OF', 8, 7, '-11800.00', '0.00', 'Offset', 'Active', '2019-02-04 23:44:21', '2019-02-04 23:44:21'),
(188, 36, '2019-00002-OF', 8, 7, '-19400.00', '0.00', 'Offset', 'Active', '2019-02-04 23:44:35', '2019-02-04 23:44:35'),
(189, 40, '2019-00001-PA', 8, 7, '8600.00', '0.00', 'Payment', 'Active', '2019-02-04 23:44:50', '2019-02-04 23:44:50'),
(190, 42, '2019-00002-PA', 8, 7, '8600.00', '0.00', 'Payment', 'Active', '2019-02-04 23:45:05', '2019-02-04 23:45:05'),
(191, 43, '2019-00003-PA', 8, 7, '6500.00', '0.00', 'Payment', 'Active', '2019-02-04 23:45:18', '2019-02-04 23:45:18'),
(192, 45, '2019-00004-PA', 8, 7, '6500.00', '0.00', 'Payment', 'Active', '2019-02-04 23:45:37', '2019-02-04 23:45:37'),
(193, 46, '2019-00005-PA', 8, 7, '10700.00', '0.00', 'Payment', 'Active', '2019-02-04 23:45:52', '2019-02-04 23:45:52'),
(194, 47, '2019-00006-PA', 8, 7, '10700.00', '0.00', 'Payment', 'Active', '2019-02-04 23:46:03', '2019-02-04 23:46:03'),
(195, 49, '2019-00007-PA', 8, 7, '4700.00', '0.00', 'Payment', 'Active', '2019-02-04 23:46:37', '2019-02-04 23:46:37'),
(196, 50, '2019-00008-PA', 8, 7, '4700.00', '0.00', 'Payment', 'Active', '2019-02-04 23:46:51', '2019-02-04 23:46:51'),
(197, 51, '2019-00009-PA', 8, 7, '4700.00', '0.00', 'Payment', 'Active', '2019-02-04 23:47:04', '2019-02-04 23:47:04'),
(198, 52, '2019-00010-PA', 8, 7, '11300.00', '0.00', 'Payment', 'Active', '2019-02-04 23:47:17', '2019-02-04 23:47:17'),
(199, 53, '2019-00011-PA', 8, 7, '11300.00', '0.00', 'Payment', 'Active', '2019-02-04 23:47:28', '2019-02-04 23:47:28'),
(200, 54, '2019-00012-PA', 8, 7, '2400.00', '0.00', 'Payment', 'Active', '2019-02-04 23:47:54', '2019-02-04 23:47:54'),
(201, 48, '2019-00013-PA', 8, 7, '1800.00', '0.00', 'Payment', 'Active', '2019-02-04 23:48:12', '2019-02-04 23:48:12'),
(202, 56, '2019-00014-PA', 8, 7, '6200.00', '0.00', 'Payment', 'Active', '2019-02-04 23:48:26', '2019-02-04 23:48:26'),
(203, 57, '2019-00015-PA', 8, 7, '6200.00', '0.00', 'Payment', 'Active', '2019-02-04 23:48:40', '2019-02-04 23:48:40'),
(204, 59, '2019-00016-PA', 8, 7, '8900.00', '0.00', 'Payment', 'Active', '2019-02-04 23:48:56', '2019-02-04 23:48:56'),
(205, 60, '2019-00017-PA', 8, 7, '8900.00', '0.00', 'Payment', 'Active', '2019-02-04 23:49:08', '2019-02-04 23:49:08'),
(206, 62, '2019-00018-PA', 8, 7, '7100.00', '0.00', 'Payment', 'Active', '2019-02-04 23:49:21', '2019-02-04 23:49:21'),
(207, 63, '2019-00019-PA', 8, 7, '7100.00', '0.00', 'Payment', 'Active', '2019-02-04 23:49:32', '2019-02-04 23:49:32'),
(208, 40, '2019-00020-PA', 9, 7, '3800.00', '0.00', 'Payment', 'Active', '2019-02-05 10:57:30', '2019-02-05 10:57:30'),
(209, 42, '2019-00021-PA', 9, 7, '3800.00', '0.00', 'Payment', 'Active', '2019-02-05 10:57:43', '2019-02-05 10:57:43'),
(210, 43, '2019-00022-PA', 9, 7, '1700.00', '0.00', 'Payment', 'Active', '2019-02-05 10:57:56', '2019-02-05 10:57:56'),
(211, 45, '2019-00023-PA', 9, 7, '1700.00', '0.00', 'Payment', 'Active', '2019-02-05 10:58:08', '2019-02-05 10:58:08'),
(212, 46, '2019-00024-PA', 9, 7, '9800.00', '0.00', 'Payment', 'Active', '2019-02-05 10:58:26', '2019-02-05 10:58:26'),
(213, 47, '2019-00025-PA', 9, 7, '9800.00', '0.00', 'Payment', 'Active', '2019-02-05 10:58:36', '2019-02-05 10:58:36'),
(214, 48, '2019-00026-PA', 9, 7, '9800.00', '0.00', 'Payment', 'Active', '2019-02-05 10:58:45', '2019-02-05 10:58:45'),
(215, 49, '2019-00027-PA', 9, 7, '4700.00', '0.00', 'Payment', 'Active', '2019-02-05 10:59:00', '2019-02-05 10:59:00'),
(216, 50, '2019-00028-PA', 9, 7, '4700.00', '0.00', 'Payment', 'Active', '2019-02-05 10:59:12', '2019-02-05 10:59:12'),
(217, 51, '2019-00029-PA', 9, 7, '4700.00', '0.00', 'Payment', 'Active', '2019-02-05 10:59:22', '2019-02-05 10:59:22'),
(218, 52, '2019-00030-PA', 9, 7, '10400.00', '0.00', 'Payment', 'Active', '2019-02-05 10:59:34', '2019-02-05 10:59:34'),
(219, 53, '2019-00031-PA', 9, 7, '10400.00', '0.00', 'Payment', 'Active', '2019-02-05 10:59:45', '2019-02-05 10:59:45'),
(220, 56, '2019-00032-PA', 9, 7, '4700.00', '0.00', 'Payment', 'Active', '2019-02-05 11:00:00', '2019-02-05 11:00:00'),
(221, 57, '2019-00033-PA', 9, 7, '4700.00', '0.00', 'Payment', 'Active', '2019-02-05 11:00:10', '2019-02-05 11:00:10'),
(222, 58, '2019-00034-PA', 9, 7, '10400.00', '0.00', 'Payment', 'Active', '2019-02-05 11:37:43', '2019-02-05 11:37:43'),
(223, 59, '2019-00035-PA', 9, 7, '10400.00', '0.00', 'Payment', 'Active', '2019-02-05 11:37:55', '2019-02-05 11:37:55'),
(224, 60, '2019-00036-PA', 9, 7, '10400.00', '0.00', 'Payment', 'Active', '2019-02-05 11:38:09', '2019-02-05 11:38:09'),
(225, 61, '2019-00037-PA', 9, 7, '6500.00', '0.00', 'Payment', 'Active', '2019-02-05 11:38:19', '2019-02-05 11:38:19'),
(226, 62, '2019-00038-PA', 9, 7, '6500.00', '0.00', 'Payment', 'Active', '2019-02-05 11:38:29', '2019-02-05 11:38:29'),
(227, 63, '2019-00039-PA', 9, 7, '6500.00', '0.00', 'Payment', 'Active', '2019-02-05 11:38:43', '2019-02-05 11:38:43'),
(228, 41, '2019-00003-OF', 8, 8, '-8900.00', '0.00', 'Offset', 'Active', '2019-02-13 23:22:16', '2019-02-13 23:22:16'),
(229, 44, '2019-00004-OF', 8, 8, '-7100.00', '0.00', 'Offset', 'Active', '2019-02-13 23:22:29', '2019-02-13 23:22:29'),
(230, 46, '2019-00040-PA', 8, 8, '7500.00', '0.00', 'Payment', 'Active', '2019-02-13 23:23:51', '2019-02-13 23:23:51'),
(231, 47, '2019-00041-PA', 8, 8, '7500.00', '0.00', 'Payment', 'Active', '2019-02-13 23:24:21', '2019-02-13 23:24:21'),
(232, 48, '2019-00042-PA', 8, 8, '7500.00', '0.00', 'Payment', 'Active', '2019-02-13 23:24:34', '2019-02-13 23:24:34'),
(233, 49, '2019-00043-PA', 8, 8, '5400.00', '0.00', 'Payment', 'Active', '2019-02-13 23:24:46', '2019-02-13 23:24:46'),
(234, 50, '2019-00044-PA', 8, 8, '5400.00', '0.00', 'Payment', 'Active', '2019-02-13 23:24:57', '2019-02-13 23:24:57'),
(235, 52, '2019-00045-PA', 8, 8, '9600.00', '0.00', 'Payment', 'Active', '2019-02-13 23:25:11', '2019-02-13 23:25:11'),
(236, 53, '2019-00046-PA', 8, 8, '9600.00', '0.00', 'Payment', 'Active', '2019-02-13 23:25:23', '2019-02-13 23:25:23'),
(237, 56, '2019-00047-PA', 8, 8, '3600.00', '0.00', 'Payment', 'Active', '2019-02-13 23:25:59', '2019-02-13 23:25:59'),
(238, 57, '2019-00048-PA', 8, 8, '3600.00', '0.00', 'Payment', 'Active', '2019-02-13 23:26:14', '2019-02-13 23:26:14'),
(239, 58, '2019-00049-PA', 8, 8, '10200.00', '0.00', 'Payment', 'Active', '2019-02-13 23:26:29', '2019-02-13 23:26:29'),
(240, 59, '2019-00050-PA', 8, 8, '10200.00', '0.00', 'Payment', 'Active', '2019-02-13 23:26:47', '2019-02-13 23:26:47'),
(241, 60, '2019-00051-PA', 8, 8, '10200.00', '0.00', 'Payment', 'Active', '2019-02-13 23:27:00', '2019-02-13 23:27:00'),
(242, 61, '2019-00052-PA', 8, 8, '5100.00', '0.00', 'Payment', 'Active', '2019-02-13 23:27:13', '2019-02-13 23:27:13'),
(243, 62, '2019-00053-PA', 8, 8, '5100.00', '0.00', 'Payment', 'Active', '2019-02-13 23:27:25', '2019-02-13 23:27:25'),
(244, 63, '2019-00054-PA', 8, 8, '5100.00', '0.00', 'Payment', 'Active', '2019-02-13 23:27:41', '2019-02-13 23:27:41'),
(245, 65, '2019-00055-PA', 8, 8, '7800.00', '0.00', 'Payment', 'Active', '2019-02-13 23:28:01', '2019-02-13 23:28:01'),
(246, 66, '2019-00056-PA', 8, 8, '7800.00', '0.00', 'Payment', 'Active', '2019-02-13 23:28:14', '2019-02-13 23:28:14'),
(247, 68, '2019-00057-PA', 8, 8, '6000.00', '0.00', 'Payment', 'Active', '2019-02-13 23:28:29', '2019-02-13 23:28:29'),
(248, 69, '2019-00058-PA', 8, 8, '6000.00', '0.00', 'Payment', 'Active', '2019-02-13 23:28:41', '2019-02-13 23:28:41'),
(249, 51, '2019-00059-PA', 8, 8, '5400.00', '0.00', 'Payment', 'Active', '2019-02-14 14:17:26', '2019-02-14 14:17:26'),
(250, 46, '2019-00060-PA', 9, 8, '2700.00', '0.00', 'Payment', 'Active', '2019-02-14 15:01:58', '2019-02-14 15:01:58'),
(251, 47, '2019-00061-PA', 9, 8, '2700.00', '0.00', 'Payment', 'Active', '2019-02-14 15:02:08', '2019-02-14 15:02:08'),
(252, 48, '2019-00062-PA', 9, 8, '2700.00', '0.00', 'Payment', 'Active', '2019-02-14 15:02:30', '2019-02-14 15:02:30'),
(253, 49, '2019-00063-PA', 9, 8, '600.00', '0.00', 'Payment', 'Active', '2019-02-14 15:02:45', '2019-02-14 15:02:45'),
(254, 50, '2019-00064-PA', 9, 8, '600.00', '0.00', 'Payment', 'Active', '2019-02-14 15:02:55', '2019-02-14 15:02:55'),
(255, 51, '2019-00065-PA', 9, 8, '600.00', '0.00', 'Payment', 'Active', '2019-02-14 15:03:05', '2019-02-14 15:03:05'),
(256, 52, '2019-00066-PA', 9, 8, '8700.00', '0.00', 'Payment', 'Active', '2019-02-14 15:03:16', '2019-02-14 15:03:16'),
(257, 53, '2019-00067-PA', 9, 8, '8700.00', '0.00', 'Payment', 'Active', '2019-02-14 15:03:28', '2019-02-14 15:03:28'),
(258, 54, '2019-00068-PA', 9, 8, '7000.00', '0.00', 'Payment', 'Active', '2019-02-14 15:03:39', '2019-02-14 15:03:39'),
(259, 55, '2019-00069-PA', 9, 8, '100.00', '0.00', 'Payment', 'Active', '2019-02-14 15:03:50', '2019-02-14 15:03:50'),
(260, 56, '2019-00070-PA', 9, 8, '3600.00', '0.00', 'Payment', 'Active', '2019-02-14 15:04:02', '2019-02-14 15:04:02'),
(261, 57, '2019-00071-PA', 9, 8, '3600.00', '0.00', 'Payment', 'Active', '2019-02-14 15:04:14', '2019-02-14 15:04:14'),
(262, 58, '2019-00072-PA', 9, 8, '9300.00', '0.00', 'Payment', 'Active', '2019-02-14 15:04:24', '2019-02-14 15:04:24'),
(263, 59, '2019-00073-PA', 9, 8, '9300.00', '0.00', 'Payment', 'Active', '2019-02-14 15:04:35', '2019-02-14 15:04:35'),
(264, 60, '2019-00074-PA', 9, 8, '9300.00', '0.00', 'Payment', 'Active', '2019-02-14 15:04:47', '2019-02-14 15:04:47'),
(265, 61, '2019-00075-PA', 9, 8, '3600.00', '0.00', 'Payment', 'Active', '2019-02-14 15:04:58', '2019-02-14 15:04:58'),
(266, 62, '2019-00076-PA', 9, 8, '3600.00', '0.00', 'Payment', 'Active', '2019-02-14 15:05:18', '2019-02-14 15:05:18'),
(267, 63, '2019-00077-PA', 9, 8, '3600.00', '0.00', 'Payment', 'Active', '2019-02-14 15:05:36', '2019-02-14 15:05:36'),
(268, 64, '2019-00078-PA', 9, 8, '9300.00', '0.00', 'Payment', 'Active', '2019-02-14 15:05:48', '2019-02-14 15:05:48'),
(269, 65, '2019-00079-PA', 9, 8, '9300.00', '0.00', 'Payment', 'Active', '2019-02-14 15:06:01', '2019-02-14 15:06:01'),
(270, 66, '2019-00080-PA', 9, 8, '9300.00', '0.00', 'Payment', 'Active', '2019-02-14 15:06:15', '2019-02-14 15:06:15'),
(271, 67, '2019-00081-PA', 9, 8, '5400.00', '0.00', 'Payment', 'Active', '2019-02-14 15:06:29', '2019-02-14 15:06:29'),
(272, 68, '2019-00082-PA', 9, 8, '5400.00', '0.00', 'Payment', 'Active', '2019-02-14 15:06:39', '2019-02-14 15:06:39'),
(273, 69, '2019-00083-PA', 9, 8, '5400.00', '0.00', 'Payment', 'Active', '2019-02-14 15:06:50', '2019-02-14 15:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `t_returnee`
--

CREATE TABLE `t_returnee` (
  `Returnee_ID` int(11) NOT NULL,
  `Returnee_StudentAccountID` int(11) NOT NULL,
  `Returnee_AcademicYearID` int(11) NOT NULL,
  `Returnee_SemesterID` int(11) NOT NULL,
  `Returnee_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Returnee_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Returnee_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_schedule`
--

CREATE TABLE `t_schedule` (
  `Schedule_ID` int(11) NOT NULL,
  `Schedule_ProfessorID` int(11) DEFAULT NULL,
  `Schedule_CurriculumItemID` int(11) NOT NULL,
  `Schedule_SectionID` int(11) DEFAULT NULL,
  `Schedule_ChildrenID` int(11) DEFAULT NULL,
  `Schedule_Slot` int(11) NOT NULL DEFAULT '10',
  `Schedule_AcademicYearID` int(11) NOT NULL,
  `Schedule_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Schedule_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Schedule_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_schedule`
--

INSERT INTO `t_schedule` (`Schedule_ID`, `Schedule_ProfessorID`, `Schedule_CurriculumItemID`, `Schedule_SectionID`, `Schedule_ChildrenID`, `Schedule_Slot`, `Schedule_AcademicYearID`, `Schedule_Display_Status`, `Schedule_Date_Added`, `Schedule_Date_Updated`) VALUES
(421, 18, 124, 6, NULL, 50, 2, 'Active', '2018-10-23 19:46:12', '2018-10-23 19:46:12'),
(422, 18, 123, 6, NULL, 50, 2, 'Active', '2018-10-23 19:46:37', '2018-10-23 19:46:37'),
(423, 18, 87, 6, NULL, 50, 2, 'Active', '2018-10-23 19:47:11', '2018-10-23 19:47:11'),
(424, 18, 86, 6, NULL, 50, 2, 'Active', '2018-10-23 19:47:39', '2018-10-23 19:47:39'),
(425, 18, 127, 6, NULL, 50, 2, 'Active', '2018-10-23 19:48:19', '2018-10-23 19:48:19'),
(426, 18, 126, 6, NULL, 50, 2, 'Active', '2018-10-23 19:48:50', '2018-10-23 19:48:50'),
(427, 18, 125, 6, NULL, 50, 2, 'Active', '2018-10-23 19:49:30', '2018-10-23 19:49:30'),
(428, 18, 128, 6, NULL, 50, 2, 'Active', '2018-10-23 19:50:06', '2018-10-23 19:50:06'),
(429, 18, 89, 6, 82, 50, 2, 'Active', '2018-10-23 19:52:43', '2018-10-23 19:52:43'),
(430, 18, 89, 6, 83, 50, 2, 'Active', '2018-10-23 19:53:04', '2018-10-23 19:53:04'),
(431, 18, 160, 9, NULL, 50, 2, 'Active', '2018-10-23 20:00:31', '2018-10-23 20:00:31'),
(432, 18, 159, 9, NULL, 50, 2, 'Active', '2018-10-23 20:01:05', '2018-10-23 20:01:05'),
(433, 18, 196, 9, NULL, 50, 2, 'Active', '2018-10-23 20:01:26', '2018-10-23 20:01:26'),
(434, 18, 195, 9, NULL, 50, 2, 'Active', '2018-10-23 20:01:54', '2018-10-23 20:01:54'),
(435, 18, 158, 9, NULL, 50, 2, 'Active', '2018-10-23 20:02:21', '2018-10-23 20:02:21'),
(436, 18, 194, 9, NULL, 50, 2, 'Active', '2018-10-23 20:02:44', '2018-10-23 20:02:44'),
(437, 18, 97, 9, 82, 50, 2, 'Active', '2018-10-23 20:03:10', '2018-10-23 20:03:10'),
(438, 18, 97, 9, 83, 50, 2, 'Active', '2018-10-23 20:03:28', '2018-10-23 20:03:28'),
(439, 18, 133, 6, NULL, 50, 2, 'Active', '2018-10-23 20:54:32', '2018-10-23 20:54:32'),
(440, 18, 132, 6, NULL, 50, 2, 'Active', '2018-10-23 20:54:58', '2018-10-23 20:54:58'),
(441, 18, 131, 6, NULL, 50, 2, 'Active', '2018-10-23 20:55:25', '2018-10-23 20:55:25'),
(442, 18, 130, 6, NULL, 50, 2, 'Active', '2018-10-23 20:55:56', '2018-10-23 20:55:56'),
(443, 18, 129, 6, NULL, 50, 2, 'Active', '2018-10-23 20:56:23', '2018-10-23 20:56:23'),
(444, 18, 92, 6, NULL, 50, 2, 'Active', '2018-10-23 20:56:46', '2018-10-23 20:56:46'),
(445, 18, 90, 6, NULL, 50, 2, 'Active', '2018-10-23 20:57:10', '2018-10-23 20:57:10'),
(446, 18, 143, 6, NULL, 50, 2, 'Active', '2018-10-23 20:57:55', '2018-10-23 20:58:11'),
(447, 18, 91, 6, 84, 50, 2, 'Active', '2018-10-23 20:58:34', '2018-10-23 20:58:34'),
(448, 18, 91, 6, 85, 50, 2, 'Active', '2018-10-23 20:58:52', '2018-10-23 20:58:52'),
(449, 18, 152, 9, NULL, 50, 2, 'Active', '2018-10-23 20:59:21', '2018-10-23 20:59:21'),
(450, 18, 201, 9, NULL, 50, 2, 'Active', '2018-10-23 20:59:41', '2018-10-23 20:59:41'),
(451, 18, 200, 9, NULL, 50, 2, 'Active', '2018-10-23 21:00:16', '2018-10-23 21:00:16'),
(452, 18, 198, 9, NULL, 50, 2, 'Active', '2018-10-23 21:00:43', '2018-10-23 21:00:43'),
(453, 18, 197, 9, NULL, 50, 2, 'Active', '2018-10-23 21:01:05', '2018-10-23 21:01:05'),
(454, 18, 199, 9, NULL, 50, 2, 'Active', '2018-10-23 21:01:23', '2018-10-23 21:01:23'),
(455, 18, 202, 9, 84, 50, 2, 'Active', '2018-10-23 21:01:48', '2018-10-23 21:01:48'),
(456, 18, 202, 9, 85, 50, 2, 'Active', '2018-10-23 21:02:05', '2018-10-23 21:02:05'),
(457, 18, 86, 6, NULL, 50, 1, 'Active', '2018-10-23 21:25:29', '2018-10-23 21:25:29'),
(458, 18, 127, 6, NULL, 50, 1, 'Active', '2018-10-23 21:26:13', '2018-10-23 21:26:13'),
(459, 18, 126, 6, NULL, 50, 1, 'Active', '2018-10-23 21:26:33', '2018-10-23 21:26:33'),
(460, 18, 125, 6, NULL, 50, 1, 'Active', '2018-10-23 21:26:56', '2018-10-23 21:26:56'),
(461, 18, 124, 6, NULL, 50, 1, 'Active', '2018-10-23 21:27:23', '2018-10-23 21:27:23'),
(462, 18, 123, 6, NULL, 50, 1, 'Active', '2018-10-23 21:27:42', '2018-10-23 21:27:42'),
(463, 18, 87, 6, NULL, 50, 1, 'Active', '2018-10-23 21:28:08', '2018-10-23 21:28:49'),
(464, 18, 128, 6, NULL, 50, 1, 'Active', '2018-10-23 21:29:26', '2018-10-23 21:29:26'),
(465, 18, 89, 6, 82, 50, 1, 'Active', '2018-10-23 21:30:02', '2018-10-23 21:30:02'),
(466, 18, 89, 6, 83, 50, 1, 'Active', '2018-10-23 21:30:18', '2018-10-23 21:30:18'),
(467, 18, 196, 9, NULL, 50, 1, 'Active', '2018-10-23 21:31:34', '2018-10-23 21:31:34'),
(468, 18, 195, 9, NULL, 50, 1, 'Active', '2018-10-23 21:31:58', '2018-10-23 21:31:58'),
(469, 18, 160, 9, NULL, 50, 1, 'Active', '2018-10-23 21:32:22', '2018-10-23 21:32:22'),
(470, 18, 159, 9, NULL, 50, 1, 'Active', '2018-10-23 21:32:45', '2018-10-23 21:32:45'),
(471, 18, 158, 9, NULL, 50, 1, 'Active', '2018-10-23 21:33:04', '2018-10-23 21:33:04'),
(472, 18, 194, 9, NULL, 50, 1, 'Active', '2018-10-23 21:33:26', '2018-10-23 21:33:26'),
(473, 18, 97, 9, 82, 50, 1, 'Active', '2018-10-23 21:33:45', '2018-10-23 21:33:45'),
(474, 18, 97, 9, 83, 50, 1, 'Active', '2018-10-23 21:34:00', '2018-10-23 21:34:00'),
(475, 18, 142, 7, NULL, 50, 1, 'Active', '2018-10-23 21:34:43', '2018-10-23 21:34:43'),
(476, 18, 141, 7, NULL, 50, 1, 'Active', '2018-10-23 21:35:04', '2018-10-23 21:35:04'),
(477, 18, 139, 7, NULL, 50, 1, 'Active', '2018-10-23 21:35:24', '2018-10-23 21:35:24'),
(478, 18, 138, 7, NULL, 50, 1, 'Active', '2018-10-23 21:35:57', '2018-10-23 21:35:57'),
(479, 18, 137, 7, NULL, 50, 1, 'Active', '2018-10-23 21:36:21', '2018-10-23 21:36:21'),
(480, 18, 136, 7, NULL, 50, 1, 'Active', '2018-10-23 21:36:47', '2018-10-23 21:36:47'),
(481, 18, 135, 7, NULL, 50, 1, 'Active', '2018-10-23 21:37:14', '2018-10-23 21:37:14'),
(482, 18, 134, 7, NULL, 50, 1, 'Active', '2018-10-23 21:37:38', '2018-10-23 21:37:38'),
(483, 18, 140, 7, NULL, 50, 1, 'Active', '2018-10-23 21:37:59', '2018-10-23 21:37:59'),
(484, 18, 170, 12, NULL, 50, 1, 'Active', '2018-10-23 21:38:26', '2018-10-23 21:38:26'),
(485, 18, 169, 12, NULL, 50, 1, 'Active', '2018-10-23 21:38:48', '2018-10-23 21:38:48'),
(486, 18, 168, 12, NULL, 50, 1, 'Active', '2018-10-23 21:39:28', '2018-10-23 21:39:28'),
(487, 18, 166, 12, NULL, 50, 1, 'Active', '2018-10-23 21:39:54', '2018-10-23 21:39:54'),
(488, 18, 165, 12, NULL, 50, 1, 'Active', '2018-10-23 21:40:18', '2018-10-23 21:40:18'),
(489, 18, 167, 12, NULL, 50, 1, 'Active', '2018-10-23 21:40:55', '2018-10-23 21:40:55'),
(490, 18, 90, 6, NULL, 50, 1, 'Active', '2018-10-23 22:40:14', '2018-10-23 22:40:14'),
(491, 18, 133, 6, NULL, 50, 1, 'Active', '2018-10-23 22:40:31', '2018-10-23 22:40:31'),
(492, 18, 132, 6, NULL, 50, 1, 'Active', '2018-10-23 22:40:54', '2018-10-23 22:40:54'),
(493, 18, 131, 6, NULL, 50, 1, 'Active', '2018-10-23 22:41:13', '2018-10-23 22:41:13'),
(494, 18, 130, 6, NULL, 50, 1, 'Active', '2018-10-23 22:41:34', '2018-10-23 22:41:34'),
(495, 18, 129, 6, NULL, 50, 1, 'Active', '2018-10-23 22:41:52', '2018-10-23 22:41:52'),
(496, 18, 92, 6, NULL, 50, 1, 'Active', '2018-10-23 22:42:15', '2018-10-23 22:42:15'),
(497, 18, 143, 6, NULL, 50, 1, 'Active', '2018-10-23 22:42:40', '2018-10-23 22:42:40'),
(498, 18, 91, 6, 84, 50, 1, 'Active', '2018-10-23 22:43:02', '2018-10-23 22:43:02'),
(499, 18, 91, 6, 85, 50, 1, 'Active', '2018-10-23 22:43:17', '2018-10-23 22:43:17'),
(500, 18, 152, 9, NULL, 50, 1, 'Active', '2018-10-23 22:43:41', '2018-10-23 22:43:41'),
(501, 18, 201, 9, NULL, 50, 1, 'Active', '2018-10-23 22:43:55', '2018-10-23 22:43:55'),
(502, 18, 200, 9, NULL, 50, 1, 'Active', '2018-10-23 22:44:13', '2018-10-23 22:44:13'),
(503, 18, 198, 9, NULL, 50, 1, 'Active', '2018-10-23 22:44:37', '2018-10-23 22:44:37'),
(504, 18, 197, 9, NULL, 50, 1, 'Active', '2018-10-23 22:45:20', '2018-10-23 22:45:20'),
(505, 18, 199, 9, NULL, 50, 1, 'Active', '2018-10-23 22:45:48', '2018-10-23 22:45:48'),
(506, 18, 202, 9, 84, 50, 1, 'Active', '2018-10-23 22:46:07', '2018-10-23 22:46:07'),
(507, 18, 202, 9, 85, 50, 1, 'Active', '2018-10-23 22:46:30', '2018-10-23 22:46:30'),
(508, 18, 144, 7, NULL, 50, 1, 'Active', '2018-10-23 22:47:06', '2018-10-23 22:47:06'),
(509, 18, 151, 7, NULL, 50, 1, 'Active', '2018-10-23 22:47:41', '2018-10-23 22:47:41'),
(510, 18, 149, 7, NULL, 50, 1, 'Active', '2018-10-23 22:48:02', '2018-10-23 22:48:02'),
(511, 18, 148, 7, NULL, 50, 1, 'Active', '2018-10-23 22:48:27', '2018-10-23 22:48:27'),
(512, 18, 147, 7, NULL, 50, 1, 'Active', '2018-10-23 22:48:52', '2018-10-23 22:48:52'),
(513, 18, 146, 7, NULL, 50, 1, 'Active', '2018-10-23 22:49:22', '2018-10-23 22:49:22'),
(514, 18, 145, 7, NULL, 50, 1, 'Active', '2018-10-23 22:49:41', '2018-10-23 22:49:41'),
(515, 18, 150, 7, NULL, 50, 1, 'Active', '2018-10-23 22:50:04', '2018-10-23 22:50:04'),
(516, 18, 171, 12, NULL, 50, 1, 'Active', '2018-10-23 22:50:30', '2018-10-23 22:50:30'),
(517, 18, 175, 12, NULL, 50, 1, 'Active', '2018-10-23 22:50:45', '2018-10-23 22:50:45'),
(518, 18, 174, 12, NULL, 50, 1, 'Active', '2018-10-23 22:51:05', '2018-10-23 22:51:05'),
(519, 18, 173, 12, NULL, 50, 1, 'Active', '2018-10-23 22:51:28', '2018-10-23 22:51:28'),
(520, 18, 172, 12, NULL, 50, 1, 'Active', '2018-10-23 22:51:52', '2018-10-23 22:51:52'),
(521, 18, 86, 6, NULL, 50, 5, 'Active', '2018-10-23 23:31:54', '2018-10-23 23:31:54'),
(522, 18, 127, 6, NULL, 50, 5, 'Active', '2018-10-23 23:32:41', '2018-10-23 23:32:41'),
(523, 18, 126, 6, NULL, 50, 5, 'Active', '2018-10-23 23:33:02', '2018-10-23 23:33:02'),
(524, 18, 125, 6, NULL, 50, 5, 'Active', '2018-10-23 23:33:39', '2018-10-23 23:33:39'),
(525, 18, 124, 6, NULL, 50, 5, 'Active', '2018-10-23 23:34:04', '2018-10-23 23:34:04'),
(526, 18, 123, 6, NULL, 50, 5, 'Active', '2018-10-23 23:34:21', '2018-10-23 23:34:21'),
(527, 18, 87, 6, NULL, 50, 5, 'Active', '2018-10-23 23:34:44', '2018-10-23 23:34:44'),
(528, 18, 128, 6, NULL, 50, 5, 'Active', '2018-10-23 23:35:16', '2018-10-23 23:35:31'),
(529, 18, 89, 6, 82, 50, 5, 'Active', '2018-10-23 23:35:58', '2018-10-23 23:35:58'),
(530, 18, 89, 6, 83, 50, 5, 'Active', '2018-10-23 23:36:14', '2018-10-23 23:36:14'),
(531, 18, 196, 9, NULL, 50, 5, 'Active', '2018-10-23 23:36:54', '2018-10-23 23:36:54'),
(532, 18, 195, 9, NULL, 50, 5, 'Active', '2018-10-23 23:37:11', '2018-10-23 23:37:11'),
(533, 18, 160, 9, NULL, 50, 5, 'Active', '2018-10-23 23:37:36', '2018-10-23 23:37:36'),
(534, 18, 159, 9, NULL, 50, 5, 'Active', '2018-10-23 23:38:00', '2018-10-23 23:38:00'),
(535, 18, 158, 9, NULL, 59, 5, 'Active', '2018-10-23 23:38:23', '2018-10-23 23:38:23'),
(536, 18, 194, 9, NULL, 50, 5, 'Active', '2018-10-23 23:38:48', '2018-10-23 23:38:48'),
(537, 18, 97, 9, 82, 50, 5, 'Active', '2018-10-23 23:39:10', '2018-10-23 23:39:10'),
(538, 18, 97, 9, 83, 50, 5, 'Active', '2018-10-23 23:39:29', '2018-10-23 23:39:29'),
(539, 18, 134, 7, NULL, 50, 5, 'Active', '2018-10-23 23:39:55', '2018-10-23 23:39:55'),
(540, 18, 142, 7, NULL, 50, 5, 'Active', '2018-10-23 23:40:17', '2018-10-23 23:40:17'),
(541, 18, 141, 7, NULL, 50, 5, 'Active', '2018-10-23 23:40:44', '2018-10-23 23:40:44'),
(542, 18, 139, 7, NULL, 50, 5, 'Active', '2018-10-23 23:41:11', '2018-10-23 23:41:11'),
(543, 18, 138, 7, NULL, 50, 5, 'Active', '2018-10-23 23:41:42', '2018-10-23 23:41:42'),
(544, 18, 137, 7, NULL, 50, 5, 'Active', '2018-10-23 23:42:02', '2018-10-23 23:42:02'),
(545, 18, 136, 7, NULL, 50, 5, 'Active', '2018-10-23 23:42:25', '2018-10-23 23:42:25'),
(546, 18, 135, 7, NULL, 50, 5, 'Active', '2018-10-23 23:42:55', '2018-10-23 23:42:55'),
(547, 18, 140, 7, NULL, 50, 5, 'Active', '2018-10-23 23:43:13', '2018-10-23 23:43:13'),
(548, 18, 165, 12, NULL, 50, 5, 'Active', '2018-10-23 23:43:43', '2018-10-23 23:43:43'),
(549, 18, 170, 12, NULL, 50, 5, 'Active', '2018-10-23 23:44:18', '2018-10-23 23:44:18'),
(550, 18, 169, 12, NULL, 50, 5, 'Active', '2018-10-23 23:44:46', '2018-10-23 23:44:46'),
(551, 18, 168, 12, NULL, 50, 5, 'Active', '2018-10-23 23:45:05', '2018-10-23 23:45:05'),
(552, 18, 166, 12, NULL, 50, 5, 'Active', '2018-10-23 23:45:26', '2018-10-23 23:45:26'),
(553, 18, 167, 12, NULL, 50, 5, 'Active', '2018-10-23 23:45:51', '2018-10-23 23:45:51'),
(554, 18, 101, 10, NULL, 50, 5, 'Active', '2018-10-23 23:46:30', '2018-10-23 23:46:30'),
(555, 18, 108, 10, NULL, 50, 5, 'Active', '2018-10-23 23:46:49', '2018-10-23 23:46:49'),
(556, 18, 107, 10, NULL, 50, 5, 'Active', '2018-10-23 23:47:11', '2018-10-23 23:47:11'),
(557, 18, 106, 10, NULL, 50, 5, 'Active', '2018-10-23 23:47:33', '2018-10-23 23:47:33'),
(558, 18, 105, 10, NULL, 50, 5, 'Active', '2018-10-23 23:47:52', '2018-10-23 23:47:52'),
(559, 18, 104, 10, NULL, 50, 5, 'Active', '2018-10-23 23:48:09', '2018-10-23 23:48:09'),
(560, 18, 103, 10, NULL, 50, 5, 'Active', '2018-10-23 23:48:25', '2018-10-23 23:48:25'),
(561, 18, 102, 10, NULL, 50, 5, 'Active', '2018-10-23 23:49:14', '2018-10-23 23:49:14'),
(562, 18, 176, 13, NULL, 50, 5, 'Active', '2018-10-23 23:50:11', '2018-10-23 23:50:11'),
(563, 18, 180, 13, NULL, 50, 5, 'Active', '2018-10-23 23:50:28', '2018-10-23 23:50:28'),
(564, 18, 179, 13, NULL, 50, 5, 'Active', '2018-10-23 23:50:46', '2018-10-23 23:50:46'),
(565, 18, 178, 13, NULL, 50, 5, 'Active', '2018-10-23 23:51:30', '2018-10-23 23:51:30'),
(566, 18, 177, 13, NULL, 50, 5, 'Active', '2018-10-23 23:52:06', '2018-10-23 23:52:06'),
(567, 18, 133, 6, NULL, 50, 5, 'Active', '2018-10-24 01:17:49', '2018-10-24 01:17:49'),
(568, 18, 132, 6, NULL, 50, 5, 'Active', '2018-10-24 01:18:04', '2018-10-24 01:18:04'),
(569, 18, 131, 6, NULL, 50, 5, 'Active', '2018-10-24 01:18:22', '2018-10-24 01:18:22'),
(570, 18, 130, 6, NULL, 50, 5, 'Active', '2018-10-24 01:18:43', '2018-10-24 01:18:43'),
(571, 18, 129, 6, NULL, 50, 5, 'Active', '2018-10-24 01:19:00', '2018-10-24 01:19:00'),
(572, 18, 92, 6, NULL, 50, 5, 'Active', '2018-10-24 01:19:15', '2018-10-24 01:19:15'),
(573, 10, 143, 6, NULL, 50, 5, 'Active', '2018-10-24 01:19:39', '2018-10-24 01:20:15'),
(574, 18, 90, 6, NULL, 50, 5, 'Active', '2018-10-24 01:20:01', '2018-10-24 01:20:01'),
(575, 18, 91, 6, 84, 50, 5, 'Active', '2018-10-24 01:20:33', '2018-10-24 01:20:33'),
(576, 18, 91, 6, 85, 50, 5, 'Active', '2018-10-24 01:20:59', '2018-10-24 01:20:59'),
(577, 18, 201, 9, NULL, 50, 5, 'Active', '2018-10-24 01:21:21', '2018-10-24 01:21:21'),
(578, 18, 200, 9, NULL, 50, 5, 'Active', '2018-10-24 01:21:36', '2018-10-24 01:21:36'),
(579, 18, 198, 9, NULL, 50, 5, 'Active', '2018-10-24 01:21:54', '2018-10-24 01:21:54'),
(580, 18, 197, 9, NULL, 50, 5, 'Active', '2018-10-24 01:22:19', '2018-10-24 01:22:19'),
(581, 18, 152, 9, NULL, 50, 5, 'Active', '2018-10-24 01:22:35', '2018-10-24 01:22:35'),
(582, 18, 199, 9, NULL, 50, 5, 'Active', '2018-10-24 01:23:14', '2018-10-24 01:23:14'),
(583, 18, 202, 9, 84, 50, 5, 'Active', '2018-10-24 01:23:30', '2018-10-24 01:23:30'),
(584, 18, 202, 9, 85, 50, 5, 'Active', '2018-10-24 01:23:48', '2018-10-24 01:23:48'),
(585, 18, 151, 7, NULL, 50, 5, 'Active', '2018-10-24 01:24:18', '2018-10-24 01:24:18'),
(586, 18, 149, 7, NULL, 50, 5, 'Active', '2018-10-24 01:24:35', '2018-10-24 01:24:35'),
(587, 18, 148, 7, NULL, 50, 5, 'Active', '2018-10-24 01:24:52', '2018-10-24 01:24:52'),
(588, 18, 147, 7, NULL, 50, 5, 'Active', '2018-10-24 01:25:09', '2018-10-24 01:25:09'),
(589, 18, 146, 7, NULL, 50, 5, 'Active', '2018-10-24 01:25:24', '2018-10-24 01:25:24'),
(590, 18, 145, 7, NULL, 50, 5, 'Active', '2018-10-24 01:26:06', '2018-10-24 01:26:06'),
(591, 18, 144, 7, NULL, 50, 5, 'Active', '2018-10-24 01:26:23', '2018-10-24 01:26:23'),
(592, 18, 150, 7, NULL, 50, 5, 'Active', '2018-10-24 01:27:00', '2018-10-24 01:27:00'),
(593, 18, 175, 12, NULL, 50, 5, 'Active', '2018-10-24 01:27:19', '2018-10-24 01:27:19'),
(594, 18, 174, 12, NULL, 50, 5, 'Active', '2018-10-24 01:27:34', '2018-10-24 01:27:34'),
(595, 18, 173, 12, NULL, 50, 5, 'Active', '2018-10-24 01:27:51', '2018-10-24 01:27:51'),
(596, 18, 172, 12, NULL, 50, 5, 'Active', '2018-10-24 01:28:15', '2018-10-24 01:28:15'),
(597, 18, 171, 12, NULL, 50, 5, 'Active', '2018-10-24 01:28:33', '2018-10-24 01:28:33'),
(598, 18, 115, 10, NULL, 50, 5, 'Active', '2018-10-24 01:28:56', '2018-10-24 01:28:56'),
(599, 18, 114, 10, NULL, 50, 5, 'Active', '2018-10-24 01:29:45', '2018-10-24 01:29:45'),
(600, 18, 113, 10, NULL, 50, 5, 'Active', '2018-10-24 01:30:05', '2018-10-24 01:30:05'),
(601, 18, 112, 10, NULL, 50, 5, 'Active', '2018-10-24 01:30:25', '2018-10-24 01:30:25'),
(602, 18, 111, 10, NULL, 50, 5, 'Active', '2018-10-24 01:30:45', '2018-10-24 01:30:45'),
(603, 18, 110, 10, NULL, 50, 5, 'Active', '2018-10-24 01:31:00', '2018-10-24 01:31:00'),
(604, 18, 109, 10, NULL, 50, 5, 'Active', '2018-10-24 01:31:44', '2018-10-24 01:31:44'),
(605, 18, 185, 13, NULL, 50, 5, 'Active', '2018-10-24 01:32:07', '2018-10-24 01:32:07'),
(606, 18, 184, 13, NULL, 50, 5, 'Active', '2018-10-24 01:32:42', '2018-10-24 01:32:42'),
(607, 18, 183, 13, NULL, 50, 5, 'Active', '2018-10-24 01:33:28', '2018-10-24 01:33:28'),
(608, 18, 182, 13, NULL, 50, 5, 'Active', '2018-10-24 01:33:54', '2018-10-24 01:33:54'),
(609, 18, 181, 13, NULL, 50, 5, 'Active', '2018-10-24 01:34:12', '2018-10-24 01:34:12'),
(610, 18, 205, 10, NULL, 50, 5, 'Active', '2018-10-24 02:16:21', '2018-10-24 02:16:21'),
(611, 18, 86, 6, NULL, 50, 6, 'Active', '2018-10-24 02:22:36', '2018-10-24 02:22:36'),
(612, 18, 124, 6, NULL, 50, 6, 'Active', '2018-10-24 02:22:51', '2018-10-24 02:22:51'),
(613, 18, 123, 6, NULL, 50, 6, 'Active', '2018-10-24 02:23:10', '2018-10-24 02:23:10'),
(614, 18, 87, 6, NULL, 50, 6, 'Active', '2018-10-24 02:23:31', '2018-10-24 02:23:31'),
(615, 18, 127, 6, NULL, 50, 6, 'Active', '2018-10-24 02:23:52', '2018-10-24 02:23:52'),
(616, 18, 126, 6, NULL, 50, 6, 'Active', '2018-10-24 02:24:05', '2018-10-24 02:24:05'),
(617, 18, 125, 6, NULL, 50, 6, 'Active', '2018-10-24 02:24:59', '2018-10-24 02:24:59'),
(618, 18, 128, 6, NULL, 50, 6, 'Active', '2018-10-24 02:25:29', '2018-10-24 02:25:29'),
(619, 18, 89, 6, 82, 50, 6, 'Active', '2018-10-24 02:25:52', '2018-10-24 02:25:52'),
(620, 18, 89, 6, 83, 50, 6, 'Active', '2018-10-24 02:26:10', '2018-10-24 02:26:10'),
(621, 18, 196, 9, NULL, 50, 6, 'Active', '2018-10-24 02:26:29', '2018-10-24 02:26:29'),
(622, 18, 160, 9, NULL, 50, 6, 'Active', '2018-10-24 02:26:45', '2018-10-24 02:26:45'),
(623, 18, 159, 9, NULL, 50, 6, 'Active', '2018-10-24 02:27:03', '2018-10-24 02:27:03'),
(624, 18, 158, 9, NULL, 50, 6, 'Active', '2018-10-24 02:27:33', '2018-10-24 02:27:33'),
(625, 18, 195, 9, NULL, 50, 6, 'Active', '2018-10-24 02:27:54', '2018-10-24 02:27:54'),
(626, 18, 194, 9, NULL, 50, 6, 'Active', '2018-10-24 02:28:12', '2018-10-24 02:28:12'),
(627, 18, 97, 9, 82, 50, 6, 'Active', '2018-10-24 02:28:40', '2018-10-24 02:28:40'),
(628, 18, 97, 9, 83, 50, 6, 'Active', '2018-10-24 02:28:54', '2018-10-24 02:28:54'),
(629, 18, 134, 7, NULL, 50, 6, 'Active', '2018-10-24 02:29:24', '2018-10-24 02:29:24'),
(630, 18, 138, 7, NULL, 50, 6, 'Active', '2018-10-24 02:29:46', '2018-10-24 02:29:46'),
(631, 18, 137, 7, NULL, 50, 6, 'Active', '2018-10-24 02:30:03', '2018-10-24 02:30:03'),
(632, 18, 136, 7, NULL, 50, 6, 'Active', '2018-10-24 02:30:37', '2018-10-24 02:30:37'),
(633, 18, 135, 7, NULL, 50, 6, 'Active', '2018-10-24 02:30:59', '2018-10-24 02:30:59'),
(634, 18, 142, 7, NULL, 50, 6, 'Active', '2018-10-24 02:31:25', '2018-10-24 02:31:25'),
(635, 18, 141, 7, NULL, 50, 6, 'Active', '2018-10-24 02:32:02', '2018-10-24 02:32:02'),
(636, 18, 139, 7, NULL, 50, 6, 'Active', '2018-10-24 02:32:29', '2018-10-24 02:32:29'),
(637, 18, 140, 7, NULL, 50, 6, 'Active', '2018-10-24 02:32:53', '2018-10-24 02:32:53'),
(638, 18, 165, 12, NULL, 50, 6, 'Active', '2018-10-24 02:33:36', '2018-10-24 02:33:36'),
(639, 18, 169, 12, NULL, 50, 6, 'Active', '2018-10-24 02:33:55', '2018-10-24 02:33:55'),
(640, 18, 168, 12, NULL, 50, 6, 'Active', '2018-10-24 02:34:27', '2018-10-24 02:34:27'),
(641, 18, 166, 12, NULL, 50, 6, 'Active', '2018-10-24 02:34:51', '2018-10-24 02:34:51'),
(642, 18, 170, 12, NULL, 50, 6, 'Active', '2018-10-24 02:35:15', '2018-10-24 02:35:15'),
(643, 18, 167, 12, NULL, 50, 6, 'Active', '2018-10-24 02:35:32', '2018-10-24 02:35:32'),
(644, 18, 107, 10, NULL, 50, 6, 'Active', '2018-10-24 02:37:04', '2018-10-24 02:37:04'),
(645, 18, 108, 10, NULL, 50, 6, 'Active', '2018-10-24 02:37:37', '2018-10-24 02:37:37'),
(646, 18, 105, 10, NULL, 50, 6, 'Active', '2018-10-24 02:38:02', '2018-10-24 02:38:02'),
(647, 18, 106, 10, NULL, 50, 6, 'Active', '2018-10-24 02:38:24', '2018-10-24 02:38:24'),
(648, 18, 104, 10, NULL, 50, 6, 'Active', '2018-10-24 02:38:44', '2018-10-24 02:38:44'),
(649, 18, 103, 10, NULL, 50, 6, 'Active', '2018-10-24 02:39:07', '2018-10-24 02:39:07'),
(650, 18, 102, 10, NULL, 50, 6, 'Active', '2018-10-24 02:40:21', '2018-10-24 02:40:21'),
(651, 18, 101, 10, NULL, 50, 6, 'Active', '2018-10-24 02:40:42', '2018-10-24 02:40:42'),
(652, 18, 180, 13, NULL, 50, 6, 'Active', '2018-10-24 02:41:12', '2018-10-24 02:41:12'),
(653, 18, 179, 13, NULL, 50, 6, 'Active', '2018-10-24 02:41:32', '2018-10-24 02:41:32'),
(654, 18, 178, 13, NULL, 50, 6, 'Active', '2018-10-24 02:41:57', '2018-10-24 02:41:57'),
(655, 18, 177, 13, NULL, 50, 6, 'Active', '2018-10-24 02:42:28', '2018-10-24 02:42:28'),
(656, 18, 176, 13, NULL, 50, 6, 'Active', '2018-10-24 02:42:53', '2018-10-24 02:42:53'),
(657, 18, 122, 11, NULL, 50, 6, 'Active', '2018-10-24 02:43:19', '2018-10-24 02:43:19'),
(658, 18, 121, 11, NULL, 50, 6, 'Active', '2018-10-24 02:43:33', '2018-10-24 02:43:33'),
(659, 18, 120, 11, NULL, 50, 6, 'Active', '2018-10-24 02:43:51', '2018-10-24 02:43:51'),
(660, 18, 119, 11, NULL, 50, 6, 'Active', '2018-10-24 02:44:12', '2018-10-24 02:44:12'),
(661, 18, 118, 11, NULL, 50, 6, 'Active', '2018-10-24 02:44:31', '2018-10-24 02:44:31'),
(662, 18, 117, 11, NULL, 50, 6, 'Active', '2018-10-24 02:44:49', '2018-10-24 02:44:49'),
(663, 18, 116, 11, NULL, 50, 6, 'Active', '2018-10-24 02:45:08', '2018-10-24 02:45:08'),
(664, 18, 191, 14, NULL, 50, 6, 'Active', '2018-10-24 02:45:43', '2018-10-24 02:45:43'),
(665, 18, 190, 14, NULL, 50, 6, 'Active', '2018-10-24 02:46:06', '2018-10-24 02:46:06'),
(666, 18, 189, 14, NULL, 50, 6, 'Active', '2018-10-24 02:46:23', '2018-10-24 02:46:23'),
(667, 18, 188, 14, NULL, 50, 6, 'Active', '2018-10-24 02:46:44', '2018-10-24 02:46:44'),
(668, 18, 186, 14, NULL, 50, 6, 'Active', '2018-10-24 02:47:08', '2018-10-24 02:47:08'),
(669, 18, 187, 14, NULL, 50, 6, 'Active', '2018-10-24 02:47:23', '2018-10-24 02:47:23'),
(670, 18, 132, 6, NULL, 50, 6, 'Active', '2018-10-24 04:09:07', '2018-10-24 04:09:07'),
(671, 18, 131, 6, NULL, 50, 6, 'Active', '2018-10-24 04:09:20', '2018-10-24 04:09:20'),
(672, 18, 130, 6, NULL, 50, 6, 'Active', '2018-10-24 04:09:39', '2018-10-24 04:09:39'),
(673, 18, 129, 6, NULL, 50, 6, 'Active', '2018-10-24 04:09:58', '2018-10-24 04:09:58'),
(674, 18, 92, 6, NULL, 50, 6, 'Active', '2018-10-24 04:10:18', '2018-10-24 04:10:18'),
(675, 18, 90, 6, NULL, 50, 6, 'Active', '2018-10-24 04:10:32', '2018-10-24 04:10:32'),
(676, 18, 133, 6, NULL, 50, 6, 'Active', '2018-10-24 04:10:54', '2018-10-24 04:10:54'),
(677, 18, 143, 6, NULL, 50, 6, 'Active', '2018-10-24 04:11:14', '2018-10-24 04:11:14'),
(678, 18, 91, 6, 84, 50, 6, 'Active', '2018-10-24 04:11:30', '2018-10-24 04:11:30'),
(679, 18, 91, 6, 85, 50, 6, 'Active', '2018-10-24 04:11:48', '2018-10-24 04:11:48'),
(680, 18, 201, 9, NULL, 50, 6, 'Active', '2018-10-24 04:12:09', '2018-10-24 04:12:09'),
(681, 18, 200, 9, NULL, 50, 6, 'Active', '2018-10-24 04:12:24', '2018-10-24 04:12:24'),
(682, 18, 198, 9, NULL, 50, 6, 'Active', '2018-10-24 04:12:47', '2018-10-24 04:12:47'),
(683, 18, 197, 9, NULL, 50, 6, 'Active', '2018-10-24 04:13:14', '2018-10-24 04:13:14'),
(684, 18, 152, 9, NULL, 50, 6, 'Active', '2018-10-24 04:13:36', '2018-10-24 04:13:36'),
(685, 18, 199, 9, NULL, 50, 6, 'Active', '2018-10-24 04:14:09', '2018-10-24 04:14:09'),
(686, 18, 202, 9, 84, 50, 6, 'Active', '2018-10-24 04:14:23', '2018-10-24 04:14:23'),
(687, 18, 202, 9, 85, 50, 6, 'Active', '2018-10-24 04:14:41', '2018-10-24 04:14:41'),
(688, 18, 149, 7, NULL, 50, 6, 'Active', '2018-10-24 04:15:04', '2018-10-24 04:15:04'),
(689, 18, 148, 7, NULL, 50, 6, 'Active', '2018-10-24 04:15:29', '2018-10-24 04:15:29'),
(690, 18, 147, 7, NULL, 50, 6, 'Active', '2018-10-24 04:15:52', '2018-10-24 04:15:52'),
(691, 18, 146, 7, NULL, 50, 6, 'Active', '2018-10-24 04:16:14', '2018-10-24 04:16:14'),
(692, 18, 145, 7, NULL, 50, 6, 'Active', '2018-10-24 04:16:37', '2018-10-24 04:16:37'),
(693, 18, 144, 7, NULL, 50, 6, 'Active', '2018-10-24 04:16:55', '2018-10-24 04:16:55'),
(694, 18, 151, 7, NULL, 50, 6, 'Active', '2018-10-24 04:17:25', '2018-10-24 04:17:25'),
(695, 18, 150, 7, NULL, 50, 6, 'Active', '2018-10-24 04:18:02', '2018-10-24 04:18:02'),
(696, 18, 175, 12, NULL, 50, 6, 'Active', '2018-10-24 04:18:31', '2018-10-24 04:18:31'),
(697, 18, 174, 12, NULL, 50, 6, 'Active', '2018-10-24 04:18:46', '2018-10-24 04:18:46'),
(698, 18, 173, 12, NULL, 50, 6, 'Active', '2018-10-24 04:19:09', '2018-10-24 04:19:09'),
(699, 18, 172, 12, NULL, 50, 6, 'Active', '2018-10-24 04:19:34', '2018-10-24 04:19:34'),
(700, 18, 171, 12, NULL, 50, 6, 'Active', '2018-10-24 04:20:02', '2018-10-24 04:20:02'),
(701, 18, 115, 10, NULL, 50, 6, 'Active', '2018-10-24 04:21:50', '2018-10-24 04:21:50'),
(702, 18, 114, 10, NULL, 50, 6, 'Active', '2018-10-24 04:22:07', '2018-10-24 04:22:07'),
(703, 18, 113, 10, NULL, 50, 6, 'Active', '2018-10-24 04:22:38', '2018-10-24 04:22:38'),
(704, 18, 112, 10, NULL, 50, 6, 'Active', '2018-10-24 04:22:58', '2018-10-24 04:22:58'),
(705, 18, 111, 10, NULL, 50, 6, 'Active', '2018-10-24 04:23:18', '2018-10-24 04:23:18'),
(706, 18, 110, 10, NULL, 50, 6, 'Active', '2018-10-24 04:23:34', '2018-10-24 04:23:34'),
(707, 18, 109, 10, NULL, 50, 6, 'Active', '2018-10-24 04:24:09', '2018-10-24 04:24:09'),
(708, 18, 185, 13, NULL, 50, 6, 'Active', '2018-10-24 04:24:35', '2018-10-24 04:24:35'),
(709, 18, 184, 13, NULL, 50, 6, 'Active', '2018-10-24 04:24:52', '2018-10-24 04:24:52'),
(710, 18, 183, 13, NULL, 50, 6, 'Active', '2018-10-24 04:25:13', '2018-10-24 04:25:13'),
(711, 18, 182, 13, NULL, 50, 6, 'Active', '2018-10-24 04:25:45', '2018-10-24 04:25:45'),
(712, 18, 181, 13, NULL, 50, 6, 'Active', '2018-10-24 04:26:05', '2018-10-24 04:26:05'),
(713, 18, 204, 11, NULL, 50, 6, 'Active', '2018-10-24 04:26:38', '2018-10-24 05:10:37'),
(714, 18, 193, 14, NULL, 50, 6, 'Active', '2018-10-24 04:27:12', '2018-10-24 04:27:12'),
(715, 18, 192, 14, NULL, 50, 6, 'Active', '2018-10-24 04:27:50', '2018-10-24 04:27:50'),
(716, 18, 205, 10, NULL, 50, 6, 'Active', '2018-10-24 05:13:15', '2018-10-24 05:13:15'),
(717, 18, 86, 6, NULL, 50, 7, 'Active', '2019-02-04 22:12:59', '2019-02-04 22:12:59'),
(718, 18, 127, 6, NULL, 50, 7, 'Active', '2019-02-04 22:13:36', '2019-02-04 22:13:36'),
(719, 18, 126, 6, NULL, 50, 7, 'Active', '2019-02-04 22:13:54', '2019-02-04 22:13:54'),
(720, 18, 125, 6, NULL, 50, 7, 'Active', '2019-02-04 22:14:42', '2019-02-04 22:14:42'),
(721, 18, 124, 6, NULL, 50, 7, 'Active', '2019-02-04 22:15:12', '2019-02-04 22:15:12'),
(722, 18, 123, 6, NULL, 50, 7, 'Active', '2019-02-04 22:15:40', '2019-02-04 22:15:40'),
(723, 18, 87, 6, NULL, 50, 7, 'Active', '2019-02-04 22:16:26', '2019-02-04 22:16:26'),
(724, 18, 128, 6, NULL, 50, 7, 'Active', '2019-02-04 22:16:47', '2019-02-04 22:16:47'),
(725, 18, 89, 6, 82, 50, 7, 'Active', '2019-02-04 22:17:16', '2019-02-04 22:17:16'),
(726, 18, 89, 6, 83, 50, 7, 'Active', '2019-02-04 22:17:40', '2019-02-04 22:17:40'),
(727, 18, 142, 7, NULL, 50, 7, 'Active', '2019-02-04 22:18:12', '2019-02-04 22:18:12'),
(728, 18, 141, 7, NULL, 50, 7, 'Active', '2019-02-04 22:18:34', '2019-02-04 22:18:34'),
(729, 18, 139, 7, NULL, 50, 7, 'Active', '2019-02-04 22:19:01', '2019-02-04 22:19:01'),
(730, 18, 138, 7, NULL, 50, 7, 'Active', '2019-02-04 22:19:26', '2019-02-04 22:19:26'),
(731, 12, 137, 7, NULL, 50, 7, 'Active', '2019-02-04 22:21:01', '2019-02-04 22:21:13'),
(732, 18, 134, 7, NULL, 50, 7, 'Active', '2019-02-04 22:21:34', '2019-02-04 22:21:34'),
(733, 18, 136, 7, NULL, 50, 7, 'Active', '2019-02-04 22:21:53', '2019-02-04 22:21:53'),
(734, 18, 135, 7, NULL, 50, 7, 'Active', '2019-02-04 22:22:14', '2019-02-04 22:22:14'),
(735, 18, 140, 7, NULL, 50, 7, 'Active', '2019-02-04 22:22:54', '2019-02-04 22:22:54'),
(736, 18, 101, 10, NULL, 50, 7, 'Active', '2019-02-04 22:23:43', '2019-02-04 22:23:43'),
(737, 18, 108, 10, NULL, 50, 7, 'Active', '2019-02-04 22:24:02', '2019-02-04 22:24:02'),
(738, 18, 107, 10, NULL, 50, 7, 'Active', '2019-02-04 22:24:18', '2019-02-04 22:24:18'),
(739, 18, 106, 10, NULL, 50, 7, 'Active', '2019-02-04 22:24:44', '2019-02-04 22:24:44'),
(740, 18, 105, 10, NULL, 50, 7, 'Active', '2019-02-04 22:25:30', '2019-02-04 22:25:30'),
(741, 18, 104, 10, NULL, 50, 7, 'Active', '2019-02-04 22:25:57', '2019-02-04 22:25:57'),
(742, 18, 103, 10, NULL, 50, 7, 'Active', '2019-02-04 22:26:18', '2019-02-04 22:26:18'),
(743, 18, 102, 10, NULL, 50, 7, 'Active', '2019-02-04 22:26:43', '2019-02-04 22:26:43'),
(744, 18, 116, 11, NULL, 50, 7, 'Active', '2019-02-04 22:27:21', '2019-02-04 22:27:21'),
(745, 18, 122, 11, NULL, 50, 7, 'Active', '2019-02-04 22:27:47', '2019-02-04 22:27:47'),
(746, 18, 121, 11, NULL, 50, 7, 'Active', '2019-02-04 22:28:53', '2019-02-04 22:28:53'),
(747, 18, 120, 11, NULL, 50, 7, 'Active', '2019-02-04 22:29:18', '2019-02-04 22:29:18'),
(748, 18, 119, 11, NULL, 50, 7, 'Active', '2019-02-04 22:29:37', '2019-02-04 22:29:37'),
(749, 18, 118, 11, NULL, 50, 7, 'Active', '2019-02-04 22:30:04', '2019-02-04 22:30:04'),
(750, 18, 117, 11, NULL, 50, 7, 'Active', '2019-02-04 22:30:49', '2019-02-04 22:30:49'),
(751, 18, 196, 9, NULL, 50, 7, 'Active', '2019-02-04 22:54:06', '2019-02-04 22:54:06'),
(752, 11, 195, 9, NULL, 50, 7, 'Active', '2019-02-04 22:54:27', '2019-02-04 22:55:27'),
(753, 18, 160, 9, NULL, 50, 7, 'Active', '2019-02-04 22:55:54', '2019-02-04 22:55:54'),
(754, 18, 159, 9, NULL, 50, 7, 'Active', '2019-02-04 22:56:20', '2019-02-04 22:56:20'),
(755, 18, 158, 9, NULL, 50, 7, 'Active', '2019-02-04 22:56:40', '2019-02-04 22:56:40'),
(756, 18, 194, 9, NULL, 50, 7, 'Active', '2019-02-04 22:57:00', '2019-02-04 22:57:00'),
(757, 18, 97, 9, 82, 50, 7, 'Active', '2019-02-04 22:57:26', '2019-02-04 22:57:26'),
(758, 18, 97, 9, 83, 50, 7, 'Active', '2019-02-04 22:57:42', '2019-02-04 22:57:42'),
(759, 18, 170, 12, NULL, 50, 7, 'Active', '2019-02-04 22:58:15', '2019-02-04 22:58:15'),
(760, 12, 169, 12, NULL, 50, 7, 'Active', '2019-02-04 22:58:39', '2019-02-04 22:59:03'),
(761, 18, 168, 12, NULL, 50, 7, 'Active', '2019-02-04 22:59:24', '2019-02-04 22:59:24'),
(762, 18, 166, 12, NULL, 50, 7, 'Active', '2019-02-04 22:59:47', '2019-02-04 22:59:47'),
(763, 18, 165, 12, NULL, 50, 7, 'Active', '2019-02-04 23:00:06', '2019-02-04 23:00:06'),
(764, 18, 167, 12, NULL, 50, 7, 'Active', '2019-02-04 23:00:26', '2019-02-04 23:00:26'),
(765, 18, 179, 13, NULL, 50, 7, 'Active', '2019-02-04 23:00:52', '2019-02-04 23:00:52'),
(766, 18, 178, 13, NULL, 50, 7, 'Active', '2019-02-04 23:01:15', '2019-02-04 23:01:15'),
(767, 18, 177, 13, NULL, 50, 7, 'Active', '2019-02-04 23:01:48', '2019-02-04 23:01:48'),
(768, 18, 176, 13, NULL, 50, 7, 'Active', '2019-02-04 23:02:06', '2019-02-04 23:02:06'),
(769, 18, 191, 14, NULL, 50, 7, 'Active', '2019-02-04 23:02:32', '2019-02-04 23:02:32'),
(770, 18, 190, 14, NULL, 50, 7, 'Active', '2019-02-04 23:02:49', '2019-02-04 23:02:49'),
(771, 18, 189, 14, NULL, 50, 7, 'Active', '2019-02-04 23:03:19', '2019-02-04 23:03:19'),
(772, 18, 188, 14, NULL, 50, 7, 'Active', '2019-02-04 23:03:46', '2019-02-04 23:03:46'),
(773, 18, 187, 14, NULL, 50, 7, 'Active', '2019-02-04 23:04:16', '2019-02-04 23:04:16'),
(774, 18, 186, 14, NULL, 50, 7, 'Active', '2019-02-04 23:04:35', '2019-02-04 23:04:35'),
(775, 18, 90, 6, NULL, 50, 7, 'Active', '2019-02-05 10:30:38', '2019-02-05 10:30:38'),
(776, 18, 133, 6, NULL, 50, 7, 'Active', '2019-02-05 10:30:52', '2019-02-05 10:30:52'),
(777, 18, 132, 6, NULL, 50, 7, 'Active', '2019-02-05 10:31:08', '2019-02-05 10:31:08'),
(778, 18, 131, 6, NULL, 50, 7, 'Active', '2019-02-05 10:31:29', '2019-02-05 10:31:29'),
(779, 18, 130, 6, NULL, 50, 7, 'Active', '2019-02-05 10:31:46', '2019-02-05 10:31:46'),
(780, 18, 129, 6, NULL, 50, 7, 'Active', '2019-02-05 10:32:01', '2019-02-05 10:32:01'),
(781, 18, 92, 6, NULL, 50, 7, 'Active', '2019-02-05 10:32:18', '2019-02-05 10:32:18'),
(782, 18, 91, 6, 84, 50, 7, 'Active', '2019-02-05 10:32:41', '2019-02-05 10:32:41'),
(783, 18, 91, 6, 85, 50, 7, 'Active', '2019-02-05 10:32:56', '2019-02-05 10:32:56'),
(784, 18, 143, 6, NULL, 50, 7, 'Active', '2019-02-05 10:33:18', '2019-02-05 10:33:18'),
(785, 18, 151, 7, NULL, 50, 7, 'Active', '2019-02-05 10:33:50', '2019-02-05 10:33:50'),
(786, 12, 149, 7, NULL, 50, 7, 'Active', '2019-02-05 10:34:07', '2019-02-05 10:34:45'),
(787, 18, 148, 7, NULL, 50, 7, 'Active', '2019-02-05 10:35:08', '2019-02-05 10:35:08'),
(788, 18, 147, 7, NULL, 50, 7, 'Active', '2019-02-05 10:35:45', '2019-02-05 10:35:45'),
(789, 18, 146, 7, NULL, 50, 7, 'Active', '2019-02-05 10:36:06', '2019-02-05 10:36:06'),
(790, 18, 145, 7, NULL, 50, 7, 'Active', '2019-02-05 10:36:26', '2019-02-05 10:36:26'),
(791, 18, 144, 7, NULL, 50, 7, 'Active', '2019-02-05 10:36:56', '2019-02-05 10:36:56'),
(792, 10, 150, 7, NULL, 50, 7, 'Active', '2019-02-05 10:38:01', '2019-02-05 10:38:13'),
(793, 18, 109, 10, NULL, 50, 7, 'Active', '2019-02-05 10:38:59', '2019-02-05 10:38:59'),
(794, 18, 110, 10, NULL, 50, 7, 'Active', '2019-02-05 10:39:13', '2019-02-05 10:39:13'),
(795, 18, 115, 10, NULL, 50, 7, 'Active', '2019-02-05 10:39:36', '2019-02-05 10:39:36'),
(796, 18, 114, 10, NULL, 50, 7, 'Active', '2019-02-05 10:39:59', '2019-02-05 10:39:59'),
(797, 18, 113, 10, NULL, 50, 7, 'Active', '2019-02-05 10:40:21', '2019-02-05 10:40:21'),
(798, 18, 112, 10, NULL, 50, 7, 'Active', '2019-02-05 10:40:36', '2019-02-05 10:40:36'),
(799, 18, 111, 10, NULL, 50, 7, 'Active', '2019-02-05 10:41:05', '2019-02-05 10:41:05'),
(800, 18, 198, 9, NULL, 50, 7, 'Active', '2019-02-05 10:42:05', '2019-02-05 10:42:05'),
(801, 18, 197, 9, NULL, 50, 7, 'Active', '2019-02-05 10:42:26', '2019-02-05 10:42:26'),
(802, 18, 201, 9, NULL, 50, 7, 'Active', '2019-02-05 10:42:45', '2019-02-05 10:42:45'),
(803, 18, 200, 9, NULL, 50, 7, 'Active', '2019-02-05 10:43:09', '2019-02-05 10:43:09'),
(804, 18, 202, 9, 84, 50, 7, 'Active', '2019-02-05 10:43:36', '2019-02-05 10:43:36'),
(805, 18, 202, 9, 85, 50, 7, 'Active', '2019-02-05 10:44:23', '2019-02-05 10:44:23'),
(806, 18, 199, 9, NULL, 50, 7, 'Active', '2019-02-05 10:44:51', '2019-02-05 10:44:51'),
(807, 18, 172, 12, NULL, 50, 7, 'Active', '2019-02-05 10:45:15', '2019-02-05 10:45:15'),
(808, 18, 171, 12, NULL, 50, 7, 'Active', '2019-02-05 10:45:32', '2019-02-05 10:45:32'),
(809, 18, 175, 12, NULL, 50, 7, 'Active', '2019-02-05 10:45:51', '2019-02-05 10:45:51'),
(810, 18, 173, 12, NULL, 50, 7, 'Active', '2019-02-05 10:46:14', '2019-02-05 10:46:14'),
(811, 18, 182, 13, NULL, 50, 7, 'Active', '2019-02-05 10:46:35', '2019-02-05 10:46:35'),
(812, 16, 184, 13, NULL, 50, 7, 'Active', '2019-02-05 10:46:49', '2019-03-27 00:13:08'),
(813, 18, 183, 13, NULL, 50, 7, 'Active', '2019-02-05 10:47:11', '2019-02-05 10:47:11'),
(814, 18, 181, 13, NULL, 50, 7, 'Active', '2019-02-05 10:47:42', '2019-02-05 10:47:42'),
(815, 18, 193, 14, NULL, 50, 7, 'Active', '2019-02-05 10:48:03', '2019-02-05 10:48:03'),
(816, 18, 192, 14, NULL, 50, 7, 'Active', '2019-02-05 10:48:18', '2019-02-05 10:48:18'),
(817, 18, 204, 11, NULL, 50, 7, 'Active', '2019-02-05 10:54:52', '2019-02-05 10:54:52'),
(818, 18, 205, 10, NULL, 50, 7, 'Active', '2019-02-13 13:39:42', '2019-02-13 13:39:42'),
(819, 18, 126, 6, NULL, 50, 8, 'Active', '2019-02-13 22:10:53', '2019-02-13 22:10:53'),
(820, 18, 127, 6, NULL, 50, 8, 'Active', '2019-02-13 22:11:22', '2019-02-13 22:11:22'),
(821, 18, 125, 6, NULL, 50, 8, 'Active', '2019-02-13 22:11:42', '2019-02-13 22:11:42'),
(822, 18, 124, 6, NULL, 50, 8, 'Active', '2019-02-13 22:12:01', '2019-02-13 22:12:01'),
(823, 18, 123, 6, NULL, 50, 8, 'Active', '2019-02-13 22:12:42', '2019-02-13 22:12:42'),
(824, 18, 87, 6, NULL, 50, 8, 'Active', '2019-02-13 22:13:19', '2019-02-13 22:13:19'),
(825, 18, 86, 6, NULL, 50, 8, 'Active', '2019-02-13 22:13:47', '2019-02-13 22:13:47'),
(826, 18, 128, 6, NULL, 50, 8, 'Active', '2019-02-13 22:14:08', '2019-02-13 22:14:08'),
(827, 18, 89, 6, 82, 50, 8, 'Active', '2019-02-13 22:14:40', '2019-02-13 22:14:40'),
(828, 18, 196, 9, NULL, 50, 8, 'Active', '2019-02-13 22:19:02', '2019-02-13 22:19:02'),
(829, 18, 195, 9, NULL, 50, 8, 'Active', '2019-02-13 22:19:22', '2019-02-13 22:19:22'),
(830, 18, 160, 9, NULL, 50, 8, 'Active', '2019-02-13 22:19:39', '2019-02-13 22:19:39'),
(831, 18, 159, 9, NULL, 50, 8, 'Active', '2019-02-13 22:19:58', '2019-02-13 22:19:58'),
(832, 18, 158, 9, NULL, 50, 8, 'Active', '2019-02-13 22:20:28', '2019-02-13 22:20:28'),
(833, 18, 194, 9, NULL, 50, 8, 'Active', '2019-02-13 22:21:12', '2019-02-13 22:21:12'),
(834, 18, 97, 9, 82, 50, 8, 'Active', '2019-02-13 22:21:35', '2019-02-13 22:21:35'),
(835, 18, 97, 9, 83, 50, 8, 'Active', '2019-02-13 22:21:52', '2019-02-13 22:21:52'),
(836, 18, 142, 7, NULL, 50, 8, 'Active', '2019-02-13 22:22:52', '2019-02-13 22:22:52'),
(837, 18, 141, 7, NULL, 50, 8, 'Active', '2019-02-13 22:23:10', '2019-02-13 22:23:10'),
(838, 18, 139, 7, NULL, 50, 8, 'Active', '2019-02-13 22:23:38', '2019-02-13 22:23:38'),
(839, 18, 138, 7, NULL, 50, 8, 'Active', '2019-02-13 22:24:17', '2019-02-13 22:24:17'),
(840, 18, 137, 7, NULL, 50, 8, 'Active', '2019-02-13 22:24:46', '2019-02-13 22:24:46'),
(841, 18, 136, 7, NULL, 50, 8, 'Active', '2019-02-13 22:25:12', '2019-02-13 22:25:12'),
(842, 18, 135, 7, NULL, 50, 8, 'Active', '2019-02-13 22:25:38', '2019-02-13 22:25:38'),
(843, 18, 134, 7, NULL, 50, 8, 'Active', '2019-02-13 22:25:58', '2019-02-13 22:25:58'),
(844, 18, 140, 7, NULL, 50, 8, 'Active', '2019-02-13 22:26:41', '2019-02-13 22:26:41'),
(845, 18, 108, 10, NULL, 50, 8, 'Active', '2019-02-13 22:27:08', '2019-02-13 22:27:08'),
(846, 18, 107, 10, NULL, 50, 8, 'Active', '2019-02-13 22:27:43', '2019-02-13 22:27:43'),
(847, 18, 106, 10, NULL, 50, 8, 'Active', '2019-02-13 22:28:05', '2019-02-13 22:28:05'),
(848, 18, 105, 10, NULL, 50, 8, 'Active', '2019-02-13 22:28:31', '2019-02-13 22:28:31'),
(849, 18, 104, 10, NULL, 50, 8, 'Active', '2019-02-13 22:28:52', '2019-02-13 22:28:52'),
(850, 18, 103, 10, NULL, 50, 8, 'Active', '2019-02-13 22:29:46', '2019-02-13 22:29:46'),
(851, 18, 101, 10, NULL, 50, 8, 'Active', '2019-02-13 22:30:53', '2019-02-13 22:30:53'),
(852, 18, 102, 10, NULL, 50, 8, 'Active', '2019-02-13 22:31:30', '2019-02-13 22:31:30'),
(853, 18, 122, 11, NULL, 50, 8, 'Active', '2019-02-13 22:32:09', '2019-02-13 22:32:09'),
(854, 18, 121, 11, NULL, 50, 8, 'Active', '2019-02-13 22:32:34', '2019-02-13 22:32:34'),
(855, 18, 120, 11, NULL, 50, 8, 'Active', '2019-02-13 22:32:56', '2019-02-13 22:32:56'),
(856, 18, 119, 11, NULL, 50, 8, 'Active', '2019-02-13 22:33:21', '2019-02-13 22:33:21'),
(857, 18, 118, 11, NULL, 50, 8, 'Active', '2019-02-13 22:34:28', '2019-02-13 22:34:28'),
(858, 18, 116, 11, NULL, 50, 8, 'Active', '2019-02-13 22:34:50', '2019-02-13 22:34:50'),
(859, 18, 117, 11, NULL, 50, 8, 'Active', '2019-02-13 22:35:14', '2019-02-13 22:35:14'),
(860, 18, 170, 12, NULL, 50, 8, 'Active', '2019-02-13 22:36:18', '2019-02-13 22:36:18'),
(861, 18, 169, 12, NULL, 50, 8, 'Active', '2019-02-13 22:36:36', '2019-02-13 22:36:36'),
(862, 18, 168, 12, NULL, 50, 8, 'Active', '2019-02-13 22:36:57', '2019-02-13 22:36:57'),
(863, 18, 166, 12, NULL, 50, 8, 'Active', '2019-02-13 22:37:18', '2019-02-13 22:37:18'),
(864, 18, 165, 12, NULL, 50, 8, 'Active', '2019-02-13 22:37:35', '2019-02-13 22:37:35'),
(865, 18, 167, 12, NULL, 50, 8, 'Active', '2019-02-13 22:37:59', '2019-02-13 22:37:59'),
(866, 18, 179, 13, NULL, 50, 8, 'Active', '2019-02-13 22:38:32', '2019-02-13 22:38:32'),
(867, 18, 178, 13, NULL, 50, 8, 'Active', '2019-02-13 22:38:54', '2019-02-13 22:38:54'),
(868, 18, 177, 13, NULL, 50, 8, 'Active', '2019-02-13 22:39:10', '2019-02-13 22:39:10'),
(869, 18, 176, 13, NULL, 50, 8, 'Active', '2019-02-13 22:39:28', '2019-02-13 22:39:28'),
(870, 18, 191, 14, NULL, 50, 8, 'Active', '2019-02-13 22:40:03', '2019-02-13 22:40:03'),
(871, 18, 190, 14, NULL, 50, 8, 'Active', '2019-02-13 22:40:20', '2019-02-13 22:40:20'),
(872, 18, 189, 14, NULL, 50, 8, 'Active', '2019-02-13 22:40:52', '2019-02-13 22:40:52'),
(873, 18, 188, 14, NULL, 50, 8, 'Active', '2019-02-13 22:41:13', '2019-02-13 22:41:13'),
(874, 18, 187, 14, NULL, 50, 8, 'Active', '2019-02-13 22:41:37', '2019-02-13 22:41:37'),
(875, 18, 186, 14, NULL, 50, 8, 'Active', '2019-02-13 22:41:54', '2019-02-13 22:41:54'),
(876, 18, 89, 6, 83, 50, 8, 'Active', '2019-02-13 22:43:59', '2019-02-13 22:43:59'),
(877, 18, 90, 6, NULL, 50, 8, 'Active', '2019-02-14 14:32:10', '2019-02-14 14:32:10'),
(878, 18, 133, 6, NULL, 50, 8, 'Active', '2019-02-14 14:32:33', '2019-02-14 14:32:33'),
(879, 18, 132, 6, NULL, 50, 8, 'Active', '2019-02-14 14:32:52', '2019-02-14 14:32:52'),
(880, 18, 131, 6, NULL, 50, 8, 'Active', '2019-02-14 14:33:08', '2019-02-14 14:33:08'),
(881, 18, 130, 6, NULL, 50, 8, 'Active', '2019-02-14 14:33:25', '2019-02-14 14:33:25'),
(882, 18, 129, 6, NULL, 50, 8, 'Active', '2019-02-14 14:33:41', '2019-02-14 14:33:41'),
(883, 18, 92, 6, NULL, 50, 8, 'Active', '2019-02-14 14:34:01', '2019-02-14 14:34:01'),
(884, 18, 143, 6, NULL, 50, 8, 'Active', '2019-02-14 14:34:22', '2019-02-14 14:34:22'),
(885, 18, 91, 6, 84, 50, 8, 'Active', '2019-02-14 14:34:42', '2019-02-14 14:34:42'),
(886, 18, 91, 6, 85, 50, 8, 'Active', '2019-02-14 14:34:57', '2019-02-14 14:34:57'),
(887, 18, 151, 7, NULL, 50, 8, 'Active', '2019-02-14 14:35:29', '2019-02-14 14:35:29'),
(888, 18, 149, 7, NULL, 50, 8, 'Active', '2019-02-14 14:35:49', '2019-02-14 14:35:49'),
(889, 18, 148, 7, NULL, 50, 8, 'Active', '2019-02-14 14:36:05', '2019-02-14 14:36:05'),
(890, 18, 147, 7, NULL, 50, 8, 'Active', '2019-02-14 14:36:21', '2019-02-14 14:36:21'),
(891, 18, 146, 7, NULL, 50, 8, 'Active', '2019-02-14 14:37:22', '2019-02-14 14:37:22'),
(892, 18, 145, 7, NULL, 50, 8, 'Active', '2019-02-14 14:37:36', '2019-02-14 14:37:36'),
(893, 18, 144, 7, NULL, 50, 8, 'Active', '2019-02-14 14:37:52', '2019-02-14 14:37:52'),
(894, 18, 150, 7, NULL, 50, 8, 'Active', '2019-02-14 14:38:11', '2019-02-14 14:38:11'),
(895, 18, 115, 10, NULL, 50, 8, 'Active', '2019-02-14 14:38:56', '2019-02-14 14:38:56'),
(896, 18, 114, 10, NULL, 50, 8, 'Active', '2019-02-14 14:39:11', '2019-02-14 14:39:11'),
(897, 18, 113, 10, NULL, 50, 8, 'Active', '2019-02-14 14:39:42', '2019-02-14 14:39:42'),
(898, 18, 112, 10, NULL, 50, 8, 'Active', '2019-02-14 14:40:07', '2019-02-14 14:40:07'),
(899, 18, 111, 10, NULL, 50, 8, 'Active', '2019-02-14 14:40:27', '2019-02-14 14:40:27'),
(900, 18, 110, 10, NULL, 50, 8, 'Active', '2019-02-14 14:40:44', '2019-02-14 14:40:44'),
(901, 18, 109, 10, NULL, 50, 8, 'Active', '2019-02-14 14:41:02', '2019-02-14 14:41:02'),
(902, 18, 204, 11, NULL, 50, 8, 'Active', '2019-02-14 14:41:27', '2019-02-14 14:41:27'),
(903, 18, 201, 9, NULL, 50, 8, 'Active', '2019-02-14 14:42:47', '2019-02-14 14:42:47'),
(904, 18, 200, 9, NULL, 50, 8, 'Active', '2019-02-14 14:43:08', '2019-02-14 14:43:08'),
(905, 18, 198, 9, NULL, 50, 8, 'Active', '2019-02-14 14:43:34', '2019-02-14 14:43:34'),
(906, 18, 197, 9, NULL, 50, 8, 'Active', '2019-02-14 14:43:54', '2019-02-14 14:43:54'),
(907, 18, 199, 9, NULL, 50, 8, 'Active', '2019-02-14 14:44:24', '2019-02-14 14:44:24'),
(908, 18, 202, 9, 84, 50, 8, 'Active', '2019-02-14 14:44:41', '2019-02-14 14:44:41'),
(909, 18, 202, 9, 85, 50, 8, 'Active', '2019-02-14 14:44:59', '2019-02-14 14:44:59'),
(910, 18, 175, 12, NULL, 50, 8, 'Active', '2019-02-14 14:45:59', '2019-02-14 14:45:59'),
(911, 18, 173, 12, NULL, 50, 8, 'Active', '2019-02-14 14:46:16', '2019-02-14 14:46:16'),
(912, 18, 172, 12, NULL, 50, 8, 'Active', '2019-02-14 14:46:33', '2019-02-14 14:46:33'),
(913, 18, 171, 12, NULL, 50, 8, 'Active', '2019-02-14 14:46:53', '2019-02-14 14:46:53'),
(914, 16, 184, 13, NULL, 50, 8, 'Active', '2019-02-14 14:47:36', '2019-03-27 00:17:43'),
(915, 18, 183, 13, NULL, 50, 8, 'Active', '2019-02-14 14:47:50', '2019-02-14 14:47:50'),
(916, 18, 182, 13, NULL, 50, 8, 'Active', '2019-02-14 14:48:09', '2019-02-14 14:48:09'),
(917, 16, 181, 13, NULL, 50, 8, 'Active', '2019-02-14 14:48:32', '2019-03-27 00:17:49'),
(918, 18, 193, 14, NULL, 50, 8, 'Active', '2019-02-14 14:48:52', '2019-02-14 14:48:52'),
(919, 18, 192, 14, NULL, 50, 8, 'Active', '2019-02-14 14:49:19', '2019-02-14 14:49:19');

-- --------------------------------------------------------

--
-- Table structure for table `t_schedule_items`
--

CREATE TABLE `t_schedule_items` (
  `Schedule_Items_ID` int(11) NOT NULL,
  `Schedule_Items_ScheduleID` int(11) NOT NULL,
  `Schedule_Items_RoomID` int(11) DEFAULT NULL,
  `Schedule_Items_Date` enum('M','T','W','TH','F','S','SU') NOT NULL,
  `Schedule_Items_Time_Start` time NOT NULL DEFAULT '00:00:00',
  `Schedule_Items_Time_End` time NOT NULL DEFAULT '00:00:00',
  `Schedule_Items_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Schedule_Items_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Schedule_Items_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_schedule_items`
--

INSERT INTO `t_schedule_items` (`Schedule_Items_ID`, `Schedule_Items_ScheduleID`, `Schedule_Items_RoomID`, `Schedule_Items_Date`, `Schedule_Items_Time_Start`, `Schedule_Items_Time_End`, `Schedule_Items_Display_Status`, `Schedule_Items_Date_Added`, `Schedule_Items_Date_Updated`) VALUES
(336, 421, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 19:46:12', '2018-10-23 19:46:12'),
(337, 422, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 19:46:37', '2018-10-23 19:46:37'),
(338, 423, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 19:47:11', '2018-10-23 19:47:11'),
(339, 424, 6, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-23 19:47:39', '2018-10-23 19:47:39'),
(340, 425, 7, 'F', '07:30:00', '10:30:00', 'Active', '2018-10-23 19:48:19', '2018-10-23 19:48:19'),
(341, 426, 1, 'S', '10:30:00', '13:30:00', 'Active', '2018-10-23 19:48:51', '2018-10-23 19:48:51'),
(342, 427, 4, 'T', '13:30:00', '16:30:00', 'Active', '2018-10-23 19:49:30', '2018-10-23 19:49:30'),
(343, 428, 2, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 19:50:06', '2018-10-23 19:50:06'),
(344, 429, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-23 19:52:43', '2018-10-23 19:52:43'),
(345, 430, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 19:53:04', '2018-10-23 19:53:04'),
(346, 431, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 20:00:32', '2018-10-23 20:00:32'),
(347, 432, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 20:01:05', '2018-10-23 20:01:05'),
(348, 433, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 20:01:26', '2018-10-23 20:01:26'),
(349, 434, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 20:01:54', '2018-10-23 20:01:54'),
(350, 435, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 20:02:22', '2018-10-23 20:02:22'),
(351, 436, 2, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 20:02:44', '2018-10-23 20:02:44'),
(352, 437, 4, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-23 20:03:10', '2018-10-23 20:03:10'),
(353, 438, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 20:03:28', '2018-10-23 20:03:28'),
(354, 439, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 20:54:32', '2018-10-23 20:54:32'),
(355, 440, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 20:54:58', '2018-10-23 20:54:58'),
(356, 441, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 20:55:25', '2018-10-23 20:55:25'),
(357, 442, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 20:55:56', '2018-10-23 20:55:56'),
(358, 443, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 20:56:23', '2018-10-23 20:56:23'),
(359, 444, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 20:56:46', '2018-10-23 20:56:46'),
(360, 445, 1, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-23 20:57:10', '2018-10-23 20:57:10'),
(361, 446, 4, 'T', '13:30:00', '16:30:00', 'Inactive', '2018-10-23 20:57:55', '2018-10-23 20:58:03'),
(362, 446, 1, 'T', '13:30:00', '16:30:00', 'Inactive', '2018-10-23 20:58:04', '2018-10-23 20:58:11'),
(363, 446, 1, 'T', '13:30:00', '16:30:00', 'Active', '2018-10-23 20:58:12', '2018-10-23 20:58:12'),
(364, 447, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 20:58:34', '2018-10-23 20:58:34'),
(365, 448, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-23 20:58:52', '2018-10-23 20:58:52'),
(366, 449, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 20:59:22', '2018-10-23 20:59:22'),
(367, 450, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 20:59:41', '2018-10-23 20:59:41'),
(368, 451, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 21:00:16', '2018-10-23 21:00:16'),
(369, 452, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 21:00:43', '2018-10-23 21:00:43'),
(370, 453, 1, 'F', '07:30:00', '10:30:00', 'Active', '2018-10-23 21:01:05', '2018-10-23 21:01:05'),
(371, 454, 2, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 21:01:23', '2018-10-23 21:01:23'),
(372, 455, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 21:01:48', '2018-10-23 21:01:48'),
(373, 456, 1, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-23 21:02:05', '2018-10-23 21:02:05'),
(374, 457, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 21:25:30', '2018-10-23 21:25:30'),
(375, 458, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 21:26:13', '2018-10-23 21:26:13'),
(376, 459, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 21:26:33', '2018-10-23 21:26:33'),
(377, 460, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 21:26:56', '2018-10-23 21:26:56'),
(378, 461, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 21:27:23', '2018-10-23 21:27:23'),
(379, 462, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 21:27:42', '2018-10-23 21:27:42'),
(380, 463, 1, 'M', '10:30:00', '13:30:00', 'Inactive', '2018-10-23 21:28:08', '2018-10-23 21:28:36'),
(381, 463, 1, 'T', '10:30:00', '13:30:00', 'Inactive', '2018-10-23 21:28:36', '2018-10-23 21:28:49'),
(382, 463, 1, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 21:28:49', '2018-10-23 21:28:49'),
(383, 464, 2, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 21:29:26', '2018-10-23 21:29:26'),
(384, 465, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-23 21:30:02', '2018-10-23 21:30:02'),
(385, 466, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 21:30:18', '2018-10-23 21:30:18'),
(386, 467, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 21:31:35', '2018-10-23 21:31:35'),
(387, 468, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 21:31:58', '2018-10-23 21:31:58'),
(388, 469, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 21:32:22', '2018-10-23 21:32:22'),
(389, 470, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 21:32:45', '2018-10-23 21:32:45'),
(390, 471, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 21:33:04', '2018-10-23 21:33:04'),
(391, 472, 1, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 21:33:26', '2018-10-23 21:33:26'),
(392, 473, 4, 'S', '07:30:00', '12:30:00', 'Active', '2018-10-23 21:33:45', '2018-10-23 21:33:45'),
(393, 474, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 21:34:00', '2018-10-23 21:34:00'),
(394, 475, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 21:34:43', '2018-10-23 21:34:43'),
(395, 476, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 21:35:04', '2018-10-23 21:35:04'),
(396, 477, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 21:35:24', '2018-10-23 21:35:24'),
(397, 478, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 21:35:58', '2018-10-23 21:35:58'),
(398, 479, 1, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 21:36:21', '2018-10-23 21:36:21'),
(399, 480, 5, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 21:36:47', '2018-10-23 21:36:47'),
(400, 481, 6, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-23 21:37:14', '2018-10-23 21:37:14'),
(401, 482, 7, 'T', '13:30:00', '16:30:00', 'Active', '2018-10-23 21:37:38', '2018-10-23 21:37:38'),
(402, 483, 8, 'W', '16:30:00', '18:00:00', 'Active', '2018-10-23 21:37:59', '2018-10-23 21:37:59'),
(403, 484, 6, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 21:38:26', '2018-10-23 21:38:26'),
(404, 485, 7, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 21:38:48', '2018-10-23 21:38:48'),
(405, 486, 8, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 21:39:28', '2018-10-23 21:39:28'),
(406, 487, 1, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 21:39:54', '2018-10-23 21:39:54'),
(407, 488, 4, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 21:40:18', '2018-10-23 21:40:18'),
(408, 489, 7, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 21:40:55', '2018-10-23 21:40:55'),
(409, 490, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 22:40:14', '2018-10-23 22:40:14'),
(410, 491, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 22:40:31', '2018-10-23 22:40:31'),
(411, 492, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 22:40:54', '2018-10-23 22:40:54'),
(412, 493, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 22:41:13', '2018-10-23 22:41:13'),
(413, 494, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 22:41:34', '2018-10-23 22:41:34'),
(414, 495, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 22:41:52', '2018-10-23 22:41:52'),
(415, 496, 1, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-23 22:42:15', '2018-10-23 22:42:15'),
(416, 497, 4, 'T', '13:30:00', '16:30:00', 'Active', '2018-10-23 22:42:40', '2018-10-23 22:42:40'),
(417, 498, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 22:43:02', '2018-10-23 22:43:02'),
(418, 499, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-23 22:43:17', '2018-10-23 22:43:17'),
(419, 500, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 22:43:41', '2018-10-23 22:43:41'),
(420, 501, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 22:43:55', '2018-10-23 22:43:55'),
(421, 502, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 22:44:13', '2018-10-23 22:44:13'),
(422, 503, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 22:44:37', '2018-10-23 22:44:37'),
(423, 504, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 22:45:20', '2018-10-23 22:45:20'),
(424, 505, 1, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 22:45:48', '2018-10-23 22:45:48'),
(425, 506, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 22:46:07', '2018-10-23 22:46:07'),
(426, 507, 4, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-23 22:46:30', '2018-10-23 22:46:30'),
(427, 508, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 22:47:06', '2018-10-23 22:47:06'),
(428, 509, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 22:47:41', '2018-10-23 22:47:41'),
(429, 510, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 22:48:02', '2018-10-23 22:48:02'),
(430, 511, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 22:48:27', '2018-10-23 22:48:27'),
(431, 512, 1, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 22:48:52', '2018-10-23 22:48:52'),
(432, 513, 5, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 22:49:22', '2018-10-23 22:49:22'),
(433, 514, 6, 'M', '13:30:00', '16:30:00', 'Active', '2018-10-23 22:49:41', '2018-10-23 22:49:41'),
(434, 515, 7, 'T', '16:30:00', '18:00:00', 'Active', '2018-10-23 22:50:04', '2018-10-23 22:50:04'),
(435, 516, 6, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 22:50:31', '2018-10-23 22:50:31'),
(436, 517, 7, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 22:50:45', '2018-10-23 22:50:45'),
(437, 518, 8, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 22:51:05', '2018-10-23 22:51:05'),
(438, 519, 1, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 22:51:28', '2018-10-23 22:51:28'),
(439, 520, 4, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 22:51:52', '2018-10-23 22:51:52'),
(440, 521, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:31:54', '2018-10-23 23:31:54'),
(441, 522, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 23:32:41', '2018-10-23 23:32:41'),
(442, 523, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 23:33:02', '2018-10-23 23:33:02'),
(443, 524, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 23:33:39', '2018-10-23 23:33:39'),
(444, 525, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 23:34:04', '2018-10-23 23:34:04'),
(445, 526, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:34:21', '2018-10-23 23:34:21'),
(446, 527, 1, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-23 23:34:45', '2018-10-23 23:34:45'),
(447, 528, 4, 'T', '13:30:00', '16:30:00', 'Inactive', '2018-10-23 23:35:16', '2018-10-23 23:35:25'),
(448, 528, 2, 'T', '13:30:00', '16:30:00', 'Inactive', '2018-10-23 23:35:25', '2018-10-23 23:35:31'),
(449, 528, 2, 'T', '13:30:00', '16:30:00', 'Active', '2018-10-23 23:35:31', '2018-10-23 23:35:31'),
(450, 529, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-23 23:35:58', '2018-10-23 23:35:58'),
(451, 530, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 23:36:15', '2018-10-23 23:36:15'),
(452, 531, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:36:54', '2018-10-23 23:36:54'),
(453, 532, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 23:37:11', '2018-10-23 23:37:11'),
(454, 533, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 23:37:36', '2018-10-23 23:37:36'),
(455, 534, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 23:38:00', '2018-10-23 23:38:00'),
(456, 535, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 23:38:23', '2018-10-23 23:38:23'),
(457, 536, 1, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:38:49', '2018-10-23 23:38:49'),
(458, 537, 4, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-23 23:39:10', '2018-10-23 23:39:10'),
(459, 538, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-23 23:39:29', '2018-10-23 23:39:29'),
(460, 539, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:39:55', '2018-10-23 23:39:55'),
(461, 540, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 23:40:17', '2018-10-23 23:40:17'),
(462, 541, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 23:40:44', '2018-10-23 23:40:44'),
(463, 542, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 23:41:11', '2018-10-23 23:41:11'),
(464, 543, 1, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 23:41:42', '2018-10-23 23:41:42'),
(465, 544, 5, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:42:02', '2018-10-23 23:42:02'),
(466, 545, 6, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-23 23:42:25', '2018-10-23 23:42:25'),
(467, 546, 7, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 23:42:55', '2018-10-23 23:42:55'),
(468, 547, 8, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 23:43:13', '2018-10-23 23:43:13'),
(469, 548, 6, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:43:43', '2018-10-23 23:43:43'),
(470, 549, 8, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 23:44:18', '2018-10-23 23:44:18'),
(471, 550, 1, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 23:44:46', '2018-10-23 23:44:46'),
(472, 551, 4, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 23:45:05', '2018-10-23 23:45:05'),
(473, 552, 5, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 23:45:26', '2018-10-23 23:45:26'),
(474, 553, 6, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:45:51', '2018-10-23 23:45:51'),
(475, 554, 7, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:46:30', '2018-10-23 23:46:30'),
(476, 555, 1, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-23 23:46:49', '2018-10-23 23:46:49'),
(477, 556, 4, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-23 23:47:11', '2018-10-23 23:47:11'),
(478, 557, 5, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-23 23:47:33', '2018-10-23 23:47:33'),
(479, 558, 6, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-23 23:47:52', '2018-10-23 23:47:52'),
(480, 559, 7, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:48:09', '2018-10-23 23:48:09'),
(481, 560, 8, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:48:25', '2018-10-23 23:48:25'),
(482, 561, 1, 'T', '14:00:00', '17:00:00', 'Active', '2018-10-23 23:49:14', '2018-10-23 23:49:14'),
(483, 562, 8, 'T', '07:30:00', '10:30:00', 'Active', '2018-10-23 23:50:11', '2018-10-23 23:50:11'),
(484, 563, 1, 'W', '10:30:00', '13:30:00', 'Active', '2018-10-23 23:50:28', '2018-10-23 23:50:28'),
(485, 564, 4, 'TH', '13:30:00', '16:30:00', 'Active', '2018-10-23 23:50:46', '2018-10-23 23:50:46'),
(486, 565, 4, 'F', '16:30:00', '18:00:00', 'Active', '2018-10-23 23:51:30', '2018-10-23 23:51:30'),
(487, 566, 1, 'S', '18:00:00', '21:00:00', 'Active', '2018-10-23 23:52:06', '2018-10-23 23:52:06'),
(488, 567, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:17:49', '2018-10-24 01:17:49'),
(489, 568, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 01:18:04', '2018-10-24 01:18:04'),
(490, 569, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 01:18:23', '2018-10-24 01:18:23'),
(491, 570, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 01:18:43', '2018-10-24 01:18:43'),
(492, 571, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 01:19:00', '2018-10-24 01:19:00'),
(493, 572, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:19:15', '2018-10-24 01:19:15'),
(494, 573, 4, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-10-24 01:19:39', '2018-10-24 01:20:15'),
(495, 574, 1, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 01:20:01', '2018-10-24 01:20:01'),
(496, 573, 2, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:20:15', '2018-10-24 01:20:15'),
(497, 575, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-24 01:20:33', '2018-10-24 01:20:33'),
(498, 576, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-24 01:20:59', '2018-10-24 01:20:59'),
(499, 577, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:21:21', '2018-10-24 01:21:21'),
(500, 578, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 01:21:36', '2018-10-24 01:21:36'),
(501, 579, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 01:21:54', '2018-10-24 01:21:54'),
(502, 580, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 01:22:19', '2018-10-24 01:22:19'),
(503, 581, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 01:22:35', '2018-10-24 01:22:35'),
(504, 582, 2, 'S', '13:30:00', '16:30:00', 'Active', '2018-10-24 01:23:15', '2018-10-24 01:23:15'),
(505, 583, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-24 01:23:30', '2018-10-24 01:23:30'),
(506, 584, 1, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-24 01:23:48', '2018-10-24 01:23:48'),
(507, 585, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:24:18', '2018-10-24 01:24:18'),
(508, 586, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 01:24:35', '2018-10-24 01:24:35'),
(509, 587, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 01:24:53', '2018-10-24 01:24:53'),
(510, 588, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 01:25:09', '2018-10-24 01:25:09'),
(511, 589, 1, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 01:25:24', '2018-10-24 01:25:24'),
(512, 590, 4, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:26:06', '2018-10-24 01:26:06'),
(513, 591, 5, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-24 01:26:23', '2018-10-24 01:26:23'),
(514, 592, 2, 'T', '16:30:00', '18:00:00', 'Active', '2018-10-24 01:27:00', '2018-10-24 01:27:00'),
(515, 593, 6, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:27:19', '2018-10-24 01:27:19'),
(516, 594, 7, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 01:27:34', '2018-10-24 01:27:34'),
(517, 595, 8, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 01:27:51', '2018-10-24 01:27:51'),
(518, 596, 1, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 01:28:15', '2018-10-24 01:28:15'),
(519, 597, 4, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 01:28:33', '2018-10-24 01:28:33'),
(520, 598, 7, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:28:56', '2018-10-24 01:28:56'),
(521, 599, 8, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 01:29:45', '2018-10-24 01:29:45'),
(522, 600, 1, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 01:30:05', '2018-10-24 01:30:05'),
(523, 601, 4, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 01:30:25', '2018-10-24 01:30:25'),
(524, 602, 5, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 01:30:45', '2018-10-24 01:30:45'),
(525, 603, 6, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:31:00', '2018-10-24 01:31:00'),
(526, 604, 7, 'M', '14:00:00', '17:00:00', 'Active', '2018-10-24 01:31:44', '2018-10-24 01:31:44'),
(527, 605, 8, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 01:32:07', '2018-10-24 01:32:07'),
(528, 606, 2, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 01:32:42', '2018-10-24 01:32:42'),
(529, 607, 4, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 01:33:28', '2018-10-24 01:33:28'),
(530, 608, 5, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 01:33:54', '2018-10-24 01:33:54'),
(531, 609, 6, 'F', '06:00:00', '21:00:00', 'Active', '2018-10-24 01:34:12', '2018-10-24 01:34:12'),
(532, 610, 1, 'TH', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:16:21', '2018-10-24 02:16:21'),
(533, 611, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:22:36', '2018-10-24 02:22:36'),
(534, 612, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:22:51', '2018-10-24 02:22:51'),
(535, 613, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:23:10', '2018-10-24 02:23:10'),
(536, 614, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 02:23:31', '2018-10-24 02:23:31'),
(537, 615, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 02:23:52', '2018-10-24 02:23:52'),
(538, 616, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:24:05', '2018-10-24 02:24:05'),
(539, 617, 1, 'M', '14:00:00', '17:00:00', 'Active', '2018-10-24 02:25:00', '2018-10-24 02:25:00'),
(540, 618, 1, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:25:29', '2018-10-24 02:25:29'),
(541, 619, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-24 02:25:52', '2018-10-24 02:25:52'),
(542, 620, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-24 02:26:10', '2018-10-24 02:26:10'),
(543, 621, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:26:29', '2018-10-24 02:26:29'),
(544, 622, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:26:45', '2018-10-24 02:26:45'),
(545, 623, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:27:03', '2018-10-24 02:27:03'),
(546, 624, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 02:27:33', '2018-10-24 02:27:33'),
(547, 625, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 02:27:55', '2018-10-24 02:27:55'),
(548, 626, 1, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:28:12', '2018-10-24 02:28:12'),
(549, 627, 4, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-24 02:28:40', '2018-10-24 02:28:40'),
(550, 628, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-24 02:28:54', '2018-10-24 02:28:54'),
(551, 629, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:29:24', '2018-10-24 02:29:24'),
(552, 630, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:29:47', '2018-10-24 02:29:47'),
(553, 631, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:30:03', '2018-10-24 02:30:03'),
(554, 632, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 02:30:37', '2018-10-24 02:30:37'),
(555, 633, 1, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 02:30:59', '2018-10-24 02:30:59'),
(556, 634, 5, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:31:25', '2018-10-24 02:31:25'),
(557, 635, 2, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:32:02', '2018-10-24 02:32:02'),
(558, 636, 7, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:32:29', '2018-10-24 02:32:29'),
(559, 637, 8, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:32:53', '2018-10-24 02:32:53'),
(560, 638, 7, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:33:36', '2018-10-24 02:33:36'),
(561, 639, 8, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:33:55', '2018-10-24 02:33:55'),
(562, 640, 1, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:34:27', '2018-10-24 02:34:27'),
(563, 641, 4, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 02:34:51', '2018-10-24 02:34:51'),
(564, 642, 5, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 02:35:16', '2018-10-24 02:35:16'),
(565, 643, 6, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:35:33', '2018-10-24 02:35:33'),
(566, 644, 1, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:37:04', '2018-10-24 02:37:04'),
(567, 645, 4, 'T', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:37:37', '2018-10-24 02:37:37'),
(568, 646, 5, 'W', '16:30:00', '18:00:00', 'Active', '2018-10-24 02:38:02', '2018-10-24 02:38:02'),
(569, 647, 6, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-24 02:38:24', '2018-10-24 02:38:24'),
(570, 648, 7, 'F', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:38:44', '2018-10-24 02:38:44'),
(571, 649, 8, 'S', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:39:07', '2018-10-24 02:39:07'),
(572, 650, 4, 'M', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:40:21', '2018-10-24 02:40:21'),
(573, 651, 1, 'T', '16:30:00', '18:00:00', 'Active', '2018-10-24 02:40:42', '2018-10-24 02:40:42'),
(574, 652, 1, 'T', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:41:12', '2018-10-24 02:41:12'),
(575, 653, 4, 'W', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:41:32', '2018-10-24 02:41:32'),
(576, 654, 5, 'TH', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:41:57', '2018-10-24 02:41:57'),
(577, 655, 6, 'F', '16:30:00', '18:00:00', 'Active', '2018-10-24 02:42:28', '2018-10-24 02:42:28'),
(578, 656, 7, 'S', '18:00:00', '21:00:00', 'Active', '2018-10-24 02:42:53', '2018-10-24 02:42:53'),
(579, 657, 1, 'W', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:43:19', '2018-10-24 02:43:19'),
(580, 658, 4, 'TH', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:43:33', '2018-10-24 02:43:33'),
(581, 659, 5, 'F', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:43:51', '2018-10-24 02:43:51'),
(582, 660, 6, 'S', '16:30:00', '18:00:00', 'Active', '2018-10-24 02:44:12', '2018-10-24 02:44:12'),
(583, 661, 7, 'M', '18:00:00', '21:00:00', 'Active', '2018-10-24 02:44:31', '2018-10-24 02:44:31'),
(584, 662, 8, 'T', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:44:49', '2018-10-24 02:44:49'),
(585, 663, 1, 'W', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:45:08', '2018-10-24 02:45:08'),
(586, 664, 1, 'TH', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:45:43', '2018-10-24 02:45:43'),
(587, 665, 4, 'F', '10:30:00', '13:30:00', 'Active', '2018-10-24 02:46:06', '2018-10-24 02:46:06'),
(588, 666, 5, 'S', '13:30:00', '16:30:00', 'Active', '2018-10-24 02:46:23', '2018-10-24 02:46:23'),
(589, 667, 6, 'M', '16:30:00', '18:00:00', 'Active', '2018-10-24 02:46:44', '2018-10-24 02:46:44'),
(590, 668, 7, 'T', '18:00:00', '21:00:00', 'Active', '2018-10-24 02:47:08', '2018-10-24 02:47:08'),
(591, 669, 7, 'W', '07:30:00', '10:30:00', 'Active', '2018-10-24 02:47:23', '2018-10-24 02:47:23'),
(592, 670, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:09:07', '2018-10-24 04:09:07'),
(593, 671, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 04:09:20', '2018-10-24 04:09:20'),
(594, 672, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 04:09:39', '2018-10-24 04:09:39'),
(595, 673, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 04:09:58', '2018-10-24 04:09:58'),
(596, 674, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 04:10:18', '2018-10-24 04:10:18'),
(597, 675, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:10:32', '2018-10-24 04:10:32'),
(598, 676, 1, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-24 04:10:54', '2018-10-24 04:10:54'),
(599, 677, 4, 'T', '13:30:00', '16:30:00', 'Active', '2018-10-24 04:11:14', '2018-10-24 04:11:14'),
(600, 678, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-24 04:11:30', '2018-10-24 04:11:30'),
(601, 679, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-24 04:11:48', '2018-10-24 04:11:48'),
(602, 680, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:12:09', '2018-10-24 04:12:09'),
(603, 681, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 04:12:25', '2018-10-24 04:12:25'),
(604, 682, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 04:12:47', '2018-10-24 04:12:47'),
(605, 683, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 04:13:14', '2018-10-24 04:13:14'),
(606, 684, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 04:13:36', '2018-10-24 04:13:36'),
(607, 685, 2, 'M', '14:00:00', '17:00:00', 'Active', '2018-10-24 04:14:09', '2018-10-24 04:14:09'),
(608, 686, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-24 04:14:23', '2018-10-24 04:14:23'),
(609, 687, 1, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-24 04:14:41', '2018-10-24 04:14:41'),
(610, 688, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:15:04', '2018-10-24 04:15:04'),
(611, 689, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 04:15:29', '2018-10-24 04:15:29'),
(612, 690, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 04:15:52', '2018-10-24 04:15:52'),
(613, 691, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 04:16:14', '2018-10-24 04:16:14'),
(614, 692, 1, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 04:16:37', '2018-10-24 04:16:37'),
(615, 693, 4, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:16:55', '2018-10-24 04:16:55'),
(616, 694, 2, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:17:26', '2018-10-24 04:17:26'),
(617, 695, 1, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 04:18:02', '2018-10-24 04:18:02'),
(618, 696, 6, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:18:31', '2018-10-24 04:18:31'),
(619, 697, 7, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-24 04:18:46', '2018-10-24 04:18:46'),
(620, 698, 8, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-24 04:19:09', '2018-10-24 04:19:09'),
(621, 699, 1, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-24 04:19:34', '2018-10-24 04:19:34'),
(622, 700, 4, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-24 04:20:02', '2018-10-24 04:20:02'),
(623, 701, 1, 'T', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:21:50', '2018-10-24 04:21:50'),
(624, 702, 4, 'W', '10:30:00', '13:30:00', 'Active', '2018-10-24 04:22:07', '2018-10-24 04:22:07'),
(625, 703, 5, 'TH', '13:30:00', '16:30:00', 'Active', '2018-10-24 04:22:38', '2018-10-24 04:22:38'),
(626, 704, 6, 'F', '16:30:00', '18:00:00', 'Active', '2018-10-24 04:22:58', '2018-10-24 04:22:58'),
(627, 705, 7, 'S', '18:00:00', '21:00:00', 'Active', '2018-10-24 04:23:19', '2018-10-24 04:23:19'),
(628, 706, 8, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:23:35', '2018-10-24 04:23:35'),
(629, 707, 1, 'T', '14:00:00', '17:00:00', 'Active', '2018-10-24 04:24:09', '2018-10-24 04:24:09'),
(630, 708, 1, 'W', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:24:35', '2018-10-24 04:24:35'),
(631, 709, 4, 'TH', '10:30:00', '13:30:00', 'Active', '2018-10-24 04:24:52', '2018-10-24 04:24:52'),
(632, 710, 5, 'F', '13:30:00', '16:30:00', 'Active', '2018-10-24 04:25:13', '2018-10-24 04:25:13'),
(633, 711, 6, 'S', '16:30:00', '18:00:00', 'Active', '2018-10-24 04:25:45', '2018-10-24 04:25:45'),
(634, 712, 7, 'M', '18:00:00', '21:00:00', 'Active', '2018-10-24 04:26:05', '2018-10-24 04:26:05'),
(635, 713, 4, 'S', '14:00:00', '17:00:00', 'Inactive', '2018-10-24 04:26:38', '2018-10-24 05:10:37'),
(636, 714, 1, 'TH', '07:30:00', '10:30:00', 'Active', '2018-10-24 04:27:12', '2018-10-24 04:27:12'),
(637, 715, 4, 'F', '10:30:00', '13:30:00', 'Active', '2018-10-24 04:27:50', '2018-10-24 04:27:50'),
(638, 713, 4, 'S', '14:00:00', '17:00:00', 'Active', '2018-10-24 05:10:38', '2018-10-24 05:10:38'),
(639, 716, 4, 'W', '10:30:00', '13:30:00', 'Active', '2018-10-24 05:13:15', '2018-10-24 05:13:15'),
(640, 717, 1, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:12:59', '2019-02-04 22:12:59'),
(641, 718, 4, 'T', '10:30:00', '13:30:00', 'Active', '2019-02-04 22:13:36', '2019-02-04 22:13:36'),
(642, 719, 5, 'W', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:13:54', '2019-02-04 22:13:54'),
(643, 720, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2019-02-04 22:14:42', '2019-02-04 22:14:42'),
(644, 721, 7, 'F', '18:00:00', '21:00:00', 'Active', '2019-02-04 22:15:12', '2019-02-04 22:15:12'),
(645, 722, 8, 'S', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:15:40', '2019-02-04 22:15:40'),
(646, 723, 1, 'M', '10:30:00', '13:30:00', 'Active', '2019-02-04 22:16:26', '2019-02-04 22:16:26'),
(647, 724, 4, 'T', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:16:47', '2019-02-04 22:16:47'),
(648, 725, 2, 'S', '07:30:00', '12:00:00', 'Active', '2019-02-04 22:17:16', '2019-02-04 22:17:16'),
(649, 726, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2019-02-04 22:17:40', '2019-02-04 22:17:40'),
(650, 727, 1, 'W', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:18:12', '2019-02-04 22:18:12'),
(651, 728, 4, 'TH', '10:30:00', '13:30:00', 'Active', '2019-02-04 22:18:35', '2019-02-04 22:18:35'),
(652, 729, 5, 'F', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:19:01', '2019-02-04 22:19:01'),
(653, 730, 6, 'S', '16:30:00', '18:00:00', 'Active', '2019-02-04 22:19:26', '2019-02-04 22:19:26'),
(654, 731, 6, 'M', '18:00:00', '21:00:00', 'Inactive', '2019-02-04 22:21:01', '2019-02-04 22:21:13'),
(655, 731, 7, 'M', '18:00:00', '21:00:00', 'Active', '2019-02-04 22:21:13', '2019-02-04 22:21:13'),
(656, 732, 8, 'T', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:21:34', '2019-02-04 22:21:34'),
(657, 733, 1, 'W', '10:30:00', '13:30:00', 'Active', '2019-02-04 22:21:53', '2019-02-04 22:21:53'),
(658, 734, 4, 'TH', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:22:14', '2019-02-04 22:22:14'),
(659, 735, 5, 'TH', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:22:54', '2019-02-04 22:22:54'),
(660, 736, 1, 'M', '16:30:00', '18:00:00', 'Active', '2019-02-04 22:23:43', '2019-02-04 22:23:43'),
(661, 737, 4, 'T', '18:00:00', '21:00:00', 'Active', '2019-02-04 22:24:03', '2019-02-04 22:24:03'),
(662, 738, 5, 'W', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:24:18', '2019-02-04 22:24:18'),
(663, 739, 6, 'TH', '10:30:00', '13:30:00', 'Active', '2019-02-04 22:24:44', '2019-02-04 22:24:44'),
(664, 740, 7, 'F', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:25:30', '2019-02-04 22:25:30'),
(665, 741, 8, 'S', '16:30:00', '18:00:00', 'Active', '2019-02-04 22:25:58', '2019-02-04 22:25:58'),
(666, 742, 4, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:26:18', '2019-02-04 22:26:18'),
(667, 743, 5, 'T', '10:30:00', '13:30:00', 'Active', '2019-02-04 22:26:43', '2019-02-04 22:26:43'),
(668, 744, 1, 'M', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:27:21', '2019-02-04 22:27:21'),
(669, 745, 1, 'T', '16:30:00', '18:00:00', 'Active', '2019-02-04 22:27:48', '2019-02-04 22:27:48'),
(670, 746, 5, 'W', '18:00:00', '21:00:00', 'Active', '2019-02-04 22:28:53', '2019-02-04 22:28:53'),
(671, 747, 6, 'TH', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:29:18', '2019-02-04 22:29:18'),
(672, 748, 7, 'F', '10:30:00', '13:30:00', 'Active', '2019-02-04 22:29:37', '2019-02-04 22:29:37'),
(673, 749, 8, 'S', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:30:05', '2019-02-04 22:30:05'),
(674, 750, 4, 'M', '16:30:00', '18:00:00', 'Active', '2019-02-04 22:30:49', '2019-02-04 22:30:49'),
(675, 751, 4, 'W', '10:30:00', '13:30:00', 'Active', '2019-02-04 22:54:06', '2019-02-04 22:54:06'),
(676, 752, 5, 'TH', '10:30:00', '13:30:00', 'Inactive', '2019-02-04 22:54:27', '2019-02-04 22:55:27'),
(677, 752, 6, 'TH', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:55:27', '2019-02-04 22:55:27'),
(678, 753, 5, 'F', '16:30:00', '18:00:00', 'Active', '2019-02-04 22:55:54', '2019-02-04 22:55:54'),
(679, 754, 7, 'S', '18:00:00', '21:00:00', 'Active', '2019-02-04 22:56:20', '2019-02-04 22:56:20'),
(680, 755, 8, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:56:40', '2019-02-04 22:56:40'),
(681, 756, 1, 'T', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:57:01', '2019-02-04 22:57:01'),
(682, 757, 1, 'S', '07:30:00', '12:00:00', 'Active', '2019-02-04 22:57:26', '2019-02-04 22:57:26'),
(683, 758, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2019-02-04 22:57:42', '2019-02-04 22:57:42'),
(684, 759, 5, 'TH', '07:30:00', '10:30:00', 'Active', '2019-02-04 22:58:16', '2019-02-04 22:58:16'),
(685, 760, 7, 'TH', '10:30:00', '13:30:00', 'Inactive', '2019-02-04 22:58:39', '2019-02-04 22:59:03'),
(686, 760, 6, 'F', '10:30:00', '13:30:00', 'Active', '2019-02-04 22:59:04', '2019-02-04 22:59:04'),
(687, 761, 7, 'S', '13:30:00', '16:30:00', 'Active', '2019-02-04 22:59:24', '2019-02-04 22:59:24'),
(688, 762, 8, 'M', '16:30:00', '18:00:00', 'Active', '2019-02-04 22:59:47', '2019-02-04 22:59:47'),
(689, 763, 4, 'T', '07:30:00', '10:30:00', 'Active', '2019-02-04 23:00:06', '2019-02-04 23:00:06'),
(690, 764, 5, 'W', '10:30:00', '13:30:00', 'Active', '2019-02-04 23:00:26', '2019-02-04 23:00:26'),
(691, 765, 1, 'TH', '07:30:00', '10:30:00', 'Active', '2019-02-04 23:00:52', '2019-02-04 23:00:52'),
(692, 766, 4, 'F', '10:30:00', '13:30:00', 'Active', '2019-02-04 23:01:15', '2019-02-04 23:01:15'),
(693, 767, 5, 'S', '13:30:00', '16:30:00', 'Active', '2019-02-04 23:01:48', '2019-02-04 23:01:48'),
(694, 768, 6, 'M', '16:30:00', '18:00:00', 'Active', '2019-02-04 23:02:06', '2019-02-04 23:02:06'),
(695, 769, 5, 'T', '07:30:00', '10:30:00', 'Active', '2019-02-04 23:02:32', '2019-02-04 23:02:32'),
(696, 770, 6, 'W', '10:30:00', '13:30:00', 'Active', '2019-02-04 23:02:49', '2019-02-04 23:02:49'),
(697, 771, 7, 'TH', '13:30:00', '16:30:00', 'Active', '2019-02-04 23:03:19', '2019-02-04 23:03:19'),
(698, 772, 8, 'F', '16:30:00', '18:00:00', 'Active', '2019-02-04 23:03:46', '2019-02-04 23:03:46'),
(699, 773, 1, 'S', '18:00:00', '21:00:00', 'Active', '2019-02-04 23:04:16', '2019-02-04 23:04:16'),
(700, 774, 5, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-04 23:04:35', '2019-02-04 23:04:35'),
(701, 775, 1, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:30:38', '2019-02-05 10:30:38'),
(702, 776, 4, 'T', '10:30:00', '13:30:00', 'Active', '2019-02-05 10:30:52', '2019-02-05 10:30:52'),
(703, 777, 5, 'W', '13:30:00', '16:30:00', 'Active', '2019-02-05 10:31:08', '2019-02-05 10:31:08'),
(704, 778, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2019-02-05 10:31:29', '2019-02-05 10:31:29'),
(705, 779, 7, 'F', '18:00:00', '21:00:00', 'Active', '2019-02-05 10:31:46', '2019-02-05 10:31:46'),
(706, 780, 8, 'S', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:32:01', '2019-02-05 10:32:01'),
(707, 781, 1, 'M', '10:30:00', '13:30:00', 'Active', '2019-02-05 10:32:18', '2019-02-05 10:32:18'),
(708, 782, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2019-02-05 10:32:42', '2019-02-05 10:32:42'),
(709, 783, 2, 'S', '07:30:00', '12:00:00', 'Active', '2019-02-05 10:32:56', '2019-02-05 10:32:56'),
(710, 784, 2, 'T', '04:30:00', '18:00:00', 'Active', '2019-02-05 10:33:18', '2019-02-05 10:33:18'),
(711, 785, 4, 'M', '10:30:00', '13:30:00', 'Active', '2019-02-05 10:33:50', '2019-02-05 10:33:50'),
(712, 786, 4, 'T', '13:30:00', '16:30:00', 'Inactive', '2019-02-05 10:34:07', '2019-02-05 10:34:45'),
(713, 786, 5, 'T', '13:30:00', '16:30:00', 'Active', '2019-02-05 10:34:45', '2019-02-05 10:34:45'),
(714, 787, 6, 'W', '18:00:00', '21:00:00', 'Inactive', '2019-02-05 10:35:08', '2019-02-05 10:35:21'),
(715, 787, 6, 'W', '16:30:00', '18:00:00', 'Active', '2019-02-05 10:35:21', '2019-02-05 10:35:21'),
(716, 788, 7, 'TH', '18:00:00', '21:00:00', 'Active', '2019-02-05 10:35:45', '2019-02-05 10:35:45'),
(717, 789, 8, 'F', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:36:06', '2019-02-05 10:36:06'),
(718, 790, 1, 'S', '10:30:00', '13:30:00', 'Active', '2019-02-05 10:36:26', '2019-02-05 10:36:26'),
(719, 791, 4, 'M', '13:30:00', '16:30:00', 'Active', '2019-02-05 10:36:56', '2019-02-05 10:36:56'),
(720, 792, 2, 'T', '13:03:00', '16:30:00', 'Inactive', '2019-02-05 10:38:01', '2019-02-05 10:38:13'),
(721, 792, 2, 'W', '13:03:00', '16:30:00', 'Active', '2019-02-05 10:38:13', '2019-02-05 10:38:13'),
(722, 793, 5, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:38:59', '2019-02-05 10:38:59'),
(723, 794, 6, 'T', '10:30:00', '13:30:00', 'Active', '2019-02-05 10:39:14', '2019-02-05 10:39:14'),
(724, 795, 7, 'W', '13:30:00', '16:30:00', 'Active', '2019-02-05 10:39:36', '2019-02-05 10:39:36'),
(725, 796, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2019-02-05 10:39:59', '2019-02-05 10:39:59'),
(726, 797, 1, 'F', '18:00:00', '21:00:00', 'Active', '2019-02-05 10:40:21', '2019-02-05 10:40:21'),
(727, 798, 4, 'S', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:40:36', '2019-02-05 10:40:36'),
(728, 799, 5, 'M', '10:30:00', '13:30:00', 'Active', '2019-02-05 10:41:05', '2019-02-05 10:41:05'),
(729, 800, 1, 'M', '13:30:00', '16:30:00', 'Active', '2019-02-05 10:42:05', '2019-02-05 10:42:05'),
(730, 801, 4, 'T', '16:30:00', '18:00:00', 'Active', '2019-02-05 10:42:26', '2019-02-05 10:42:26'),
(731, 802, 5, 'W', '18:00:00', '21:00:00', 'Active', '2019-02-05 10:42:45', '2019-02-05 10:42:45'),
(732, 803, 6, 'TH', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:43:09', '2019-02-05 10:43:09'),
(733, 804, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2019-02-05 10:43:37', '2019-02-05 10:43:37'),
(734, 805, 5, 'S', '07:30:00', '12:00:00', 'Active', '2019-02-05 10:44:23', '2019-02-05 10:44:23'),
(735, 806, 7, 'F', '10:30:00', '13:30:00', 'Active', '2019-02-05 10:44:51', '2019-02-05 10:44:51'),
(736, 807, 6, 'T', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:45:15', '2019-02-05 10:45:15'),
(737, 808, 7, 'W', '10:30:00', '13:30:00', 'Active', '2019-02-05 10:45:32', '2019-02-05 10:45:32'),
(738, 809, 8, 'TH', '13:30:00', '16:30:00', 'Active', '2019-02-05 10:45:52', '2019-02-05 10:45:52'),
(739, 810, 4, 'F', '16:30:00', '18:00:00', 'Active', '2019-02-05 10:46:14', '2019-02-05 10:46:14'),
(740, 811, 7, 'W', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:46:35', '2019-02-05 10:46:35'),
(741, 812, 8, 'TH', '10:30:00', '13:30:00', 'Inactive', '2019-02-05 10:46:49', '2019-03-27 00:13:08'),
(742, 813, 1, 'F', '13:30:00', '16:30:00', 'Active', '2019-02-05 10:47:11', '2019-02-05 10:47:11'),
(743, 814, 4, 'S', '16:30:00', '18:00:00', 'Active', '2019-02-05 10:47:42', '2019-02-05 10:47:42'),
(744, 815, 8, 'TH', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:48:03', '2019-02-05 10:48:03'),
(745, 816, 1, 'F', '10:30:00', '13:30:00', 'Active', '2019-02-05 10:48:18', '2019-02-05 10:48:18'),
(746, 817, 4, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-05 10:54:52', '2019-02-05 10:54:52'),
(747, 818, 1, 'W', '07:30:00', '10:30:00', 'Active', '2019-02-13 13:39:42', '2019-02-13 13:39:42'),
(748, 819, 1, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:10:54', '2019-02-13 22:10:54'),
(749, 820, 4, 'T', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:11:22', '2019-02-13 22:11:22'),
(750, 821, 5, 'W', '13:30:00', '16:30:00', 'Active', '2019-02-13 22:11:42', '2019-02-13 22:11:42'),
(751, 822, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:12:01', '2019-02-13 22:12:01'),
(752, 823, 7, 'F', '18:00:00', '21:00:00', 'Active', '2019-02-13 22:12:42', '2019-02-13 22:12:42'),
(753, 824, 8, 'S', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:13:19', '2019-02-13 22:13:19'),
(754, 825, 1, 'M', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:13:47', '2019-02-13 22:13:47'),
(755, 826, 2, 'T', '13:30:00', '16:30:00', 'Active', '2019-02-13 22:14:08', '2019-02-13 22:14:08'),
(756, 827, 2, 'S', '07:30:00', '12:00:00', 'Active', '2019-02-13 22:14:40', '2019-02-13 22:14:40'),
(757, 828, 1, 'M', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:19:02', '2019-02-13 22:19:02'),
(758, 829, 4, 'T', '18:00:00', '21:00:00', 'Active', '2019-02-13 22:19:22', '2019-02-13 22:19:22'),
(759, 830, 5, 'W', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:19:39', '2019-02-13 22:19:39'),
(760, 831, 6, 'TH', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:19:59', '2019-02-13 22:19:59'),
(761, 832, 8, 'F', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:20:28', '2019-02-13 22:20:28'),
(762, 833, 2, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:21:12', '2019-02-13 22:21:12'),
(763, 834, 1, 'S', '07:30:00', '12:00:00', 'Active', '2019-02-13 22:21:36', '2019-02-13 22:21:36'),
(764, 835, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2019-02-13 22:21:52', '2019-02-13 22:21:52'),
(765, 836, 4, 'T', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:22:52', '2019-02-13 22:22:52'),
(766, 837, 5, 'W', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:23:11', '2019-02-13 22:23:11'),
(767, 838, 6, 'TH', '13:30:00', '16:30:00', 'Active', '2019-02-13 22:23:39', '2019-02-13 22:23:39'),
(768, 839, 1, 'F', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:24:17', '2019-02-13 22:24:17'),
(769, 840, 8, 'S', '18:00:00', '21:00:00', 'Active', '2019-02-13 22:24:46', '2019-02-13 22:24:46'),
(770, 841, 5, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:25:12', '2019-02-13 22:25:12'),
(771, 842, 6, 'T', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:25:38', '2019-02-13 22:25:38'),
(772, 843, 7, 'W', '13:30:00', '16:30:00', 'Active', '2019-02-13 22:25:58', '2019-02-13 22:25:58'),
(773, 844, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:26:41', '2019-02-13 22:26:41'),
(774, 845, 1, 'W', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:27:08', '2019-02-13 22:27:08'),
(775, 846, 4, 'TH', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:27:43', '2019-02-13 22:27:43'),
(776, 847, 5, 'F', '13:30:00', '16:30:00', 'Active', '2019-02-13 22:28:05', '2019-02-13 22:28:05'),
(777, 848, 6, 'S', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:28:31', '2019-02-13 22:28:31'),
(778, 849, 7, 'M', '18:00:00', '21:00:00', 'Active', '2019-02-13 22:28:52', '2019-02-13 22:28:52'),
(779, 850, 8, 'M', '18:00:00', '21:00:00', 'Inactive', '2019-02-13 22:29:46', '2019-02-13 22:30:31'),
(780, 850, 8, 'T', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:30:31', '2019-02-13 22:30:31'),
(781, 851, 1, 'W', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:30:53', '2019-02-13 22:30:53'),
(782, 852, 5, 'TH', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:31:30', '2019-02-13 22:31:30'),
(783, 853, 1, 'TH', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:32:09', '2019-02-13 22:32:09'),
(784, 854, 4, 'F', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:32:34', '2019-02-13 22:32:34'),
(785, 855, 5, 'S', '13:30:00', '16:30:00', 'Active', '2019-02-13 22:32:56', '2019-02-13 22:32:56'),
(786, 856, 6, 'M', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:33:21', '2019-02-13 22:33:21'),
(787, 857, 7, 'T', '18:00:00', '21:00:00', 'Active', '2019-02-13 22:34:28', '2019-02-13 22:34:28'),
(788, 858, 8, 'W', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:34:50', '2019-02-13 22:34:50'),
(789, 859, 1, 'TH', '13:30:00', '16:30:00', 'Active', '2019-02-13 22:35:14', '2019-02-13 22:35:14'),
(790, 860, 4, 'M', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:36:19', '2019-02-13 22:36:19'),
(791, 861, 5, 'T', '13:30:00', '16:30:00', 'Active', '2019-02-13 22:36:36', '2019-02-13 22:36:36'),
(792, 862, 6, 'W', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:36:57', '2019-02-13 22:36:57'),
(793, 863, 7, 'TH', '18:00:00', '21:00:00', 'Active', '2019-02-13 22:37:18', '2019-02-13 22:37:18'),
(794, 864, 8, 'F', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:37:35', '2019-02-13 22:37:35'),
(795, 865, 4, 'S', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:37:59', '2019-02-13 22:37:59'),
(796, 866, 4, 'M', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:38:32', '2019-02-13 22:38:32'),
(797, 867, 5, 'T', '18:00:00', '21:00:00', 'Active', '2019-02-13 22:38:55', '2019-02-13 22:38:55'),
(798, 868, 6, 'W', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:39:10', '2019-02-13 22:39:10'),
(799, 869, 7, 'TH', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:39:28', '2019-02-13 22:39:28'),
(800, 870, 7, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:40:03', '2019-02-13 22:40:03'),
(801, 871, 8, 'T', '10:30:00', '13:30:00', 'Active', '2019-02-13 22:40:20', '2019-02-13 22:40:20'),
(802, 872, 1, 'W', '13:30:00', '16:30:00', 'Active', '2019-02-13 22:40:52', '2019-02-13 22:40:52'),
(803, 873, 4, 'TH', '16:30:00', '18:00:00', 'Active', '2019-02-13 22:41:13', '2019-02-13 22:41:13'),
(804, 874, 5, 'F', '18:00:00', '21:00:00', 'Active', '2019-02-13 22:41:37', '2019-02-13 22:41:37'),
(805, 875, 6, 'S', '07:30:00', '10:30:00', 'Active', '2019-02-13 22:41:54', '2019-02-13 22:41:54'),
(806, 876, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2019-02-13 22:43:59', '2019-02-13 22:43:59'),
(807, 877, 1, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-14 14:32:10', '2019-02-14 14:32:10'),
(808, 878, 4, 'T', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:32:33', '2019-02-14 14:32:33'),
(809, 879, 5, 'W', '13:30:00', '16:30:00', 'Active', '2019-02-14 14:32:52', '2019-02-14 14:32:52'),
(810, 880, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2019-02-14 14:33:08', '2019-02-14 14:33:08'),
(811, 881, 7, 'F', '18:00:00', '21:00:00', 'Active', '2019-02-14 14:33:25', '2019-02-14 14:33:25'),
(812, 882, 8, 'S', '07:30:00', '10:30:00', 'Active', '2019-02-14 14:33:41', '2019-02-14 14:33:41'),
(813, 883, 1, 'M', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:34:01', '2019-02-14 14:34:01'),
(814, 884, 2, 'T', '13:30:00', '16:30:00', 'Active', '2019-02-14 14:34:22', '2019-02-14 14:34:22'),
(815, 885, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2019-02-14 14:34:43', '2019-02-14 14:34:43'),
(816, 886, 2, 'S', '07:30:00', '12:00:00', 'Active', '2019-02-14 14:34:57', '2019-02-14 14:34:57'),
(817, 887, 4, 'M', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:35:29', '2019-02-14 14:35:29'),
(818, 888, 5, 'T', '13:30:00', '16:30:00', 'Active', '2019-02-14 14:35:49', '2019-02-14 14:35:49'),
(819, 889, 6, 'W', '16:30:00', '18:00:00', 'Active', '2019-02-14 14:36:05', '2019-02-14 14:36:05'),
(820, 890, 7, 'TH', '18:00:00', '21:00:00', 'Active', '2019-02-14 14:36:21', '2019-02-14 14:36:21'),
(821, 891, 8, 'F', '07:30:00', '10:30:00', 'Active', '2019-02-14 14:37:22', '2019-02-14 14:37:22'),
(822, 892, 1, 'S', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:37:36', '2019-02-14 14:37:36'),
(823, 893, 1, 'M', '13:30:00', '16:30:00', 'Active', '2019-02-14 14:37:52', '2019-02-14 14:37:52'),
(824, 894, 4, 'T', '16:30:00', '18:00:00', 'Active', '2019-02-14 14:38:11', '2019-02-14 14:38:11'),
(825, 895, 1, 'T', '07:30:00', '10:30:00', 'Active', '2019-02-14 14:38:56', '2019-02-14 14:38:56'),
(826, 896, 4, 'W', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:39:11', '2019-02-14 14:39:11'),
(827, 897, 5, 'TH', '13:30:00', '16:30:00', 'Active', '2019-02-14 14:39:42', '2019-02-14 14:39:42'),
(828, 898, 6, 'F', '16:30:00', '18:00:00', 'Active', '2019-02-14 14:40:07', '2019-02-14 14:40:07'),
(829, 899, 7, 'S', '18:00:00', '21:00:00', 'Active', '2019-02-14 14:40:27', '2019-02-14 14:40:27'),
(830, 900, 8, 'M', '07:30:00', '10:30:00', 'Active', '2019-02-14 14:40:44', '2019-02-14 14:40:44'),
(831, 901, 1, 'T', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:41:02', '2019-02-14 14:41:02'),
(832, 902, 4, 'S', '07:30:00', '10:30:00', 'Active', '2019-02-14 14:41:27', '2019-02-14 14:41:27'),
(833, 903, 1, 'W', '07:30:00', '10:30:00', 'Active', '2019-02-14 14:42:47', '2019-02-14 14:42:47'),
(834, 904, 4, 'TH', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:43:08', '2019-02-14 14:43:08'),
(835, 905, 5, 'F', '13:30:00', '16:30:00', 'Active', '2019-02-14 14:43:34', '2019-02-14 14:43:34'),
(836, 906, 6, 'S', '16:30:00', '18:00:00', 'Active', '2019-02-14 14:43:54', '2019-02-14 14:43:54'),
(837, 907, 7, 'M', '18:00:00', '21:00:00', 'Active', '2019-02-14 14:44:24', '2019-02-14 14:44:24'),
(838, 908, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2019-02-14 14:44:41', '2019-02-14 14:44:41'),
(839, 909, 5, 'S', '07:30:00', '12:00:00', 'Active', '2019-02-14 14:44:59', '2019-02-14 14:44:59'),
(840, 910, 1, 'TH', '07:30:00', '10:30:00', 'Active', '2019-02-14 14:45:59', '2019-02-14 14:45:59');
INSERT INTO `t_schedule_items` (`Schedule_Items_ID`, `Schedule_Items_ScheduleID`, `Schedule_Items_RoomID`, `Schedule_Items_Date`, `Schedule_Items_Time_Start`, `Schedule_Items_Time_End`, `Schedule_Items_Display_Status`, `Schedule_Items_Date_Added`, `Schedule_Items_Date_Updated`) VALUES
(841, 911, 4, 'F', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:46:16', '2019-02-14 14:46:16'),
(842, 912, 5, 'S', '13:30:00', '16:30:00', 'Active', '2019-02-14 14:46:33', '2019-02-14 14:46:33'),
(843, 913, 6, 'M', '16:30:00', '18:00:00', 'Active', '2019-02-14 14:46:53', '2019-02-14 14:46:53'),
(844, 914, 1, 'F', '07:30:00', '10:30:00', 'Inactive', '2019-02-14 14:47:36', '2019-03-27 00:17:43'),
(845, 915, 4, 'S', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:47:50', '2019-02-14 14:47:50'),
(846, 916, 5, 'M', '13:30:00', '16:30:00', 'Active', '2019-02-14 14:48:10', '2019-02-14 14:48:10'),
(847, 917, 6, 'T', '16:30:00', '18:00:00', 'Inactive', '2019-02-14 14:48:32', '2019-03-27 00:17:49'),
(848, 918, 1, 'S', '07:30:00', '10:30:00', 'Active', '2019-02-14 14:48:52', '2019-02-14 14:48:52'),
(849, 919, 5, 'M', '10:30:00', '13:30:00', 'Active', '2019-02-14 14:49:19', '2019-02-14 14:49:19'),
(850, 812, 8, 'TH', '10:30:00', '13:30:00', 'Active', '2019-03-27 00:13:08', '2019-03-27 00:13:08'),
(851, 914, 1, 'F', '07:30:00', '10:30:00', 'Active', '2019-03-27 00:17:44', '2019-03-27 00:17:44'),
(852, 917, 6, 'T', '16:30:00', '18:00:00', 'Active', '2019-03-27 00:17:49', '2019-03-27 00:17:49');

-- --------------------------------------------------------

--
-- Table structure for table `t_scholarship_payment_history`
--

CREATE TABLE `t_scholarship_payment_history` (
  `Scholarship_Payment_History_ID` int(11) NOT NULL,
  `Scholarship_Payment_History_ScholarshipID` int(11) NOT NULL,
  `Scholarship_Payment_History_StudentAccountID` int(11) NOT NULL,
  `Scholarship_Payment_History_SemesterID` int(11) NOT NULL,
  `Scholarship_Payment_History_AcademicYearID` int(11) NOT NULL,
  `Scholarship_Payment_History_Amount` decimal(10,2) NOT NULL,
  `Scholarship_Payment_History_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Scholarship_Payment_History_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Scholarship_Payment_History_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_scholarship_payment_history`
--

INSERT INTO `t_scholarship_payment_history` (`Scholarship_Payment_History_ID`, `Scholarship_Payment_History_ScholarshipID`, `Scholarship_Payment_History_StudentAccountID`, `Scholarship_Payment_History_SemesterID`, `Scholarship_Payment_History_AcademicYearID`, `Scholarship_Payment_History_Amount`, `Scholarship_Payment_History_Display_Status`, `Scholarship_Payment_History_Date_Added`, `Scholarship_Payment_History_Date_Updated`) VALUES
(18, 2, 36, 8, 2, '9000.00', 'Active', '2018-10-23 20:32:27', '2018-10-23 20:32:27'),
(19, 2, 39, 8, 2, '7100.00', 'Active', '2018-10-23 20:32:27', '2018-10-23 20:32:27'),
(20, 2, 36, 9, 2, '10400.00', 'Active', '2018-10-23 21:10:50', '2018-10-23 21:10:50'),
(21, 2, 39, 9, 2, '6500.00', 'Active', '2018-10-23 21:10:51', '2018-10-23 21:10:51'),
(22, 2, 36, 8, 1, '11300.00', 'Active', '2018-10-23 22:09:28', '2018-10-23 22:09:28'),
(23, 2, 39, 8, 1, '6200.00', 'Active', '2018-10-23 22:09:29', '2018-10-23 22:09:29'),
(24, 1, 41, 8, 1, '8900.00', 'Active', '2018-10-23 22:12:07', '2018-10-23 22:12:07'),
(25, 1, 44, 8, 1, '7100.00', 'Active', '2018-10-23 22:12:08', '2018-10-23 22:12:08'),
(26, 2, 36, 9, 1, '10400.00', 'Active', '2018-10-23 23:01:49', '2018-10-23 23:01:49'),
(27, 2, 39, 9, 1, '4700.00', 'Active', '2018-10-23 23:01:49', '2018-10-23 23:01:49'),
(28, 1, 36, 9, 1, '10400.00', 'Active', '2018-10-23 23:02:18', '2018-10-23 23:02:18'),
(29, 1, 39, 9, 1, '4700.00', 'Active', '2018-10-23 23:02:19', '2018-10-23 23:02:19'),
(30, 1, 41, 9, 1, '10400.00', 'Active', '2018-10-23 23:02:20', '2018-10-23 23:02:20'),
(31, 1, 44, 9, 1, '6500.00', 'Active', '2018-10-23 23:02:21', '2018-10-23 23:02:21'),
(32, 1, 41, 8, 5, '11300.00', 'Active', '2018-10-24 00:20:32', '2018-10-24 00:20:32'),
(33, 1, 44, 8, 5, '6200.00', 'Active', '2018-10-24 00:20:32', '2018-10-24 00:20:32'),
(34, 2, 36, 8, 5, '10700.00', 'Active', '2018-10-24 00:24:11', '2018-10-24 00:24:11'),
(35, 2, 39, 8, 5, '4700.00', 'Active', '2018-10-24 00:24:12', '2018-10-24 00:24:12'),
(36, 2, 48, 8, 5, '8900.00', 'Active', '2018-10-24 00:24:12', '2018-10-24 00:24:12'),
(37, 2, 36, 9, 5, '9800.00', 'Active', '2018-10-24 01:50:37', '2018-10-24 01:50:37'),
(38, 2, 39, 9, 5, '4700.00', 'Active', '2018-10-24 01:50:37', '2018-10-24 01:50:37'),
(39, 2, 48, 9, 5, '10400.00', 'Active', '2018-10-24 01:50:37', '2018-10-24 01:50:37'),
(40, 1, 41, 9, 5, '10400.00', 'Active', '2018-10-24 01:50:56', '2018-10-24 01:50:56'),
(41, 1, 44, 9, 5, '4700.00', 'Active', '2018-10-24 01:50:56', '2018-10-24 01:50:56'),
(42, 2, 36, 10, 5, '2600.00', 'Active', '2018-10-24 02:20:12', '2018-10-24 02:20:12'),
(43, 2, 36, 8, 6, '8600.00', 'Active', '2018-10-24 03:31:50', '2018-10-24 03:31:50'),
(44, 2, 39, 8, 6, '6500.00', 'Active', '2018-10-24 03:31:51', '2018-10-24 03:31:51'),
(45, 2, 48, 8, 6, '11300.00', 'Active', '2018-10-24 03:31:51', '2018-10-24 03:31:51'),
(46, 1, 41, 8, 6, '10700.00', 'Active', '2018-10-24 03:36:27', '2018-10-24 03:36:27'),
(47, 1, 44, 8, 6, '4700.00', 'Active', '2018-10-24 03:36:27', '2018-10-24 03:36:27'),
(48, 1, 54, 8, 6, '8900.00', 'Active', '2018-10-24 03:36:27', '2018-10-24 03:36:27'),
(49, 1, 55, 8, 6, '7100.00', 'Active', '2018-10-24 03:36:27', '2018-10-24 03:36:27'),
(50, 2, 36, 9, 6, '3800.00', 'Active', '2018-10-24 04:45:16', '2018-10-24 04:45:16'),
(51, 2, 39, 9, 6, '1700.00', 'Active', '2018-10-24 04:45:16', '2018-10-24 04:45:16'),
(52, 2, 48, 9, 6, '10400.00', 'Active', '2018-10-24 04:45:16', '2018-10-24 04:45:16'),
(53, 1, 41, 9, 6, '9800.00', 'Active', '2018-10-24 04:45:42', '2018-10-24 04:45:42'),
(54, 1, 44, 9, 6, '4700.00', 'Active', '2018-10-24 04:45:42', '2018-10-24 04:45:42'),
(55, 1, 54, 9, 6, '10400.00', 'Active', '2018-10-24 04:45:42', '2018-10-24 04:45:42'),
(56, 1, 55, 9, 6, '6500.00', 'Active', '2018-10-24 04:45:43', '2018-10-24 04:45:43'),
(57, 1, 41, 10, 6, '2600.00', 'Active', '2018-10-24 05:15:59', '2018-10-24 05:15:59'),
(58, 1, 41, 8, 7, '8600.00', 'Active', '2019-02-04 23:52:23', '2019-02-04 23:52:23'),
(59, 1, 44, 8, 7, '6500.00', 'Active', '2019-02-04 23:52:23', '2019-02-04 23:52:23'),
(60, 1, 54, 8, 7, '11300.00', 'Active', '2019-02-04 23:52:23', '2019-02-04 23:52:23'),
(61, 1, 55, 8, 7, '6200.00', 'Active', '2019-02-04 23:52:23', '2019-02-04 23:52:23'),
(62, 2, 41, 9, 7, '3800.00', 'Active', '2019-02-05 11:01:06', '2019-02-05 11:01:06'),
(63, 2, 44, 9, 7, '1700.00', 'Active', '2019-02-05 11:01:06', '2019-02-05 11:01:06'),
(64, 2, 54, 9, 7, '10400.00', 'Active', '2019-02-05 11:01:07', '2019-02-05 11:01:07'),
(65, 2, 55, 9, 7, '4700.00', 'Active', '2019-02-05 11:01:07', '2019-02-05 11:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `t_scholar_account`
--

CREATE TABLE `t_scholar_account` (
  `Scholar_Account_ID` int(11) NOT NULL,
  `Scholar_Account_ScholarshipID` int(11) NOT NULL,
  `Scholar_Account_Balance` decimal(10,2) NOT NULL,
  `Scholar_Account_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Scholar_Account_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Scholar_Account_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_scholar_account`
--

INSERT INTO `t_scholar_account` (`Scholar_Account_ID`, `Scholar_Account_ScholarshipID`, `Scholar_Account_Balance`, `Scholar_Account_Display_Status`, `Scholar_Account_Date_Added`, `Scholar_Account_Date_Updated`) VALUES
(1, 1, '178600.00', 'Active', '2018-10-12 02:07:33', '2019-02-04 23:52:23'),
(2, 2, '180300.00', 'Active', '2018-10-12 02:07:39', '2019-02-05 11:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `t_students_grade`
--

CREATE TABLE `t_students_grade` (
  `Students_Grade_ID` int(11) NOT NULL,
  `Students_Grade_StudentTakenCurriculumSubjectID` int(11) NOT NULL,
  `Students_Grade_FacultyID` int(11) DEFAULT NULL,
  `Students_Grade_Grade` enum('1.00','1.25','1.50','1.75','2.00','2.25','2.50','2.75','3.00','5.00','I','Not S','D') NOT NULL,
  `Students_Grade_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Students_Grade_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Students_Grade_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_students_grade`
--

INSERT INTO `t_students_grade` (`Students_Grade_ID`, `Students_Grade_StudentTakenCurriculumSubjectID`, `Students_Grade_FacultyID`, `Students_Grade_Grade`, `Students_Grade_Display_Status`, `Students_Grade_Date_Added`, `Students_Grade_Date_Updated`) VALUES
(577, 838, 18, '1.50', 'Active', '2018-10-23 20:37:12', '2018-10-23 20:37:12'),
(578, 848, 18, '2.00', 'Active', '2018-10-23 20:37:12', '2018-10-23 20:37:12'),
(579, 858, 18, '2.50', 'Active', '2018-10-23 20:37:12', '2018-10-23 20:37:12'),
(580, 833, 18, '1.50', 'Active', '2018-10-23 20:42:00', '2018-10-23 20:42:00'),
(581, 843, 18, '1.50', 'Active', '2018-10-23 20:42:01', '2018-10-23 20:42:01'),
(582, 853, 18, '1.50', 'Active', '2018-10-23 20:42:01', '2018-10-23 20:42:01'),
(583, 868, 18, '1.50', 'Active', '2018-10-23 20:42:01', '2018-10-23 20:42:01'),
(584, 876, 18, '1.50', 'Active', '2018-10-23 20:42:01', '2018-10-23 20:42:01'),
(585, 884, 18, '1.50', 'Active', '2018-10-23 20:42:01', '2018-10-23 20:42:01'),
(586, 836, 18, '2.00', 'Active', '2018-10-23 20:42:22', '2018-10-23 20:42:22'),
(587, 846, 18, '2.00', 'Active', '2018-10-23 20:42:22', '2018-10-23 20:42:22'),
(588, 856, 18, '2.00', 'Active', '2018-10-23 20:42:22', '2018-10-23 20:42:22'),
(589, 865, 18, '2.00', 'Active', '2018-10-23 20:42:22', '2018-10-23 20:42:22'),
(590, 873, 18, '2.00', 'Active', '2018-10-23 20:42:22', '2018-10-23 20:42:22'),
(591, 881, 18, '2.00', 'Active', '2018-10-23 20:42:23', '2018-10-23 20:42:23'),
(592, 840, 18, '1.75', 'Active', '2018-10-23 20:42:41', '2018-10-23 20:42:41'),
(593, 850, 18, '1.75', 'Active', '2018-10-23 20:42:42', '2018-10-23 20:42:42'),
(594, 860, 18, '1.75', 'Active', '2018-10-23 20:42:42', '2018-10-23 20:42:42'),
(595, 866, 18, '1.75', 'Active', '2018-10-23 20:42:42', '2018-10-23 20:42:42'),
(596, 874, 18, '1.75', 'Active', '2018-10-23 20:42:42', '2018-10-23 20:42:42'),
(597, 882, 18, '1.75', 'Active', '2018-10-23 20:42:42', '2018-10-23 20:42:42'),
(598, 834, 18, '2.25', 'Active', '2018-10-23 20:43:01', '2018-10-23 20:43:01'),
(599, 844, 18, '2.25', 'Active', '2018-10-23 20:43:01', '2018-10-23 20:43:01'),
(600, 854, 18, '2.25', 'Active', '2018-10-23 20:43:01', '2018-10-23 20:43:01'),
(601, 863, 18, '2.25', 'Active', '2018-10-23 20:43:01', '2018-10-23 20:43:01'),
(602, 871, 18, '2.25', 'Active', '2018-10-23 20:43:01', '2018-10-23 20:43:01'),
(603, 879, 18, '2.25', 'Active', '2018-10-23 20:43:01', '2018-10-23 20:43:01'),
(604, 837, 18, '1.50', 'Active', '2018-10-23 20:43:18', '2018-10-23 20:43:18'),
(605, 847, 18, '1.50', 'Active', '2018-10-23 20:43:18', '2018-10-23 20:43:18'),
(606, 857, 18, '1.50', 'Active', '2018-10-23 20:43:18', '2018-10-23 20:43:18'),
(607, 867, 18, '1.50', 'Active', '2018-10-23 20:43:18', '2018-10-23 20:43:18'),
(608, 875, 18, '1.50', 'Active', '2018-10-23 20:43:18', '2018-10-23 20:43:18'),
(609, 883, 18, '1.50', 'Active', '2018-10-23 20:43:18', '2018-10-23 20:43:18'),
(610, 835, 18, '2.00', 'Active', '2018-10-23 20:45:28', '2018-10-23 20:45:28'),
(611, 845, 18, '1.25', 'Active', '2018-10-23 20:45:28', '2018-10-23 20:45:28'),
(612, 855, 18, '1.50', 'Active', '2018-10-23 20:45:28', '2018-10-23 20:45:28'),
(613, 839, 18, '1.75', 'Active', '2018-10-23 20:45:46', '2018-10-23 20:45:46'),
(614, 849, 18, '1.75', 'Active', '2018-10-23 20:45:47', '2018-10-23 20:45:47'),
(615, 859, 18, '1.75', 'Active', '2018-10-23 20:45:47', '2018-10-23 20:45:47'),
(616, 864, 18, '1.75', 'Active', '2018-10-23 20:45:47', '2018-10-23 20:45:47'),
(617, 872, 18, '1.75', 'Active', '2018-10-23 20:45:47', '2018-10-23 20:45:47'),
(618, 880, 18, '1.75', 'Active', '2018-10-23 20:45:47', '2018-10-23 20:45:47'),
(619, 861, 18, '1.75', 'Active', '2018-10-23 20:47:33', '2018-10-23 20:47:33'),
(620, 869, 18, '1.50', 'Active', '2018-10-23 20:47:33', '2018-10-23 20:47:33'),
(621, 877, 18, '1.25', 'Active', '2018-10-23 20:47:33', '2018-10-23 20:47:33'),
(622, 842, 18, '1.25', 'Active', '2018-10-23 20:48:45', '2018-10-23 20:48:45'),
(623, 852, 18, '1.50', 'Active', '2018-10-23 20:48:45', '2018-10-23 20:48:45'),
(624, 886, 18, '1.75', 'Active', '2018-10-23 20:48:45', '2018-10-23 20:48:45'),
(625, 893, 18, '1.50', 'Active', '2018-10-23 21:12:31', '2018-10-23 21:12:31'),
(626, 897, 18, '2.00', 'Active', '2018-10-23 21:12:31', '2018-10-23 21:12:31'),
(627, 913, 18, '2.50', 'Active', '2018-10-23 21:12:31', '2018-10-23 21:12:31'),
(628, 887, 18, '2.25', 'Active', '2018-10-23 21:12:55', '2018-10-23 21:12:55'),
(629, 899, 18, '1.50', 'Active', '2018-10-23 21:12:55', '2018-10-23 21:12:55'),
(630, 907, 18, '1.75', 'Active', '2018-10-23 21:12:55', '2018-10-23 21:12:55'),
(631, 891, 18, '2.00', 'Active', '2018-10-23 21:13:15', '2018-10-23 21:13:15'),
(632, 903, 18, '1.25', 'Active', '2018-10-23 21:13:15', '2018-10-23 21:13:15'),
(633, 911, 18, '1.50', 'Active', '2018-10-23 21:13:15', '2018-10-23 21:13:15'),
(634, 894, 18, '1.25', 'Active', '2018-10-23 21:13:30', '2018-10-23 21:13:30'),
(635, 898, 18, '1.75', 'Active', '2018-10-23 21:13:30', '2018-10-23 21:13:30'),
(636, 914, 18, '1.25', 'Active', '2018-10-23 21:13:31', '2018-10-23 21:13:31'),
(637, 888, 18, '1.50', 'Active', '2018-10-23 21:13:51', '2018-10-23 21:13:51'),
(638, 900, 18, '2.00', 'Active', '2018-10-23 21:13:52', '2018-10-23 21:13:52'),
(639, 908, 18, '2.50', 'Active', '2018-10-23 21:13:52', '2018-10-23 21:13:52'),
(640, 892, 18, '2.25', 'Active', '2018-10-23 21:14:07', '2018-10-23 21:14:07'),
(641, 904, 18, '1.50', 'Active', '2018-10-23 21:14:07', '2018-10-23 21:14:07'),
(642, 912, 18, '1.75', 'Active', '2018-10-23 21:14:08', '2018-10-23 21:14:08'),
(643, 889, 18, '2.00', 'Active', '2018-10-23 21:14:21', '2018-10-23 21:14:21'),
(644, 901, 18, '1.25', 'Active', '2018-10-23 21:14:22', '2018-10-23 21:14:22'),
(645, 909, 18, '1.50', 'Active', '2018-10-23 21:14:22', '2018-10-23 21:14:22'),
(646, 890, 18, '1.25', 'Active', '2018-10-23 21:14:44', '2018-10-23 21:14:44'),
(647, 902, 18, '1.75', 'Active', '2018-10-23 21:14:44', '2018-10-23 21:14:44'),
(648, 910, 18, '1.25', 'Active', '2018-10-23 21:14:44', '2018-10-23 21:14:44'),
(649, 895, 18, '1.75', 'Active', '2018-10-23 21:16:08', '2018-10-23 21:16:08'),
(650, 905, 18, '2.00', 'Active', '2018-10-23 21:16:08', '2018-10-23 21:16:08'),
(651, 916, 18, '1.50', 'Active', '2018-10-23 21:17:01', '2018-10-23 21:17:01'),
(652, 918, 18, '1.50', 'Active', '2018-10-23 21:19:18', '2018-10-23 21:19:18'),
(653, 925, 18, '2.25', 'Active', '2018-10-23 21:19:18', '2018-10-23 21:19:18'),
(654, 931, 18, '1.75', 'Active', '2018-10-23 21:19:18', '2018-10-23 21:19:18'),
(655, 920, 18, '1.50', 'Active', '2018-10-23 21:19:38', '2018-10-23 21:19:38'),
(656, 927, 18, '1.75', 'Active', '2018-10-23 21:19:38', '2018-10-23 21:19:38'),
(657, 933, 18, '1.25', 'Active', '2018-10-23 21:19:38', '2018-10-23 21:19:38'),
(658, 919, 18, '1.75', 'Active', '2018-10-23 21:19:55', '2018-10-23 21:19:55'),
(659, 926, 18, '2.00', 'Active', '2018-10-23 21:19:55', '2018-10-23 21:19:55'),
(660, 932, 18, '1.50', 'Active', '2018-10-23 21:19:56', '2018-10-23 21:19:56'),
(661, 921, 18, '1.25', 'Active', '2018-10-23 21:20:14', '2018-10-23 21:20:14'),
(662, 928, 18, '1.50', 'Active', '2018-10-23 21:20:14', '2018-10-23 21:20:14'),
(663, 934, 18, '1.00', 'Active', '2018-10-23 21:20:14', '2018-10-23 21:20:14'),
(664, 917, 18, '1.50', 'Active', '2018-10-23 21:20:41', '2018-10-23 21:20:41'),
(665, 924, 18, '2.25', 'Active', '2018-10-23 21:20:41', '2018-10-23 21:20:41'),
(666, 935, 18, '1.75', 'Active', '2018-10-23 21:20:41', '2018-10-23 21:20:41'),
(667, 923, 18, '1.50', 'Active', '2018-10-23 21:21:31', '2018-10-23 21:21:31'),
(668, 930, 18, '1.50', 'Active', '2018-10-23 21:21:31', '2018-10-23 21:21:31'),
(669, 936, 18, '1.75', 'Active', '2018-10-23 21:22:21', '2018-10-23 21:22:21'),
(670, 938, 18, '1.50', 'Active', '2018-10-23 22:18:33', '2018-10-23 22:18:33'),
(671, 948, 18, '1.75', 'Active', '2018-10-23 22:18:33', '2018-10-23 22:18:33'),
(672, 958, 18, '2.00', 'Active', '2018-10-23 22:18:34', '2018-10-23 22:18:34'),
(673, 941, 18, '2.00', 'Active', '2018-10-23 22:18:54', '2018-10-23 22:18:54'),
(674, 951, 18, '2.25', 'Active', '2018-10-23 22:18:54', '2018-10-23 22:18:54'),
(675, 961, 18, '2.50', 'Active', '2018-10-23 22:18:54', '2018-10-23 22:18:54'),
(676, 944, 18, '2.00', 'Active', '2018-10-23 22:19:37', '2018-10-23 22:19:37'),
(677, 954, 18, '2.25', 'Active', '2018-10-23 22:19:37', '2018-10-23 22:19:37'),
(678, 964, 18, '2.50', 'Active', '2018-10-23 22:19:37', '2018-10-23 22:19:37'),
(679, 940, 18, '1.25', 'Active', '2018-10-23 22:20:00', '2018-10-23 22:20:00'),
(680, 950, 18, '1.50', 'Active', '2018-10-23 22:20:00', '2018-10-23 22:20:00'),
(681, 960, 18, '1.75', 'Active', '2018-10-23 22:20:00', '2018-10-23 22:20:00'),
(682, 942, 18, '1.75', 'Active', '2018-10-23 22:20:24', '2018-10-23 22:20:24'),
(683, 952, 18, '2.00', 'Active', '2018-10-23 22:20:24', '2018-10-23 22:20:24'),
(684, 962, 18, '2.25', 'Active', '2018-10-23 22:20:24', '2018-10-23 22:20:24'),
(685, 945, 18, '1.50', 'Active', '2018-10-23 22:20:40', '2018-10-23 22:20:40'),
(686, 955, 18, '1.75', 'Active', '2018-10-23 22:20:40', '2018-10-23 22:20:40'),
(687, 965, 18, '2.00', 'Active', '2018-10-23 22:20:40', '2018-10-23 22:20:40'),
(688, 943, 18, '2.00', 'Active', '2018-10-23 22:21:02', '2018-10-23 22:21:02'),
(689, 953, 18, '2.25', 'Active', '2018-10-23 22:21:03', '2018-10-23 22:21:03'),
(690, 963, 18, '2.50', 'Active', '2018-10-23 22:21:03', '2018-10-23 22:21:03'),
(691, 939, 18, '1.25', 'Active', '2018-10-23 22:21:27', '2018-10-23 22:21:27'),
(692, 949, 18, '1.50', 'Active', '2018-10-23 22:21:27', '2018-10-23 22:21:27'),
(693, 959, 18, '1.75', 'Active', '2018-10-23 22:21:27', '2018-10-23 22:21:27'),
(694, 956, 18, '1.25', 'Active', '2018-10-23 22:22:22', '2018-10-23 22:22:22'),
(695, 947, 18, '1.75', 'Active', '2018-10-23 22:23:08', '2018-10-23 22:23:08'),
(696, 967, 18, '1.75', 'Active', '2018-10-23 22:23:09', '2018-10-23 22:23:09'),
(697, 973, 18, '1.25', 'Active', '2018-10-23 22:26:02', '2018-10-23 22:26:02'),
(698, 981, 18, '1.25', 'Active', '2018-10-23 22:26:02', '2018-10-23 22:26:02'),
(699, 989, 18, '1.25', 'Active', '2018-10-23 22:26:02', '2018-10-23 22:26:02'),
(700, 969, 18, '1.75', 'Active', '2018-10-23 22:26:20', '2018-10-23 22:26:20'),
(701, 977, 18, '1.75', 'Active', '2018-10-23 22:26:20', '2018-10-23 22:26:20'),
(702, 985, 18, '1.75', 'Active', '2018-10-23 22:26:20', '2018-10-23 22:26:20'),
(703, 968, 18, '1.50', 'Active', '2018-10-23 22:26:40', '2018-10-23 22:26:40'),
(704, 976, 18, '1.50', 'Active', '2018-10-23 22:26:40', '2018-10-23 22:26:40'),
(705, 984, 18, '1.50', 'Active', '2018-10-23 22:26:40', '2018-10-23 22:26:40'),
(706, 970, 18, '2.00', 'Active', '2018-10-23 22:27:02', '2018-10-23 22:27:02'),
(707, 978, 18, '2.00', 'Active', '2018-10-23 22:27:02', '2018-10-23 22:27:02'),
(708, 986, 18, '2.00', 'Active', '2018-10-23 22:27:02', '2018-10-23 22:27:02'),
(709, 972, 18, '1.25', 'Active', '2018-10-23 22:27:27', '2018-10-23 22:27:27'),
(710, 980, 18, '1.25', 'Active', '2018-10-23 22:27:27', '2018-10-23 22:27:27'),
(711, 988, 18, '1.25', 'Active', '2018-10-23 22:27:27', '2018-10-23 22:27:27'),
(712, 971, 18, '1.75', 'Active', '2018-10-23 22:27:46', '2018-10-23 22:27:46'),
(713, 979, 18, '1.75', 'Active', '2018-10-23 22:27:46', '2018-10-23 22:27:46'),
(714, 987, 18, '1.75', 'Active', '2018-10-23 22:27:46', '2018-10-23 22:27:46'),
(715, 974, 18, '1.25', 'Active', '2018-10-23 22:28:50', '2018-10-23 22:28:50'),
(716, 990, 18, '1.25', 'Active', '2018-10-23 22:28:50', '2018-10-23 22:28:50'),
(717, 983, 18, '1.50', 'Active', '2018-10-23 22:29:40', '2018-10-23 22:29:40'),
(718, 996, 18, '1.50', 'Active', '2018-10-23 22:30:19', '2018-10-23 22:30:19'),
(719, 1009, 18, '2.00', 'Active', '2018-10-23 22:30:20', '2018-10-23 22:30:20'),
(720, 1012, 18, '2.50', 'Active', '2018-10-23 22:30:20', '2018-10-23 22:30:20'),
(721, 997, 18, '2.25', 'Active', '2018-10-23 22:30:39', '2018-10-23 22:30:39'),
(722, 1001, 18, '1.50', 'Active', '2018-10-23 22:30:39', '2018-10-23 22:30:39'),
(723, 1013, 18, '1.75', 'Active', '2018-10-23 22:30:39', '2018-10-23 22:30:39'),
(724, 1000, 18, '2.00', 'Active', '2018-10-23 22:30:56', '2018-10-23 22:30:56'),
(725, 1004, 18, '1.25', 'Active', '2018-10-23 22:30:56', '2018-10-23 22:30:56'),
(726, 1016, 18, '1.50', 'Active', '2018-10-23 22:30:56', '2018-10-23 22:30:56'),
(727, 998, 18, '1.25', 'Active', '2018-10-23 22:31:14', '2018-10-23 22:31:14'),
(728, 1002, 18, '1.75', 'Active', '2018-10-23 22:31:14', '2018-10-23 22:31:14'),
(729, 1014, 18, '1.25', 'Active', '2018-10-23 22:31:14', '2018-10-23 22:31:14'),
(730, 992, 18, '1.50', 'Active', '2018-10-23 22:31:33', '2018-10-23 22:31:33'),
(731, 1005, 18, '2.00', 'Active', '2018-10-23 22:31:33', '2018-10-23 22:31:33'),
(732, 1017, 18, '2.50', 'Active', '2018-10-23 22:31:33', '2018-10-23 22:31:33'),
(733, 995, 18, '1.75', 'Active', '2018-10-23 22:32:42', '2018-10-23 22:32:42'),
(734, 1008, 18, '1.75', 'Active', '2018-10-23 22:32:42', '2018-10-23 22:32:42'),
(735, 1011, 18, '1.75', 'Active', '2018-10-23 22:32:42', '2018-10-23 22:32:42'),
(736, 1019, 18, '1.75', 'Active', '2018-10-23 22:32:42', '2018-10-23 22:32:42'),
(737, 999, 18, '2.25', 'Active', '2018-10-23 22:33:06', '2018-10-23 22:33:06'),
(738, 1003, 18, '1.50', 'Active', '2018-10-23 22:33:06', '2018-10-23 22:33:06'),
(739, 1015, 18, '1.75', 'Active', '2018-10-23 22:33:06', '2018-10-23 22:33:06'),
(740, 993, 18, '2.00', 'Active', '2018-10-23 22:33:23', '2018-10-23 22:33:23'),
(741, 1006, 18, '1.25', 'Active', '2018-10-23 22:33:23', '2018-10-23 22:33:23'),
(742, 1018, 18, '1.50', 'Active', '2018-10-23 22:33:24', '2018-10-23 22:33:24'),
(743, 994, 18, '1.25', 'Active', '2018-10-23 22:33:39', '2018-10-23 22:33:39'),
(744, 1007, 18, '1.75', 'Active', '2018-10-23 22:33:39', '2018-10-23 22:33:39'),
(745, 1010, 18, '1.25', 'Active', '2018-10-23 22:33:39', '2018-10-23 22:33:39'),
(746, 1022, 18, '1.50', 'Active', '2018-10-23 22:34:16', '2018-10-23 22:34:16'),
(747, 1028, 18, '2.25', 'Active', '2018-10-23 22:34:16', '2018-10-23 22:34:16'),
(748, 1036, 18, '1.75', 'Active', '2018-10-23 22:34:16', '2018-10-23 22:34:16'),
(749, 1023, 18, '1.50', 'Active', '2018-10-23 22:34:39', '2018-10-23 22:34:39'),
(750, 1029, 18, '1.75', 'Active', '2018-10-23 22:34:39', '2018-10-23 22:34:39'),
(751, 1031, 18, '1.25', 'Active', '2018-10-23 22:34:39', '2018-10-23 22:34:39'),
(752, 1025, 18, '1.25', 'Active', '2018-10-23 22:35:28', '2018-10-23 22:35:28'),
(753, 1033, 18, '1.25', 'Active', '2018-10-23 22:35:28', '2018-10-23 22:35:28'),
(754, 1021, 18, '1.75', 'Active', '2018-10-23 22:35:54', '2018-10-23 22:35:54'),
(755, 1027, 18, '2.00', 'Active', '2018-10-23 22:35:54', '2018-10-23 22:35:54'),
(756, 1035, 18, '1.50', 'Active', '2018-10-23 22:35:54', '2018-10-23 22:35:54'),
(757, 1020, 18, '1.25', 'Active', '2018-10-23 22:36:12', '2018-10-23 22:36:12'),
(758, 1026, 18, '1.50', 'Active', '2018-10-23 22:36:12', '2018-10-23 22:36:12'),
(759, 1034, 18, '1.00', 'Active', '2018-10-23 22:36:12', '2018-10-23 22:36:12'),
(760, 1032, 18, '1.50', 'Active', '2018-10-23 22:37:22', '2018-10-23 22:37:22'),
(761, 1077, 18, '1.25', 'Active', '2018-10-23 23:04:42', '2018-10-23 23:04:42'),
(762, 1087, 18, '1.50', 'Active', '2018-10-23 23:04:42', '2018-10-23 23:04:42'),
(763, 1097, 18, '1.75', 'Active', '2018-10-23 23:04:43', '2018-10-23 23:04:43'),
(764, 1073, 18, '1.75', 'Active', '2018-10-23 23:04:59', '2018-10-23 23:04:59'),
(765, 1083, 18, '2.00', 'Active', '2018-10-23 23:04:59', '2018-10-23 23:04:59'),
(766, 1093, 18, '2.25', 'Active', '2018-10-23 23:04:59', '2018-10-23 23:04:59'),
(767, 1075, 18, '1.50', 'Active', '2018-10-23 23:05:15', '2018-10-23 23:05:15'),
(768, 1085, 18, '1.75', 'Active', '2018-10-23 23:05:15', '2018-10-23 23:05:15'),
(769, 1095, 18, '2.00', 'Active', '2018-10-23 23:05:15', '2018-10-23 23:05:15'),
(770, 1079, 18, '2.00', 'Active', '2018-10-23 23:05:34', '2018-10-23 23:05:34'),
(771, 1089, 18, '2.25', 'Active', '2018-10-23 23:05:34', '2018-10-23 23:05:34'),
(772, 1099, 18, '2.50', 'Active', '2018-10-23 23:05:34', '2018-10-23 23:05:34'),
(773, 1074, 18, '1.25', 'Active', '2018-10-23 23:05:55', '2018-10-23 23:05:55'),
(774, 1084, 18, '1.50', 'Active', '2018-10-23 23:05:55', '2018-10-23 23:05:55'),
(775, 1094, 18, '1.75', 'Active', '2018-10-23 23:05:55', '2018-10-23 23:05:55'),
(776, 1076, 18, '1.75', 'Active', '2018-10-23 23:06:13', '2018-10-23 23:06:13'),
(777, 1086, 18, '2.00', 'Active', '2018-10-23 23:06:13', '2018-10-23 23:06:13'),
(778, 1096, 18, '2.25', 'Active', '2018-10-23 23:06:13', '2018-10-23 23:06:13'),
(779, 1080, 18, '1.50', 'Active', '2018-10-23 23:06:30', '2018-10-23 23:06:30'),
(780, 1090, 18, '1.75', 'Active', '2018-10-23 23:06:30', '2018-10-23 23:06:30'),
(781, 1100, 18, '2.00', 'Active', '2018-10-23 23:06:31', '2018-10-23 23:06:31'),
(782, 1078, 18, '2.00', 'Active', '2018-10-23 23:06:54', '2018-10-23 23:06:54'),
(783, 1088, 18, '2.25', 'Active', '2018-10-23 23:06:54', '2018-10-23 23:06:54'),
(784, 1098, 18, '2.50', 'Active', '2018-10-23 23:06:54', '2018-10-23 23:06:54'),
(785, 1092, 18, '1.25', 'Active', '2018-10-23 23:07:49', '2018-10-23 23:07:49'),
(786, 1081, 18, '1.75', 'Active', '2018-10-23 23:09:40', '2018-10-23 23:09:40'),
(787, 1101, 18, '1.75', 'Active', '2018-10-23 23:09:40', '2018-10-23 23:09:40'),
(788, 1104, 18, '1.25', 'Active', '2018-10-23 23:10:27', '2018-10-23 23:10:27'),
(789, 1113, 18, '1.25', 'Active', '2018-10-23 23:10:27', '2018-10-23 23:10:27'),
(790, 1120, 18, '1.25', 'Active', '2018-10-23 23:10:27', '2018-10-23 23:10:27'),
(791, 1106, 18, '1.75', 'Active', '2018-10-23 23:10:55', '2018-10-23 23:10:55'),
(792, 1110, 18, '1.75', 'Active', '2018-10-23 23:10:55', '2018-10-23 23:10:55'),
(793, 1117, 18, '1.75', 'Active', '2018-10-23 23:10:56', '2018-10-23 23:10:56'),
(794, 1105, 18, '1.50', 'Active', '2018-10-23 23:11:16', '2018-10-23 23:11:16'),
(795, 1114, 18, '1.50', 'Active', '2018-10-23 23:11:16', '2018-10-23 23:11:16'),
(796, 1121, 18, '1.50', 'Active', '2018-10-23 23:11:16', '2018-10-23 23:11:16'),
(797, 1107, 18, '2.00', 'Active', '2018-10-23 23:11:44', '2018-10-23 23:11:44'),
(798, 1111, 18, '2.00', 'Active', '2018-10-23 23:11:44', '2018-10-23 23:11:44'),
(799, 1118, 18, '2.00', 'Active', '2018-10-23 23:11:44', '2018-10-23 23:11:44'),
(800, 1103, 18, '1.25', 'Active', '2018-10-23 23:12:10', '2018-10-23 23:12:10'),
(801, 1112, 18, '1.25', 'Active', '2018-10-23 23:12:10', '2018-10-23 23:12:10'),
(802, 1119, 18, '1.25', 'Active', '2018-10-23 23:12:10', '2018-10-23 23:12:10'),
(803, 1109, 18, '1.25', 'Active', '2018-10-23 23:13:03', '2018-10-23 23:13:03'),
(804, 1123, 18, '1.25', 'Active', '2018-10-23 23:13:03', '2018-10-23 23:13:03'),
(805, 1115, 18, '1.50', 'Active', '2018-10-23 23:13:20', '2018-10-23 23:13:20'),
(806, 1039, 18, '2.00', 'Active', '2018-10-23 23:15:31', '2018-10-23 23:15:31'),
(807, 1050, 18, '1.25', 'Active', '2018-10-23 23:15:31', '2018-10-23 23:15:31'),
(808, 1055, 18, '1.50', 'Active', '2018-10-23 23:15:31', '2018-10-23 23:15:31'),
(809, 1042, 18, '1.25', 'Active', '2018-10-23 23:16:24', '2018-10-23 23:16:24'),
(810, 1045, 18, '1.75', 'Active', '2018-10-23 23:16:24', '2018-10-23 23:16:24'),
(811, 1058, 18, '1.25', 'Active', '2018-10-23 23:16:24', '2018-10-23 23:16:24'),
(812, 1040, 18, '1.50', 'Active', '2018-10-23 23:16:48', '2018-10-23 23:16:48'),
(813, 1051, 18, '2.00', 'Active', '2018-10-23 23:16:48', '2018-10-23 23:16:48'),
(814, 1056, 18, '2.50', 'Active', '2018-10-23 23:16:48', '2018-10-23 23:16:48'),
(815, 1043, 18, '2.25', 'Active', '2018-10-23 23:17:07', '2018-10-23 23:17:07'),
(816, 1046, 18, '1.50', 'Active', '2018-10-23 23:17:07', '2018-10-23 23:17:07'),
(817, 1059, 18, '1.75', 'Active', '2018-10-23 23:17:07', '2018-10-23 23:17:07'),
(818, 1038, 18, '2.00', 'Active', '2018-10-23 23:17:26', '2018-10-23 23:17:26'),
(819, 1049, 18, '1.25', 'Active', '2018-10-23 23:17:26', '2018-10-23 23:17:26'),
(820, 1054, 18, '1.50', 'Active', '2018-10-23 23:17:26', '2018-10-23 23:17:26'),
(821, 1041, 18, '1.25', 'Active', '2018-10-23 23:17:43', '2018-10-23 23:17:43'),
(822, 1052, 18, '1.75', 'Active', '2018-10-23 23:17:43', '2018-10-23 23:17:43'),
(823, 1057, 18, '1.25', 'Active', '2018-10-23 23:17:43', '2018-10-23 23:17:43'),
(824, 1044, 18, '1.50', 'Active', '2018-10-23 23:17:59', '2018-10-23 23:17:59'),
(825, 1047, 18, '2.00', 'Active', '2018-10-23 23:17:59', '2018-10-23 23:17:59'),
(826, 1060, 18, '2.50', 'Active', '2018-10-23 23:17:59', '2018-10-23 23:17:59'),
(827, 1037, 18, '2.25', 'Active', '2018-10-23 23:18:17', '2018-10-23 23:18:17'),
(828, 1048, 18, '1.50', 'Active', '2018-10-23 23:18:17', '2018-10-23 23:18:17'),
(829, 1053, 18, '1.75', 'Active', '2018-10-23 23:18:17', '2018-10-23 23:18:17'),
(830, 1062, 18, '1.75', 'Active', '2018-10-23 23:18:50', '2018-10-23 23:18:50'),
(831, 1068, 18, '2.00', 'Active', '2018-10-23 23:18:50', '2018-10-23 23:18:50'),
(832, 1071, 18, '1.50', 'Active', '2018-10-23 23:18:50', '2018-10-23 23:18:50'),
(833, 1064, 18, '1.25', 'Active', '2018-10-23 23:19:10', '2018-10-23 23:19:10'),
(834, 1066, 18, '1.50', 'Active', '2018-10-23 23:19:10', '2018-10-23 23:19:10'),
(835, 1069, 18, '1.00', 'Active', '2018-10-23 23:19:10', '2018-10-23 23:19:10'),
(836, 1063, 18, '1.50', 'Active', '2018-10-23 23:19:44', '2018-10-23 23:19:44'),
(837, 1065, 18, '2.25', 'Active', '2018-10-23 23:19:44', '2018-10-23 23:19:44'),
(838, 1072, 18, '1.75', 'Active', '2018-10-23 23:19:44', '2018-10-23 23:19:44'),
(839, 1061, 18, '1.50', 'Active', '2018-10-23 23:20:02', '2018-10-23 23:20:02'),
(840, 1067, 18, '1.75', 'Active', '2018-10-23 23:20:02', '2018-10-23 23:20:02'),
(841, 1070, 18, '1.25', 'Active', '2018-10-23 23:20:03', '2018-10-23 23:20:03'),
(842, 1127, 18, '1.50', 'Active', '2018-10-24 00:55:04', '2018-10-24 00:55:04'),
(843, 1137, 18, '1.75', 'Active', '2018-10-24 00:55:04', '2018-10-24 00:55:04'),
(844, 1150, 18, '2.00', 'Active', '2018-10-24 00:55:04', '2018-10-24 00:55:04'),
(845, 1130, 18, '1.00', 'Active', '2018-10-24 00:55:27', '2018-10-24 00:55:27'),
(846, 1140, 18, '1.25', 'Active', '2018-10-24 00:55:27', '2018-10-24 00:55:27'),
(847, 1145, 18, '1.50', 'Active', '2018-10-24 00:55:27', '2018-10-24 00:55:27'),
(848, 1125, 18, '1.25', 'Active', '2018-10-24 00:55:46', '2018-10-24 00:55:46'),
(849, 1135, 18, '1.50', 'Active', '2018-10-24 00:55:46', '2018-10-24 00:55:46'),
(850, 1148, 18, '1.75', 'Active', '2018-10-24 00:55:46', '2018-10-24 00:55:46'),
(851, 1129, 18, '2.00', 'Active', '2018-10-24 00:56:03', '2018-10-24 00:56:03'),
(852, 1139, 18, '1.75', 'Active', '2018-10-24 00:56:03', '2018-10-24 00:56:03'),
(853, 1144, 18, '1.50', 'Active', '2018-10-24 00:56:03', '2018-10-24 00:56:03'),
(854, 1131, 18, '1.50', 'Active', '2018-10-24 00:56:18', '2018-10-24 00:56:18'),
(855, 1141, 18, '1.75', 'Active', '2018-10-24 00:56:18', '2018-10-24 00:56:18'),
(856, 1146, 18, '2.00', 'Active', '2018-10-24 00:56:18', '2018-10-24 00:56:18'),
(857, 1126, 18, '1.00', 'Active', '2018-10-24 00:56:34', '2018-10-24 00:56:34'),
(858, 1136, 18, '1.25', 'Active', '2018-10-24 00:56:34', '2018-10-24 00:56:34'),
(859, 1149, 18, '1.50', 'Active', '2018-10-24 00:56:35', '2018-10-24 00:56:35'),
(860, 1124, 18, '1.25', 'Active', '2018-10-24 00:56:53', '2018-10-24 00:56:53'),
(861, 1134, 18, '1.50', 'Active', '2018-10-24 00:56:53', '2018-10-24 00:56:53'),
(862, 1147, 18, '1.75', 'Active', '2018-10-24 00:56:53', '2018-10-24 00:56:53'),
(863, 1128, 18, '2.00', 'Active', '2018-10-24 00:57:12', '2018-10-24 00:57:12'),
(864, 1138, 18, '1.75', 'Active', '2018-10-24 00:57:12', '2018-10-24 00:57:12'),
(865, 1151, 18, '1.50', 'Active', '2018-10-24 00:57:12', '2018-10-24 00:57:12'),
(866, 1143, 18, '1.75', 'Active', '2018-10-24 00:58:37', '2018-10-24 00:58:37'),
(867, 1153, 18, '1.75', 'Active', '2018-10-24 00:58:38', '2018-10-24 00:58:38'),
(868, 1158, 18, '1.50', 'Active', '2018-10-24 01:00:28', '2018-10-24 01:00:28'),
(869, 1166, 18, '1.50', 'Active', '2018-10-24 01:00:28', '2018-10-24 01:00:28'),
(870, 1174, 18, '1.50', 'Active', '2018-10-24 01:00:28', '2018-10-24 01:00:28'),
(871, 1154, 18, '1.75', 'Active', '2018-10-24 01:00:48', '2018-10-24 01:00:48'),
(872, 1162, 18, '1.75', 'Active', '2018-10-24 01:00:48', '2018-10-24 01:00:48'),
(873, 1170, 18, '1.75', 'Active', '2018-10-24 01:00:49', '2018-10-24 01:00:49'),
(874, 1159, 18, '1.25', 'Active', '2018-10-24 01:01:09', '2018-10-24 01:01:09'),
(875, 1167, 18, '1.25', 'Active', '2018-10-24 01:01:09', '2018-10-24 01:01:09'),
(876, 1175, 18, '1.25', 'Active', '2018-10-24 01:01:09', '2018-10-24 01:01:09'),
(877, 1155, 18, '2.00', 'Active', '2018-10-24 01:01:27', '2018-10-24 01:01:27'),
(878, 1163, 18, '2.00', 'Active', '2018-10-24 01:01:27', '2018-10-24 01:01:27'),
(879, 1171, 18, '2.00', 'Active', '2018-10-24 01:01:27', '2018-10-24 01:01:27'),
(880, 1157, 18, '1.50', 'Active', '2018-10-24 01:01:42', '2018-10-24 01:01:42'),
(881, 1165, 18, '1.50', 'Active', '2018-10-24 01:01:43', '2018-10-24 01:01:43'),
(882, 1173, 18, '1.50', 'Active', '2018-10-24 01:01:43', '2018-10-24 01:01:43'),
(883, 1156, 18, '1.75', 'Active', '2018-10-24 01:02:06', '2018-10-24 01:02:06'),
(884, 1164, 18, '1.75', 'Active', '2018-10-24 01:02:07', '2018-10-24 01:02:07'),
(885, 1172, 18, '1.75', 'Active', '2018-10-24 01:02:07', '2018-10-24 01:02:07'),
(886, 1160, 18, '1.50', 'Active', '2018-10-24 01:03:10', '2018-10-24 01:03:10'),
(887, 1168, 18, '1.50', 'Active', '2018-10-24 01:03:10', '2018-10-24 01:03:10'),
(888, 1133, 18, '1.25', 'Active', '2018-10-24 01:04:21', '2018-10-24 01:04:21'),
(889, 1177, 18, '1.75', 'Active', '2018-10-24 01:04:21', '2018-10-24 01:04:21'),
(890, 1222, 18, '1.75', 'Active', '2018-10-24 01:05:58', '2018-10-24 01:05:58'),
(891, 1228, 18, '2.00', 'Active', '2018-10-24 01:05:58', '2018-10-24 01:05:58'),
(892, 1237, 18, '2.25', 'Active', '2018-10-24 01:05:58', '2018-10-24 01:05:58'),
(893, 1214, 18, '1.25', 'Active', '2018-10-24 01:06:28', '2018-10-24 01:06:28'),
(894, 1229, 18, '1.50', 'Active', '2018-10-24 01:06:28', '2018-10-24 01:06:28'),
(895, 1238, 18, '1.75', 'Active', '2018-10-24 01:06:28', '2018-10-24 01:06:28'),
(896, 1217, 18, '1.50', 'Active', '2018-10-24 01:06:44', '2018-10-24 01:06:44'),
(897, 1223, 18, '1.75', 'Active', '2018-10-24 01:06:44', '2018-10-24 01:06:44'),
(898, 1232, 18, '2.00', 'Active', '2018-10-24 01:06:44', '2018-10-24 01:06:44'),
(899, 1215, 18, '2.00', 'Active', '2018-10-24 01:07:07', '2018-10-24 01:07:07'),
(900, 1230, 18, '2.25', 'Active', '2018-10-24 01:07:07', '2018-10-24 01:07:07'),
(901, 1239, 18, '2.50', 'Active', '2018-10-24 01:07:07', '2018-10-24 01:07:07'),
(902, 1218, 18, '1.25', 'Active', '2018-10-24 01:07:25', '2018-10-24 01:07:25'),
(903, 1224, 18, '1.50', 'Active', '2018-10-24 01:07:25', '2018-10-24 01:07:25'),
(904, 1233, 18, '1.75', 'Active', '2018-10-24 01:07:25', '2018-10-24 01:07:25'),
(905, 1221, 18, '1.75', 'Active', '2018-10-24 01:07:42', '2018-10-24 01:07:42'),
(906, 1227, 18, '2.00', 'Active', '2018-10-24 01:07:42', '2018-10-24 01:07:42'),
(907, 1236, 18, '2.25', 'Active', '2018-10-24 01:07:42', '2018-10-24 01:07:42'),
(908, 1216, 18, '1.50', 'Active', '2018-10-24 01:08:15', '2018-10-24 01:08:15'),
(909, 1231, 18, '1.75', 'Active', '2018-10-24 01:08:15', '2018-10-24 01:08:15'),
(910, 1240, 18, '2.00', 'Active', '2018-10-24 01:08:15', '2018-10-24 01:08:15'),
(911, 1219, 18, '2.00', 'Active', '2018-10-24 01:08:35', '2018-10-24 01:08:35'),
(912, 1225, 18, '2.25', 'Active', '2018-10-24 01:08:35', '2018-10-24 01:08:35'),
(913, 1234, 18, '2.50', 'Active', '2018-10-24 01:08:35', '2018-10-24 01:08:35'),
(914, 1220, 18, '1.25', 'Active', '2018-10-24 01:08:55', '2018-10-24 01:08:55'),
(915, 1226, 18, '1.50', 'Active', '2018-10-24 01:08:55', '2018-10-24 01:08:55'),
(916, 1235, 18, '1.75', 'Active', '2018-10-24 01:08:55', '2018-10-24 01:08:55'),
(917, 1245, 18, '1.25', 'Active', '2018-10-24 01:09:33', '2018-10-24 01:09:33'),
(918, 1251, 18, '1.25', 'Active', '2018-10-24 01:09:33', '2018-10-24 01:09:33'),
(919, 1257, 18, '1.25', 'Active', '2018-10-24 01:09:33', '2018-10-24 01:09:33'),
(920, 1241, 18, '1.75', 'Active', '2018-10-24 01:09:51', '2018-10-24 01:09:51'),
(921, 1247, 18, '1.75', 'Active', '2018-10-24 01:09:51', '2018-10-24 01:09:51'),
(922, 1253, 18, '1.75', 'Active', '2018-10-24 01:09:51', '2018-10-24 01:09:51'),
(923, 1243, 18, '1.50', 'Active', '2018-10-24 01:10:13', '2018-10-24 01:10:13'),
(924, 1249, 18, '1.50', 'Active', '2018-10-24 01:10:13', '2018-10-24 01:10:13'),
(925, 1255, 18, '1.50', 'Active', '2018-10-24 01:10:13', '2018-10-24 01:10:13'),
(926, 1242, 18, '2.00', 'Active', '2018-10-24 01:10:47', '2018-10-24 01:10:47'),
(927, 1248, 18, '2.00', 'Active', '2018-10-24 01:10:47', '2018-10-24 01:10:47'),
(928, 1254, 18, '2.00', 'Active', '2018-10-24 01:10:47', '2018-10-24 01:10:47'),
(929, 1246, 18, '1.25', 'Active', '2018-10-24 01:11:11', '2018-10-24 01:11:11'),
(930, 1252, 18, '1.25', 'Active', '2018-10-24 01:11:11', '2018-10-24 01:11:11'),
(931, 1258, 18, '1.25', 'Active', '2018-10-24 01:11:11', '2018-10-24 01:11:11'),
(932, 1178, 18, '1.50', 'Active', '2018-10-24 01:12:09', '2018-10-24 01:12:09'),
(933, 1186, 18, '2.00', 'Active', '2018-10-24 01:12:09', '2018-10-24 01:12:09'),
(934, 1196, 18, '2.50', 'Active', '2018-10-24 01:12:09', '2018-10-24 01:12:09'),
(935, 1181, 18, '2.25', 'Active', '2018-10-24 01:12:28', '2018-10-24 01:12:28'),
(936, 1189, 18, '1.50', 'Active', '2018-10-24 01:12:28', '2018-10-24 01:12:28'),
(937, 1199, 18, '1.75', 'Active', '2018-10-24 01:12:28', '2018-10-24 01:12:28'),
(938, 1184, 18, '2.00', 'Active', '2018-10-24 01:12:44', '2018-10-24 01:12:44'),
(939, 1192, 18, '1.25', 'Active', '2018-10-24 01:12:44', '2018-10-24 01:12:44'),
(940, 1194, 18, '1.50', 'Active', '2018-10-24 01:12:44', '2018-10-24 01:12:44'),
(941, 1179, 18, '1.25', 'Active', '2018-10-24 01:13:03', '2018-10-24 01:13:03'),
(942, 1187, 18, '1.75', 'Active', '2018-10-24 01:13:03', '2018-10-24 01:13:03'),
(943, 1197, 18, '1.25', 'Active', '2018-10-24 01:13:03', '2018-10-24 01:13:03'),
(944, 1185, 18, '1.50', 'Active', '2018-10-24 01:13:19', '2018-10-24 01:13:19'),
(945, 1193, 18, '2.00', 'Active', '2018-10-24 01:13:19', '2018-10-24 01:13:19'),
(946, 1195, 18, '2.50', 'Active', '2018-10-24 01:13:19', '2018-10-24 01:13:19'),
(947, 1180, 18, '2.25', 'Active', '2018-10-24 01:13:36', '2018-10-24 01:13:36'),
(948, 1188, 18, '1.50', 'Active', '2018-10-24 01:13:36', '2018-10-24 01:13:36'),
(949, 1198, 18, '1.75', 'Active', '2018-10-24 01:13:36', '2018-10-24 01:13:36'),
(950, 1183, 18, '2.00', 'Active', '2018-10-24 01:13:55', '2018-10-24 01:13:55'),
(951, 1191, 18, '1.25', 'Active', '2018-10-24 01:13:55', '2018-10-24 01:13:55'),
(952, 1201, 18, '1.50', 'Active', '2018-10-24 01:13:55', '2018-10-24 01:13:55'),
(953, 1204, 18, '1.50', 'Active', '2018-10-24 01:15:03', '2018-10-24 01:15:03'),
(954, 1207, 18, '2.25', 'Active', '2018-10-24 01:15:03', '2018-10-24 01:15:03'),
(955, 1211, 18, '1.75', 'Active', '2018-10-24 01:15:03', '2018-10-24 01:15:03'),
(956, 1202, 18, '1.50', 'Active', '2018-10-24 01:15:20', '2018-10-24 01:15:20'),
(957, 1209, 18, '1.75', 'Active', '2018-10-24 01:15:21', '2018-10-24 01:15:21'),
(958, 1213, 18, '1.25', 'Active', '2018-10-24 01:15:21', '2018-10-24 01:15:21'),
(959, 1203, 18, '1.75', 'Active', '2018-10-24 01:16:27', '2018-10-24 01:16:27'),
(960, 1206, 18, '2.00', 'Active', '2018-10-24 01:16:27', '2018-10-24 01:16:27'),
(961, 1210, 18, '1.50', 'Active', '2018-10-24 01:16:27', '2018-10-24 01:16:27'),
(962, 1205, 18, '1.25', 'Active', '2018-10-24 01:16:46', '2018-10-24 01:16:46'),
(963, 1208, 18, '1.50', 'Active', '2018-10-24 01:16:46', '2018-10-24 01:16:46'),
(964, 1212, 18, '1.00', 'Active', '2018-10-24 01:16:46', '2018-10-24 01:16:46'),
(965, 1330, 18, '1.50', 'Active', '2018-10-24 01:53:33', '2018-10-24 01:53:33'),
(966, 1338, 18, '1.75', 'Active', '2018-10-24 01:53:33', '2018-10-24 01:53:33'),
(967, 1348, 18, '2.00', 'Active', '2018-10-24 01:53:33', '2018-10-24 01:53:33'),
(968, 1334, 18, '1.00', 'Active', '2018-10-24 01:53:51', '2018-10-24 01:53:51'),
(969, 1342, 18, '1.25', 'Active', '2018-10-24 01:53:51', '2018-10-24 01:53:51'),
(970, 1352, 18, '1.50', 'Active', '2018-10-24 01:53:51', '2018-10-24 01:53:51'),
(971, 1329, 18, '1.25', 'Active', '2018-10-24 01:54:09', '2018-10-24 01:54:09'),
(972, 1345, 18, '1.50', 'Active', '2018-10-24 01:54:09', '2018-10-24 01:54:09'),
(973, 1355, 18, '1.75', 'Active', '2018-10-24 01:54:09', '2018-10-24 01:54:09'),
(974, 1331, 18, '2.00', 'Active', '2018-10-24 01:54:24', '2018-10-24 01:54:24'),
(975, 1339, 18, '1.75', 'Active', '2018-10-24 01:54:24', '2018-10-24 01:54:24'),
(976, 1349, 18, '1.50', 'Active', '2018-10-24 01:54:24', '2018-10-24 01:54:24'),
(977, 1335, 18, '1.50', 'Active', '2018-10-24 01:55:15', '2018-10-24 01:55:15'),
(978, 1343, 18, '1.75', 'Active', '2018-10-24 01:55:15', '2018-10-24 01:55:15'),
(979, 1353, 18, '2.00', 'Active', '2018-10-24 01:55:15', '2018-10-24 01:55:15'),
(980, 1332, 18, '1.00', 'Active', '2018-10-24 01:55:29', '2018-10-24 01:55:29'),
(981, 1340, 18, '1.25', 'Active', '2018-10-24 01:55:29', '2018-10-24 01:55:29'),
(982, 1350, 18, '1.50', 'Active', '2018-10-24 01:55:29', '2018-10-24 01:55:29'),
(983, 1328, 18, '1.25', 'Active', '2018-10-24 01:55:50', '2018-10-24 01:55:50'),
(984, 1344, 18, '1.50', 'Active', '2018-10-24 01:55:50', '2018-10-24 01:55:50'),
(985, 1354, 18, '1.75', 'Active', '2018-10-24 01:55:50', '2018-10-24 01:55:50'),
(986, 1333, 18, '2.00', 'Active', '2018-10-24 01:56:06', '2018-10-24 01:56:06'),
(987, 1341, 18, '1.75', 'Active', '2018-10-24 01:56:06', '2018-10-24 01:56:06'),
(988, 1351, 18, '1.50', 'Active', '2018-10-24 01:56:06', '2018-10-24 01:56:06'),
(989, 1336, 18, '1.75', 'Active', '2018-10-24 01:58:03', '2018-10-24 01:58:03'),
(990, 1346, 18, '2.00', 'Active', '2018-10-24 01:58:03', '2018-10-24 01:58:03'),
(991, 1356, 18, '1.50', 'Active', '2018-10-24 01:58:03', '2018-10-24 01:58:03'),
(992, 1359, 18, '1.50', 'Active', '2018-10-24 01:59:21', '2018-10-24 01:59:21'),
(993, 1366, 18, '1.50', 'Active', '2018-10-24 01:59:21', '2018-10-24 01:59:21'),
(994, 1373, 18, '1.50', 'Active', '2018-10-24 01:59:21', '2018-10-24 01:59:21'),
(995, 1361, 18, '1.75', 'Active', '2018-10-24 01:59:37', '2018-10-24 01:59:37'),
(996, 1368, 18, '1.75', 'Active', '2018-10-24 01:59:37', '2018-10-24 01:59:37'),
(997, 1375, 18, '1.75', 'Active', '2018-10-24 01:59:37', '2018-10-24 01:59:37'),
(998, 1360, 18, '1.25', 'Active', '2018-10-24 02:00:01', '2018-10-24 02:00:01'),
(999, 1367, 18, '1.25', 'Active', '2018-10-24 02:00:01', '2018-10-24 02:00:01'),
(1000, 1374, 18, '1.25', 'Active', '2018-10-24 02:00:01', '2018-10-24 02:00:01'),
(1001, 1362, 18, '2.00', 'Active', '2018-10-24 02:00:15', '2018-10-24 02:00:15'),
(1002, 1369, 18, '2.00', 'Active', '2018-10-24 02:00:16', '2018-10-24 02:00:16'),
(1003, 1376, 18, '2.00', 'Active', '2018-10-24 02:00:16', '2018-10-24 02:00:16'),
(1004, 1358, 18, '1.50', 'Active', '2018-10-24 02:00:35', '2018-10-24 02:00:35'),
(1005, 1365, 18, '1.50', 'Active', '2018-10-24 02:00:35', '2018-10-24 02:00:35'),
(1006, 1372, 18, '1.50', 'Active', '2018-10-24 02:00:35', '2018-10-24 02:00:35'),
(1007, 1377, 18, '2.00', 'Active', '2018-10-24 02:01:50', '2018-10-24 02:01:50'),
(1008, 1364, 18, '1.50', 'Active', '2018-10-24 02:02:09', '2018-10-24 02:02:09'),
(1009, 1371, 18, '1.50', 'Active', '2018-10-24 02:02:09', '2018-10-24 02:02:09'),
(1010, 1298, 18, '1.75', 'Active', '2018-10-24 02:03:40', '2018-10-24 02:03:40'),
(1011, 1307, 18, '2.00', 'Active', '2018-10-24 02:03:41', '2018-10-24 02:03:41'),
(1012, 1314, 18, '2.25', 'Active', '2018-10-24 02:03:41', '2018-10-24 02:03:41'),
(1013, 1293, 18, '1.25', 'Active', '2018-10-24 02:04:07', '2018-10-24 02:04:07'),
(1014, 1302, 18, '1.50', 'Active', '2018-10-24 02:04:07', '2018-10-24 02:04:07'),
(1015, 1309, 18, '1.75', 'Active', '2018-10-24 02:04:07', '2018-10-24 02:04:07'),
(1016, 1299, 18, '1.50', 'Active', '2018-10-24 02:04:27', '2018-10-24 02:04:27'),
(1017, 1300, 18, '1.75', 'Active', '2018-10-24 02:04:27', '2018-10-24 02:04:27'),
(1018, 1315, 18, '2.00', 'Active', '2018-10-24 02:04:27', '2018-10-24 02:04:27'),
(1019, 1294, 18, '2.00', 'Active', '2018-10-24 02:04:44', '2018-10-24 02:04:44'),
(1020, 1303, 18, '2.25', 'Active', '2018-10-24 02:04:44', '2018-10-24 02:04:44'),
(1021, 1310, 18, '2.50', 'Active', '2018-10-24 02:04:44', '2018-10-24 02:04:44'),
(1022, 1297, 18, '1.25', 'Active', '2018-10-24 02:05:07', '2018-10-24 02:05:07'),
(1023, 1306, 18, '1.50', 'Active', '2018-10-24 02:05:07', '2018-10-24 02:05:07'),
(1024, 1313, 18, '1.75', 'Active', '2018-10-24 02:05:07', '2018-10-24 02:05:07'),
(1025, 1292, 18, '1.75', 'Active', '2018-10-24 02:05:25', '2018-10-24 02:05:25'),
(1026, 1301, 18, '2.00', 'Active', '2018-10-24 02:05:25', '2018-10-24 02:05:25'),
(1027, 1308, 18, '2.25', 'Active', '2018-10-24 02:05:26', '2018-10-24 02:05:26'),
(1028, 1295, 18, '1.50', 'Active', '2018-10-24 02:05:45', '2018-10-24 02:05:45'),
(1029, 1304, 18, '1.75', 'Active', '2018-10-24 02:05:46', '2018-10-24 02:05:46'),
(1030, 1311, 18, '2.00', 'Active', '2018-10-24 02:05:46', '2018-10-24 02:05:46'),
(1031, 1296, 18, '2.00', 'Active', '2018-10-24 02:06:03', '2018-10-24 02:06:03'),
(1032, 1305, 18, '2.25', 'Active', '2018-10-24 02:06:03', '2018-10-24 02:06:03'),
(1033, 1312, 18, '2.50', 'Active', '2018-10-24 02:06:03', '2018-10-24 02:06:03'),
(1034, 1316, 18, '1.25', 'Active', '2018-10-24 02:06:53', '2018-10-24 02:06:53'),
(1035, 1320, 18, '1.25', 'Active', '2018-10-24 02:06:53', '2018-10-24 02:06:53'),
(1036, 1324, 18, '1.25', 'Active', '2018-10-24 02:06:53', '2018-10-24 02:06:53'),
(1037, 1318, 18, '1.75', 'Active', '2018-10-24 02:07:21', '2018-10-24 02:07:21'),
(1038, 1322, 18, '1.75', 'Active', '2018-10-24 02:07:22', '2018-10-24 02:07:22'),
(1039, 1326, 18, '1.75', 'Active', '2018-10-24 02:07:22', '2018-10-24 02:07:22'),
(1040, 1321, 18, '1.50', 'Active', '2018-10-24 02:08:48', '2018-10-24 02:08:48'),
(1041, 1325, 18, '1.25', 'Active', '2018-10-24 02:08:48', '2018-10-24 02:08:48'),
(1042, 1319, 18, '1.50', 'Active', '2018-10-24 02:09:15', '2018-10-24 02:09:15'),
(1043, 1323, 18, '1.50', 'Active', '2018-10-24 02:09:15', '2018-10-24 02:09:15'),
(1044, 1327, 18, '1.50', 'Active', '2018-10-24 02:09:15', '2018-10-24 02:09:15'),
(1045, 1263, 18, '1.50', 'Active', '2018-10-24 02:09:48', '2018-10-24 02:09:48'),
(1046, 1270, 18, '2.00', 'Active', '2018-10-24 02:09:48', '2018-10-24 02:09:48'),
(1047, 1279, 18, '2.50', 'Active', '2018-10-24 02:09:48', '2018-10-24 02:09:48'),
(1048, 1261, 18, '2.25', 'Active', '2018-10-24 02:10:06', '2018-10-24 02:10:06'),
(1049, 1268, 18, '1.50', 'Active', '2018-10-24 02:10:06', '2018-10-24 02:10:06'),
(1050, 1277, 18, '1.75', 'Active', '2018-10-24 02:10:06', '2018-10-24 02:10:06'),
(1051, 1264, 18, '2.00', 'Active', '2018-10-24 02:10:23', '2018-10-24 02:10:23'),
(1052, 1271, 18, '1.25', 'Active', '2018-10-24 02:10:23', '2018-10-24 02:10:23'),
(1053, 1273, 18, '1.50', 'Active', '2018-10-24 02:10:23', '2018-10-24 02:10:23'),
(1054, 1259, 18, '2.00', 'Active', '2018-10-24 02:11:09', '2018-10-24 02:11:09'),
(1055, 1266, 18, '1.25', 'Active', '2018-10-24 02:11:09', '2018-10-24 02:11:09'),
(1056, 1275, 18, '1.50', 'Active', '2018-10-24 02:11:09', '2018-10-24 02:11:09'),
(1057, 1262, 18, '1.25', 'Active', '2018-10-24 02:11:37', '2018-10-24 02:11:37'),
(1058, 1269, 18, '1.75', 'Active', '2018-10-24 02:11:38', '2018-10-24 02:11:38'),
(1059, 1278, 18, '1.25', 'Active', '2018-10-24 02:11:38', '2018-10-24 02:11:38'),
(1060, 1265, 18, '1.50', 'Active', '2018-10-24 02:11:55', '2018-10-24 02:11:55'),
(1061, 1272, 18, '2.00', 'Active', '2018-10-24 02:11:55', '2018-10-24 02:11:55'),
(1062, 1274, 18, '2.50', 'Active', '2018-10-24 02:11:55', '2018-10-24 02:11:55'),
(1063, 1260, 18, '1.50', 'Active', '2018-10-24 02:12:42', '2018-10-24 02:12:42'),
(1064, 1267, 18, '1.75', 'Active', '2018-10-24 02:12:42', '2018-10-24 02:12:42'),
(1065, 1276, 18, '1.25', 'Active', '2018-10-24 02:12:42', '2018-10-24 02:12:42'),
(1066, 1317, 18, '1.50', 'Active', '2018-10-24 02:12:42', '2018-10-24 02:12:42'),
(1067, 1281, 18, '1.50', 'Active', '2018-10-24 02:13:11', '2018-10-24 02:13:11'),
(1068, 1285, 18, '2.25', 'Active', '2018-10-24 02:13:11', '2018-10-24 02:13:11'),
(1069, 1289, 18, '1.75', 'Active', '2018-10-24 02:13:11', '2018-10-24 02:13:11'),
(1070, 1280, 18, '1.50', 'Active', '2018-10-24 02:13:51', '2018-10-24 02:13:51'),
(1071, 1284, 18, '1.75', 'Active', '2018-10-24 02:13:52', '2018-10-24 02:13:52'),
(1072, 1288, 18, '1.25', 'Active', '2018-10-24 02:13:52', '2018-10-24 02:13:52'),
(1073, 1282, 18, '1.75', 'Active', '2018-10-24 02:14:20', '2018-10-24 02:14:20'),
(1074, 1286, 18, '2.00', 'Active', '2018-10-24 02:14:20', '2018-10-24 02:14:20'),
(1075, 1290, 18, '1.50', 'Active', '2018-10-24 02:14:20', '2018-10-24 02:14:20'),
(1076, 1283, 18, '1.25', 'Active', '2018-10-24 02:14:50', '2018-10-24 02:14:50'),
(1077, 1287, 18, '1.50', 'Active', '2018-10-24 02:14:50', '2018-10-24 02:14:50'),
(1078, 1291, 18, '1.00', 'Active', '2018-10-24 02:14:50', '2018-10-24 02:14:50'),
(1079, 1379, 18, '1.50', 'Active', '2018-10-24 02:21:03', '2018-10-24 02:21:03'),
(1080, 1380, 18, '2.00', 'Active', '2018-10-24 02:21:03', '2018-10-24 02:21:03'),
(1081, 1381, 18, '2.50', 'Active', '2018-10-24 02:21:03', '2018-10-24 02:21:03'),
(1082, 1386, 18, '1.25', 'Active', '2018-10-24 03:40:08', '2018-10-24 03:40:08'),
(1083, 1396, 18, '1.25', 'Active', '2018-10-24 03:40:08', '2018-10-24 03:40:08'),
(1084, 1406, 18, '1.25', 'Active', '2018-10-24 03:40:09', '2018-10-24 03:40:09'),
(1085, 1382, 18, '1.50', 'Active', '2018-10-24 03:40:27', '2018-10-24 03:40:27'),
(1086, 1392, 18, '1.50', 'Active', '2018-10-24 03:40:27', '2018-10-24 03:40:27'),
(1087, 1402, 18, '1.50', 'Active', '2018-10-24 03:40:27', '2018-10-24 03:40:27'),
(1088, 1384, 18, '1.75', 'Active', '2018-10-24 03:40:47', '2018-10-24 03:40:47'),
(1089, 1394, 18, '1.75', 'Active', '2018-10-24 03:40:47', '2018-10-24 03:40:47'),
(1090, 1404, 18, '1.75', 'Active', '2018-10-24 03:40:47', '2018-10-24 03:40:47'),
(1091, 1387, 18, '2.00', 'Active', '2018-10-24 03:41:05', '2018-10-24 03:41:05'),
(1092, 1397, 18, '2.00', 'Active', '2018-10-24 03:41:05', '2018-10-24 03:41:05'),
(1093, 1407, 18, '2.00', 'Active', '2018-10-24 03:41:05', '2018-10-24 03:41:05'),
(1094, 1388, 18, '1.25', 'Active', '2018-10-24 03:41:21', '2018-10-24 03:41:21'),
(1095, 1398, 18, '1.25', 'Active', '2018-10-24 03:41:21', '2018-10-24 03:41:21'),
(1096, 1408, 18, '1.25', 'Active', '2018-10-24 03:41:21', '2018-10-24 03:41:21'),
(1097, 1385, 18, '1.50', 'Active', '2018-10-24 03:41:49', '2018-10-24 03:41:49'),
(1098, 1395, 18, '1.50', 'Active', '2018-10-24 03:41:49', '2018-10-24 03:41:49'),
(1099, 1405, 18, '1.50', 'Active', '2018-10-24 03:41:49', '2018-10-24 03:41:49'),
(1100, 1383, 18, '1.75', 'Active', '2018-10-24 03:42:06', '2018-10-24 03:42:06'),
(1101, 1393, 18, '1.75', 'Active', '2018-10-24 03:42:06', '2018-10-24 03:42:06'),
(1102, 1403, 18, '1.75', 'Active', '2018-10-24 03:42:06', '2018-10-24 03:42:06'),
(1103, 1389, 18, '2.00', 'Active', '2018-10-24 03:42:26', '2018-10-24 03:42:26'),
(1104, 1399, 18, '2.00', 'Active', '2018-10-24 03:42:26', '2018-10-24 03:42:26'),
(1105, 1409, 18, '2.00', 'Active', '2018-10-24 03:42:26', '2018-10-24 03:42:26'),
(1106, 1400, 18, '1.50', 'Active', '2018-10-24 03:43:07', '2018-10-24 03:43:07'),
(1107, 1411, 18, '1.75', 'Active', '2018-10-24 03:44:03', '2018-10-24 03:44:03'),
(1108, 1413, 18, '2.00', 'Active', '2018-10-24 03:46:08', '2018-10-24 03:46:08'),
(1109, 1424, 18, '2.00', 'Active', '2018-10-24 03:46:08', '2018-10-24 03:46:08'),
(1110, 1429, 18, '2.00', 'Active', '2018-10-24 03:46:08', '2018-10-24 03:46:08'),
(1111, 1415, 18, '1.75', 'Active', '2018-10-24 03:46:29', '2018-10-24 03:46:29'),
(1112, 1420, 18, '1.75', 'Active', '2018-10-24 03:46:29', '2018-10-24 03:46:29'),
(1113, 1431, 18, '1.75', 'Active', '2018-10-24 03:46:29', '2018-10-24 03:46:29'),
(1114, 1414, 18, '1.50', 'Active', '2018-10-24 03:46:43', '2018-10-24 03:46:43'),
(1115, 1425, 18, '1.50', 'Active', '2018-10-24 03:46:43', '2018-10-24 03:46:43'),
(1116, 1430, 18, '1.50', 'Active', '2018-10-24 03:46:43', '2018-10-24 03:46:43'),
(1117, 1416, 18, '1.25', 'Active', '2018-10-24 03:47:05', '2018-10-24 03:47:05'),
(1118, 1421, 18, '1.25', 'Active', '2018-10-24 03:47:05', '2018-10-24 03:47:05'),
(1119, 1432, 18, '1.25', 'Active', '2018-10-24 03:47:05', '2018-10-24 03:47:05'),
(1120, 1412, 18, '2.00', 'Active', '2018-10-24 03:47:24', '2018-10-24 03:47:24'),
(1121, 1423, 18, '2.00', 'Active', '2018-10-24 03:47:24', '2018-10-24 03:47:24'),
(1122, 1428, 18, '2.00', 'Active', '2018-10-24 03:47:24', '2018-10-24 03:47:24'),
(1123, 1417, 18, '1.75', 'Active', '2018-10-24 03:47:41', '2018-10-24 03:47:41'),
(1124, 1422, 18, '1.75', 'Active', '2018-10-24 03:47:41', '2018-10-24 03:47:41'),
(1125, 1433, 18, '1.75', 'Active', '2018-10-24 03:47:41', '2018-10-24 03:47:41'),
(1126, 1390, 18, '1.25', 'Active', '2018-10-24 03:48:42', '2018-10-24 03:48:42'),
(1127, 1418, 18, '1.25', 'Active', '2018-10-24 03:48:42', '2018-10-24 03:48:42'),
(1128, 1427, 18, '1.50', 'Active', '2018-10-24 03:49:29', '2018-10-24 03:49:29'),
(1129, 1435, 18, '1.50', 'Active', '2018-10-24 03:49:29', '2018-10-24 03:49:29'),
(1130, 1518, 18, '1.50', 'Active', '2018-10-24 03:51:20', '2018-10-24 03:51:20'),
(1131, 1527, 18, '1.75', 'Active', '2018-10-24 03:51:20', '2018-10-24 03:51:20'),
(1132, 1535, 18, '2.00', 'Active', '2018-10-24 03:51:20', '2018-10-24 03:51:20'),
(1133, 1512, 18, '1.00', 'Active', '2018-10-24 03:51:36', '2018-10-24 03:51:36'),
(1134, 1521, 18, '1.25', 'Active', '2018-10-24 03:51:36', '2018-10-24 03:51:36'),
(1135, 1529, 18, '1.50', 'Active', '2018-10-24 03:51:36', '2018-10-24 03:51:36'),
(1136, 1515, 18, '1.25', 'Active', '2018-10-24 03:51:53', '2018-10-24 03:51:53'),
(1137, 1524, 18, '1.50', 'Active', '2018-10-24 03:51:53', '2018-10-24 03:51:53'),
(1138, 1532, 18, '1.75', 'Active', '2018-10-24 03:51:53', '2018-10-24 03:51:53'),
(1139, 1519, 18, '2.00', 'Active', '2018-10-24 03:52:17', '2018-10-24 03:52:17'),
(1140, 1528, 18, '1.75', 'Active', '2018-10-24 03:52:17', '2018-10-24 03:52:17'),
(1141, 1536, 18, '1.50', 'Active', '2018-10-24 03:52:17', '2018-10-24 03:52:17'),
(1142, 1513, 18, '1.50', 'Active', '2018-10-24 03:52:35', '2018-10-24 03:52:35'),
(1143, 1522, 18, '1.75', 'Active', '2018-10-24 03:52:35', '2018-10-24 03:52:35'),
(1144, 1530, 18, '2.00', 'Active', '2018-10-24 03:52:35', '2018-10-24 03:52:35'),
(1145, 1516, 18, '1.00', 'Active', '2018-10-24 03:52:54', '2018-10-24 03:52:54'),
(1146, 1525, 18, '1.25', 'Active', '2018-10-24 03:52:54', '2018-10-24 03:52:54'),
(1147, 1533, 18, '1.50', 'Active', '2018-10-24 03:52:54', '2018-10-24 03:52:54'),
(1148, 1517, 18, '1.25', 'Active', '2018-10-24 03:53:14', '2018-10-24 03:53:14'),
(1149, 1526, 18, '1.50', 'Active', '2018-10-24 03:53:14', '2018-10-24 03:53:14'),
(1150, 1534, 18, '1.75', 'Active', '2018-10-24 03:53:14', '2018-10-24 03:53:14'),
(1151, 1511, 18, '2.00', 'Active', '2018-10-24 03:53:29', '2018-10-24 03:53:29'),
(1152, 1520, 18, '1.75', 'Active', '2018-10-24 03:53:29', '2018-10-24 03:53:29'),
(1153, 1537, 18, '1.50', 'Active', '2018-10-24 03:53:29', '2018-10-24 03:53:29'),
(1154, 1514, 18, '1.50', 'Active', '2018-10-24 03:53:48', '2018-10-24 03:53:48'),
(1155, 1523, 18, '1.75', 'Active', '2018-10-24 03:53:48', '2018-10-24 03:53:48'),
(1156, 1531, 18, '2.00', 'Active', '2018-10-24 03:53:48', '2018-10-24 03:53:48'),
(1157, 1542, 18, '1.50', 'Active', '2018-10-24 03:54:37', '2018-10-24 03:54:37'),
(1158, 1548, 18, '1.50', 'Active', '2018-10-24 03:54:37', '2018-10-24 03:54:37'),
(1159, 1554, 18, '1.50', 'Active', '2018-10-24 03:54:37', '2018-10-24 03:54:37'),
(1160, 1538, 18, '1.75', 'Active', '2018-10-24 03:54:59', '2018-10-24 03:54:59'),
(1161, 1544, 18, '1.75', 'Active', '2018-10-24 03:54:59', '2018-10-24 03:54:59'),
(1162, 1550, 18, '1.75', 'Active', '2018-10-24 03:54:59', '2018-10-24 03:54:59'),
(1163, 1540, 18, '1.25', 'Active', '2018-10-24 03:55:28', '2018-10-24 03:55:28'),
(1164, 1546, 18, '1.25', 'Active', '2018-10-24 03:55:28', '2018-10-24 03:55:28'),
(1165, 1552, 18, '1.25', 'Active', '2018-10-24 03:55:28', '2018-10-24 03:55:28'),
(1166, 1539, 18, '2.00', 'Active', '2018-10-24 03:55:47', '2018-10-24 03:55:47'),
(1167, 1545, 18, '2.00', 'Active', '2018-10-24 03:55:47', '2018-10-24 03:55:47'),
(1168, 1551, 18, '2.00', 'Active', '2018-10-24 03:55:47', '2018-10-24 03:55:47'),
(1169, 1541, 18, '1.50', 'Active', '2018-10-24 03:56:28', '2018-10-24 03:56:28'),
(1170, 1547, 18, '1.50', 'Active', '2018-10-24 03:56:28', '2018-10-24 03:56:28'),
(1171, 1553, 18, '1.50', 'Active', '2018-10-24 03:56:28', '2018-10-24 03:56:28'),
(1172, 1543, 18, '1.75', 'Active', '2018-10-24 03:57:07', '2018-10-24 03:57:07'),
(1173, 1549, 18, '1.75', 'Active', '2018-10-24 03:57:07', '2018-10-24 03:57:07'),
(1174, 1555, 18, '1.75', 'Active', '2018-10-24 03:57:07', '2018-10-24 03:57:07'),
(1175, 1478, 18, '1.25', 'Active', '2018-10-24 03:57:48', '2018-10-24 03:57:48'),
(1176, 1486, 18, '1.50', 'Active', '2018-10-24 03:57:48', '2018-10-24 03:57:48'),
(1177, 1494, 18, '1.75', 'Active', '2018-10-24 03:57:48', '2018-10-24 03:57:48'),
(1178, 1481, 18, '1.75', 'Active', '2018-10-24 03:58:09', '2018-10-24 03:58:09'),
(1179, 1489, 18, '2.00', 'Active', '2018-10-24 03:58:09', '2018-10-24 03:58:09'),
(1180, 1497, 18, '2.25', 'Active', '2018-10-24 03:58:09', '2018-10-24 03:58:09'),
(1181, 1476, 18, '1.50', 'Active', '2018-10-24 03:58:29', '2018-10-24 03:58:29'),
(1182, 1484, 18, '1.75', 'Active', '2018-10-24 03:58:29', '2018-10-24 03:58:29'),
(1183, 1492, 18, '2.00', 'Active', '2018-10-24 03:58:29', '2018-10-24 03:58:29'),
(1184, 1479, 18, '2.00', 'Active', '2018-10-24 03:59:01', '2018-10-24 03:59:01'),
(1185, 1487, 18, '2.25', 'Active', '2018-10-24 03:59:01', '2018-10-24 03:59:01'),
(1186, 1495, 18, '2.50', 'Active', '2018-10-24 03:59:01', '2018-10-24 03:59:01'),
(1187, 1482, 18, '1.25', 'Active', '2018-10-24 03:59:27', '2018-10-24 03:59:27'),
(1188, 1490, 18, '1.50', 'Active', '2018-10-24 03:59:27', '2018-10-24 03:59:27'),
(1189, 1498, 18, '1.75', 'Active', '2018-10-24 03:59:27', '2018-10-24 03:59:27'),
(1190, 1477, 18, '1.75', 'Active', '2018-10-24 03:59:47', '2018-10-24 03:59:47'),
(1191, 1485, 18, '2.00', 'Active', '2018-10-24 03:59:47', '2018-10-24 03:59:47'),
(1192, 1493, 18, '2.25', 'Active', '2018-10-24 03:59:47', '2018-10-24 03:59:47'),
(1193, 1480, 18, '1.50', 'Active', '2018-10-24 04:00:09', '2018-10-24 04:00:09'),
(1194, 1488, 18, '1.75', 'Active', '2018-10-24 04:00:09', '2018-10-24 04:00:09'),
(1195, 1496, 18, '2.00', 'Active', '2018-10-24 04:00:09', '2018-10-24 04:00:09'),
(1196, 1475, 18, '2.00', 'Active', '2018-10-24 04:00:39', '2018-10-24 04:00:39'),
(1197, 1483, 18, '2.25', 'Active', '2018-10-24 04:00:39', '2018-10-24 04:00:39'),
(1198, 1491, 18, '2.50', 'Active', '2018-10-24 04:00:39', '2018-10-24 04:00:39'),
(1199, 1499, 18, '1.25', 'Active', '2018-10-24 04:01:30', '2018-10-24 04:01:30'),
(1200, 1503, 18, '1.25', 'Active', '2018-10-24 04:01:30', '2018-10-24 04:01:30'),
(1201, 1507, 18, '1.25', 'Active', '2018-10-24 04:01:30', '2018-10-24 04:01:30'),
(1202, 1501, 18, '1.75', 'Active', '2018-10-24 04:01:51', '2018-10-24 04:01:51'),
(1203, 1505, 18, '1.75', 'Active', '2018-10-24 04:01:51', '2018-10-24 04:01:51'),
(1204, 1509, 18, '1.75', 'Active', '2018-10-24 04:01:51', '2018-10-24 04:01:51');
INSERT INTO `t_students_grade` (`Students_Grade_ID`, `Students_Grade_StudentTakenCurriculumSubjectID`, `Students_Grade_FacultyID`, `Students_Grade_Grade`, `Students_Grade_Display_Status`, `Students_Grade_Date_Added`, `Students_Grade_Date_Updated`) VALUES
(1205, 1502, 18, '1.50', 'Active', '2018-10-24 04:02:11', '2018-10-24 04:02:11'),
(1206, 1506, 18, '1.50', 'Active', '2018-10-24 04:02:11', '2018-10-24 04:02:11'),
(1207, 1510, 18, '1.50', 'Active', '2018-10-24 04:02:11', '2018-10-24 04:02:11'),
(1208, 1500, 18, '2.00', 'Active', '2018-10-24 04:02:32', '2018-10-24 04:02:32'),
(1209, 1504, 18, '2.00', 'Active', '2018-10-24 04:02:32', '2018-10-24 04:02:32'),
(1210, 1508, 18, '2.00', 'Active', '2018-10-24 04:02:32', '2018-10-24 04:02:32'),
(1211, 1437, 18, '1.50', 'Active', '2018-10-24 04:03:02', '2018-10-24 04:03:02'),
(1212, 1443, 18, '2.00', 'Active', '2018-10-24 04:03:02', '2018-10-24 04:03:02'),
(1213, 1450, 18, '2.50', 'Active', '2018-10-24 04:03:02', '2018-10-24 04:03:02'),
(1214, 1440, 18, '2.00', 'Active', '2018-10-24 04:03:24', '2018-10-24 04:03:24'),
(1215, 1446, 18, '1.25', 'Active', '2018-10-24 04:03:24', '2018-10-24 04:03:24'),
(1216, 1453, 18, '1.50', 'Active', '2018-10-24 04:03:24', '2018-10-24 04:03:24'),
(1217, 1442, 18, '2.25', 'Active', '2018-10-24 04:03:43', '2018-10-24 04:03:43'),
(1218, 1448, 18, '1.50', 'Active', '2018-10-24 04:03:43', '2018-10-24 04:03:43'),
(1219, 1455, 18, '1.75', 'Active', '2018-10-24 04:03:43', '2018-10-24 04:03:43'),
(1220, 1438, 18, '1.25', 'Active', '2018-10-24 04:04:03', '2018-10-24 04:04:03'),
(1221, 1444, 18, '1.75', 'Active', '2018-10-24 04:04:03', '2018-10-24 04:04:03'),
(1222, 1451, 18, '1.25', 'Active', '2018-10-24 04:04:03', '2018-10-24 04:04:03'),
(1223, 1441, 18, '1.50', 'Active', '2018-10-24 04:04:21', '2018-10-24 04:04:21'),
(1224, 1447, 18, '2.00', 'Active', '2018-10-24 04:04:21', '2018-10-24 04:04:21'),
(1225, 1454, 18, '2.50', 'Active', '2018-10-24 04:04:21', '2018-10-24 04:04:21'),
(1226, 1436, 18, '2.00', 'Active', '2018-10-24 04:04:53', '2018-10-24 04:04:53'),
(1227, 1449, 18, '1.25', 'Active', '2018-10-24 04:04:53', '2018-10-24 04:04:53'),
(1228, 1456, 18, '1.50', 'Active', '2018-10-24 04:04:53', '2018-10-24 04:04:53'),
(1229, 1439, 18, '1.25', 'Active', '2018-10-24 04:05:22', '2018-10-24 04:05:22'),
(1230, 1445, 18, '1.75', 'Active', '2018-10-24 04:05:22', '2018-10-24 04:05:22'),
(1231, 1452, 18, '1.25', 'Active', '2018-10-24 04:05:22', '2018-10-24 04:05:22'),
(1232, 1459, 18, '1.50', 'Active', '2018-10-24 04:05:51', '2018-10-24 04:05:51'),
(1233, 1465, 18, '2.25', 'Active', '2018-10-24 04:05:51', '2018-10-24 04:05:51'),
(1234, 1471, 18, '1.75', 'Active', '2018-10-24 04:05:52', '2018-10-24 04:05:52'),
(1235, 1461, 18, '1.50', 'Active', '2018-10-24 04:06:12', '2018-10-24 04:06:12'),
(1236, 1467, 18, '1.75', 'Active', '2018-10-24 04:06:12', '2018-10-24 04:06:12'),
(1237, 1473, 18, '1.25', 'Active', '2018-10-24 04:06:12', '2018-10-24 04:06:12'),
(1238, 1457, 18, '1.75', 'Active', '2018-10-24 04:06:55', '2018-10-24 04:06:55'),
(1239, 1463, 18, '2.00', 'Active', '2018-10-24 04:06:55', '2018-10-24 04:06:55'),
(1240, 1469, 18, '1.50', 'Active', '2018-10-24 04:06:55', '2018-10-24 04:06:55'),
(1241, 1460, 18, '1.25', 'Active', '2018-10-24 04:07:15', '2018-10-24 04:07:15'),
(1242, 1466, 18, '1.50', 'Active', '2018-10-24 04:07:15', '2018-10-24 04:07:15'),
(1243, 1472, 18, '1.00', 'Active', '2018-10-24 04:07:15', '2018-10-24 04:07:15'),
(1244, 1462, 18, '1.50', 'Active', '2018-10-24 04:07:44', '2018-10-24 04:07:44'),
(1245, 1468, 18, '2.25', 'Active', '2018-10-24 04:07:44', '2018-10-24 04:07:44'),
(1246, 1474, 18, '1.75', 'Active', '2018-10-24 04:07:44', '2018-10-24 04:07:44'),
(1247, 1458, 18, '1.50', 'Active', '2018-10-24 04:08:04', '2018-10-24 04:08:04'),
(1248, 1464, 18, '1.75', 'Active', '2018-10-24 04:08:04', '2018-10-24 04:08:04'),
(1249, 1470, 18, '1.25', 'Active', '2018-10-24 04:08:04', '2018-10-24 04:08:04'),
(1250, 1634, 18, '1.25', 'Active', '2018-10-24 04:46:51', '2018-10-24 04:46:51'),
(1251, 1644, 18, '1.25', 'Active', '2018-10-24 04:46:52', '2018-10-24 04:46:52'),
(1252, 1654, 18, '1.25', 'Active', '2018-10-24 04:46:52', '2018-10-24 04:46:52'),
(1253, 1630, 18, '1.50', 'Active', '2018-10-24 04:47:10', '2018-10-24 04:47:10'),
(1254, 1640, 18, '1.50', 'Active', '2018-10-24 04:47:10', '2018-10-24 04:47:10'),
(1255, 1650, 18, '1.50', 'Active', '2018-10-24 04:47:10', '2018-10-24 04:47:10'),
(1256, 1632, 18, '1.75', 'Active', '2018-10-24 04:47:27', '2018-10-24 04:47:27'),
(1257, 1642, 18, '1.75', 'Active', '2018-10-24 04:47:27', '2018-10-24 04:47:27'),
(1258, 1652, 18, '1.75', 'Active', '2018-10-24 04:47:27', '2018-10-24 04:47:27'),
(1259, 1636, 18, '2.00', 'Active', '2018-10-24 04:47:46', '2018-10-24 04:47:46'),
(1260, 1646, 18, '2.00', 'Active', '2018-10-24 04:47:46', '2018-10-24 04:47:46'),
(1261, 1656, 18, '2.00', 'Active', '2018-10-24 04:47:46', '2018-10-24 04:47:46'),
(1262, 1631, 18, '1.25', 'Active', '2018-10-24 04:48:04', '2018-10-24 04:48:04'),
(1263, 1641, 18, '1.25', 'Active', '2018-10-24 04:48:04', '2018-10-24 04:48:04'),
(1264, 1651, 18, '1.25', 'Active', '2018-10-24 04:48:04', '2018-10-24 04:48:04'),
(1265, 1633, 18, '1.50', 'Active', '2018-10-24 04:48:27', '2018-10-24 04:48:27'),
(1266, 1643, 18, '1.50', 'Active', '2018-10-24 04:48:27', '2018-10-24 04:48:27'),
(1267, 1653, 18, '1.50', 'Active', '2018-10-24 04:48:27', '2018-10-24 04:48:27'),
(1268, 1637, 18, '1.75', 'Active', '2018-10-24 04:49:00', '2018-10-24 04:49:00'),
(1269, 1647, 18, '1.75', 'Active', '2018-10-24 04:49:00', '2018-10-24 04:49:00'),
(1270, 1657, 18, '1.75', 'Active', '2018-10-24 04:49:00', '2018-10-24 04:49:00'),
(1271, 1635, 18, '2.00', 'Active', '2018-10-24 04:49:18', '2018-10-24 04:49:18'),
(1272, 1645, 18, '2.00', 'Active', '2018-10-24 04:49:18', '2018-10-24 04:49:18'),
(1273, 1655, 18, '2.00', 'Active', '2018-10-24 04:49:18', '2018-10-24 04:49:18'),
(1274, 1639, 18, '1.75', 'Active', '2018-10-24 04:50:49', '2018-10-24 04:50:49'),
(1275, 1649, 18, '1.25', 'Active', '2018-10-24 04:50:49', '2018-10-24 04:50:49'),
(1276, 1658, 18, '1.75', 'Active', '2018-10-24 04:51:33', '2018-10-24 04:51:33'),
(1277, 1663, 18, '2.00', 'Active', '2018-10-24 04:52:03', '2018-10-24 04:52:03'),
(1278, 1670, 18, '2.00', 'Active', '2018-10-24 04:52:03', '2018-10-24 04:52:03'),
(1279, 1677, 18, '2.00', 'Active', '2018-10-24 04:52:03', '2018-10-24 04:52:03'),
(1280, 1660, 18, '1.75', 'Active', '2018-10-24 04:52:22', '2018-10-24 04:52:22'),
(1281, 1667, 18, '1.75', 'Active', '2018-10-24 04:52:22', '2018-10-24 04:52:22'),
(1282, 1674, 18, '1.75', 'Active', '2018-10-24 04:52:22', '2018-10-24 04:52:22'),
(1283, 1664, 18, '1.50', 'Active', '2018-10-24 04:52:40', '2018-10-24 04:52:40'),
(1284, 1671, 18, '1.50', 'Active', '2018-10-24 04:52:40', '2018-10-24 04:52:40'),
(1285, 1678, 18, '1.50', 'Active', '2018-10-24 04:52:40', '2018-10-24 04:52:40'),
(1286, 1661, 18, '1.25', 'Active', '2018-10-24 04:53:13', '2018-10-24 04:53:13'),
(1287, 1668, 18, '1.25', 'Active', '2018-10-24 04:53:13', '2018-10-24 04:53:13'),
(1288, 1675, 18, '1.25', 'Active', '2018-10-24 04:53:13', '2018-10-24 04:53:13'),
(1289, 1662, 18, '1.75', 'Active', '2018-10-24 04:54:01', '2018-10-24 04:54:01'),
(1290, 1669, 18, '1.75', 'Active', '2018-10-24 04:54:01', '2018-10-24 04:54:01'),
(1291, 1676, 18, '1.75', 'Active', '2018-10-24 04:54:01', '2018-10-24 04:54:01'),
(1292, 1666, 18, '1.25', 'Active', '2018-10-24 04:55:31', '2018-10-24 04:55:31'),
(1293, 1672, 18, '1.50', 'Active', '2018-10-24 04:56:13', '2018-10-24 04:56:13'),
(1294, 1679, 18, '1.50', 'Active', '2018-10-24 04:56:13', '2018-10-24 04:56:13'),
(1295, 1604, 18, '1.00', 'Active', '2018-10-24 04:57:53', '2018-10-24 04:57:53'),
(1296, 1612, 18, '1.25', 'Active', '2018-10-24 04:57:53', '2018-10-24 04:57:53'),
(1297, 1620, 18, '1.50', 'Active', '2018-10-24 04:57:53', '2018-10-24 04:57:53'),
(1298, 1599, 18, '1.50', 'Active', '2018-10-24 04:58:23', '2018-10-24 04:58:23'),
(1299, 1607, 18, '1.75', 'Active', '2018-10-24 04:58:23', '2018-10-24 04:58:23'),
(1300, 1615, 18, '2.00', 'Active', '2018-10-24 04:58:23', '2018-10-24 04:58:23'),
(1301, 1602, 18, '1.25', 'Active', '2018-10-24 04:58:49', '2018-10-24 04:58:49'),
(1302, 1610, 18, '1.50', 'Active', '2018-10-24 04:58:49', '2018-10-24 04:58:49'),
(1303, 1618, 18, '1.75', 'Active', '2018-10-24 04:58:49', '2018-10-24 04:58:49'),
(1304, 1605, 18, '2.00', 'Active', '2018-10-24 04:59:10', '2018-10-24 04:59:10'),
(1305, 1613, 18, '1.75', 'Active', '2018-10-24 04:59:10', '2018-10-24 04:59:10'),
(1306, 1621, 18, '1.50', 'Active', '2018-10-24 04:59:10', '2018-10-24 04:59:10'),
(1307, 1600, 18, '1.50', 'Active', '2018-10-24 04:59:32', '2018-10-24 04:59:32'),
(1308, 1608, 18, '1.75', 'Active', '2018-10-24 04:59:32', '2018-10-24 04:59:32'),
(1309, 1616, 18, '2.00', 'Active', '2018-10-24 04:59:32', '2018-10-24 04:59:32'),
(1310, 1603, 18, '1.00', 'Active', '2018-10-24 04:59:52', '2018-10-24 04:59:52'),
(1311, 1611, 18, '1.25', 'Active', '2018-10-24 04:59:53', '2018-10-24 04:59:53'),
(1312, 1619, 18, '1.50', 'Active', '2018-10-24 04:59:53', '2018-10-24 04:59:53'),
(1313, 1598, 18, '1.25', 'Active', '2018-10-24 05:00:15', '2018-10-24 05:00:15'),
(1314, 1606, 18, '1.50', 'Active', '2018-10-24 05:00:15', '2018-10-24 05:00:15'),
(1315, 1614, 18, '1.75', 'Active', '2018-10-24 05:00:15', '2018-10-24 05:00:15'),
(1316, 1601, 18, '1.25', 'Active', '2018-10-24 05:00:40', '2018-10-24 05:00:40'),
(1317, 1609, 18, '1.50', 'Active', '2018-10-24 05:00:41', '2018-10-24 05:00:41'),
(1318, 1617, 18, '1.75', 'Active', '2018-10-24 05:00:41', '2018-10-24 05:00:41'),
(1319, 1624, 18, '1.75', 'Active', '2018-10-24 05:01:54', '2018-10-24 05:01:54'),
(1320, 1628, 18, '2.00', 'Active', '2018-10-24 05:01:54', '2018-10-24 05:01:54'),
(1321, 1623, 18, '1.50', 'Active', '2018-10-24 05:04:21', '2018-10-24 05:04:21'),
(1322, 1682, 18, '1.50', 'Active', '2018-10-24 05:04:21', '2018-10-24 05:04:21'),
(1323, 1627, 18, '1.50', 'Active', '2018-10-24 05:04:21', '2018-10-24 05:04:21'),
(1324, 1625, 18, '1.75', 'Active', '2018-10-24 05:04:43', '2018-10-24 05:04:43'),
(1325, 1684, 18, '1.75', 'Active', '2018-10-24 05:04:43', '2018-10-24 05:04:43'),
(1326, 1629, 18, '1.75', 'Active', '2018-10-24 05:04:43', '2018-10-24 05:04:43'),
(1327, 1622, 18, '1.25', 'Active', '2018-10-24 05:05:02', '2018-10-24 05:05:02'),
(1328, 1681, 18, '1.25', 'Active', '2018-10-24 05:05:02', '2018-10-24 05:05:02'),
(1329, 1626, 18, '1.25', 'Active', '2018-10-24 05:05:02', '2018-10-24 05:05:02'),
(1330, 1570, 18, '1.75', 'Active', '2018-10-24 05:06:21', '2018-10-24 05:06:21'),
(1331, 1577, 18, '2.00', 'Active', '2018-10-24 05:06:21', '2018-10-24 05:06:21'),
(1332, 1584, 18, '2.25', 'Active', '2018-10-24 05:06:21', '2018-10-24 05:06:21'),
(1333, 1565, 18, '1.25', 'Active', '2018-10-24 05:06:48', '2018-10-24 05:06:48'),
(1334, 1572, 18, '1.50', 'Active', '2018-10-24 05:06:48', '2018-10-24 05:06:48'),
(1335, 1579, 18, '1.75', 'Active', '2018-10-24 05:06:48', '2018-10-24 05:06:48'),
(1336, 1568, 18, '1.50', 'Active', '2018-10-24 05:07:13', '2018-10-24 05:07:13'),
(1337, 1575, 18, '1.75', 'Active', '2018-10-24 05:07:13', '2018-10-24 05:07:13'),
(1338, 1582, 18, '2.00', 'Active', '2018-10-24 05:07:13', '2018-10-24 05:07:13'),
(1339, 1571, 18, '2.00', 'Active', '2018-10-24 05:07:32', '2018-10-24 05:07:32'),
(1340, 1578, 18, '2.25', 'Active', '2018-10-24 05:07:32', '2018-10-24 05:07:32'),
(1341, 1585, 18, '2.50', 'Active', '2018-10-24 05:07:32', '2018-10-24 05:07:32'),
(1342, 1566, 18, '1.25', 'Active', '2018-10-24 05:07:55', '2018-10-24 05:07:55'),
(1343, 1573, 18, '1.50', 'Active', '2018-10-24 05:07:55', '2018-10-24 05:07:55'),
(1344, 1580, 18, '1.75', 'Active', '2018-10-24 05:07:56', '2018-10-24 05:07:56'),
(1345, 1569, 18, '1.75', 'Active', '2018-10-24 05:08:15', '2018-10-24 05:08:15'),
(1346, 1576, 18, '2.00', 'Active', '2018-10-24 05:08:15', '2018-10-24 05:08:15'),
(1347, 1583, 18, '2.25', 'Active', '2018-10-24 05:08:16', '2018-10-24 05:08:16'),
(1348, 1567, 18, '1.50', 'Active', '2018-10-24 05:08:35', '2018-10-24 05:08:35'),
(1349, 1574, 18, '1.75', 'Active', '2018-10-24 05:08:35', '2018-10-24 05:08:35'),
(1350, 1581, 18, '2.00', 'Active', '2018-10-24 05:08:35', '2018-10-24 05:08:35'),
(1351, 1586, 18, '1.25', 'Active', '2018-10-24 05:09:14', '2018-10-24 05:09:14'),
(1352, 1590, 18, '1.25', 'Active', '2018-10-24 05:09:14', '2018-10-24 05:09:14'),
(1353, 1594, 18, '1.25', 'Active', '2018-10-24 05:09:14', '2018-10-24 05:09:14'),
(1354, 1588, 18, '1.75', 'Active', '2018-10-24 05:09:33', '2018-10-24 05:09:33'),
(1355, 1592, 18, '1.75', 'Active', '2018-10-24 05:09:33', '2018-10-24 05:09:33'),
(1356, 1596, 18, '1.75', 'Active', '2018-10-24 05:09:33', '2018-10-24 05:09:33'),
(1357, 1589, 18, '1.50', 'Active', '2018-10-24 05:09:55', '2018-10-24 05:09:55'),
(1358, 1593, 18, '1.50', 'Active', '2018-10-24 05:09:55', '2018-10-24 05:09:55'),
(1359, 1597, 18, '1.50', 'Active', '2018-10-24 05:09:55', '2018-10-24 05:09:55'),
(1360, 1587, 18, '2.00', 'Active', '2018-10-24 05:10:13', '2018-10-24 05:10:13'),
(1361, 1591, 18, '2.00', 'Active', '2018-10-24 05:10:13', '2018-10-24 05:10:13'),
(1362, 1595, 18, '2.00', 'Active', '2018-10-24 05:10:13', '2018-10-24 05:10:13'),
(1363, 1556, 18, '2.00', 'Active', '2018-10-24 05:11:08', '2018-10-24 05:11:08'),
(1364, 1557, 18, '1.25', 'Active', '2018-10-24 05:11:08', '2018-10-24 05:11:08'),
(1365, 1558, 18, '1.50', 'Active', '2018-10-24 05:11:08', '2018-10-24 05:11:08'),
(1366, 1560, 18, '1.50', 'Active', '2018-10-24 05:11:48', '2018-10-24 05:11:48'),
(1367, 1562, 18, '2.25', 'Active', '2018-10-24 05:11:48', '2018-10-24 05:11:48'),
(1368, 1564, 18, '1.75', 'Active', '2018-10-24 05:11:48', '2018-10-24 05:11:48'),
(1369, 1559, 18, '1.50', 'Active', '2018-10-24 05:12:11', '2018-10-24 05:12:11'),
(1370, 1561, 18, '1.75', 'Active', '2018-10-24 05:12:11', '2018-10-24 05:12:11'),
(1371, 1563, 18, '1.25', 'Active', '2018-10-24 05:12:11', '2018-10-24 05:12:11'),
(1372, 1182, 18, '1.25', 'Active', '2019-02-04 21:37:29', '2019-02-04 21:37:29'),
(1373, 1190, 18, '1.25', 'Active', '2019-02-04 21:37:29', '2019-02-04 21:37:29'),
(1374, 1200, 18, '1.25', 'Active', '2019-02-04 21:37:29', '2019-02-04 21:37:29'),
(1375, 1024, 18, '1.25', 'Active', '2019-02-04 21:40:23', '2019-02-04 21:40:23'),
(1376, 1030, 18, '1.25', 'Active', '2019-02-04 21:40:24', '2019-02-04 21:40:24'),
(1377, 1685, 18, '2.00', 'Active', '2019-02-04 21:57:17', '2019-02-04 21:57:17'),
(1378, 1686, 18, '2.00', 'Active', '2019-02-04 21:57:17', '2019-02-04 21:57:17'),
(1379, 1687, 18, '2.00', 'Active', '2019-02-04 21:57:17', '2019-02-04 21:57:17'),
(1380, 1688, 18, '1.25', 'Active', '2019-02-05 09:29:19', '2019-02-05 09:29:19'),
(1381, 1699, 18, '1.50', 'Active', '2019-02-05 09:29:19', '2019-02-05 09:29:19'),
(1382, 1709, 18, '1.75', 'Active', '2019-02-05 09:29:20', '2019-02-05 09:29:20'),
(1383, 1691, 18, '2.50', 'Active', '2019-02-05 09:29:51', '2019-02-05 09:29:51'),
(1384, 1702, 18, '2.00', 'Active', '2019-02-05 09:29:51', '2019-02-05 09:29:51'),
(1385, 1712, 18, '2.25', 'Active', '2019-02-05 09:29:51', '2019-02-05 09:29:51'),
(1386, 1695, 18, '1.75', 'Active', '2019-02-05 09:30:15', '2019-02-05 09:30:15'),
(1387, 1698, 18, '1.50', 'Active', '2019-02-05 09:30:15', '2019-02-05 09:30:15'),
(1388, 1708, 18, '1.25', 'Active', '2019-02-05 09:30:15', '2019-02-05 09:30:15'),
(1389, 1689, 18, '2.00', 'Active', '2019-02-05 09:31:15', '2019-02-05 09:31:15'),
(1390, 1700, 18, '2.00', 'Active', '2019-02-05 09:31:15', '2019-02-05 09:31:15'),
(1391, 1710, 18, '2.00', 'Active', '2019-02-05 09:31:15', '2019-02-05 09:31:15'),
(1392, 1692, 18, '1.25', 'Active', '2019-02-05 09:31:37', '2019-02-05 09:31:37'),
(1393, 1703, 18, '1.50', 'Active', '2019-02-05 09:31:37', '2019-02-05 09:31:37'),
(1394, 1713, 18, '1.75', 'Active', '2019-02-05 09:31:37', '2019-02-05 09:31:37'),
(1395, 1690, 18, '2.50', 'Active', '2019-02-05 09:32:14', '2019-02-05 09:32:14'),
(1396, 1701, 18, '2.00', 'Active', '2019-02-05 09:32:14', '2019-02-05 09:32:14'),
(1397, 1711, 18, '2.25', 'Active', '2019-02-05 09:32:14', '2019-02-05 09:32:14'),
(1398, 1693, 18, '1.75', 'Active', '2019-02-05 09:32:34', '2019-02-05 09:32:34'),
(1399, 1704, 18, '1.50', 'Active', '2019-02-05 09:32:34', '2019-02-05 09:32:34'),
(1400, 1714, 18, '1.25', 'Active', '2019-02-05 09:32:34', '2019-02-05 09:32:34'),
(1401, 1694, 18, '2.00', 'Active', '2019-02-05 09:32:55', '2019-02-05 09:32:55'),
(1402, 1705, 18, '2.00', 'Active', '2019-02-05 09:32:55', '2019-02-05 09:32:55'),
(1403, 1715, 18, '2.00', 'Active', '2019-02-05 09:32:55', '2019-02-05 09:32:55'),
(1404, 1707, 18, '2.00', 'Active', '2019-02-05 09:34:45', '2019-02-05 09:34:45'),
(1405, 1696, 18, '1.50', 'Active', '2019-02-05 09:36:10', '2019-02-05 09:36:10'),
(1406, 1716, 18, '1.50', 'Active', '2019-02-05 09:36:10', '2019-02-05 09:36:10'),
(1407, 1719, 18, '2.25', 'Active', '2019-02-05 09:42:03', '2019-02-05 09:42:03'),
(1408, 1727, 18, '2.25', 'Active', '2019-02-05 09:42:03', '2019-02-05 09:42:03'),
(1409, 1735, 18, '2.25', 'Active', '2019-02-05 09:42:03', '2019-02-05 09:42:03'),
(1410, 1721, 18, '1.25', 'Active', '2019-02-05 09:42:24', '2019-02-05 09:42:24'),
(1411, 1729, 18, '1.50', 'Active', '2019-02-05 09:42:24', '2019-02-05 09:42:24'),
(1412, 1737, 18, '1.75', 'Active', '2019-02-05 09:42:24', '2019-02-05 09:42:24'),
(1413, 1722, 18, '2.50', 'Active', '2019-02-05 09:42:50', '2019-02-05 09:42:50'),
(1414, 1730, 18, '2.00', 'Active', '2019-02-05 09:42:50', '2019-02-05 09:42:50'),
(1415, 1738, 18, '2.25', 'Active', '2019-02-05 09:42:50', '2019-02-05 09:42:50'),
(1416, 1718, 18, '1.75', 'Active', '2019-02-05 09:43:07', '2019-02-05 09:43:07'),
(1417, 1726, 18, '1.50', 'Active', '2019-02-05 09:43:08', '2019-02-05 09:43:08'),
(1418, 1734, 18, '1.25', 'Active', '2019-02-05 09:43:08', '2019-02-05 09:43:08'),
(1419, 1723, 18, '1.25', 'Active', '2019-02-05 09:43:33', '2019-02-05 09:43:33'),
(1420, 1731, 18, '1.50', 'Active', '2019-02-05 09:43:33', '2019-02-05 09:43:33'),
(1421, 1739, 18, '1.75', 'Active', '2019-02-05 09:43:33', '2019-02-05 09:43:33'),
(1422, 1732, 18, '2.00', 'Active', '2019-02-05 09:44:32', '2019-02-05 09:44:32'),
(1423, 1740, 18, '2.00', 'Active', '2019-02-05 09:44:32', '2019-02-05 09:44:32'),
(1424, 1725, 18, '1.75', 'Active', '2019-02-05 09:45:49', '2019-02-05 09:45:49'),
(1425, 1819, 18, '1.50', 'Active', '2019-02-05 09:47:46', '2019-02-05 09:47:46'),
(1426, 1830, 18, '1.50', 'Active', '2019-02-05 09:47:46', '2019-02-05 09:47:46'),
(1427, 1839, 18, '1.50', 'Active', '2019-02-05 09:47:46', '2019-02-05 09:47:46'),
(1428, 1822, 18, '1.25', 'Active', '2019-02-05 09:50:54', '2019-02-05 09:50:54'),
(1429, 1833, 18, '1.50', 'Active', '2019-02-05 09:50:54', '2019-02-05 09:50:54'),
(1430, 1842, 18, '1.75', 'Active', '2019-02-05 09:50:54', '2019-02-05 09:50:54'),
(1431, 1825, 18, '2.50', 'Active', '2019-02-05 09:51:15', '2019-02-05 09:51:15'),
(1432, 1827, 18, '2.00', 'Active', '2019-02-05 09:51:15', '2019-02-05 09:51:15'),
(1433, 1836, 18, '2.25', 'Active', '2019-02-05 09:51:15', '2019-02-05 09:51:15'),
(1434, 1820, 18, '1.75', 'Active', '2019-02-05 09:51:41', '2019-02-05 09:51:41'),
(1435, 1831, 18, '1.50', 'Active', '2019-02-05 09:51:41', '2019-02-05 09:51:41'),
(1436, 1840, 18, '1.25', 'Active', '2019-02-05 09:51:41', '2019-02-05 09:51:41'),
(1437, 1823, 18, '1.50', 'Active', '2019-02-05 09:52:03', '2019-02-05 09:52:03'),
(1438, 1834, 18, '1.50', 'Active', '2019-02-05 09:52:03', '2019-02-05 09:52:03'),
(1439, 1843, 18, '1.50', 'Active', '2019-02-05 09:52:03', '2019-02-05 09:52:03'),
(1440, 1817, 18, '1.25', 'Active', '2019-02-05 09:52:21', '2019-02-05 09:52:21'),
(1441, 1828, 18, '1.50', 'Active', '2019-02-05 09:52:21', '2019-02-05 09:52:21'),
(1442, 1837, 18, '1.75', 'Active', '2019-02-05 09:52:21', '2019-02-05 09:52:21'),
(1443, 1818, 18, '2.50', 'Active', '2019-02-05 09:52:44', '2019-02-05 09:52:44'),
(1444, 1829, 18, '2.00', 'Active', '2019-02-05 09:52:44', '2019-02-05 09:52:44'),
(1445, 1838, 18, '2.25', 'Active', '2019-02-05 09:52:44', '2019-02-05 09:52:44'),
(1446, 1821, 18, '1.75', 'Active', '2019-02-05 09:53:03', '2019-02-05 09:53:03'),
(1447, 1832, 18, '1.50', 'Active', '2019-02-05 09:53:03', '2019-02-05 09:53:03'),
(1448, 1841, 18, '1.25', 'Active', '2019-02-05 09:53:03', '2019-02-05 09:53:03'),
(1449, 1824, 18, '1.50', 'Active', '2019-02-05 09:53:21', '2019-02-05 09:53:21'),
(1450, 1826, 18, '1.50', 'Active', '2019-02-05 09:53:21', '2019-02-05 09:53:21'),
(1451, 1835, 18, '1.50', 'Active', '2019-02-05 09:53:21', '2019-02-05 09:53:21'),
(1452, 1846, 18, '2.00', 'Active', '2019-02-05 10:00:00', '2019-02-05 10:00:00'),
(1453, 1852, 18, '2.00', 'Active', '2019-02-05 10:00:00', '2019-02-05 10:00:00'),
(1454, 1858, 18, '2.00', 'Active', '2019-02-05 10:00:00', '2019-02-05 10:00:00'),
(1455, 1848, 18, '1.75', 'Active', '2019-02-05 10:00:21', '2019-02-05 10:00:21'),
(1456, 1854, 18, '1.50', 'Active', '2019-02-05 10:00:21', '2019-02-05 10:00:21'),
(1457, 1860, 18, '1.25', 'Active', '2019-02-05 10:00:21', '2019-02-05 10:00:21'),
(1458, 1844, 18, '2.50', 'Active', '2019-02-05 10:00:39', '2019-02-05 10:00:39'),
(1459, 1850, 18, '2.25', 'Active', '2019-02-05 10:00:39', '2019-02-05 10:00:39'),
(1460, 1856, 18, '2.75', 'Active', '2019-02-05 10:00:39', '2019-02-05 10:00:39'),
(1461, 1849, 18, '1.75', 'Active', '2019-02-05 10:01:16', '2019-02-05 10:01:16'),
(1462, 1855, 18, '1.25', 'Active', '2019-02-05 10:01:16', '2019-02-05 10:01:16'),
(1463, 1861, 18, '1.50', 'Active', '2019-02-05 10:01:16', '2019-02-05 10:01:16'),
(1464, 1845, 18, '2.00', 'Active', '2019-02-05 10:01:40', '2019-02-05 10:01:40'),
(1465, 1851, 18, '2.00', 'Active', '2019-02-05 10:01:40', '2019-02-05 10:01:40'),
(1466, 1857, 18, '2.00', 'Active', '2019-02-05 10:01:40', '2019-02-05 10:01:40'),
(1467, 1847, 18, '1.75', 'Active', '2019-02-05 10:02:05', '2019-02-05 10:02:05'),
(1468, 1853, 18, '1.50', 'Active', '2019-02-05 10:02:05', '2019-02-05 10:02:05'),
(1469, 1859, 18, '1.25', 'Active', '2019-02-05 10:02:05', '2019-02-05 10:02:05'),
(1470, 1788, 18, '1.25', 'Active', '2019-02-05 10:06:06', '2019-02-05 10:06:06'),
(1471, 1796, 18, '1.50', 'Active', '2019-02-05 10:06:06', '2019-02-05 10:06:06'),
(1472, 1801, 18, '1.75', 'Active', '2019-02-05 10:06:06', '2019-02-05 10:06:06'),
(1473, 1783, 18, '2.50', 'Active', '2019-02-05 10:06:27', '2019-02-05 10:06:27'),
(1474, 1791, 18, '2.00', 'Active', '2019-02-05 10:06:28', '2019-02-05 10:06:28'),
(1475, 1804, 18, '2.25', 'Active', '2019-02-05 10:06:28', '2019-02-05 10:06:28'),
(1476, 1786, 18, '1.75', 'Active', '2019-02-05 10:06:50', '2019-02-05 10:06:50'),
(1477, 1794, 18, '1.50', 'Active', '2019-02-05 10:06:50', '2019-02-05 10:06:50'),
(1478, 1799, 18, '1.25', 'Active', '2019-02-05 10:06:50', '2019-02-05 10:06:50'),
(1479, 1781, 18, '2.00', 'Active', '2019-02-05 10:07:07', '2019-02-05 10:07:07'),
(1480, 1789, 18, '2.00', 'Active', '2019-02-05 10:07:07', '2019-02-05 10:07:07'),
(1481, 1802, 18, '2.00', 'Active', '2019-02-05 10:07:07', '2019-02-05 10:07:07'),
(1482, 1784, 18, '1.25', 'Active', '2019-02-05 10:07:36', '2019-02-05 10:07:36'),
(1483, 1792, 18, '1.50', 'Active', '2019-02-05 10:07:36', '2019-02-05 10:07:36'),
(1484, 1797, 18, '1.75', 'Active', '2019-02-05 10:07:36', '2019-02-05 10:07:36'),
(1485, 1787, 18, '1.75', 'Active', '2019-02-05 10:08:00', '2019-02-05 10:08:00'),
(1486, 1795, 18, '1.50', 'Active', '2019-02-05 10:08:00', '2019-02-05 10:08:00'),
(1487, 1800, 18, '1.25', 'Active', '2019-02-05 10:08:00', '2019-02-05 10:08:00'),
(1488, 1782, 18, '2.00', 'Active', '2019-02-05 10:08:18', '2019-02-05 10:08:18'),
(1489, 1790, 18, '2.00', 'Active', '2019-02-05 10:08:18', '2019-02-05 10:08:18'),
(1490, 1803, 18, '2.00', 'Active', '2019-02-05 10:08:18', '2019-02-05 10:08:18'),
(1491, 1785, 18, '2.50', 'Active', '2019-02-05 10:08:39', '2019-02-05 10:08:39'),
(1492, 1793, 18, '2.00', 'Active', '2019-02-05 10:08:40', '2019-02-05 10:08:40'),
(1493, 1798, 18, '2.25', 'Active', '2019-02-05 10:08:40', '2019-02-05 10:08:40'),
(1494, 1805, 18, '1.25', 'Active', '2019-02-05 10:12:10', '2019-02-05 10:12:10'),
(1495, 1809, 18, '1.50', 'Active', '2019-02-05 10:12:10', '2019-02-05 10:12:10'),
(1496, 1814, 18, '1.75', 'Active', '2019-02-05 10:12:10', '2019-02-05 10:12:10'),
(1497, 1807, 18, '1.75', 'Active', '2019-02-05 10:12:38', '2019-02-05 10:12:38'),
(1498, 1811, 18, '1.50', 'Active', '2019-02-05 10:12:38', '2019-02-05 10:12:38'),
(1499, 1816, 18, '1.25', 'Active', '2019-02-05 10:12:38', '2019-02-05 10:12:38'),
(1500, 1808, 18, '2.50', 'Active', '2019-02-05 10:12:57', '2019-02-05 10:12:57'),
(1501, 1812, 18, '2.00', 'Active', '2019-02-05 10:12:57', '2019-02-05 10:12:57'),
(1502, 1813, 18, '2.25', 'Active', '2019-02-05 10:12:57', '2019-02-05 10:12:57'),
(1503, 1806, 18, '2.00', 'Active', '2019-02-05 10:13:13', '2019-02-05 10:13:13'),
(1504, 1810, 18, '2.00', 'Active', '2019-02-05 10:13:13', '2019-02-05 10:13:13'),
(1505, 1815, 18, '2.00', 'Active', '2019-02-05 10:13:13', '2019-02-05 10:13:13'),
(1506, 1748, 18, '1.25', 'Active', '2019-02-05 10:16:07', '2019-02-05 10:16:07'),
(1507, 1754, 18, '1.50', 'Active', '2019-02-05 10:16:07', '2019-02-05 10:16:07'),
(1508, 1762, 18, '1.75', 'Active', '2019-02-05 10:16:07', '2019-02-05 10:16:07'),
(1509, 1768, 18, '1.25', 'Active', '2019-02-05 10:16:07', '2019-02-05 10:16:07'),
(1510, 1774, 18, '1.50', 'Active', '2019-02-05 10:16:07', '2019-02-05 10:16:07'),
(1511, 1779, 18, '1.75', 'Active', '2019-02-05 10:16:07', '2019-02-05 10:16:07'),
(1512, 1743, 18, '1.75', 'Active', '2019-02-05 10:20:15', '2019-02-05 10:20:15'),
(1513, 1749, 18, '1.50', 'Active', '2019-02-05 10:20:15', '2019-02-05 10:20:15'),
(1514, 1757, 18, '1.25', 'Active', '2019-02-05 10:20:15', '2019-02-05 10:20:15'),
(1515, 1746, 18, '2.00', 'Active', '2019-02-05 10:20:36', '2019-02-05 10:20:36'),
(1516, 1752, 18, '2.00', 'Active', '2019-02-05 10:20:36', '2019-02-05 10:20:36'),
(1517, 1760, 18, '2.00', 'Active', '2019-02-05 10:20:36', '2019-02-05 10:20:36'),
(1518, 1744, 18, '2.50', 'Active', '2019-02-05 10:20:57', '2019-02-05 10:20:57'),
(1519, 1750, 18, '2.00', 'Active', '2019-02-05 10:20:57', '2019-02-05 10:20:57'),
(1520, 1758, 18, '2.25', 'Active', '2019-02-05 10:20:57', '2019-02-05 10:20:57'),
(1521, 1747, 18, '2.25', 'Active', '2019-02-05 10:21:27', '2019-02-05 10:21:27'),
(1522, 1753, 18, '1.75', 'Active', '2019-02-05 10:21:27', '2019-02-05 10:21:27'),
(1523, 1761, 18, '2.00', 'Active', '2019-02-05 10:21:27', '2019-02-05 10:21:27'),
(1524, 1742, 18, '1.75', 'Active', '2019-02-05 10:21:47', '2019-02-05 10:21:47'),
(1525, 1755, 18, '1.50', 'Active', '2019-02-05 10:21:47', '2019-02-05 10:21:47'),
(1526, 1756, 18, '1.25', 'Active', '2019-02-05 10:21:47', '2019-02-05 10:21:47'),
(1527, 1745, 18, '2.00', 'Active', '2019-02-05 10:22:05', '2019-02-05 10:22:05'),
(1528, 1751, 18, '2.00', 'Active', '2019-02-05 10:22:05', '2019-02-05 10:22:05'),
(1529, 1759, 18, '2.00', 'Active', '2019-02-05 10:22:05', '2019-02-05 10:22:05'),
(1530, 1765, 18, '1.25', 'Active', '2019-02-05 10:25:47', '2019-02-05 10:25:47'),
(1531, 1771, 18, '1.50', 'Active', '2019-02-05 10:25:47', '2019-02-05 10:25:47'),
(1532, 1776, 18, '1.75', 'Active', '2019-02-05 10:25:47', '2019-02-05 10:25:47'),
(1533, 1767, 18, '2.50', 'Active', '2019-02-05 10:26:09', '2019-02-05 10:26:09'),
(1534, 1773, 18, '2.00', 'Active', '2019-02-05 10:26:09', '2019-02-05 10:26:09'),
(1535, 1778, 18, '2.25', 'Active', '2019-02-05 10:26:09', '2019-02-05 10:26:09'),
(1536, 1763, 18, '1.75', 'Active', '2019-02-05 10:26:36', '2019-02-05 10:26:36'),
(1537, 1769, 18, '1.50', 'Active', '2019-02-05 10:26:36', '2019-02-05 10:26:36'),
(1538, 1780, 18, '1.25', 'Active', '2019-02-05 10:26:36', '2019-02-05 10:26:36'),
(1539, 1766, 18, '2.25', 'Active', '2019-02-05 10:27:03', '2019-02-05 10:27:03'),
(1540, 1772, 18, '2.25', 'Active', '2019-02-05 10:27:03', '2019-02-05 10:27:03'),
(1541, 1777, 18, '2.25', 'Active', '2019-02-05 10:27:04', '2019-02-05 10:27:04'),
(1542, 1764, 18, '1.25', 'Active', '2019-02-05 10:27:30', '2019-02-05 10:27:30'),
(1543, 1770, 18, '1.50', 'Active', '2019-02-05 10:27:30', '2019-02-05 10:27:30'),
(1544, 1775, 18, '1.75', 'Active', '2019-02-05 10:27:30', '2019-02-05 10:27:30'),
(1545, 1869, 18, '1.50', 'Active', '2019-02-05 11:02:10', '2019-02-05 11:02:10'),
(1546, 1877, 18, '1.50', 'Active', '2019-02-05 11:02:10', '2019-02-05 11:02:10'),
(1547, 1883, 18, '1.50', 'Active', '2019-02-05 11:02:10', '2019-02-05 11:02:10'),
(1548, 1864, 18, '1.25', 'Active', '2019-02-05 11:02:26', '2019-02-05 11:02:26'),
(1549, 1872, 18, '1.50', 'Active', '2019-02-05 11:02:26', '2019-02-05 11:02:26'),
(1550, 1878, 18, '1.75', 'Active', '2019-02-05 11:02:26', '2019-02-05 11:02:26'),
(1551, 1862, 18, '2.50', 'Active', '2019-02-05 11:02:45', '2019-02-05 11:02:45'),
(1552, 1870, 18, '2.00', 'Active', '2019-02-05 11:02:45', '2019-02-05 11:02:45'),
(1553, 1884, 18, '2.25', 'Active', '2019-02-05 11:02:45', '2019-02-05 11:02:45'),
(1554, 1865, 18, '1.75', 'Active', '2019-02-05 11:03:04', '2019-02-05 11:03:04'),
(1555, 1873, 18, '1.50', 'Active', '2019-02-05 11:03:04', '2019-02-05 11:03:04'),
(1556, 1879, 18, '1.25', 'Active', '2019-02-05 11:03:04', '2019-02-05 11:03:04'),
(1557, 1868, 18, '1.50', 'Active', '2019-02-05 11:03:19', '2019-02-05 11:03:19'),
(1558, 1876, 18, '1.50', 'Active', '2019-02-05 11:03:19', '2019-02-05 11:03:19'),
(1559, 1882, 18, '1.50', 'Active', '2019-02-05 11:03:19', '2019-02-05 11:03:19'),
(1560, 1863, 18, '1.25', 'Active', '2019-02-05 11:03:34', '2019-02-05 11:03:34'),
(1561, 1871, 18, '1.50', 'Active', '2019-02-05 11:03:34', '2019-02-05 11:03:34'),
(1562, 1885, 18, '1.75', 'Active', '2019-02-05 11:03:34', '2019-02-05 11:03:34'),
(1563, 1866, 18, '2.50', 'Active', '2019-02-05 11:03:50', '2019-02-05 11:03:50'),
(1564, 1874, 18, '2.00', 'Active', '2019-02-05 11:03:50', '2019-02-05 11:03:50'),
(1565, 1880, 18, '2.25', 'Active', '2019-02-05 11:03:50', '2019-02-05 11:03:50'),
(1566, 1867, 18, '1.75', 'Active', '2019-02-05 11:04:06', '2019-02-05 11:04:06'),
(1567, 1875, 18, '1.50', 'Active', '2019-02-05 11:04:06', '2019-02-05 11:04:06'),
(1568, 1881, 18, '1.25', 'Active', '2019-02-05 11:04:06', '2019-02-05 11:04:06'),
(1569, 1888, 18, '2.00', 'Active', '2019-02-05 11:05:00', '2019-02-05 11:05:00'),
(1570, 1891, 18, '2.00', 'Active', '2019-02-05 11:05:00', '2019-02-05 11:05:00'),
(1571, 1894, 18, '2.00', 'Active', '2019-02-05 11:05:00', '2019-02-05 11:05:00'),
(1572, 1889, 18, '1.75', 'Active', '2019-02-05 11:06:05', '2019-02-05 11:06:05'),
(1573, 1892, 18, '1.50', 'Active', '2019-02-05 11:06:05', '2019-02-05 11:06:05'),
(1574, 1895, 18, '1.25', 'Active', '2019-02-05 11:06:05', '2019-02-05 11:06:05'),
(1575, 1887, 18, '2.50', 'Active', '2019-02-05 11:06:32', '2019-02-05 11:06:32'),
(1576, 1890, 18, '2.25', 'Active', '2019-02-05 11:06:32', '2019-02-05 11:06:32'),
(1577, 1897, 18, '2.75', 'Active', '2019-02-05 11:06:32', '2019-02-05 11:06:32'),
(1578, 1886, 18, '1.75', 'Active', '2019-02-05 11:06:51', '2019-02-05 11:06:51'),
(1579, 1893, 18, '1.25', 'Active', '2019-02-05 11:06:51', '2019-02-05 11:06:51'),
(1580, 1896, 18, '1.50', 'Active', '2019-02-05 11:06:51', '2019-02-05 11:06:51'),
(1581, 1902, 18, '1.25', 'Active', '2019-02-05 11:07:47', '2019-02-05 11:07:47'),
(1582, 1906, 18, '1.50', 'Active', '2019-02-05 11:07:47', '2019-02-05 11:07:47'),
(1583, 1914, 18, '1.75', 'Active', '2019-02-05 11:07:47', '2019-02-05 11:07:47'),
(1584, 1900, 18, '2.50', 'Active', '2019-02-05 11:08:08', '2019-02-05 11:08:08'),
(1585, 1911, 18, '2.00', 'Active', '2019-02-05 11:08:08', '2019-02-05 11:08:08'),
(1586, 1912, 18, '2.25', 'Active', '2019-02-05 11:08:08', '2019-02-05 11:08:08'),
(1587, 1903, 18, '1.75', 'Active', '2019-02-05 11:08:26', '2019-02-05 11:08:26'),
(1588, 1907, 18, '1.50', 'Active', '2019-02-05 11:08:26', '2019-02-05 11:08:26'),
(1589, 1915, 18, '1.25', 'Active', '2019-02-05 11:08:26', '2019-02-05 11:08:26'),
(1590, 1898, 18, '2.00', 'Active', '2019-02-05 11:08:44', '2019-02-05 11:08:44'),
(1591, 1909, 18, '2.00', 'Active', '2019-02-05 11:08:45', '2019-02-05 11:08:45'),
(1592, 1917, 18, '2.00', 'Active', '2019-02-05 11:08:45', '2019-02-05 11:08:45'),
(1593, 1901, 18, '1.25', 'Active', '2019-02-05 11:09:01', '2019-02-05 11:09:01'),
(1594, 1905, 18, '1.50', 'Active', '2019-02-05 11:09:02', '2019-02-05 11:09:02'),
(1595, 1913, 18, '1.75', 'Active', '2019-02-05 11:09:02', '2019-02-05 11:09:02'),
(1596, 1904, 18, '2.50', 'Active', '2019-02-05 11:09:18', '2019-02-05 11:09:18'),
(1597, 1908, 18, '2.00', 'Active', '2019-02-05 11:09:18', '2019-02-05 11:09:18'),
(1598, 1916, 18, '2.25', 'Active', '2019-02-05 11:09:18', '2019-02-05 11:09:18'),
(1599, 1899, 18, '1.75', 'Active', '2019-02-05 11:09:34', '2019-02-05 11:09:34'),
(1600, 1910, 18, '1.50', 'Active', '2019-02-05 11:09:34', '2019-02-05 11:09:34'),
(1601, 1918, 18, '1.25', 'Active', '2019-02-05 11:09:34', '2019-02-05 11:09:34'),
(1602, 1922, 18, '1.25', 'Active', '2019-02-05 11:10:36', '2019-02-05 11:10:36'),
(1603, 1926, 18, '1.50', 'Active', '2019-02-05 11:10:37', '2019-02-05 11:10:37'),
(1604, 1929, 18, '1.75', 'Active', '2019-02-05 11:10:37', '2019-02-05 11:10:37'),
(1605, 1921, 16, '1.25', 'Active', '2019-02-05 11:10:53', '2019-03-27 00:16:35'),
(1606, 1925, 16, '1.25', 'Active', '2019-02-05 11:10:53', '2019-03-27 00:16:38'),
(1607, 1928, 16, '2.25', 'Active', '2019-02-05 11:10:53', '2019-03-27 00:16:41'),
(1608, 1919, 18, '1.75', 'Active', '2019-02-05 11:11:18', '2019-02-05 11:11:18'),
(1609, 1923, 18, '1.50', 'Active', '2019-02-05 11:11:18', '2019-02-05 11:11:18'),
(1610, 1930, 18, '1.25', 'Active', '2019-02-05 11:11:19', '2019-02-05 11:11:19'),
(1611, 1920, 18, '2.00', 'Active', '2019-02-05 11:11:55', '2019-02-05 11:11:55'),
(1612, 1924, 18, '2.00', 'Active', '2019-02-05 11:11:55', '2019-02-05 11:11:55'),
(1613, 1927, 18, '2.00', 'Active', '2019-02-05 11:11:55', '2019-02-05 11:11:55'),
(1614, 1931, 18, '2.00', 'Active', '2019-02-05 11:14:35', '2019-02-05 11:14:35'),
(1615, 1932, 18, '2.00', 'Active', '2019-02-05 11:14:35', '2019-02-05 11:14:35'),
(1616, 1933, 18, '2.00', 'Active', '2019-02-05 11:14:35', '2019-02-05 11:14:35'),
(1617, 1934, 18, '1.25', 'Active', '2019-02-05 11:15:15', '2019-02-05 11:15:15'),
(1618, 1936, 18, '1.50', 'Active', '2019-02-05 11:15:15', '2019-02-05 11:15:15'),
(1619, 1939, 18, '1.75', 'Active', '2019-02-05 11:15:15', '2019-02-05 11:15:15'),
(1620, 1935, 18, '1.75', 'Active', '2019-02-05 11:15:33', '2019-02-05 11:15:33'),
(1621, 1937, 18, '1.50', 'Active', '2019-02-05 11:15:33', '2019-02-05 11:15:33'),
(1622, 1938, 18, '1.25', 'Active', '2019-02-05 11:15:33', '2019-02-05 11:15:33'),
(1623, 1244, 18, '1.75', 'Active', '2019-02-05 11:17:54', '2019-02-05 11:17:54'),
(1624, 1250, 18, '1.50', 'Active', '2019-02-05 11:17:54', '2019-02-05 11:17:54'),
(1625, 1256, 18, '1.25', 'Active', '2019-02-05 11:17:54', '2019-02-05 11:17:54'),
(1626, 1940, 18, '1.25', 'Active', '2019-02-05 11:40:41', '2019-02-05 11:40:41'),
(1627, 1954, 18, '1.50', 'Active', '2019-02-05 11:40:41', '2019-02-05 11:40:41'),
(1628, 1962, 18, '1.75', 'Active', '2019-02-05 11:40:41', '2019-02-05 11:40:41'),
(1629, 1944, 18, '2.50', 'Active', '2019-02-05 11:40:59', '2019-02-05 11:40:59'),
(1630, 1950, 18, '2.00', 'Active', '2019-02-05 11:40:59', '2019-02-05 11:40:59'),
(1631, 1966, 18, '2.25', 'Active', '2019-02-05 11:40:59', '2019-02-05 11:40:59'),
(1632, 1946, 18, '1.75', 'Active', '2019-02-05 11:41:16', '2019-02-05 11:41:16'),
(1633, 1952, 18, '1.50', 'Active', '2019-02-05 11:41:16', '2019-02-05 11:41:16'),
(1634, 1960, 18, '1.25', 'Active', '2019-02-05 11:41:16', '2019-02-05 11:41:16'),
(1635, 1942, 18, '2.00', 'Active', '2019-02-05 11:41:39', '2019-02-05 11:41:39'),
(1636, 1956, 18, '2.00', 'Active', '2019-02-05 11:41:39', '2019-02-05 11:41:39'),
(1637, 1964, 18, '2.00', 'Active', '2019-02-05 11:41:39', '2019-02-05 11:41:39'),
(1638, 1945, 18, '1.25', 'Active', '2019-02-05 11:41:57', '2019-02-05 11:41:57'),
(1639, 1951, 18, '1.50', 'Active', '2019-02-05 11:41:57', '2019-02-05 11:41:57'),
(1640, 1967, 18, '1.75', 'Active', '2019-02-05 11:41:57', '2019-02-05 11:41:57'),
(1641, 1947, 18, '2.50', 'Active', '2019-02-05 11:42:13', '2019-02-05 11:42:13'),
(1642, 1953, 18, '2.00', 'Active', '2019-02-05 11:42:13', '2019-02-05 11:42:13'),
(1643, 1961, 18, '2.25', 'Active', '2019-02-05 11:42:13', '2019-02-05 11:42:13'),
(1644, 1943, 18, '1.75', 'Active', '2019-02-05 11:42:32', '2019-02-05 11:42:32'),
(1645, 1957, 18, '1.50', 'Active', '2019-02-05 11:42:33', '2019-02-05 11:42:33'),
(1646, 1965, 18, '1.25', 'Active', '2019-02-05 11:42:33', '2019-02-05 11:42:33'),
(1647, 1941, 18, '2.00', 'Active', '2019-02-05 11:42:50', '2019-02-05 11:42:50'),
(1648, 1955, 18, '2.00', 'Active', '2019-02-05 11:42:50', '2019-02-05 11:42:50'),
(1649, 1963, 18, '2.00', 'Active', '2019-02-05 11:42:50', '2019-02-05 11:42:50'),
(1650, 1958, 18, '2.00', 'Active', '2019-02-05 11:43:15', '2019-02-05 11:43:15'),
(1651, 1949, 18, '1.50', 'Active', '2019-02-05 11:43:31', '2019-02-05 11:43:31'),
(1652, 1969, 18, '1.50', 'Active', '2019-02-05 11:43:31', '2019-02-05 11:43:31'),
(1653, 1971, 18, '1.25', 'Active', '2019-02-05 11:44:07', '2019-02-05 11:44:07'),
(1654, 1978, 18, '1.50', 'Active', '2019-02-05 11:44:07', '2019-02-05 11:44:07'),
(1655, 1986, 18, '1.75', 'Active', '2019-02-05 11:44:07', '2019-02-05 11:44:07'),
(1656, 1973, 18, '2.25', 'Active', '2019-02-05 11:44:24', '2019-02-05 11:44:24'),
(1657, 1980, 18, '2.25', 'Active', '2019-02-05 11:44:24', '2019-02-05 11:44:24'),
(1658, 1988, 18, '2.25', 'Active', '2019-02-05 11:44:24', '2019-02-05 11:44:24'),
(1659, 1970, 18, '2.50', 'Active', '2019-02-05 11:44:45', '2019-02-05 11:44:45'),
(1660, 1977, 18, '2.00', 'Active', '2019-02-05 11:44:45', '2019-02-05 11:44:45'),
(1661, 1985, 18, '2.25', 'Active', '2019-02-05 11:44:45', '2019-02-05 11:44:45'),
(1662, 1972, 18, '1.75', 'Active', '2019-02-05 11:45:08', '2019-02-05 11:45:08'),
(1663, 1979, 18, '1.50', 'Active', '2019-02-05 11:45:08', '2019-02-05 11:45:08'),
(1664, 1987, 18, '1.25', 'Active', '2019-02-05 11:45:08', '2019-02-05 11:45:08'),
(1665, 1974, 18, '1.25', 'Active', '2019-02-05 11:45:34', '2019-02-05 11:45:34'),
(1666, 1981, 18, '1.50', 'Active', '2019-02-05 11:45:34', '2019-02-05 11:45:34'),
(1667, 1984, 18, '1.75', 'Active', '2019-02-05 11:45:34', '2019-02-05 11:45:34'),
(1668, 1975, 18, '1.75', 'Active', '2019-02-05 11:45:50', '2019-02-05 11:45:50'),
(1669, 1983, 18, '2.00', 'Active', '2019-02-05 11:46:08', '2019-02-05 11:46:08'),
(1670, 1990, 18, '2.00', 'Active', '2019-02-05 11:46:08', '2019-02-05 11:46:08'),
(1671, 1991, 18, '1.25', 'Active', '2019-02-13 13:43:37', '2019-02-13 13:43:37'),
(1672, 1992, 18, '1.50', 'Active', '2019-02-13 13:43:37', '2019-02-13 13:43:37'),
(1673, 1993, 18, '1.75', 'Active', '2019-02-13 13:43:37', '2019-02-13 13:43:37'),
(1674, 1720, 18, '1.25', 'Active', '2019-02-13 23:20:49', '2019-02-13 23:20:49'),
(1675, 1728, 18, '1.50', 'Active', '2019-02-13 23:20:50', '2019-02-13 23:20:50'),
(1676, 1736, 18, '1.75', 'Active', '2019-02-13 23:20:50', '2019-02-13 23:20:50'),
(1677, 1996, 18, '1.25', 'Active', '2019-02-13 23:44:44', '2019-02-13 23:44:44'),
(1678, 2006, 18, '1.50', 'Active', '2019-02-13 23:44:44', '2019-02-13 23:44:44'),
(1679, 2016, 18, '1.75', 'Active', '2019-02-13 23:44:44', '2019-02-13 23:44:44'),
(1680, 1997, 18, '2.50', 'Active', '2019-02-14 13:33:59', '2019-02-14 13:33:59'),
(1681, 2007, 18, '2.25', 'Active', '2019-02-14 13:33:59', '2019-02-14 13:33:59'),
(1682, 2017, 18, '2.00', 'Active', '2019-02-14 13:33:59', '2019-02-14 13:33:59'),
(1683, 1999, 18, '2.00', 'Active', '2019-02-14 13:34:23', '2019-02-14 13:34:23'),
(1684, 2009, 18, '2.00', 'Active', '2019-02-14 13:34:23', '2019-02-14 13:34:23'),
(1685, 2019, 18, '2.00', 'Active', '2019-02-14 13:34:23', '2019-02-14 13:34:23'),
(1686, 1994, 18, '1.25', 'Active', '2019-02-14 13:34:42', '2019-02-14 13:34:42'),
(1687, 2004, 18, '1.50', 'Active', '2019-02-14 13:34:42', '2019-02-14 13:34:42'),
(1688, 2014, 18, '1.75', 'Active', '2019-02-14 13:34:42', '2019-02-14 13:34:42'),
(1689, 2000, 18, '1.75', 'Active', '2019-02-14 13:35:08', '2019-02-14 13:35:08'),
(1690, 2010, 18, '1.25', 'Active', '2019-02-14 13:35:08', '2019-02-14 13:35:08'),
(1691, 2020, 18, '1.50', 'Active', '2019-02-14 13:35:08', '2019-02-14 13:35:08'),
(1692, 1995, 18, '2.00', 'Active', '2019-02-14 13:35:40', '2019-02-14 13:35:40'),
(1693, 2005, 18, '2.00', 'Active', '2019-02-14 13:35:40', '2019-02-14 13:35:40'),
(1694, 2015, 18, '2.00', 'Active', '2019-02-14 13:35:40', '2019-02-14 13:35:40'),
(1695, 1998, 18, '1.25', 'Active', '2019-02-14 13:36:00', '2019-02-14 13:36:00'),
(1696, 2008, 18, '1.50', 'Active', '2019-02-14 13:36:00', '2019-02-14 13:36:00'),
(1697, 2018, 18, '1.75', 'Active', '2019-02-14 13:36:00', '2019-02-14 13:36:00'),
(1698, 2001, 18, '1.75', 'Active', '2019-02-14 13:36:21', '2019-02-14 13:36:21'),
(1699, 2011, 18, '1.25', 'Active', '2019-02-14 13:36:21', '2019-02-14 13:36:21'),
(1700, 2021, 18, '1.50', 'Active', '2019-02-14 13:36:21', '2019-02-14 13:36:21'),
(1701, 2003, 18, '1.50', 'Active', '2019-02-14 13:38:26', '2019-02-14 13:38:26'),
(1702, 2012, 18, '1.75', 'Active', '2019-02-14 13:39:58', '2019-02-14 13:39:58'),
(1703, 2022, 18, '1.75', 'Active', '2019-02-14 13:39:58', '2019-02-14 13:39:58'),
(1704, 2125, 18, '2.50', 'Active', '2019-02-14 13:42:15', '2019-02-14 13:42:15'),
(1705, 2133, 18, '2.00', 'Active', '2019-02-14 13:42:15', '2019-02-14 13:42:15'),
(1706, 2141, 18, '2.25', 'Active', '2019-02-14 13:42:15', '2019-02-14 13:42:15'),
(1707, 2119, 18, '2.00', 'Active', '2019-02-14 13:42:53', '2019-02-14 13:42:53'),
(1708, 2127, 18, '2.00', 'Active', '2019-02-14 13:42:53', '2019-02-14 13:42:53'),
(1709, 2135, 18, '2.00', 'Active', '2019-02-14 13:42:53', '2019-02-14 13:42:53'),
(1710, 2117, 18, '1.25', 'Active', '2019-02-14 13:43:13', '2019-02-14 13:43:13'),
(1711, 2134, 18, '1.50', 'Active', '2019-02-14 13:43:13', '2019-02-14 13:43:13'),
(1712, 2142, 18, '1.75', 'Active', '2019-02-14 13:43:13', '2019-02-14 13:43:13'),
(1713, 2120, 18, '1.75', 'Active', '2019-02-14 13:43:44', '2019-02-14 13:43:44'),
(1714, 2128, 18, '1.50', 'Active', '2019-02-14 13:43:44', '2019-02-14 13:43:44'),
(1715, 2136, 18, '1.25', 'Active', '2019-02-14 13:43:44', '2019-02-14 13:43:44'),
(1716, 2123, 18, '2.00', 'Active', '2019-02-14 13:44:09', '2019-02-14 13:44:09'),
(1717, 2131, 18, '2.00', 'Active', '2019-02-14 13:44:09', '2019-02-14 13:44:09'),
(1718, 2139, 18, '2.00', 'Active', '2019-02-14 13:44:09', '2019-02-14 13:44:09'),
(1719, 2118, 18, '1.75', 'Active', '2019-02-14 13:44:52', '2019-02-14 13:44:52'),
(1720, 2126, 18, '1.50', 'Active', '2019-02-14 13:44:52', '2019-02-14 13:44:52'),
(1721, 2143, 18, '1.25', 'Active', '2019-02-14 13:44:52', '2019-02-14 13:44:52'),
(1722, 2121, 18, '1.25', 'Active', '2019-02-14 13:45:10', '2019-02-14 13:45:10'),
(1723, 2129, 18, '1.50', 'Active', '2019-02-14 13:45:10', '2019-02-14 13:45:10'),
(1724, 2137, 18, '1.75', 'Active', '2019-02-14 13:45:10', '2019-02-14 13:45:10'),
(1725, 2124, 18, '2.00', 'Active', '2019-02-14 13:45:31', '2019-02-14 13:45:31'),
(1726, 2132, 18, '2.00', 'Active', '2019-02-14 13:45:31', '2019-02-14 13:45:31'),
(1727, 2140, 18, '2.00', 'Active', '2019-02-14 13:45:31', '2019-02-14 13:45:31'),
(1728, 2122, 18, '1.75', 'Active', '2019-02-14 13:45:54', '2019-02-14 13:45:54'),
(1729, 2130, 18, '1.50', 'Active', '2019-02-14 13:45:55', '2019-02-14 13:45:55'),
(1730, 2138, 18, '1.25', 'Active', '2019-02-14 13:45:55', '2019-02-14 13:45:55'),
(1731, 2088, 18, '1.50', 'Active', '2019-02-14 13:47:13', '2019-02-14 13:47:13'),
(1732, 2090, 18, '1.50', 'Active', '2019-02-14 13:47:13', '2019-02-14 13:47:13'),
(1733, 2098, 18, '1.50', 'Active', '2019-02-14 13:47:13', '2019-02-14 13:47:13'),
(1734, 2083, 18, '1.25', 'Active', '2019-02-14 13:47:32', '2019-02-14 13:47:32'),
(1735, 2093, 18, '1.50', 'Active', '2019-02-14 13:47:32', '2019-02-14 13:47:32'),
(1736, 2101, 18, '1.75', 'Active', '2019-02-14 13:47:32', '2019-02-14 13:47:32'),
(1737, 2086, 18, '2.50', 'Active', '2019-02-14 13:47:57', '2019-02-14 13:47:57'),
(1738, 2096, 18, '2.00', 'Active', '2019-02-14 13:47:58', '2019-02-14 13:47:58'),
(1739, 2104, 18, '2.25', 'Active', '2019-02-14 13:47:58', '2019-02-14 13:47:58'),
(1740, 2081, 18, '1.75', 'Active', '2019-02-14 13:48:17', '2019-02-14 13:48:17'),
(1741, 2091, 18, '1.50', 'Active', '2019-02-14 13:48:17', '2019-02-14 13:48:17'),
(1742, 2099, 18, '1.25', 'Active', '2019-02-14 13:48:17', '2019-02-14 13:48:17'),
(1743, 2084, 18, '1.50', 'Active', '2019-02-14 13:48:36', '2019-02-14 13:48:36'),
(1744, 2094, 18, '1.50', 'Active', '2019-02-14 13:48:36', '2019-02-14 13:48:36'),
(1745, 2102, 18, '1.50', 'Active', '2019-02-14 13:48:36', '2019-02-14 13:48:36'),
(1746, 2087, 18, '1.25', 'Active', '2019-02-14 13:49:06', '2019-02-14 13:49:06'),
(1747, 2089, 18, '1.50', 'Active', '2019-02-14 13:49:06', '2019-02-14 13:49:06'),
(1748, 2097, 18, '1.75', 'Active', '2019-02-14 13:49:06', '2019-02-14 13:49:06'),
(1749, 2082, 18, '1.75', 'Active', '2019-02-14 13:49:23', '2019-02-14 13:49:23'),
(1750, 2092, 18, '1.50', 'Active', '2019-02-14 13:49:23', '2019-02-14 13:49:23'),
(1751, 2100, 18, '1.25', 'Active', '2019-02-14 13:49:23', '2019-02-14 13:49:23'),
(1752, 2085, 18, '2.50', 'Active', '2019-02-14 13:49:44', '2019-02-14 13:49:44'),
(1753, 2095, 18, '2.00', 'Active', '2019-02-14 13:49:44', '2019-02-14 13:49:44'),
(1754, 2103, 18, '2.25', 'Active', '2019-02-14 13:49:44', '2019-02-14 13:49:44'),
(1755, 2050, 18, '1.25', 'Active', '2019-02-14 13:51:44', '2019-02-14 13:51:44'),
(1756, 2057, 18, '1.50', 'Active', '2019-02-14 13:51:44', '2019-02-14 13:51:44'),
(1757, 2064, 18, '1.75', 'Active', '2019-02-14 13:51:44', '2019-02-14 13:51:44'),
(1758, 2048, 18, '1.75', 'Active', '2019-02-14 13:52:06', '2019-02-14 13:52:06'),
(1759, 2055, 18, '1.50', 'Active', '2019-02-14 13:52:06', '2019-02-14 13:52:06'),
(1760, 2062, 18, '1.25', 'Active', '2019-02-14 13:52:06', '2019-02-14 13:52:06'),
(1761, 2051, 18, '2.50', 'Active', '2019-02-14 13:52:29', '2019-02-14 13:52:29'),
(1762, 2058, 18, '2.00', 'Active', '2019-02-14 13:52:29', '2019-02-14 13:52:29'),
(1763, 2065, 18, '2.25', 'Active', '2019-02-14 13:52:29', '2019-02-14 13:52:29'),
(1764, 2053, 18, '2.00', 'Active', '2019-02-14 13:52:51', '2019-02-14 13:52:51'),
(1765, 2060, 18, '2.00', 'Active', '2019-02-14 13:52:51', '2019-02-14 13:52:51'),
(1766, 2067, 18, '2.00', 'Active', '2019-02-14 13:52:51', '2019-02-14 13:52:51'),
(1767, 2049, 18, '2.00', 'Active', '2019-02-14 13:53:12', '2019-02-14 13:53:12'),
(1768, 2056, 18, '2.00', 'Active', '2019-02-14 13:53:12', '2019-02-14 13:53:12'),
(1769, 2063, 18, '2.00', 'Active', '2019-02-14 13:53:12', '2019-02-14 13:53:12'),
(1770, 2052, 18, '1.75', 'Active', '2019-02-14 13:53:29', '2019-02-14 13:53:29'),
(1771, 2059, 18, '1.50', 'Active', '2019-02-14 13:53:29', '2019-02-14 13:53:29'),
(1772, 2066, 18, '1.25', 'Active', '2019-02-14 13:53:29', '2019-02-14 13:53:29'),
(1773, 2054, 18, '2.50', 'Active', '2019-02-14 13:53:47', '2019-02-14 13:53:47'),
(1774, 2061, 18, '2.00', 'Active', '2019-02-14 13:53:47', '2019-02-14 13:53:47'),
(1775, 2068, 18, '2.25', 'Active', '2019-02-14 13:53:47', '2019-02-14 13:53:47'),
(1776, 2039, 18, '1.75', 'Active', '2019-02-14 14:02:06', '2019-02-14 14:02:06'),
(1777, 2047, 18, '1.75', 'Active', '2019-02-14 14:02:06', '2019-02-14 14:02:06'),
(1778, 2029, 18, '2.50', 'Active', '2019-02-14 14:03:14', '2019-02-14 14:03:14'),
(1779, 2032, 18, '2.25', 'Active', '2019-02-14 14:03:14', '2019-02-14 14:03:14'),
(1780, 2040, 18, '2.00', 'Active', '2019-02-14 14:03:14', '2019-02-14 14:03:14'),
(1781, 2025, 18, '1.25', 'Active', '2019-02-14 14:03:33', '2019-02-14 14:03:33'),
(1782, 2034, 18, '1.50', 'Active', '2019-02-14 14:03:33', '2019-02-14 14:03:33'),
(1783, 2042, 18, '1.75', 'Active', '2019-02-14 14:03:33', '2019-02-14 14:03:33'),
(1784, 2024, 18, '1.75', 'Active', '2019-02-14 14:03:58', '2019-02-14 14:03:58'),
(1785, 2033, 18, '1.25', 'Active', '2019-02-14 14:03:58', '2019-02-14 14:03:58'),
(1786, 2041, 18, '1.50', 'Active', '2019-02-14 14:03:58', '2019-02-14 14:03:58'),
(1787, 2026, 18, '2.00', 'Active', '2019-02-14 14:04:23', '2019-02-14 14:04:23'),
(1788, 2035, 18, '2.00', 'Active', '2019-02-14 14:04:23', '2019-02-14 14:04:23'),
(1789, 2043, 18, '2.00', 'Active', '2019-02-14 14:04:23', '2019-02-14 14:04:23'),
(1790, 2028, 18, '1.75', 'Active', '2019-02-14 14:04:56', '2019-02-14 14:04:56'),
(1791, 2037, 18, '1.25', 'Active', '2019-02-14 14:04:57', '2019-02-14 14:04:57'),
(1792, 2045, 18, '1.50', 'Active', '2019-02-14 14:04:57', '2019-02-14 14:04:57'),
(1793, 2027, 18, '1.25', 'Active', '2019-02-14 14:05:30', '2019-02-14 14:05:30'),
(1794, 2036, 18, '1.50', 'Active', '2019-02-14 14:05:30', '2019-02-14 14:05:30'),
(1795, 2044, 18, '1.75', 'Active', '2019-02-14 14:05:30', '2019-02-14 14:05:30'),
(1796, 2030, 18, '1.25', 'Active', '2019-02-14 14:06:37', '2019-02-14 14:06:37'),
(1797, 2146, 18, '2.25', 'Active', '2019-02-14 14:07:53', '2019-02-14 14:07:53'),
(1798, 2150, 18, '2.25', 'Active', '2019-02-14 14:07:53', '2019-02-14 14:07:53'),
(1799, 2156, 18, '2.25', 'Active', '2019-02-14 14:07:53', '2019-02-14 14:07:53'),
(1800, 2148, 18, '1.25', 'Active', '2019-02-14 14:08:11', '2019-02-14 14:08:11'),
(1801, 2152, 18, '1.50', 'Active', '2019-02-14 14:08:11', '2019-02-14 14:08:11'),
(1802, 2158, 18, '1.75', 'Active', '2019-02-14 14:08:11', '2019-02-14 14:08:11'),
(1803, 2144, 18, '1.75', 'Active', '2019-02-14 14:08:37', '2019-02-14 14:08:37'),
(1804, 2154, 18, '1.50', 'Active', '2019-02-14 14:08:38', '2019-02-14 14:08:38'),
(1805, 2160, 18, '1.25', 'Active', '2019-02-14 14:08:38', '2019-02-14 14:08:38'),
(1806, 2149, 18, '2.50', 'Active', '2019-02-14 14:08:56', '2019-02-14 14:08:56'),
(1807, 2153, 18, '2.00', 'Active', '2019-02-14 14:08:56', '2019-02-14 14:08:56'),
(1808, 2159, 18, '2.25', 'Active', '2019-02-14 14:08:56', '2019-02-14 14:08:56'),
(1809, 2145, 18, '1.25', 'Active', '2019-02-14 14:09:18', '2019-02-14 14:09:18'),
(1810, 2155, 18, '1.50', 'Active', '2019-02-14 14:09:18', '2019-02-14 14:09:18'),
(1811, 2161, 18, '1.75', 'Active', '2019-02-14 14:09:18', '2019-02-14 14:09:18'),
(1812, 2147, 18, '1.75', 'Active', '2019-02-14 14:09:42', '2019-02-14 14:09:42'),
(1813, 2151, 18, '1.50', 'Active', '2019-02-14 14:09:42', '2019-02-14 14:09:42'),
(1814, 2157, 18, '1.25', 'Active', '2019-02-14 14:09:42', '2019-02-14 14:09:42'),
(1815, 2106, 18, '2.00', 'Active', '2019-02-14 14:11:18', '2019-02-14 14:11:18'),
(1816, 2110, 18, '2.00', 'Active', '2019-02-14 14:11:18', '2019-02-14 14:11:18'),
(1817, 2114, 18, '2.00', 'Active', '2019-02-14 14:11:18', '2019-02-14 14:11:18'),
(1818, 2108, 18, '1.75', 'Active', '2019-02-14 14:11:45', '2019-02-14 14:11:45'),
(1819, 2112, 18, '1.50', 'Active', '2019-02-14 14:11:45', '2019-02-14 14:11:45'),
(1820, 2116, 18, '1.25', 'Active', '2019-02-14 14:11:45', '2019-02-14 14:11:45'),
(1821, 2105, 18, '1.75', 'Active', '2019-02-14 14:12:11', '2019-02-14 14:12:11'),
(1822, 2109, 18, '1.25', 'Active', '2019-02-14 14:12:11', '2019-02-14 14:12:11'),
(1823, 2113, 18, '1.50', 'Active', '2019-02-14 14:12:11', '2019-02-14 14:12:11'),
(1824, 2107, 18, '2.00', 'Active', '2019-02-14 14:12:41', '2019-02-14 14:12:41'),
(1825, 2111, 18, '2.00', 'Active', '2019-02-14 14:12:41', '2019-02-14 14:12:41');
INSERT INTO `t_students_grade` (`Students_Grade_ID`, `Students_Grade_StudentTakenCurriculumSubjectID`, `Students_Grade_FacultyID`, `Students_Grade_Grade`, `Students_Grade_Display_Status`, `Students_Grade_Date_Added`, `Students_Grade_Date_Updated`) VALUES
(1826, 2115, 18, '2.00', 'Active', '2019-02-14 14:12:41', '2019-02-14 14:12:41'),
(1827, 2071, 18, '1.25', 'Active', '2019-02-14 14:15:42', '2019-02-14 14:15:42'),
(1828, 2077, 18, '1.50', 'Active', '2019-02-14 14:15:42', '2019-02-14 14:15:42'),
(1829, 2073, 18, '2.50', 'Active', '2019-02-14 14:18:25', '2019-02-14 14:18:25'),
(1830, 2079, 18, '2.00', 'Active', '2019-02-14 14:18:25', '2019-02-14 14:18:25'),
(1831, 2162, 18, '2.25', 'Active', '2019-02-14 14:18:25', '2019-02-14 14:18:25'),
(1832, 2069, 18, '1.75', 'Active', '2019-02-14 14:19:05', '2019-02-14 14:19:05'),
(1833, 2075, 18, '1.50', 'Active', '2019-02-14 14:19:05', '2019-02-14 14:19:05'),
(1834, 2164, 18, '1.25', 'Active', '2019-02-14 14:19:05', '2019-02-14 14:19:05'),
(1835, 2072, 18, '2.00', 'Active', '2019-02-14 14:19:25', '2019-02-14 14:19:25'),
(1836, 2078, 18, '2.00', 'Active', '2019-02-14 14:19:26', '2019-02-14 14:19:26'),
(1837, 2167, 18, '2.00', 'Active', '2019-02-14 14:19:26', '2019-02-14 14:19:26'),
(1838, 2074, 18, '1.25', 'Active', '2019-02-14 14:19:51', '2019-02-14 14:19:51'),
(1839, 2080, 18, '1.50', 'Active', '2019-02-14 14:19:51', '2019-02-14 14:19:51'),
(1840, 2070, 18, '1.75', 'Active', '2019-02-14 14:20:19', '2019-02-14 14:20:19'),
(1841, 2076, 18, '1.50', 'Active', '2019-02-14 14:20:19', '2019-02-14 14:20:19'),
(1842, 2165, 18, '1.25', 'Active', '2019-02-14 14:20:19', '2019-02-14 14:20:19'),
(1843, 2166, 18, '1.75', 'Active', '2019-02-14 14:21:10', '2019-02-14 14:21:10'),
(1844, 2163, 18, '1.75', 'Active', '2019-02-14 14:22:21', '2019-02-14 14:22:21'),
(1845, 2246, 18, '2.50', 'Active', '2019-02-14 15:07:54', '2019-02-14 15:07:54'),
(1846, 2256, 18, '2.25', 'Active', '2019-02-14 15:07:54', '2019-02-14 15:07:54'),
(1847, 2266, 18, '2.00', 'Active', '2019-02-14 15:07:54', '2019-02-14 15:07:54'),
(1848, 2248, 18, '1.25', 'Active', '2019-02-14 15:08:18', '2019-02-14 15:08:18'),
(1849, 2258, 18, '1.50', 'Active', '2019-02-14 15:08:18', '2019-02-14 15:08:18'),
(1850, 2268, 18, '1.75', 'Active', '2019-02-14 15:08:18', '2019-02-14 15:08:18'),
(1851, 2252, 18, '1.75', 'Active', '2019-02-14 15:08:43', '2019-02-14 15:08:43'),
(1852, 2262, 18, '1.25', 'Active', '2019-02-14 15:08:43', '2019-02-14 15:08:43'),
(1853, 2272, 18, '1.50', 'Active', '2019-02-14 15:08:43', '2019-02-14 15:08:43'),
(1854, 2247, 18, '2.00', 'Active', '2019-02-14 15:08:58', '2019-02-14 15:08:58'),
(1855, 2257, 18, '2.00', 'Active', '2019-02-14 15:08:58', '2019-02-14 15:08:58'),
(1856, 2267, 18, '2.00', 'Active', '2019-02-14 15:08:58', '2019-02-14 15:08:58'),
(1857, 2249, 18, '1.25', 'Active', '2019-02-14 15:09:15', '2019-02-14 15:09:15'),
(1858, 2259, 18, '1.50', 'Active', '2019-02-14 15:09:15', '2019-02-14 15:09:15'),
(1859, 2269, 18, '1.75', 'Active', '2019-02-14 15:09:15', '2019-02-14 15:09:15'),
(1860, 2253, 18, '2.50', 'Active', '2019-02-14 15:09:33', '2019-02-14 15:09:33'),
(1861, 2263, 18, '2.25', 'Active', '2019-02-14 15:09:33', '2019-02-14 15:09:33'),
(1862, 2273, 18, '2.00', 'Active', '2019-02-14 15:09:33', '2019-02-14 15:09:33'),
(1863, 2250, 18, '2.50', 'Active', '2019-02-14 15:11:32', '2019-02-14 15:11:32'),
(1864, 2260, 18, '2.25', 'Active', '2019-02-14 15:11:32', '2019-02-14 15:11:32'),
(1865, 2270, 18, '2.00', 'Active', '2019-02-14 15:11:32', '2019-02-14 15:11:32'),
(1866, 2251, 18, '1.75', 'Active', '2019-02-14 15:11:53', '2019-02-14 15:11:53'),
(1867, 2261, 18, '1.25', 'Active', '2019-02-14 15:11:53', '2019-02-14 15:11:53'),
(1868, 2271, 18, '1.50', 'Active', '2019-02-14 15:11:53', '2019-02-14 15:11:53'),
(1869, 2254, 18, '1.50', 'Active', '2019-02-14 15:12:14', '2019-02-14 15:12:14'),
(1870, 2265, 18, '1.75', 'Active', '2019-02-14 15:12:32', '2019-02-14 15:12:32'),
(1871, 2275, 18, '1.75', 'Active', '2019-02-14 15:12:32', '2019-02-14 15:12:32'),
(1872, 2210, 18, '2.50', 'Active', '2019-02-14 15:13:23', '2019-02-14 15:13:23'),
(1873, 2218, 18, '2.00', 'Active', '2019-02-14 15:13:23', '2019-02-14 15:13:23'),
(1874, 2231, 18, '2.25', 'Active', '2019-02-14 15:13:23', '2019-02-14 15:13:23'),
(1875, 2216, 18, '1.25', 'Active', '2019-02-14 15:13:48', '2019-02-14 15:13:48'),
(1876, 2224, 18, '1.50', 'Active', '2019-02-14 15:13:48', '2019-02-14 15:13:48'),
(1877, 2229, 18, '1.75', 'Active', '2019-02-14 15:13:48', '2019-02-14 15:13:48'),
(1878, 2211, 18, '1.75', 'Active', '2019-02-14 15:14:07', '2019-02-14 15:14:07'),
(1879, 2219, 18, '1.50', 'Active', '2019-02-14 15:14:07', '2019-02-14 15:14:07'),
(1880, 2232, 18, '1.25', 'Active', '2019-02-14 15:14:07', '2019-02-14 15:14:07'),
(1881, 2214, 18, '2.00', 'Active', '2019-02-14 15:14:26', '2019-02-14 15:14:26'),
(1882, 2222, 18, '2.00', 'Active', '2019-02-14 15:14:26', '2019-02-14 15:14:26'),
(1883, 2227, 18, '2.00', 'Active', '2019-02-14 15:14:26', '2019-02-14 15:14:26'),
(1884, 2217, 18, '1.25', 'Active', '2019-02-14 15:14:53', '2019-02-14 15:14:53'),
(1885, 2225, 18, '1.50', 'Active', '2019-02-14 15:14:53', '2019-02-14 15:14:53'),
(1886, 2230, 18, '1.75', 'Active', '2019-02-14 15:14:53', '2019-02-14 15:14:53'),
(1887, 2212, 18, '1.75', 'Active', '2019-02-14 15:15:10', '2019-02-14 15:15:10'),
(1888, 2220, 18, '1.50', 'Active', '2019-02-14 15:15:10', '2019-02-14 15:15:10'),
(1889, 2233, 18, '1.25', 'Active', '2019-02-14 15:15:10', '2019-02-14 15:15:10'),
(1890, 2215, 18, '2.00', 'Active', '2019-02-14 15:15:29', '2019-02-14 15:15:29'),
(1891, 2223, 18, '2.00', 'Active', '2019-02-14 15:15:29', '2019-02-14 15:15:29'),
(1892, 2228, 18, '2.00', 'Active', '2019-02-14 15:15:29', '2019-02-14 15:15:29'),
(1893, 2213, 18, '2.00', 'Active', '2019-02-14 15:15:45', '2019-02-14 15:15:45'),
(1894, 2221, 18, '2.00', 'Active', '2019-02-14 15:15:45', '2019-02-14 15:15:45'),
(1895, 2226, 18, '2.00', 'Active', '2019-02-14 15:15:45', '2019-02-14 15:15:45'),
(1896, 2179, 18, '1.50', 'Active', '2019-02-14 15:16:44', '2019-02-14 15:16:44'),
(1897, 2186, 18, '1.50', 'Active', '2019-02-14 15:16:44', '2019-02-14 15:16:44'),
(1898, 2193, 18, '1.50', 'Active', '2019-02-14 15:16:44', '2019-02-14 15:16:44'),
(1899, 2182, 18, '1.25', 'Active', '2019-02-14 15:17:02', '2019-02-14 15:17:02'),
(1900, 2189, 18, '1.50', 'Active', '2019-02-14 15:17:02', '2019-02-14 15:17:02'),
(1901, 2196, 18, '1.75', 'Active', '2019-02-14 15:17:02', '2019-02-14 15:17:02'),
(1902, 2177, 18, '2.50', 'Active', '2019-02-14 15:17:27', '2019-02-14 15:17:27'),
(1903, 2184, 18, '2.00', 'Active', '2019-02-14 15:17:27', '2019-02-14 15:17:27'),
(1904, 2191, 18, '2.25', 'Active', '2019-02-14 15:17:27', '2019-02-14 15:17:27'),
(1905, 2180, 18, '1.75', 'Active', '2019-02-14 15:17:50', '2019-02-14 15:17:50'),
(1906, 2187, 18, '1.50', 'Active', '2019-02-14 15:17:50', '2019-02-14 15:17:50'),
(1907, 2194, 18, '1.25', 'Active', '2019-02-14 15:17:50', '2019-02-14 15:17:50'),
(1908, 2183, 18, '2.50', 'Active', '2019-02-14 15:18:08', '2019-02-14 15:18:08'),
(1909, 2190, 18, '2.00', 'Active', '2019-02-14 15:18:08', '2019-02-14 15:18:08'),
(1910, 2197, 18, '2.25', 'Active', '2019-02-14 15:18:08', '2019-02-14 15:18:08'),
(1911, 2178, 18, '1.50', 'Active', '2019-02-14 15:18:26', '2019-02-14 15:18:26'),
(1912, 2185, 18, '1.50', 'Active', '2019-02-14 15:18:26', '2019-02-14 15:18:26'),
(1913, 2192, 18, '1.50', 'Active', '2019-02-14 15:18:26', '2019-02-14 15:18:26'),
(1914, 2181, 18, '1.25', 'Active', '2019-02-14 15:18:53', '2019-02-14 15:18:53'),
(1915, 2188, 18, '1.50', 'Active', '2019-02-14 15:18:53', '2019-02-14 15:18:53'),
(1916, 2195, 18, '1.75', 'Active', '2019-02-14 15:18:53', '2019-02-14 15:18:53'),
(1917, 2168, 18, '1.25', 'Active', '2019-02-14 15:19:45', '2019-02-14 15:19:45'),
(1918, 2169, 18, '1.50', 'Active', '2019-02-14 15:19:45', '2019-02-14 15:19:45'),
(1919, 2170, 18, '1.75', 'Active', '2019-02-14 15:19:45', '2019-02-14 15:19:45'),
(1920, 2276, 18, '1.25', 'Active', '2019-02-14 15:21:03', '2019-02-14 15:21:03'),
(1921, 2283, 18, '1.50', 'Active', '2019-02-14 15:21:03', '2019-02-14 15:21:03'),
(1922, 2291, 18, '1.75', 'Active', '2019-02-14 15:21:03', '2019-02-14 15:21:03'),
(1923, 2278, 18, '1.75', 'Active', '2019-02-14 15:21:34', '2019-02-14 15:21:34'),
(1924, 2285, 18, '1.25', 'Active', '2019-02-14 15:21:34', '2019-02-14 15:21:34'),
(1925, 2293, 18, '1.50', 'Active', '2019-02-14 15:21:35', '2019-02-14 15:21:35'),
(1926, 2277, 18, '2.00', 'Active', '2019-02-14 15:22:06', '2019-02-14 15:22:06'),
(1927, 2284, 18, '2.00', 'Active', '2019-02-14 15:22:06', '2019-02-14 15:22:06'),
(1928, 2292, 18, '2.00', 'Active', '2019-02-14 15:22:06', '2019-02-14 15:22:06'),
(1929, 2279, 18, '2.50', 'Active', '2019-02-14 15:22:49', '2019-02-14 15:22:49'),
(1930, 2286, 18, '2.25', 'Active', '2019-02-14 15:22:49', '2019-02-14 15:22:49'),
(1931, 2294, 18, '2.00', 'Active', '2019-02-14 15:22:49', '2019-02-14 15:22:49'),
(1932, 2280, 18, '1.75', 'Active', '2019-02-14 15:23:08', '2019-02-14 15:23:08'),
(1933, 2287, 18, '1.25', 'Active', '2019-02-14 15:23:08', '2019-02-14 15:23:08'),
(1934, 2290, 18, '1.50', 'Active', '2019-02-14 15:23:08', '2019-02-14 15:23:08'),
(1935, 2288, 18, '1.75', 'Active', '2019-02-14 15:25:06', '2019-02-14 15:25:06'),
(1936, 2295, 18, '1.75', 'Active', '2019-02-14 15:25:06', '2019-02-14 15:25:06'),
(1937, 2282, 18, '1.25', 'Active', '2019-02-14 15:26:26', '2019-02-14 15:26:26'),
(1938, 2289, 18, '1.25', 'Active', '2019-02-14 15:26:26', '2019-02-14 15:26:26'),
(1939, 2234, 18, '1.25', 'Active', '2019-02-14 15:27:04', '2019-02-14 15:27:04'),
(1940, 2240, 18, '1.50', 'Active', '2019-02-14 15:27:04', '2019-02-14 15:27:04'),
(1941, 2242, 18, '1.75', 'Active', '2019-02-14 15:27:04', '2019-02-14 15:27:04'),
(1942, 2236, 18, '1.75', 'Active', '2019-02-14 15:27:30', '2019-02-14 15:27:30'),
(1943, 2238, 18, '1.50', 'Active', '2019-02-14 15:27:30', '2019-02-14 15:27:30'),
(1944, 2244, 18, '1.25', 'Active', '2019-02-14 15:27:30', '2019-02-14 15:27:30'),
(1945, 2237, 18, '1.25', 'Active', '2019-02-14 15:27:49', '2019-02-14 15:27:49'),
(1946, 2239, 18, '1.50', 'Active', '2019-02-14 15:27:49', '2019-02-14 15:27:49'),
(1947, 2245, 18, '1.75', 'Active', '2019-02-14 15:27:49', '2019-02-14 15:27:49'),
(1948, 2235, 18, '2.25', 'Active', '2019-02-14 15:28:06', '2019-02-14 15:28:06'),
(1949, 2241, 18, '2.25', 'Active', '2019-02-14 15:28:06', '2019-02-14 15:28:06'),
(1950, 2243, 18, '2.25', 'Active', '2019-02-14 15:28:06', '2019-02-14 15:28:06'),
(1951, 2198, 18, '2.00', 'Active', '2019-02-14 15:28:47', '2019-02-14 15:28:47'),
(1952, 2204, 16, '1.25', 'Active', '2019-02-14 15:28:47', '2019-03-27 00:18:51'),
(1953, 2207, 16, '1.25', 'Active', '2019-02-14 15:28:47', '2019-03-27 00:18:58'),
(1954, 2200, 18, '1.75', 'Active', '2019-02-14 15:29:05', '2019-02-14 15:29:05'),
(1955, 2202, 18, '1.50', 'Active', '2019-02-14 15:29:05', '2019-02-14 15:29:05'),
(1956, 2209, 18, '1.25', 'Active', '2019-02-14 15:29:05', '2019-02-14 15:29:05'),
(1957, 2201, 18, '2.50', 'Active', '2019-02-14 15:29:22', '2019-02-14 15:29:22'),
(1958, 2203, 18, '2.25', 'Active', '2019-02-14 15:29:22', '2019-02-14 15:29:22'),
(1959, 2206, 18, '2.75', 'Active', '2019-02-14 15:29:22', '2019-02-14 15:29:22'),
(1960, 2199, 18, '1.75', 'Active', '2019-02-14 15:29:51', '2019-02-14 15:29:51'),
(1961, 2205, 16, '1.50', 'Active', '2019-02-14 15:29:51', '2019-03-27 00:21:18'),
(1962, 2208, 16, '1.75', 'Active', '2019-02-14 15:29:51', '2019-03-27 00:21:21'),
(1963, 2172, 18, '1.25', 'Active', '2019-02-14 15:30:23', '2019-02-14 15:30:23'),
(1964, 2174, 18, '1.50', 'Active', '2019-02-14 15:30:23', '2019-02-14 15:30:23'),
(1965, 2176, 18, '1.75', 'Active', '2019-02-14 15:30:23', '2019-02-14 15:30:23'),
(1969, 2204, 16, '1.50', 'Active', '2019-03-27 00:19:09', '2019-03-27 00:19:42'),
(1970, 2207, 16, '1.50', 'Active', '2019-03-27 00:19:09', '2019-03-27 00:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `t_student_account`
--

CREATE TABLE `t_student_account` (
  `Student_Account_ID` int(11) NOT NULL,
  `Student_Account_Student_Profile_ID` int(11) NOT NULL,
  `Student_Account_Student_Number` varchar(100) NOT NULL,
  `Student_Account_Scholastic_Status` enum('Regular','Regular(Warning)','Irregular') NOT NULL,
  `Student_Account_Year` enum('First Year','Second Year','Third Year','Fourth Year','Fifth Year') NOT NULL,
  `Student_Account_CourseID` int(11) DEFAULT NULL,
  `Student_Account_SectionID` int(11) NOT NULL,
  `Student_Account_CampusID` int(11) NOT NULL,
  `Student_Account_CurriculumYearID` int(11) NOT NULL,
  `Student_Account_Type` enum('New Enrollee','Transferee') NOT NULL,
  `Student_Account_Display_Status` enum('Active','Inactive') DEFAULT 'Active',
  `Student_Account_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Student_Account_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_student_account`
--

INSERT INTO `t_student_account` (`Student_Account_ID`, `Student_Account_Student_Profile_ID`, `Student_Account_Student_Number`, `Student_Account_Scholastic_Status`, `Student_Account_Year`, `Student_Account_CourseID`, `Student_Account_SectionID`, `Student_Account_CampusID`, `Student_Account_CurriculumYearID`, `Student_Account_Type`, `Student_Account_Display_Status`, `Student_Account_Date_Added`, `Student_Account_Date_Updated`) VALUES
(34, 35, '2018-00001-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-23 20:04:51', '2018-10-24 03:17:19'),
(35, 36, '2018-00002-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-23 20:06:07', '2018-10-24 03:17:43'),
(36, 37, '2018-00003-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-23 20:06:59', '2018-10-24 03:18:06'),
(37, 38, '2018-00004-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-23 20:12:54', '2018-10-24 03:18:44'),
(38, 39, '2018-00005-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-23 20:13:27', '2018-10-24 03:19:07'),
(39, 40, '2018-00006-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-23 20:14:35', '2018-10-24 03:19:49'),
(40, 41, '2018-00007-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-23 21:55:46', '2019-02-04 23:33:52'),
(41, 42, '2018-00008-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-23 21:57:04', '2019-02-04 23:34:18'),
(42, 43, '2018-00009-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-23 21:57:41', '2019-02-04 23:34:47'),
(43, 44, '2018-00010-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-23 21:58:24', '2019-02-04 23:35:25'),
(44, 45, '2018-00011-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-23 21:59:12', '2019-02-04 23:35:49'),
(45, 46, '2018-00012-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-23 21:59:54', '2019-02-04 23:36:20'),
(46, 47, '2018-00013-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-24 00:02:37', '2019-02-13 23:09:58'),
(47, 48, '2018-00014-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-24 00:03:38', '2019-02-13 23:10:48'),
(48, 49, '2018-00015-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-24 00:04:23', '2019-02-13 23:11:10'),
(49, 50, '2018-00016-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-24 00:05:13', '2019-02-13 23:11:46'),
(50, 51, '2018-00017-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-24 00:05:50', '2019-02-13 23:12:15'),
(51, 52, '2018-00018-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-24 00:06:34', '2019-02-14 14:17:00'),
(52, 53, '2018-00019-CM-0', 'Regular', 'Third Year', 17, 10, 2, 1, 'New Enrollee', 'Active', '2018-10-24 03:13:28', '2019-02-13 23:12:44'),
(53, 54, '2018-00020-CM-0', 'Regular', 'Third Year', 17, 10, 2, 1, 'New Enrollee', 'Active', '2018-10-24 03:14:07', '2019-02-13 23:13:17'),
(54, 55, '2018-00021-CM-0', 'Regular', 'Third Year', 17, 10, 2, 1, 'New Enrollee', 'Active', '2018-10-24 03:14:45', '2019-02-13 23:13:44'),
(55, 56, '2018-00022-CM-0', 'Regular', 'Third Year', 18, 13, 2, 1, 'New Enrollee', 'Active', '2018-10-24 03:15:26', '2019-02-13 23:14:07'),
(56, 57, '2018-00023-CM-0', 'Regular', 'Third Year', 18, 13, 2, 1, 'New Enrollee', 'Active', '2018-10-24 03:16:12', '2019-02-13 23:14:27'),
(57, 58, '2018-00024-CM-0', 'Regular', 'Third Year', 18, 13, 2, 1, 'New Enrollee', 'Active', '2018-10-24 03:16:46', '2019-02-13 23:14:49'),
(58, 59, '2019-00001-CM-0', 'Regular', 'Second Year', 17, 7, 2, 1, 'New Enrollee', 'Active', '2019-02-04 23:11:08', '2019-02-13 23:15:39'),
(59, 60, '2019-00002-CM-0', 'Regular', 'Second Year', 17, 7, 2, 1, 'New Enrollee', 'Active', '2019-02-04 23:12:05', '2019-02-13 23:16:05'),
(60, 61, '2019-00003-CM-0', 'Regular', 'Second Year', 17, 7, 2, 1, 'New Enrollee', 'Active', '2019-02-04 23:13:44', '2019-02-13 23:16:37'),
(61, 62, '2019-00004-CM-0', 'Regular', 'Second Year', 18, 12, 2, 1, 'New Enrollee', 'Active', '2019-02-04 23:27:43', '2019-02-13 23:17:10'),
(62, 63, '2019-00005-CM-0', 'Regular', 'Second Year', 18, 12, 2, 1, 'New Enrollee', 'Active', '2019-02-04 23:32:02', '2019-02-13 23:17:43'),
(63, 64, '2019-00006-CM-0', 'Regular', 'Second Year', 18, 12, 2, 1, 'New Enrollee', 'Active', '2019-02-04 23:32:45', '2019-02-13 23:18:09'),
(64, 65, '2019-00007-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2019-02-13 22:48:24', '2019-02-13 22:48:24'),
(65, 66, '2019-00008-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2019-02-13 22:50:08', '2019-02-13 22:50:08'),
(66, 67, '2019-00009-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2019-02-13 22:51:04', '2019-02-13 22:51:04'),
(67, 68, '2019-00010-CM-0', 'Regular', 'First Year', 18, 9, 2, 1, 'New Enrollee', 'Active', '2019-02-13 22:52:09', '2019-02-13 22:52:09'),
(68, 69, '2019-00011-CM-0', 'Regular', 'First Year', 18, 9, 2, 1, 'New Enrollee', 'Active', '2019-02-13 22:52:43', '2019-02-13 22:52:43'),
(69, 70, '2019-00012-CM-0', 'Regular', 'First Year', 18, 9, 2, 1, 'New Enrollee', 'Active', '2019-02-13 22:53:15', '2019-02-13 22:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `t_student_awards`
--

CREATE TABLE `t_student_awards` (
  `Student_Awards_ID` int(11) NOT NULL,
  `Student_Awards_AwardsID` int(11) NOT NULL,
  `Student_Awards_StudentAccountID` int(11) NOT NULL,
  `Student_Awards_AcademicYearID` int(11) NOT NULL,
  `Student_Awards_SemesterID` int(11) NOT NULL,
  `Student_Awards_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Student_Awards_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Student_Awards_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_student_enrolled`
--

CREATE TABLE `t_student_enrolled` (
  `Student_Enrolled_ID` int(11) NOT NULL,
  `Student_Enrolled_StudentAccountID` int(11) NOT NULL,
  `Student_Enrolled_AcadamicYearID` int(11) NOT NULL,
  `Student_Enrolled_SemesterID` int(11) NOT NULL,
  `Student_Enrolled_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Student_Enrolled_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Student_Enrolled_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_student_taken_curriculum_subject`
--

CREATE TABLE `t_student_taken_curriculum_subject` (
  `Student_Taken_Curriculum_Subject_ID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_SubjectID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_StudentAccountID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_Taken_Status` enum('true','false') NOT NULL,
  `Student_Taken_Curriculum_Subject_YearLevel` enum('First Year','Second Year','Third Year','Fourth Year','Fifth Year') DEFAULT 'First Year',
  `Student_Taken_Curriculum_Subject_SemesterID` int(11) DEFAULT NULL,
  `Student_Taken_Curriculum_Subject_AcademicIYearID` int(11) DEFAULT NULL,
  `Student_Taken_Curriculum_Subject_SectionID` int(11) DEFAULT NULL,
  `Student_Taken_Curriculum_Subject_CourseID` int(11) DEFAULT NULL,
  `Student_Taken_Curriculum_Subject_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Student_Taken_Curriculum_Subject_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Student_Taken_Curriculum_Subject_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_student_taken_curriculum_subject`
--

INSERT INTO `t_student_taken_curriculum_subject` (`Student_Taken_Curriculum_Subject_ID`, `Student_Taken_Curriculum_Subject_SubjectID`, `Student_Taken_Curriculum_Subject_StudentAccountID`, `Student_Taken_Curriculum_Subject_Taken_Status`, `Student_Taken_Curriculum_Subject_YearLevel`, `Student_Taken_Curriculum_Subject_SemesterID`, `Student_Taken_Curriculum_Subject_AcademicIYearID`, `Student_Taken_Curriculum_Subject_SectionID`, `Student_Taken_Curriculum_Subject_CourseID`, `Student_Taken_Curriculum_Subject_Display_Status`, `Student_Taken_Curriculum_Subject_Date_Added`, `Student_Taken_Curriculum_Subject_Date_Updated`) VALUES
(833, 121, 34, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:05:01', '2018-10-23 20:05:01'),
(834, 87, 34, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:05:01', '2018-10-23 20:05:01'),
(835, 66, 34, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:05:01', '2018-10-23 20:05:01'),
(836, 70, 34, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:05:02', '2018-10-23 20:05:02'),
(837, 75, 34, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:05:02', '2018-10-23 20:05:02'),
(838, 67, 34, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:05:02', '2018-10-23 20:05:02'),
(839, 122, 34, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:05:02', '2018-10-23 20:05:02'),
(840, 78, 34, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:05:02', '2018-10-23 20:05:02'),
(841, 82, 34, 'false', 'First Year', 8, 2, 9, 17, 'Active', '2018-10-23 20:05:02', '2018-10-23 20:05:02'),
(842, 83, 34, 'true', 'First Year', 8, 2, 9, 17, 'Active', '2018-10-23 20:05:02', '2018-10-23 20:05:02'),
(843, 121, 35, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:06:11', '2018-10-23 20:06:11'),
(844, 87, 35, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:06:11', '2018-10-23 20:06:11'),
(845, 66, 35, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:06:11', '2018-10-23 20:06:11'),
(846, 70, 35, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:06:11', '2018-10-23 20:06:11'),
(847, 75, 35, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:06:12', '2018-10-23 20:06:12'),
(848, 67, 35, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:06:12', '2018-10-23 20:06:12'),
(849, 122, 35, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:06:12', '2018-10-23 20:06:12'),
(850, 78, 35, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:06:12', '2018-10-23 20:06:12'),
(851, 82, 35, 'false', 'First Year', 8, 2, 9, 17, 'Active', '2018-10-23 20:06:12', '2018-10-23 20:06:12'),
(852, 83, 35, 'true', 'First Year', 8, 2, 9, 17, 'Active', '2018-10-23 20:06:12', '2018-10-23 20:06:12'),
(853, 121, 36, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(854, 87, 36, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(855, 66, 36, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(856, 70, 36, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(857, 75, 36, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(858, 67, 36, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(859, 122, 36, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(860, 78, 36, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(861, 82, 36, 'true', 'First Year', 8, 2, 9, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(862, 83, 36, 'false', 'First Year', 8, 2, 9, 17, 'Active', '2018-10-23 20:07:02', '2018-10-23 20:07:02'),
(863, 87, 37, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:01', '2018-10-23 20:13:01'),
(864, 122, 37, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:01', '2018-10-23 20:13:01'),
(865, 70, 37, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:01', '2018-10-23 20:13:01'),
(866, 78, 37, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:01', '2018-10-23 20:13:01'),
(867, 75, 37, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:01', '2018-10-23 20:13:01'),
(868, 121, 37, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:01', '2018-10-23 20:13:01'),
(869, 82, 37, 'true', 'First Year', 8, 2, 9, 18, 'Active', '2018-10-23 20:13:01', '2018-10-23 20:13:01'),
(870, 83, 37, 'false', 'First Year', 8, 2, 9, 18, 'Active', '2018-10-23 20:13:01', '2018-10-23 20:13:01'),
(871, 87, 38, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:31', '2018-10-23 20:13:31'),
(872, 122, 38, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:31', '2018-10-23 20:13:31'),
(873, 70, 38, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:31', '2018-10-23 20:13:31'),
(874, 78, 38, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:31', '2018-10-23 20:13:31'),
(875, 75, 38, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:31', '2018-10-23 20:13:31'),
(876, 121, 38, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:13:31', '2018-10-23 20:13:31'),
(877, 82, 38, 'true', 'First Year', 8, 2, 9, 18, 'Active', '2018-10-23 20:13:31', '2018-10-23 20:13:31'),
(878, 83, 38, 'false', 'First Year', 8, 2, 9, 18, 'Active', '2018-10-23 20:13:31', '2018-10-23 20:13:31'),
(879, 87, 39, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:14:40', '2018-10-23 20:14:40'),
(880, 122, 39, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:14:40', '2018-10-23 20:14:40'),
(881, 70, 39, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:14:40', '2018-10-23 20:14:40'),
(882, 78, 39, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:14:40', '2018-10-23 20:14:40'),
(883, 75, 39, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:14:40', '2018-10-23 20:14:40'),
(884, 121, 39, 'true', 'First Year', 8, 2, 6, 18, 'Active', '2018-10-23 20:14:40', '2018-10-23 20:14:40'),
(885, 82, 39, 'false', 'First Year', 8, 2, 9, 18, 'Active', '2018-10-23 20:14:40', '2018-10-23 20:14:40'),
(886, 83, 39, 'true', 'First Year', 8, 2, 9, 18, 'Active', '2018-10-23 20:14:41', '2018-10-23 20:14:41'),
(887, 101, 34, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:49', '2018-10-23 21:03:49'),
(888, 76, 34, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:49', '2018-10-23 21:03:49'),
(889, 69, 34, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:49', '2018-10-23 21:03:49'),
(890, 134, 34, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:50', '2018-10-23 21:03:50'),
(891, 100, 34, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:50', '2018-10-23 21:03:50'),
(892, 68, 34, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:50', '2018-10-23 21:03:50'),
(893, 79, 34, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:50', '2018-10-23 21:03:50'),
(894, 71, 34, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:50', '2018-10-23 21:03:50'),
(895, 84, 34, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:50', '2018-10-23 21:03:50'),
(896, 85, 34, 'false', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:03:50', '2018-10-23 21:03:50'),
(897, 79, 35, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(898, 71, 35, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(899, 101, 35, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(900, 76, 35, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(901, 69, 35, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(902, 134, 35, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(903, 100, 35, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(904, 68, 35, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(905, 84, 35, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(906, 85, 35, 'false', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:04:32', '2018-10-23 21:04:32'),
(907, 101, 36, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:18', '2018-10-23 21:05:18'),
(908, 76, 36, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:18', '2018-10-23 21:05:18'),
(909, 69, 36, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:18', '2018-10-23 21:05:18'),
(910, 134, 36, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:18', '2018-10-23 21:05:18'),
(911, 100, 36, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:19', '2018-10-23 21:05:19'),
(912, 68, 36, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:19', '2018-10-23 21:05:19'),
(913, 79, 36, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:19', '2018-10-23 21:05:19'),
(914, 71, 36, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:19', '2018-10-23 21:05:19'),
(915, 84, 36, 'false', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:19', '2018-10-23 21:05:19'),
(916, 85, 36, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-23 21:05:20', '2018-10-23 21:05:20'),
(917, 134, 37, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:06:48', '2018-10-23 21:06:48'),
(918, 79, 37, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:06:48', '2018-10-23 21:06:48'),
(919, 71, 37, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:06:48', '2018-10-23 21:06:48'),
(920, 76, 37, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:06:48', '2018-10-23 21:06:48'),
(921, 69, 37, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:06:48', '2018-10-23 21:06:48'),
(922, 84, 37, 'false', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:06:48', '2018-10-23 21:06:48'),
(923, 85, 37, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:06:48', '2018-10-23 21:06:48'),
(924, 134, 38, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:07:37', '2018-10-23 21:07:37'),
(925, 79, 38, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:07:37', '2018-10-23 21:07:37'),
(926, 71, 38, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:07:37', '2018-10-23 21:07:37'),
(927, 76, 38, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:07:38', '2018-10-23 21:07:38'),
(928, 69, 38, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:07:38', '2018-10-23 21:07:38'),
(929, 84, 38, 'false', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:07:38', '2018-10-23 21:07:38'),
(930, 85, 38, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:07:38', '2018-10-23 21:07:38'),
(931, 79, 39, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:08:27', '2018-10-23 21:08:27'),
(932, 71, 39, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:08:27', '2018-10-23 21:08:27'),
(933, 76, 39, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:08:27', '2018-10-23 21:08:27'),
(934, 69, 39, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:08:28', '2018-10-23 21:08:28'),
(935, 134, 39, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:08:28', '2018-10-23 21:08:28'),
(936, 84, 39, 'true', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:08:28', '2018-10-23 21:08:28'),
(937, 85, 39, 'false', 'First Year', 9, 2, 9, 18, 'Active', '2018-10-23 21:08:28', '2018-10-23 21:08:28'),
(938, 67, 40, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:50', '2018-10-23 21:55:50'),
(939, 122, 40, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:50', '2018-10-23 21:55:50'),
(940, 78, 40, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:50', '2018-10-23 21:55:50'),
(941, 121, 40, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:50', '2018-10-23 21:55:50'),
(942, 87, 40, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:50', '2018-10-23 21:55:50'),
(943, 66, 40, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:51', '2018-10-23 21:55:51'),
(944, 70, 40, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:51', '2018-10-23 21:55:51'),
(945, 75, 40, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:51', '2018-10-23 21:55:51'),
(946, 82, 40, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:51', '2018-10-23 21:55:51'),
(947, 83, 40, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:55:51', '2018-10-23 21:55:51'),
(948, 67, 41, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:07', '2018-10-23 21:57:07'),
(949, 122, 41, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:07', '2018-10-23 21:57:07'),
(950, 78, 41, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:07', '2018-10-23 21:57:07'),
(951, 121, 41, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:07', '2018-10-23 21:57:07'),
(952, 87, 41, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:07', '2018-10-23 21:57:07'),
(953, 66, 41, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:08', '2018-10-23 21:57:08'),
(954, 70, 41, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:08', '2018-10-23 21:57:08'),
(955, 75, 41, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:08', '2018-10-23 21:57:08'),
(956, 82, 41, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:08', '2018-10-23 21:57:08'),
(957, 83, 41, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:08', '2018-10-23 21:57:08'),
(958, 67, 42, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:44', '2018-10-23 21:57:44'),
(959, 122, 42, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:44', '2018-10-23 21:57:44'),
(960, 78, 42, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:44', '2018-10-23 21:57:44'),
(961, 121, 42, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:44', '2018-10-23 21:57:44'),
(962, 87, 42, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:44', '2018-10-23 21:57:44'),
(963, 66, 42, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:45', '2018-10-23 21:57:45'),
(964, 70, 42, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:45', '2018-10-23 21:57:45'),
(965, 75, 42, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:45', '2018-10-23 21:57:45'),
(966, 82, 42, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:45', '2018-10-23 21:57:45'),
(967, 83, 42, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-23 21:57:45', '2018-10-23 21:57:45'),
(968, 75, 43, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:58:27', '2018-10-23 21:58:27'),
(969, 121, 43, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:58:27', '2018-10-23 21:58:27'),
(970, 87, 43, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:58:27', '2018-10-23 21:58:27'),
(971, 122, 43, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:58:27', '2018-10-23 21:58:27'),
(972, 70, 43, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:58:27', '2018-10-23 21:58:27'),
(973, 78, 43, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:58:27', '2018-10-23 21:58:27'),
(974, 82, 43, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:58:27', '2018-10-23 21:58:27'),
(975, 83, 43, 'false', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:58:27', '2018-10-23 21:58:27'),
(976, 75, 44, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(977, 121, 44, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(978, 87, 44, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(979, 122, 44, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(980, 70, 44, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(981, 78, 44, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(982, 82, 44, 'false', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(983, 83, 44, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:15', '2018-10-23 21:59:15'),
(984, 75, 45, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:58', '2018-10-23 21:59:58'),
(985, 121, 45, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:58', '2018-10-23 21:59:58'),
(986, 87, 45, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:58', '2018-10-23 21:59:58'),
(987, 122, 45, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:58', '2018-10-23 21:59:58'),
(988, 70, 45, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:58', '2018-10-23 21:59:58'),
(989, 78, 45, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:58', '2018-10-23 21:59:58'),
(990, 82, 45, 'true', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:58', '2018-10-23 21:59:58'),
(991, 83, 45, 'false', 'First Year', 8, 1, 9, 18, 'Active', '2018-10-23 21:59:58', '2018-10-23 21:59:58'),
(992, 102, 34, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(993, 89, 34, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(994, 124, 34, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(995, 77, 34, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(996, 92, 34, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(997, 133, 34, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(998, 103, 34, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(999, 72, 34, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(1000, 131, 34, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:00:57', '2018-10-23 22:00:57'),
(1001, 133, 35, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(1002, 103, 35, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(1003, 72, 35, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(1004, 131, 35, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(1005, 102, 35, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(1006, 89, 35, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(1007, 124, 35, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(1008, 77, 35, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(1009, 92, 35, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:26', '2018-10-23 22:01:26'),
(1010, 124, 36, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(1011, 77, 36, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(1012, 92, 36, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(1013, 133, 36, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(1014, 103, 36, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(1015, 72, 36, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(1016, 131, 36, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(1017, 102, 36, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(1018, 89, 36, 'true', 'Second Year', 8, 1, 7, 17, 'Active', '2018-10-23 22:01:49', '2018-10-23 22:01:49'),
(1019, 77, 37, 'true', 'Second Year', 8, 1, 7, 18, 'Active', '2018-10-23 22:02:43', '2018-10-23 22:02:43'),
(1020, 135, 37, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:02:43', '2018-10-23 22:02:43'),
(1021, 137, 37, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:02:43', '2018-10-23 22:02:43'),
(1022, 99, 37, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:02:43', '2018-10-23 22:02:43'),
(1023, 66, 37, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:02:43', '2018-10-23 22:02:43'),
(1024, 124, 37, 'true', 'Second Year', 8, 1, 7, 18, 'Active', '2018-10-23 22:02:43', '2018-10-23 22:02:43'),
(1025, 77, 38, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:21', '2018-10-23 22:03:21'),
(1026, 135, 38, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:21', '2018-10-23 22:03:21'),
(1027, 137, 38, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:21', '2018-10-23 22:03:21'),
(1028, 99, 38, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:21', '2018-10-23 22:03:21'),
(1029, 66, 38, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:21', '2018-10-23 22:03:21'),
(1030, 124, 38, 'true', 'Second Year', 8, 1, 7, 18, 'Active', '2018-10-23 22:03:21', '2018-10-23 22:03:21'),
(1031, 66, 39, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:52', '2018-10-23 22:03:52'),
(1032, 124, 39, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:52', '2018-10-23 22:03:52'),
(1033, 77, 39, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:52', '2018-10-23 22:03:52'),
(1034, 135, 39, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:53', '2018-10-23 22:03:53'),
(1035, 137, 39, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:53', '2018-10-23 22:03:53'),
(1036, 99, 39, 'true', 'Second Year', 8, 1, 12, 18, 'Active', '2018-10-23 22:03:53', '2018-10-23 22:03:53'),
(1037, 125, 34, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(1038, 99, 34, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(1039, 97, 34, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(1040, 105, 34, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(1041, 95, 34, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(1042, 132, 34, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(1043, 120, 34, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(1044, 91, 34, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:31', '2018-10-23 22:52:31'),
(1045, 132, 35, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:54', '2018-10-23 22:52:54'),
(1046, 120, 35, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:54', '2018-10-23 22:52:54'),
(1047, 91, 35, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:54', '2018-10-23 22:52:54'),
(1048, 125, 35, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:55', '2018-10-23 22:52:55'),
(1049, 99, 35, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:55', '2018-10-23 22:52:55'),
(1050, 97, 35, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:55', '2018-10-23 22:52:55'),
(1051, 105, 35, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:55', '2018-10-23 22:52:55'),
(1052, 95, 35, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:52:55', '2018-10-23 22:52:55'),
(1053, 125, 36, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(1054, 99, 36, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(1055, 97, 36, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(1056, 105, 36, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(1057, 95, 36, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(1058, 132, 36, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(1059, 120, 36, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(1060, 91, 36, 'true', 'Second Year', 9, 1, 7, 17, 'Active', '2018-10-23 22:53:17', '2018-10-23 22:53:17'),
(1061, 138, 37, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:53:50', '2018-10-23 22:53:50'),
(1062, 136, 37, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:53:50', '2018-10-23 22:53:50'),
(1063, 74, 37, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:53:50', '2018-10-23 22:53:50'),
(1064, 116, 37, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:53:50', '2018-10-23 22:53:50'),
(1065, 74, 38, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:54:13', '2018-10-23 22:54:13'),
(1066, 116, 38, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:54:13', '2018-10-23 22:54:13'),
(1067, 138, 38, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:54:13', '2018-10-23 22:54:13'),
(1068, 136, 38, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:54:13', '2018-10-23 22:54:13'),
(1069, 116, 39, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:54:35', '2018-10-23 22:54:35'),
(1070, 138, 39, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:54:35', '2018-10-23 22:54:35'),
(1071, 136, 39, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:54:35', '2018-10-23 22:54:35'),
(1072, 74, 39, 'true', 'Second Year', 9, 1, 12, 18, 'Active', '2018-10-23 22:54:36', '2018-10-23 22:54:36'),
(1073, 79, 40, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:18', '2018-10-23 22:55:18'),
(1074, 71, 40, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(1075, 101, 40, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(1076, 76, 40, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(1077, 69, 40, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(1078, 134, 40, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(1079, 100, 40, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(1080, 68, 40, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(1081, 84, 40, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(1082, 85, 40, 'false', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:19', '2018-10-23 22:55:19'),
(1083, 79, 41, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1084, 71, 41, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1085, 101, 41, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1086, 76, 41, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1087, 69, 41, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1088, 134, 41, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1089, 100, 41, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1090, 68, 41, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1091, 84, 41, 'false', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1092, 85, 41, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:55:54', '2018-10-23 22:55:54'),
(1093, 79, 42, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:24', '2018-10-23 22:56:24'),
(1094, 71, 42, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:24', '2018-10-23 22:56:24'),
(1095, 101, 42, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:24', '2018-10-23 22:56:24'),
(1096, 76, 42, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:24', '2018-10-23 22:56:24'),
(1097, 69, 42, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:25', '2018-10-23 22:56:25'),
(1098, 134, 42, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:25', '2018-10-23 22:56:25'),
(1099, 100, 42, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:25', '2018-10-23 22:56:25'),
(1100, 68, 42, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:25', '2018-10-23 22:56:25'),
(1101, 84, 42, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:25', '2018-10-23 22:56:25'),
(1102, 85, 42, 'false', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-23 22:56:25', '2018-10-23 22:56:25'),
(1103, 134, 43, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:08', '2018-10-23 22:57:08'),
(1104, 79, 43, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:08', '2018-10-23 22:57:08'),
(1105, 71, 43, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:08', '2018-10-23 22:57:08'),
(1106, 76, 43, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:08', '2018-10-23 22:57:08'),
(1107, 69, 43, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:08', '2018-10-23 22:57:08'),
(1108, 84, 43, 'false', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:09', '2018-10-23 22:57:09'),
(1109, 85, 43, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:09', '2018-10-23 22:57:09'),
(1110, 76, 44, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:49', '2018-10-23 22:57:49'),
(1111, 69, 44, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:49', '2018-10-23 22:57:49'),
(1112, 134, 44, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:49', '2018-10-23 22:57:49'),
(1113, 79, 44, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:49', '2018-10-23 22:57:49'),
(1114, 71, 44, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:49', '2018-10-23 22:57:49'),
(1115, 84, 44, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:49', '2018-10-23 22:57:49'),
(1116, 85, 44, 'false', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:57:49', '2018-10-23 22:57:49'),
(1117, 76, 45, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:58:58', '2018-10-23 22:58:58'),
(1118, 69, 45, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:58:58', '2018-10-23 22:58:58'),
(1119, 134, 45, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:58:58', '2018-10-23 22:58:58'),
(1120, 79, 45, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:58:58', '2018-10-23 22:58:58'),
(1121, 71, 45, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:58:58', '2018-10-23 22:58:58'),
(1122, 84, 45, 'false', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:58:58', '2018-10-23 22:58:58'),
(1123, 85, 45, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-23 22:58:58', '2018-10-23 22:58:58'),
(1124, 66, 46, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:02:41', '2018-10-24 00:02:41'),
(1125, 70, 46, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:02:41', '2018-10-24 00:02:41'),
(1126, 75, 46, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:02:41', '2018-10-24 00:02:41'),
(1127, 67, 46, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:02:41', '2018-10-24 00:02:41'),
(1128, 122, 46, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:02:41', '2018-10-24 00:02:41'),
(1129, 78, 46, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:02:41', '2018-10-24 00:02:41'),
(1130, 121, 46, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:02:41', '2018-10-24 00:02:41'),
(1131, 87, 46, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:02:42', '2018-10-24 00:02:42'),
(1132, 82, 46, 'false', 'First Year', 8, 5, 9, 17, 'Active', '2018-10-24 00:02:42', '2018-10-24 00:02:42'),
(1133, 83, 46, 'true', 'First Year', 8, 5, 9, 17, 'Active', '2018-10-24 00:02:42', '2018-10-24 00:02:42'),
(1134, 66, 47, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:40', '2018-10-24 00:03:40'),
(1135, 70, 47, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:40', '2018-10-24 00:03:40'),
(1136, 75, 47, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:40', '2018-10-24 00:03:40'),
(1137, 67, 47, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:41', '2018-10-24 00:03:41'),
(1138, 122, 47, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:41', '2018-10-24 00:03:41'),
(1139, 78, 47, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:41', '2018-10-24 00:03:41'),
(1140, 121, 47, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:41', '2018-10-24 00:03:41'),
(1141, 87, 47, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:41', '2018-10-24 00:03:41'),
(1142, 82, 47, 'false', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:41', '2018-10-24 00:03:41'),
(1143, 83, 47, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:03:41', '2018-10-24 00:03:41'),
(1144, 78, 48, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1145, 121, 48, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1146, 87, 48, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1147, 66, 48, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1148, 70, 48, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1149, 75, 48, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1150, 67, 48, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1151, 122, 48, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1152, 82, 48, 'false', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1153, 83, 48, 'true', 'First Year', 8, 5, 6, 17, 'Active', '2018-10-24 00:04:26', '2018-10-24 00:04:26'),
(1154, 121, 49, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:15', '2018-10-24 00:05:15'),
(1155, 87, 49, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:16', '2018-10-24 00:05:16'),
(1156, 122, 49, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:16', '2018-10-24 00:05:16'),
(1157, 70, 49, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:16', '2018-10-24 00:05:16'),
(1158, 78, 49, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:16', '2018-10-24 00:05:16'),
(1159, 75, 49, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:16', '2018-10-24 00:05:16'),
(1160, 82, 49, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:16', '2018-10-24 00:05:16'),
(1161, 83, 49, 'false', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:16', '2018-10-24 00:05:16'),
(1162, 121, 50, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:52', '2018-10-24 00:05:52'),
(1163, 87, 50, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:52', '2018-10-24 00:05:52'),
(1164, 122, 50, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:52', '2018-10-24 00:05:52'),
(1165, 70, 50, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:53', '2018-10-24 00:05:53'),
(1166, 78, 50, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:53', '2018-10-24 00:05:53'),
(1167, 75, 50, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:53', '2018-10-24 00:05:53'),
(1168, 82, 50, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:53', '2018-10-24 00:05:53'),
(1169, 83, 50, 'false', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:05:53', '2018-10-24 00:05:53'),
(1170, 121, 51, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(1171, 87, 51, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(1172, 122, 51, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(1173, 70, 51, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(1174, 78, 51, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(1175, 75, 51, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(1176, 82, 51, 'false', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(1177, 83, 51, 'true', 'First Year', 8, 5, 9, 18, 'Active', '2018-10-24 00:06:37', '2018-10-24 00:06:37'),
(1178, 130, 34, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(1179, 104, 34, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(1180, 96, 34, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(1181, 117, 34, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(1182, 98, 34, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(1183, 88, 34, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(1184, 106, 34, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(1185, 90, 34, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:19', '2018-10-24 00:07:19'),
(1186, 130, 35, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(1187, 104, 35, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(1188, 96, 35, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(1189, 117, 35, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(1190, 98, 35, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(1191, 88, 35, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(1192, 106, 35, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(1193, 90, 35, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:07:53', '2018-10-24 00:07:53'),
(1194, 106, 36, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(1195, 90, 36, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(1196, 130, 36, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(1197, 104, 36, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(1198, 96, 36, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(1199, 117, 36, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(1200, 98, 36, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(1201, 88, 36, 'true', 'Third Year', 8, 5, 10, 17, 'Active', '2018-10-24 00:08:25', '2018-10-24 00:08:25'),
(1202, 140, 37, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:09:07', '2018-10-24 00:09:07'),
(1203, 141, 37, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:09:07', '2018-10-24 00:09:07'),
(1204, 145, 37, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:09:07', '2018-10-24 00:09:07'),
(1205, 139, 37, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:09:07', '2018-10-24 00:09:07'),
(1206, 141, 38, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:09:36', '2018-10-24 00:09:36'),
(1207, 145, 38, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:09:36', '2018-10-24 00:09:36'),
(1208, 139, 38, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:09:36', '2018-10-24 00:09:36'),
(1209, 140, 38, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:09:36', '2018-10-24 00:09:36'),
(1210, 141, 39, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:10:01', '2018-10-24 00:10:01'),
(1211, 145, 39, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:10:01', '2018-10-24 00:10:01'),
(1212, 139, 39, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:10:01', '2018-10-24 00:10:01'),
(1213, 140, 39, 'true', 'Third Year', 8, 5, 13, 18, 'Active', '2018-10-24 00:10:01', '2018-10-24 00:10:01'),
(1214, 133, 40, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:10:44', '2018-10-24 00:10:44'),
(1215, 103, 40, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(1216, 72, 40, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(1217, 131, 40, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(1218, 102, 40, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(1219, 89, 40, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(1220, 124, 40, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(1221, 77, 40, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(1222, 92, 40, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:10:45', '2018-10-24 00:10:45'),
(1223, 131, 41, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:09', '2018-10-24 00:11:09'),
(1224, 102, 41, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:09', '2018-10-24 00:11:09'),
(1225, 89, 41, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:09', '2018-10-24 00:11:09'),
(1226, 124, 41, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:09', '2018-10-24 00:11:09'),
(1227, 77, 41, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:09', '2018-10-24 00:11:09'),
(1228, 92, 41, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:10', '2018-10-24 00:11:10'),
(1229, 133, 41, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:10', '2018-10-24 00:11:10'),
(1230, 103, 41, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:10', '2018-10-24 00:11:10'),
(1231, 72, 41, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:10', '2018-10-24 00:11:10'),
(1232, 131, 42, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:57', '2018-10-24 00:11:57'),
(1233, 102, 42, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:57', '2018-10-24 00:11:57'),
(1234, 89, 42, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:58', '2018-10-24 00:11:58'),
(1235, 124, 42, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:58', '2018-10-24 00:11:58'),
(1236, 77, 42, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:58', '2018-10-24 00:11:58'),
(1237, 92, 42, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:58', '2018-10-24 00:11:58'),
(1238, 133, 42, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:58', '2018-10-24 00:11:58'),
(1239, 103, 42, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:58', '2018-10-24 00:11:58'),
(1240, 72, 42, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-24 00:11:58', '2018-10-24 00:11:58'),
(1241, 77, 43, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:12:40', '2018-10-24 00:12:40'),
(1242, 135, 43, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:12:40', '2018-10-24 00:12:40'),
(1243, 137, 43, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:12:40', '2018-10-24 00:12:40'),
(1244, 99, 43, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:12:40', '2018-10-24 00:12:40'),
(1245, 66, 43, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:12:40', '2018-10-24 00:12:40'),
(1246, 124, 43, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:12:40', '2018-10-24 00:12:40'),
(1247, 77, 44, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:07', '2018-10-24 00:13:07'),
(1248, 135, 44, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:07', '2018-10-24 00:13:07'),
(1249, 137, 44, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:07', '2018-10-24 00:13:07'),
(1250, 99, 44, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:07', '2018-10-24 00:13:07'),
(1251, 66, 44, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:07', '2018-10-24 00:13:07'),
(1252, 124, 44, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:07', '2018-10-24 00:13:07'),
(1253, 77, 45, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:41', '2018-10-24 00:13:41'),
(1254, 135, 45, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:41', '2018-10-24 00:13:41'),
(1255, 137, 45, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:41', '2018-10-24 00:13:41'),
(1256, 99, 45, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:41', '2018-10-24 00:13:41'),
(1257, 66, 45, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:41', '2018-10-24 00:13:41'),
(1258, 124, 45, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-24 00:13:41', '2018-10-24 00:13:41'),
(1259, 118, 34, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:03', '2018-10-24 01:35:03'),
(1260, 74, 34, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:03', '2018-10-24 01:35:03'),
(1261, 107, 34, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:03', '2018-10-24 01:35:03'),
(1262, 110, 34, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:03', '2018-10-24 01:35:03'),
(1263, 94, 34, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:03', '2018-10-24 01:35:03'),
(1264, 119, 34, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:04', '2018-10-24 01:35:04'),
(1265, 93, 34, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:04', '2018-10-24 01:35:04'),
(1266, 118, 35, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:31', '2018-10-24 01:35:31'),
(1267, 74, 35, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:32', '2018-10-24 01:35:32'),
(1268, 107, 35, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:32', '2018-10-24 01:35:32'),
(1269, 110, 35, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:32', '2018-10-24 01:35:32'),
(1270, 94, 35, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:32', '2018-10-24 01:35:32'),
(1271, 119, 35, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:32', '2018-10-24 01:35:32'),
(1272, 93, 35, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:32', '2018-10-24 01:35:32'),
(1273, 119, 36, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:59', '2018-10-24 01:35:59'),
(1274, 93, 36, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:59', '2018-10-24 01:35:59'),
(1275, 118, 36, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:59', '2018-10-24 01:35:59'),
(1276, 74, 36, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:59', '2018-10-24 01:35:59'),
(1277, 107, 36, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:59', '2018-10-24 01:35:59'),
(1278, 110, 36, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:59', '2018-10-24 01:35:59'),
(1279, 94, 36, 'true', 'Third Year', 9, 5, 10, 17, 'Active', '2018-10-24 01:35:59', '2018-10-24 01:35:59'),
(1280, 146, 37, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:36:26', '2018-10-24 01:36:26'),
(1281, 144, 37, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:36:26', '2018-10-24 01:36:26'),
(1282, 98, 37, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:36:26', '2018-10-24 01:36:26'),
(1283, 142, 37, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:36:27', '2018-10-24 01:36:27'),
(1284, 146, 38, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:36:46', '2018-10-24 01:36:46'),
(1285, 144, 38, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:36:46', '2018-10-24 01:36:46'),
(1286, 98, 38, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:36:46', '2018-10-24 01:36:46'),
(1287, 142, 38, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:36:46', '2018-10-24 01:36:46'),
(1288, 146, 39, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:37:22', '2018-10-24 01:37:22'),
(1289, 144, 39, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:37:22', '2018-10-24 01:37:22'),
(1290, 98, 39, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:37:22', '2018-10-24 01:37:22'),
(1291, 142, 39, 'true', 'Third Year', 9, 5, 13, 18, 'Active', '2018-10-24 01:37:23', '2018-10-24 01:37:23'),
(1292, 95, 40, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:37:49', '2018-10-24 01:37:49'),
(1293, 132, 40, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:37:49', '2018-10-24 01:37:49'),
(1294, 120, 40, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:37:49', '2018-10-24 01:37:49'),
(1295, 91, 40, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:37:49', '2018-10-24 01:37:49'),
(1296, 125, 40, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:37:49', '2018-10-24 01:37:49'),
(1297, 99, 40, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:37:49', '2018-10-24 01:37:49'),
(1298, 97, 40, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:37:49', '2018-10-24 01:37:49'),
(1299, 105, 40, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:37:49', '2018-10-24 01:37:49');
INSERT INTO `t_student_taken_curriculum_subject` (`Student_Taken_Curriculum_Subject_ID`, `Student_Taken_Curriculum_Subject_SubjectID`, `Student_Taken_Curriculum_Subject_StudentAccountID`, `Student_Taken_Curriculum_Subject_Taken_Status`, `Student_Taken_Curriculum_Subject_YearLevel`, `Student_Taken_Curriculum_Subject_SemesterID`, `Student_Taken_Curriculum_Subject_AcademicIYearID`, `Student_Taken_Curriculum_Subject_SectionID`, `Student_Taken_Curriculum_Subject_CourseID`, `Student_Taken_Curriculum_Subject_Display_Status`, `Student_Taken_Curriculum_Subject_Date_Added`, `Student_Taken_Curriculum_Subject_Date_Updated`) VALUES
(1300, 105, 41, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(1301, 95, 41, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(1302, 132, 41, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(1303, 120, 41, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(1304, 91, 41, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(1305, 125, 41, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(1306, 99, 41, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(1307, 97, 41, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:38:21', '2018-10-24 01:38:21'),
(1308, 95, 42, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:39:25', '2018-10-24 01:39:25'),
(1309, 132, 42, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:39:25', '2018-10-24 01:39:25'),
(1310, 120, 42, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:39:25', '2018-10-24 01:39:25'),
(1311, 91, 42, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:39:26', '2018-10-24 01:39:26'),
(1312, 125, 42, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:39:26', '2018-10-24 01:39:26'),
(1313, 99, 42, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:39:26', '2018-10-24 01:39:26'),
(1314, 97, 42, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:39:26', '2018-10-24 01:39:26'),
(1315, 105, 42, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-24 01:39:26', '2018-10-24 01:39:26'),
(1316, 136, 43, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:39:54', '2018-10-24 01:39:54'),
(1317, 74, 43, 'true', 'Second Year', 9, 5, 10, 18, 'Active', '2018-10-24 01:39:54', '2018-10-24 01:39:54'),
(1318, 116, 43, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:39:54', '2018-10-24 01:39:54'),
(1319, 138, 43, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:39:54', '2018-10-24 01:39:54'),
(1320, 136, 44, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:40:22', '2018-10-24 01:40:22'),
(1321, 74, 44, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:40:22', '2018-10-24 01:40:22'),
(1322, 116, 44, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:40:22', '2018-10-24 01:40:22'),
(1323, 138, 44, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:40:22', '2018-10-24 01:40:22'),
(1324, 136, 45, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:40:54', '2018-10-24 01:40:54'),
(1325, 74, 45, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:40:54', '2018-10-24 01:40:54'),
(1326, 116, 45, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:40:54', '2018-10-24 01:40:54'),
(1327, 138, 45, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-24 01:40:54', '2018-10-24 01:40:54'),
(1328, 79, 46, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1329, 71, 46, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1330, 101, 46, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1331, 76, 46, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1332, 69, 46, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1333, 134, 46, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1334, 100, 46, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1335, 68, 46, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1336, 84, 46, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1337, 85, 46, 'false', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:41:40', '2018-10-24 01:41:40'),
(1338, 101, 47, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:23', '2018-10-24 01:42:23'),
(1339, 76, 47, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:23', '2018-10-24 01:42:23'),
(1340, 69, 47, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:23', '2018-10-24 01:42:23'),
(1341, 134, 47, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:23', '2018-10-24 01:42:23'),
(1342, 100, 47, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:23', '2018-10-24 01:42:23'),
(1343, 68, 47, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:23', '2018-10-24 01:42:23'),
(1344, 79, 47, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:23', '2018-10-24 01:42:23'),
(1345, 71, 47, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:23', '2018-10-24 01:42:23'),
(1346, 84, 47, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:24', '2018-10-24 01:42:24'),
(1347, 85, 47, 'false', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:24', '2018-10-24 01:42:24'),
(1348, 101, 48, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1349, 76, 48, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1350, 69, 48, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1351, 134, 48, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1352, 100, 48, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1353, 68, 48, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1354, 79, 48, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1355, 71, 48, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1356, 84, 48, 'true', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1357, 85, 48, 'false', 'First Year', 9, 5, 6, 17, 'Active', '2018-10-24 01:42:59', '2018-10-24 01:42:59'),
(1358, 134, 49, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:43:33', '2018-10-24 01:43:33'),
(1359, 79, 49, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:43:33', '2018-10-24 01:43:33'),
(1360, 71, 49, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:43:33', '2018-10-24 01:43:33'),
(1361, 76, 49, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:43:33', '2018-10-24 01:43:33'),
(1362, 69, 49, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:43:33', '2018-10-24 01:43:33'),
(1363, 84, 49, 'false', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:43:33', '2018-10-24 01:43:33'),
(1364, 85, 49, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:43:33', '2018-10-24 01:43:33'),
(1365, 134, 50, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:16', '2018-10-24 01:44:16'),
(1366, 79, 50, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:16', '2018-10-24 01:44:16'),
(1367, 71, 50, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:16', '2018-10-24 01:44:16'),
(1368, 76, 50, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:16', '2018-10-24 01:44:16'),
(1369, 69, 50, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:16', '2018-10-24 01:44:16'),
(1370, 84, 50, 'false', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:16', '2018-10-24 01:44:16'),
(1371, 85, 50, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:16', '2018-10-24 01:44:16'),
(1372, 134, 51, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:50', '2018-10-24 01:44:50'),
(1373, 79, 51, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:50', '2018-10-24 01:44:50'),
(1374, 71, 51, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:50', '2018-10-24 01:44:50'),
(1375, 76, 51, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:50', '2018-10-24 01:44:50'),
(1376, 69, 51, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:50', '2018-10-24 01:44:50'),
(1377, 84, 51, 'true', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:50', '2018-10-24 01:44:50'),
(1378, 85, 51, 'false', 'First Year', 9, 5, 9, 18, 'Active', '2018-10-24 01:44:50', '2018-10-24 01:44:50'),
(1379, 111, 34, 'true', 'Third Year', 10, 5, 10, 17, 'Active', '2018-10-24 02:17:46', '2018-10-24 02:17:46'),
(1380, 111, 35, 'true', 'Third Year', 10, 5, 10, 17, 'Active', '2018-10-24 02:18:06', '2018-10-24 02:18:06'),
(1381, 111, 36, 'true', 'Third Year', 10, 5, 10, 17, 'Active', '2018-10-24 02:18:22', '2018-10-24 02:18:22'),
(1382, 78, 52, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:13:29', '2018-10-24 03:13:29'),
(1383, 121, 52, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:13:29', '2018-10-24 03:13:29'),
(1384, 87, 52, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:13:29', '2018-10-24 03:13:29'),
(1385, 66, 52, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:13:29', '2018-10-24 03:13:29'),
(1386, 70, 52, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:13:29', '2018-10-24 03:13:29'),
(1387, 75, 52, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:13:29', '2018-10-24 03:13:29'),
(1388, 67, 52, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:13:30', '2018-10-24 03:13:30'),
(1389, 122, 52, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:13:30', '2018-10-24 03:13:30'),
(1390, 82, 52, 'true', 'First Year', 8, 6, 9, 17, 'Active', '2018-10-24 03:13:30', '2018-10-24 03:13:30'),
(1391, 83, 52, 'false', 'First Year', 8, 6, 9, 17, 'Active', '2018-10-24 03:13:30', '2018-10-24 03:13:30'),
(1392, 78, 53, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1393, 121, 53, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1394, 87, 53, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1395, 66, 53, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1396, 70, 53, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1397, 75, 53, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1398, 67, 53, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1399, 122, 53, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1400, 82, 53, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1401, 83, 53, 'false', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:08', '2018-10-24 03:14:08'),
(1402, 78, 54, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1403, 121, 54, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1404, 87, 54, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1405, 66, 54, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1406, 70, 54, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1407, 75, 54, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1408, 67, 54, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1409, 122, 54, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1410, 82, 54, 'false', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1411, 83, 54, 'true', 'First Year', 8, 6, 6, 17, 'Active', '2018-10-24 03:14:46', '2018-10-24 03:14:46'),
(1412, 70, 55, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:15:26', '2018-10-24 03:15:26'),
(1413, 78, 55, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:15:27', '2018-10-24 03:15:27'),
(1414, 75, 55, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:15:27', '2018-10-24 03:15:27'),
(1415, 121, 55, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:15:27', '2018-10-24 03:15:27'),
(1416, 87, 55, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:15:27', '2018-10-24 03:15:27'),
(1417, 122, 55, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:15:27', '2018-10-24 03:15:27'),
(1418, 82, 55, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:15:27', '2018-10-24 03:15:27'),
(1419, 83, 55, 'false', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:15:27', '2018-10-24 03:15:27'),
(1420, 121, 56, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:13', '2018-10-24 03:16:13'),
(1421, 87, 56, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:13', '2018-10-24 03:16:13'),
(1422, 122, 56, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:13', '2018-10-24 03:16:13'),
(1423, 70, 56, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:13', '2018-10-24 03:16:13'),
(1424, 78, 56, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:13', '2018-10-24 03:16:13'),
(1425, 75, 56, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:13', '2018-10-24 03:16:13'),
(1426, 82, 56, 'false', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:13', '2018-10-24 03:16:13'),
(1427, 83, 56, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:13', '2018-10-24 03:16:13'),
(1428, 70, 57, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:47', '2018-10-24 03:16:47'),
(1429, 78, 57, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:47', '2018-10-24 03:16:47'),
(1430, 75, 57, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:47', '2018-10-24 03:16:47'),
(1431, 121, 57, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:47', '2018-10-24 03:16:47'),
(1432, 87, 57, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:47', '2018-10-24 03:16:47'),
(1433, 122, 57, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:47', '2018-10-24 03:16:47'),
(1434, 82, 57, 'false', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:47', '2018-10-24 03:16:47'),
(1435, 83, 57, 'true', 'First Year', 8, 6, 9, 18, 'Active', '2018-10-24 03:16:47', '2018-10-24 03:16:47'),
(1436, 113, 34, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:19', '2018-10-24 03:17:19'),
(1437, 116, 34, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:19', '2018-10-24 03:17:19'),
(1438, 109, 34, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:20', '2018-10-24 03:17:20'),
(1439, 112, 34, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:20', '2018-10-24 03:17:20'),
(1440, 115, 34, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:20', '2018-10-24 03:17:20'),
(1441, 73, 34, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:20', '2018-10-24 03:17:20'),
(1442, 114, 34, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:20', '2018-10-24 03:17:20'),
(1443, 116, 35, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:44', '2018-10-24 03:17:44'),
(1444, 109, 35, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:44', '2018-10-24 03:17:44'),
(1445, 112, 35, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:44', '2018-10-24 03:17:44'),
(1446, 115, 35, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:44', '2018-10-24 03:17:44'),
(1447, 73, 35, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:44', '2018-10-24 03:17:44'),
(1448, 114, 35, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:44', '2018-10-24 03:17:44'),
(1449, 113, 35, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:17:44', '2018-10-24 03:17:44'),
(1450, 116, 36, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:18:06', '2018-10-24 03:18:06'),
(1451, 109, 36, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:18:06', '2018-10-24 03:18:06'),
(1452, 112, 36, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:18:06', '2018-10-24 03:18:06'),
(1453, 115, 36, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:18:06', '2018-10-24 03:18:06'),
(1454, 73, 36, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:18:06', '2018-10-24 03:18:06'),
(1455, 114, 36, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:18:06', '2018-10-24 03:18:06'),
(1456, 113, 36, 'true', 'Fourth Year', 8, 6, 11, 17, 'Active', '2018-10-24 03:18:06', '2018-10-24 03:18:06'),
(1457, 152, 37, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:18:45', '2018-10-24 03:18:45'),
(1458, 150, 37, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:18:45', '2018-10-24 03:18:45'),
(1459, 153, 37, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:18:45', '2018-10-24 03:18:45'),
(1460, 147, 37, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:18:45', '2018-10-24 03:18:45'),
(1461, 151, 37, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:18:45', '2018-10-24 03:18:45'),
(1462, 73, 37, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:18:45', '2018-10-24 03:18:45'),
(1463, 152, 38, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:07', '2018-10-24 03:19:07'),
(1464, 150, 38, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:07', '2018-10-24 03:19:07'),
(1465, 153, 38, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:07', '2018-10-24 03:19:07'),
(1466, 147, 38, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:07', '2018-10-24 03:19:07'),
(1467, 151, 38, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:07', '2018-10-24 03:19:07'),
(1468, 73, 38, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:07', '2018-10-24 03:19:07'),
(1469, 152, 39, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:49', '2018-10-24 03:19:49'),
(1470, 150, 39, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:49', '2018-10-24 03:19:49'),
(1471, 153, 39, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:50', '2018-10-24 03:19:50'),
(1472, 147, 39, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:50', '2018-10-24 03:19:50'),
(1473, 151, 39, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:50', '2018-10-24 03:19:50'),
(1474, 73, 39, 'true', 'Fourth Year', 8, 6, 14, 18, 'Active', '2018-10-24 03:19:50', '2018-10-24 03:19:50'),
(1475, 130, 40, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:14', '2018-10-24 03:20:14'),
(1476, 104, 40, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:14', '2018-10-24 03:20:14'),
(1477, 96, 40, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:15', '2018-10-24 03:20:15'),
(1478, 117, 40, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:15', '2018-10-24 03:20:15'),
(1479, 98, 40, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:15', '2018-10-24 03:20:15'),
(1480, 88, 40, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:15', '2018-10-24 03:20:15'),
(1481, 106, 40, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:15', '2018-10-24 03:20:15'),
(1482, 90, 40, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:15', '2018-10-24 03:20:15'),
(1483, 130, 41, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(1484, 104, 41, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(1485, 96, 41, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(1486, 117, 41, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(1487, 98, 41, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(1488, 88, 41, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(1489, 106, 41, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(1490, 90, 41, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:20:40', '2018-10-24 03:20:40'),
(1491, 130, 42, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(1492, 104, 42, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(1493, 96, 42, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(1494, 117, 42, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(1495, 98, 42, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(1496, 88, 42, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(1497, 106, 42, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(1498, 90, 42, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-24 03:21:06', '2018-10-24 03:21:06'),
(1499, 145, 43, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:21:32', '2018-10-24 03:21:32'),
(1500, 139, 43, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:21:32', '2018-10-24 03:21:32'),
(1501, 140, 43, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:21:32', '2018-10-24 03:21:32'),
(1502, 141, 43, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:21:32', '2018-10-24 03:21:32'),
(1503, 145, 44, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:21:52', '2018-10-24 03:21:52'),
(1504, 139, 44, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:21:52', '2018-10-24 03:21:52'),
(1505, 140, 44, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:21:52', '2018-10-24 03:21:52'),
(1506, 141, 44, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:21:52', '2018-10-24 03:21:52'),
(1507, 145, 45, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:22:16', '2018-10-24 03:22:16'),
(1508, 139, 45, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:22:16', '2018-10-24 03:22:16'),
(1509, 140, 45, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:22:16', '2018-10-24 03:22:16'),
(1510, 141, 45, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-24 03:22:17', '2018-10-24 03:22:17'),
(1511, 131, 46, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(1512, 102, 46, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(1513, 89, 46, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(1514, 124, 46, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(1515, 77, 46, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(1516, 92, 46, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(1517, 133, 46, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(1518, 103, 46, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(1519, 72, 46, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:22:43', '2018-10-24 03:22:43'),
(1520, 131, 47, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(1521, 102, 47, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(1522, 89, 47, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(1523, 124, 47, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(1524, 77, 47, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(1525, 92, 47, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(1526, 133, 47, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(1527, 103, 47, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(1528, 72, 47, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:16', '2018-10-24 03:23:16'),
(1529, 102, 48, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:41', '2018-10-24 03:23:41'),
(1530, 89, 48, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:41', '2018-10-24 03:23:41'),
(1531, 124, 48, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:41', '2018-10-24 03:23:41'),
(1532, 77, 48, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:41', '2018-10-24 03:23:41'),
(1533, 92, 48, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:41', '2018-10-24 03:23:41'),
(1534, 133, 48, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:42', '2018-10-24 03:23:42'),
(1535, 103, 48, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:42', '2018-10-24 03:23:42'),
(1536, 72, 48, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:42', '2018-10-24 03:23:42'),
(1537, 131, 48, 'true', 'Second Year', 8, 6, 7, 17, 'Active', '2018-10-24 03:23:42', '2018-10-24 03:23:42'),
(1538, 77, 49, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:13', '2018-10-24 03:24:13'),
(1539, 135, 49, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:13', '2018-10-24 03:24:13'),
(1540, 137, 49, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:13', '2018-10-24 03:24:13'),
(1541, 99, 49, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:13', '2018-10-24 03:24:13'),
(1542, 66, 49, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:13', '2018-10-24 03:24:13'),
(1543, 124, 49, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:13', '2018-10-24 03:24:13'),
(1544, 77, 50, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:40', '2018-10-24 03:24:40'),
(1545, 135, 50, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:40', '2018-10-24 03:24:40'),
(1546, 137, 50, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:40', '2018-10-24 03:24:40'),
(1547, 99, 50, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:40', '2018-10-24 03:24:40'),
(1548, 66, 50, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:40', '2018-10-24 03:24:40'),
(1549, 124, 50, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:24:40', '2018-10-24 03:24:40'),
(1550, 77, 51, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:25:16', '2018-10-24 03:25:16'),
(1551, 135, 51, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:25:16', '2018-10-24 03:25:16'),
(1552, 137, 51, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:25:16', '2018-10-24 03:25:16'),
(1553, 99, 51, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:25:16', '2018-10-24 03:25:16'),
(1554, 66, 51, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:25:16', '2018-10-24 03:25:16'),
(1555, 124, 51, 'true', 'Second Year', 8, 6, 12, 18, 'Active', '2018-10-24 03:25:16', '2018-10-24 03:25:16'),
(1556, 108, 34, 'true', 'Fourth Year', 9, 6, 11, 17, 'Active', '2018-10-24 04:28:24', '2018-10-24 04:28:24'),
(1557, 108, 35, 'true', 'Fourth Year', 9, 6, 11, 17, 'Active', '2018-10-24 04:28:40', '2018-10-24 04:28:40'),
(1558, 108, 36, 'true', 'Fourth Year', 9, 6, 11, 17, 'Active', '2018-10-24 04:28:57', '2018-10-24 04:28:57'),
(1559, 148, 37, 'true', 'Fourth Year', 9, 6, 14, 18, 'Active', '2018-10-24 04:29:18', '2018-10-24 04:29:18'),
(1560, 149, 37, 'true', 'Fourth Year', 9, 6, 14, 18, 'Active', '2018-10-24 04:29:18', '2018-10-24 04:29:18'),
(1561, 148, 38, 'true', 'Fourth Year', 9, 6, 14, 18, 'Active', '2018-10-24 04:29:35', '2018-10-24 04:29:35'),
(1562, 149, 38, 'true', 'Fourth Year', 9, 6, 14, 18, 'Active', '2018-10-24 04:29:35', '2018-10-24 04:29:35'),
(1563, 148, 39, 'true', 'Fourth Year', 9, 6, 14, 18, 'Active', '2018-10-24 04:30:14', '2018-10-24 04:30:14'),
(1564, 149, 39, 'true', 'Fourth Year', 9, 6, 14, 18, 'Active', '2018-10-24 04:30:14', '2018-10-24 04:30:14'),
(1565, 118, 40, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:30:44', '2018-10-24 04:30:44'),
(1566, 74, 40, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:30:44', '2018-10-24 04:30:44'),
(1567, 107, 40, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:30:44', '2018-10-24 04:30:44'),
(1568, 110, 40, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:30:44', '2018-10-24 04:30:44'),
(1569, 94, 40, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:30:44', '2018-10-24 04:30:44'),
(1570, 119, 40, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:30:45', '2018-10-24 04:30:45'),
(1571, 93, 40, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:30:45', '2018-10-24 04:30:45'),
(1572, 118, 41, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:13', '2018-10-24 04:31:13'),
(1573, 74, 41, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:13', '2018-10-24 04:31:13'),
(1574, 107, 41, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:13', '2018-10-24 04:31:13'),
(1575, 110, 41, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:13', '2018-10-24 04:31:13'),
(1576, 94, 41, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:13', '2018-10-24 04:31:13'),
(1577, 119, 41, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:13', '2018-10-24 04:31:13'),
(1578, 93, 41, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:14', '2018-10-24 04:31:14'),
(1579, 118, 42, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:45', '2018-10-24 04:31:45'),
(1580, 74, 42, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:45', '2018-10-24 04:31:45'),
(1581, 107, 42, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:45', '2018-10-24 04:31:45'),
(1582, 110, 42, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:45', '2018-10-24 04:31:45'),
(1583, 94, 42, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:45', '2018-10-24 04:31:45'),
(1584, 119, 42, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:45', '2018-10-24 04:31:45'),
(1585, 93, 42, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-24 04:31:45', '2018-10-24 04:31:45'),
(1586, 146, 43, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:18', '2018-10-24 04:32:18'),
(1587, 144, 43, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:18', '2018-10-24 04:32:18'),
(1588, 98, 43, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:18', '2018-10-24 04:32:18'),
(1589, 142, 43, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:18', '2018-10-24 04:32:18'),
(1590, 146, 44, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:36', '2018-10-24 04:32:36'),
(1591, 144, 44, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:37', '2018-10-24 04:32:37'),
(1592, 98, 44, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:37', '2018-10-24 04:32:37'),
(1593, 142, 44, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:37', '2018-10-24 04:32:37'),
(1594, 146, 45, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:55', '2018-10-24 04:32:55'),
(1595, 144, 45, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:55', '2018-10-24 04:32:55'),
(1596, 98, 45, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:55', '2018-10-24 04:32:55'),
(1597, 142, 45, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-24 04:32:55', '2018-10-24 04:32:55'),
(1598, 132, 46, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(1599, 120, 46, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(1600, 91, 46, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(1601, 125, 46, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(1602, 99, 46, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(1603, 97, 46, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(1604, 105, 46, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(1605, 95, 46, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:33:44', '2018-10-24 04:33:44'),
(1606, 132, 47, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:03', '2018-10-24 04:34:03'),
(1607, 120, 47, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:03', '2018-10-24 04:34:03'),
(1608, 91, 47, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:03', '2018-10-24 04:34:03'),
(1609, 125, 47, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:03', '2018-10-24 04:34:03'),
(1610, 99, 47, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:03', '2018-10-24 04:34:03'),
(1611, 97, 47, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:03', '2018-10-24 04:34:03'),
(1612, 105, 47, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:04', '2018-10-24 04:34:04'),
(1613, 95, 47, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:04', '2018-10-24 04:34:04'),
(1614, 132, 48, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:28', '2018-10-24 04:34:28'),
(1615, 120, 48, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:28', '2018-10-24 04:34:28'),
(1616, 91, 48, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:28', '2018-10-24 04:34:28'),
(1617, 125, 48, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:29', '2018-10-24 04:34:29'),
(1618, 99, 48, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:29', '2018-10-24 04:34:29'),
(1619, 97, 48, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:29', '2018-10-24 04:34:29'),
(1620, 105, 48, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:29', '2018-10-24 04:34:29'),
(1621, 95, 48, 'true', 'Second Year', 9, 6, 7, 17, 'Active', '2018-10-24 04:34:29', '2018-10-24 04:34:29'),
(1622, 136, 49, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 04:35:05', '2018-10-24 04:35:05'),
(1623, 74, 49, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 04:35:05', '2018-10-24 04:35:05'),
(1624, 116, 49, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 04:35:05', '2018-10-24 04:35:05'),
(1625, 138, 49, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 04:35:05', '2018-10-24 04:35:05'),
(1626, 136, 51, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 04:36:10', '2018-10-24 04:36:10'),
(1627, 74, 51, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 04:36:10', '2018-10-24 04:36:10'),
(1628, 116, 51, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 04:36:10', '2018-10-24 04:36:10'),
(1629, 138, 51, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 04:36:10', '2018-10-24 04:36:10'),
(1630, 79, 52, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1631, 71, 52, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1632, 101, 52, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1633, 76, 52, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1634, 69, 52, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1635, 134, 52, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1636, 100, 52, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1637, 68, 52, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1638, 84, 52, 'false', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1639, 85, 52, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:36:49', '2018-10-24 04:36:49'),
(1640, 79, 53, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1641, 71, 53, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1642, 101, 53, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1643, 76, 53, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1644, 69, 53, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1645, 134, 53, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1646, 100, 53, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1647, 68, 53, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1648, 84, 53, 'false', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1649, 85, 53, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:24', '2018-10-24 04:37:24'),
(1650, 79, 54, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:59', '2018-10-24 04:37:59'),
(1651, 71, 54, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:59', '2018-10-24 04:37:59'),
(1652, 101, 54, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:59', '2018-10-24 04:37:59'),
(1653, 76, 54, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:59', '2018-10-24 04:37:59'),
(1654, 69, 54, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:59', '2018-10-24 04:37:59'),
(1655, 134, 54, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:37:59', '2018-10-24 04:37:59'),
(1656, 100, 54, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:38:00', '2018-10-24 04:38:00'),
(1657, 68, 54, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:38:00', '2018-10-24 04:38:00'),
(1658, 84, 54, 'true', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:38:00', '2018-10-24 04:38:00'),
(1659, 85, 54, 'false', 'First Year', 9, 6, 6, 17, 'Active', '2018-10-24 04:38:00', '2018-10-24 04:38:00'),
(1660, 76, 55, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:38:41', '2018-10-24 04:38:41'),
(1661, 69, 55, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:38:41', '2018-10-24 04:38:41'),
(1662, 134, 55, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:38:41', '2018-10-24 04:38:41'),
(1663, 79, 55, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:38:41', '2018-10-24 04:38:41'),
(1664, 71, 55, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:38:41', '2018-10-24 04:38:41'),
(1665, 84, 55, 'false', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:38:41', '2018-10-24 04:38:41'),
(1666, 85, 55, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:38:41', '2018-10-24 04:38:41'),
(1667, 76, 56, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:39:29', '2018-10-24 04:39:29'),
(1668, 69, 56, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:39:29', '2018-10-24 04:39:29'),
(1669, 134, 56, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:39:29', '2018-10-24 04:39:29'),
(1670, 79, 56, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:39:29', '2018-10-24 04:39:29'),
(1671, 71, 56, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:39:29', '2018-10-24 04:39:29'),
(1672, 84, 56, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:39:29', '2018-10-24 04:39:29'),
(1673, 85, 56, 'false', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:39:29', '2018-10-24 04:39:29'),
(1674, 76, 57, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:40:07', '2018-10-24 04:40:07'),
(1675, 69, 57, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:40:07', '2018-10-24 04:40:07'),
(1676, 134, 57, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:40:07', '2018-10-24 04:40:07'),
(1677, 79, 57, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:40:07', '2018-10-24 04:40:07'),
(1678, 71, 57, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:40:07', '2018-10-24 04:40:07'),
(1679, 84, 57, 'true', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:40:07', '2018-10-24 04:40:07'),
(1680, 85, 57, 'false', 'First Year', 9, 6, 9, 18, 'Active', '2018-10-24 04:40:07', '2018-10-24 04:40:07'),
(1681, 136, 50, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 05:03:02', '2018-10-24 05:03:02'),
(1682, 74, 50, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 05:03:02', '2018-10-24 05:03:02'),
(1683, 116, 50, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 05:03:02', '2018-10-24 05:03:02'),
(1684, 138, 50, 'true', 'Second Year', 9, 6, 12, 18, 'Active', '2018-10-24 05:03:02', '2018-10-24 05:03:02'),
(1685, 111, 40, 'true', 'Third Year', 10, 6, 10, 17, 'Active', '2018-10-24 05:13:44', '2018-10-24 05:13:44'),
(1686, 111, 41, 'true', 'Third Year', 10, 6, 10, 17, 'Active', '2018-10-24 05:14:00', '2018-10-24 05:14:00'),
(1687, 111, 42, 'true', 'Third Year', 10, 6, 10, 17, 'Active', '2018-10-24 05:14:18', '2018-10-24 05:14:18'),
(1688, 121, 58, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1689, 87, 58, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1690, 66, 58, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1691, 70, 58, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1692, 75, 58, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1693, 67, 58, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1694, 122, 58, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1695, 78, 58, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1696, 82, 58, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1697, 83, 58, 'false', 'First Year', 8, 7, 9, 17, 'Active', '2019-02-04 23:11:15', '2019-02-04 23:11:15'),
(1698, 78, 59, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1699, 121, 59, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1700, 87, 59, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1701, 66, 59, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1702, 70, 59, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1703, 75, 59, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1704, 67, 59, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1705, 122, 59, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1706, 82, 59, 'false', 'First Year', 8, 7, 9, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1707, 83, 59, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:12:08', '2019-02-04 23:12:08'),
(1708, 78, 60, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1709, 121, 60, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1710, 87, 60, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1711, 66, 60, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1712, 70, 60, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1713, 75, 60, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1714, 67, 60, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1715, 122, 60, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1716, 82, 60, 'true', 'First Year', 8, 7, 6, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1717, 83, 60, 'false', 'First Year', 8, 7, 9, 17, 'Active', '2019-02-04 23:13:47', '2019-02-04 23:13:47'),
(1718, 121, 61, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:27:46', '2019-02-04 23:27:46'),
(1719, 87, 61, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:27:46', '2019-02-04 23:27:46'),
(1720, 122, 61, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:27:46', '2019-02-04 23:27:46'),
(1721, 70, 61, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:27:46', '2019-02-04 23:27:46'),
(1722, 78, 61, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:27:46', '2019-02-04 23:27:46'),
(1723, 75, 61, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:27:46', '2019-02-04 23:27:46'),
(1724, 82, 61, 'false', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:27:46', '2019-02-04 23:27:46'),
(1725, 83, 61, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:27:46', '2019-02-04 23:27:46'),
(1726, 121, 62, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(1727, 87, 62, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(1728, 122, 62, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(1729, 70, 62, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(1730, 78, 62, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(1731, 75, 62, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(1732, 82, 62, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(1733, 83, 62, 'false', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:05', '2019-02-04 23:32:05'),
(1734, 121, 63, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:48', '2019-02-04 23:32:48'),
(1735, 87, 63, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:48', '2019-02-04 23:32:48'),
(1736, 122, 63, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:48', '2019-02-04 23:32:48'),
(1737, 70, 63, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:48', '2019-02-04 23:32:48'),
(1738, 78, 63, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:48', '2019-02-04 23:32:48'),
(1739, 75, 63, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:48', '2019-02-04 23:32:48'),
(1740, 82, 63, 'true', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:49', '2019-02-04 23:32:49'),
(1741, 83, 63, 'false', 'First Year', 8, 7, 9, 18, 'Active', '2019-02-04 23:32:49', '2019-02-04 23:32:49'),
(1742, 114, 40, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:33:52', '2019-02-04 23:33:52'),
(1743, 113, 40, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:33:52', '2019-02-04 23:33:52'),
(1744, 116, 40, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:33:52', '2019-02-04 23:33:52'),
(1745, 109, 40, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:33:52', '2019-02-04 23:33:52'),
(1746, 112, 40, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:33:52', '2019-02-04 23:33:52'),
(1747, 115, 40, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:33:52', '2019-02-04 23:33:52'),
(1748, 73, 40, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:33:52', '2019-02-04 23:33:52'),
(1749, 113, 41, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:18', '2019-02-04 23:34:18'),
(1750, 116, 41, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:18', '2019-02-04 23:34:18'),
(1751, 109, 41, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:18', '2019-02-04 23:34:18'),
(1752, 112, 41, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:18', '2019-02-04 23:34:18'),
(1753, 115, 41, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:18', '2019-02-04 23:34:18'),
(1754, 73, 41, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:18', '2019-02-04 23:34:18'),
(1755, 114, 41, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:18', '2019-02-04 23:34:18'),
(1756, 114, 42, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:47', '2019-02-04 23:34:47'),
(1757, 113, 42, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:47', '2019-02-04 23:34:47'),
(1758, 116, 42, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:47', '2019-02-04 23:34:47'),
(1759, 109, 42, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:47', '2019-02-04 23:34:47'),
(1760, 112, 42, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:47', '2019-02-04 23:34:47'),
(1761, 115, 42, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:47', '2019-02-04 23:34:47'),
(1762, 73, 42, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2019-02-04 23:34:47', '2019-02-04 23:34:47'),
(1763, 152, 43, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:25', '2019-02-04 23:35:25');
INSERT INTO `t_student_taken_curriculum_subject` (`Student_Taken_Curriculum_Subject_ID`, `Student_Taken_Curriculum_Subject_SubjectID`, `Student_Taken_Curriculum_Subject_StudentAccountID`, `Student_Taken_Curriculum_Subject_Taken_Status`, `Student_Taken_Curriculum_Subject_YearLevel`, `Student_Taken_Curriculum_Subject_SemesterID`, `Student_Taken_Curriculum_Subject_AcademicIYearID`, `Student_Taken_Curriculum_Subject_SectionID`, `Student_Taken_Curriculum_Subject_CourseID`, `Student_Taken_Curriculum_Subject_Display_Status`, `Student_Taken_Curriculum_Subject_Date_Added`, `Student_Taken_Curriculum_Subject_Date_Updated`) VALUES
(1764, 150, 43, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:25', '2019-02-04 23:35:25'),
(1765, 153, 43, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:25', '2019-02-04 23:35:25'),
(1766, 147, 43, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:25', '2019-02-04 23:35:25'),
(1767, 151, 43, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:25', '2019-02-04 23:35:25'),
(1768, 73, 43, 'true', 'Fourth Year', 8, 7, 11, 18, 'Active', '2019-02-04 23:35:25', '2019-02-04 23:35:25'),
(1769, 152, 44, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:49', '2019-02-04 23:35:49'),
(1770, 150, 44, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:49', '2019-02-04 23:35:49'),
(1771, 153, 44, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:49', '2019-02-04 23:35:49'),
(1772, 147, 44, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:49', '2019-02-04 23:35:49'),
(1773, 151, 44, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:35:49', '2019-02-04 23:35:49'),
(1774, 73, 44, 'true', 'Fourth Year', 8, 7, 11, 18, 'Active', '2019-02-04 23:35:49', '2019-02-04 23:35:49'),
(1775, 150, 45, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:36:20', '2019-02-04 23:36:20'),
(1776, 153, 45, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:36:20', '2019-02-04 23:36:20'),
(1777, 147, 45, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:36:20', '2019-02-04 23:36:20'),
(1778, 151, 45, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:36:20', '2019-02-04 23:36:20'),
(1779, 73, 45, 'true', 'Fourth Year', 8, 7, 11, 18, 'Active', '2019-02-04 23:36:20', '2019-02-04 23:36:20'),
(1780, 152, 45, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2019-02-04 23:36:20', '2019-02-04 23:36:20'),
(1781, 130, 46, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:36:53', '2019-02-04 23:36:53'),
(1782, 104, 46, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:36:53', '2019-02-04 23:36:53'),
(1783, 96, 46, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:36:53', '2019-02-04 23:36:53'),
(1784, 117, 46, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:36:53', '2019-02-04 23:36:53'),
(1785, 98, 46, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:36:53', '2019-02-04 23:36:53'),
(1786, 88, 46, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:36:54', '2019-02-04 23:36:54'),
(1787, 106, 46, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:36:54', '2019-02-04 23:36:54'),
(1788, 90, 46, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:36:54', '2019-02-04 23:36:54'),
(1789, 130, 47, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:24', '2019-02-04 23:37:24'),
(1790, 104, 47, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:24', '2019-02-04 23:37:24'),
(1791, 96, 47, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:24', '2019-02-04 23:37:24'),
(1792, 117, 47, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:24', '2019-02-04 23:37:24'),
(1793, 98, 47, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:24', '2019-02-04 23:37:24'),
(1794, 88, 47, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:24', '2019-02-04 23:37:24'),
(1795, 106, 47, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:24', '2019-02-04 23:37:24'),
(1796, 90, 47, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:24', '2019-02-04 23:37:24'),
(1797, 117, 48, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(1798, 98, 48, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(1799, 88, 48, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(1800, 106, 48, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(1801, 90, 48, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(1802, 130, 48, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(1803, 104, 48, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(1804, 96, 48, 'true', 'Third Year', 8, 7, 10, 17, 'Active', '2019-02-04 23:37:56', '2019-02-04 23:37:56'),
(1805, 145, 49, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:38:23', '2019-02-04 23:38:23'),
(1806, 139, 49, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:38:23', '2019-02-04 23:38:23'),
(1807, 140, 49, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:38:23', '2019-02-04 23:38:23'),
(1808, 141, 49, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:38:23', '2019-02-04 23:38:23'),
(1809, 145, 50, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:38:51', '2019-02-04 23:38:51'),
(1810, 139, 50, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:38:51', '2019-02-04 23:38:51'),
(1811, 140, 50, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:38:51', '2019-02-04 23:38:51'),
(1812, 141, 50, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:38:51', '2019-02-04 23:38:51'),
(1813, 141, 51, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:39:17', '2019-02-04 23:39:17'),
(1814, 145, 51, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:39:17', '2019-02-04 23:39:17'),
(1815, 139, 51, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:39:17', '2019-02-04 23:39:17'),
(1816, 140, 51, 'true', 'Third Year', 8, 7, 13, 18, 'Active', '2019-02-04 23:39:17', '2019-02-04 23:39:17'),
(1817, 92, 52, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(1818, 133, 52, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(1819, 103, 52, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(1820, 72, 52, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(1821, 131, 52, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(1822, 102, 52, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(1823, 89, 52, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(1824, 124, 52, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(1825, 77, 52, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:39:49', '2019-02-04 23:39:49'),
(1826, 124, 53, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:24', '2019-02-04 23:40:24'),
(1827, 77, 53, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:24', '2019-02-04 23:40:24'),
(1828, 92, 53, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:24', '2019-02-04 23:40:24'),
(1829, 133, 53, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:24', '2019-02-04 23:40:24'),
(1830, 103, 53, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:24', '2019-02-04 23:40:24'),
(1831, 72, 53, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:24', '2019-02-04 23:40:24'),
(1832, 131, 53, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:25', '2019-02-04 23:40:25'),
(1833, 102, 53, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:25', '2019-02-04 23:40:25'),
(1834, 89, 53, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:25', '2019-02-04 23:40:25'),
(1835, 124, 54, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:53', '2019-02-04 23:40:53'),
(1836, 77, 54, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:53', '2019-02-04 23:40:53'),
(1837, 92, 54, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:53', '2019-02-04 23:40:53'),
(1838, 133, 54, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:53', '2019-02-04 23:40:53'),
(1839, 103, 54, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:53', '2019-02-04 23:40:53'),
(1840, 72, 54, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:54', '2019-02-04 23:40:54'),
(1841, 131, 54, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:54', '2019-02-04 23:40:54'),
(1842, 102, 54, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:54', '2019-02-04 23:40:54'),
(1843, 89, 54, 'true', 'Second Year', 8, 7, 7, 17, 'Active', '2019-02-04 23:40:54', '2019-02-04 23:40:54'),
(1844, 137, 55, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:41:45', '2019-02-04 23:41:45'),
(1845, 99, 55, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:41:45', '2019-02-04 23:41:45'),
(1846, 66, 55, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:41:45', '2019-02-04 23:41:45'),
(1847, 124, 55, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:41:45', '2019-02-04 23:41:45'),
(1848, 77, 55, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:41:45', '2019-02-04 23:41:45'),
(1849, 135, 55, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:41:45', '2019-02-04 23:41:45'),
(1850, 137, 56, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:14', '2019-02-04 23:42:14'),
(1851, 99, 56, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:14', '2019-02-04 23:42:14'),
(1852, 66, 56, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:14', '2019-02-04 23:42:14'),
(1853, 124, 56, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:14', '2019-02-04 23:42:14'),
(1854, 77, 56, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:14', '2019-02-04 23:42:14'),
(1855, 135, 56, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:14', '2019-02-04 23:42:14'),
(1856, 137, 57, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:47', '2019-02-04 23:42:47'),
(1857, 99, 57, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:48', '2019-02-04 23:42:48'),
(1858, 66, 57, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:48', '2019-02-04 23:42:48'),
(1859, 124, 57, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:48', '2019-02-04 23:42:48'),
(1860, 77, 57, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:48', '2019-02-04 23:42:48'),
(1861, 135, 57, 'true', 'Second Year', 8, 7, 12, 18, 'Active', '2019-02-04 23:42:48', '2019-02-04 23:42:48'),
(1862, 105, 52, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:49:36', '2019-02-05 10:49:36'),
(1863, 95, 52, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:49:36', '2019-02-05 10:49:36'),
(1864, 132, 52, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:49:36', '2019-02-05 10:49:36'),
(1865, 120, 52, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:49:36', '2019-02-05 10:49:36'),
(1866, 91, 52, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:49:36', '2019-02-05 10:49:36'),
(1867, 125, 52, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:49:36', '2019-02-05 10:49:36'),
(1868, 99, 52, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:49:37', '2019-02-05 10:49:37'),
(1869, 97, 52, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:49:37', '2019-02-05 10:49:37'),
(1870, 105, 53, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:02', '2019-02-05 10:50:02'),
(1871, 95, 53, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:02', '2019-02-05 10:50:02'),
(1872, 132, 53, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:02', '2019-02-05 10:50:02'),
(1873, 120, 53, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:02', '2019-02-05 10:50:02'),
(1874, 91, 53, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:03', '2019-02-05 10:50:03'),
(1875, 125, 53, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:03', '2019-02-05 10:50:03'),
(1876, 99, 53, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:03', '2019-02-05 10:50:03'),
(1877, 97, 53, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:03', '2019-02-05 10:50:03'),
(1878, 132, 54, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(1879, 120, 54, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(1880, 91, 54, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(1881, 125, 54, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(1882, 99, 54, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(1883, 97, 54, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(1884, 105, 54, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(1885, 95, 54, 'true', 'Second Year', 9, 7, 7, 17, 'Active', '2019-02-05 10:50:31', '2019-02-05 10:50:31'),
(1886, 138, 55, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:50:53', '2019-02-05 10:50:53'),
(1887, 116, 55, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:50:53', '2019-02-05 10:50:53'),
(1888, 136, 55, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:50:53', '2019-02-05 10:50:53'),
(1889, 74, 55, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:50:53', '2019-02-05 10:50:53'),
(1890, 116, 56, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:51:13', '2019-02-05 10:51:13'),
(1891, 136, 56, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:51:13', '2019-02-05 10:51:13'),
(1892, 74, 56, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:51:13', '2019-02-05 10:51:13'),
(1893, 138, 56, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:51:13', '2019-02-05 10:51:13'),
(1894, 136, 57, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:51:32', '2019-02-05 10:51:32'),
(1895, 74, 57, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:51:32', '2019-02-05 10:51:32'),
(1896, 138, 57, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:51:32', '2019-02-05 10:51:32'),
(1897, 116, 57, 'true', 'Second Year', 9, 7, 12, 18, 'Active', '2019-02-05 10:51:32', '2019-02-05 10:51:32'),
(1898, 118, 46, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:08', '2019-02-05 10:52:08'),
(1899, 74, 46, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:08', '2019-02-05 10:52:08'),
(1900, 107, 46, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:08', '2019-02-05 10:52:08'),
(1901, 110, 46, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:08', '2019-02-05 10:52:08'),
(1902, 94, 46, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:08', '2019-02-05 10:52:08'),
(1903, 119, 46, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:08', '2019-02-05 10:52:08'),
(1904, 93, 46, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:08', '2019-02-05 10:52:08'),
(1905, 110, 47, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:31', '2019-02-05 10:52:31'),
(1906, 94, 47, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:31', '2019-02-05 10:52:31'),
(1907, 119, 47, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:31', '2019-02-05 10:52:31'),
(1908, 93, 47, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:31', '2019-02-05 10:52:31'),
(1909, 118, 47, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:31', '2019-02-05 10:52:31'),
(1910, 74, 47, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:31', '2019-02-05 10:52:31'),
(1911, 107, 47, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:31', '2019-02-05 10:52:31'),
(1912, 107, 48, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:51', '2019-02-05 10:52:51'),
(1913, 110, 48, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:51', '2019-02-05 10:52:51'),
(1914, 94, 48, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:51', '2019-02-05 10:52:51'),
(1915, 119, 48, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:51', '2019-02-05 10:52:51'),
(1916, 93, 48, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:51', '2019-02-05 10:52:51'),
(1917, 118, 48, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:51', '2019-02-05 10:52:51'),
(1918, 74, 48, 'true', 'Third Year', 9, 7, 10, 17, 'Active', '2019-02-05 10:52:51', '2019-02-05 10:52:51'),
(1919, 98, 49, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:13', '2019-02-05 10:53:13'),
(1920, 142, 49, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:13', '2019-02-05 10:53:13'),
(1921, 146, 49, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:13', '2019-02-05 10:53:13'),
(1922, 144, 49, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:13', '2019-02-05 10:53:13'),
(1923, 98, 50, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:37', '2019-02-05 10:53:37'),
(1924, 142, 50, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:37', '2019-02-05 10:53:37'),
(1925, 146, 50, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:38', '2019-02-05 10:53:38'),
(1926, 144, 50, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:38', '2019-02-05 10:53:38'),
(1927, 142, 51, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:59', '2019-02-05 10:53:59'),
(1928, 146, 51, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:59', '2019-02-05 10:53:59'),
(1929, 144, 51, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:59', '2019-02-05 10:53:59'),
(1930, 98, 51, 'true', 'Third Year', 9, 7, 13, 18, 'Active', '2019-02-05 10:53:59', '2019-02-05 10:53:59'),
(1931, 108, 40, 'true', 'Fourth Year', 9, 7, 11, 17, 'Active', '2019-02-05 10:55:19', '2019-02-05 10:55:19'),
(1932, 108, 41, 'true', 'Fourth Year', 9, 7, 11, 17, 'Active', '2019-02-05 10:55:35', '2019-02-05 10:55:35'),
(1933, 108, 42, 'true', 'Fourth Year', 9, 7, 11, 17, 'Active', '2019-02-05 10:55:50', '2019-02-05 10:55:50'),
(1934, 148, 43, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2019-02-05 10:56:09', '2019-02-05 10:56:09'),
(1935, 149, 43, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2019-02-05 10:56:09', '2019-02-05 10:56:09'),
(1936, 148, 44, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2019-02-05 10:56:25', '2019-02-05 10:56:25'),
(1937, 149, 44, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2019-02-05 10:56:25', '2019-02-05 10:56:25'),
(1938, 149, 45, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2019-02-05 10:56:41', '2019-02-05 10:56:41'),
(1939, 148, 45, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2019-02-05 10:56:41', '2019-02-05 10:56:41'),
(1940, 69, 58, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:32', '2019-02-05 11:32:32'),
(1941, 134, 58, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:32', '2019-02-05 11:32:32'),
(1942, 100, 58, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:32', '2019-02-05 11:32:32'),
(1943, 68, 58, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:32', '2019-02-05 11:32:32'),
(1944, 79, 58, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:32', '2019-02-05 11:32:32'),
(1945, 71, 58, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:32', '2019-02-05 11:32:32'),
(1946, 101, 58, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:32', '2019-02-05 11:32:32'),
(1947, 76, 58, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:33', '2019-02-05 11:32:33'),
(1948, 84, 58, 'false', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:33', '2019-02-05 11:32:33'),
(1949, 85, 58, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:32:33', '2019-02-05 11:32:33'),
(1950, 79, 59, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1951, 71, 59, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1952, 101, 59, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1953, 76, 59, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1954, 69, 59, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1955, 134, 59, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1956, 100, 59, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1957, 68, 59, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1958, 84, 59, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1959, 85, 59, 'false', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:09', '2019-02-05 11:33:09'),
(1960, 101, 60, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:44', '2019-02-05 11:33:44'),
(1961, 76, 60, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:44', '2019-02-05 11:33:44'),
(1962, 69, 60, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:44', '2019-02-05 11:33:44'),
(1963, 134, 60, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:44', '2019-02-05 11:33:44'),
(1964, 100, 60, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:44', '2019-02-05 11:33:44'),
(1965, 68, 60, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:44', '2019-02-05 11:33:44'),
(1966, 79, 60, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:44', '2019-02-05 11:33:44'),
(1967, 71, 60, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:45', '2019-02-05 11:33:45'),
(1968, 84, 60, 'false', 'First Year', 9, 7, 9, 17, 'Active', '2019-02-05 11:33:45', '2019-02-05 11:33:45'),
(1969, 85, 60, 'true', 'First Year', 9, 7, 6, 17, 'Active', '2019-02-05 11:33:45', '2019-02-05 11:33:45'),
(1970, 79, 61, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:34:34', '2019-02-05 11:34:34'),
(1971, 71, 61, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:34:34', '2019-02-05 11:34:34'),
(1972, 76, 61, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:34:34', '2019-02-05 11:34:34'),
(1973, 69, 61, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:34:34', '2019-02-05 11:34:34'),
(1974, 134, 61, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:34:34', '2019-02-05 11:34:34'),
(1975, 84, 61, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:34:34', '2019-02-05 11:34:34'),
(1976, 85, 61, 'false', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:34:34', '2019-02-05 11:34:34'),
(1977, 79, 62, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:36:20', '2019-02-05 11:36:20'),
(1978, 71, 62, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:36:21', '2019-02-05 11:36:21'),
(1979, 76, 62, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:36:21', '2019-02-05 11:36:21'),
(1980, 69, 62, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:36:21', '2019-02-05 11:36:21'),
(1981, 134, 62, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:36:21', '2019-02-05 11:36:21'),
(1982, 84, 62, 'false', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:36:21', '2019-02-05 11:36:21'),
(1983, 85, 62, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:36:21', '2019-02-05 11:36:21'),
(1984, 134, 63, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:37:03', '2019-02-05 11:37:03'),
(1985, 79, 63, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:37:03', '2019-02-05 11:37:03'),
(1986, 71, 63, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:37:04', '2019-02-05 11:37:04'),
(1987, 76, 63, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:37:04', '2019-02-05 11:37:04'),
(1988, 69, 63, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:37:04', '2019-02-05 11:37:04'),
(1989, 84, 63, 'false', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:37:04', '2019-02-05 11:37:04'),
(1990, 85, 63, 'true', 'First Year', 9, 7, 9, 18, 'Active', '2019-02-05 11:37:04', '2019-02-05 11:37:04'),
(1991, 111, 46, 'true', 'Third Year', 10, 7, 10, 17, 'Active', '2019-02-13 13:38:09', '2019-02-13 13:41:03'),
(1992, 111, 47, 'true', 'Third Year', 10, 7, 10, 17, 'Active', '2019-02-13 13:38:10', '2019-02-13 13:41:03'),
(1993, 111, 48, 'true', 'Third Year', 10, 7, 10, 17, 'Active', '2019-02-13 13:38:10', '2019-02-13 13:41:03'),
(1994, 75, 64, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(1995, 67, 64, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(1996, 122, 64, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(1997, 78, 64, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(1998, 121, 64, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(1999, 87, 64, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(2000, 66, 64, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(2001, 70, 64, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(2002, 82, 64, 'false', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:40', '2019-02-13 22:48:40'),
(2003, 83, 64, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:48:41', '2019-02-13 22:48:41'),
(2004, 75, 65, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2005, 67, 65, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2006, 122, 65, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2007, 78, 65, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2008, 121, 65, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2009, 87, 65, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2010, 66, 65, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2011, 70, 65, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2012, 82, 65, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2013, 83, 65, 'false', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:50:11', '2019-02-13 22:50:11'),
(2014, 75, 66, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(2015, 67, 66, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(2016, 122, 66, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(2017, 78, 66, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(2018, 121, 66, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(2019, 87, 66, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(2020, 66, 66, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(2021, 70, 66, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(2022, 82, 66, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2019-02-13 22:51:07', '2019-02-13 22:51:07'),
(2023, 83, 66, 'false', 'First Year', 8, 8, 9, 17, 'Active', '2019-02-13 22:51:08', '2019-02-13 22:51:08'),
(2024, 75, 67, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:11', '2019-02-13 22:52:11'),
(2025, 121, 67, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:11', '2019-02-13 22:52:11'),
(2026, 87, 67, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:11', '2019-02-13 22:52:11'),
(2027, 122, 67, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:11', '2019-02-13 22:52:11'),
(2028, 70, 67, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:11', '2019-02-13 22:52:11'),
(2029, 78, 67, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:11', '2019-02-13 22:52:11'),
(2030, 82, 67, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:11', '2019-02-13 22:52:11'),
(2031, 83, 67, 'false', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:11', '2019-02-13 22:52:11'),
(2032, 78, 68, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:46', '2019-02-13 22:52:46'),
(2033, 75, 68, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:46', '2019-02-13 22:52:46'),
(2034, 121, 68, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:46', '2019-02-13 22:52:46'),
(2035, 87, 68, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:46', '2019-02-13 22:52:46'),
(2036, 122, 68, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:46', '2019-02-13 22:52:46'),
(2037, 70, 68, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:46', '2019-02-13 22:52:46'),
(2038, 82, 68, 'false', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:46', '2019-02-13 22:52:46'),
(2039, 83, 68, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:52:46', '2019-02-13 22:52:46'),
(2040, 78, 69, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:53:17', '2019-02-13 22:53:17'),
(2041, 75, 69, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:53:17', '2019-02-13 22:53:17'),
(2042, 121, 69, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:53:17', '2019-02-13 22:53:17'),
(2043, 87, 69, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:53:17', '2019-02-13 22:53:17'),
(2044, 122, 69, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:53:17', '2019-02-13 22:53:17'),
(2045, 70, 69, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:53:18', '2019-02-13 22:53:18'),
(2046, 82, 69, 'false', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:53:18', '2019-02-13 22:53:18'),
(2047, 83, 69, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2019-02-13 22:53:18', '2019-02-13 22:53:18'),
(2048, 116, 46, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:09:58', '2019-02-13 23:09:58'),
(2049, 109, 46, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:09:59', '2019-02-13 23:09:59'),
(2050, 112, 46, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:09:59', '2019-02-13 23:09:59'),
(2051, 115, 46, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:09:59', '2019-02-13 23:09:59'),
(2052, 73, 46, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:09:59', '2019-02-13 23:09:59'),
(2053, 114, 46, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:09:59', '2019-02-13 23:09:59'),
(2054, 113, 46, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:09:59', '2019-02-13 23:09:59'),
(2055, 116, 47, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:10:49', '2019-02-13 23:10:49'),
(2056, 109, 47, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:10:49', '2019-02-13 23:10:49'),
(2057, 112, 47, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:10:49', '2019-02-13 23:10:49'),
(2058, 115, 47, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:10:49', '2019-02-13 23:10:49'),
(2059, 73, 47, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:10:49', '2019-02-13 23:10:49'),
(2060, 114, 47, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:10:49', '2019-02-13 23:10:49'),
(2061, 113, 47, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:10:49', '2019-02-13 23:10:49'),
(2062, 116, 48, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:11:10', '2019-02-13 23:11:10'),
(2063, 109, 48, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:11:10', '2019-02-13 23:11:10'),
(2064, 112, 48, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:11:10', '2019-02-13 23:11:10'),
(2065, 115, 48, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:11:10', '2019-02-13 23:11:10'),
(2066, 73, 48, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:11:10', '2019-02-13 23:11:10'),
(2067, 114, 48, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:11:10', '2019-02-13 23:11:10'),
(2068, 113, 48, 'true', 'Fourth Year', 8, 8, 11, 17, 'Active', '2019-02-13 23:11:10', '2019-02-13 23:11:10'),
(2069, 152, 49, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:11:47', '2019-02-13 23:11:47'),
(2070, 150, 49, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:11:47', '2019-02-13 23:11:47'),
(2071, 153, 49, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:11:47', '2019-02-13 23:11:47'),
(2072, 147, 49, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:11:47', '2019-02-13 23:11:47'),
(2073, 151, 49, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:11:47', '2019-02-13 23:11:47'),
(2074, 73, 49, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:11:47', '2019-02-13 23:11:47'),
(2075, 152, 50, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:12:15', '2019-02-13 23:12:15'),
(2076, 150, 50, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:12:15', '2019-02-13 23:12:15'),
(2077, 153, 50, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:12:15', '2019-02-13 23:12:15'),
(2078, 147, 50, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:12:15', '2019-02-13 23:12:15'),
(2079, 151, 50, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:12:15', '2019-02-13 23:12:15'),
(2080, 73, 50, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-13 23:12:15', '2019-02-13 23:12:15'),
(2081, 130, 52, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:12:44', '2019-02-13 23:12:44'),
(2082, 104, 52, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:12:44', '2019-02-13 23:12:44'),
(2083, 96, 52, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:12:44', '2019-02-13 23:12:44'),
(2084, 117, 52, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:12:44', '2019-02-13 23:12:44'),
(2085, 98, 52, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:12:44', '2019-02-13 23:12:44'),
(2086, 88, 52, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:12:44', '2019-02-13 23:12:44'),
(2087, 106, 52, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:12:44', '2019-02-13 23:12:44'),
(2088, 90, 52, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:12:44', '2019-02-13 23:12:44'),
(2089, 106, 53, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:17', '2019-02-13 23:13:17'),
(2090, 90, 53, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:17', '2019-02-13 23:13:17'),
(2091, 130, 53, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:17', '2019-02-13 23:13:17'),
(2092, 104, 53, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:17', '2019-02-13 23:13:17'),
(2093, 96, 53, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:17', '2019-02-13 23:13:17'),
(2094, 117, 53, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:17', '2019-02-13 23:13:17'),
(2095, 98, 53, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:17', '2019-02-13 23:13:17'),
(2096, 88, 53, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:17', '2019-02-13 23:13:17'),
(2097, 106, 54, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:44', '2019-02-13 23:13:44'),
(2098, 90, 54, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:44', '2019-02-13 23:13:44'),
(2099, 130, 54, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:44', '2019-02-13 23:13:44'),
(2100, 104, 54, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:44', '2019-02-13 23:13:44'),
(2101, 96, 54, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:44', '2019-02-13 23:13:44'),
(2102, 117, 54, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:44', '2019-02-13 23:13:44'),
(2103, 98, 54, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:44', '2019-02-13 23:13:44'),
(2104, 88, 54, 'true', 'Third Year', 8, 8, 10, 17, 'Active', '2019-02-13 23:13:44', '2019-02-13 23:13:44'),
(2105, 141, 55, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:07', '2019-02-13 23:14:07'),
(2106, 145, 55, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:08', '2019-02-13 23:14:08'),
(2107, 139, 55, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:08', '2019-02-13 23:14:08'),
(2108, 140, 55, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:08', '2019-02-13 23:14:08'),
(2109, 141, 56, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:27', '2019-02-13 23:14:27'),
(2110, 145, 56, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:27', '2019-02-13 23:14:27'),
(2111, 139, 56, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:27', '2019-02-13 23:14:27'),
(2112, 140, 56, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:27', '2019-02-13 23:14:27'),
(2113, 141, 57, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:49', '2019-02-13 23:14:49'),
(2114, 145, 57, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:49', '2019-02-13 23:14:49'),
(2115, 139, 57, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:49', '2019-02-13 23:14:49'),
(2116, 140, 57, 'true', 'Third Year', 8, 8, 13, 18, 'Active', '2019-02-13 23:14:49', '2019-02-13 23:14:49'),
(2117, 103, 58, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:15:39', '2019-02-13 23:15:39'),
(2118, 72, 58, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:15:39', '2019-02-13 23:15:39'),
(2119, 131, 58, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:15:39', '2019-02-13 23:15:39'),
(2120, 102, 58, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:15:39', '2019-02-13 23:15:39'),
(2121, 89, 58, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:15:40', '2019-02-13 23:15:40'),
(2122, 124, 58, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:15:40', '2019-02-13 23:15:40'),
(2123, 77, 58, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:15:40', '2019-02-13 23:15:40'),
(2124, 92, 58, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:15:40', '2019-02-13 23:15:40'),
(2125, 133, 58, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:15:40', '2019-02-13 23:15:40'),
(2126, 72, 59, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:05', '2019-02-13 23:16:05'),
(2127, 131, 59, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:05', '2019-02-13 23:16:05'),
(2128, 102, 59, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:05', '2019-02-13 23:16:05'),
(2129, 89, 59, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:05', '2019-02-13 23:16:05'),
(2130, 124, 59, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:05', '2019-02-13 23:16:05'),
(2131, 77, 59, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:05', '2019-02-13 23:16:05'),
(2132, 92, 59, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:05', '2019-02-13 23:16:05'),
(2133, 133, 59, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:06', '2019-02-13 23:16:06'),
(2134, 103, 59, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:06', '2019-02-13 23:16:06'),
(2135, 131, 60, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(2136, 102, 60, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(2137, 89, 60, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(2138, 124, 60, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(2139, 77, 60, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(2140, 92, 60, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(2141, 133, 60, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(2142, 103, 60, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(2143, 72, 60, 'true', 'Second Year', 8, 8, 7, 17, 'Active', '2019-02-13 23:16:37', '2019-02-13 23:16:37'),
(2144, 137, 61, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:10', '2019-02-13 23:17:10'),
(2145, 99, 61, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:10', '2019-02-13 23:17:10'),
(2146, 66, 61, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:10', '2019-02-13 23:17:10'),
(2147, 124, 61, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:10', '2019-02-13 23:17:10'),
(2148, 77, 61, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:10', '2019-02-13 23:17:10'),
(2149, 135, 61, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:10', '2019-02-13 23:17:10'),
(2150, 66, 62, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:43', '2019-02-13 23:17:43'),
(2151, 124, 62, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:43', '2019-02-13 23:17:43'),
(2152, 77, 62, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:43', '2019-02-13 23:17:43'),
(2153, 135, 62, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:43', '2019-02-13 23:17:43'),
(2154, 137, 62, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:43', '2019-02-13 23:17:43'),
(2155, 99, 62, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:17:43', '2019-02-13 23:17:43'),
(2156, 66, 63, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:18:09', '2019-02-13 23:18:09'),
(2157, 124, 63, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:18:09', '2019-02-13 23:18:09'),
(2158, 77, 63, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:18:09', '2019-02-13 23:18:09'),
(2159, 135, 63, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:18:09', '2019-02-13 23:18:09'),
(2160, 137, 63, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:18:09', '2019-02-13 23:18:09'),
(2161, 99, 63, 'true', 'Second Year', 8, 8, 12, 18, 'Active', '2019-02-13 23:18:09', '2019-02-13 23:18:09'),
(2162, 151, 51, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-14 14:17:00', '2019-02-14 14:17:00'),
(2163, 73, 51, 'true', 'Fourth Year', 8, 8, 11, 18, 'Active', '2019-02-14 14:17:00', '2019-02-14 14:17:00'),
(2164, 152, 51, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-14 14:17:00', '2019-02-14 14:17:00'),
(2165, 150, 51, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-14 14:17:00', '2019-02-14 14:17:00'),
(2166, 153, 51, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-14 14:17:00', '2019-02-14 14:17:00'),
(2167, 147, 51, 'true', 'Fourth Year', 8, 8, 14, 18, 'Active', '2019-02-14 14:17:00', '2019-02-14 14:17:00'),
(2168, 108, 46, 'true', 'Fourth Year', 9, 8, 11, 17, 'Active', '2019-02-14 14:50:01', '2019-02-14 14:50:01'),
(2169, 108, 47, 'true', 'Fourth Year', 9, 8, 11, 17, 'Active', '2019-02-14 14:50:21', '2019-02-14 14:50:21'),
(2170, 108, 48, 'true', 'Fourth Year', 9, 8, 11, 17, 'Active', '2019-02-14 14:50:36', '2019-02-14 14:50:36'),
(2171, 148, 49, 'false', 'Fourth Year', 9, 8, 14, 18, 'Active', '2019-02-14 14:51:20', '2019-03-26 14:18:31'),
(2172, 149, 49, 'true', 'Fourth Year', 9, 8, 14, 18, 'Active', '2019-02-14 14:51:20', '2019-02-14 14:51:20'),
(2173, 148, 50, 'true', 'Fourth Year', 9, 8, 14, 18, 'Active', '2019-02-14 14:51:48', '2019-02-14 14:51:48'),
(2174, 149, 50, 'true', 'Fourth Year', 9, 8, 14, 18, 'Active', '2019-02-14 14:51:48', '2019-02-14 14:51:48'),
(2175, 148, 51, 'true', 'Fourth Year', 9, 8, 14, 18, 'Active', '2019-02-14 14:52:04', '2019-02-14 14:52:04'),
(2176, 149, 51, 'true', 'Fourth Year', 9, 8, 14, 18, 'Active', '2019-02-14 14:52:04', '2019-02-14 14:52:04'),
(2177, 118, 52, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:30', '2019-02-14 14:52:30'),
(2178, 74, 52, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:30', '2019-02-14 14:52:30'),
(2179, 107, 52, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:30', '2019-02-14 14:52:30'),
(2180, 110, 52, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:30', '2019-02-14 14:52:30'),
(2181, 94, 52, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:30', '2019-02-14 14:52:30'),
(2182, 119, 52, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:30', '2019-02-14 14:52:30'),
(2183, 93, 52, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:30', '2019-02-14 14:52:30'),
(2184, 118, 53, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:51', '2019-02-14 14:52:51'),
(2185, 74, 53, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:51', '2019-02-14 14:52:51'),
(2186, 107, 53, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:51', '2019-02-14 14:52:51'),
(2187, 110, 53, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:51', '2019-02-14 14:52:51'),
(2188, 94, 53, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:51', '2019-02-14 14:52:51'),
(2189, 119, 53, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:51', '2019-02-14 14:52:51'),
(2190, 93, 53, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:52:51', '2019-02-14 14:52:51'),
(2191, 118, 54, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:53:11', '2019-02-14 14:53:11'),
(2192, 74, 54, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:53:11', '2019-02-14 14:53:11'),
(2193, 107, 54, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:53:11', '2019-02-14 14:53:11'),
(2194, 110, 54, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:53:11', '2019-02-14 14:53:11'),
(2195, 94, 54, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:53:11', '2019-02-14 14:53:11'),
(2196, 119, 54, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:53:11', '2019-02-14 14:53:11'),
(2197, 93, 54, 'true', 'Third Year', 9, 8, 10, 17, 'Active', '2019-02-14 14:53:11', '2019-02-14 14:53:11'),
(2198, 146, 55, 'false', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:53:31', '2019-03-26 14:18:53'),
(2199, 144, 55, 'false', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:53:31', '2019-03-26 14:19:24'),
(2200, 98, 55, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:53:31', '2019-02-14 14:53:31'),
(2201, 142, 55, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:53:31', '2019-02-14 14:53:31'),
(2202, 98, 56, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:53:47', '2019-02-14 14:53:47'),
(2203, 142, 56, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:53:47', '2019-02-14 14:53:47'),
(2204, 146, 56, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:53:47', '2019-02-14 14:53:47'),
(2205, 144, 56, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:53:47', '2019-02-14 14:53:47'),
(2206, 142, 57, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:54:10', '2019-02-14 14:54:10'),
(2207, 146, 57, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:54:10', '2019-02-14 14:54:10'),
(2208, 144, 57, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:54:10', '2019-02-14 14:54:10'),
(2209, 98, 57, 'true', 'Third Year', 9, 8, 13, 18, 'Active', '2019-02-14 14:54:11', '2019-02-14 14:54:11'),
(2210, 132, 58, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:54:35', '2019-02-14 14:54:35'),
(2211, 120, 58, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:54:35', '2019-02-14 14:54:35'),
(2212, 91, 58, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:54:35', '2019-02-14 14:54:35'),
(2213, 125, 58, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:54:35', '2019-02-14 14:54:35'),
(2214, 99, 58, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:54:35', '2019-02-14 14:54:35'),
(2215, 97, 58, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:54:36', '2019-02-14 14:54:36'),
(2216, 105, 58, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:54:36', '2019-02-14 14:54:36'),
(2217, 95, 58, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:54:36', '2019-02-14 14:54:36'),
(2218, 132, 59, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:10', '2019-02-14 14:55:10'),
(2219, 120, 59, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:10', '2019-02-14 14:55:10'),
(2220, 91, 59, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:10', '2019-02-14 14:55:10'),
(2221, 125, 59, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:10', '2019-02-14 14:55:10'),
(2222, 99, 59, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:10', '2019-02-14 14:55:10'),
(2223, 97, 59, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:10', '2019-02-14 14:55:10'),
(2224, 105, 59, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:10', '2019-02-14 14:55:10'),
(2225, 95, 59, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:10', '2019-02-14 14:55:10'),
(2226, 125, 60, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:29', '2019-02-14 14:55:29');
INSERT INTO `t_student_taken_curriculum_subject` (`Student_Taken_Curriculum_Subject_ID`, `Student_Taken_Curriculum_Subject_SubjectID`, `Student_Taken_Curriculum_Subject_StudentAccountID`, `Student_Taken_Curriculum_Subject_Taken_Status`, `Student_Taken_Curriculum_Subject_YearLevel`, `Student_Taken_Curriculum_Subject_SemesterID`, `Student_Taken_Curriculum_Subject_AcademicIYearID`, `Student_Taken_Curriculum_Subject_SectionID`, `Student_Taken_Curriculum_Subject_CourseID`, `Student_Taken_Curriculum_Subject_Display_Status`, `Student_Taken_Curriculum_Subject_Date_Added`, `Student_Taken_Curriculum_Subject_Date_Updated`) VALUES
(2227, 99, 60, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:29', '2019-02-14 14:55:29'),
(2228, 97, 60, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:29', '2019-02-14 14:55:29'),
(2229, 105, 60, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:29', '2019-02-14 14:55:29'),
(2230, 95, 60, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:29', '2019-02-14 14:55:29'),
(2231, 132, 60, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:29', '2019-02-14 14:55:29'),
(2232, 120, 60, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:29', '2019-02-14 14:55:29'),
(2233, 91, 60, 'true', 'Second Year', 9, 8, 7, 17, 'Active', '2019-02-14 14:55:30', '2019-02-14 14:55:30'),
(2234, 116, 61, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:55:57', '2019-02-14 14:55:57'),
(2235, 136, 61, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:55:57', '2019-02-14 14:55:57'),
(2236, 74, 61, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:55:57', '2019-02-14 14:55:57'),
(2237, 138, 61, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:55:57', '2019-02-14 14:55:57'),
(2238, 74, 62, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:56:22', '2019-02-14 14:56:22'),
(2239, 138, 62, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:56:22', '2019-02-14 14:56:22'),
(2240, 116, 62, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:56:22', '2019-02-14 14:56:22'),
(2241, 136, 62, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:56:22', '2019-02-14 14:56:22'),
(2242, 116, 63, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:56:55', '2019-02-14 14:56:55'),
(2243, 136, 63, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:56:55', '2019-02-14 14:56:55'),
(2244, 74, 63, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:56:55', '2019-02-14 14:56:55'),
(2245, 138, 63, 'true', 'Second Year', 9, 8, 12, 18, 'Active', '2019-02-14 14:56:55', '2019-02-14 14:56:55'),
(2246, 79, 64, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2247, 71, 64, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2248, 101, 64, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2249, 76, 64, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2250, 69, 64, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2251, 134, 64, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2252, 100, 64, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2253, 68, 64, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2254, 84, 64, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2255, 85, 64, 'false', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:57:32', '2019-02-14 14:57:32'),
(2256, 79, 65, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:00', '2019-02-14 14:58:00'),
(2257, 71, 65, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:00', '2019-02-14 14:58:00'),
(2258, 101, 65, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:00', '2019-02-14 14:58:00'),
(2259, 76, 65, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:00', '2019-02-14 14:58:00'),
(2260, 69, 65, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:01', '2019-02-14 14:58:01'),
(2261, 134, 65, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:01', '2019-02-14 14:58:01'),
(2262, 100, 65, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:01', '2019-02-14 14:58:01'),
(2263, 68, 65, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:01', '2019-02-14 14:58:01'),
(2264, 84, 65, 'false', 'First Year', 9, 8, 9, 17, 'Active', '2019-02-14 14:58:01', '2019-02-14 14:58:01'),
(2265, 85, 65, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:01', '2019-02-14 14:58:01'),
(2266, 79, 66, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:32', '2019-02-14 14:58:32'),
(2267, 71, 66, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:32', '2019-02-14 14:58:32'),
(2268, 101, 66, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:32', '2019-02-14 14:58:32'),
(2269, 76, 66, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:32', '2019-02-14 14:58:32'),
(2270, 69, 66, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:32', '2019-02-14 14:58:32'),
(2271, 134, 66, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:32', '2019-02-14 14:58:32'),
(2272, 100, 66, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:33', '2019-02-14 14:58:33'),
(2273, 68, 66, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:33', '2019-02-14 14:58:33'),
(2274, 84, 66, 'false', 'First Year', 9, 8, 9, 17, 'Active', '2019-02-14 14:58:33', '2019-02-14 14:58:33'),
(2275, 85, 66, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2019-02-14 14:58:33', '2019-02-14 14:58:33'),
(2276, 79, 67, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:14', '2019-02-14 14:59:14'),
(2277, 71, 67, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:15', '2019-02-14 14:59:15'),
(2278, 76, 67, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:15', '2019-02-14 14:59:15'),
(2279, 69, 67, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:15', '2019-02-14 14:59:15'),
(2280, 134, 67, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:15', '2019-02-14 14:59:15'),
(2281, 84, 67, 'false', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:15', '2019-02-14 14:59:15'),
(2282, 85, 67, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:15', '2019-02-14 14:59:15'),
(2283, 79, 68, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:42', '2019-02-14 14:59:42'),
(2284, 71, 68, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:43', '2019-02-14 14:59:43'),
(2285, 76, 68, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:43', '2019-02-14 14:59:43'),
(2286, 69, 68, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:43', '2019-02-14 14:59:43'),
(2287, 134, 68, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:43', '2019-02-14 14:59:43'),
(2288, 84, 68, 'false', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:43', '2019-02-14 14:59:43'),
(2289, 85, 68, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 14:59:43', '2019-02-14 14:59:43'),
(2290, 134, 69, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 15:00:24', '2019-02-14 15:00:24'),
(2291, 79, 69, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 15:00:24', '2019-02-14 15:00:24'),
(2292, 71, 69, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 15:00:24', '2019-02-14 15:00:24'),
(2293, 76, 69, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 15:00:24', '2019-02-14 15:00:24'),
(2294, 69, 69, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 15:00:24', '2019-02-14 15:00:24'),
(2295, 84, 69, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 15:00:24', '2019-02-14 15:00:24'),
(2296, 85, 69, 'false', 'First Year', 9, 8, 9, 18, 'Active', '2019-02-14 15:00:24', '2019-02-14 15:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `t_summer_class`
--

CREATE TABLE `t_summer_class` (
  `Summer_Class_ID` int(11) NOT NULL,
  `Summer_Class_Code` varchar(100) NOT NULL,
  `Summer_Class_Academic_Year` int(11) NOT NULL,
  `Summer_Class_CampusID` int(11) NOT NULL,
  `Summer_Class_Subject_ID` int(11) NOT NULL,
  `Summer_Class_ProfessorID` int(11) NOT NULL,
  `Summer_Class_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Summer_Class_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Summer_Class_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_summer_class`
--

INSERT INTO `t_summer_class` (`Summer_Class_ID`, `Summer_Class_Code`, `Summer_Class_Academic_Year`, `Summer_Class_CampusID`, `Summer_Class_Subject_ID`, `Summer_Class_ProfessorID`, `Summer_Class_Display_Status`, `Summer_Class_Date_Added`, `Summer_Class_Date_Updated`) VALUES
(1, '2019-IT-ELEC2-00001-CM', 7, 2, 111, 18, 'Active', '2019-02-13 13:38:09', '2019-02-13 13:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `t_summer_class_schedule`
--

CREATE TABLE `t_summer_class_schedule` (
  `Summer_Class_Schedule_ID` int(11) NOT NULL,
  `Summer_Class_Schedule_SummerClassID` int(11) NOT NULL,
  `Summer_Class_Schedule_RoomID` int(11) DEFAULT NULL,
  `Summer_Class_Schedule_Time_Start` time NOT NULL,
  `Summer_Class_Schedule_Time_End` time NOT NULL,
  `Summer_Class_Schedule_Day` enum('M','T','W','TH','F','S','SU') NOT NULL,
  `Summer_Class_Schedule_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Summer_Class_Schedule_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Summer_Class_Schedule_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_summer_class_schedule`
--

INSERT INTO `t_summer_class_schedule` (`Summer_Class_Schedule_ID`, `Summer_Class_Schedule_SummerClassID`, `Summer_Class_Schedule_RoomID`, `Summer_Class_Schedule_Time_Start`, `Summer_Class_Schedule_Time_End`, `Summer_Class_Schedule_Day`, `Summer_Class_Schedule_Date_Added`, `Summer_Class_Schedule_Date_Updated`, `Summer_Class_Schedule_Display_Status`) VALUES
(1, 1, 1, '07:30:00', '10:30:00', 'W', '2019-02-13 13:38:10', '2019-02-13 13:41:03', 'Inactive'),
(2, 1, 1, '07:30:00', '10:30:00', 'W', '2019-02-13 13:41:03', '2019-02-13 13:41:03', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `t_summer_class_student`
--

CREATE TABLE `t_summer_class_student` (
  `Summer_Class_Student_ID` int(11) NOT NULL,
  `Summer_Class_Student_SummerClassID` int(11) NOT NULL,
  `Summer_Class_Student_StudentAccountID` int(11) NOT NULL,
  `Summer_Class_Student_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Summer_Class_Student_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Summer_Class_Student_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_summer_class_student`
--

INSERT INTO `t_summer_class_student` (`Summer_Class_Student_ID`, `Summer_Class_Student_SummerClassID`, `Summer_Class_Student_StudentAccountID`, `Summer_Class_Student_Display_Status`, `Summer_Class_Student_Date_Added`, `Summer_Class_Student_Date_Updated`) VALUES
(1, 1, 46, 'Active', '2019-02-13 13:38:09', '2019-02-13 13:41:03'),
(2, 1, 47, 'Active', '2019-02-13 13:38:09', '2019-02-13 13:41:03'),
(3, 1, 48, 'Active', '2019-02-13 13:38:10', '2019-02-13 13:41:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `r_academic_year`
--
ALTER TABLE `r_academic_year`
  ADD PRIMARY KEY (`Academic_Year_ID`);

--
-- Indexes for table `r_admin`
--
ALTER TABLE `r_admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `r_awards`
--
ALTER TABLE `r_awards`
  ADD PRIMARY KEY (`Awards_ID`);

--
-- Indexes for table `r_campus`
--
ALTER TABLE `r_campus`
  ADD PRIMARY KEY (`Campus_ID`);

--
-- Indexes for table `r_campus_course`
--
ALTER TABLE `r_campus_course`
  ADD PRIMARY KEY (`Campus_Course_ID`),
  ADD KEY `Campus_Course_CourseID` (`Campus_Course_CourseID`),
  ADD KEY `Campus_Course_CampusID` (`Campus_Course_CampusID`);

--
-- Indexes for table `r_cashier`
--
ALTER TABLE `r_cashier`
  ADD PRIMARY KEY (`Cashier_ID`);

--
-- Indexes for table `r_course`
--
ALTER TABLE `r_course`
  ADD PRIMARY KEY (`Course_ID`);

--
-- Indexes for table `r_course_fee`
--
ALTER TABLE `r_course_fee`
  ADD PRIMARY KEY (`Course_Fee_ID`),
  ADD KEY `Course_Fee_CourseID` (`Course_Fee_CourseID`),
  ADD KEY `Course_Fee_AcademicYearID` (`Course_Fee_AcademicYearID`);

--
-- Indexes for table `r_course_fee_items`
--
ALTER TABLE `r_course_fee_items`
  ADD PRIMARY KEY (`Course_Fee_Item_ID`),
  ADD KEY `Course_Fee_Item_CourseFeeID` (`Course_Fee_Item_CourseFeeID`),
  ADD KEY `Course_Fee_Item_FeeID` (`Course_Fee_Item_FeeID`);

--
-- Indexes for table `r_curriculum`
--
ALTER TABLE `r_curriculum`
  ADD PRIMARY KEY (`Curriculum_ID`),
  ADD KEY `Curriculum_SemesterID` (`Curriculum_SemesterID`),
  ADD KEY `Curriculum_CourseID` (`Curriculum_CourseID`),
  ADD KEY `Curriculum_CurriculumYearID` (`Curriculum_CurriculumYearID`);

--
-- Indexes for table `r_curriculumitem`
--
ALTER TABLE `r_curriculumitem`
  ADD PRIMARY KEY (`CurriculumItem_ID`),
  ADD KEY `FK_CurriculumItem_CurriculumID` (`CurriculumItem_CurriculumID`),
  ADD KEY `FK_CurriculumItem_SubjectID` (`CurriculumItem_SubjectID`);

--
-- Indexes for table `r_curriculumyear`
--
ALTER TABLE `r_curriculumyear`
  ADD PRIMARY KEY (`CurriculumYear_ID`);

--
-- Indexes for table `r_degree`
--
ALTER TABLE `r_degree`
  ADD PRIMARY KEY (`Degree_ID`);

--
-- Indexes for table `r_documents`
--
ALTER TABLE `r_documents`
  ADD PRIMARY KEY (`Documents_ID`);

--
-- Indexes for table `r_educational_attainment`
--
ALTER TABLE `r_educational_attainment`
  ADD PRIMARY KEY (`Educational_Attainment_ID`),
  ADD KEY `Educational_Attainment_StudentAccountID` (`Educational_Attainment_StudentAccountID`);

--
-- Indexes for table `r_faculty_degree`
--
ALTER TABLE `r_faculty_degree`
  ADD PRIMARY KEY (`Faculty_Degree_ID`),
  ADD KEY `Faculty_Degree_DegreeID` (`Faculty_Degree_DegreeID`),
  ADD KEY `Faculty_Degree_ProfessorID` (`Faculty_Degree_ProfessorID`);

--
-- Indexes for table `r_faculty_subject`
--
ALTER TABLE `r_faculty_subject`
  ADD PRIMARY KEY (`Faculty_Subject_ID`),
  ADD KEY `Faculty_Subject_SubjectID` (`Faculty_Subject_SubjectID`),
  ADD KEY `Faculty_Subject_ProfessorID` (`Faculty_Subject_ProfessorID`);

--
-- Indexes for table `r_fee`
--
ALTER TABLE `r_fee`
  ADD PRIMARY KEY (`Fee_ID`);

--
-- Indexes for table `r_grade_opening`
--
ALTER TABLE `r_grade_opening`
  ADD PRIMARY KEY (`Grade_Opening_ID`);

--
-- Indexes for table `r_mandatory_fee`
--
ALTER TABLE `r_mandatory_fee`
  ADD PRIMARY KEY (`Mandatory_Fee_ID`),
  ADD KEY `Mandatory_Fee_FeeID` (`Mandatory_Fee_FeeID`),
  ADD KEY `Mandatory_Fee_AcademicYearID` (`Mandatory_Fee_AcademicYearID`);

--
-- Indexes for table `r_prerequisite`
--
ALTER TABLE `r_prerequisite`
  ADD PRIMARY KEY (`Prerequisite_ID`),
  ADD KEY `Prerequisite_Main_SubjectID` (`Prerequisite_Main_SubjectID`),
  ADD KEY `Prerequisite_Prequisite_SubjectID` (`Prerequisite_Prequisite_SubjectID`);

--
-- Indexes for table `r_professor`
--
ALTER TABLE `r_professor`
  ADD PRIMARY KEY (`Professor_ID`);

--
-- Indexes for table `r_registation_opening`
--
ALTER TABLE `r_registation_opening`
  ADD PRIMARY KEY (`Registation_Opening_ID`),
  ADD KEY `Registation_Opening_CourseID` (`Registation_Opening_CourseID`);

--
-- Indexes for table `r_registrar`
--
ALTER TABLE `r_registrar`
  ADD PRIMARY KEY (`Registrar_ID`);

--
-- Indexes for table `r_room`
--
ALTER TABLE `r_room`
  ADD PRIMARY KEY (`Room_ID`),
  ADD KEY `Room_CampusID` (`Room_CampusID`);

--
-- Indexes for table `r_scholarship`
--
ALTER TABLE `r_scholarship`
  ADD PRIMARY KEY (`Scholarship_ID`),
  ADD UNIQUE KEY `Scholarship_Code` (`Scholarship_Code`);

--
-- Indexes for table `r_school_guard`
--
ALTER TABLE `r_school_guard`
  ADD PRIMARY KEY (`School_Guard_ID`);

--
-- Indexes for table `r_section`
--
ALTER TABLE `r_section`
  ADD PRIMARY KEY (`Section_ID`),
  ADD KEY `Section_CourseID` (`Section_CourseID`),
  ADD KEY `Section_CampusID` (`Section_CampusID`);

--
-- Indexes for table `r_semester`
--
ALTER TABLE `r_semester`
  ADD PRIMARY KEY (`Semester_ID`);

--
-- Indexes for table `r_student_application`
--
ALTER TABLE `r_student_application`
  ADD PRIMARY KEY (`Student_Application_ID`),
  ADD KEY `Student_Application_StudentProfileID` (`Student_Application_StudentProfileID`);

--
-- Indexes for table `r_student_document`
--
ALTER TABLE `r_student_document`
  ADD PRIMARY KEY (`Student_Document_ID`),
  ADD KEY `Student_Document_StudentApplicationID` (`Student_Document_StudentApplicationID`),
  ADD KEY `Student_Document_DocumentID` (`Student_Document_DocumentID`);

--
-- Indexes for table `r_student_profile`
--
ALTER TABLE `r_student_profile`
  ADD PRIMARY KEY (`Student_Profile_ID`);

--
-- Indexes for table `r_subject`
--
ALTER TABLE `r_subject`
  ADD PRIMARY KEY (`Subject_ID`);

--
-- Indexes for table `r_subject_fee`
--
ALTER TABLE `r_subject_fee`
  ADD PRIMARY KEY (`Subject_Fee_ID`),
  ADD KEY `Subject_Fee_AcademicYearID` (`Subject_Fee_AcademicYearID`),
  ADD KEY `Subject_Fee_SubjectID` (`Subject_Fee_SubjectID`);

--
-- Indexes for table `r_subject_fee_items`
--
ALTER TABLE `r_subject_fee_items`
  ADD PRIMARY KEY (`Subject_Fee_Items_ID`),
  ADD KEY `Subject_Fee_Items_FeeID` (`Subject_Fee_Items_FeeID`),
  ADD KEY `Subject_Fee_Items_SubjectFeeID` (`Subject_Fee_Items_SubjectFeeID`);

--
-- Indexes for table `r_tuition_fee`
--
ALTER TABLE `r_tuition_fee`
  ADD PRIMARY KEY (`Tuition_Fee_ID`),
  ADD KEY `Tuition_Fee_AcademicYearID` (`Tuition_Fee_AcademicYearID`),
  ADD KEY `Tuition_Fee_CourseID` (`Tuition_Fee_CourseID`);

--
-- Indexes for table `r_unit_fee`
--
ALTER TABLE `r_unit_fee`
  ADD PRIMARY KEY (`Unit_Fee_ID`);

--
-- Indexes for table `r_user_account`
--
ALTER TABLE `r_user_account`
  ADD PRIMARY KEY (`User_Account_ID`);

--
-- Indexes for table `t_announcement`
--
ALTER TABLE `t_announcement`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `t_assign_section_fee_item`
--
ALTER TABLE `t_assign_section_fee_item`
  ADD PRIMARY KEY (`Assign_Section_Fee_Item_ID`),
  ADD KEY `Assign_Curriculum_Fee_Item_Fee_ID` (`Assign_Section_Fee_Item_Fee_ID`),
  ADD KEY `Assign_Curriculum_Fee_Item_Curriculum_ID` (`Assign_Section_Fee_Item_Section_ID`);

--
-- Indexes for table `t_breakdown_fee`
--
ALTER TABLE `t_breakdown_fee`
  ADD PRIMARY KEY (`Breakdown_Fee_ID`),
  ADD KEY `Breakdown_Fee_AcademicYearID` (`Breakdown_Fee_AcademicYearID`),
  ADD KEY `Breakdown_Fee_Semester_ID` (`Breakdown_Fee_Semester_ID`),
  ADD KEY `Breakdown_Fee_Student_Account_ID` (`Breakdown_Fee_Student_Account_ID`);

--
-- Indexes for table `t_enrollment`
--
ALTER TABLE `t_enrollment`
  ADD PRIMARY KEY (`Enrollment_ID`),
  ADD KEY `Enrollment_Academic_Year_ID` (`Enrollment_Academic_Year_ID`),
  ADD KEY `Enrollment_Course_ID` (`Enrollment_Course_ID`),
  ADD KEY `Enrollment_Semester_ID` (`Enrollment_Semester_ID`),
  ADD KEY `Enrollment_Assign_Section_Curriculum_ID` (`Enrollment_Assign_Section_Curriculum_ID`),
  ADD KEY `Enrollment_Student_Account_ID` (`Enrollment_Student_Account_ID`);

--
-- Indexes for table `t_enrollment_status`
--
ALTER TABLE `t_enrollment_status`
  ADD PRIMARY KEY (`Enrollment_Status_ID`);

--
-- Indexes for table `t_graduate`
--
ALTER TABLE `t_graduate`
  ADD PRIMARY KEY (`Graduate_ID`),
  ADD KEY `Graduate_AcademicYearID` (`Graduate_AcademicYearID`),
  ADD KEY `Graduate_SemesterID` (`Graduate_SemesterID`),
  ADD KEY `t_graduate_ibfk_1` (`Graduate_StudentAccountID`);

--
-- Indexes for table `t_payable_history`
--
ALTER TABLE `t_payable_history`
  ADD PRIMARY KEY (`Payable_History_ID`),
  ADD KEY `Payable_History_Student_Account_ID` (`Payable_History_Student_Account_ID`),
  ADD KEY `Payable_History_Semester_ID` (`Payable_History_Semester_ID`),
  ADD KEY `Payable_History_AcademicYearID` (`Payable_History_AcademicYearID`),
  ADD KEY `Payable_History_ScholarshipID` (`Payable_History_ScholarshipID`);

--
-- Indexes for table `t_payment`
--
ALTER TABLE `t_payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Payment_Student_Account_ID` (`Payment_Student_Account_ID`);

--
-- Indexes for table `t_payment_history`
--
ALTER TABLE `t_payment_history`
  ADD PRIMARY KEY (`Payment_History_ID`),
  ADD KEY `Payment_History_Payment_ID` (`Payment_History_Payment_ID`);

--
-- Indexes for table `t_payment_log`
--
ALTER TABLE `t_payment_log`
  ADD PRIMARY KEY (`Payment_Log_ID`),
  ADD KEY `Payment_Log_StudentAccountID` (`Payment_Log_StudentAccountID`),
  ADD KEY `Payment_Log_AcademicyYearID` (`Payment_Log_AcademicyYearID`),
  ADD KEY `Payment_Log_SemesterID` (`Payment_Log_SemesterID`);

--
-- Indexes for table `t_returnee`
--
ALTER TABLE `t_returnee`
  ADD PRIMARY KEY (`Returnee_ID`),
  ADD KEY `Returnee_StudentAccountID` (`Returnee_StudentAccountID`),
  ADD KEY `Returnee_AcademicYearID` (`Returnee_AcademicYearID`),
  ADD KEY `Returnee_SemesterID` (`Returnee_SemesterID`);

--
-- Indexes for table `t_schedule`
--
ALTER TABLE `t_schedule`
  ADD PRIMARY KEY (`Schedule_ID`),
  ADD KEY `Schedule_CurriculumItemID` (`Schedule_CurriculumItemID`),
  ADD KEY `Schedule_ProfessorID` (`Schedule_ProfessorID`),
  ADD KEY `Schedule_SectionID` (`Schedule_SectionID`),
  ADD KEY `Schedule_ChildrenID` (`Schedule_ChildrenID`),
  ADD KEY `Schedule_AcademicYearID` (`Schedule_AcademicYearID`);

--
-- Indexes for table `t_schedule_items`
--
ALTER TABLE `t_schedule_items`
  ADD PRIMARY KEY (`Schedule_Items_ID`),
  ADD KEY `Schedule_Items_ScheduleID` (`Schedule_Items_ScheduleID`),
  ADD KEY `Schedule_Items_RoomID` (`Schedule_Items_RoomID`);

--
-- Indexes for table `t_scholarship_payment_history`
--
ALTER TABLE `t_scholarship_payment_history`
  ADD PRIMARY KEY (`Scholarship_Payment_History_ID`),
  ADD KEY `Scholarship_Payment_History_ScholarshipID` (`Scholarship_Payment_History_ScholarshipID`),
  ADD KEY `Scholarship_Payment_History_StudentAccountID` (`Scholarship_Payment_History_StudentAccountID`),
  ADD KEY `Scholarship_Payment_History_SemesterID` (`Scholarship_Payment_History_SemesterID`),
  ADD KEY `Scholarship_Payment_History_AcademicYearID` (`Scholarship_Payment_History_AcademicYearID`);

--
-- Indexes for table `t_scholar_account`
--
ALTER TABLE `t_scholar_account`
  ADD PRIMARY KEY (`Scholar_Account_ID`),
  ADD KEY `Scholar_Account_ScholarshipID` (`Scholar_Account_ScholarshipID`);

--
-- Indexes for table `t_students_grade`
--
ALTER TABLE `t_students_grade`
  ADD PRIMARY KEY (`Students_Grade_ID`),
  ADD KEY `Students_Grade_StudentTakenCurriculumSubjectID` (`Students_Grade_StudentTakenCurriculumSubjectID`),
  ADD KEY `Students_Grade_FacultyID` (`Students_Grade_FacultyID`);

--
-- Indexes for table `t_student_account`
--
ALTER TABLE `t_student_account`
  ADD PRIMARY KEY (`Student_Account_ID`),
  ADD KEY `Student_Account_Student_Profile_ID` (`Student_Account_Student_Profile_ID`),
  ADD KEY `Student_Account_CourseID` (`Student_Account_CourseID`),
  ADD KEY `Student_Account_SectionID` (`Student_Account_SectionID`),
  ADD KEY `Student_Account_CampusID` (`Student_Account_CampusID`),
  ADD KEY `t_student_account_ibfk_4` (`Student_Account_CurriculumYearID`);

--
-- Indexes for table `t_student_awards`
--
ALTER TABLE `t_student_awards`
  ADD PRIMARY KEY (`Student_Awards_ID`),
  ADD KEY `Student_Awards_AwardsID` (`Student_Awards_AwardsID`),
  ADD KEY `Student_Awards_StudentAccountID` (`Student_Awards_StudentAccountID`),
  ADD KEY `Student_Awards_AcademicYearID` (`Student_Awards_AcademicYearID`),
  ADD KEY `Student_Awards_SemesterID` (`Student_Awards_SemesterID`);

--
-- Indexes for table `t_student_enrolled`
--
ALTER TABLE `t_student_enrolled`
  ADD PRIMARY KEY (`Student_Enrolled_ID`),
  ADD KEY `Student_Enrolled_StudentAccountID` (`Student_Enrolled_StudentAccountID`),
  ADD KEY `Student_Enrolled_AcadamicYearID` (`Student_Enrolled_AcadamicYearID`),
  ADD KEY `Student_Enrolled_SemesterID` (`Student_Enrolled_SemesterID`);

--
-- Indexes for table `t_student_taken_curriculum_subject`
--
ALTER TABLE `t_student_taken_curriculum_subject`
  ADD PRIMARY KEY (`Student_Taken_Curriculum_Subject_ID`),
  ADD KEY `Student_Taken_Curriculum_Subject_SemesterID` (`Student_Taken_Curriculum_Subject_SemesterID`),
  ADD KEY `Student_Taken_Curriculum_Subject_AcademicIYearID` (`Student_Taken_Curriculum_Subject_AcademicIYearID`),
  ADD KEY `Student_Taken_Curriculum_Subject_SubjectID` (`Student_Taken_Curriculum_Subject_SubjectID`),
  ADD KEY `Student_Taken_Curriculum_Subject_StudentAccountID` (`Student_Taken_Curriculum_Subject_StudentAccountID`),
  ADD KEY `Student_Taken_Curriculum_Subject_SectionID` (`Student_Taken_Curriculum_Subject_SectionID`),
  ADD KEY `Student_Taken_Curriculum_Subject_CourseID` (`Student_Taken_Curriculum_Subject_CourseID`);

--
-- Indexes for table `t_summer_class`
--
ALTER TABLE `t_summer_class`
  ADD PRIMARY KEY (`Summer_Class_ID`),
  ADD KEY `Summer_Class_Subject_ID` (`Summer_Class_Subject_ID`),
  ADD KEY `Summer_Class_ProfessorID` (`Summer_Class_ProfessorID`),
  ADD KEY `Summer_Class_Academic_Year` (`Summer_Class_Academic_Year`),
  ADD KEY `Summer_Class_CampusID` (`Summer_Class_CampusID`);

--
-- Indexes for table `t_summer_class_schedule`
--
ALTER TABLE `t_summer_class_schedule`
  ADD PRIMARY KEY (`Summer_Class_Schedule_ID`),
  ADD KEY `Summer_Class_Schedule_SummerClassID` (`Summer_Class_Schedule_SummerClassID`),
  ADD KEY `Summer_Class_Schedule_RoomID` (`Summer_Class_Schedule_RoomID`);

--
-- Indexes for table `t_summer_class_student`
--
ALTER TABLE `t_summer_class_student`
  ADD PRIMARY KEY (`Summer_Class_Student_ID`),
  ADD KEY `Summer_Class_Student_SummerClassID` (`Summer_Class_Student_SummerClassID`),
  ADD KEY `Summer_Class_Student_StudentAccountID` (`Summer_Class_Student_StudentAccountID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `r_academic_year`
--
ALTER TABLE `r_academic_year`
  MODIFY `Academic_Year_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `r_admin`
--
ALTER TABLE `r_admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_awards`
--
ALTER TABLE `r_awards`
  MODIFY `Awards_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_campus`
--
ALTER TABLE `r_campus`
  MODIFY `Campus_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `r_campus_course`
--
ALTER TABLE `r_campus_course`
  MODIFY `Campus_Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `r_cashier`
--
ALTER TABLE `r_cashier`
  MODIFY `Cashier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_course`
--
ALTER TABLE `r_course`
  MODIFY `Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `r_course_fee`
--
ALTER TABLE `r_course_fee`
  MODIFY `Course_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_course_fee_items`
--
ALTER TABLE `r_course_fee_items`
  MODIFY `Course_Fee_Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_curriculum`
--
ALTER TABLE `r_curriculum`
  MODIFY `Curriculum_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `r_curriculumitem`
--
ALTER TABLE `r_curriculumitem`
  MODIFY `CurriculumItem_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `r_curriculumyear`
--
ALTER TABLE `r_curriculumyear`
  MODIFY `CurriculumYear_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_degree`
--
ALTER TABLE `r_degree`
  MODIFY `Degree_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `r_documents`
--
ALTER TABLE `r_documents`
  MODIFY `Documents_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `r_educational_attainment`
--
ALTER TABLE `r_educational_attainment`
  MODIFY `Educational_Attainment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_faculty_degree`
--
ALTER TABLE `r_faculty_degree`
  MODIFY `Faculty_Degree_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `r_faculty_subject`
--
ALTER TABLE `r_faculty_subject`
  MODIFY `Faculty_Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `r_fee`
--
ALTER TABLE `r_fee`
  MODIFY `Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `r_grade_opening`
--
ALTER TABLE `r_grade_opening`
  MODIFY `Grade_Opening_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_mandatory_fee`
--
ALTER TABLE `r_mandatory_fee`
  MODIFY `Mandatory_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `r_prerequisite`
--
ALTER TABLE `r_prerequisite`
  MODIFY `Prerequisite_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `r_professor`
--
ALTER TABLE `r_professor`
  MODIFY `Professor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `r_registation_opening`
--
ALTER TABLE `r_registation_opening`
  MODIFY `Registation_Opening_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `r_registrar`
--
ALTER TABLE `r_registrar`
  MODIFY `Registrar_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_room`
--
ALTER TABLE `r_room`
  MODIFY `Room_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `r_scholarship`
--
ALTER TABLE `r_scholarship`
  MODIFY `Scholarship_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_school_guard`
--
ALTER TABLE `r_school_guard`
  MODIFY `School_Guard_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `r_section`
--
ALTER TABLE `r_section`
  MODIFY `Section_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `r_semester`
--
ALTER TABLE `r_semester`
  MODIFY `Semester_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `r_student_application`
--
ALTER TABLE `r_student_application`
  MODIFY `Student_Application_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `r_student_document`
--
ALTER TABLE `r_student_document`
  MODIFY `Student_Document_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `r_student_profile`
--
ALTER TABLE `r_student_profile`
  MODIFY `Student_Profile_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `r_subject`
--
ALTER TABLE `r_subject`
  MODIFY `Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `r_subject_fee`
--
ALTER TABLE `r_subject_fee`
  MODIFY `Subject_Fee_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_subject_fee_items`
--
ALTER TABLE `r_subject_fee_items`
  MODIFY `Subject_Fee_Items_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_tuition_fee`
--
ALTER TABLE `r_tuition_fee`
  MODIFY `Tuition_Fee_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_unit_fee`
--
ALTER TABLE `r_unit_fee`
  MODIFY `Unit_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_user_account`
--
ALTER TABLE `r_user_account`
  MODIFY `User_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `t_announcement`
--
ALTER TABLE `t_announcement`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_assign_section_fee_item`
--
ALTER TABLE `t_assign_section_fee_item`
  MODIFY `Assign_Section_Fee_Item_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_breakdown_fee`
--
ALTER TABLE `t_breakdown_fee`
  MODIFY `Breakdown_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=581;

--
-- AUTO_INCREMENT for table `t_enrollment`
--
ALTER TABLE `t_enrollment`
  MODIFY `Enrollment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_enrollment_status`
--
ALTER TABLE `t_enrollment_status`
  MODIFY `Enrollment_Status_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_graduate`
--
ALTER TABLE `t_graduate`
  MODIFY `Graduate_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_payable_history`
--
ALTER TABLE `t_payable_history`
  MODIFY `Payable_History_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=766;

--
-- AUTO_INCREMENT for table `t_payment`
--
ALTER TABLE `t_payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `t_payment_history`
--
ALTER TABLE `t_payment_history`
  MODIFY `Payment_History_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_payment_log`
--
ALTER TABLE `t_payment_log`
  MODIFY `Payment_Log_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT for table `t_returnee`
--
ALTER TABLE `t_returnee`
  MODIFY `Returnee_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_schedule`
--
ALTER TABLE `t_schedule`
  MODIFY `Schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=920;

--
-- AUTO_INCREMENT for table `t_schedule_items`
--
ALTER TABLE `t_schedule_items`
  MODIFY `Schedule_Items_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=853;

--
-- AUTO_INCREMENT for table `t_scholarship_payment_history`
--
ALTER TABLE `t_scholarship_payment_history`
  MODIFY `Scholarship_Payment_History_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `t_scholar_account`
--
ALTER TABLE `t_scholar_account`
  MODIFY `Scholar_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_students_grade`
--
ALTER TABLE `t_students_grade`
  MODIFY `Students_Grade_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1971;

--
-- AUTO_INCREMENT for table `t_student_account`
--
ALTER TABLE `t_student_account`
  MODIFY `Student_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `t_student_awards`
--
ALTER TABLE `t_student_awards`
  MODIFY `Student_Awards_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_student_enrolled`
--
ALTER TABLE `t_student_enrolled`
  MODIFY `Student_Enrolled_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_student_taken_curriculum_subject`
--
ALTER TABLE `t_student_taken_curriculum_subject`
  MODIFY `Student_Taken_Curriculum_Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2297;

--
-- AUTO_INCREMENT for table `t_summer_class`
--
ALTER TABLE `t_summer_class`
  MODIFY `Summer_Class_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_summer_class_schedule`
--
ALTER TABLE `t_summer_class_schedule`
  MODIFY `Summer_Class_Schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_summer_class_student`
--
ALTER TABLE `t_summer_class_student`
  MODIFY `Summer_Class_Student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `r_campus_course`
--
ALTER TABLE `r_campus_course`
  ADD CONSTRAINT `r_campus_course_ibfk_1` FOREIGN KEY (`Campus_Course_CourseID`) REFERENCES `r_course` (`Course_ID`),
  ADD CONSTRAINT `r_campus_course_ibfk_2` FOREIGN KEY (`Campus_Course_CampusID`) REFERENCES `r_campus` (`Campus_ID`);

--
-- Constraints for table `r_course_fee`
--
ALTER TABLE `r_course_fee`
  ADD CONSTRAINT `r_course_fee_ibfk_1` FOREIGN KEY (`Course_Fee_CourseID`) REFERENCES `r_course` (`Course_ID`),
  ADD CONSTRAINT `r_course_fee_ibfk_3` FOREIGN KEY (`Course_Fee_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`);

--
-- Constraints for table `r_course_fee_items`
--
ALTER TABLE `r_course_fee_items`
  ADD CONSTRAINT `r_course_fee_items_ibfk_1` FOREIGN KEY (`Course_Fee_Item_CourseFeeID`) REFERENCES `r_course_fee` (`Course_Fee_ID`),
  ADD CONSTRAINT `r_course_fee_items_ibfk_2` FOREIGN KEY (`Course_Fee_Item_FeeID`) REFERENCES `r_fee` (`Fee_ID`);

--
-- Constraints for table `r_curriculum`
--
ALTER TABLE `r_curriculum`
  ADD CONSTRAINT `r_curriculum_ibfk_1` FOREIGN KEY (`Curriculum_SemesterID`) REFERENCES `r_semester` (`Semester_ID`),
  ADD CONSTRAINT `r_curriculum_ibfk_2` FOREIGN KEY (`Curriculum_CourseID`) REFERENCES `r_course` (`Course_ID`),
  ADD CONSTRAINT `r_curriculum_ibfk_3` FOREIGN KEY (`Curriculum_CurriculumYearID`) REFERENCES `r_curriculumyear` (`CurriculumYear_ID`);

--
-- Constraints for table `r_curriculumitem`
--
ALTER TABLE `r_curriculumitem`
  ADD CONSTRAINT `FK_CurriculumItem_CurriculumID` FOREIGN KEY (`CurriculumItem_CurriculumID`) REFERENCES `r_curriculum` (`Curriculum_ID`),
  ADD CONSTRAINT `FK_CurriculumItem_SubjectID` FOREIGN KEY (`CurriculumItem_SubjectID`) REFERENCES `r_subject` (`Subject_ID`);

--
-- Constraints for table `r_educational_attainment`
--
ALTER TABLE `r_educational_attainment`
  ADD CONSTRAINT `r_educational_attainment_ibfk_1` FOREIGN KEY (`Educational_Attainment_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`);

--
-- Constraints for table `r_faculty_degree`
--
ALTER TABLE `r_faculty_degree`
  ADD CONSTRAINT `r_faculty_degree_ibfk_1` FOREIGN KEY (`Faculty_Degree_DegreeID`) REFERENCES `r_degree` (`Degree_ID`),
  ADD CONSTRAINT `r_faculty_degree_ibfk_2` FOREIGN KEY (`Faculty_Degree_ProfessorID`) REFERENCES `r_professor` (`Professor_ID`);

--
-- Constraints for table `r_faculty_subject`
--
ALTER TABLE `r_faculty_subject`
  ADD CONSTRAINT `r_faculty_subject_ibfk_1` FOREIGN KEY (`Faculty_Subject_SubjectID`) REFERENCES `r_subject` (`Subject_ID`),
  ADD CONSTRAINT `r_faculty_subject_ibfk_2` FOREIGN KEY (`Faculty_Subject_ProfessorID`) REFERENCES `r_professor` (`Professor_ID`);

--
-- Constraints for table `r_mandatory_fee`
--
ALTER TABLE `r_mandatory_fee`
  ADD CONSTRAINT `r_mandatory_fee_ibfk_1` FOREIGN KEY (`Mandatory_Fee_FeeID`) REFERENCES `r_fee` (`Fee_ID`),
  ADD CONSTRAINT `r_mandatory_fee_ibfk_2` FOREIGN KEY (`Mandatory_Fee_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`);

--
-- Constraints for table `r_prerequisite`
--
ALTER TABLE `r_prerequisite`
  ADD CONSTRAINT `r_prerequisite_ibfk_1` FOREIGN KEY (`Prerequisite_Main_SubjectID`) REFERENCES `r_subject` (`Subject_ID`),
  ADD CONSTRAINT `r_prerequisite_ibfk_2` FOREIGN KEY (`Prerequisite_Prequisite_SubjectID`) REFERENCES `r_subject` (`Subject_ID`);

--
-- Constraints for table `r_registation_opening`
--
ALTER TABLE `r_registation_opening`
  ADD CONSTRAINT `r_registation_opening_ibfk_1` FOREIGN KEY (`Registation_Opening_CourseID`) REFERENCES `r_course` (`Course_ID`);

--
-- Constraints for table `r_room`
--
ALTER TABLE `r_room`
  ADD CONSTRAINT `r_room_ibfk_1` FOREIGN KEY (`Room_CampusID`) REFERENCES `r_campus` (`Campus_ID`);

--
-- Constraints for table `r_section`
--
ALTER TABLE `r_section`
  ADD CONSTRAINT `r_section_ibfk_2` FOREIGN KEY (`Section_CourseID`) REFERENCES `r_course` (`Course_ID`),
  ADD CONSTRAINT `r_section_ibfk_3` FOREIGN KEY (`Section_CampusID`) REFERENCES `r_campus` (`Campus_ID`);

--
-- Constraints for table `r_student_application`
--
ALTER TABLE `r_student_application`
  ADD CONSTRAINT `r_student_application_ibfk_1` FOREIGN KEY (`Student_Application_StudentProfileID`) REFERENCES `r_student_profile` (`Student_Profile_ID`);

--
-- Constraints for table `r_student_document`
--
ALTER TABLE `r_student_document`
  ADD CONSTRAINT `r_student_document_ibfk_1` FOREIGN KEY (`Student_Document_StudentApplicationID`) REFERENCES `r_student_application` (`Student_Application_ID`),
  ADD CONSTRAINT `r_student_document_ibfk_2` FOREIGN KEY (`Student_Document_DocumentID`) REFERENCES `r_documents` (`Documents_ID`);

--
-- Constraints for table `r_subject_fee`
--
ALTER TABLE `r_subject_fee`
  ADD CONSTRAINT `r_subject_fee_ibfk_1` FOREIGN KEY (`Subject_Fee_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `r_subject_fee_ibfk_2` FOREIGN KEY (`Subject_Fee_SubjectID`) REFERENCES `r_subject` (`Subject_ID`);

--
-- Constraints for table `r_subject_fee_items`
--
ALTER TABLE `r_subject_fee_items`
  ADD CONSTRAINT `r_subject_fee_items_ibfk_2` FOREIGN KEY (`Subject_Fee_Items_FeeID`) REFERENCES `r_fee` (`Fee_ID`),
  ADD CONSTRAINT `r_subject_fee_items_ibfk_3` FOREIGN KEY (`Subject_Fee_Items_SubjectFeeID`) REFERENCES `r_subject_fee` (`Subject_Fee_ID`);

--
-- Constraints for table `r_tuition_fee`
--
ALTER TABLE `r_tuition_fee`
  ADD CONSTRAINT `r_tuition_fee_ibfk_1` FOREIGN KEY (`Tuition_Fee_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `r_tuition_fee_ibfk_2` FOREIGN KEY (`Tuition_Fee_CourseID`) REFERENCES `r_course` (`Course_ID`);

--
-- Constraints for table `t_assign_section_fee_item`
--
ALTER TABLE `t_assign_section_fee_item`
  ADD CONSTRAINT `t_assign_section_fee_item_ibfk_1` FOREIGN KEY (`Assign_Section_Fee_Item_Fee_ID`) REFERENCES `r_fee` (`Fee_ID`),
  ADD CONSTRAINT `t_assign_section_fee_item_ibfk_2` FOREIGN KEY (`Assign_Section_Fee_Item_Section_ID`) REFERENCES `r_section` (`Section_ID`);

--
-- Constraints for table `t_breakdown_fee`
--
ALTER TABLE `t_breakdown_fee`
  ADD CONSTRAINT `t_breakdown_fee_ibfk_1` FOREIGN KEY (`Breakdown_Fee_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_breakdown_fee_ibfk_2` FOREIGN KEY (`Breakdown_Fee_Semester_ID`) REFERENCES `r_semester` (`Semester_ID`),
  ADD CONSTRAINT `t_breakdown_fee_ibfk_3` FOREIGN KEY (`Breakdown_Fee_Student_Account_ID`) REFERENCES `t_student_account` (`Student_Account_ID`);

--
-- Constraints for table `t_enrollment`
--
ALTER TABLE `t_enrollment`
  ADD CONSTRAINT `t_enrollment_ibfk_1` FOREIGN KEY (`Enrollment_Academic_Year_ID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_enrollment_ibfk_2` FOREIGN KEY (`Enrollment_Course_ID`) REFERENCES `r_course` (`Course_ID`),
  ADD CONSTRAINT `t_enrollment_ibfk_3` FOREIGN KEY (`Enrollment_Semester_ID`) REFERENCES `r_semester` (`Semester_ID`),
  ADD CONSTRAINT `t_enrollment_ibfk_4` FOREIGN KEY (`Enrollment_Assign_Section_Curriculum_ID`) REFERENCES `r_curriculum` (`Curriculum_ID`),
  ADD CONSTRAINT `t_enrollment_ibfk_5` FOREIGN KEY (`Enrollment_Student_Account_ID`) REFERENCES `t_student_account` (`Student_Account_ID`);

--
-- Constraints for table `t_graduate`
--
ALTER TABLE `t_graduate`
  ADD CONSTRAINT `t_graduate_ibfk_1` FOREIGN KEY (`Graduate_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_graduate_ibfk_2` FOREIGN KEY (`Graduate_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_graduate_ibfk_3` FOREIGN KEY (`Graduate_SemesterID`) REFERENCES `r_semester` (`Semester_ID`);

--
-- Constraints for table `t_payable_history`
--
ALTER TABLE `t_payable_history`
  ADD CONSTRAINT `t_payable_history_ibfk_1` FOREIGN KEY (`Payable_History_Student_Account_ID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_payable_history_ibfk_2` FOREIGN KEY (`Payable_History_Semester_ID`) REFERENCES `r_semester` (`Semester_ID`),
  ADD CONSTRAINT `t_payable_history_ibfk_3` FOREIGN KEY (`Payable_History_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_payable_history_ibfk_4` FOREIGN KEY (`Payable_History_ScholarshipID`) REFERENCES `r_scholarship` (`Scholarship_ID`);

--
-- Constraints for table `t_payment`
--
ALTER TABLE `t_payment`
  ADD CONSTRAINT `t_payment_ibfk_1` FOREIGN KEY (`Payment_Student_Account_ID`) REFERENCES `t_student_account` (`Student_Account_ID`);

--
-- Constraints for table `t_payment_history`
--
ALTER TABLE `t_payment_history`
  ADD CONSTRAINT `t_payment_history_ibfk_1` FOREIGN KEY (`Payment_History_Payment_ID`) REFERENCES `t_payment` (`Payment_ID`);

--
-- Constraints for table `t_payment_log`
--
ALTER TABLE `t_payment_log`
  ADD CONSTRAINT `t_payment_log_ibfk_1` FOREIGN KEY (`Payment_Log_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_payment_log_ibfk_2` FOREIGN KEY (`Payment_Log_AcademicyYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_payment_log_ibfk_3` FOREIGN KEY (`Payment_Log_SemesterID`) REFERENCES `r_semester` (`Semester_ID`);

--
-- Constraints for table `t_returnee`
--
ALTER TABLE `t_returnee`
  ADD CONSTRAINT `t_returnee_ibfk_1` FOREIGN KEY (`Returnee_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_returnee_ibfk_2` FOREIGN KEY (`Returnee_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_returnee_ibfk_3` FOREIGN KEY (`Returnee_SemesterID`) REFERENCES `r_semester` (`Semester_ID`);

--
-- Constraints for table `t_schedule`
--
ALTER TABLE `t_schedule`
  ADD CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`Schedule_CurriculumItemID`) REFERENCES `r_curriculumitem` (`CurriculumItem_ID`),
  ADD CONSTRAINT `t_schedule_ibfk_2` FOREIGN KEY (`Schedule_ProfessorID`) REFERENCES `r_professor` (`Professor_ID`),
  ADD CONSTRAINT `t_schedule_ibfk_4` FOREIGN KEY (`Schedule_SectionID`) REFERENCES `r_section` (`Section_ID`),
  ADD CONSTRAINT `t_schedule_ibfk_5` FOREIGN KEY (`Schedule_ChildrenID`) REFERENCES `r_subject` (`Subject_ID`),
  ADD CONSTRAINT `t_schedule_ibfk_6` FOREIGN KEY (`Schedule_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`);

--
-- Constraints for table `t_schedule_items`
--
ALTER TABLE `t_schedule_items`
  ADD CONSTRAINT `t_schedule_items_ibfk_1` FOREIGN KEY (`Schedule_Items_ScheduleID`) REFERENCES `t_schedule` (`Schedule_ID`),
  ADD CONSTRAINT `t_schedule_items_ibfk_2` FOREIGN KEY (`Schedule_Items_RoomID`) REFERENCES `r_room` (`Room_ID`);

--
-- Constraints for table `t_scholarship_payment_history`
--
ALTER TABLE `t_scholarship_payment_history`
  ADD CONSTRAINT `t_scholarship_payment_history_ibfk_1` FOREIGN KEY (`Scholarship_Payment_History_ScholarshipID`) REFERENCES `r_scholarship` (`Scholarship_ID`),
  ADD CONSTRAINT `t_scholarship_payment_history_ibfk_2` FOREIGN KEY (`Scholarship_Payment_History_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_scholarship_payment_history_ibfk_3` FOREIGN KEY (`Scholarship_Payment_History_SemesterID`) REFERENCES `r_semester` (`Semester_ID`),
  ADD CONSTRAINT `t_scholarship_payment_history_ibfk_4` FOREIGN KEY (`Scholarship_Payment_History_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_scholarship_payment_history_ibfk_5` FOREIGN KEY (`Scholarship_Payment_History_ScholarshipID`) REFERENCES `r_scholarship` (`Scholarship_ID`),
  ADD CONSTRAINT `t_scholarship_payment_history_ibfk_6` FOREIGN KEY (`Scholarship_Payment_History_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_scholarship_payment_history_ibfk_7` FOREIGN KEY (`Scholarship_Payment_History_SemesterID`) REFERENCES `r_semester` (`Semester_ID`),
  ADD CONSTRAINT `t_scholarship_payment_history_ibfk_8` FOREIGN KEY (`Scholarship_Payment_History_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`);

--
-- Constraints for table `t_scholar_account`
--
ALTER TABLE `t_scholar_account`
  ADD CONSTRAINT `t_scholar_account_ibfk_1` FOREIGN KEY (`Scholar_Account_ScholarshipID`) REFERENCES `r_scholarship` (`Scholarship_ID`);

--
-- Constraints for table `t_students_grade`
--
ALTER TABLE `t_students_grade`
  ADD CONSTRAINT `t_students_grade_ibfk_1` FOREIGN KEY (`Students_Grade_StudentTakenCurriculumSubjectID`) REFERENCES `t_student_taken_curriculum_subject` (`Student_Taken_Curriculum_Subject_ID`),
  ADD CONSTRAINT `t_students_grade_ibfk_2` FOREIGN KEY (`Students_Grade_FacultyID`) REFERENCES `r_professor` (`Professor_ID`);

--
-- Constraints for table `t_student_account`
--
ALTER TABLE `t_student_account`
  ADD CONSTRAINT `t_student_account_ibfk_1` FOREIGN KEY (`Student_Account_Student_Profile_ID`) REFERENCES `r_student_profile` (`Student_Profile_ID`),
  ADD CONSTRAINT `t_student_account_ibfk_2` FOREIGN KEY (`Student_Account_CourseID`) REFERENCES `r_course` (`Course_ID`),
  ADD CONSTRAINT `t_student_account_ibfk_3` FOREIGN KEY (`Student_Account_SectionID`) REFERENCES `r_section` (`Section_ID`),
  ADD CONSTRAINT `t_student_account_ibfk_4` FOREIGN KEY (`Student_Account_CurriculumYearID`) REFERENCES `r_curriculumyear` (`CurriculumYear_ID`),
  ADD CONSTRAINT `t_student_account_ibfk_5` FOREIGN KEY (`Student_Account_CampusID`) REFERENCES `r_campus` (`Campus_ID`);

--
-- Constraints for table `t_student_awards`
--
ALTER TABLE `t_student_awards`
  ADD CONSTRAINT `t_student_awards_ibfk_1` FOREIGN KEY (`Student_Awards_AwardsID`) REFERENCES `r_awards` (`Awards_ID`),
  ADD CONSTRAINT `t_student_awards_ibfk_2` FOREIGN KEY (`Student_Awards_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_student_awards_ibfk_3` FOREIGN KEY (`Student_Awards_AcademicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_student_awards_ibfk_4` FOREIGN KEY (`Student_Awards_SemesterID`) REFERENCES `r_semester` (`Semester_ID`);

--
-- Constraints for table `t_student_enrolled`
--
ALTER TABLE `t_student_enrolled`
  ADD CONSTRAINT `t_student_enrolled_ibfk_1` FOREIGN KEY (`Student_Enrolled_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_student_enrolled_ibfk_2` FOREIGN KEY (`Student_Enrolled_AcadamicYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_student_enrolled_ibfk_3` FOREIGN KEY (`Student_Enrolled_SemesterID`) REFERENCES `r_semester` (`Semester_ID`);

--
-- Constraints for table `t_student_taken_curriculum_subject`
--
ALTER TABLE `t_student_taken_curriculum_subject`
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_1` FOREIGN KEY (`Student_Taken_Curriculum_Subject_SemesterID`) REFERENCES `r_semester` (`Semester_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_2` FOREIGN KEY (`Student_Taken_Curriculum_Subject_AcademicIYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_3` FOREIGN KEY (`Student_Taken_Curriculum_Subject_SubjectID`) REFERENCES `r_subject` (`Subject_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_4` FOREIGN KEY (`Student_Taken_Curriculum_Subject_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_5` FOREIGN KEY (`Student_Taken_Curriculum_Subject_SectionID`) REFERENCES `r_section` (`Section_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_6` FOREIGN KEY (`Student_Taken_Curriculum_Subject_CourseID`) REFERENCES `r_course` (`Course_ID`);

--
-- Constraints for table `t_summer_class`
--
ALTER TABLE `t_summer_class`
  ADD CONSTRAINT `t_summer_class_ibfk_1` FOREIGN KEY (`Summer_Class_Subject_ID`) REFERENCES `r_subject` (`Subject_ID`),
  ADD CONSTRAINT `t_summer_class_ibfk_2` FOREIGN KEY (`Summer_Class_ProfessorID`) REFERENCES `r_professor` (`Professor_ID`),
  ADD CONSTRAINT `t_summer_class_ibfk_3` FOREIGN KEY (`Summer_Class_Academic_Year`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_summer_class_ibfk_4` FOREIGN KEY (`Summer_Class_CampusID`) REFERENCES `r_campus` (`Campus_ID`);

--
-- Constraints for table `t_summer_class_schedule`
--
ALTER TABLE `t_summer_class_schedule`
  ADD CONSTRAINT `t_summer_class_schedule_ibfk_1` FOREIGN KEY (`Summer_Class_Schedule_SummerClassID`) REFERENCES `t_summer_class` (`Summer_Class_ID`),
  ADD CONSTRAINT `t_summer_class_schedule_ibfk_2` FOREIGN KEY (`Summer_Class_Schedule_RoomID`) REFERENCES `r_room` (`Room_ID`);

--
-- Constraints for table `t_summer_class_student`
--
ALTER TABLE `t_summer_class_student`
  ADD CONSTRAINT `t_summer_class_student_ibfk_1` FOREIGN KEY (`Summer_Class_Student_SummerClassID`) REFERENCES `t_summer_class` (`Summer_Class_ID`),
  ADD CONSTRAINT `t_summer_class_student_ibfk_2` FOREIGN KEY (`Summer_Class_Student_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
