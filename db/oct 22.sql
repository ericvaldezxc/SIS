-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2018 at 04:52 PM
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
-- Database: `sis_28`
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
(1, 'Nw8ZppgQPxdZ4/lI7MWohg==', 'WzMwG7yRvn3aAvKlxQNzNA==', 'To be Used', 'Active', '2018-08-02 04:10:43', '2018-10-21 21:33:31'),
(2, 'qEmiI5/0XZY1EFyZ3Pnk6w==', 'mcctP57D/WKwY5t8ETo/jg==', 'Present', 'Active', '2018-08-02 04:11:03', '2018-10-21 21:33:31'),
(3, '0fAtwElD4mZI0N+Nrsxb3g==', 'KrWaPpJ3me479gIH9Ul4WQ==', 'Used', 'Active', '2018-08-02 04:11:30', '2018-10-21 21:33:31'),
(4, 'ELaf4pXwa3mc3exdJrGzSQ==', '0WjdYtbrdVQWbuEaq4wf9Q==', 'Used', 'Active', '2018-08-02 04:11:31', '2018-10-21 21:33:01'),
(5, 'I55TkYDcsryi1XAtHpHVFQ==', 'EvGOxhu8NTTxzbzUK6Hpkw==', 'To be Used', 'Active', '2018-09-09 15:40:42', '2018-10-21 21:33:31'),
(6, 'p7pC1UjVvFuljSCpKRq7kQ==', 'keorA2JkN3nuk0zDI0qIyg==', 'To be Used', 'Active', '2018-10-10 19:11:52', '2018-10-21 21:33:31'),
(7, 'E8j4hVZVg5qV4n1dqWnp7Q==', 'HnbFoINMrY9h7ODvTWc9cQ==', 'To be Used', 'Active', '2018-10-12 23:21:54', '2018-10-21 21:33:31'),
(8, '5sCwAzJZt8hEeEhI8d8wJw==', 'sa83ooCLIzWuPZ6gLLCC8g==', 'To be Used', 'Active', '2018-10-13 03:58:28', '2018-10-21 21:33:31'),
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
(8, 'JAf1Hlc/Gtb6XCm1y7MiAA==', 'P7I0qX/sDmywrwb6zWrZbg==', '1', 'Active', 'Active', '2018-07-30 20:11:28', '2018-07-30 20:11:28'),
(9, '3w7k0lW7Bk1hW5/L8WHQkA==', '9+EqntrFg0c/CreWSDoTWw==', '2', 'Inactive', 'Active', '2018-07-30 20:12:16', '2018-07-30 20:12:16'),
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
(85, 27, 'Faculty', 'Tnd4KWO9ZQwDWMscFYH23g==', 'pRulmKsnTjPpkh4/sX3DGw==', 'Active', '2018-10-19 01:27:21', '2018-10-19 01:27:21');

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
(1, 1, '0.00', 'Active', '2018-10-12 02:07:33', '2018-10-21 21:35:48'),
(2, 2, '0.00', 'Active', '2018-10-12 02:07:39', '2018-10-21 21:35:53');

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
