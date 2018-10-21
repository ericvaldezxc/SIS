-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2018 at 03:28 PM
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
-- Database: `sis_12`
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
(1, 'Nw8ZppgQPxdZ4/lI7MWohg==', 'WzMwG7yRvn3aAvKlxQNzNA==', 'Used', 'Active', '2018-08-02 04:10:43', '2018-10-12 20:07:15'),
(2, 'qEmiI5/0XZY1EFyZ3Pnk6w==', 'mcctP57D/WKwY5t8ETo/jg==', 'Used', 'Active', '2018-08-02 04:11:03', '2018-10-12 18:13:42'),
(3, '0fAtwElD4mZI0N+Nrsxb3g==', 'KrWaPpJ3me479gIH9Ul4WQ==', 'Used', 'Active', '2018-08-02 04:11:30', '2018-09-19 22:57:56'),
(4, 'ELaf4pXwa3mc3exdJrGzSQ==', '0WjdYtbrdVQWbuEaq4wf9Q==', 'Used', 'Active', '2018-08-02 04:11:31', '2018-10-10 12:44:09'),
(5, 'I55TkYDcsryi1XAtHpHVFQ==', 'EvGOxhu8NTTxzbzUK6Hpkw==', 'Used', 'Active', '2018-09-09 15:40:42', '2018-10-12 22:29:20'),
(6, 'p7pC1UjVvFuljSCpKRq7kQ==', 'keorA2JkN3nuk0zDI0qIyg==', 'Used', 'Active', '2018-10-10 19:11:52', '2018-10-12 23:22:24'),
(7, 'E8j4hVZVg5qV4n1dqWnp7Q==', 'HnbFoINMrY9h7ODvTWc9cQ==', 'Used', 'Active', '2018-10-12 23:21:54', '2018-10-13 03:58:35'),
(8, '5sCwAzJZt8hEeEhI8d8wJw==', 'sa83ooCLIzWuPZ6gLLCC8g==', 'Used', 'Active', '2018-10-13 03:58:28', '2018-10-13 05:41:25'),
(9, 'fz8ZdAsExB/Z52zCEKd1xA==', 'EXFa5APhuZpEmMn9iDk+Ow==', 'Present', 'Active', '2018-10-13 05:41:16', '2018-10-13 05:41:25');

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
(152, 67, 68, 'Active', '2018-09-12 23:45:12', '2018-10-12 18:27:48'),
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
(171, 71, 136, 'Active', '2018-10-11 22:04:24', '2018-10-12 18:28:17'),
(172, 71, 138, 'Active', '2018-10-11 22:04:24', '2018-10-12 18:28:17'),
(173, 71, 74, 'Active', '2018-10-11 22:04:24', '2018-10-12 18:28:17'),
(174, 71, 89, 'Active', '2018-10-11 22:04:24', '2018-10-12 18:28:17'),
(175, 71, 116, 'Active', '2018-10-11 22:04:24', '2018-10-12 18:28:17'),
(176, 72, 139, 'Active', '2018-10-11 22:07:30', '2018-10-12 18:28:27'),
(177, 72, 141, 'Active', '2018-10-11 22:07:30', '2018-10-12 18:28:27'),
(178, 72, 140, 'Active', '2018-10-11 22:07:30', '2018-10-12 18:28:27'),
(179, 72, 145, 'Active', '2018-10-11 22:07:30', '2018-10-12 18:28:27'),
(180, 72, 90, 'Active', '2018-10-11 22:07:30', '2018-10-12 18:28:27'),
(181, 73, 144, 'Active', '2018-10-11 22:09:08', '2018-10-12 18:28:38'),
(182, 73, 142, 'Active', '2018-10-11 22:09:08', '2018-10-12 18:28:38'),
(183, 73, 98, 'Active', '2018-10-11 22:09:08', '2018-10-12 18:28:38'),
(184, 73, 146, 'Active', '2018-10-11 22:09:08', '2018-10-12 18:28:38'),
(185, 73, 91, 'Active', '2018-10-11 22:09:08', '2018-10-12 18:28:38'),
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
(197, 67, 69, 'Active', '2018-10-11 22:27:46', '2018-10-12 18:27:48'),
(198, 67, 71, 'Active', '2018-10-11 22:27:46', '2018-10-12 18:27:48'),
(199, 67, 134, 'Active', '2018-10-11 22:27:46', '2018-10-12 18:27:48'),
(200, 67, 76, 'Active', '2018-10-11 22:27:46', '2018-10-12 18:27:48'),
(201, 67, 79, 'Active', '2018-10-11 22:27:46', '2018-10-12 18:27:48'),
(202, 67, 81, 'Active', '2018-10-11 22:27:46', '2018-10-12 18:27:48'),
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
(14, 16, 5, 'Active', '2018-09-04 14:46:09', '2018-09-04 14:46:09'),
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
(49, 78, 16, 'Active', '2018-09-04 14:46:09', '2018-09-04 14:46:09'),
(50, 79, 16, 'Active', '2018-09-04 14:46:09', '2018-09-04 14:46:09'),
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
(175, 67, 27, 'Active', '2018-10-19 01:27:22', '2018-10-19 01:27:22');

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
(1, 'Yes', 'Active', '2018-08-19 18:04:29', '2018-10-13 04:32:11');

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
(4, 7, 4, '1100.00', 'Active', '2018-10-12 23:22:49', '2018-10-12 23:22:49');

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
(3, 17, 'Third Year', 'No', 'Active', '2018-08-21 16:58:43', '2018-10-13 04:30:34'),
(4, 17, 'Fourth Year', 'No', 'Active', '2018-08-21 16:58:43', '2018-10-13 04:30:34'),
(5, 17, 'Fifth Year', 'No', 'Active', '2018-08-21 16:58:44', '2018-10-13 04:30:35'),
(6, 18, 'First Year', 'Yes', 'Active', '2018-10-12 19:44:12', '2018-10-12 19:44:12'),
(7, 18, 'Second Year', 'Yes', 'Active', '2018-10-12 19:44:12', '2018-10-13 05:49:38'),
(8, 18, 'Third Year', 'No', 'Active', '2018-10-12 19:44:12', '2018-10-13 04:30:27'),
(9, 18, 'Fourth Year', 'No', 'Active', '2018-10-12 19:44:12', '2018-10-13 04:30:27'),
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
(18, 19, '2018-00001', 'Active', '2018-10-12 17:00:33', '2018-10-12 17:00:33'),
(19, 20, '2018-00002', 'Active', '2018-10-12 17:01:47', '2018-10-12 17:01:47'),
(20, 21, '2018-00003', 'Active', '2018-10-12 17:03:19', '2018-10-12 17:03:19'),
(21, 22, '2018-00004', 'Active', '2018-10-12 17:06:00', '2018-10-12 17:06:00'),
(22, 23, '2018-00005', 'Active', '2018-10-12 18:21:39', '2018-10-12 18:21:39'),
(23, 24, '2018-00006', 'Active', '2018-10-12 18:22:45', '2018-10-12 18:22:45'),
(24, 25, '2018-00007', 'Active', '2018-10-12 18:23:47', '2018-10-12 18:23:47'),
(25, 26, '2018-00008', 'Active', '2018-10-12 18:24:50', '2018-10-12 18:24:50'),
(26, 27, '2018-00009', 'Active', '2018-10-12 18:52:59', '2018-10-12 18:52:59'),
(27, 28, '2018-00010', 'Active', '2018-10-13 03:37:11', '2018-10-13 03:37:11'),
(28, 29, '2018-00011', 'Active', '2018-10-13 03:40:50', '2018-10-13 03:40:50'),
(29, 30, '2018-00012', 'Active', '2018-10-18 21:17:49', '2018-10-18 21:17:49'),
(30, 31, '2018-00013', 'Active', '2018-10-18 22:19:42', '2018-10-18 22:19:42'),
(31, 32, '2018-00014', 'Active', '2018-10-18 22:42:58', '2018-10-18 22:42:58'),
(32, 33, '2018-00015', 'Active', '2018-10-18 22:45:18', '2018-10-18 22:45:18'),
(33, 34, '2018-00016', 'Active', '2018-10-19 22:03:56', '2018-10-19 22:03:56');

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
(18, 18, 3, 'Active', '2018-10-12 17:06:17', '2018-10-12 17:06:17'),
(19, 19, 3, 'Active', '2018-10-12 17:06:22', '2018-10-12 17:06:22'),
(20, 20, 3, 'Active', '2018-10-12 17:06:30', '2018-10-12 17:06:30'),
(21, 21, 3, 'Active', '2018-10-12 17:06:37', '2018-10-12 17:06:37'),
(22, 22, 3, 'Active', '2018-10-12 18:25:01', '2018-10-12 18:25:01'),
(23, 23, 3, 'Active', '2018-10-12 18:25:09', '2018-10-12 18:25:09'),
(24, 24, 3, 'Active', '2018-10-12 18:25:13', '2018-10-12 18:25:13'),
(25, 25, 3, 'Active', '2018-10-12 18:25:19', '2018-10-12 18:25:19'),
(26, 26, 3, 'Active', '2018-10-12 18:53:20', '2018-10-12 18:53:20'),
(27, 27, 3, 'Active', '2018-10-13 03:37:22', '2018-10-13 03:37:22'),
(28, 28, 3, 'Active', '2018-10-13 03:57:00', '2018-10-13 03:57:00'),
(29, 29, 3, 'Active', '2018-10-18 21:17:56', '2018-10-18 21:17:56'),
(30, 30, 3, 'Active', '2018-10-18 22:19:47', '2018-10-18 22:19:47'),
(31, 31, 3, 'Active', '2018-10-18 22:44:08', '2018-10-18 22:44:08'),
(32, 32, 3, 'Active', '2018-10-18 22:45:22', '2018-10-18 22:45:22'),
(33, 33, 3, 'Active', '2018-10-19 22:04:07', '2018-10-19 22:04:07');

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
(19, 'k8arWWUtaUPa74/YsjPzkw==', 'JS8sIjJwLxt1F+Yi8P/H0g==', '8Mb5BVG/XlV5OhrEHO/ONA==', '', '', '2001-01-01', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', 'jW9FGvp8FF6GGcF2E4BelSa1T77Jjj9Pu+Mxv8zORtUheqXzBsib2ES2FsAr/uGK', '6xLgFMDmmcFZR8PpZTa2Qg==', 'B54ayMfjxWKblEqD4CJpA48T96MuIt43Cml0vKvylSY=', 'Active', '2018-10-12 17:00:33', '2018-10-13 09:17:44'),
(20, 'oXkiUH+dG1GBNKhIvLdlZw==', 'u31reSSaDlM5KRSd2HS0wQ==', 'RNRqcV45q0+v/p5UIJRpMw==', NULL, NULL, '2002-02-02', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', 'fDkBGiCtKWfMVrRg1co4m1aFNfSwOzVSxCw6ryC7GgCfHSv8SZz0zxBfSxcCZ4AN', 'JPnglRzrM951rGVJXc7BYg==', 'S75pHteK9Dh42Roc+VzZL+fIN2cNCyhDIUfCr071ZRg=', 'Active', '2018-10-12 17:01:47', '2018-10-12 17:01:47'),
(21, 'Blf0xM9tfsExd3StAYxeUg==', 'be1tpQ2a80R1TVbGcxRb8g==', 'dwWVK9mZhZO2YDtS3Sfj5A==', NULL, NULL, '2003-03-03', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', 'jbl2h+rJZKw2U9EVrvB1xZ6SnF8WPwxgfxKX0gzesOdKKdVyKvhfjGGwNqXnnp4x', 'oTX3jQUg69z8YgEUDCt1KA==', 'xIgehr8UGF0i2QPkEPu88V1KXhW6BUxwu+jmFDl7mDQ=', 'Active', '2018-10-12 17:03:19', '2018-10-12 17:03:19'),
(22, 'yGxMZ/ZfTye12AoGwy2HoA==', 'VgmG4HwSkN904FlcU8PAcg==', 'jkDLSHwFqlb7G3rLLZXIgA==', NULL, NULL, '2004-04-04', 'TVMDMS+RbuXMApExWaeiaA==', 'Female', 'Single', 'SDdf/vdBXHCpe8zQcwt8aFIT18qxEWaq8YvpBp5YWG18nJTH8DMig3ukoBTvxvOw', '1ndttrxycFDVpBhmAT4HWQ==', 'JnoEx6pJ+IuXT11mso54mEQAx4HaUVnn8EUQvKdg1Bo=', 'Active', '2018-10-12 17:06:00', '2018-10-12 17:06:00'),
(23, '7uMs7QCme3AEz7+c549lrw==', 'aeIP5OXFAnLU92IoedgURg==', 'oXQ0DSBwZ8+Z6BDGrgG6aQ==', NULL, NULL, '2001-01-01', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', 'jW9FGvp8FF6GGcF2E4BelSa1T77Jjj9Pu+Mxv8zORtUheqXzBsib2ES2FsAr/uGK', 'MX+gseNJ+toIPcUwLpd2jA==', '8a3o8er+42WfDCwZ8vUdId77w14pQMJt4w5yqAB8FoQ=', 'Active', '2018-10-12 18:21:39', '2018-10-12 18:21:39'),
(24, 't6niRAaYf1yhyfc8z4yvaw==', 'jkDLSHwFqlb7G3rLLZXIgA==', '0vJcU1eUdAFI3TIeQeN8bQ==', NULL, NULL, '2002-02-02', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', '8VYjU+uzPxcAnvLFBh+eNBsb0VQ46SttEhrXNGikhkI=', 'rOd2F+ZbqqeLvz8BoANDQw==', 'kSl4HMkYSc6Me1cfuAnS/JZjazIRjFmj48g7mHKQw5k=', 'Active', '2018-10-12 18:22:45', '2018-10-12 18:22:45'),
(25, 'XdlpkgNDqQ5xXbStzDL97A==', 'dbb2mGodMyKwSt5BPKplwQ==', 'sBELLXzjRyE5JJRP/NyEBA==', NULL, NULL, '2003-03-03', 'iqysbJE9orzxxosD9/dNLw==', 'Male', 'Single', 'OL2EtiykJjeDE0INl44CFqByP2kYzZaWxwsbsVH2bdU=', '5wjkUeWx+BxLmBfH4+wX0g==', 'qoB60TDn7zvS3/WzdHJgfD01xLxvQdy/6TWEsJ7Kd9A=', 'Active', '2018-10-12 18:23:47', '2018-10-12 18:23:47'),
(26, 'DvV8+8xxWkKxfPtXREQBCw==', '96rg23su9u9YzLmpZNV1IQ==', 't8Nad13WvCaLt5PQMp4b6Q==', NULL, NULL, '2004-04-04', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '8g7l/g7PSvehmoaYJdkQhA+UaiZ0A8PFISZcUiEr3Wc=', 'asz40ggAH3KzJ/xZUIk8mg==', 'yAQqGMGhmCsVuUP2ybDzKJL9yMw9O5ByNGhDm2/ZPoE=', 'Active', '2018-10-12 18:24:50', '2018-10-12 18:24:50'),
(27, 's6JkC2xDfr2FvwumXHrf6w==', 'hTH1Rz889UIRAU/Bby9TDw==', 'msNcFHeLgAOa/W2by2m6lg==', NULL, NULL, '2001-01-01', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', '+EgXDvMU/Msvx32QqFC2c4LWbIAH7bmchUMTUkRSZn8=', 'rSNYh6q1qT3m0lnmbnLZcg==', 'y2moPVpy/a/wA957MRp1Iw08KG3OFYuH1pO/h4Y4F6U=', 'Active', '2018-10-12 18:52:59', '2018-10-12 18:52:59'),
(28, 'omOs5tKRA009zdbcWn3R1Q==', 'jkDLSHwFqlb7G3rLLZXIgA==', '6mu/xC+iA6pul0FRkns9Ow==', NULL, NULL, '2001-01-01', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', 'jW9FGvp8FF6GGcF2E4BelSa1T77Jjj9Pu+Mxv8zORtUheqXzBsib2ES2FsAr/uGK', '2tYM5fkm+VF81YTkcld3pA==', 'UuwGuUeBxno5IqQ0T80kwugV9RUkkamtPVh4ZEbN6Yk=', 'Active', '2018-10-13 03:37:11', '2018-10-13 03:37:11'),
(29, 'Oaa/A854qqvT2P8/htt24g==', 'JS8sIjJwLxt1F+Yi8P/H0g==', 'jkDLSHwFqlb7G3rLLZXIgA==', NULL, NULL, '2001-01-01', 'iqysbJE9orzxxosD9/dNLw==', 'Female', 'Single', 'jW9FGvp8FF6GGcF2E4BelSa1T77Jjj9Pu+Mxv8zORtUheqXzBsib2ES2FsAr/uGK', 'CRCFLA5S5NFA/SK8LuurNA==', '1vMVy0oa+UmMD86YANTuUXeyVVRs+EWEkSnLHgpo+1w=', 'Active', '2018-10-13 03:40:50', '2018-10-13 03:40:50'),
(30, 'yt2Wj7oZIk8colCDC6aKhw==', 'uyRCromTlt0mM0JPmZSLCw==', 'WbFBKd1mvKhrhFBJSGmcAw==', NULL, NULL, '1994-04-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'gtm42XsMJuAEjvbzRDoWN2DrwN4rGqBmgFaD/sTWq6Q=', 'Active', '2018-10-18 21:17:49', '2018-10-18 21:17:49'),
(31, '61kU23Mr5BvJPmAbazznCQ==', 'uyRCromTlt0mM0JPmZSLCw==', 'rXv5NdcsuV6hrxCWgErm0A==', NULL, NULL, '1994-01-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'gtm42XsMJuAEjvbzRDoWN2DrwN4rGqBmgFaD/sTWq6Q=', 'Active', '2018-10-18 22:19:42', '2018-10-18 22:19:42'),
(32, 'YEtxmhwpaUX5E9xNcmL0YA==', 'uyRCromTlt0mM0JPmZSLCw==', 'CK1ST42XWtXYwKep6B039Q==', NULL, NULL, '1994-02-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'gtm42XsMJuAEjvbzRDoWN2DrwN4rGqBmgFaD/sTWq6Q=', 'Active', '2018-10-18 22:42:57', '2018-10-18 22:42:57'),
(33, 'au199qZbaiNWnoMYwjDoEw==', 'uyRCromTlt0mM0JPmZSLCw==', '9d4OxHoND4AcUOttJPlVXA==', NULL, NULL, '1994-01-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'gtm42XsMJuAEjvbzRDoWN2DrwN4rGqBmgFaD/sTWq6Q=', 'Active', '2018-10-18 22:45:18', '2018-10-18 22:45:18'),
(34, '8+yXPU55sKzs583UDRd2jQ==', 'uyRCromTlt0mM0JPmZSLCw==', '2MWFZh8U2WYFr/9BwIEWIA==', NULL, NULL, '1994-02-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'gtm42XsMJuAEjvbzRDoWN2DrwN4rGqBmgFaD/sTWq6Q=', 'Active', '2018-10-19 22:03:56', '2018-10-19 22:03:56');

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
(53, 9, 'Student', 'vUhkbStK1Suay8gSvPR1xA==', 'vUhkbStK1Suay8gSvPR1xA==', 'Active', '2018-10-10 01:57:38', '2018-10-10 01:57:38'),
(54, 10, 'Student', 'X25gHwy8AqQsBIyqq2JPAA==', 'X25gHwy8AqQsBIyqq2JPAA==', 'Active', '2018-10-10 01:57:56', '2018-10-10 01:57:56'),
(55, 11, 'Student', 'GXIl2xL3IN7MrFU908zj5w==', 'GXIl2xL3IN7MrFU908zj5w==', 'Active', '2018-10-10 01:58:14', '2018-10-10 01:58:14'),
(56, 12, 'Student', '0dU1vp1w0nguzDr36v8TaA==', '0dU1vp1w0nguzDr36v8TaA==', 'Active', '2018-10-10 01:58:31', '2018-10-10 01:58:31'),
(57, 13, 'Student', 'C3Xc+Fzy3hRF8TaEOUMU9g==', 'C3Xc+Fzy3hRF8TaEOUMU9g==', 'Active', '2018-10-11 10:14:26', '2018-10-11 10:14:26'),
(58, 14, 'Student', 'V6UgACuQm57ERMO502DN0Q==', 'V6UgACuQm57ERMO502DN0Q==', 'Active', '2018-10-11 22:21:57', '2018-10-11 22:21:57'),
(59, 15, 'Student', '7MT6gqkbVmaTOahbobNAIQ==', '7MT6gqkbVmaTOahbobNAIQ==', 'Active', '2018-10-12 01:54:49', '2018-10-12 01:54:49'),
(60, 16, 'Student', 'fYEycVG2/WAqB0IDjcPlDQ==', 'fYEycVG2/WAqB0IDjcPlDQ==', 'Active', '2018-10-12 04:34:08', '2018-10-12 04:34:08'),
(61, 17, 'Student', 'YmBajRLDeOLuQhQCcb8SXg==', 'YmBajRLDeOLuQhQCcb8SXg==', 'Active', '2018-10-12 04:44:10', '2018-10-12 04:44:10'),
(62, 18, 'Student', 'OdICL0b4JffaA+iN8N2KnQ==', 'OdICL0b4JffaA+iN8N2KnQ==', 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(63, 19, 'Student', 'vUhkbStK1Suay8gSvPR1xA==', 'vUhkbStK1Suay8gSvPR1xA==', 'Active', '2018-10-12 17:45:43', '2018-10-12 17:45:43'),
(64, 20, 'Student', 'X25gHwy8AqQsBIyqq2JPAA==', 'X25gHwy8AqQsBIyqq2JPAA==', 'Active', '2018-10-12 17:46:09', '2018-10-12 17:46:09'),
(65, 21, 'Student', 'GXIl2xL3IN7MrFU908zj5w==', 'GXIl2xL3IN7MrFU908zj5w==', 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(66, 22, 'Student', '0dU1vp1w0nguzDr36v8TaA==', '0dU1vp1w0nguzDr36v8TaA==', 'Active', '2018-10-12 18:25:45', '2018-10-12 18:25:45'),
(67, 23, 'Student', 'C3Xc+Fzy3hRF8TaEOUMU9g==', 'C3Xc+Fzy3hRF8TaEOUMU9g==', 'Active', '2018-10-12 18:26:02', '2018-10-12 18:26:02'),
(68, 24, 'Student', 'V6UgACuQm57ERMO502DN0Q==', 'V6UgACuQm57ERMO502DN0Q==', 'Active', '2018-10-12 18:29:29', '2018-10-12 18:29:29'),
(69, 25, 'Student', '7MT6gqkbVmaTOahbobNAIQ==', '7MT6gqkbVmaTOahbobNAIQ==', 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(70, 26, 'Student', 'fYEycVG2/WAqB0IDjcPlDQ==', 'fYEycVG2/WAqB0IDjcPlDQ==', 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(71, 27, 'Student', 'YmBajRLDeOLuQhQCcb8SXg==', 'YmBajRLDeOLuQhQCcb8SXg==', 'Active', '2018-10-13 04:07:09', '2018-10-13 04:07:09'),
(72, 28, 'Student', 'E/4mAgfiOt02DbLQWEBOAg==', 'E/4mAgfiOt02DbLQWEBOAg==', 'Active', '2018-10-13 04:49:58', '2018-10-13 04:49:58'),
(73, 29, 'Student', 'QvF9ZotlUBrTmbA0roC0KA==', 'QvF9ZotlUBrTmbA0roC0KA==', 'Active', '2018-10-18 22:15:01', '2018-10-18 22:15:01'),
(74, 30, 'Student', '46eJtgDuzv5UPx7CGtYbeA==', '46eJtgDuzv5UPx7CGtYbeA==', 'Active', '2018-10-18 22:20:30', '2018-10-18 22:20:30'),
(75, 31, 'Student', 'KSx/Cpedxd1ekHG2l9xMFw==', 'JNtfrtdpiqXgiVpLPJfyLw==', 'Active', '2018-10-18 22:44:44', '2018-10-18 22:44:44'),
(76, 32, 'Student', 'RzbiqSHKbgbtJa4CiCDDyw==', 'JR8cnjP9RAindTTPm5OH7Q==', 'Active', '2018-10-18 22:46:04', '2018-10-18 22:46:04'),
(77, 19, 'Faculty', 'WOmE44dyTx++N6bEuWy9KA==', 'QibYEh4KZOMIxF17i1g4cQ==', 'Active', '2018-10-19 00:42:59', '2018-10-19 00:42:59'),
(78, 20, 'Faculty', 'Rsuo2KLrs++1tOy9mupTAQ==', 'XWe/c8X/rJVhtHXKO6cIvg==', 'Active', '2018-10-19 00:46:53', '2018-10-19 00:46:53'),
(79, 21, 'Faculty', 'Rb23V7p3NsmrWP8d2jOC6A==', 'cHIrN0AviJqyvbIyXMcttQ==', 'Active', '2018-10-19 00:48:13', '2018-10-19 00:48:13'),
(80, 22, 'Faculty', 'wR/70P9y7SNMf3JGAS2pMQ==', 'egdxIo7wcCwtL5UjKeW3rQ==', 'Active', '2018-10-19 00:49:13', '2018-10-19 00:49:13'),
(81, 23, 'Faculty', '/P2NxZ9hJzopifWchQdJfQ==', 'EmeaDi06iG548U1yy8ehGg==', 'Active', '2018-10-19 00:52:08', '2018-10-19 00:52:08'),
(82, 24, 'Faculty', 'GnIVoGroPIHtsEjPjobMUQ==', 'I2rPBu8ncJDSdKhckfQaEw==', 'Active', '2018-10-19 01:21:21', '2018-10-19 01:21:21'),
(83, 25, 'Faculty', 'zUX06OVdXg7xFZ2cywFnWQ==', 'icn28JiZs7shtzNMJOhoxg==', 'Active', '2018-10-19 01:23:18', '2018-10-19 01:23:18'),
(84, 26, 'Faculty', 'PvuBkwm0cJSpZAiwsuYqiw==', 'fzC7SvwqgyWq503B4Yf9lA==', 'Active', '2018-10-19 01:24:41', '2018-10-19 01:24:41'),
(85, 27, 'Faculty', 'Tnd4KWO9ZQwDWMscFYH23g==', 'pRulmKsnTjPpkh4/sX3DGw==', 'Active', '2018-10-19 01:27:21', '2018-10-19 01:27:21'),
(86, 33, 'Student', '7B19YAGYlK7IyidKfuIHSA==', 'KqhomhJkVNa5eMAFKFiSiw==', 'Active', '2018-10-21 18:08:18', '2018-10-21 18:08:18');

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
(74, 18, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(75, 18, 8, 2, 'LABORATORY (CA)', '100.00', 'Enrollment', 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(76, 18, 8, 2, 'Academic (23 Tuition Unit)', '6900.00', 'Enrollment', 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(77, 19, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 17:45:43', '2018-10-12 17:45:43'),
(78, 19, 8, 2, 'LABORATORY (CA)', '100.00', 'Enrollment', 'Active', '2018-10-12 17:45:43', '2018-10-12 17:45:43'),
(79, 19, 8, 2, 'Academic (23 Tuition Unit)', '6900.00', 'Enrollment', 'Active', '2018-10-12 17:45:43', '2018-10-12 17:45:43'),
(80, 20, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 17:46:09', '2018-10-12 17:46:09'),
(81, 20, 8, 2, 'LABORATORY (CA)', '100.00', 'Enrollment', 'Active', '2018-10-12 17:46:09', '2018-10-12 17:46:09'),
(82, 20, 8, 2, 'Academic (23 Tuition Unit)', '6900.00', 'Enrollment', 'Active', '2018-10-12 17:46:09', '2018-10-12 17:46:09'),
(83, 21, 8, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(84, 21, 8, 2, 'LABORATORY (CA)', '100.00', 'Enrollment', 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(85, 21, 8, 2, 'Academic (23 Tuition Unit)', '6900.00', 'Enrollment', 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(86, 18, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(87, 18, 9, 2, 'Academic (28 Tuition Unit)', '8400.00', 'Enrollment', 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(88, 19, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 18:05:59', '2018-10-12 18:05:59'),
(89, 19, 9, 2, 'Academic (28 Tuition Unit)', '8400.00', 'Enrollment', 'Active', '2018-10-12 18:05:59', '2018-10-12 18:05:59'),
(90, 20, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 18:06:30', '2018-10-12 18:06:30'),
(91, 20, 9, 2, 'Academic (28 Tuition Unit)', '8400.00', 'Enrollment', 'Active', '2018-10-12 18:06:30', '2018-10-12 18:06:30'),
(92, 21, 9, 2, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(93, 21, 9, 2, 'Academic (28 Tuition Unit)', '8400.00', 'Enrollment', 'Active', '2018-10-12 18:06:55', '2018-10-12 18:06:55'),
(94, 22, 8, 1, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-12 18:25:45', '2018-10-12 18:25:45'),
(95, 23, 8, 1, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-12 18:26:02', '2018-10-12 18:26:02'),
(96, 24, 8, 1, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-12 18:29:29', '2018-10-12 18:29:29'),
(97, 25, 8, 1, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(98, 26, 8, 1, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(99, 22, 9, 1, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(100, 23, 9, 1, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(101, 24, 9, 1, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-12 19:46:39', '2018-10-12 19:46:39'),
(102, 25, 9, 1, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-12 19:49:35', '2018-10-12 19:49:35'),
(103, 26, 9, 1, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(104, 22, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 21:52:45', '2018-10-12 21:52:45'),
(105, 22, 8, 5, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-12 21:52:45', '2018-10-12 21:52:45'),
(106, 23, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 21:53:13', '2018-10-12 21:53:13'),
(107, 23, 8, 5, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-12 21:53:13', '2018-10-12 21:53:13'),
(108, 24, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 21:54:33', '2018-10-12 21:54:33'),
(109, 24, 8, 5, 'Academic (14 Tuition Unit)', '4200.00', 'Enrollment', 'Active', '2018-10-12 21:54:33', '2018-10-12 21:54:33'),
(110, 25, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 21:56:41', '2018-10-12 21:56:41'),
(111, 25, 8, 5, 'Academic (14 Tuition Unit)', '4200.00', 'Enrollment', 'Active', '2018-10-12 21:56:41', '2018-10-12 21:56:41'),
(112, 26, 8, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 21:57:11', '2018-10-12 21:57:11'),
(113, 26, 8, 5, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-12 21:57:11', '2018-10-12 21:57:11'),
(114, 22, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:17:16', '2018-10-12 22:17:16'),
(115, 22, 9, 5, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-12 22:17:16', '2018-10-12 22:17:16'),
(116, 23, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:17:43', '2018-10-12 22:17:43'),
(117, 23, 9, 5, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-12 22:17:43', '2018-10-12 22:17:43'),
(118, 24, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:18:17', '2018-10-12 22:18:17'),
(119, 24, 9, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-12 22:18:17', '2018-10-12 22:18:17'),
(120, 25, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:18:37', '2018-10-12 22:18:37'),
(121, 25, 9, 5, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-12 22:18:37', '2018-10-12 22:18:37'),
(122, 26, 9, 5, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:18:58', '2018-10-12 22:18:58'),
(123, 26, 9, 5, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-12 22:18:58', '2018-10-12 22:18:58'),
(124, 22, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:37:23', '2018-10-12 22:37:23'),
(125, 22, 8, 6, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2018-10-12 22:37:23', '2018-10-12 22:37:23'),
(126, 23, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:37:49', '2018-10-12 22:37:49'),
(127, 23, 8, 6, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2018-10-12 22:37:49', '2018-10-12 22:37:49'),
(128, 24, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:38:19', '2018-10-12 22:38:19'),
(129, 24, 8, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-12 22:38:19', '2018-10-12 22:38:19'),
(130, 25, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:38:39', '2018-10-12 22:38:39'),
(131, 25, 8, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-12 22:38:39', '2018-10-12 22:38:39'),
(132, 26, 8, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(133, 26, 8, 6, 'Academic (32 Tuition Unit)', '9600.00', 'Enrollment', 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(134, 22, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:56:40', '2018-10-12 22:56:40'),
(135, 22, 9, 6, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2018-10-12 22:56:40', '2018-10-12 22:56:40'),
(136, 23, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:57:01', '2018-10-12 22:57:01'),
(137, 23, 9, 6, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2018-10-12 22:57:01', '2018-10-12 22:57:01'),
(138, 24, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:57:28', '2018-10-12 22:57:28'),
(139, 24, 9, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-12 22:57:28', '2018-10-12 22:57:28'),
(140, 25, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 22:57:50', '2018-10-12 22:57:50'),
(141, 25, 9, 6, 'Academic (12 Tuition Unit)', '3600.00', 'Enrollment', 'Active', '2018-10-12 22:57:50', '2018-10-12 22:57:50'),
(142, 26, 9, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:02:17', '2018-10-12 23:02:17'),
(143, 26, 9, 6, 'Academic (29 Tuition Unit)', '8700.00', 'Enrollment', 'Active', '2018-10-12 23:02:18', '2018-10-12 23:02:18'),
(144, 22, 10, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:16:27', '2018-10-12 23:16:27'),
(145, 22, 10, 6, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-12 23:16:27', '2018-10-12 23:16:27'),
(146, 23, 10, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:16:43', '2018-10-12 23:16:43'),
(147, 23, 10, 6, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-12 23:16:43', '2018-10-12 23:16:43'),
(148, 26, 10, 6, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:17:01', '2018-10-12 23:17:01'),
(149, 26, 10, 6, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-12 23:17:01', '2018-10-12 23:17:01'),
(150, 22, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:28:31', '2018-10-12 23:28:31'),
(151, 22, 8, 7, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2018-10-12 23:28:31', '2018-10-12 23:28:31'),
(152, 23, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:28:52', '2018-10-12 23:28:52'),
(153, 23, 8, 7, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2018-10-12 23:28:52', '2018-10-12 23:28:52'),
(154, 24, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:29:32', '2018-10-12 23:29:32'),
(155, 24, 8, 7, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-12 23:29:33', '2018-10-12 23:29:33'),
(156, 25, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:29:54', '2018-10-12 23:29:54'),
(157, 25, 8, 7, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-12 23:29:54', '2018-10-12 23:29:54'),
(158, 26, 8, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:30:19', '2018-10-12 23:30:19'),
(159, 26, 8, 7, 'Academic (25 Tuition Unit)', '7500.00', 'Enrollment', 'Active', '2018-10-12 23:30:19', '2018-10-12 23:30:19'),
(160, 22, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:45:10', '2018-10-12 23:45:10'),
(161, 22, 9, 7, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2018-10-12 23:45:10', '2018-10-12 23:45:10'),
(162, 23, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:45:27', '2018-10-12 23:45:27'),
(163, 23, 9, 7, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2018-10-12 23:45:27', '2018-10-12 23:45:27'),
(164, 24, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:45:57', '2018-10-12 23:45:57'),
(165, 24, 9, 7, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2018-10-12 23:45:57', '2018-10-12 23:45:57'),
(166, 25, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:46:15', '2018-10-12 23:46:15'),
(167, 25, 9, 7, 'Academic (2 Tuition Unit)', '600.00', 'Enrollment', 'Active', '2018-10-12 23:46:15', '2018-10-12 23:46:15'),
(168, 26, 9, 7, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-10-12 23:46:34', '2018-10-12 23:46:34'),
(169, 26, 9, 7, 'Academic (9 Tuition Unit)', '2700.00', 'Enrollment', 'Active', '2018-10-12 23:46:34', '2018-10-12 23:46:34'),
(170, 27, 8, 8, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-10-13 04:07:09', '2018-10-13 04:07:09'),
(171, 28, 8, 8, 'Academic (20 Tuition Unit)', '6000.00', 'Enrollment', 'Active', '2018-10-13 04:49:58', '2018-10-13 04:49:58'),
(172, 27, 9, 8, 'Academic (31 Tuition Unit)', '9300.00', 'Enrollment', 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(173, 28, 9, 8, 'Academic (18 Tuition Unit)', '5400.00', 'Enrollment', 'Active', '2018-10-13 05:28:28', '2018-10-13 05:28:28'),
(174, 27, 8, 9, 'Academic (34 Tuition Unit)', '10200.00', 'Enrollment', 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(175, 28, 8, 9, 'Academic (14 Tuition Unit)', '4200.00', 'Enrollment', 'Active', '2018-10-13 06:13:12', '2018-10-13 06:13:12'),
(176, 29, 8, 9, 'Academic (3 Tuition Unit)', '900.00', 'Enrollment', 'Active', '2018-10-18 22:15:01', '2018-10-18 22:15:01'),
(177, 30, 8, 9, 'Academic (3 Tuition Unit)', '900.00', 'Enrollment', 'Active', '2018-10-18 22:20:30', '2018-10-18 22:20:30'),
(178, 31, 8, 9, 'Academic (3 Tuition Unit)', '900.00', 'Enrollment', 'Active', '2018-10-18 22:44:44', '2018-10-18 22:44:44'),
(179, 32, 8, 9, 'Academic (3 Tuition Unit)', '900.00', 'Enrollment', 'Active', '2018-10-18 22:46:04', '2018-10-18 22:46:04'),
(180, 33, 9, 9, 'Academic (5 Tuition Unit)', '1500.00', 'Enrollment', 'Active', '2018-10-21 18:08:18', '2018-10-21 18:08:18'),
(181, 33, 9, 9, 'Registration Fee', '1200.00', 'Enrollment', 'Active', '2018-10-21 18:57:21', '2018-10-21 18:58:01');

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
(1, 22, 7, 9, 'Active', '2018-10-13 03:36:00', '2018-10-13 03:36:00'),
(2, 23, 7, 9, 'Active', '2018-10-13 03:36:00', '2018-10-13 03:36:00'),
(3, 26, 7, 9, 'Active', '2018-10-13 03:36:00', '2018-10-13 03:36:00');

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
(90, 18, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8100.00', '8100.00', NULL, '2018-10-12 17:45:22', '2018-10-12 17:45:22', 'Active'),
(91, 19, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8100.00', '8100.00', NULL, '2018-10-12 17:45:44', '2018-10-12 17:45:44', 'Active'),
(92, 20, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8100.00', '8100.00', NULL, '2018-10-12 17:46:10', '2018-10-12 17:46:10', 'Active'),
(93, 21, 8, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8100.00', '8100.00', NULL, '2018-10-12 17:46:42', '2018-10-12 17:46:42', 'Active'),
(94, 18, 8, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8100.00', '0.00', NULL, '2018-10-12 17:47:31', '2018-10-12 17:47:31', 'Active'),
(95, 19, 8, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8100.00', '0.00', NULL, '2018-10-12 17:47:37', '2018-10-12 17:47:37', 'Active'),
(96, 20, 8, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8100.00', '0.00', NULL, '2018-10-12 17:47:42', '2018-10-12 17:47:42', 'Active'),
(97, 21, 8, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '8100.00', '0.00', NULL, '2018-10-12 17:47:48', '2018-10-12 17:47:48', 'Active'),
(98, 18, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9500.00', NULL, '2018-10-12 18:05:23', '2018-10-12 18:05:23', 'Active'),
(99, 19, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9500.00', NULL, '2018-10-12 18:05:59', '2018-10-12 18:05:59', 'Active'),
(100, 20, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9500.00', NULL, '2018-10-12 18:06:30', '2018-10-12 18:06:30', 'Active'),
(101, 21, 9, 2, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9500.00', NULL, '2018-10-12 18:06:55', '2018-10-12 18:06:55', 'Active'),
(102, 18, 9, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9500.00', '0.00', NULL, '2018-10-12 18:07:25', '2018-10-12 18:07:25', 'Active'),
(103, 19, 9, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9500.00', '0.00', NULL, '2018-10-12 18:07:29', '2018-10-12 18:07:29', 'Active'),
(104, 20, 9, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9500.00', '0.00', NULL, '2018-10-12 18:07:35', '2018-10-12 18:07:35', 'Active'),
(105, 21, 9, 2, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9500.00', '0.00', NULL, '2018-10-12 18:07:40', '2018-10-12 18:07:40', 'Active'),
(106, 22, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7800.00', '7800.00', NULL, '2018-10-12 18:25:46', '2018-10-12 18:25:46', 'Active'),
(107, 23, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7800.00', '7800.00', NULL, '2018-10-12 18:26:03', '2018-10-12 18:26:03', 'Active'),
(108, 24, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '6000.00', '6000.00', NULL, '2018-10-12 18:29:30', '2018-10-12 18:29:30', 'Active'),
(109, 25, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '6000.00', '6000.00', NULL, '2018-10-12 18:29:46', '2018-10-12 18:29:46', 'Active'),
(110, 22, 8, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7800.00', '0.00', NULL, '2018-10-12 18:30:40', '2018-10-12 18:30:40', 'Active'),
(111, 23, 8, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7800.00', '0.00', NULL, '2018-10-12 18:41:27', '2018-10-12 18:41:27', 'Active'),
(112, 24, 8, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6000.00', '0.00', NULL, '2018-10-12 18:41:40', '2018-10-12 18:41:40', 'Active'),
(113, 25, 8, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6000.00', '0.00', NULL, '2018-10-12 18:41:47', '2018-10-12 18:41:47', 'Active'),
(114, 26, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7800.00', '7800.00', NULL, '2018-10-12 18:54:02', '2018-10-12 18:54:02', 'Active'),
(115, 26, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7800.00', '0.00', 2, '2018-10-12 18:54:03', '2018-10-12 18:54:03', 'Active'),
(116, 26, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '7800.00', '-7800.00', 2, '2018-10-12 19:33:22', '2018-10-12 19:33:22', 'Active'),
(117, 22, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9300.00', NULL, '2018-10-12 19:41:48', '2018-10-12 19:41:48', 'Active'),
(118, 23, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9300.00', NULL, '2018-10-12 19:42:31', '2018-10-12 19:42:31', 'Active'),
(119, 24, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5400.00', NULL, '2018-10-12 19:46:39', '2018-10-12 19:46:39', 'Active'),
(120, 25, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5400.00', NULL, '2018-10-12 19:49:35', '2018-10-12 19:49:35', 'Active'),
(121, 26, 9, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '-7800.00', '1500.00', NULL, '2018-10-12 19:50:28', '2018-10-12 19:50:28', 'Active'),
(122, 22, 9, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9300.00', '0.00', NULL, '2018-10-12 19:51:55', '2018-10-12 19:51:55', 'Active'),
(123, 23, 9, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9300.00', '0.00', NULL, '2018-10-12 19:52:01', '2018-10-12 19:52:01', 'Active'),
(124, 24, 9, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '5400.00', '0.00', NULL, '2018-10-12 19:52:10', '2018-10-12 19:52:10', 'Active'),
(125, 25, 9, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '5400.00', '0.00', NULL, '2018-10-12 19:52:15', '2018-10-12 19:52:15', 'Active'),
(126, 26, 9, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1500.00', '0.00', NULL, '2018-10-12 19:52:22', '2018-10-12 19:52:22', 'Active'),
(127, 26, 9, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '9300.00', '-9300.00', 2, '2018-10-12 20:01:34', '2018-10-12 20:01:34', 'Active'),
(128, 22, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2018-10-12 21:52:45', '2018-10-12 21:52:45', 'Active'),
(129, 23, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '11300.00', NULL, '2018-10-12 21:53:13', '2018-10-12 21:53:13', 'Active'),
(130, 24, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5300.00', NULL, '2018-10-12 21:54:33', '2018-10-12 21:54:33', 'Active'),
(131, 25, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5300.00', NULL, '2018-10-12 21:56:41', '2018-10-12 21:56:41', 'Active'),
(132, 26, 8, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-9300.00', '2000.00', NULL, '2018-10-12 21:57:11', '2018-10-12 21:57:11', 'Active'),
(133, 22, 8, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2018-10-12 21:57:50', '2018-10-12 21:57:50', 'Active'),
(134, 23, 8, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '11300.00', '0.00', NULL, '2018-10-12 21:57:58', '2018-10-12 21:57:58', 'Active'),
(135, 24, 8, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '5300.00', '0.00', NULL, '2018-10-12 21:58:10', '2018-10-12 21:58:10', 'Active'),
(136, 25, 8, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '5300.00', '0.00', NULL, '2018-10-12 21:58:17', '2018-10-12 21:58:17', 'Active'),
(137, 26, 8, 5, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '11300.00', '-9300.00', 2, '2018-10-12 21:59:20', '2018-10-12 21:59:20', 'Active'),
(138, 22, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-12 22:17:16', '2018-10-12 22:17:16', 'Active'),
(139, 23, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10400.00', NULL, '2018-10-12 22:17:43', '2018-10-12 22:17:43', 'Active'),
(140, 24, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-12 22:18:17', '2018-10-12 22:18:17', 'Active'),
(141, 25, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-12 22:18:37', '2018-10-12 22:18:37', 'Active'),
(142, 26, 9, 5, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '-9300.00', '1100.00', NULL, '2018-10-12 22:18:58', '2018-10-12 22:18:58', 'Active'),
(143, 22, 9, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-12 22:19:26', '2018-10-12 22:19:26', 'Active'),
(144, 23, 9, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10400.00', '0.00', NULL, '2018-10-12 22:19:32', '2018-10-12 22:19:32', 'Active'),
(145, 24, 9, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-12 22:19:42', '2018-10-12 22:19:42', 'Active'),
(146, 25, 9, 5, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-12 22:19:48', '2018-10-12 22:19:48', 'Active'),
(147, 26, 9, 5, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-9300.00', 2, '2018-10-12 22:20:49', '2018-10-12 22:20:49', 'Active'),
(148, 26, 9, 5, 'Second Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10400.00', '-19700.00', 2, '2018-10-12 22:20:50', '2018-10-12 22:20:50', 'Active'),
(149, 22, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10700.00', NULL, '2018-10-12 22:37:23', '2018-10-12 22:37:23', 'Active'),
(150, 23, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10700.00', NULL, '2018-10-12 22:37:49', '2018-10-12 22:37:49', 'Active'),
(151, 24, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-12 22:38:19', '2018-10-12 22:38:19', 'Active'),
(152, 25, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-12 22:38:39', '2018-10-12 22:38:39', 'Active'),
(153, 26, 8, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-19700.00', '-9000.00', NULL, '2018-10-12 22:39:18', '2018-10-12 22:39:18', 'Active'),
(154, 22, 8, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '10700.00', '0.00', NULL, '2018-10-12 22:39:50', '2018-10-12 22:39:50', 'Active'),
(155, 23, 8, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '10700.00', '0.00', NULL, '2018-10-12 22:39:57', '2018-10-12 22:39:57', 'Active'),
(156, 24, 8, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-12 22:40:06', '2018-10-12 22:40:06', 'Active'),
(157, 25, 8, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-12 22:40:12', '2018-10-12 22:40:12', 'Active'),
(158, 26, 8, 6, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '10700.00', '-19700.00', 2, '2018-10-12 22:40:37', '2018-10-12 22:40:37', 'Active'),
(159, 22, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9800.00', NULL, '2018-10-12 22:56:40', '2018-10-12 22:56:40', 'Active'),
(160, 23, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9800.00', NULL, '2018-10-12 22:57:01', '2018-10-12 22:57:01', 'Active'),
(161, 24, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-12 22:57:28', '2018-10-12 22:57:28', 'Active'),
(162, 25, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4700.00', NULL, '2018-10-12 22:57:50', '2018-10-12 22:57:50', 'Active'),
(163, 26, 9, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-19700.00', '-9900.00', NULL, '2018-10-12 23:02:18', '2018-10-12 23:02:18', 'Active'),
(164, 22, 10, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '9800.00', '12400.00', NULL, '2018-10-12 23:16:27', '2018-10-12 23:16:27', 'Active'),
(165, 23, 10, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '9800.00', '12400.00', NULL, '2018-10-12 23:16:44', '2018-10-12 23:16:44', 'Active'),
(166, 26, 10, 6, 'Third Year', 'TOTAL AMOUNT DUE', 'Assessment', '-9900.00', '-7300.00', NULL, '2018-10-12 23:17:01', '2018-10-12 23:17:01', 'Active'),
(167, 22, 10, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '12400.00', '0.00', NULL, '2018-10-12 23:19:05', '2018-10-12 23:19:05', 'Active'),
(168, 23, 10, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '12400.00', '0.00', NULL, '2018-10-12 23:19:11', '2018-10-12 23:19:11', 'Active'),
(169, 24, 10, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-12 23:19:22', '2018-10-12 23:19:22', 'Active'),
(170, 25, 10, 6, 'Third Year', 'CASH - UPON ENROLLMENT', 'Payment', '4700.00', '0.00', NULL, '2018-10-12 23:19:29', '2018-10-12 23:19:29', 'Active'),
(171, 26, 10, 6, 'Third Year', 'SCHOLARSHIP PAYMENT', 'Payment', '2600.00', '-9900.00', 2, '2018-10-12 23:19:53', '2018-10-12 23:19:53', 'Active'),
(172, 22, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '8600.00', NULL, '2018-10-12 23:28:31', '2018-10-12 23:28:31', 'Active'),
(173, 23, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '8600.00', NULL, '2018-10-12 23:28:52', '2018-10-12 23:28:52', 'Active'),
(174, 24, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-12 23:29:33', '2018-10-12 23:29:33', 'Active'),
(175, 25, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '6500.00', NULL, '2018-10-12 23:29:54', '2018-10-12 23:29:54', 'Active'),
(176, 26, 8, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-9900.00', '-1300.00', NULL, '2018-10-12 23:30:19', '2018-10-12 23:30:19', 'Active'),
(177, 22, 8, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '8600.00', '0.00', NULL, '2018-10-12 23:30:42', '2018-10-12 23:30:42', 'Active'),
(178, 23, 8, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '8600.00', '0.00', NULL, '2018-10-12 23:30:48', '2018-10-12 23:30:48', 'Active'),
(179, 24, 8, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-12 23:30:56', '2018-10-12 23:30:56', 'Active'),
(180, 25, 8, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '6500.00', '0.00', NULL, '2018-10-12 23:31:03', '2018-10-12 23:31:03', 'Active'),
(181, 22, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3800.00', NULL, '2018-10-12 23:45:10', '2018-10-12 23:45:10', 'Active'),
(182, 23, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '3800.00', NULL, '2018-10-12 23:45:27', '2018-10-12 23:45:27', 'Active'),
(183, 24, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '1700.00', NULL, '2018-10-12 23:45:57', '2018-10-12 23:45:57', 'Active'),
(184, 25, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '1700.00', NULL, '2018-10-12 23:46:15', '2018-10-12 23:46:15', 'Active'),
(185, 26, 9, 7, 'Fourth Year', 'TOTAL AMOUNT DUE', 'Assessment', '-1300.00', '2500.00', NULL, '2018-10-12 23:46:34', '2018-10-12 23:46:34', 'Active'),
(186, 22, 9, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '3800.00', '0.00', NULL, '2018-10-12 23:47:09', '2018-10-12 23:47:09', 'Active'),
(187, 23, 9, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '3800.00', '0.00', NULL, '2018-10-12 23:47:14', '2018-10-12 23:47:14', 'Active'),
(188, 24, 9, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '1700.00', '0.00', NULL, '2018-10-12 23:47:24', '2018-10-12 23:47:24', 'Active'),
(189, 25, 9, 7, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '1700.00', '0.00', NULL, '2018-10-12 23:47:31', '2018-10-12 23:47:31', 'Active'),
(190, 26, 9, 7, 'Fourth Year', 'SCHOLARSHIP PAYMENT', 'Payment', '3800.00', '-1300.00', 2, '2018-10-12 23:47:54', '2018-10-12 23:47:54', 'Active'),
(191, 27, 8, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '7800.00', '7800.00', NULL, '2018-10-13 04:07:10', '2018-10-13 04:07:10', 'Active'),
(192, 28, 8, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '6000.00', '6000.00', NULL, '2018-10-13 04:49:59', '2018-10-13 04:49:59', 'Active'),
(193, 27, 8, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7800.00', '0.00', NULL, '2018-10-13 04:50:30', '2018-10-13 04:50:30', 'Active'),
(194, 28, 8, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '6000.00', '0.00', NULL, '2018-10-13 04:50:38', '2018-10-13 04:50:38', 'Active'),
(195, 27, 9, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '9300.00', NULL, '2018-10-13 05:27:45', '2018-10-13 05:27:45', 'Active'),
(196, 28, 9, 8, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '5400.00', NULL, '2018-10-13 05:28:28', '2018-10-13 05:28:28', 'Active'),
(197, 27, 9, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9300.00', '0.00', NULL, '2018-10-13 05:28:55', '2018-10-13 05:28:55', 'Active'),
(198, 28, 9, 8, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '5400.00', '0.00', NULL, '2018-10-13 05:29:04', '2018-10-13 05:29:04', 'Active'),
(199, 27, 8, 9, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '10200.00', NULL, '2018-10-13 06:03:48', '2018-10-13 06:03:48', 'Active'),
(200, 28, 8, 9, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '0.00', '4200.00', NULL, '2018-10-13 06:13:12', '2018-10-13 06:13:12', 'Active'),
(201, 27, 8, 9, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '10200.00', '0.00', NULL, '2018-10-13 06:13:38', '2018-10-13 06:13:38', 'Active'),
(202, 28, 8, 9, 'Second Year', 'CASH - UPON ENROLLMENT', 'Payment', '4200.00', '0.00', NULL, '2018-10-13 06:13:46', '2018-10-13 06:13:46', 'Active'),
(203, 26, 8, 9, 'Fourth Year', 'OFFSET', 'Assessment', '-1300.00', '0.00', NULL, '2018-10-13 09:54:37', '2018-10-13 09:54:37', 'Active'),
(204, 28, 8, 9, 'Second Year', 'TOTAL AMOUNT DUE', 'Assessment', '900.00', '900.00', NULL, '2018-10-18 22:11:02', '2018-10-18 22:11:02', 'Active'),
(205, 29, 8, 9, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '900.00', '900.00', NULL, '2018-10-18 22:15:02', '2018-10-18 22:15:02', 'Active'),
(206, 30, 8, 9, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '900.00', '900.00', NULL, '2018-10-18 22:20:30', '2018-10-18 22:20:30', 'Active'),
(207, 31, 8, 9, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '900.00', '900.00', NULL, '2018-10-18 22:44:45', '2018-10-18 22:44:45', 'Active'),
(208, 32, 8, 9, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '900.00', '900.00', NULL, '2018-10-18 22:46:04', '2018-10-18 22:46:04', 'Active'),
(209, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '100.00', '-100.00', NULL, '2018-10-21 15:37:29', '2018-10-21 15:37:29', 'Active'),
(210, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '520.00', '-620.00', NULL, '2018-10-21 16:00:18', '2018-10-21 16:00:18', 'Active'),
(211, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '130.00', '-750.00', NULL, '2018-10-21 16:01:31', '2018-10-21 16:01:31', 'Active'),
(212, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-760.00', NULL, '2018-10-21 17:35:30', '2018-10-21 17:35:30', 'Active'),
(213, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-770.00', NULL, '2018-10-21 17:48:18', '2018-10-21 17:48:18', 'Active'),
(214, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-780.00', NULL, '2018-10-21 17:56:52', '2018-10-21 17:56:52', 'Active'),
(215, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '-800.00', NULL, '2018-10-21 17:57:02', '2018-10-21 17:57:02', 'Active'),
(216, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-801.00', NULL, '2018-10-21 18:02:30', '2018-10-21 18:02:30', 'Active'),
(217, 33, 9, 9, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '1500.00', '1500.00', NULL, '2018-10-21 18:08:18', '2018-10-21 18:08:18', 'Active'),
(218, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-811.00', NULL, '2018-10-21 18:38:35', '2018-10-21 18:38:35', 'Active'),
(219, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '4.00', '-815.00', NULL, '2018-10-21 18:39:18', '2018-10-21 18:39:18', 'Active'),
(220, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '5.00', '-820.00', NULL, '2018-10-21 18:41:00', '2018-10-21 18:41:00', 'Active'),
(221, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '1490.00', NULL, '2018-10-21 18:41:49', '2018-10-21 18:41:49', 'Active'),
(222, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '1470.00', NULL, '2018-10-21 18:44:17', '2018-10-21 18:44:17', 'Active'),
(223, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '1450.00', NULL, '2018-10-21 18:45:24', '2018-10-21 18:45:24', 'Active'),
(224, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '50.00', '1400.00', NULL, '2018-10-21 18:45:55', '2018-10-21 18:45:55', 'Active'),
(225, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '1380.00', NULL, '2018-10-21 18:46:12', '2018-10-21 18:46:12', 'Active'),
(226, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '1360.00', NULL, '2018-10-21 18:46:42', '2018-10-21 18:46:42', 'Active'),
(227, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '1350.00', NULL, '2018-10-21 18:47:15', '2018-10-21 18:47:15', 'Active'),
(228, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '1340.00', NULL, '2018-10-21 18:47:37', '2018-10-21 18:47:37', 'Active'),
(229, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '1330.00', NULL, '2018-10-21 18:47:53', '2018-10-21 18:47:53', 'Active'),
(230, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '30.00', '1300.00', NULL, '2018-10-21 18:49:25', '2018-10-21 18:49:25', 'Active'),
(231, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '1290.00', NULL, '2018-10-21 18:50:01', '2018-10-21 18:50:01', 'Active'),
(232, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '1270.00', NULL, '2018-10-21 18:50:22', '2018-10-21 18:50:22', 'Active'),
(233, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '30.00', '1240.00', NULL, '2018-10-21 18:51:05', '2018-10-21 18:51:05', 'Active'),
(234, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '1220.00', NULL, '2018-10-21 18:52:25', '2018-10-21 18:52:25', 'Active'),
(235, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '1200.00', NULL, '2018-10-21 18:53:05', '2018-10-21 18:53:05', 'Active'),
(236, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '203.00', '997.00', NULL, '2018-10-21 18:55:30', '2018-10-21 18:55:30', 'Active'),
(237, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '7.00', '990.00', NULL, '2018-10-21 18:57:36', '2018-10-21 18:57:36', 'Active'),
(238, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '989.00', NULL, '2018-10-21 18:58:35', '2018-10-21 18:58:35', 'Active'),
(239, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '89.00', '900.00', NULL, '2018-10-21 18:59:06', '2018-10-21 18:59:06', 'Active'),
(240, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '9.00', '891.00', NULL, '2018-10-21 18:59:45', '2018-10-21 18:59:45', 'Active'),
(241, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '890.00', NULL, '2018-10-21 19:00:06', '2018-10-21 19:00:06', 'Active'),
(242, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '880.00', NULL, '2018-10-21 19:00:20', '2018-10-21 19:00:20', 'Active'),
(243, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '870.00', NULL, '2018-10-21 19:00:33', '2018-10-21 19:00:33', 'Active'),
(244, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '860.00', NULL, '2018-10-21 19:00:46', '2018-10-21 19:00:46', 'Active'),
(245, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '850.00', NULL, '2018-10-21 19:02:28', '2018-10-21 19:02:28', 'Active'),
(246, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '840.00', NULL, '2018-10-21 19:03:01', '2018-10-21 19:03:01', 'Active'),
(247, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '830.00', NULL, '2018-10-21 19:03:15', '2018-10-21 19:03:15', 'Active'),
(248, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '820.00', NULL, '2018-10-21 19:03:32', '2018-10-21 19:03:32', 'Active'),
(249, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '810.00', NULL, '2018-10-21 19:04:02', '2018-10-21 19:04:02', 'Active'),
(250, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '800.00', NULL, '2018-10-21 19:04:31', '2018-10-21 19:04:31', 'Active'),
(251, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '790.00', NULL, '2018-10-21 19:05:37', '2018-10-21 19:05:37', 'Active'),
(252, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '780.00', NULL, '2018-10-21 19:09:23', '2018-10-21 19:09:23', 'Active'),
(253, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '770.00', NULL, '2018-10-21 19:10:13', '2018-10-21 19:10:13', 'Active'),
(254, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '760.00', NULL, '2018-10-21 19:10:47', '2018-10-21 19:10:47', 'Active'),
(255, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '750.00', NULL, '2018-10-21 19:11:37', '2018-10-21 19:11:37', 'Active'),
(256, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '740.00', NULL, '2018-10-21 19:12:16', '2018-10-21 19:12:16', 'Active'),
(257, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '730.00', NULL, '2018-10-21 19:13:20', '2018-10-21 19:13:20', 'Active'),
(258, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '720.00', NULL, '2018-10-21 19:23:19', '2018-10-21 19:23:19', 'Active'),
(259, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '700.00', NULL, '2018-10-21 19:24:12', '2018-10-21 19:24:12', 'Active'),
(260, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '699.00', NULL, '2018-10-21 19:24:42', '2018-10-21 19:24:42', 'Active'),
(261, 33, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '689.00', NULL, '2018-10-21 19:25:29', '2018-10-21 19:25:29', 'Active'),
(262, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-820.00', '0.00', NULL, '2018-10-21 20:21:12', '2018-10-21 20:21:12', 'Active'),
(263, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-1.00', NULL, '2018-10-21 20:21:44', '2018-10-21 20:21:44', 'Active'),
(264, 19, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '2.00', '-2.00', NULL, '2018-10-21 20:23:26', '2018-10-21 20:23:26', 'Active'),
(265, 20, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '2.00', '-2.00', NULL, '2018-10-21 20:23:32', '2018-10-21 20:23:32', 'Active'),
(266, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-1.00', '0.00', NULL, '2018-10-21 20:26:45', '2018-10-21 20:26:45', 'Active'),
(267, 19, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-2.00', '0.00', NULL, '2018-10-21 20:27:09', '2018-10-21 20:27:09', 'Active'),
(268, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 20:27:24', '2018-10-21 20:27:24', 'Active'),
(269, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 20:29:09', '2018-10-21 20:29:09', 'Active'),
(270, 20, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-2.00', '0.00', NULL, '2018-10-21 20:31:49', '2018-10-21 20:31:49', 'Active'),
(271, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 20:32:51', '2018-10-21 20:32:51', 'Active'),
(272, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 20:32:56', '2018-10-21 20:32:56', 'Active'),
(273, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-1.00', NULL, '2018-10-21 20:35:56', '2018-10-21 20:35:56', 'Active'),
(274, 19, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-1.00', NULL, '2018-10-21 20:36:04', '2018-10-21 20:36:04', 'Active'),
(275, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-1.00', '0.00', NULL, '2018-10-21 20:36:08', '2018-10-21 20:36:08', 'Active'),
(276, 19, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-1.00', '0.00', NULL, '2018-10-21 20:55:20', '2018-10-21 20:55:20', 'Active'),
(277, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-1.00', NULL, '2018-10-21 20:55:55', '2018-10-21 20:55:55', 'Active'),
(278, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-1.00', '0.00', NULL, '2018-10-21 20:56:02', '2018-10-21 20:56:02', 'Active'),
(279, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-1.00', NULL, '2018-10-21 20:57:44', '2018-10-21 20:57:44', 'Active'),
(280, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-1.00', '0.00', NULL, '2018-10-21 20:57:50', '2018-10-21 20:57:50', 'Active'),
(281, 21, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-1.00', NULL, '2018-10-21 21:00:43', '2018-10-21 21:00:43', 'Active'),
(282, 21, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-1.00', '0.00', NULL, '2018-10-21 21:01:36', '2018-10-21 21:01:36', 'Active'),
(283, 22, 9, 9, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-1.00', NULL, '2018-10-21 21:02:48', '2018-10-21 21:02:48', 'Active'),
(284, 22, 9, 9, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-2.00', NULL, '2018-10-21 21:02:48', '2018-10-21 21:02:48', 'Active'),
(285, 22, 9, 9, 'Fourth Year', 'OFFSET', 'Assessment', '-2.00', '0.00', NULL, '2018-10-21 21:02:55', '2018-10-21 21:02:55', 'Active'),
(286, 22, 9, 9, 'Fourth Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-1.00', NULL, '2018-10-21 21:05:03', '2018-10-21 21:05:03', 'Active'),
(287, 22, 9, 9, 'Fourth Year', 'OFFSET', 'Assessment', '-1.00', '0.00', NULL, '2018-10-21 21:05:08', '2018-10-21 21:05:08', 'Active'),
(288, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 21:06:21', '2018-10-21 21:06:21', 'Active'),
(289, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 21:06:26', '2018-10-21 21:06:26', 'Active'),
(290, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1.00', '-1.00', NULL, '2018-10-21 21:07:49', '2018-10-21 21:07:49', 'Active'),
(291, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-1.00', '0.00', NULL, '2018-10-21 21:07:53', '2018-10-21 21:07:53', 'Active'),
(292, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '20.00', '-20.00', NULL, '2018-10-21 21:08:49', '2018-10-21 21:08:49', 'Active'),
(293, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-20.00', '0.00', NULL, '2018-10-21 21:08:53', '2018-10-21 21:08:53', 'Active'),
(294, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 21:09:20', '2018-10-21 21:09:20', 'Active'),
(295, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 21:09:25', '2018-10-21 21:09:25', 'Active'),
(296, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '1000.00', '-1000.00', NULL, '2018-10-21 21:09:48', '2018-10-21 21:09:48', 'Active'),
(297, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-1000.00', '0.00', NULL, '2018-10-21 21:09:54', '2018-10-21 21:09:54', 'Active'),
(298, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 21:11:38', '2018-10-21 21:11:38', 'Active'),
(299, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 21:11:42', '2018-10-21 21:11:42', 'Active'),
(300, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 21:15:54', '2018-10-21 21:15:54', 'Active'),
(301, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 21:15:58', '2018-10-21 21:15:58', 'Active'),
(302, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 21:16:49', '2018-10-21 21:16:49', 'Active'),
(303, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 21:16:53', '2018-10-21 21:16:53', 'Active'),
(304, 18, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 21:20:25', '2018-10-21 21:20:25', 'Active'),
(305, 18, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 21:20:30', '2018-10-21 21:20:30', 'Active'),
(306, 19, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 21:21:25', '2018-10-21 21:21:25', 'Active'),
(307, 19, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 21:21:30', '2018-10-21 21:21:30', 'Active'),
(308, 19, 9, 9, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '10.00', '-10.00', NULL, '2018-10-21 21:22:31', '2018-10-21 21:22:31', 'Active'),
(309, 19, 9, 9, 'First Year', 'OFFSET', 'Assessment', '-10.00', '0.00', NULL, '2018-10-21 21:22:36', '2018-10-21 21:22:36', 'Active');

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
(18, 18, '0.00', 'Active', '2018-10-12 17:45:21', '2018-10-21 21:20:30'),
(19, 19, '0.00', 'Active', '2018-10-12 17:45:43', '2018-10-21 21:22:36'),
(20, 20, '0.00', 'Active', '2018-10-12 17:46:09', '2018-10-21 20:31:49'),
(21, 21, '0.00', 'Active', '2018-10-12 17:46:41', '2018-10-21 21:01:36'),
(22, 22, '0.00', 'Active', '2018-10-12 18:25:45', '2018-10-21 21:05:08'),
(23, 23, '0.00', 'Active', '2018-10-12 18:26:03', '2018-10-12 23:47:14'),
(24, 24, '0.00', 'Active', '2018-10-12 18:29:29', '2018-10-12 23:47:24'),
(25, 25, '0.00', 'Active', '2018-10-12 18:29:46', '2018-10-12 23:47:31'),
(26, 26, '0.00', 'Active', '2018-10-12 18:54:02', '2018-10-13 09:54:36'),
(27, 27, '0.00', 'Active', '2018-10-13 04:07:09', '2018-10-13 06:13:37'),
(28, 28, '0.00', 'Active', '2018-10-13 04:49:58', '2018-10-13 06:13:46'),
(29, 29, '900.00', 'Active', '2018-10-18 22:15:01', '2018-10-18 22:15:01'),
(30, 30, '900.00', 'Active', '2018-10-18 22:20:30', '2018-10-18 22:20:30'),
(31, 31, '900.00', 'Active', '2018-10-18 22:44:44', '2018-10-18 22:44:44'),
(32, 32, '900.00', 'Active', '2018-10-18 22:46:04', '2018-10-18 22:46:04'),
(33, 33, '689.00', 'Active', '2018-10-21 18:08:18', '2018-10-21 19:25:29');

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
(1, 18, '2018-00001-PA', 9, 9, '520.00', '-620.00', 'Payment', 'Active', '2018-10-21 16:00:42', '2018-10-21 16:01:19'),
(2, 18, '2018-00002-PA', 9, 9, '130.00', '-750.00', 'Payment', 'Active', '2018-10-21 16:01:31', '2018-10-21 16:01:31'),
(3, 18, '2018-00003-PA', 9, 9, '10.00', '-760.00', 'Payment', 'Active', '2018-10-21 17:35:30', '2018-10-21 17:35:30'),
(4, 18, '2018-00004-PA', 9, 9, '10.00', '-770.00', 'Payment', 'Active', '2018-10-21 17:48:18', '2018-10-21 17:48:18'),
(5, 18, '2018-00005-PA', 9, 9, '10.00', '-780.00', 'Payment', 'Active', '2018-10-21 17:56:52', '2018-10-21 17:56:52'),
(6, 18, '2018-00006-PA', 9, 9, '20.00', '-800.00', 'Payment', 'Active', '2018-10-21 17:57:02', '2018-10-21 17:57:02'),
(7, 18, '2018-00007-PA', 9, 9, '1.00', '-801.00', 'Payment', 'Active', '2018-10-21 18:02:30', '2018-10-21 18:02:30'),
(8, 18, '2018-00008-PA', 9, 9, '10.00', '-811.00', 'Payment', 'Active', '2018-10-21 18:38:35', '2018-10-21 18:38:35'),
(9, 18, '2018-00009-PA', 9, 9, '4.00', '-815.00', 'Payment', 'Active', '2018-10-21 18:39:18', '2018-10-21 18:39:18'),
(10, 18, '2018-00010-PA', 9, 9, '5.00', '-820.00', 'Payment', 'Active', '2018-10-21 18:41:00', '2018-10-21 18:41:00'),
(11, 33, '2018-00011-PA', 9, 9, '10.00', '1490.00', 'Payment', 'Active', '2018-10-21 18:41:49', '2018-10-21 18:41:49'),
(12, 33, '2018-00012-PA', 9, 9, '20.00', '1470.00', 'Payment', 'Active', '2018-10-21 18:44:17', '2018-10-21 18:44:17'),
(13, 33, '2018-00013-PA', 9, 9, '20.00', '1450.00', 'Payment', 'Active', '2018-10-21 18:45:24', '2018-10-21 18:45:24'),
(14, 33, '2018-00014-PA', 9, 9, '50.00', '1400.00', 'Payment', 'Active', '2018-10-21 18:45:55', '2018-10-21 18:45:55'),
(15, 33, '2018-00015-PA', 9, 9, '20.00', '1380.00', 'Payment', 'Active', '2018-10-21 18:46:12', '2018-10-21 18:46:12'),
(16, 33, '2018-00016-PA', 9, 9, '20.00', '1360.00', 'Payment', 'Active', '2018-10-21 18:46:42', '2018-10-21 18:46:42'),
(17, 33, '2018-00017-PA', 9, 9, '10.00', '1350.00', 'Payment', 'Active', '2018-10-21 18:47:15', '2018-10-21 18:47:15'),
(18, 33, '2018-00018-PA', 9, 9, '10.00', '1340.00', 'Payment', 'Active', '2018-10-21 18:47:37', '2018-10-21 18:47:37'),
(19, 33, '2018-00019-PA', 9, 9, '10.00', '1330.00', 'Payment', 'Active', '2018-10-21 18:47:53', '2018-10-21 18:47:53'),
(20, 33, '2018-00020-PA', 9, 9, '30.00', '1300.00', 'Payment', 'Active', '2018-10-21 18:49:25', '2018-10-21 18:49:25'),
(21, 33, '2018-00021-PA', 9, 9, '10.00', '1290.00', 'Payment', 'Active', '2018-10-21 18:50:01', '2018-10-21 18:50:01'),
(22, 33, '2018-00022-PA', 9, 9, '20.00', '1270.00', 'Payment', 'Active', '2018-10-21 18:50:23', '2018-10-21 18:50:23'),
(23, 33, '2018-00023-PA', 9, 9, '30.00', '1240.00', 'Payment', 'Active', '2018-10-21 18:51:05', '2018-10-21 18:51:05'),
(24, 33, '2018-00024-PA', 9, 9, '20.00', '1220.00', 'Payment', 'Active', '2018-10-21 18:52:25', '2018-10-21 18:52:25'),
(25, 33, '2018-00025-PA', 9, 9, '20.00', '1200.00', 'Payment', 'Active', '2018-10-21 18:53:05', '2018-10-21 18:53:05'),
(26, 33, '2018-00026-PA', 9, 9, '203.00', '997.00', 'Payment', 'Active', '2018-10-21 18:55:30', '2018-10-21 18:55:30'),
(27, 33, '2018-00027-PA', 9, 9, '7.00', '990.00', 'Payment', 'Active', '2018-10-21 18:57:36', '2018-10-21 18:57:36'),
(28, 33, '2018-00028-PA', 9, 9, '1.00', '989.00', 'Payment', 'Active', '2018-10-21 18:58:35', '2018-10-21 18:58:35'),
(29, 33, '2018-00029-PA', 9, 9, '89.00', '900.00', 'Payment', 'Active', '2018-10-21 18:59:06', '2018-10-21 18:59:06'),
(30, 33, '2018-00030-PA', 9, 9, '9.00', '891.00', 'Payment', 'Active', '2018-10-21 18:59:45', '2018-10-21 18:59:45'),
(31, 33, '2018-00031-PA', 9, 9, '1.00', '890.00', 'Payment', 'Active', '2018-10-21 19:00:06', '2018-10-21 19:00:06'),
(32, 33, '2018-00032-PA', 9, 9, '10.00', '880.00', 'Payment', 'Active', '2018-10-21 19:00:20', '2018-10-21 19:00:20'),
(33, 33, '2018-00033-PA', 9, 9, '10.00', '870.00', 'Payment', 'Active', '2018-10-21 19:00:33', '2018-10-21 19:00:33'),
(34, 33, '2018-00034-PA', 9, 9, '10.00', '860.00', 'Payment', 'Active', '2018-10-21 19:00:46', '2018-10-21 19:00:46'),
(35, 33, '2018-00035-PA', 9, 9, '10.00', '850.00', 'Payment', 'Active', '2018-10-21 19:02:28', '2018-10-21 19:02:28'),
(36, 33, '2018-00036-PA', 9, 9, '10.00', '840.00', 'Payment', 'Active', '2018-10-21 19:03:01', '2018-10-21 19:03:01'),
(37, 33, '2018-00037-PA', 9, 9, '10.00', '830.00', 'Payment', 'Active', '2018-10-21 19:03:15', '2018-10-21 19:03:15'),
(38, 33, '2018-00038-PA', 9, 9, '10.00', '820.00', 'Payment', 'Active', '2018-10-21 19:03:32', '2018-10-21 19:03:32'),
(39, 33, '2018-00039-PA', 9, 9, '10.00', '810.00', 'Payment', 'Active', '2018-10-21 19:04:03', '2018-10-21 19:04:03'),
(40, 33, '2018-00040-PA', 9, 9, '10.00', '800.00', 'Payment', 'Active', '2018-10-21 19:04:31', '2018-10-21 19:04:31'),
(41, 33, '2018-00041-PA', 9, 9, '10.00', '790.00', 'Payment', 'Active', '2018-10-21 19:05:37', '2018-10-21 19:05:37'),
(42, 33, '2018-00042-PA', 9, 9, '10.00', '780.00', 'Payment', 'Active', '2018-10-21 19:09:23', '2018-10-21 19:09:23'),
(43, 33, '2018-00043-PA', 9, 9, '10.00', '770.00', 'Payment', 'Active', '2018-10-21 19:10:13', '2018-10-21 19:10:13'),
(44, 33, '2018-00044-PA', 9, 9, '10.00', '760.00', 'Payment', 'Active', '2018-10-21 19:10:47', '2018-10-21 19:10:47'),
(45, 33, '2018-00045-PA', 9, 9, '10.00', '750.00', 'Payment', 'Active', '2018-10-21 19:11:37', '2018-10-21 19:11:37'),
(46, 33, '2018-00046-PA', 9, 9, '10.00', '740.00', 'Payment', 'Active', '2018-10-21 19:12:16', '2018-10-21 19:12:16'),
(47, 33, '2018-00047-PA', 9, 9, '10.00', '730.00', 'Payment', 'Active', '2018-10-21 19:13:20', '2018-10-21 19:13:20'),
(48, 33, '2018-00048-PA', 9, 9, '10.00', '720.00', 'Payment', 'Active', '2018-10-21 19:23:19', '2018-10-21 19:23:19'),
(49, 33, '2018-00049-PA', 9, 9, '20.00', '700.00', 'Payment', 'Active', '2018-10-21 19:24:12', '2018-10-21 19:24:12'),
(50, 33, '2018-00050-PA', 9, 9, '1.00', '699.00', 'Payment', 'Active', '2018-10-21 19:24:42', '2018-10-21 19:24:42'),
(51, 33, '2018-00051-PA', 9, 9, '10.00', '689.00', 'Payment', 'Active', '2018-10-21 19:25:29', '2018-10-21 19:25:29'),
(52, 18, '2018-00001-OF', 9, 9, '-820.00', '0.00', 'Offset', 'Active', '2018-10-21 20:21:12', '2018-10-21 20:21:12'),
(53, 18, '2018-00052-PA', 9, 9, '1.00', '-1.00', 'Payment', 'Active', '2018-10-21 20:21:44', '2018-10-21 20:21:44'),
(54, 19, '2018-00053-PA', 9, 9, '2.00', '-2.00', 'Payment', 'Active', '2018-10-21 20:23:26', '2018-10-21 20:23:26'),
(55, 20, '2018-00054-PA', 9, 9, '2.00', '-2.00', 'Payment', 'Active', '2018-10-21 20:23:32', '2018-10-21 20:23:32'),
(56, 18, '2018-00002-OF', 9, 9, '-1.00', '0.00', 'Offset', 'Active', '2018-10-21 20:26:45', '2018-10-21 20:26:45'),
(57, 19, '2018-00003-OF', 9, 9, '-2.00', '0.00', 'Offset', 'Active', '2018-10-21 20:27:09', '2018-10-21 20:27:09'),
(58, 18, '2018-00055-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 20:27:24', '2018-10-21 20:27:24'),
(59, 18, '2018-00004-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 20:29:09', '2018-10-21 20:29:09'),
(60, 20, '2018-00005-OF', 9, 9, '-2.00', '0.00', 'Offset', 'Active', '2018-10-21 20:31:49', '2018-10-21 20:31:49'),
(61, 18, '2018-00056-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 20:32:51', '2018-10-21 20:32:51'),
(62, 18, '2018-00006-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 20:32:56', '2018-10-21 20:32:56'),
(63, 18, '2018-00057-PA', 9, 9, '1.00', '-1.00', 'Payment', 'Active', '2018-10-21 20:35:56', '2018-10-21 20:35:56'),
(64, 19, '2018-00058-PA', 9, 9, '1.00', '-1.00', 'Payment', 'Active', '2018-10-21 20:36:04', '2018-10-21 20:36:04'),
(65, 18, '2018-00007-OF', 9, 9, '-1.00', '0.00', 'Offset', 'Active', '2018-10-21 20:36:08', '2018-10-21 20:36:08'),
(66, 19, '2018-00008-OF', 9, 9, '-1.00', '0.00', 'Offset', 'Active', '2018-10-21 20:55:20', '2018-10-21 20:55:20'),
(67, 18, '2018-00059-PA', 9, 9, '1.00', '-1.00', 'Payment', 'Active', '2018-10-21 20:55:55', '2018-10-21 20:55:55'),
(68, 18, '2018-00009-OF', 9, 9, '-1.00', '0.00', 'Offset', 'Active', '2018-10-21 20:56:02', '2018-10-21 20:56:02'),
(69, 18, '2018-00060-PA', 9, 9, '1.00', '-1.00', 'Payment', 'Active', '2018-10-21 20:57:45', '2018-10-21 20:57:45'),
(70, 18, '2018-00010-OF', 9, 9, '-1.00', '0.00', 'Offset', 'Active', '2018-10-21 20:57:50', '2018-10-21 20:57:50'),
(71, 21, '2018-00061-PA', 9, 9, '1.00', '-1.00', 'Payment', 'Active', '2018-10-21 21:00:43', '2018-10-21 21:00:43'),
(72, 21, '2018-00011-OF', 9, 9, '-1.00', '0.00', 'Offset', 'Active', '2018-10-21 21:01:36', '2018-10-21 21:01:36'),
(73, 22, '2018-00062-PA', 9, 9, '1.00', '-1.00', 'Payment', 'Active', '2018-10-21 21:02:48', '2018-10-21 21:02:48'),
(74, 22, '2018-00063-PA', 9, 9, '1.00', '-2.00', 'Payment', 'Active', '2018-10-21 21:02:48', '2018-10-21 21:02:48'),
(75, 22, '2018-00012-OF', 9, 9, '-2.00', '0.00', 'Offset', 'Active', '2018-10-21 21:02:55', '2018-10-21 21:02:55'),
(76, 22, '2018-00064-PA', 9, 9, '1.00', '-1.00', 'Payment', 'Active', '2018-10-21 21:05:03', '2018-10-21 21:05:03'),
(77, 22, '2018-00013-OF', 9, 9, '-1.00', '0.00', 'Offset', 'Active', '2018-10-21 21:05:08', '2018-10-21 21:05:08'),
(78, 18, '2018-00065-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 21:06:21', '2018-10-21 21:06:21'),
(79, 18, '2018-00014-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 21:06:26', '2018-10-21 21:06:26'),
(80, 18, '2018-00066-PA', 9, 9, '1.00', '-1.00', 'Payment', 'Active', '2018-10-21 21:07:49', '2018-10-21 21:07:49'),
(81, 18, '2018-00015-OF', 9, 9, '-1.00', '0.00', 'Offset', 'Active', '2018-10-21 21:07:53', '2018-10-21 21:07:53'),
(82, 18, '2018-00067-PA', 9, 9, '20.00', '-20.00', 'Payment', 'Active', '2018-10-21 21:08:49', '2018-10-21 21:08:49'),
(83, 18, '2018-00016-OF', 9, 9, '-20.00', '0.00', 'Offset', 'Active', '2018-10-21 21:08:53', '2018-10-21 21:08:53'),
(84, 18, '2018-00068-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 21:09:20', '2018-10-21 21:09:20'),
(85, 18, '2018-00017-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 21:09:25', '2018-10-21 21:09:25'),
(86, 18, '2018-00069-PA', 9, 9, '1000.00', '-1000.00', 'Payment', 'Active', '2018-10-21 21:09:48', '2018-10-21 21:09:48'),
(87, 18, '2018-00018-OF', 9, 9, '-1000.00', '0.00', 'Offset', 'Active', '2018-10-21 21:09:54', '2018-10-21 21:09:54'),
(88, 18, '2018-00070-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 21:11:38', '2018-10-21 21:11:38'),
(89, 18, '2018-00019-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 21:11:42', '2018-10-21 21:11:42'),
(90, 18, '2018-00071-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 21:15:54', '2018-10-21 21:15:54'),
(91, 18, '2018-00020-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 21:15:58', '2018-10-21 21:15:58'),
(92, 18, '2018-00072-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 21:16:49', '2018-10-21 21:16:49'),
(93, 18, '2018-00021-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 21:16:53', '2018-10-21 21:16:53'),
(94, 18, '2018-00073-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 21:20:25', '2018-10-21 21:20:25'),
(95, 18, '2018-00022-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 21:20:30', '2018-10-21 21:20:30'),
(96, 19, '2018-00074-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 21:21:25', '2018-10-21 21:21:25'),
(97, 19, '2018-00023-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 21:21:30', '2018-10-21 21:21:30'),
(98, 19, '2018-00075-PA', 9, 9, '10.00', '-10.00', 'Payment', 'Active', '2018-10-21 21:22:31', '2018-10-21 21:22:31'),
(99, 19, '2018-00024-OF', 9, 9, '-10.00', '0.00', 'Offset', 'Active', '2018-10-21 21:22:36', '2018-10-21 21:22:36');

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

--
-- Dumping data for table `t_returnee`
--

INSERT INTO `t_returnee` (`Returnee_ID`, `Returnee_StudentAccountID`, `Returnee_AcademicYearID`, `Returnee_SemesterID`, `Returnee_Display_Status`, `Returnee_Date_Added`, `Returnee_Date_Updated`) VALUES
(4, 18, 2, 9, 'Active', '2018-10-12 18:13:09', '2018-10-12 18:13:09'),
(5, 19, 2, 9, 'Active', '2018-10-12 18:13:23', '2018-10-12 18:13:23'),
(6, 20, 2, 9, 'Active', '2018-10-12 18:13:26', '2018-10-12 18:13:26'),
(7, 21, 2, 9, 'Active', '2018-10-12 18:13:29', '2018-10-12 18:13:29'),
(8, 22, 9, 8, 'Inactive', '2018-10-13 06:19:03', '2018-10-13 06:19:46');

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
(226, 18, 214, 6, NULL, 10, 2, 'Active', '2018-10-12 17:33:24', '2018-10-12 17:33:24'),
(227, 18, 162, 6, NULL, 10, 2, 'Active', '2018-10-12 17:33:41', '2018-10-12 17:33:41'),
(228, 18, 155, 6, NULL, 10, 2, 'Active', '2018-10-12 17:34:02', '2018-10-12 17:34:02'),
(229, 18, 161, 6, NULL, 10, 2, 'Active', '2018-10-12 17:34:28', '2018-10-12 17:34:28'),
(230, 18, 217, 6, NULL, 10, 2, 'Active', '2018-10-12 17:34:55', '2018-10-12 17:34:55'),
(231, 18, 216, 6, NULL, 10, 2, 'Active', '2018-10-12 17:35:12', '2018-10-12 17:35:12'),
(232, 18, 215, 6, NULL, 10, 2, 'Active', '2018-10-12 17:35:35', '2018-10-12 17:35:35'),
(233, 18, 163, 6, 82, 10, 2, 'Active', '2018-10-12 17:35:56', '2018-10-12 17:35:56'),
(234, 18, 163, 6, 83, 10, 2, 'Active', '2018-10-12 17:36:12', '2018-10-12 17:36:12'),
(235, 18, 223, 6, NULL, 10, 2, 'Active', '2018-10-12 17:37:14', '2018-10-12 17:37:14'),
(236, 18, 218, 6, NULL, 10, 2, 'Active', '2018-10-12 17:37:30', '2018-10-12 17:37:30'),
(237, 18, 222, 6, NULL, 10, 2, 'Active', '2018-10-12 17:37:51', '2018-10-12 17:37:51'),
(238, 18, 221, 6, NULL, 10, 2, 'Active', '2018-10-12 17:38:11', '2018-10-12 17:38:11'),
(239, 18, 220, 6, NULL, 10, 2, 'Active', '2018-10-12 17:38:31', '2018-10-12 17:38:31'),
(240, 18, 219, 6, NULL, 10, 2, 'Active', '2018-10-12 17:38:49', '2018-10-12 17:38:49'),
(241, 18, 225, 6, 84, 10, 2, 'Active', '2018-10-12 17:40:53', '2018-10-12 17:40:53'),
(242, 18, 225, 6, 85, 10, 2, 'Active', '2018-10-12 17:41:07', '2018-10-12 17:41:07'),
(243, 18, 224, 6, NULL, 10, 2, 'Active', '2018-10-12 17:41:23', '2018-10-12 17:41:23'),
(244, 18, 226, 7, NULL, 10, 2, 'Active', '2018-10-12 17:42:28', '2018-10-12 17:42:28'),
(245, 18, 236, 7, NULL, 10, 2, 'Active', '2018-10-12 18:02:40', '2018-10-12 18:02:40'),
(246, 18, 235, 7, NULL, 10, 2, 'Active', '2018-10-12 18:02:58', '2018-10-12 18:02:58'),
(247, 18, 234, 7, NULL, 10, 2, 'Active', '2018-10-12 18:03:16', '2018-10-12 18:03:16'),
(248, 18, 240, 7, NULL, 10, 2, 'Active', '2018-10-12 18:03:38', '2018-10-12 18:03:38'),
(249, 18, 239, 7, NULL, 10, 2, 'Active', '2018-10-12 18:04:12', '2018-10-12 18:04:12'),
(250, 18, 238, 7, NULL, 10, 2, 'Active', '2018-10-12 18:04:28', '2018-10-12 18:04:28'),
(251, 18, 237, 7, NULL, 10, 2, 'Active', '2018-10-12 18:04:41', '2018-10-12 18:04:41'),
(252, 18, 124, 6, NULL, 10, 1, 'Active', '2018-10-12 18:16:06', '2018-10-12 18:16:06'),
(253, 18, 86, 6, NULL, 10, 1, 'Active', '2018-10-12 18:16:25', '2018-10-12 18:16:25'),
(254, 18, 127, 6, NULL, 10, 1, 'Active', '2018-10-12 18:16:43', '2018-10-12 18:16:43'),
(255, 18, 126, 6, NULL, 10, 1, 'Active', '2018-10-12 18:17:03', '2018-10-12 18:17:03'),
(256, 18, 125, 6, NULL, 10, 1, 'Active', '2018-10-12 18:17:39', '2018-10-12 18:17:39'),
(257, 18, 123, 6, NULL, 10, 1, 'Active', '2018-10-12 18:17:58', '2018-10-12 18:17:58'),
(258, 18, 87, 6, NULL, 10, 1, 'Active', '2018-10-12 18:18:24', '2018-10-12 18:18:24'),
(259, 18, 128, 6, NULL, 10, 1, 'Active', '2018-10-12 18:18:38', '2018-10-12 18:18:38'),
(260, 14, 89, 6, 82, 10, 1, 'Active', '2018-10-12 18:19:01', '2018-10-12 18:19:16'),
(261, 18, 89, 6, 83, 10, 1, 'Active', '2018-10-12 18:19:31', '2018-10-12 18:19:31'),
(262, 18, 160, 9, NULL, 10, 1, 'Active', '2018-10-12 18:48:17', '2018-10-12 18:48:17'),
(263, 18, 159, 9, NULL, 10, 1, 'Active', '2018-10-12 18:48:29', '2018-10-12 18:48:29'),
(264, 18, 158, 9, NULL, 10, 1, 'Active', '2018-10-12 18:48:51', '2018-10-12 18:48:51'),
(265, 18, 196, 9, NULL, 10, 1, 'Active', '2018-10-12 18:49:11', '2018-10-12 18:49:11'),
(266, 18, 195, 9, NULL, 10, 1, 'Active', '2018-10-12 18:49:31', '2018-10-12 18:49:31'),
(267, 18, 97, 9, 82, 10, 1, 'Active', '2018-10-12 18:49:55', '2018-10-12 18:49:55'),
(268, 18, 97, 9, 83, 10, 1, 'Active', '2018-10-12 18:50:13', '2018-10-12 18:50:13'),
(269, 18, 194, 9, NULL, 10, 1, 'Active', '2018-10-12 18:50:46', '2018-10-12 18:50:46'),
(270, 18, 129, 6, NULL, 10, 1, 'Active', '2018-10-12 19:35:12', '2018-10-12 19:35:12'),
(271, 18, 92, 6, NULL, 10, 1, 'Active', '2018-10-12 19:35:29', '2018-10-12 19:35:29'),
(272, 18, 90, 6, NULL, 10, 1, 'Active', '2018-10-12 19:35:44', '2018-10-12 19:35:44'),
(273, 18, 133, 6, NULL, 10, 1, 'Active', '2018-10-12 19:36:09', '2018-10-12 19:36:09'),
(274, 18, 132, 6, NULL, 10, 1, 'Active', '2018-10-12 19:36:27', '2018-10-12 19:36:27'),
(275, 18, 131, 6, NULL, 10, 1, 'Active', '2018-10-12 19:36:46', '2018-10-12 19:36:46'),
(276, 18, 130, 6, NULL, 10, 1, 'Active', '2018-10-12 19:37:02', '2018-10-12 19:37:02'),
(277, 18, 143, 6, NULL, 10, 1, 'Active', '2018-10-12 19:37:26', '2018-10-12 19:37:26'),
(278, 18, 91, 6, 84, 10, 1, 'Active', '2018-10-12 19:37:41', '2018-10-12 19:37:41'),
(279, 18, 91, 6, 85, 10, 1, 'Active', '2018-10-12 19:37:54', '2018-10-12 19:37:54'),
(280, 18, 198, 9, NULL, 10, 1, 'Active', '2018-10-12 19:38:35', '2018-10-12 19:38:35'),
(281, 18, 197, 9, NULL, 10, 1, 'Active', '2018-10-12 19:38:49', '2018-10-12 19:38:49'),
(282, 18, 152, 9, NULL, 10, 1, 'Active', '2018-10-12 19:39:04', '2018-10-12 19:39:04'),
(283, 18, 201, 9, NULL, 10, 1, 'Active', '2018-10-12 19:39:48', '2018-10-12 19:39:48'),
(284, 18, 200, 9, NULL, 10, 1, 'Active', '2018-10-12 19:40:09', '2018-10-12 19:40:09'),
(285, 18, 199, 9, NULL, 10, 1, 'Active', '2018-10-12 19:40:30', '2018-10-12 19:40:30'),
(286, 18, 202, 9, 84, 10, 1, 'Active', '2018-10-12 19:40:46', '2018-10-12 19:40:46'),
(287, 18, 202, 9, 85, 10, 1, 'Active', '2018-10-12 19:41:00', '2018-10-12 19:41:00'),
(288, 18, 142, 7, NULL, 10, 5, 'Active', '2018-10-12 20:09:16', '2018-10-12 20:09:16'),
(289, 18, 141, 7, NULL, 10, 5, 'Active', '2018-10-12 20:09:30', '2018-10-12 20:09:30'),
(290, 18, 139, 7, NULL, 10, 5, 'Active', '2018-10-12 20:10:04', '2018-10-12 20:10:04'),
(291, 18, 138, 7, NULL, 10, 5, 'Active', '2018-10-12 20:10:30', '2018-10-12 20:10:30'),
(292, 18, 137, 7, NULL, 10, 5, 'Active', '2018-10-12 20:10:49', '2018-10-12 20:10:49'),
(293, 18, 136, 7, NULL, 10, 5, 'Active', '2018-10-12 20:11:09', '2018-10-12 20:11:09'),
(294, 18, 135, 7, NULL, 10, 5, 'Active', '2018-10-12 20:11:35', '2018-10-12 20:11:35'),
(295, 18, 134, 7, NULL, 10, 5, 'Active', '2018-10-12 20:12:06', '2018-10-12 20:12:06'),
(296, 18, 140, 7, NULL, 10, 5, 'Active', '2018-10-12 20:12:38', '2018-10-12 20:12:38'),
(297, 18, 165, 12, NULL, 10, 5, 'Active', '2018-10-12 21:48:55', '2018-10-12 21:48:55'),
(298, 18, 170, 12, NULL, 10, 5, 'Active', '2018-10-12 21:50:26', '2018-10-12 21:50:26'),
(299, 18, 169, 12, NULL, 10, 5, 'Active', '2018-10-12 21:50:46', '2018-10-12 21:50:46'),
(300, 18, 168, 12, NULL, 10, 5, 'Active', '2018-10-12 21:51:09', '2018-10-12 21:51:09'),
(301, 18, 166, 12, NULL, 10, 5, 'Active', '2018-10-12 21:51:34', '2018-10-12 21:51:34'),
(302, 18, 167, 12, NULL, 10, 5, 'Active', '2018-10-12 21:51:56', '2018-10-12 21:51:56'),
(303, 18, 144, 7, NULL, 10, 5, 'Active', '2018-10-12 22:12:41', '2018-10-12 22:12:41'),
(304, 18, 151, 7, NULL, 10, 5, 'Active', '2018-10-12 22:12:58', '2018-10-12 22:12:58'),
(305, 18, 149, 7, NULL, 10, 5, 'Active', '2018-10-12 22:13:16', '2018-10-12 22:13:16'),
(306, 18, 148, 7, NULL, 10, 5, 'Active', '2018-10-12 22:13:34', '2018-10-12 22:13:34'),
(307, 18, 147, 7, NULL, 10, 5, 'Active', '2018-10-12 22:13:59', '2018-10-12 22:13:59'),
(308, 18, 146, 7, NULL, 10, 5, 'Active', '2018-10-12 22:14:16', '2018-10-12 22:14:16'),
(309, 18, 145, 7, NULL, 10, 5, 'Active', '2018-10-12 22:14:32', '2018-10-12 22:14:32'),
(310, 18, 150, 7, NULL, 10, 5, 'Active', '2018-10-12 22:14:48', '2018-10-12 22:14:48'),
(311, 18, 171, 12, NULL, 10, 5, 'Active', '2018-10-12 22:15:17', '2018-10-12 22:15:17'),
(312, 18, 175, 12, NULL, 10, 5, 'Active', '2018-10-12 22:15:33', '2018-10-12 22:15:33'),
(313, 18, 174, 12, NULL, 10, 5, 'Active', '2018-10-12 22:15:53', '2018-10-12 22:15:53'),
(314, 18, 173, 12, NULL, 10, 5, 'Active', '2018-10-12 22:16:18', '2018-10-12 22:16:18'),
(315, 18, 172, 12, NULL, 10, 5, 'Active', '2018-10-12 22:16:41', '2018-10-12 22:16:41'),
(316, 18, 108, 10, NULL, 10, 6, 'Active', '2018-10-12 22:30:40', '2018-10-12 22:30:40'),
(317, 18, 107, 10, NULL, 10, 6, 'Active', '2018-10-12 22:30:57', '2018-10-12 22:30:57'),
(318, 18, 106, 10, NULL, 10, 6, 'Active', '2018-10-12 22:31:21', '2018-10-12 22:31:21'),
(319, 18, 105, 10, NULL, 10, 6, 'Active', '2018-10-12 22:31:55', '2018-10-12 22:31:55'),
(320, 18, 104, 10, NULL, 10, 6, 'Active', '2018-10-12 22:32:12', '2018-10-12 22:32:12'),
(321, 18, 103, 10, NULL, 10, 6, 'Active', '2018-10-12 22:32:32', '2018-10-12 22:32:32'),
(322, 18, 102, 10, NULL, 10, 6, 'Active', '2018-10-12 22:32:53', '2018-10-12 22:32:53'),
(323, 18, 101, 10, NULL, 10, 6, 'Active', '2018-10-12 22:33:17', '2018-10-12 22:33:17'),
(324, 18, 180, 13, NULL, 10, 6, 'Active', '2018-10-12 22:33:59', '2018-10-12 22:33:59'),
(325, 18, 179, 13, NULL, 10, 6, 'Active', '2018-10-12 22:34:11', '2018-10-12 22:34:11'),
(326, 18, 178, 13, NULL, 10, 6, 'Active', '2018-10-12 22:34:48', '2018-10-12 22:34:48'),
(327, 18, 177, 13, NULL, 10, 6, 'Active', '2018-10-12 22:35:09', '2018-10-12 22:35:09'),
(328, 18, 176, 13, NULL, 10, 6, 'Active', '2018-10-12 22:35:32', '2018-10-12 22:35:32'),
(329, 18, 109, 10, NULL, 10, 6, 'Active', '2018-10-12 22:52:10', '2018-10-12 22:52:10'),
(330, 18, 115, 10, NULL, 10, 6, 'Active', '2018-10-12 22:52:25', '2018-10-12 22:52:25'),
(331, 18, 114, 10, NULL, 10, 6, 'Active', '2018-10-12 22:52:38', '2018-10-12 22:52:38'),
(332, 18, 113, 10, NULL, 10, 6, 'Active', '2018-10-12 22:52:55', '2018-10-12 22:52:55'),
(333, 18, 112, 10, NULL, 10, 6, 'Active', '2018-10-12 22:53:19', '2018-10-12 22:53:19'),
(334, 18, 111, 10, NULL, 10, 6, 'Active', '2018-10-12 22:53:35', '2018-10-12 22:53:35'),
(335, 18, 110, 10, NULL, 10, 6, 'Active', '2018-10-12 22:53:54', '2018-10-12 22:53:54'),
(336, 18, 181, 13, NULL, 10, 6, 'Active', '2018-10-12 22:54:43', '2018-10-12 22:54:43'),
(337, 18, 185, 13, NULL, 10, 6, 'Active', '2018-10-12 22:55:05', '2018-10-12 22:55:05'),
(338, 18, 184, 13, NULL, 10, 6, 'Active', '2018-10-12 22:55:26', '2018-10-12 22:55:26'),
(339, 18, 183, 13, NULL, 10, 6, 'Active', '2018-10-12 22:55:47', '2018-10-12 22:55:47'),
(340, 18, 182, 13, NULL, 10, 6, 'Active', '2018-10-12 22:56:09', '2018-10-12 22:56:09'),
(341, 18, 205, 10, NULL, 10, 6, 'Active', '2018-10-12 23:15:39', '2018-10-12 23:15:39'),
(342, 18, 122, 11, NULL, 10, 7, 'Active', '2018-10-12 23:23:25', '2018-10-12 23:23:25'),
(343, 18, 121, 11, NULL, 10, 7, 'Active', '2018-10-12 23:23:39', '2018-10-12 23:23:39'),
(344, 18, 120, 11, NULL, 10, 7, 'Active', '2018-10-12 23:23:58', '2018-10-12 23:23:58'),
(345, 18, 119, 11, NULL, 10, 7, 'Active', '2018-10-12 23:24:22', '2018-10-12 23:24:22'),
(346, 18, 118, 11, NULL, 10, 7, 'Active', '2018-10-12 23:24:52', '2018-10-12 23:24:52'),
(347, 18, 117, 11, NULL, 10, 7, 'Active', '2018-10-12 23:25:07', '2018-10-12 23:25:07'),
(348, 18, 116, 11, NULL, 10, 7, 'Active', '2018-10-12 23:25:24', '2018-10-12 23:25:24'),
(349, 18, 191, 14, NULL, 10, 7, 'Active', '2018-10-12 23:26:05', '2018-10-12 23:26:05'),
(350, 18, 190, 14, NULL, 10, 7, 'Active', '2018-10-12 23:26:21', '2018-10-12 23:26:21'),
(351, 18, 189, 14, NULL, 10, 7, 'Active', '2018-10-12 23:26:43', '2018-10-12 23:26:43'),
(352, 18, 188, 14, NULL, 10, 7, 'Active', '2018-10-12 23:27:13', '2018-10-12 23:27:13'),
(353, 18, 187, 14, NULL, 10, 7, 'Active', '2018-10-12 23:27:35', '2018-10-12 23:27:35'),
(354, 18, 186, 14, NULL, 10, 7, 'Active', '2018-10-12 23:27:51', '2018-10-12 23:27:51'),
(355, 18, 204, 11, NULL, 10, 7, 'Active', '2018-10-12 23:42:31', '2018-10-12 23:42:31'),
(356, 18, 192, 14, NULL, 10, 7, 'Active', '2018-10-12 23:43:51', '2018-10-12 23:43:51'),
(357, 18, 193, 14, NULL, 10, 7, 'Active', '2018-10-12 23:44:31', '2018-10-12 23:44:31'),
(358, 18, 125, 6, NULL, 10, 8, 'Active', '2018-10-13 04:00:09', '2018-10-13 04:00:09'),
(359, 18, 126, 6, NULL, 10, 8, 'Active', '2018-10-13 04:00:26', '2018-10-13 04:00:26'),
(360, 18, 124, 6, NULL, 10, 8, 'Active', '2018-10-13 04:00:41', '2018-10-13 04:00:41'),
(361, 18, 123, 6, NULL, 10, 8, 'Active', '2018-10-13 04:01:00', '2018-10-13 04:01:00'),
(362, 18, 127, 6, NULL, 10, 8, 'Active', '2018-10-13 04:01:26', '2018-10-13 04:01:26'),
(363, 18, 87, 6, NULL, 10, 8, 'Active', '2018-10-13 04:01:43', '2018-10-13 04:01:43'),
(364, 18, 86, 6, NULL, 10, 8, 'Active', '2018-10-13 04:01:59', '2018-10-13 04:01:59'),
(365, 18, 128, 6, NULL, 10, 8, 'Active', '2018-10-13 04:02:21', '2018-10-13 05:13:42'),
(366, 18, 89, 6, 82, 10, 8, 'Active', '2018-10-13 04:02:36', '2018-10-13 05:13:55'),
(367, 18, 89, 6, 83, 10, 8, 'Active', '2018-10-13 04:02:55', '2018-10-13 05:14:09'),
(368, 18, 196, 9, NULL, 10, 8, 'Active', '2018-10-13 04:03:26', '2018-10-13 04:03:26'),
(369, 18, 195, 9, NULL, 10, 8, 'Active', '2018-10-13 04:03:40', '2018-10-13 04:03:40'),
(370, 18, 160, 9, NULL, 10, 8, 'Active', '2018-10-13 04:03:54', '2018-10-13 04:03:54'),
(371, 18, 159, 9, NULL, 10, 8, 'Active', '2018-10-13 04:04:12', '2018-10-13 04:04:12'),
(372, 18, 158, 9, NULL, 10, 8, 'Active', '2018-10-13 04:04:33', '2018-10-13 04:04:33'),
(373, 18, 194, 9, NULL, 10, 8, 'Active', '2018-10-13 04:04:50', '2018-10-13 04:04:50'),
(374, 18, 97, 9, 82, 10, 8, 'Active', '2018-10-13 04:05:07', '2018-10-13 04:05:07'),
(375, 18, 97, 9, 83, 10, 8, 'Active', '2018-10-13 04:05:26', '2018-10-13 04:05:26'),
(376, 18, 127, 8, NULL, 10, 8, 'Active', '2018-10-13 04:26:11', '2018-10-13 04:26:11'),
(377, 18, 126, 8, NULL, 10, 8, 'Active', '2018-10-13 04:26:28', '2018-10-13 04:26:28'),
(378, 18, 125, 8, NULL, 10, 8, 'Active', '2018-10-13 04:26:57', '2018-10-13 04:26:57'),
(379, 18, 124, 8, NULL, 10, 8, 'Active', '2018-10-13 04:27:18', '2018-10-13 04:27:18'),
(380, 18, 86, 8, NULL, 10, 8, 'Active', '2018-10-13 04:27:37', '2018-10-13 04:27:37'),
(381, 18, 123, 8, NULL, 10, 8, 'Active', '2018-10-13 04:27:51', '2018-10-13 04:27:51'),
(382, 18, 87, 8, NULL, 10, 8, 'Active', '2018-10-13 04:28:20', '2018-10-13 04:28:20'),
(383, 18, 128, 8, NULL, 10, 8, 'Active', '2018-10-13 04:28:39', '2018-10-13 04:28:39'),
(384, 18, 89, 8, 82, 10, 8, 'Active', '2018-10-13 04:29:04', '2018-10-13 04:29:04'),
(385, 18, 89, 8, 83, 10, 8, 'Active', '2018-10-13 04:29:45', '2018-10-13 04:29:45'),
(386, 18, 133, 6, NULL, 10, 8, 'Active', '2018-10-13 05:21:55', '2018-10-13 05:21:55'),
(387, 18, 132, 6, NULL, 10, 8, 'Active', '2018-10-13 05:22:09', '2018-10-13 05:22:09'),
(388, 18, 131, 6, NULL, 10, 8, 'Active', '2018-10-13 05:22:24', '2018-10-13 05:22:24'),
(389, 18, 130, 6, NULL, 10, 8, 'Active', '2018-10-13 05:22:41', '2018-10-13 05:22:41'),
(390, 18, 129, 6, NULL, 10, 8, 'Active', '2018-10-13 05:23:00', '2018-10-13 05:23:00'),
(391, 18, 92, 6, NULL, 10, 8, 'Active', '2018-10-13 05:23:17', '2018-10-13 05:23:17'),
(392, 18, 90, 6, NULL, 10, 8, 'Active', '2018-10-13 05:23:30', '2018-10-13 05:23:30'),
(393, 18, 143, 6, NULL, 10, 8, 'Active', '2018-10-13 05:23:44', '2018-10-13 05:23:44'),
(394, 18, 91, 6, 84, 10, 8, 'Active', '2018-10-13 05:23:59', '2018-10-13 05:23:59'),
(395, 18, 91, 6, 85, 10, 8, 'Active', '2018-10-13 05:24:11', '2018-10-13 05:24:11'),
(396, 18, 201, 9, NULL, 10, 8, 'Active', '2018-10-13 05:24:29', '2018-10-13 05:24:29'),
(397, 18, 200, 9, NULL, 10, 8, 'Active', '2018-10-13 05:24:41', '2018-10-13 05:24:41'),
(398, 18, 198, 9, NULL, 10, 8, 'Active', '2018-10-13 05:25:05', '2018-10-13 05:25:05'),
(399, 18, 197, 9, NULL, 10, 8, 'Active', '2018-10-13 05:25:29', '2018-10-13 05:25:29'),
(400, 18, 152, 9, NULL, 10, 8, 'Active', '2018-10-13 05:25:50', '2018-10-13 05:25:50'),
(401, 18, 202, 9, 84, 10, 8, 'Active', '2018-10-13 05:26:03', '2018-10-13 05:26:03'),
(402, 18, 202, 9, 85, 10, 8, 'Active', '2018-10-13 05:26:17', '2018-10-13 05:26:17'),
(403, 18, 199, 9, NULL, 10, 8, 'Active', '2018-10-13 05:26:30', '2018-10-13 05:26:30'),
(404, 18, 141, 7, NULL, 10, 9, 'Active', '2018-10-13 05:58:15', '2018-10-13 05:58:15'),
(405, 18, 139, 7, NULL, 10, 9, 'Active', '2018-10-13 05:58:30', '2018-10-13 05:58:30'),
(406, 18, 138, 7, NULL, 10, 9, 'Active', '2018-10-13 05:58:49', '2018-10-13 05:58:49'),
(407, 18, 137, 7, NULL, 10, 9, 'Active', '2018-10-13 05:59:07', '2018-10-13 05:59:07'),
(408, 18, 136, 7, NULL, 10, 9, 'Active', '2018-10-13 05:59:27', '2018-10-13 05:59:27'),
(409, 18, 135, 7, NULL, 10, 9, 'Active', '2018-10-13 05:59:39', '2018-10-13 05:59:39'),
(410, 18, 134, 7, NULL, 10, 9, 'Active', '2018-10-13 05:59:51', '2018-10-13 05:59:51'),
(411, 18, 142, 7, NULL, 10, 9, 'Active', '2018-10-13 06:00:18', '2018-10-13 06:00:18'),
(412, 18, 140, 7, NULL, 10, 9, 'Active', '2018-10-13 06:00:41', '2018-10-13 06:00:41'),
(413, 18, 170, 12, NULL, 10, 9, 'Active', '2018-10-13 06:01:00', '2018-10-13 06:01:00'),
(414, 18, 169, 12, NULL, 10, 9, 'Active', '2018-10-13 06:01:13', '2018-10-13 06:01:13'),
(415, 18, 168, 12, NULL, 10, 9, 'Active', '2018-10-13 06:01:28', '2018-10-13 06:01:28'),
(416, 18, 166, 12, NULL, 10, 9, 'Active', '2018-10-13 06:01:45', '2018-10-13 06:01:45'),
(417, 18, 165, 12, NULL, 10, 9, 'Active', '2018-10-13 06:01:57', '2018-10-13 06:01:57'),
(418, 18, 167, 12, NULL, 10, 9, 'Active', '2018-10-13 06:02:17', '2018-10-13 06:02:17'),
(419, 11, 124, 6, NULL, 1, 9, 'Active', '2018-10-19 12:28:39', '2018-10-19 22:22:16'),
(420, 12, 131, 6, NULL, 10, 9, 'Active', '2018-10-19 22:40:31', '2018-10-21 18:07:30');

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
(118, 226, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 17:33:24', '2018-10-12 17:33:24'),
(119, 227, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 17:33:41', '2018-10-12 17:33:41'),
(120, 228, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 17:34:02', '2018-10-12 17:34:02'),
(121, 229, 6, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-12 17:34:28', '2018-10-12 17:34:28'),
(122, 230, 7, 'F', '07:30:00', '10:30:00', 'Active', '2018-10-12 17:34:55', '2018-10-12 17:34:55'),
(123, 231, 8, 'S', '10:30:00', '13:30:00', 'Active', '2018-10-12 17:35:12', '2018-10-12 17:35:12'),
(124, 232, 2, 'M', '13:30:00', '16:30:00', 'Active', '2018-10-12 17:35:35', '2018-10-12 17:35:35'),
(125, 233, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-12 17:35:56', '2018-10-12 17:35:56'),
(126, 234, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-12 17:36:12', '2018-10-12 17:36:12'),
(127, 235, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 17:37:14', '2018-10-12 17:37:14'),
(128, 236, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 17:37:30', '2018-10-12 17:37:30'),
(129, 237, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 17:37:51', '2018-10-12 17:37:51'),
(130, 238, 6, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-12 17:38:11', '2018-10-12 17:38:11'),
(131, 239, 7, 'F', '07:30:00', '10:30:00', 'Active', '2018-10-12 17:38:31', '2018-10-12 17:38:31'),
(132, 240, 8, 'S', '10:30:00', '13:30:00', 'Active', '2018-10-12 17:38:49', '2018-10-12 17:38:49'),
(133, 241, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-12 17:40:53', '2018-10-12 17:40:53'),
(134, 242, 2, 'S', '07:30:00', '12:30:00', 'Active', '2018-10-12 17:41:07', '2018-10-12 17:41:07'),
(135, 243, 2, 'M', '13:30:00', '16:30:00', 'Active', '2018-10-12 17:41:24', '2018-10-12 17:41:24'),
(136, 244, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 17:42:29', '2018-10-12 17:42:29'),
(137, 245, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 18:02:40', '2018-10-12 18:02:40'),
(138, 246, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 18:02:58', '2018-10-12 18:02:58'),
(139, 247, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 18:03:16', '2018-10-12 18:03:16'),
(140, 248, 8, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-12 18:03:38', '2018-10-12 18:03:38'),
(141, 249, 1, 'M', '16:30:00', '18:00:00', 'Active', '2018-10-12 18:04:12', '2018-10-12 18:04:12'),
(142, 250, 4, 'T', '07:30:00', '10:30:00', 'Active', '2018-10-12 18:04:28', '2018-10-12 18:04:28'),
(143, 251, 2, 'TH', '07:30:00', '10:30:00', 'Active', '2018-10-12 18:04:41', '2018-10-12 18:04:41'),
(144, 252, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 18:16:06', '2018-10-12 18:16:06'),
(145, 253, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 18:16:25', '2018-10-12 18:16:25'),
(146, 254, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 18:16:44', '2018-10-12 18:16:44'),
(147, 255, 6, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-12 18:17:03', '2018-10-12 18:17:03'),
(148, 256, 7, 'F', '07:30:00', '10:30:00', 'Active', '2018-10-12 18:17:39', '2018-10-12 18:17:39'),
(149, 257, 7, 'S', '10:30:00', '13:30:00', 'Active', '2018-10-12 18:17:58', '2018-10-12 18:17:58'),
(150, 258, 8, 'M', '16:30:00', '18:00:00', 'Active', '2018-10-12 18:18:25', '2018-10-12 18:18:25'),
(151, 259, 2, 'T', '07:30:00', '10:30:00', 'Active', '2018-10-12 18:18:38', '2018-10-12 18:18:38'),
(152, 260, 5, 'W', '10:30:00', '13:30:00', 'Inactive', '2018-10-12 18:19:01', '2018-10-12 18:19:16'),
(153, 260, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-12 18:19:16', '2018-10-12 18:19:16'),
(154, 261, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-12 18:19:31', '2018-10-12 18:19:31'),
(155, 262, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 18:48:17', '2018-10-12 18:48:17'),
(156, 263, 6, 'T', '07:30:00', '10:30:00', 'Active', '2018-10-12 18:48:30', '2018-10-12 18:48:30'),
(157, 264, 8, 'W', '18:00:00', '21:00:00', 'Active', '2018-10-12 18:48:51', '2018-10-12 18:48:51'),
(158, 265, 6, 'TH', '13:30:00', '16:30:00', 'Active', '2018-10-12 18:49:11', '2018-10-12 18:49:11'),
(159, 266, 7, 'F', '10:30:00', '13:30:00', 'Active', '2018-10-12 18:49:31', '2018-10-12 18:49:31'),
(160, 267, 1, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-12 18:49:55', '2018-10-12 18:49:55'),
(161, 268, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-12 18:50:13', '2018-10-12 18:50:13'),
(162, 269, 2, 'TH', '13:30:00', '16:30:00', 'Active', '2018-10-12 18:50:46', '2018-10-12 18:50:46'),
(163, 270, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 19:35:12', '2018-10-12 19:35:12'),
(164, 271, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 19:35:29', '2018-10-12 19:35:29'),
(165, 272, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 19:35:44', '2018-10-12 19:35:44'),
(166, 273, 5, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-12 19:36:10', '2018-10-12 19:36:10'),
(167, 274, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-12 19:36:27', '2018-10-12 19:36:27'),
(168, 275, 6, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-12 19:36:47', '2018-10-12 19:36:47'),
(169, 276, 7, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 19:37:02', '2018-10-12 19:37:02'),
(170, 277, 2, 'F', '13:30:00', '16:30:00', 'Active', '2018-10-12 19:37:26', '2018-10-12 19:37:26'),
(171, 278, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-12 19:37:41', '2018-10-12 19:37:41'),
(172, 279, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-12 19:37:54', '2018-10-12 19:37:54'),
(173, 280, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 19:38:35', '2018-10-12 19:38:35'),
(174, 281, 7, 'T', '07:30:00', '10:30:00', 'Active', '2018-10-12 19:38:49', '2018-10-12 19:38:49'),
(175, 282, 8, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 19:39:04', '2018-10-12 19:39:04'),
(176, 283, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 19:39:48', '2018-10-12 19:39:48'),
(177, 284, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 19:40:09', '2018-10-12 19:40:09'),
(178, 285, 2, 'W', '16:30:00', '18:00:00', 'Active', '2018-10-12 19:40:30', '2018-10-12 19:40:30'),
(179, 286, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-12 19:40:46', '2018-10-12 19:40:46'),
(180, 287, 1, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-12 19:41:00', '2018-10-12 19:41:00'),
(181, 288, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 20:09:16', '2018-10-12 20:09:16'),
(182, 289, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 20:09:30', '2018-10-12 20:09:30'),
(183, 290, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 20:10:04', '2018-10-12 20:10:04'),
(184, 291, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 20:10:30', '2018-10-12 20:10:30'),
(185, 292, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 20:10:50', '2018-10-12 20:10:50'),
(186, 293, 7, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-12 20:11:09', '2018-10-12 20:11:09'),
(187, 294, 1, 'M', '13:30:00', '16:30:00', 'Active', '2018-10-12 20:11:35', '2018-10-12 20:11:35'),
(188, 295, 5, 'T', '16:30:00', '18:00:00', 'Active', '2018-10-12 20:12:06', '2018-10-12 20:12:06'),
(189, 296, 4, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 20:12:38', '2018-10-12 20:12:38'),
(190, 297, 1, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 21:48:56', '2018-10-12 21:48:56'),
(191, 298, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 21:50:26', '2018-10-12 21:50:26'),
(192, 299, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 21:50:46', '2018-10-12 21:50:46'),
(193, 300, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 21:51:10', '2018-10-12 21:51:10'),
(194, 301, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 21:51:34', '2018-10-12 21:51:34'),
(195, 302, 2, 'W', '15:00:00', '17:00:00', 'Active', '2018-10-12 21:51:57', '2018-10-12 21:51:57'),
(196, 303, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 22:12:41', '2018-10-12 22:12:41'),
(197, 304, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 22:12:58', '2018-10-12 22:12:58'),
(198, 305, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 22:13:16', '2018-10-12 22:13:16'),
(199, 306, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 22:13:34', '2018-10-12 22:13:34'),
(200, 307, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 22:13:59', '2018-10-12 22:13:59'),
(201, 308, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-12 22:14:16', '2018-10-12 22:14:16'),
(202, 309, 1, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-12 22:14:32', '2018-10-12 22:14:32'),
(203, 310, 4, 'T', '13:30:00', '16:30:00', 'Active', '2018-10-12 22:14:48', '2018-10-12 22:14:48'),
(204, 311, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 22:15:17', '2018-10-12 22:15:17'),
(205, 312, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 22:15:33', '2018-10-12 22:15:33'),
(206, 313, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 22:15:53', '2018-10-12 22:15:53'),
(207, 314, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 22:16:18', '2018-10-12 22:16:18'),
(208, 315, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 22:16:41', '2018-10-12 22:16:41'),
(209, 316, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 22:30:40', '2018-10-12 22:30:40'),
(210, 317, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 22:30:57', '2018-10-12 22:30:57'),
(211, 318, 5, 'W', '16:30:00', '18:00:00', 'Active', '2018-10-12 22:31:21', '2018-10-12 22:31:21'),
(212, 319, 6, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-12 22:31:55', '2018-10-12 22:31:55'),
(213, 320, 7, 'F', '07:30:00', '10:30:00', 'Active', '2018-10-12 22:32:12', '2018-10-12 22:32:12'),
(214, 321, 8, 'S', '10:30:00', '13:30:00', 'Active', '2018-10-12 22:32:32', '2018-10-12 22:32:32'),
(215, 322, 1, 'M', '16:30:00', '18:00:00', 'Active', '2018-10-12 22:32:53', '2018-10-12 22:32:53'),
(216, 323, 4, 'T', '18:00:00', '21:00:00', 'Active', '2018-10-12 22:33:17', '2018-10-12 22:33:17'),
(217, 324, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 22:33:59', '2018-10-12 22:33:59'),
(218, 325, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 22:34:28', '2018-10-12 22:34:28'),
(219, 326, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 22:34:48', '2018-10-12 22:34:48'),
(220, 327, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 22:35:09', '2018-10-12 22:35:09'),
(221, 328, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 22:35:32', '2018-10-12 22:35:32'),
(222, 329, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 22:52:10', '2018-10-12 22:52:10'),
(223, 330, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 22:52:25', '2018-10-12 22:52:25'),
(224, 331, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 22:52:38', '2018-10-12 22:52:38'),
(225, 332, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 22:52:55', '2018-10-12 22:52:55'),
(226, 333, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 22:53:19', '2018-10-12 22:53:19'),
(227, 334, 1, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-12 22:53:35', '2018-10-12 22:53:35'),
(228, 335, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 22:53:54', '2018-10-12 22:53:54'),
(229, 336, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 22:54:43', '2018-10-12 22:54:43'),
(230, 337, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 22:55:06', '2018-10-12 22:55:06'),
(231, 338, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 22:55:26', '2018-10-12 22:55:26'),
(232, 339, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 22:55:47', '2018-10-12 22:55:47'),
(233, 340, 1, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 22:56:09', '2018-10-12 22:56:09'),
(234, 341, 4, 'TH', '15:00:00', '18:00:00', 'Active', '2018-10-12 23:15:39', '2018-10-12 23:15:39'),
(235, 341, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 23:15:39', '2018-10-12 23:15:39'),
(236, 342, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 23:23:25', '2018-10-12 23:23:25'),
(237, 343, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 23:23:39', '2018-10-12 23:23:39'),
(238, 344, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 23:23:59', '2018-10-12 23:23:59'),
(239, 345, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 23:24:22', '2018-10-12 23:24:22'),
(240, 346, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 23:24:52', '2018-10-12 23:24:52'),
(241, 347, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-12 23:25:07', '2018-10-12 23:25:07'),
(242, 348, 1, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-12 23:25:24', '2018-10-12 23:25:24'),
(243, 349, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-12 23:26:05', '2018-10-12 23:26:05'),
(244, 350, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-12 23:26:21', '2018-10-12 23:26:21'),
(245, 351, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-12 23:26:43', '2018-10-12 23:26:43'),
(246, 352, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-12 23:27:13', '2018-10-12 23:27:13'),
(247, 353, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-12 23:27:35', '2018-10-12 23:27:35'),
(248, 354, 1, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-12 23:27:51', '2018-10-12 23:27:51'),
(249, 355, 1, 'S', '13:30:00', '16:30:00', 'Active', '2018-10-12 23:42:31', '2018-10-12 23:42:31'),
(250, 356, 1, 'M', '15:00:00', '18:00:00', 'Active', '2018-10-12 23:43:51', '2018-10-12 23:43:51'),
(251, 356, 1, 'W', '01:30:00', '04:30:00', 'Active', '2018-10-12 23:43:51', '2018-10-12 23:43:51'),
(252, 357, 4, 'S', '10:30:00', '13:30:00', 'Active', '2018-10-12 23:44:31', '2018-10-12 23:44:31'),
(253, 357, 4, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-12 23:44:31', '2018-10-12 23:44:31'),
(254, 358, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-13 04:00:09', '2018-10-13 04:00:09'),
(255, 359, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-13 04:00:26', '2018-10-13 04:00:26'),
(256, 360, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-13 04:00:42', '2018-10-13 04:00:42'),
(257, 361, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-13 04:01:00', '2018-10-13 04:01:00'),
(258, 362, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-13 04:01:26', '2018-10-13 04:01:26'),
(259, 363, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-13 04:01:43', '2018-10-13 04:01:43'),
(260, 364, 1, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-13 04:01:59', '2018-10-13 04:01:59'),
(261, 365, 2, 'T', '13:30:00', '16:30:00', 'Inactive', '2018-10-13 04:02:21', '2018-10-13 04:21:41'),
(262, 366, 2, 'S', '07:30:00', '12:00:00', 'Inactive', '2018-10-13 04:02:36', '2018-10-13 04:21:19'),
(263, 367, 2, 'SU', '07:30:00', '12:00:00', 'Inactive', '2018-10-13 04:02:55', '2018-10-13 04:21:34'),
(264, 368, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-13 04:03:26', '2018-10-13 04:03:26'),
(265, 369, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-13 04:03:40', '2018-10-13 04:03:40'),
(266, 370, 6, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-13 04:03:54', '2018-10-13 04:03:54'),
(267, 371, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-13 04:04:12', '2018-10-13 04:04:12'),
(268, 372, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-13 04:04:33', '2018-10-13 04:04:33'),
(269, 373, 2, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-13 04:04:50', '2018-10-13 04:04:50'),
(270, 374, 1, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-13 04:05:07', '2018-10-13 04:05:07'),
(271, 375, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-13 04:05:26', '2018-10-13 04:05:26'),
(272, 376, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-13 04:26:11', '2018-10-13 04:26:11'),
(273, 377, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-13 04:26:28', '2018-10-13 04:26:28'),
(274, 378, 7, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-13 04:26:57', '2018-10-13 04:26:57'),
(275, 379, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-13 04:27:18', '2018-10-13 04:27:18'),
(276, 380, 1, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-13 04:27:37', '2018-10-13 04:27:37'),
(277, 381, 4, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-13 04:27:51', '2018-10-13 04:27:51'),
(278, 382, 7, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-13 04:28:20', '2018-10-13 04:28:20'),
(279, 383, 2, 'F', '13:30:00', '16:30:00', 'Active', '2018-10-13 04:28:39', '2018-10-13 04:28:39'),
(280, 384, 5, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-13 04:29:04', '2018-10-13 04:29:04'),
(281, 385, 7, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-13 04:29:45', '2018-10-13 04:29:45'),
(282, 365, 1, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-13 05:13:42', '2018-10-13 05:13:42'),
(283, 366, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-13 05:13:56', '2018-10-13 05:13:56'),
(284, 367, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-13 05:14:09', '2018-10-13 05:14:09'),
(285, 386, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-13 05:21:55', '2018-10-13 05:21:55'),
(286, 387, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-13 05:22:09', '2018-10-13 05:22:09'),
(287, 388, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-13 05:22:24', '2018-10-13 05:22:24'),
(288, 389, 6, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-13 05:22:41', '2018-10-13 05:22:41'),
(289, 390, 7, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-13 05:23:00', '2018-10-13 05:23:00'),
(290, 391, 8, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-13 05:23:17', '2018-10-13 05:23:17'),
(291, 392, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-13 05:23:30', '2018-10-13 05:23:30'),
(292, 393, 2, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-13 05:23:44', '2018-10-13 05:23:44'),
(293, 394, 2, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-13 05:23:59', '2018-10-13 05:23:59'),
(294, 395, 2, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-13 05:24:12', '2018-10-13 05:24:12'),
(295, 396, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-13 05:24:29', '2018-10-13 05:24:29'),
(296, 397, 6, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-13 05:24:41', '2018-10-13 05:24:41'),
(297, 398, 7, 'W', '01:30:00', '16:30:00', 'Active', '2018-10-13 05:25:05', '2018-10-13 05:25:05'),
(298, 399, 8, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-13 05:25:29', '2018-10-13 05:25:29'),
(299, 400, 1, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-13 05:25:50', '2018-10-13 05:25:50'),
(300, 401, 1, 'SU', '07:30:00', '12:00:00', 'Active', '2018-10-13 05:26:03', '2018-10-13 05:26:03'),
(301, 402, 1, 'S', '07:30:00', '12:00:00', 'Active', '2018-10-13 05:26:17', '2018-10-13 05:26:17'),
(302, 403, 2, 'W', '07:30:00', '10:30:00', 'Active', '2018-10-13 05:26:30', '2018-10-13 05:26:30'),
(303, 404, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-13 05:58:15', '2018-10-13 05:58:15'),
(304, 405, 4, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-13 05:58:30', '2018-10-13 05:58:30'),
(305, 406, 5, 'W', '13:30:00', '16:30:00', 'Active', '2018-10-13 05:58:49', '2018-10-13 05:58:49'),
(306, 407, 7, 'TH', '16:30:00', '18:00:00', 'Active', '2018-10-13 05:59:07', '2018-10-13 05:59:07'),
(307, 408, 8, 'F', '18:00:00', '21:00:00', 'Active', '2018-10-13 05:59:27', '2018-10-13 05:59:27'),
(308, 409, 1, 'S', '07:30:00', '10:30:00', 'Active', '2018-10-13 05:59:39', '2018-10-13 05:59:39'),
(309, 410, 1, 'M', '10:30:00', '13:30:00', 'Active', '2018-10-13 05:59:51', '2018-10-13 05:59:51'),
(310, 411, 4, 'T', '13:30:00', '16:30:00', 'Active', '2018-10-13 06:00:19', '2018-10-13 06:00:19'),
(311, 412, 5, 'W', '16:30:00', '18:00:00', 'Active', '2018-10-13 06:00:41', '2018-10-13 06:00:41'),
(312, 413, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-13 06:01:00', '2018-10-13 06:01:00'),
(313, 414, 5, 'T', '10:30:00', '13:30:00', 'Active', '2018-10-13 06:01:13', '2018-10-13 06:01:13'),
(314, 415, 6, 'W', '16:30:00', '18:00:00', 'Active', '2018-10-13 06:01:28', '2018-10-13 06:01:28'),
(315, 416, 7, 'TH', '18:00:00', '21:00:00', 'Active', '2018-10-13 06:01:45', '2018-10-13 06:01:45'),
(316, 417, 8, 'F', '07:30:00', '10:30:00', 'Active', '2018-10-13 06:01:57', '2018-10-13 06:01:57'),
(317, 418, 2, 'S', '10:30:00', '13:30:00', 'Active', '2018-10-13 06:02:17', '2018-10-13 06:02:17'),
(318, 419, 5, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 12:28:39', '2018-10-19 21:37:44'),
(319, 419, 5, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 21:37:45', '2018-10-19 21:38:15'),
(320, 419, 5, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 21:38:15', '2018-10-19 21:39:14'),
(321, 419, 5, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 21:39:15', '2018-10-19 21:40:56'),
(322, 419, 5, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 21:40:56', '2018-10-19 22:21:55'),
(323, 419, 5, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:21:55', '2018-10-19 22:22:16'),
(324, 419, 5, 'M', '07:30:00', '10:30:00', 'Active', '2018-10-19 22:22:16', '2018-10-19 22:22:16'),
(325, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:40:31', '2018-10-19 22:40:45'),
(326, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:40:45', '2018-10-19 22:40:53'),
(327, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:40:53', '2018-10-19 22:40:59'),
(328, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:40:59', '2018-10-19 22:41:15'),
(329, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:41:15', '2018-10-19 22:41:21'),
(330, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:41:21', '2018-10-19 22:41:56'),
(331, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:41:56', '2018-10-19 22:46:54'),
(332, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:46:54', '2018-10-19 22:55:33'),
(333, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 22:55:33', '2018-10-19 23:03:37'),
(334, 420, 4, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-10-19 23:03:37', '2018-10-21 18:07:30'),
(335, 420, 4, 'T', '07:30:00', '10:30:00', 'Active', '2018-10-21 18:07:30', '2018-10-21 18:07:30');

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
(10, 2, 26, 8, 1, '7800.00', 'Active', '2018-10-12 19:33:22', '2018-10-12 19:33:22'),
(11, 2, 26, 9, 1, '9300.00', 'Active', '2018-10-12 20:01:34', '2018-10-12 20:01:34'),
(12, 2, 26, 8, 5, '11300.00', 'Active', '2018-10-12 21:59:20', '2018-10-12 21:59:20'),
(13, 2, 26, 9, 5, '10400.00', 'Active', '2018-10-12 22:20:49', '2018-10-12 22:20:49'),
(14, 2, 26, 9, 5, '10400.00', 'Active', '2018-10-12 22:20:50', '2018-10-12 22:20:50'),
(15, 2, 26, 8, 6, '10700.00', 'Active', '2018-10-12 22:40:37', '2018-10-12 22:40:37'),
(16, 2, 26, 10, 6, '2600.00', 'Active', '2018-10-12 23:19:53', '2018-10-12 23:19:53'),
(17, 2, 26, 9, 7, '3800.00', 'Active', '2018-10-12 23:47:55', '2018-10-12 23:47:55');

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
(1, 1, '900.00', 'Active', '2018-10-12 02:07:33', '2018-10-12 04:37:12'),
(2, 2, '70800.00', 'Active', '2018-10-12 02:07:39', '2018-10-12 23:47:55');

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
(231, 437, 18, '2.00', 'Active', '2018-10-12 17:57:03', '2018-10-12 17:57:03'),
(232, 446, 18, '2.75', 'Active', '2018-10-12 17:57:03', '2018-10-12 17:57:03'),
(233, 455, 18, '1.50', 'Active', '2018-10-12 17:57:03', '2018-10-12 17:57:03'),
(234, 467, 18, '1.75', 'Active', '2018-10-12 17:57:04', '2018-10-12 17:57:04'),
(235, 440, 18, '1.25', 'Active', '2018-10-12 17:57:28', '2018-10-12 17:57:28'),
(236, 449, 18, '2.75', 'Active', '2018-10-12 17:57:28', '2018-10-12 17:57:28'),
(237, 458, 18, '3.00', 'Active', '2018-10-12 17:57:28', '2018-10-12 17:57:28'),
(238, 463, 18, '2.50', 'Active', '2018-10-12 17:57:28', '2018-10-12 17:57:28'),
(239, 442, 18, '1.75', 'Active', '2018-10-12 17:57:48', '2018-10-12 17:57:48'),
(240, 451, 18, '2.00', 'Active', '2018-10-12 17:57:49', '2018-10-12 17:57:49'),
(241, 460, 18, '2.75', 'Active', '2018-10-12 17:57:49', '2018-10-12 17:57:49'),
(242, 465, 18, '3.00', 'Active', '2018-10-12 17:57:49', '2018-10-12 17:57:49'),
(243, 438, 18, '2.00', 'Active', '2018-10-12 17:58:13', '2018-10-12 17:58:13'),
(244, 447, 18, '2.75', 'Active', '2018-10-12 17:58:13', '2018-10-12 17:58:13'),
(245, 456, 18, '1.50', 'Active', '2018-10-12 17:58:13', '2018-10-12 17:58:13'),
(246, 468, 18, '1.75', 'Active', '2018-10-12 17:58:13', '2018-10-12 17:58:13'),
(247, 441, 18, '1.25', 'Active', '2018-10-12 17:58:34', '2018-10-12 17:58:34'),
(248, 450, 18, '2.75', 'Active', '2018-10-12 17:58:34', '2018-10-12 17:58:34'),
(249, 459, 18, '3.00', 'Active', '2018-10-12 17:58:34', '2018-10-12 17:58:34'),
(250, 464, 18, '2.50', 'Active', '2018-10-12 17:58:34', '2018-10-12 17:58:34'),
(251, 439, 18, '1.75', 'Active', '2018-10-12 17:59:02', '2018-10-12 17:59:02'),
(252, 448, 18, '2.00', 'Active', '2018-10-12 17:59:02', '2018-10-12 17:59:02'),
(253, 457, 18, '2.75', 'Active', '2018-10-12 17:59:02', '2018-10-12 17:59:02'),
(254, 469, 18, '3.00', 'Active', '2018-10-12 17:59:03', '2018-10-12 17:59:03'),
(255, 443, 18, '2.00', 'Active', '2018-10-12 17:59:30', '2018-10-12 17:59:30'),
(256, 452, 18, '2.75', 'Active', '2018-10-12 17:59:30', '2018-10-12 17:59:30'),
(257, 461, 18, '1.50', 'Active', '2018-10-12 17:59:31', '2018-10-12 17:59:31'),
(258, 470, 18, '1.75', 'Active', '2018-10-12 17:59:31', '2018-10-12 17:59:31'),
(259, 444, 18, '1.25', 'Active', '2018-10-12 17:59:51', '2018-10-12 17:59:51'),
(260, 453, 18, '2.75', 'Active', '2018-10-12 17:59:51', '2018-10-12 17:59:51'),
(261, 462, 18, '3.00', 'Active', '2018-10-12 17:59:51', '2018-10-12 17:59:51'),
(262, 471, 18, '2.50', 'Active', '2018-10-12 17:59:51', '2018-10-12 17:59:51'),
(263, 436, 18, '1.75', 'Active', '2018-10-12 18:00:13', '2018-10-12 18:00:13'),
(264, 445, 18, '2.00', 'Active', '2018-10-12 18:00:13', '2018-10-12 18:00:13'),
(265, 454, 18, '2.75', 'Active', '2018-10-12 18:00:13', '2018-10-12 18:00:13'),
(266, 466, 18, '3.00', 'Active', '2018-10-12 18:00:13', '2018-10-12 18:00:13'),
(267, 476, 18, '1.75', 'Active', '2018-10-12 18:08:33', '2018-10-12 18:08:33'),
(268, 481, 18, '2.00', 'Active', '2018-10-12 18:08:33', '2018-10-12 18:08:33'),
(269, 495, 18, '2.75', 'Active', '2018-10-12 18:08:33', '2018-10-12 18:08:33'),
(270, 499, 18, '3.00', 'Active', '2018-10-12 18:08:33', '2018-10-12 18:08:33'),
(271, 472, 18, '2.00', 'Active', '2018-10-12 18:08:52', '2018-10-12 18:08:52'),
(272, 484, 18, '2.75', 'Active', '2018-10-12 18:08:52', '2018-10-12 18:08:52'),
(273, 491, 18, '1.50', 'Active', '2018-10-12 18:08:52', '2018-10-12 18:08:52'),
(274, 502, 18, '1.75', 'Active', '2018-10-12 18:08:52', '2018-10-12 18:08:52'),
(275, 475, 18, '1.25', 'Active', '2018-10-12 18:09:16', '2018-10-12 18:09:16'),
(276, 487, 18, '2.75', 'Active', '2018-10-12 18:09:16', '2018-10-12 18:09:16'),
(277, 494, 18, '3.00', 'Active', '2018-10-12 18:09:16', '2018-10-12 18:09:16'),
(278, 505, 18, '2.50', 'Active', '2018-10-12 18:09:16', '2018-10-12 18:09:16'),
(279, 477, 18, '1.75', 'Active', '2018-10-12 18:09:36', '2018-10-12 18:09:36'),
(280, 482, 18, '2.00', 'Active', '2018-10-12 18:09:36', '2018-10-12 18:09:36'),
(281, 496, 18, '2.75', 'Active', '2018-10-12 18:09:36', '2018-10-12 18:09:36'),
(282, 500, 18, '3.00', 'Active', '2018-10-12 18:09:36', '2018-10-12 18:09:36'),
(283, 473, 18, '2.00', 'Active', '2018-10-12 18:09:55', '2018-10-12 18:09:55'),
(284, 485, 18, '2.75', 'Active', '2018-10-12 18:09:55', '2018-10-12 18:09:55'),
(285, 492, 18, '1.50', 'Active', '2018-10-12 18:09:55', '2018-10-12 18:09:55'),
(286, 503, 18, '1.75', 'Active', '2018-10-12 18:09:55', '2018-10-12 18:09:55'),
(287, 474, 18, '1.25', 'Active', '2018-10-12 18:10:13', '2018-10-12 18:10:13'),
(288, 486, 18, '2.75', 'Active', '2018-10-12 18:10:13', '2018-10-12 18:10:13'),
(289, 493, 18, '3.00', 'Active', '2018-10-12 18:10:13', '2018-10-12 18:10:13'),
(290, 504, 18, '2.50', 'Active', '2018-10-12 18:10:13', '2018-10-12 18:10:13'),
(291, 480, 18, '2.00', 'Active', '2018-10-12 18:11:07', '2018-10-12 18:11:07'),
(292, 489, 18, '2.75', 'Active', '2018-10-12 18:11:07', '2018-10-12 18:11:07'),
(293, 498, 18, '1.50', 'Active', '2018-10-12 18:11:07', '2018-10-12 18:11:07'),
(294, 507, 18, '1.75', 'Active', '2018-10-12 18:11:07', '2018-10-12 18:11:07'),
(295, 479, 18, '1.25', 'Active', '2018-10-12 18:11:28', '2018-10-12 18:11:28'),
(296, 488, 18, '2.75', 'Active', '2018-10-12 18:11:28', '2018-10-12 18:11:28'),
(297, 497, 18, '3.00', 'Active', '2018-10-12 18:11:28', '2018-10-12 18:11:28'),
(298, 506, 18, '2.50', 'Active', '2018-10-12 18:11:28', '2018-10-12 18:11:28'),
(299, 478, 18, '1.75', 'Active', '2018-10-12 18:11:47', '2018-10-12 18:11:47'),
(300, 483, 18, '2.00', 'Active', '2018-10-12 18:11:47', '2018-10-12 18:11:47'),
(301, 490, 18, '2.75', 'Active', '2018-10-12 18:11:47', '2018-10-12 18:11:47'),
(302, 501, 18, '3.00', 'Active', '2018-10-12 18:11:47', '2018-10-12 18:11:47'),
(303, 510, 18, '1.75', 'Active', '2018-10-12 19:03:22', '2018-10-12 19:03:22'),
(304, 520, 18, '2.00', 'Active', '2018-10-12 19:03:22', '2018-10-12 19:03:22'),
(305, 533, 18, '1.50', 'Active', '2018-10-12 19:03:22', '2018-10-12 19:03:22'),
(306, 541, 18, '2.50', 'Active', '2018-10-12 19:03:22', '2018-10-12 19:03:22'),
(307, 545, 18, '3.00', 'Active', '2018-10-12 19:03:22', '2018-10-12 19:03:22'),
(308, 508, 18, '2.00', 'Active', '2018-10-12 19:07:25', '2018-10-12 19:07:25'),
(309, 518, 18, '2.25', 'Active', '2018-10-12 19:07:25', '2018-10-12 19:07:25'),
(310, 551, 18, '1.75', 'Active', '2018-10-12 19:07:25', '2018-10-12 19:07:25'),
(311, 512, 18, '1.75', 'Active', '2018-10-12 19:07:58', '2018-10-12 19:07:58'),
(312, 522, 18, '1.50', 'Active', '2018-10-12 19:07:58', '2018-10-12 19:07:58'),
(313, 546, 18, '2.25', 'Active', '2018-10-12 19:07:59', '2018-10-12 19:07:59'),
(314, 514, 18, '2.00', 'Active', '2018-10-12 19:08:21', '2018-10-12 19:08:21'),
(315, 524, 18, '2.25', 'Active', '2018-10-12 19:08:21', '2018-10-12 19:08:21'),
(316, 528, 18, '1.50', 'Active', '2018-10-12 19:08:21', '2018-10-12 19:08:21'),
(317, 536, 18, '2.00', 'Active', '2018-10-12 19:08:21', '2018-10-12 19:08:21'),
(318, 549, 18, '2.75', 'Active', '2018-10-12 19:08:21', '2018-10-12 19:08:21'),
(319, 509, 18, '2.00', 'Active', '2018-10-12 19:08:45', '2018-10-12 19:08:45'),
(320, 519, 18, '2.25', 'Active', '2018-10-12 19:08:45', '2018-10-12 19:08:45'),
(321, 531, 18, '1.50', 'Active', '2018-10-12 19:08:45', '2018-10-12 19:08:45'),
(322, 539, 18, '2.00', 'Active', '2018-10-12 19:08:45', '2018-10-12 19:08:45'),
(323, 544, 18, '2.75', 'Active', '2018-10-12 19:08:45', '2018-10-12 19:08:45'),
(324, 513, 18, '1.75', 'Active', '2018-10-12 19:09:05', '2018-10-12 19:09:05'),
(325, 523, 18, '2.00', 'Active', '2018-10-12 19:09:05', '2018-10-12 19:09:05'),
(326, 532, 18, '1.50', 'Active', '2018-10-12 19:09:05', '2018-10-12 19:09:05'),
(327, 540, 18, '2.50', 'Active', '2018-10-12 19:09:05', '2018-10-12 19:09:05'),
(328, 548, 18, '3.00', 'Active', '2018-10-12 19:09:05', '2018-10-12 19:09:05'),
(329, 515, 18, '2.00', 'Active', '2018-10-12 19:09:28', '2018-10-12 19:09:28'),
(330, 525, 18, '2.25', 'Active', '2018-10-12 19:09:28', '2018-10-12 19:09:28'),
(331, 529, 18, '1.50', 'Active', '2018-10-12 19:09:28', '2018-10-12 19:09:28'),
(332, 537, 18, '2.00', 'Active', '2018-10-12 19:09:28', '2018-10-12 19:09:28'),
(333, 550, 18, '2.75', 'Active', '2018-10-12 19:09:28', '2018-10-12 19:09:28'),
(334, 511, 18, '1.75', 'Active', '2018-10-12 19:09:53', '2018-10-12 19:09:53'),
(335, 521, 18, '2.00', 'Active', '2018-10-12 19:09:54', '2018-10-12 19:09:54'),
(336, 530, 18, '1.50', 'Active', '2018-10-12 19:09:54', '2018-10-12 19:09:54'),
(337, 538, 18, '2.50', 'Active', '2018-10-12 19:09:54', '2018-10-12 19:09:54'),
(338, 547, 18, '3.00', 'Active', '2018-10-12 19:09:54', '2018-10-12 19:09:54'),
(339, 526, 18, '1.25', 'Active', '2018-10-12 19:11:48', '2018-10-12 19:11:48'),
(340, 542, 18, '1.50', 'Active', '2018-10-12 19:11:48', '2018-10-12 19:11:48'),
(341, 517, 18, '1.25', 'Active', '2018-10-12 19:13:26', '2018-10-12 19:13:26'),
(342, 535, 18, '1.00', 'Active', '2018-10-12 19:13:26', '2018-10-12 19:13:26'),
(343, 552, 18, '1.75', 'Active', '2018-10-12 19:18:18', '2018-10-12 19:18:18'),
(344, 561, 18, '2.00', 'Active', '2018-10-12 19:54:07', '2018-10-12 19:54:07'),
(345, 571, 18, '2.25', 'Active', '2018-10-12 19:54:07', '2018-10-12 19:54:07'),
(346, 595, 18, '1.75', 'Active', '2018-10-12 19:54:07', '2018-10-12 19:54:07'),
(347, 557, 18, '1.75', 'Active', '2018-10-12 19:54:29', '2018-10-12 19:54:29'),
(348, 567, 18, '1.50', 'Active', '2018-10-12 19:54:29', '2018-10-12 19:54:29'),
(349, 591, 18, '2.25', 'Active', '2018-10-12 19:54:29', '2018-10-12 19:54:29'),
(350, 559, 18, '2.00', 'Active', '2018-10-12 19:54:48', '2018-10-12 19:54:48'),
(351, 569, 18, '2.25', 'Active', '2018-10-12 19:54:48', '2018-10-12 19:54:48'),
(352, 593, 18, '1.75', 'Active', '2018-10-12 19:54:48', '2018-10-12 19:54:48'),
(353, 555, 18, '1.75', 'Active', '2018-10-12 19:55:06', '2018-10-12 19:55:06'),
(354, 565, 18, '1.50', 'Active', '2018-10-12 19:55:06', '2018-10-12 19:55:06'),
(355, 589, 18, '2.25', 'Active', '2018-10-12 19:55:06', '2018-10-12 19:55:06'),
(356, 558, 18, '2.00', 'Active', '2018-10-12 19:55:28', '2018-10-12 19:55:28'),
(357, 568, 18, '2.25', 'Active', '2018-10-12 19:55:28', '2018-10-12 19:55:28'),
(358, 592, 18, '1.75', 'Active', '2018-10-12 19:55:28', '2018-10-12 19:55:28'),
(359, 560, 18, '1.75', 'Active', '2018-10-12 19:55:49', '2018-10-12 19:55:49'),
(360, 570, 18, '1.50', 'Active', '2018-10-12 19:55:49', '2018-10-12 19:55:49'),
(361, 594, 18, '2.25', 'Active', '2018-10-12 19:55:49', '2018-10-12 19:55:49'),
(362, 556, 18, '1.75', 'Active', '2018-10-12 19:56:11', '2018-10-12 19:56:11'),
(363, 566, 18, '1.50', 'Active', '2018-10-12 19:56:11', '2018-10-12 19:56:11'),
(364, 590, 18, '2.25', 'Active', '2018-10-12 19:56:11', '2018-10-12 19:56:11'),
(365, 554, 18, '2.00', 'Active', '2018-10-12 19:57:04', '2018-10-12 19:57:04'),
(366, 564, 18, '2.25', 'Active', '2018-10-12 19:57:04', '2018-10-12 19:57:04'),
(367, 588, 18, '1.75', 'Active', '2018-10-12 19:57:04', '2018-10-12 19:57:04'),
(368, 573, 18, '1.75', 'Active', '2018-10-12 20:03:47', '2018-10-12 20:03:47'),
(369, 587, 18, '1.50', 'Active', '2018-10-12 20:03:47', '2018-10-12 20:03:47'),
(370, 597, 18, '2.00', 'Active', '2018-10-12 20:03:47', '2018-10-12 20:03:47'),
(371, 562, 18, '1.50', 'Active', '2018-10-12 20:05:00', '2018-10-12 20:05:00'),
(372, 579, 18, '1.25', 'Active', '2018-10-12 20:05:00', '2018-10-12 20:05:00'),
(373, 576, 18, '2.00', 'Active', '2018-10-12 20:06:01', '2018-10-12 20:06:01'),
(374, 583, 18, '1.50', 'Active', '2018-10-12 20:06:01', '2018-10-12 20:06:01'),
(375, 606, 18, '2.00', 'Active', '2018-10-12 22:01:09', '2018-10-12 22:01:09'),
(376, 612, 18, '2.25', 'Active', '2018-10-12 22:01:09', '2018-10-12 22:01:09'),
(377, 631, 18, '1.75', 'Active', '2018-10-12 22:01:09', '2018-10-12 22:01:09'),
(378, 598, 18, '1.75', 'Active', '2018-10-12 22:01:40', '2018-10-12 22:01:40'),
(379, 613, 18, '1.50', 'Active', '2018-10-12 22:01:41', '2018-10-12 22:01:41'),
(380, 632, 18, '2.25', 'Active', '2018-10-12 22:01:41', '2018-10-12 22:01:41'),
(381, 601, 18, '2.00', 'Active', '2018-10-12 22:02:11', '2018-10-12 22:02:11'),
(382, 607, 18, '2.25', 'Active', '2018-10-12 22:02:11', '2018-10-12 22:02:11'),
(383, 626, 18, '1.75', 'Active', '2018-10-12 22:02:11', '2018-10-12 22:02:11'),
(384, 599, 18, '1.75', 'Active', '2018-10-12 22:02:39', '2018-10-12 22:02:39'),
(385, 614, 18, '1.50', 'Active', '2018-10-12 22:02:39', '2018-10-12 22:02:39'),
(386, 633, 18, '2.25', 'Active', '2018-10-12 22:02:39', '2018-10-12 22:02:39'),
(387, 602, 18, '2.00', 'Active', '2018-10-12 22:03:04', '2018-10-12 22:03:04'),
(388, 608, 18, '2.25', 'Active', '2018-10-12 22:03:04', '2018-10-12 22:03:04'),
(389, 627, 18, '1.75', 'Active', '2018-10-12 22:03:04', '2018-10-12 22:03:04'),
(390, 605, 18, '2.00', 'Active', '2018-10-12 22:03:32', '2018-10-12 22:03:32'),
(391, 611, 18, '2.25', 'Active', '2018-10-12 22:03:32', '2018-10-12 22:03:32'),
(392, 630, 18, '1.75', 'Active', '2018-10-12 22:03:32', '2018-10-12 22:03:32'),
(393, 600, 18, '1.75', 'Active', '2018-10-12 22:03:57', '2018-10-12 22:03:57'),
(394, 615, 18, '1.50', 'Active', '2018-10-12 22:03:57', '2018-10-12 22:03:57'),
(395, 634, 18, '2.25', 'Active', '2018-10-12 22:03:57', '2018-10-12 22:03:57'),
(396, 603, 18, '2.00', 'Active', '2018-10-12 22:04:29', '2018-10-12 22:04:29'),
(397, 609, 18, '2.25', 'Active', '2018-10-12 22:04:29', '2018-10-12 22:04:29'),
(398, 628, 18, '1.75', 'Active', '2018-10-12 22:04:29', '2018-10-12 22:04:29'),
(399, 604, 18, '1.75', 'Active', '2018-10-12 22:04:55', '2018-10-12 22:04:55'),
(400, 610, 18, '1.50', 'Active', '2018-10-12 22:04:55', '2018-10-12 22:04:55'),
(401, 629, 18, '2.25', 'Active', '2018-10-12 22:04:55', '2018-10-12 22:04:55'),
(402, 618, 18, '1.50', 'Active', '2018-10-12 22:08:03', '2018-10-12 22:08:03'),
(403, 621, 18, '2.00', 'Active', '2018-10-12 22:08:03', '2018-10-12 22:08:03'),
(404, 619, 18, '2.25', 'Active', '2018-10-12 22:08:29', '2018-10-12 22:08:29'),
(405, 622, 18, '1.75', 'Active', '2018-10-12 22:08:29', '2018-10-12 22:08:29'),
(406, 617, 18, '1.50', 'Active', '2018-10-12 22:09:03', '2018-10-12 22:09:03'),
(407, 625, 18, '2.00', 'Active', '2018-10-12 22:09:03', '2018-10-12 22:09:03'),
(408, 616, 18, '2.25', 'Active', '2018-10-12 22:09:22', '2018-10-12 22:09:22'),
(409, 624, 18, '1.75', 'Active', '2018-10-12 22:09:22', '2018-10-12 22:09:22'),
(410, 620, 18, '1.50', 'Active', '2018-10-12 22:09:44', '2018-10-12 22:09:44'),
(411, 623, 18, '2.00', 'Active', '2018-10-12 22:09:44', '2018-10-12 22:09:44'),
(412, 637, 18, '2.00', 'Active', '2018-10-12 22:21:58', '2018-10-12 22:21:58'),
(413, 648, 18, '2.25', 'Active', '2018-10-12 22:21:58', '2018-10-12 22:21:58'),
(414, 659, 18, '1.75', 'Active', '2018-10-12 22:21:58', '2018-10-12 22:21:58'),
(415, 635, 18, '1.75', 'Active', '2018-10-12 22:22:25', '2018-10-12 22:22:25'),
(416, 646, 18, '1.50', 'Active', '2018-10-12 22:22:25', '2018-10-12 22:22:25'),
(417, 665, 18, '2.25', 'Active', '2018-10-12 22:22:25', '2018-10-12 22:22:25'),
(418, 638, 18, '1.75', 'Active', '2018-10-12 22:22:48', '2018-10-12 22:22:48'),
(419, 649, 18, '1.50', 'Active', '2018-10-12 22:22:48', '2018-10-12 22:22:48'),
(420, 660, 18, '2.25', 'Active', '2018-10-12 22:22:48', '2018-10-12 22:22:48'),
(421, 641, 18, '2.00', 'Active', '2018-10-12 22:23:11', '2018-10-12 22:23:11'),
(422, 644, 18, '2.25', 'Active', '2018-10-12 22:23:11', '2018-10-12 22:23:11'),
(423, 663, 18, '1.75', 'Active', '2018-10-12 22:23:11', '2018-10-12 22:23:11'),
(424, 636, 18, '1.75', 'Active', '2018-10-12 22:23:41', '2018-10-12 22:23:41'),
(425, 647, 18, '1.50', 'Active', '2018-10-12 22:23:41', '2018-10-12 22:23:41'),
(426, 666, 18, '2.25', 'Active', '2018-10-12 22:23:41', '2018-10-12 22:23:41'),
(427, 639, 18, '2.00', 'Active', '2018-10-12 22:24:01', '2018-10-12 22:24:01'),
(428, 650, 18, '2.25', 'Active', '2018-10-12 22:24:01', '2018-10-12 22:24:01'),
(429, 661, 18, '1.75', 'Active', '2018-10-12 22:24:01', '2018-10-12 22:24:01'),
(430, 642, 18, '1.75', 'Active', '2018-10-12 22:24:27', '2018-10-12 22:24:27'),
(431, 645, 18, '1.50', 'Active', '2018-10-12 22:24:27', '2018-10-12 22:24:27'),
(432, 664, 18, '2.25', 'Active', '2018-10-12 22:24:27', '2018-10-12 22:24:27'),
(433, 640, 18, '2.00', 'Active', '2018-10-12 22:24:53', '2018-10-12 22:24:53'),
(434, 643, 18, '2.25', 'Active', '2018-10-12 22:24:54', '2018-10-12 22:24:54'),
(435, 662, 18, '1.75', 'Active', '2018-10-12 22:24:54', '2018-10-12 22:24:54'),
(436, 653, 18, '1.50', 'Active', '2018-10-12 22:25:28', '2018-10-12 22:25:28'),
(437, 657, 18, '2.00', 'Active', '2018-10-12 22:25:28', '2018-10-12 22:25:28'),
(438, 652, 18, '2.25', 'Active', '2018-10-12 22:25:59', '2018-10-12 22:25:59'),
(439, 656, 18, '1.75', 'Active', '2018-10-12 22:25:59', '2018-10-12 22:25:59'),
(440, 654, 18, '1.50', 'Active', '2018-10-12 22:26:21', '2018-10-12 22:26:21'),
(441, 658, 18, '2.00', 'Active', '2018-10-12 22:26:21', '2018-10-12 22:26:21'),
(442, 651, 18, '2.25', 'Active', '2018-10-12 22:26:43', '2018-10-12 22:26:43'),
(443, 655, 18, '1.75', 'Active', '2018-10-12 22:26:43', '2018-10-12 22:26:43'),
(444, 669, 18, '1.75', 'Active', '2018-10-12 22:43:14', '2018-10-12 22:43:14'),
(445, 677, 18, '2.00', 'Active', '2018-10-12 22:43:14', '2018-10-12 22:43:14'),
(446, 696, 18, '2.50', 'Active', '2018-10-12 22:43:14', '2018-10-12 22:43:14'),
(447, 672, 18, '2.00', 'Active', '2018-10-12 22:43:40', '2018-10-12 22:43:40'),
(448, 680, 18, '2.25', 'Active', '2018-10-12 22:43:40', '2018-10-12 22:43:40'),
(449, 691, 18, '1.75', 'Active', '2018-10-12 22:43:40', '2018-10-12 22:43:40'),
(450, 667, 18, '1.75', 'Active', '2018-10-12 22:44:05', '2018-10-12 22:44:05'),
(451, 675, 18, '1.50', 'Active', '2018-10-12 22:44:05', '2018-10-12 22:44:05'),
(452, 694, 18, '2.25', 'Active', '2018-10-12 22:44:05', '2018-10-12 22:44:05'),
(453, 670, 18, '1.75', 'Active', '2018-10-12 22:44:34', '2018-10-12 22:44:34'),
(454, 678, 18, '2.00', 'Active', '2018-10-12 22:44:34', '2018-10-12 22:44:34'),
(455, 697, 18, '2.50', 'Active', '2018-10-12 22:44:34', '2018-10-12 22:44:34'),
(456, 673, 18, '2.00', 'Active', '2018-10-12 22:44:57', '2018-10-12 22:44:57'),
(457, 681, 18, '2.25', 'Active', '2018-10-12 22:44:57', '2018-10-12 22:44:57'),
(458, 692, 18, '1.75', 'Active', '2018-10-12 22:44:57', '2018-10-12 22:44:57'),
(459, 668, 18, '1.75', 'Active', '2018-10-12 22:45:24', '2018-10-12 22:45:24'),
(460, 676, 18, '2.00', 'Active', '2018-10-12 22:45:24', '2018-10-12 22:45:24'),
(461, 695, 18, '2.50', 'Active', '2018-10-12 22:45:24', '2018-10-12 22:45:24'),
(462, 671, 18, '1.75', 'Active', '2018-10-12 22:45:48', '2018-10-12 22:45:48'),
(463, 679, 18, '2.00', 'Active', '2018-10-12 22:45:48', '2018-10-12 22:45:48'),
(464, 698, 18, '2.50', 'Active', '2018-10-12 22:45:48', '2018-10-12 22:45:48'),
(465, 674, 18, '1.75', 'Active', '2018-10-12 22:46:14', '2018-10-12 22:46:14'),
(466, 682, 18, '1.50', 'Active', '2018-10-12 22:46:15', '2018-10-12 22:46:15'),
(467, 693, 18, '2.25', 'Active', '2018-10-12 22:46:15', '2018-10-12 22:46:15'),
(468, 684, 18, '2.25', 'Active', '2018-10-12 22:47:30', '2018-10-12 22:47:30'),
(469, 688, 18, '1.75', 'Active', '2018-10-12 22:47:30', '2018-10-12 22:47:30'),
(470, 683, 18, '1.50', 'Active', '2018-10-12 22:48:26', '2018-10-12 22:48:26'),
(471, 687, 18, '2.00', 'Active', '2018-10-12 22:48:26', '2018-10-12 22:48:26'),
(472, 685, 18, '1.50', 'Active', '2018-10-12 22:48:51', '2018-10-12 22:48:51'),
(473, 689, 18, '2.00', 'Active', '2018-10-12 22:48:51', '2018-10-12 22:48:51'),
(474, 686, 18, '2.25', 'Active', '2018-10-12 22:49:44', '2018-10-12 22:49:44'),
(475, 690, 18, '1.75', 'Active', '2018-10-12 22:49:44', '2018-10-12 22:49:44'),
(476, 703, 18, '1.75', 'Active', '2018-10-12 23:07:27', '2018-10-12 23:07:27'),
(477, 710, 18, '1.50', 'Active', '2018-10-12 23:07:27', '2018-10-12 23:07:27'),
(478, 725, 18, '2.25', 'Active', '2018-10-12 23:07:27', '2018-10-12 23:07:27'),
(479, 699, 18, '2.00', 'Active', '2018-10-12 23:09:42', '2018-10-12 23:09:42'),
(480, 706, 18, '2.25', 'Active', '2018-10-12 23:09:43', '2018-10-12 23:09:43'),
(481, 721, 18, '1.75', 'Active', '2018-10-12 23:09:43', '2018-10-12 23:09:43'),
(482, 701, 18, '1.75', 'Active', '2018-10-12 23:10:13', '2018-10-12 23:10:13'),
(483, 708, 18, '2.00', 'Active', '2018-10-12 23:10:13', '2018-10-12 23:10:13'),
(484, 723, 18, '2.50', 'Active', '2018-10-12 23:10:13', '2018-10-12 23:10:13'),
(485, 704, 18, '1.75', 'Active', '2018-10-12 23:10:38', '2018-10-12 23:10:38'),
(486, 711, 18, '1.50', 'Active', '2018-10-12 23:10:38', '2018-10-12 23:10:38'),
(487, 726, 18, '2.25', 'Active', '2018-10-12 23:10:38', '2018-10-12 23:10:38'),
(488, 700, 18, '1.75', 'Active', '2018-10-12 23:11:00', '2018-10-12 23:11:00'),
(489, 707, 18, '2.00', 'Active', '2018-10-12 23:11:00', '2018-10-12 23:11:00'),
(490, 722, 18, '2.50', 'Active', '2018-10-12 23:11:00', '2018-10-12 23:11:00'),
(491, 702, 18, '2.00', 'Active', '2018-10-12 23:11:23', '2018-10-12 23:11:23'),
(492, 709, 18, '2.25', 'Active', '2018-10-12 23:11:23', '2018-10-12 23:11:23'),
(493, 724, 18, '1.75', 'Active', '2018-10-12 23:11:23', '2018-10-12 23:11:23'),
(494, 705, 18, '1.75', 'Active', '2018-10-12 23:11:50', '2018-10-12 23:11:50'),
(495, 712, 18, '1.50', 'Active', '2018-10-12 23:11:50', '2018-10-12 23:11:50'),
(496, 727, 18, '2.25', 'Active', '2018-10-12 23:11:50', '2018-10-12 23:11:50'),
(497, 714, 18, '1.50', 'Active', '2018-10-12 23:12:25', '2018-10-12 23:12:25'),
(498, 718, 18, '2.00', 'Active', '2018-10-12 23:12:25', '2018-10-12 23:12:25'),
(499, 713, 18, '2.25', 'Active', '2018-10-12 23:12:56', '2018-10-12 23:12:56'),
(500, 717, 18, '1.75', 'Active', '2018-10-12 23:12:56', '2018-10-12 23:12:56'),
(501, 715, 18, '1.50', 'Active', '2018-10-12 23:13:41', '2018-10-12 23:13:41'),
(502, 719, 18, '2.00', 'Active', '2018-10-12 23:13:41', '2018-10-12 23:13:41'),
(503, 716, 18, '1.50', 'Active', '2018-10-12 23:14:20', '2018-10-12 23:14:20'),
(504, 720, 18, '2.00', 'Active', '2018-10-12 23:14:20', '2018-10-12 23:14:20'),
(505, 728, 18, '2.00', 'Active', '2018-10-12 23:20:55', '2018-10-12 23:20:55'),
(506, 729, 18, '2.25', 'Active', '2018-10-12 23:20:55', '2018-10-12 23:20:55'),
(507, 730, 18, '1.75', 'Active', '2018-10-12 23:20:55', '2018-10-12 23:20:55'),
(508, 731, 18, '2.00', 'Active', '2018-10-12 23:32:42', '2018-10-12 23:32:42'),
(509, 738, 18, '2.25', 'Active', '2018-10-12 23:32:42', '2018-10-12 23:32:42'),
(510, 757, 18, '1.75', 'Active', '2018-10-12 23:32:42', '2018-10-12 23:32:42'),
(511, 736, 18, '1.75', 'Active', '2018-10-12 23:33:11', '2018-10-12 23:33:11'),
(512, 743, 18, '2.00', 'Active', '2018-10-12 23:33:11', '2018-10-12 23:33:11'),
(513, 762, 18, '2.50', 'Active', '2018-10-12 23:33:11', '2018-10-12 23:33:11'),
(514, 734, 18, '1.75', 'Active', '2018-10-12 23:33:39', '2018-10-12 23:33:39'),
(515, 741, 18, '1.50', 'Active', '2018-10-12 23:33:39', '2018-10-12 23:33:39'),
(516, 760, 18, '2.25', 'Active', '2018-10-12 23:33:39', '2018-10-12 23:33:39'),
(517, 732, 18, '2.00', 'Active', '2018-10-12 23:34:04', '2018-10-12 23:34:04'),
(518, 739, 18, '2.25', 'Active', '2018-10-12 23:34:04', '2018-10-12 23:34:04'),
(519, 758, 18, '1.75', 'Active', '2018-10-12 23:34:04', '2018-10-12 23:34:04'),
(520, 735, 18, '1.75', 'Active', '2018-10-12 23:34:29', '2018-10-12 23:34:29'),
(521, 742, 18, '2.00', 'Active', '2018-10-12 23:34:29', '2018-10-12 23:34:29'),
(522, 761, 18, '2.50', 'Active', '2018-10-12 23:34:29', '2018-10-12 23:34:29'),
(523, 737, 18, '1.75', 'Active', '2018-10-12 23:34:57', '2018-10-12 23:34:57'),
(524, 744, 18, '2.00', 'Active', '2018-10-12 23:34:58', '2018-10-12 23:34:58'),
(525, 763, 18, '2.50', 'Active', '2018-10-12 23:34:58', '2018-10-12 23:34:58'),
(526, 733, 18, '1.75', 'Active', '2018-10-12 23:35:26', '2018-10-12 23:35:26'),
(527, 740, 18, '1.50', 'Active', '2018-10-12 23:35:26', '2018-10-12 23:35:26'),
(528, 759, 18, '2.25', 'Active', '2018-10-12 23:35:27', '2018-10-12 23:35:27'),
(529, 746, 18, '1.50', 'Active', '2018-10-12 23:36:02', '2018-10-12 23:36:02'),
(530, 752, 18, '2.00', 'Active', '2018-10-12 23:36:02', '2018-10-12 23:36:02'),
(531, 747, 18, '1.50', 'Active', '2018-10-12 23:36:29', '2018-10-12 23:36:29'),
(532, 753, 18, '2.00', 'Active', '2018-10-12 23:36:30', '2018-10-12 23:36:30'),
(533, 749, 18, '2.25', 'Active', '2018-10-12 23:36:51', '2018-10-12 23:36:51'),
(534, 755, 18, '1.75', 'Active', '2018-10-12 23:36:51', '2018-10-12 23:36:51'),
(535, 745, 18, '1.50', 'Active', '2018-10-12 23:37:21', '2018-10-12 23:37:21'),
(536, 751, 18, '2.00', 'Active', '2018-10-12 23:37:21', '2018-10-12 23:37:21'),
(537, 748, 18, '1.50', 'Active', '2018-10-12 23:37:46', '2018-10-12 23:37:46'),
(538, 754, 18, '2.00', 'Active', '2018-10-12 23:37:46', '2018-10-12 23:37:46'),
(539, 750, 18, '1.50', 'Active', '2018-10-12 23:38:40', '2018-10-12 23:38:40'),
(540, 764, 18, '1.75', 'Active', '2018-10-12 23:49:10', '2018-10-12 23:49:10'),
(541, 765, 18, '2.00', 'Active', '2018-10-12 23:49:10', '2018-10-12 23:49:10'),
(542, 770, 18, '2.50', 'Active', '2018-10-12 23:49:10', '2018-10-12 23:49:10'),
(543, 767, 18, '1.50', 'Active', '2018-10-12 23:49:57', '2018-10-12 23:49:57'),
(544, 769, 18, '2.00', 'Active', '2018-10-12 23:49:57', '2018-10-12 23:49:57'),
(545, 766, 18, '2.25', 'Active', '2018-10-12 23:50:33', '2018-10-12 23:50:33'),
(546, 768, 18, '1.75', 'Active', '2018-10-12 23:50:33', '2018-10-12 23:50:33'),
(547, 785, 18, '1.75', 'Active', '2018-10-13 04:55:42', '2018-10-13 04:55:42'),
(548, 781, 18, '1.50', 'Active', '2018-10-13 05:06:25', '2018-10-13 05:06:25'),
(549, 782, 18, '1.50', 'Active', '2018-10-13 05:07:06', '2018-10-13 05:07:06'),
(550, 784, 18, '1.75', 'Active', '2018-10-13 05:07:25', '2018-10-13 05:07:25'),
(551, 783, 18, '1.50', 'Active', '2018-10-13 05:07:49', '2018-10-13 05:07:49'),
(552, 779, 18, '1.25', 'Active', '2018-10-13 05:08:49', '2018-10-13 05:08:49'),
(553, 787, 18, '1.25', 'Active', '2018-10-13 05:08:49', '2018-10-13 05:08:49'),
(554, 771, 18, '1.75', 'Active', '2018-10-13 05:10:28', '2018-10-13 05:10:28'),
(555, 774, 18, '1.50', 'Active', '2018-10-13 05:10:48', '2018-10-13 05:10:48'),
(556, 778, 18, '1.75', 'Active', '2018-10-13 05:11:07', '2018-10-13 05:11:07'),
(557, 772, 18, '1.50', 'Active', '2018-10-13 05:11:30', '2018-10-13 05:11:30'),
(558, 775, 18, '1.75', 'Active', '2018-10-13 05:11:48', '2018-10-13 05:11:48'),
(559, 773, 18, '1.50', 'Active', '2018-10-13 05:12:08', '2018-10-13 05:12:08'),
(560, 776, 18, '1.75', 'Active', '2018-10-13 05:12:27', '2018-10-13 05:12:27'),
(561, 777, 18, '1.50', 'Active', '2018-10-13 05:12:52', '2018-10-13 05:12:52'),
(562, 792, 18, '1.75', 'Active', '2018-10-13 05:29:44', '2018-10-13 05:29:44'),
(563, 795, 18, '1.50', 'Active', '2018-10-13 05:30:01', '2018-10-13 05:30:01'),
(564, 793, 18, '1.75', 'Active', '2018-10-13 05:30:18', '2018-10-13 05:30:18'),
(565, 796, 18, '1.50', 'Active', '2018-10-13 05:30:42', '2018-10-13 05:30:42'),
(566, 791, 18, '1.75', 'Active', '2018-10-13 05:31:06', '2018-10-13 05:31:06'),
(567, 789, 18, '1.50', 'Active', '2018-10-13 05:31:49', '2018-10-13 05:31:49'),
(568, 800, 18, '1.75', 'Active', '2018-10-13 05:32:51', '2018-10-13 05:32:51'),
(569, 804, 18, '1.50', 'Active', '2018-10-13 05:34:38', '2018-10-13 05:34:38'),
(570, 797, 18, '1.50', 'Active', '2018-10-13 05:35:53', '2018-10-13 05:35:53'),
(571, 803, 18, '1.75', 'Active', '2018-10-13 05:35:54', '2018-10-13 05:35:54'),
(572, 790, 18, '1.50', 'Active', '2018-10-13 05:37:00', '2018-10-13 05:37:00'),
(573, 794, 18, '1.75', 'Active', '2018-10-13 05:37:28', '2018-10-13 05:37:28'),
(574, 799, 18, '1.75', 'Active', '2018-10-13 05:38:58', '2018-10-13 05:38:58'),
(575, 802, 18, '1.50', 'Active', '2018-10-13 05:39:32', '2018-10-13 05:39:32'),
(576, 801, 18, '1.50', 'Active', '2018-10-13 05:39:51', '2018-10-13 05:39:51');

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
(18, 19, '2018-00001-CM-0', 'Regular', 'First Year', 17, 6, 2, 2, 'New Enrollee', 'Active', '2018-10-12 17:45:20', '2018-10-12 17:45:20'),
(19, 20, '2018-00002-CM-0', 'Regular', 'First Year', 17, 6, 2, 2, 'New Enrollee', 'Active', '2018-10-12 17:45:43', '2018-10-12 17:45:43'),
(20, 21, '2018-00003-CM-0', 'Regular', 'First Year', 17, 6, 2, 2, 'New Enrollee', 'Active', '2018-10-12 17:46:09', '2018-10-12 17:46:09'),
(21, 22, '2018-00004-CM-0', 'Regular', 'First Year', 17, 6, 2, 2, 'New Enrollee', 'Active', '2018-10-12 17:46:40', '2018-10-12 17:46:40'),
(22, 23, '2018-00005-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-12 18:25:45', '2018-10-12 23:28:30'),
(23, 25, '2018-00006-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-12 18:26:02', '2018-10-12 23:28:52'),
(24, 24, '2018-00007-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-12 18:29:29', '2018-10-12 23:29:32'),
(25, 26, '2018-00008-CM-0', 'Regular', 'Fourth Year', 18, 14, 2, 1, 'New Enrollee', 'Active', '2018-10-12 18:29:45', '2018-10-12 23:29:54'),
(26, 27, '2018-00009-CM-0', 'Regular', 'Fourth Year', 17, 11, 2, 1, 'New Enrollee', 'Active', '2018-10-12 18:54:02', '2018-10-12 23:30:18'),
(27, 28, '2018-00010-CM-0', 'Regular', 'Second Year', 17, 7, 2, 1, 'New Enrollee', 'Active', '2018-10-13 04:07:09', '2018-10-13 06:03:48'),
(28, 29, '2018-00011-CM-0', 'Regular', 'Second Year', 18, 12, 2, 1, 'New Enrollee', 'Active', '2018-10-13 04:49:58', '2018-10-13 06:13:12'),
(29, 30, '2018-00012-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-10-18 22:14:44', '2018-10-18 22:14:44'),
(30, 31, '2018-00013-CM-0', 'Regular', 'First Year', 17, 8, 2, 1, 'New Enrollee', 'Active', '2018-10-18 22:20:13', '2018-10-18 22:20:13'),
(31, 32, '2018-00014-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-10-18 22:44:29', '2018-10-18 22:44:29'),
(32, 33, '2018-00015-CM-0', 'Regular', 'First Year', 17, 8, 2, 1, 'New Enrollee', 'Active', '2018-10-18 22:45:47', '2018-10-18 22:45:47'),
(33, 34, '2018-00016-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-10-21 18:08:02', '2018-10-21 18:08:02');

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
(436, 122, 18, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(437, 67, 18, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(438, 78, 18, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(439, 75, 18, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(440, 70, 18, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(441, 121, 18, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:21', '2018-10-12 17:45:21'),
(442, 66, 18, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:22', '2018-10-12 17:45:22'),
(443, 82, 18, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:22', '2018-10-12 17:45:22'),
(444, 83, 18, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:22', '2018-10-12 17:45:22'),
(445, 122, 19, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:43', '2018-10-12 17:45:43'),
(446, 67, 19, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:43', '2018-10-12 17:45:43'),
(447, 78, 19, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:44', '2018-10-12 17:45:44'),
(448, 75, 19, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:44', '2018-10-12 17:45:44'),
(449, 70, 19, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:44', '2018-10-12 17:45:44'),
(450, 121, 19, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:44', '2018-10-12 17:45:44'),
(451, 66, 19, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:44', '2018-10-12 17:45:44'),
(452, 82, 19, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:44', '2018-10-12 17:45:44'),
(453, 83, 19, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:45:44', '2018-10-12 17:45:44'),
(454, 122, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:09', '2018-10-12 17:46:09'),
(455, 67, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:09', '2018-10-12 17:46:09'),
(456, 78, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:09', '2018-10-12 17:46:09'),
(457, 75, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:10', '2018-10-12 17:46:10'),
(458, 70, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:10', '2018-10-12 17:46:10'),
(459, 121, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:10', '2018-10-12 17:46:10'),
(460, 66, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:10', '2018-10-12 17:46:10'),
(461, 82, 20, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:10', '2018-10-12 17:46:10'),
(462, 83, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:10', '2018-10-12 17:46:10'),
(463, 70, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(464, 121, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(465, 66, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(466, 122, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(467, 67, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(468, 78, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:41', '2018-10-12 17:46:41'),
(469, 75, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:42', '2018-10-12 17:46:42'),
(470, 82, 21, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:42', '2018-10-12 17:46:42'),
(471, 83, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-10-12 17:46:42', '2018-10-12 17:46:42'),
(472, 68, 18, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(473, 71, 18, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(474, 100, 18, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(475, 101, 18, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(476, 76, 18, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(477, 69, 18, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(478, 134, 18, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(479, 84, 18, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(480, 85, 18, 'false', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:22', '2018-10-12 18:05:22'),
(481, 76, 19, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:58', '2018-10-12 18:05:58'),
(482, 69, 19, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:58', '2018-10-12 18:05:58'),
(483, 134, 19, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:58', '2018-10-12 18:05:58'),
(484, 68, 19, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:58', '2018-10-12 18:05:58'),
(485, 71, 19, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:58', '2018-10-12 18:05:58'),
(486, 100, 19, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:58', '2018-10-12 18:05:58'),
(487, 101, 19, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:58', '2018-10-12 18:05:58'),
(488, 84, 19, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:58', '2018-10-12 18:05:58'),
(489, 85, 19, 'false', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:05:58', '2018-10-12 18:05:58'),
(490, 134, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:29', '2018-10-12 18:06:29'),
(491, 68, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:29', '2018-10-12 18:06:29'),
(492, 71, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:29', '2018-10-12 18:06:29'),
(493, 100, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:30', '2018-10-12 18:06:30'),
(494, 101, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:30', '2018-10-12 18:06:30'),
(495, 76, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:30', '2018-10-12 18:06:30'),
(496, 69, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:30', '2018-10-12 18:06:30'),
(497, 84, 20, 'false', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:30', '2018-10-12 18:06:30'),
(498, 85, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:30', '2018-10-12 18:06:30'),
(499, 76, 21, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(500, 69, 21, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(501, 134, 21, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(502, 68, 21, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(503, 71, 21, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(504, 100, 21, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(505, 101, 21, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(506, 84, 21, 'false', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(507, 85, 21, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-10-12 18:06:54', '2018-10-12 18:06:54'),
(508, 66, 22, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:45', '2018-10-12 18:25:45'),
(509, 70, 22, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:45', '2018-10-12 18:25:45'),
(510, 75, 22, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:45', '2018-10-12 18:25:45'),
(511, 122, 22, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:45', '2018-10-12 18:25:45'),
(512, 67, 22, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:45', '2018-10-12 18:25:45'),
(513, 78, 22, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:45', '2018-10-12 18:25:45'),
(514, 121, 22, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:45', '2018-10-12 18:25:45'),
(515, 87, 22, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:46', '2018-10-12 18:25:46'),
(516, 82, 22, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:46', '2018-10-12 18:25:46'),
(517, 83, 22, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:25:46', '2018-10-12 18:25:46'),
(518, 66, 23, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(519, 70, 23, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(520, 75, 23, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(521, 122, 23, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(522, 67, 23, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(523, 78, 23, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(524, 121, 23, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(525, 87, 23, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(526, 82, 23, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(527, 83, 23, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:26:03', '2018-10-12 18:26:03'),
(528, 121, 24, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:29', '2018-10-12 18:29:29'),
(529, 87, 24, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:29', '2018-10-12 18:29:29'),
(530, 122, 24, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:29', '2018-10-12 18:29:29'),
(531, 70, 24, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:30', '2018-10-12 18:29:30'),
(532, 78, 24, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:30', '2018-10-12 18:29:30'),
(533, 75, 24, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:30', '2018-10-12 18:29:30'),
(534, 82, 24, 'false', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:30', '2018-10-12 18:29:30'),
(535, 83, 24, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:30', '2018-10-12 18:29:30'),
(536, 121, 25, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(537, 87, 25, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(538, 122, 25, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(539, 70, 25, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(540, 78, 25, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(541, 75, 25, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(542, 82, 25, 'true', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(543, 83, 25, 'false', 'First Year', 8, 1, 6, 18, 'Active', '2018-10-12 18:29:46', '2018-10-12 18:29:46'),
(544, 70, 26, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(545, 75, 26, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(546, 67, 26, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(547, 122, 26, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(548, 78, 26, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(549, 121, 26, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(550, 87, 26, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(551, 66, 26, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(552, 82, 26, 'true', 'First Year', 8, 1, 9, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(553, 83, 26, 'false', 'First Year', 8, 1, 9, 17, 'Active', '2018-10-12 18:54:02', '2018-10-12 18:54:02'),
(554, 134, 22, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:41:47', '2018-10-12 19:41:47'),
(555, 100, 22, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(556, 68, 22, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(557, 79, 22, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(558, 71, 22, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(559, 101, 22, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(560, 76, 22, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(561, 69, 22, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(562, 84, 22, 'true', 'First Year', 9, 1, 9, 17, 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(563, 85, 22, 'false', 'First Year', 9, 1, 9, 17, 'Active', '2018-10-12 19:41:48', '2018-10-12 19:41:48'),
(564, 134, 23, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(565, 100, 23, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(566, 68, 23, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(567, 79, 23, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(568, 71, 23, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(569, 101, 23, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(570, 76, 23, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(571, 69, 23, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(572, 84, 23, 'false', 'First Year', 9, 1, 9, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(573, 85, 23, 'true', 'First Year', 9, 1, 9, 17, 'Active', '2018-10-12 19:42:30', '2018-10-12 19:42:30'),
(574, 76, 24, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:46:39', '2018-10-12 19:46:39'),
(575, 69, 24, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:46:39', '2018-10-12 19:46:39'),
(576, 134, 24, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:46:39', '2018-10-12 19:46:39'),
(577, 79, 24, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:46:39', '2018-10-12 19:46:39'),
(578, 71, 24, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:46:39', '2018-10-12 19:46:39'),
(579, 84, 24, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:46:39', '2018-10-12 19:46:39'),
(580, 85, 24, 'false', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:46:39', '2018-10-12 19:46:39'),
(581, 76, 25, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:49:34', '2018-10-12 19:49:34'),
(582, 69, 25, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:49:34', '2018-10-12 19:49:34'),
(583, 134, 25, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:49:34', '2018-10-12 19:49:34'),
(584, 79, 25, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:49:35', '2018-10-12 19:49:35'),
(585, 71, 25, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:49:35', '2018-10-12 19:49:35'),
(586, 84, 25, 'false', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:49:35', '2018-10-12 19:49:35'),
(587, 85, 25, 'true', 'First Year', 9, 1, 9, 18, 'Active', '2018-10-12 19:49:35', '2018-10-12 19:49:35'),
(588, 134, 26, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(589, 100, 26, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(590, 68, 26, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(591, 79, 26, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(592, 71, 26, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(593, 101, 26, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(594, 76, 26, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(595, 69, 26, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(596, 84, 26, 'false', 'First Year', 9, 1, 9, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(597, 85, 26, 'true', 'First Year', 9, 1, 9, 17, 'Active', '2018-10-12 19:50:28', '2018-10-12 19:50:28'),
(598, 133, 22, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:52:44', '2018-10-12 21:52:44'),
(599, 103, 22, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:52:44', '2018-10-12 21:52:44'),
(600, 72, 22, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:52:45', '2018-10-12 21:52:45'),
(601, 131, 22, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:52:45', '2018-10-12 21:52:45'),
(602, 102, 22, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:52:45', '2018-10-12 21:52:45'),
(603, 89, 22, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:52:45', '2018-10-12 21:52:45'),
(604, 124, 22, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:52:45', '2018-10-12 21:52:45'),
(605, 77, 22, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:52:45', '2018-10-12 21:52:45'),
(606, 92, 22, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:52:45', '2018-10-12 21:52:45'),
(607, 131, 23, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:53:12', '2018-10-12 21:53:12'),
(608, 102, 23, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:53:12', '2018-10-12 21:53:12'),
(609, 89, 23, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:53:12', '2018-10-12 21:53:12'),
(610, 124, 23, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:53:12', '2018-10-12 21:53:12'),
(611, 77, 23, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:53:13', '2018-10-12 21:53:13'),
(612, 92, 23, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:53:13', '2018-10-12 21:53:13'),
(613, 133, 23, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:53:13', '2018-10-12 21:53:13'),
(614, 103, 23, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:53:13', '2018-10-12 21:53:13'),
(615, 72, 23, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:53:13', '2018-10-12 21:53:13'),
(616, 135, 24, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:54:33', '2018-10-12 21:54:33'),
(617, 137, 24, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:54:33', '2018-10-12 21:54:33'),
(618, 99, 24, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:54:33', '2018-10-12 21:54:33'),
(619, 66, 24, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:54:33', '2018-10-12 21:54:33'),
(620, 124, 24, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:54:33', '2018-10-12 21:54:33'),
(621, 99, 25, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:56:40', '2018-10-12 21:56:40'),
(622, 66, 25, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:56:40', '2018-10-12 21:56:40'),
(623, 124, 25, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:56:40', '2018-10-12 21:56:40'),
(624, 135, 25, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:56:40', '2018-10-12 21:56:40'),
(625, 137, 25, 'true', 'Second Year', 8, 5, 12, 18, 'Active', '2018-10-12 21:56:40', '2018-10-12 21:56:40'),
(626, 131, 26, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:57:10', '2018-10-12 21:57:10'),
(627, 102, 26, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:57:10', '2018-10-12 21:57:10'),
(628, 89, 26, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:57:10', '2018-10-12 21:57:10'),
(629, 124, 26, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:57:10', '2018-10-12 21:57:10'),
(630, 77, 26, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:57:10', '2018-10-12 21:57:10'),
(631, 92, 26, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:57:10', '2018-10-12 21:57:10'),
(632, 133, 26, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:57:10', '2018-10-12 21:57:10'),
(633, 103, 26, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:57:10', '2018-10-12 21:57:10'),
(634, 72, 26, 'true', 'Second Year', 8, 5, 7, 17, 'Active', '2018-10-12 21:57:10', '2018-10-12 21:57:10'),
(635, 105, 22, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:15', '2018-10-12 22:17:15'),
(636, 95, 22, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:15', '2018-10-12 22:17:15'),
(637, 132, 22, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:15', '2018-10-12 22:17:15'),
(638, 120, 22, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:15', '2018-10-12 22:17:15'),
(639, 91, 22, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:15', '2018-10-12 22:17:15'),
(640, 125, 22, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:15', '2018-10-12 22:17:15'),
(641, 99, 22, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:16', '2018-10-12 22:17:16'),
(642, 97, 22, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:16', '2018-10-12 22:17:16'),
(643, 125, 23, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:42', '2018-10-12 22:17:42'),
(644, 99, 23, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:42', '2018-10-12 22:17:42'),
(645, 97, 23, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:43', '2018-10-12 22:17:43'),
(646, 105, 23, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:43', '2018-10-12 22:17:43'),
(647, 95, 23, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:43', '2018-10-12 22:17:43'),
(648, 132, 23, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:43', '2018-10-12 22:17:43'),
(649, 120, 23, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:43', '2018-10-12 22:17:43'),
(650, 91, 23, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:17:43', '2018-10-12 22:17:43'),
(651, 136, 24, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-12 22:18:16', '2018-10-12 22:18:16'),
(652, 74, 24, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-12 22:18:16', '2018-10-12 22:18:16'),
(653, 116, 24, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-12 22:18:16', '2018-10-12 22:18:16'),
(654, 138, 24, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-12 22:18:16', '2018-10-12 22:18:16'),
(655, 136, 25, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-12 22:18:36', '2018-10-12 22:18:36'),
(656, 74, 25, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-12 22:18:37', '2018-10-12 22:18:37'),
(657, 116, 25, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-12 22:18:37', '2018-10-12 22:18:37'),
(658, 138, 25, 'true', 'Second Year', 9, 5, 12, 18, 'Active', '2018-10-12 22:18:37', '2018-10-12 22:18:37'),
(659, 132, 26, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:18:57', '2018-10-12 22:18:57'),
(660, 120, 26, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:18:57', '2018-10-12 22:18:57'),
(661, 91, 26, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:18:58', '2018-10-12 22:18:58'),
(662, 125, 26, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:18:58', '2018-10-12 22:18:58'),
(663, 99, 26, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:18:58', '2018-10-12 22:18:58'),
(664, 97, 26, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:18:58', '2018-10-12 22:18:58'),
(665, 105, 26, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:18:58', '2018-10-12 22:18:58'),
(666, 95, 26, 'true', 'Second Year', 9, 5, 7, 17, 'Active', '2018-10-12 22:18:58', '2018-10-12 22:18:58'),
(667, 117, 22, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:22', '2018-10-12 22:37:22'),
(668, 98, 22, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:22', '2018-10-12 22:37:22'),
(669, 88, 22, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:23', '2018-10-12 22:37:23'),
(670, 106, 22, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:23', '2018-10-12 22:37:23'),
(671, 90, 22, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:23', '2018-10-12 22:37:23'),
(672, 130, 22, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:23', '2018-10-12 22:37:23'),
(673, 104, 22, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:23', '2018-10-12 22:37:23'),
(674, 96, 22, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:23', '2018-10-12 22:37:23'),
(675, 117, 23, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:48', '2018-10-12 22:37:48'),
(676, 98, 23, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:48', '2018-10-12 22:37:48'),
(677, 88, 23, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:48', '2018-10-12 22:37:48'),
(678, 106, 23, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:48', '2018-10-12 22:37:48'),
(679, 90, 23, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:48', '2018-10-12 22:37:48'),
(680, 130, 23, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:48', '2018-10-12 22:37:48'),
(681, 104, 23, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:48', '2018-10-12 22:37:48'),
(682, 96, 23, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:37:48', '2018-10-12 22:37:48'),
(683, 145, 24, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-12 22:38:19', '2018-10-12 22:38:19'),
(684, 139, 24, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-12 22:38:19', '2018-10-12 22:38:19'),
(685, 140, 24, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-12 22:38:19', '2018-10-12 22:38:19'),
(686, 141, 24, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-12 22:38:19', '2018-10-12 22:38:19'),
(687, 145, 25, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-12 22:38:38', '2018-10-12 22:38:38'),
(688, 139, 25, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-12 22:38:39', '2018-10-12 22:38:39'),
(689, 140, 25, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-12 22:38:39', '2018-10-12 22:38:39'),
(690, 141, 25, 'true', 'Third Year', 8, 6, 13, 18, 'Active', '2018-10-12 22:38:39', '2018-10-12 22:38:39'),
(691, 130, 26, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(692, 104, 26, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(693, 96, 26, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(694, 117, 26, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(695, 98, 26, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(696, 88, 26, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(697, 106, 26, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(698, 90, 26, 'true', 'Third Year', 8, 6, 10, 17, 'Active', '2018-10-12 22:39:17', '2018-10-12 22:39:17'),
(699, 119, 22, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:56:40', '2018-10-12 22:56:40'),
(700, 93, 22, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:56:40', '2018-10-12 22:56:40'),
(701, 118, 22, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:56:40', '2018-10-12 22:56:40'),
(702, 74, 22, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:56:40', '2018-10-12 22:56:40'),
(703, 107, 22, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:56:40', '2018-10-12 22:56:40'),
(704, 110, 22, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:56:40', '2018-10-12 22:56:40'),
(705, 94, 22, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:56:40', '2018-10-12 22:56:40'),
(706, 119, 23, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:57:01', '2018-10-12 22:57:01'),
(707, 93, 23, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:57:01', '2018-10-12 22:57:01'),
(708, 118, 23, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:57:01', '2018-10-12 22:57:01'),
(709, 74, 23, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:57:01', '2018-10-12 22:57:01'),
(710, 107, 23, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:57:01', '2018-10-12 22:57:01'),
(711, 110, 23, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:57:01', '2018-10-12 22:57:01'),
(712, 94, 23, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 22:57:01', '2018-10-12 22:57:01'),
(713, 146, 24, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-12 22:57:28', '2018-10-12 22:57:28'),
(714, 144, 24, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-12 22:57:28', '2018-10-12 22:57:28'),
(715, 98, 24, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-12 22:57:28', '2018-10-12 22:57:28'),
(716, 142, 24, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-12 22:57:28', '2018-10-12 22:57:28'),
(717, 146, 25, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-12 22:57:49', '2018-10-12 22:57:49'),
(718, 144, 25, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-12 22:57:49', '2018-10-12 22:57:49'),
(719, 98, 25, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-12 22:57:49', '2018-10-12 22:57:49'),
(720, 142, 25, 'true', 'Third Year', 9, 6, 13, 18, 'Active', '2018-10-12 22:57:49', '2018-10-12 22:57:49'),
(721, 119, 26, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 23:02:17', '2018-10-12 23:02:17'),
(722, 93, 26, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 23:02:17', '2018-10-12 23:02:17'),
(723, 118, 26, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 23:02:17', '2018-10-12 23:02:17'),
(724, 74, 26, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 23:02:17', '2018-10-12 23:02:17'),
(725, 107, 26, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 23:02:17', '2018-10-12 23:02:17'),
(726, 110, 26, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 23:02:17', '2018-10-12 23:02:17'),
(727, 94, 26, 'true', 'Third Year', 9, 6, 10, 17, 'Active', '2018-10-12 23:02:17', '2018-10-12 23:02:17'),
(728, 111, 22, 'true', 'Third Year', 10, 6, 10, 17, 'Active', '2018-10-12 23:16:27', '2018-10-12 23:16:27'),
(729, 111, 23, 'true', 'Third Year', 10, 6, 10, 17, 'Active', '2018-10-12 23:16:43', '2018-10-12 23:16:43'),
(730, 111, 26, 'true', 'Third Year', 10, 6, 10, 17, 'Active', '2018-10-12 23:17:01', '2018-10-12 23:17:01'),
(731, 116, 22, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:31', '2018-10-12 23:28:31'),
(732, 109, 22, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:31', '2018-10-12 23:28:31'),
(733, 112, 22, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:31', '2018-10-12 23:28:31'),
(734, 115, 22, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:31', '2018-10-12 23:28:31'),
(735, 73, 22, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:31', '2018-10-12 23:28:31'),
(736, 114, 22, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:31', '2018-10-12 23:28:31'),
(737, 113, 22, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:31', '2018-10-12 23:28:31'),
(738, 116, 23, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:52', '2018-10-12 23:28:52'),
(739, 109, 23, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:52', '2018-10-12 23:28:52'),
(740, 112, 23, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:52', '2018-10-12 23:28:52'),
(741, 115, 23, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:52', '2018-10-12 23:28:52'),
(742, 73, 23, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:52', '2018-10-12 23:28:52'),
(743, 114, 23, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:52', '2018-10-12 23:28:52'),
(744, 113, 23, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:28:52', '2018-10-12 23:28:52'),
(745, 152, 24, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:32', '2018-10-12 23:29:32'),
(746, 150, 24, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:32', '2018-10-12 23:29:32'),
(747, 153, 24, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:32', '2018-10-12 23:29:32'),
(748, 147, 24, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:32', '2018-10-12 23:29:32'),
(749, 151, 24, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:32', '2018-10-12 23:29:32'),
(750, 73, 24, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:32', '2018-10-12 23:29:32'),
(751, 152, 25, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:54', '2018-10-12 23:29:54'),
(752, 150, 25, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:54', '2018-10-12 23:29:54'),
(753, 153, 25, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:54', '2018-10-12 23:29:54'),
(754, 147, 25, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:54', '2018-10-12 23:29:54'),
(755, 151, 25, 'true', 'Fourth Year', 8, 7, 14, 18, 'Active', '2018-10-12 23:29:54', '2018-10-12 23:29:54'),
(756, 73, 25, 'true', 'Fourth Year', 8, 7, 11, 18, 'Active', '2018-10-12 23:29:54', '2018-10-12 23:29:54'),
(757, 116, 26, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:30:18', '2018-10-12 23:30:18'),
(758, 109, 26, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:30:18', '2018-10-12 23:30:18'),
(759, 112, 26, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:30:18', '2018-10-12 23:30:18'),
(760, 115, 26, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:30:18', '2018-10-12 23:30:18'),
(761, 73, 26, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:30:18', '2018-10-12 23:30:18'),
(762, 114, 26, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:30:18', '2018-10-12 23:30:18'),
(763, 113, 26, 'true', 'Fourth Year', 8, 7, 11, 17, 'Active', '2018-10-12 23:30:19', '2018-10-12 23:30:19'),
(764, 108, 22, 'true', 'Fourth Year', 9, 7, 11, 17, 'Active', '2018-10-12 23:45:09', '2018-10-12 23:45:09'),
(765, 108, 23, 'true', 'Fourth Year', 9, 7, 11, 17, 'Active', '2018-10-12 23:45:27', '2018-10-12 23:45:27'),
(766, 149, 24, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2018-10-12 23:45:57', '2018-10-12 23:45:57'),
(767, 148, 24, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2018-10-12 23:45:57', '2018-10-12 23:45:57'),
(768, 149, 25, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2018-10-12 23:46:14', '2018-10-12 23:46:14'),
(769, 148, 25, 'true', 'Fourth Year', 9, 7, 14, 18, 'Active', '2018-10-12 23:46:15', '2018-10-12 23:46:15'),
(770, 108, 26, 'true', 'Fourth Year', 9, 7, 11, 17, 'Active', '2018-10-12 23:46:34', '2018-10-12 23:46:34'),
(771, 121, 27, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2018-10-13 04:07:09', '2018-10-13 04:07:09'),
(772, 87, 27, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2018-10-13 04:07:10', '2018-10-13 04:07:10'),
(773, 66, 27, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2018-10-13 04:07:10', '2018-10-13 04:07:10'),
(774, 70, 27, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2018-10-13 04:07:10', '2018-10-13 04:07:10'),
(775, 75, 27, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2018-10-13 04:07:10', '2018-10-13 04:07:10'),
(776, 67, 27, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2018-10-13 04:07:10', '2018-10-13 04:07:10'),
(777, 122, 27, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2018-10-13 04:07:10', '2018-10-13 04:07:10'),
(778, 78, 27, 'true', 'First Year', 8, 8, 6, 17, 'Active', '2018-10-13 04:07:10', '2018-10-13 04:07:10'),
(779, 82, 27, 'true', 'First Year', 8, 8, 9, 17, 'Active', '2018-10-13 04:07:10', '2018-10-13 04:07:10'),
(780, 83, 27, 'false', 'First Year', 8, 8, 9, 17, 'Active', '2018-10-13 04:07:10', '2018-10-13 04:07:10'),
(781, 121, 28, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2018-10-13 04:49:58', '2018-10-13 04:49:58'),
(782, 87, 28, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2018-10-13 04:49:58', '2018-10-13 04:49:58'),
(783, 122, 28, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2018-10-13 04:49:58', '2018-10-13 04:49:58'),
(784, 70, 28, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2018-10-13 04:49:59', '2018-10-13 04:49:59'),
(785, 78, 28, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2018-10-13 04:49:59', '2018-10-13 04:49:59'),
(786, 75, 28, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2018-10-13 04:49:59', '2018-10-13 04:49:59'),
(787, 82, 28, 'true', 'First Year', 8, 8, 9, 18, 'Active', '2018-10-13 04:49:59', '2018-10-13 04:49:59'),
(788, 83, 28, 'false', 'First Year', 8, 8, 9, 18, 'Active', '2018-10-13 04:49:59', '2018-10-13 04:49:59'),
(789, 134, 27, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(790, 100, 27, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(791, 68, 27, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(792, 79, 27, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(793, 71, 27, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(794, 101, 27, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(795, 76, 27, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(796, 69, 27, 'true', 'First Year', 9, 8, 6, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(797, 84, 27, 'true', 'First Year', 9, 8, 9, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(798, 85, 27, 'false', 'First Year', 9, 8, 9, 17, 'Active', '2018-10-13 05:27:45', '2018-10-13 05:27:45'),
(799, 134, 28, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2018-10-13 05:28:27', '2018-10-13 05:28:27'),
(800, 79, 28, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2018-10-13 05:28:27', '2018-10-13 05:28:27'),
(801, 71, 28, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2018-10-13 05:28:27', '2018-10-13 05:28:27'),
(802, 69, 28, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2018-10-13 05:28:27', '2018-10-13 05:28:27'),
(803, 84, 28, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2018-10-13 05:28:27', '2018-10-13 05:28:27'),
(804, 85, 28, 'true', 'First Year', 9, 8, 9, 18, 'Active', '2018-10-13 05:28:27', '2018-10-13 05:28:27'),
(805, 124, 27, 'true', 'Second Year', 8, 9, 7, 17, 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(806, 77, 27, 'true', 'Second Year', 8, 9, 7, 17, 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(807, 92, 27, 'true', 'Second Year', 8, 9, 7, 17, 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(808, 133, 27, 'true', 'Second Year', 8, 9, 7, 17, 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(809, 103, 27, 'true', 'Second Year', 8, 9, 7, 17, 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(810, 72, 27, 'true', 'Second Year', 8, 9, 7, 17, 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(811, 131, 27, 'true', 'Second Year', 8, 9, 7, 17, 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(812, 102, 27, 'true', 'Second Year', 8, 9, 7, 17, 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(813, 89, 27, 'true', 'Second Year', 8, 9, 7, 17, 'Active', '2018-10-13 06:03:48', '2018-10-13 06:03:48'),
(814, 135, 28, 'true', 'Second Year', 8, 9, 12, 18, 'Active', '2018-10-13 06:13:12', '2018-10-13 06:13:12'),
(815, 137, 28, 'true', 'Second Year', 8, 9, 12, 18, 'Active', '2018-10-13 06:13:12', '2018-10-13 06:13:12'),
(816, 99, 28, 'true', 'Second Year', 8, 9, 12, 18, 'Active', '2018-10-13 06:13:12', '2018-10-13 06:13:12'),
(817, 66, 28, 'true', 'Second Year', 8, 9, 12, 18, 'Active', '2018-10-13 06:13:12', '2018-10-13 06:13:12'),
(818, 124, 28, 'true', 'Second Year', 8, 9, 7, 18, 'Active', '2018-10-13 06:13:12', '2018-10-13 06:13:12'),
(819, 115, 22, 'true', 'First Year', 8, 9, NULL, 17, 'Active', '2018-10-13 06:19:46', '2018-10-13 06:19:46'),
(820, 73, 22, 'true', 'First Year', 8, 9, NULL, 17, 'Active', '2018-10-13 06:19:46', '2018-10-13 06:19:46'),
(821, 114, 22, 'true', 'First Year', 8, 9, NULL, 17, 'Active', '2018-10-13 06:19:46', '2018-10-13 06:19:46'),
(822, 113, 22, 'true', 'First Year', 8, 9, NULL, 17, 'Active', '2018-10-13 06:19:46', '2018-10-13 06:19:46'),
(823, 116, 22, 'true', 'First Year', 8, 9, NULL, 17, 'Active', '2018-10-13 06:19:46', '2018-10-13 06:19:46'),
(824, 109, 22, 'true', 'First Year', 8, 9, NULL, 17, 'Active', '2018-10-13 06:19:46', '2018-10-13 06:19:46'),
(825, 112, 22, 'true', 'First Year', 8, 9, NULL, 17, 'Active', '2018-10-13 06:19:46', '2018-10-13 06:19:46'),
(826, 66, 28, 'true', 'First Year', 8, 9, 12, 17, 'Active', '2018-10-18 22:11:02', '2018-10-18 22:11:02'),
(827, 66, 29, 'true', 'First Year', 8, 9, 12, 17, 'Active', '2018-10-18 22:15:01', '2018-10-18 22:15:01'),
(828, 66, 30, 'true', 'First Year', 8, 9, 12, 17, 'Active', '2018-10-18 22:20:30', '2018-10-18 22:20:30'),
(829, 66, 31, 'true', 'First Year', 8, 9, 12, 17, 'Active', '2018-10-18 22:44:44', '2018-10-18 22:44:44'),
(830, 66, 32, 'true', 'First Year', 8, 9, 12, 17, 'Active', '2018-10-18 22:46:04', '2018-10-18 22:46:04'),
(831, 100, 31, 'true', 'First Year', 9, 9, 6, 17, 'Active', '2018-10-19 23:03:47', '2018-10-19 23:03:47'),
(832, 100, 33, 'true', 'First Year', 9, 9, 6, 17, 'Active', '2018-10-21 18:08:18', '2018-10-21 18:08:18');

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
  MODIFY `Faculty_Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

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
  MODIFY `Mandatory_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `Student_Application_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `r_student_document`
--
ALTER TABLE `r_student_document`
  MODIFY `Student_Document_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `r_student_profile`
--
ALTER TABLE `r_student_profile`
  MODIFY `Student_Profile_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `User_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `t_assign_section_fee_item`
--
ALTER TABLE `t_assign_section_fee_item`
  MODIFY `Assign_Section_Fee_Item_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_breakdown_fee`
--
ALTER TABLE `t_breakdown_fee`
  MODIFY `Breakdown_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

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
  MODIFY `Graduate_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_payable_history`
--
ALTER TABLE `t_payable_history`
  MODIFY `Payable_History_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `t_payment`
--
ALTER TABLE `t_payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `t_payment_history`
--
ALTER TABLE `t_payment_history`
  MODIFY `Payment_History_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_payment_log`
--
ALTER TABLE `t_payment_log`
  MODIFY `Payment_Log_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `t_returnee`
--
ALTER TABLE `t_returnee`
  MODIFY `Returnee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_schedule`
--
ALTER TABLE `t_schedule`
  MODIFY `Schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT for table `t_schedule_items`
--
ALTER TABLE `t_schedule_items`
  MODIFY `Schedule_Items_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=336;

--
-- AUTO_INCREMENT for table `t_scholarship_payment_history`
--
ALTER TABLE `t_scholarship_payment_history`
  MODIFY `Scholarship_Payment_History_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `t_scholar_account`
--
ALTER TABLE `t_scholar_account`
  MODIFY `Scholar_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_students_grade`
--
ALTER TABLE `t_students_grade`
  MODIFY `Students_Grade_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577;

--
-- AUTO_INCREMENT for table `t_student_account`
--
ALTER TABLE `t_student_account`
  MODIFY `Student_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
  MODIFY `Student_Taken_Curriculum_Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=833;

--
-- AUTO_INCREMENT for table `t_summer_class`
--
ALTER TABLE `t_summer_class`
  MODIFY `Summer_Class_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_summer_class_schedule`
--
ALTER TABLE `t_summer_class_schedule`
  MODIFY `Summer_Class_Schedule_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_summer_class_student`
--
ALTER TABLE `t_summer_class_student`
  MODIFY `Summer_Class_Student_ID` int(11) NOT NULL AUTO_INCREMENT;

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
