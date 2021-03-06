-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2018 at 06:42 AM
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
-- Database: `sis_19`
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
(1, 'Nw8ZppgQPxdZ4/lI7MWohg==', 'WzMwG7yRvn3aAvKlxQNzNA==', 'Present', 'Active', '2018-08-02 04:10:43', '2018-09-19 23:19:11'),
(2, 'qEmiI5/0XZY1EFyZ3Pnk6w==', 'mcctP57D/WKwY5t8ETo/jg==', 'Used', 'Active', '2018-08-02 04:11:03', '2018-09-19 23:19:14'),
(3, '0fAtwElD4mZI0N+Nrsxb3g==', 'KrWaPpJ3me479gIH9Ul4WQ==', 'Used', 'Active', '2018-08-02 04:11:30', '2018-09-19 22:57:56'),
(4, 'ELaf4pXwa3mc3exdJrGzSQ==', '0WjdYtbrdVQWbuEaq4wf9Q==', 'Used', 'Active', '2018-08-02 04:11:30', '2018-09-19 22:57:59'),
(5, 'I55TkYDcsryi1XAtHpHVFQ==', 'EvGOxhu8NTTxzbzUK6Hpkw==', 'Not Used', 'Active', '2018-09-09 15:40:42', '2018-09-19 22:56:10');

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
  `Awards_MinimunGWA` float NOT NULL,
  `Awards_MinimunGrade` float NOT NULL,
  `Awards_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Awards_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Awards_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(61, 'tNMw0x0OjbZRt58Sxh4Vtw==', 8, 17, 1, 'Second Year', 0, 'Active', '2018-08-30 17:01:02', '2018-08-30 17:01:02'),
(62, 'y3nr8zTapSoNS89L2tWLUg==', 8, 18, 1, 'First Year', 30, 'Active', '2018-09-01 14:48:36', '2018-09-24 18:16:33'),
(63, 'XymmuEw2PAWoONqqtlkBpQ==', 9, 17, 1, 'Second Year', 0, 'Active', '2018-09-02 15:58:59', '2018-09-02 15:58:59'),
(64, 'LtIAyXvIorDCteOIFZ2gUw==', 8, 17, 1, 'Third Year', 0, 'Active', '2018-09-03 22:33:15', '2018-09-03 22:33:15'),
(65, '0QmHFVqvR9703StJvWisBg==', 9, 17, 1, 'Third Year', 0, 'Active', '2018-09-09 21:01:45', '2018-09-09 21:01:45'),
(66, 'uu9KkCMUNmEQplnsS3qozw==', 8, 17, 1, 'Fourth Year', 0, 'Active', '2018-09-09 21:21:56', '2018-09-09 21:21:56'),
(67, 'bTJIh9A69DRFE0wXaAZNjg==', 9, 18, 1, 'First Year', 0, 'Active', '2018-09-12 23:43:01', '2018-09-12 23:43:01');

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
(90, 60, 69, 'Active', '2018-08-30 16:59:48', '2018-09-24 20:54:47'),
(91, 60, 81, 'Active', '2018-08-30 16:59:48', '2018-09-24 20:54:47'),
(92, 60, 68, 'Active', '2018-08-30 16:59:48', '2018-09-24 20:54:47'),
(93, 61, 74, 'Inactive', '2018-08-30 17:01:02', '2018-09-09 22:10:29'),
(94, 61, 73, 'Inactive', '2018-08-30 17:01:02', '2018-09-09 22:10:29'),
(95, 62, 74, 'Active', '2018-09-01 14:48:36', '2018-09-24 18:26:08'),
(96, 62, 71, 'Active', '2018-09-01 14:48:36', '2018-09-24 18:26:08'),
(97, 62, 80, 'Active', '2018-09-01 14:48:36', '2018-09-24 18:26:08'),
(98, 63, 79, 'Inactive', '2018-09-02 15:58:59', '2018-09-02 15:59:09'),
(99, 63, 68, 'Inactive', '2018-09-02 15:58:59', '2018-09-09 22:30:10'),
(100, 64, 77, 'Inactive', '2018-09-03 22:33:15', '2018-09-09 20:58:47'),
(101, 64, 88, 'Active', '2018-09-09 20:58:47', '2018-09-09 20:58:47'),
(102, 64, 96, 'Active', '2018-09-09 20:58:48', '2018-09-09 20:58:48'),
(103, 64, 90, 'Active', '2018-09-09 20:58:48', '2018-09-09 20:58:48'),
(104, 64, 98, 'Active', '2018-09-09 20:58:48', '2018-09-09 20:58:48'),
(105, 64, 104, 'Active', '2018-09-09 20:58:48', '2018-09-09 20:58:48'),
(106, 64, 106, 'Active', '2018-09-09 20:58:48', '2018-09-09 20:58:48'),
(107, 64, 117, 'Active', '2018-09-09 20:58:48', '2018-09-09 20:58:48'),
(108, 64, 130, 'Active', '2018-09-09 20:58:48', '2018-09-09 20:58:48'),
(109, 65, 94, 'Active', '2018-09-09 21:01:45', '2018-09-09 21:01:45'),
(110, 65, 74, 'Active', '2018-09-09 21:01:45', '2018-09-09 21:01:45'),
(111, 65, 93, 'Active', '2018-09-09 21:01:45', '2018-09-09 21:01:45'),
(112, 65, 110, 'Active', '2018-09-09 21:01:45', '2018-09-09 21:01:45'),
(113, 65, 118, 'Active', '2018-09-09 21:01:45', '2018-09-09 21:01:45'),
(114, 65, 119, 'Active', '2018-09-09 21:01:45', '2018-09-09 21:01:45'),
(115, 65, 107, 'Active', '2018-09-09 21:01:45', '2018-09-09 21:01:45'),
(116, 66, 112, 'Active', '2018-09-09 21:21:56', '2018-09-09 21:33:12'),
(117, 66, 113, 'Active', '2018-09-09 21:21:56', '2018-09-09 21:33:12'),
(118, 66, 73, 'Active', '2018-09-09 21:21:56', '2018-09-09 21:33:12'),
(119, 66, 109, 'Active', '2018-09-09 21:21:56', '2018-09-09 21:33:12'),
(120, 66, 114, 'Active', '2018-09-09 21:21:56', '2018-09-09 21:33:12'),
(121, 66, 115, 'Active', '2018-09-09 21:21:56', '2018-09-09 21:33:12'),
(122, 66, 116, 'Active', '2018-09-09 21:21:56', '2018-09-09 21:33:12'),
(123, 59, 75, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:18'),
(124, 59, 87, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:18'),
(125, 59, 78, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:17'),
(126, 59, 70, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:17'),
(127, 59, 121, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:18'),
(128, 59, 122, 'Active', '2018-09-09 21:51:15', '2018-09-24 20:03:18'),
(129, 60, 76, 'Active', '2018-09-09 21:53:27', '2018-09-24 20:54:47'),
(130, 60, 71, 'Active', '2018-09-09 21:53:27', '2018-09-24 20:54:47'),
(131, 60, 100, 'Active', '2018-09-09 21:53:27', '2018-09-24 20:54:47'),
(132, 60, 101, 'Active', '2018-09-09 21:53:27', '2018-09-24 20:54:47'),
(133, 60, 79, 'Active', '2018-09-09 21:53:27', '2018-09-24 20:54:47'),
(134, 61, 92, 'Active', '2018-09-09 22:10:29', '2018-09-09 22:10:29'),
(135, 61, 89, 'Active', '2018-09-09 22:10:29', '2018-09-09 22:10:29'),
(136, 61, 72, 'Active', '2018-09-09 22:10:29', '2018-09-09 22:10:29'),
(137, 61, 77, 'Active', '2018-09-09 22:10:29', '2018-09-09 22:10:29'),
(138, 61, 102, 'Active', '2018-09-09 22:10:29', '2018-09-09 22:10:29'),
(139, 61, 103, 'Active', '2018-09-09 22:10:29', '2018-09-09 22:10:29'),
(140, 61, 124, 'Active', '2018-09-09 22:10:29', '2018-09-09 22:10:29'),
(141, 61, 131, 'Active', '2018-09-09 22:10:29', '2018-09-09 22:10:29'),
(142, 61, 133, 'Active', '2018-09-09 22:10:29', '2018-09-09 22:10:29'),
(143, 60, 134, 'Active', '2018-09-09 22:24:55', '2018-09-24 20:54:47'),
(144, 63, 97, 'Active', '2018-09-09 22:30:10', '2018-09-09 22:30:10'),
(145, 63, 91, 'Active', '2018-09-09 22:30:10', '2018-09-09 22:30:10'),
(146, 63, 95, 'Active', '2018-09-09 22:30:10', '2018-09-09 22:30:10'),
(147, 63, 99, 'Active', '2018-09-09 22:30:10', '2018-09-09 22:30:10'),
(148, 63, 120, 'Active', '2018-09-09 22:30:10', '2018-09-09 22:30:10'),
(149, 63, 105, 'Active', '2018-09-09 22:30:10', '2018-09-09 22:30:10'),
(150, 63, 125, 'Active', '2018-09-09 22:30:10', '2018-09-09 22:30:10'),
(151, 63, 132, 'Active', '2018-09-09 22:30:10', '2018-09-09 22:30:10'),
(152, 67, 68, 'Active', '2018-09-12 23:45:12', '2018-09-12 23:45:12'),
(153, 62, 65, 'Active', '2018-09-24 18:20:06', '2018-09-24 18:26:08');

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
(1, 'qEmiI5/0XZY1EFyZ3Pnk6w==', 'mcctP57D/WKwY5t8ETo/jg==', 'Active', 'Active', '2018-08-02 07:14:09', '2018-08-02 07:25:06'),
(2, 'JYAxs5DNonwjmZquAxcc/A==', '2nlX+AOfrgX4Eh4PuvjsUg==', 'Inactive', 'Active', '2018-08-09 12:10:32', '2018-08-09 12:10:32');

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
(15, 17, 3, 'Active', '2018-09-04 14:47:35', '2018-09-04 14:47:35');

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
(75, 134, 10, 'Active', '2018-09-16 15:35:04', '2018-09-16 15:35:04');

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
(1, 'Yes', 'Active', '2018-08-19 18:04:29', '2018-08-23 20:26:02');

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
(1, 1, 4, '1100.00', 'Active', '2018-08-02 04:23:27', '2018-09-05 21:34:21');

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
  `Professor_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Professor_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Professor_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_professor`
--

INSERT INTO `r_professor` (`Professor_ID`, `Professor_Code`, `Professor_FirstName`, `Professor_MiddleName`, `Professor_LastName`, `Professor_Display_Status`, `Professor_Date_Added`, `Professor_Date_Updated`) VALUES
(8, '2018-00001', 'olYyybuAZHiS4jCCacsUBA==', '0dhMKWstS4s5FYkBC229bA==', 'QdxIznjBUgbBn9QRU+VNIQ==', 'Active', '2018-09-04 14:33:14', '2018-09-04 14:33:14'),
(9, '2018-00002', 'YRC8WFcoWjTYQ8ynLCZhWw==', '0dhMKWstS4s5FYkBC229bA==', 'QdxIznjBUgbBn9QRU+VNIQ==', 'Active', '2018-09-04 14:33:30', '2018-09-04 15:49:01'),
(10, '2018-00003', 'J4jgpR7vdpDsx1uS165JEA==', 'P94fxJOe/d1qfqcMtmdoKw==', 'ZSlTlOa/54DT9OJi4P1VKQ==', 'Active', '2018-09-04 14:34:47', '2018-09-04 14:34:47'),
(11, '2018-00004', 'nUMUy0qv7qn69o15cyiHWw==', 'wsCoVpCqpD7EPIGSDzaOBg==', 'FbKbciGFt+Xm0H7X+OnAiQ==', 'Active', '2018-09-04 14:35:42', '2018-09-04 14:35:42'),
(12, '2018-00005', 'yfNoUUL+O+DsHadVGQej4Q==', 'HmuLvEkMrk9Ceitmnd9nOQ==', 'cupuhIl2U9hgq3wVIcTNOQ==', 'Active', '2018-09-04 14:39:14', '2018-09-04 14:39:14'),
(13, '2018-00006', 'CL7qsZtcoz2lsI2R+sojMA==', 'ddv187lL70qIr63TzXyplA==', 'T7WYETlR1Nse+A1BR9pCYg==', 'Active', '2018-09-04 14:41:35', '2018-09-04 14:41:35'),
(14, '2018-00007', 'RZidhSb5M+V1ZqVjrbfB1w==', 'qqaScO+OUW0e11CUpP5YHg==', 'jkDLSHwFqlb7G3rLLZXIgA==', 'Active', '2018-09-04 14:43:48', '2018-09-04 14:43:48'),
(15, '2018-00008', '2KcyGvZI6FBelrMhltzZNg==', '2j1sdImV4xSOPy+KFPdc9A==', 'jkDLSHwFqlb7G3rLLZXIgA==', 'Active', '2018-09-04 14:44:58', '2018-09-04 14:44:58'),
(16, '2018-00009', 'byPkUYDPpNHQb93paBdFLA==', '2j1sdImV4xSOPy+KFPdc9A==', 'CH9a4rZhtbU/aMhmSMb6Aw==', 'Active', '2018-09-04 14:46:08', '2018-09-04 14:46:08'),
(17, '2018-00010', 't6niRAaYf1yhyfc8z4yvaw==', 'irWy92C3JmBqJGdNMhO0dg==', 'jiSXlwqztP6v1af2xmDpug==', 'Active', '2018-09-04 14:47:35', '2018-09-04 14:47:35');

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
(2, 17, 'Second Year', 'Yes', 'Active', '2018-08-21 16:58:43', '2018-08-29 12:12:05'),
(3, 17, 'Third Year', 'No', 'Active', '2018-08-21 16:58:43', '2018-09-03 22:52:44'),
(4, 17, 'Fourth Year', 'No', 'Active', '2018-08-21 16:58:43', '2018-08-21 17:00:59'),
(5, 17, 'Fifth Year', 'No', 'Active', '2018-08-21 16:58:44', '2018-08-21 17:01:04');

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
(11, 'BSIT-CM 4-1', '1', 'Fourth Year', 2, 17, 'Active', '2018-09-09 21:23:24', '2018-09-09 21:23:24');

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
(22, 22, '2018-00001', 'Active', '2018-09-19 15:26:50', '2018-09-19 15:26:50'),
(23, 23, '2018-00002', 'Active', '2018-09-19 15:31:24', '2018-09-19 15:31:24'),
(24, 24, '2018-00003', 'Active', '2018-09-19 19:20:13', '2018-09-19 19:20:13'),
(25, 25, '2018-00004', 'Active', '2018-09-19 20:18:33', '2018-09-19 20:18:33'),
(26, 26, '2018-00005', 'Active', '2018-09-24 18:31:36', '2018-09-24 18:31:36');

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
(22, 22, 3, 'Active', '2018-09-19 15:27:01', '2018-09-19 15:27:01'),
(23, 23, 3, 'Active', '2018-09-19 15:31:32', '2018-09-19 15:31:32'),
(24, 24, 3, 'Active', '2018-09-19 19:20:44', '2018-09-19 19:20:44'),
(25, 25, 3, 'Active', '2018-09-22 22:26:37', '2018-09-22 22:26:37'),
(26, 26, 3, 'Active', '2018-09-24 18:31:44', '2018-09-24 18:31:44');

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

INSERT INTO `r_student_profile` (`Student_Profile_ID`, `Student_Profile_First_Name`, `Student_Profile_Middle_Name`, `Student_Profile_Last_Name`, `Student_Profile_Guardian_Contact_Number`, `Student_Profile_Date_Of_Birth`, `Student_Profile_Place_Of_Birth`, `Student_Profile_Gender`, `Student_Profile_Civil_Status`, `Student_Profile_Address`, `Student_Profile_Contact_Number`, `Student_Profile_Email_Address`, `Student_Profile_Display_Status`, `Student_Profile_Date_Added`, `Student_Profile_Date_Updated`) VALUES
(22, '61kU23Mr5BvJPmAbazznCQ==', 'uyRCromTlt0mM0JPmZSLCw==', 'j7ZLMAqZoFl5fYEtFbMfqA==', '09167600247', '2000-02-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'Dyil7ixLUdpHXZWqUJB0AQ==', 'uyRCromTlt0mM0JPmZSLCw==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2018-09-19 15:26:50', '2018-09-20 16:10:54'),
(23, 'Ujxk1v/ThTO72mgliQlVAA==', 'uyRCromTlt0mM0JPmZSLCw==', 'EOCldVzSD4GEA2tuA9qlQw==', NULL, '1999-04-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2018-09-19 15:31:24', '2018-09-19 15:31:24'),
(24, 'W03BpCboKVpCgt+De54fJA==', 'arqckyiEO4YoWLvr8sPD2w==', 'pPYRS2ohXhf63ASC/YR86A==', NULL, '1994-01-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2018-09-19 19:20:13', '2018-09-19 19:20:13'),
(25, 'pZ+u7TN3ZUv1/Baza88CiA==', 'uyRCromTlt0mM0JPmZSLCw==', 'ms4VL3HbO9hQRjk5xdI6qQ==', NULL, '1999-12-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2018-09-19 20:18:33', '2018-09-19 20:18:33'),
(26, 'sjoAZnMzU+nJ6yCqmR2llg==', 'uyRCromTlt0mM0JPmZSLCw==', 'swm663Yyq9uHVjpkdNXjIA==', NULL, '1999-02-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'uyRCromTlt0mM0JPmZSLCw==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2018-09-24 18:31:36', '2018-09-24 18:31:36');

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
(71, 'Dff9+GMBIe+FqCbvNP9qaA==', 'o/fOHE4UsHykF+GPrvk4Hsh/voMs2k3QogME0ncFxuE/YQGndKT5ljTI5txe1mtI', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:15:53', '2018-07-30 19:15:53'),
(72, 'Sj1LAzaGAofW1MwTgPTo3Q==', 'hkKBoN2MbbsJWOFWpqsjSXsL6EongZeCFe1cdBN9Uo0R6Q9I34/iNaa8VApebT2g', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:16:08', '2018-07-30 19:16:08'),
(73, 'vsDRVTBKRUw5m+hIAQLk+g==', 'ApjXPc6XZRXuJizT/YmgxQV6NOlExVrjqo19tP+dIvYPI1PXijZ9uEfQ3L2FLimU', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:16:25', '2018-07-30 19:16:25'),
(74, '6NQGA7ZJOeYRvD9/s2Ztrg==', '949544fRUWyxIQIa+PxLel3MpEqz7w2CLz73M7VRoqE=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:16:42', '2018-07-30 19:16:42'),
(75, 'KvbJ6WzKrFEB1+DLHng+GQ==', 'Ene5pJ6t7Bo9Lc1/IGrfHJ3avG2cz8n132FlLgCdLnlCddil/xIMVwVNpm98qP0+', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:16:59', '2018-07-30 19:16:59'),
(76, 'zEuJ4MmbtWtmjZ640rocvg==', 'NskNzI6T706Wv7hkAfwcxEeM2BBQf/xqMmQ0P4QCTnw=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:17:14', '2018-07-30 19:17:14'),
(77, 't+YP/GXIaxGDzsKM2QPXxg==', '7aR0BJRU799yr1GBkuRAXei1/lyOh4pui17PwFXAvto=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:17:38', '2018-07-30 19:17:38'),
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
(88, 'dkv7AU/Squa0ll5UUC/YmA==', 'tiD1R05ZJVvozOWS4w66uUzHmqqRvHg1siTm3UPNLHbHtY8fXxu8O+MoIa02yKh8djhsQhWixHQu2raO4sZ0oQ==', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:05:53', '2018-09-05 22:05:53'),
(89, 'k+eAaXKm8mMn9mBIY2VZ9A==', '1KGAxrEn2lVaXPZP9KpQLs1KA1TQeoXJ5OQH2xLkpSM=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:07:11', '2018-09-05 22:07:11'),
(90, 'NvDCAmXFodYARJbCxelTmw==', 'Cn9DxpMcwvhT6MU7VSqtS/HlG8/5/CY7/OlnUxURhFw=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:08:09', '2018-09-05 22:08:09'),
(91, 'aloXwX5mQpauoCsKXDeKTg==', 'giqiBLiOb8a9e//0w76Q9YVJaWUiFJ40v5B54mPSsak=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:08:59', '2018-09-05 22:08:59'),
(92, 'PVeapUC0ZyXzQfTFEr4WyA==', 'r7kpUfcs61EpXvbRnK6zR8L+UO+uujOMayYWRgosv/vu1gXjLznIgExCbDjMgIqc', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:09:39', '2018-09-05 22:09:39'),
(93, 'RCdB3qBMhInXJ4sFAVLiQA==', 'fEPcyye28BV/0mS+S1drvcG1gtU8c1zVgjTkbmGvhgk=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:10:10', '2018-09-05 22:10:10'),
(94, '3Q4Ki0ejOUDdwoyDtlvBWQ==', '9s2yY8EnvgNiMSmLq6FPSw==', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:10:38', '2018-09-05 22:10:38'),
(95, 'RwcydLZk7u9xspocYa3Qyw==', 'E3gjvQhMQBQ0w/eStHopDyR+yM9GLs/F86kKsciq5KM=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:11:17', '2018-09-05 22:11:17'),
(96, '/PT6EdwL1UAsp/2ekCoUCA==', 'v5xFudslZokofnvUdJlbKlfDPzQkV7AG+HRL6WfPyiE=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:12:16', '2018-09-05 22:12:16'),
(97, '2yO52oSGa0rcn7fh/ca2uA==', 'q9J40aq2KbN6ctTSKa48ZWm9mh3S706RQa5ZMMXzcnc=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:13:02', '2018-09-05 22:13:02'),
(98, 'WLJ4kXyddrvv8JMMhKV/Ag==', 'KhB8qIyylgXxqOlL1n5QII1bzDsdLZTtBhFtRigBfhw=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:13:40', '2018-09-05 22:13:40'),
(99, 'sp5+O5ZQ6Ajo8fr0ksw/Ag==', 'Hjqm4J+Ta/iPvjgdE8ZapRepVKN1wGTjOE52hXZTaGv0lbCDTOPo02hbnzHouWy3P3pgg0eN13aI0ENE+OGNqw==', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:14:48', '2018-09-05 22:14:48'),
(100, 'twHAAiCsj1ItyJvAhxpC4A==', 'lXbNCpegK5uABQ1ET8Ve9aAYhNiTTfQNHQVEgz3Adv7vcMMNUUvtJh5GCl7f6Dn5', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:16:56', '2018-09-05 22:16:56'),
(101, 'QtvGPzySpOfjdQGjuZ12aA==', 'xeJqbug0ZQPWF9NMbYOCejOCofs9boJav8GU/8pfhgo=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:17:51', '2018-09-05 22:17:51'),
(102, 'UlcOjYyIgkH/iNiH2ApVVQ==', 'dICI4MCHVWcJHmIduQeHbp/vrF3cgQPpQBZcMlG8cok=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:18:29', '2018-09-05 22:18:29'),
(103, 't1qgEPbGnESBXod3Cw7nUg==', 'AFOkC4LKrCYRrS5rGy3I3g==', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:19:45', '2018-09-05 22:19:45'),
(104, 'ISyKujFu9oUrH9Z6l75Pvg==', 'MXf+ZkvkJbwKCt0hvZz1Vw==', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:20:42', '2018-09-05 22:20:42'),
(105, 'xCPbvG8EQpBs/Jgk5ueX0A==', 'ASvN9+PtBb8gYIj3x95YX/C4OhRQoijPn8i2av4bKd0=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:21:22', '2018-09-05 22:21:22'),
(106, 'YyYjybhcuGvszhxpppeG5w==', 'ASvN9+PtBb8gYIj3x95YX4TZIyvG2pXleRp7jCBAQY8=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:21:58', '2018-09-05 22:21:58'),
(107, '6cDveRj9T1dzdQFSqZf8sQ==', 'QEN0YCXOyy3LJdCXK6/T5qVVp/f5pARvt7JMJt1nH2A=', 2, 1, 2, 3, 5, 'Academic', 0, 3, 'Active', '2018-09-05 22:22:37', '2018-09-05 22:22:37'),
(108, '9ccTw/Q5U0IRkowAJCoj4A==', 'OHpgFEDIOAReUYC6MHJMjw==', 9, 9, 9, 0, 9, 'Academic', 0, 9, 'Active', '2018-09-05 22:23:49', '2018-09-05 22:23:49'),
(109, 'AlT/6edA174zMCvUDpSjGA==', 'ZuUf7pttfZw/O9ENqhkpspYrtBzHm0wQyo/G6MWuMM4=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:24:39', '2018-09-05 22:24:39'),
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
(133, 'QIrOmnCZ8grvfN/XJ0zKIw==', 'pkiVr68e0/f/MdhGyHtLcUiwr4LoxslfmNC7CzRvbZI=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-09-05 22:44:01', '2018-09-05 22:44:01'),
(134, '0qpavAYEIG/fJzL7aMXetg==', 'WM/edWF3MTcefuy7rNdc22O1gX8jQ/KBlBWOizqxZ3yOf6ZREpcvtxPyi9SUtgT6', 3, 0, 3, 0, 3, 'Non-Academic', 0, 3, 'Active', '2018-09-09 21:54:49', '2018-09-09 21:54:49');

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
(53, 10, 'Student', 'OdICL0b4JffaA+iN8N2KnQ==', 'OdICL0b4JffaA+iN8N2KnQ==', 'Active', '2018-09-19 15:28:29', '2018-09-19 15:28:29'),
(54, 11, 'Student', 'vUhkbStK1Suay8gSvPR1xA==', 'vUhkbStK1Suay8gSvPR1xA==', 'Active', '2018-09-19 15:32:24', '2018-09-19 15:32:24'),
(55, 12, 'Student', 'X25gHwy8AqQsBIyqq2JPAA==', 'X25gHwy8AqQsBIyqq2JPAA==', 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(56, 13, 'Student', 'GXIl2xL3IN7MrFU908zj5w==', 'GXIl2xL3IN7MrFU908zj5w==', 'Active', '2018-09-23 21:27:33', '2018-09-23 21:27:33');

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
(1, 13, 8, 1, 'REGISTRATION FEE', '1100.00', 'Enrollment', 'Active', '2018-09-23 21:27:33', '2018-09-23 21:27:33'),
(2, 13, 8, 1, 'Academic (26 Tuition Unit)', '7800.00', 'Enrollment', 'Active', '2018-09-23 21:27:33', '2018-09-23 21:27:33');

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

--
-- Dumping data for table `t_payable_history`
--

INSERT INTO `t_payable_history` (`Payable_History_ID`, `Payable_History_Student_Account_ID`, `Payable_History_Semester_ID`, `Payable_History_AcademicYearID`, `Payable_History_Year_Level`, `Payable_History_Description`, `Payable_History_Type`, `Payable_History_Amount`, `Payable_History_Balance`, `Payable_History_ScholarshipID`, `Payable_History_Date_Added`, `Payable_History_Date_Updated`, `Payable_History_Display_Status`) VALUES
(5, 10, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-09-19 15:28:30', '2018-09-19 15:28:30', 'Active'),
(6, 11, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-09-19 15:32:25', '2018-09-19 15:32:25', 'Active'),
(7, 11, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '0.00', 2, '2018-09-19 15:32:25', '2018-09-19 15:32:25', 'Active'),
(8, 12, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-09-19 19:24:51', '2018-09-19 19:24:51', 'Active'),
(9, 12, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '0.00', 2, '2018-09-19 19:24:51', '2018-09-19 19:24:51', 'Active'),
(10, 10, 8, 1, 'First Year', 'CASH - UPON ENROLLMENT', 'Payment', '100.00', '8800.00', NULL, '2018-09-22 21:42:16', '2018-09-22 21:42:16', 'Active'),
(11, 12, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-09-23 21:26:46', '2018-09-23 21:26:46', 'Active'),
(12, 13, 8, 1, 'First Year', 'TOTAL AMOUNT DUE', 'Assessment', '8900.00', '8900.00', NULL, '2018-09-23 21:27:34', '2018-09-23 21:27:34', 'Active'),
(13, 10, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', NULL, '2018-09-23 22:26:30', '2018-09-23 22:26:30', 'Active'),
(14, 11, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', NULL, '2018-09-23 22:26:30', '2018-09-23 22:26:30', 'Active'),
(15, 12, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', NULL, '2018-09-23 22:26:30', '2018-09-23 22:26:30', 'Active'),
(16, 10, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', NULL, '2018-09-23 22:28:24', '2018-09-23 22:28:24', 'Active'),
(17, 11, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', NULL, '2018-09-23 22:28:24', '2018-09-23 22:28:24', 'Active'),
(18, 12, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', NULL, '2018-09-23 22:28:24', '2018-09-23 22:28:24', 'Active'),
(19, 10, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', NULL, '2018-09-23 22:35:08', '2018-09-23 22:35:08', 'Active'),
(20, 11, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', NULL, '2018-09-23 22:35:08', '2018-09-23 22:35:08', 'Active'),
(21, 12, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', NULL, '2018-09-23 22:35:08', '2018-09-23 22:35:08', 'Active'),
(22, 13, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '0.00', NULL, '2018-09-23 22:35:08', '2018-09-23 22:35:08', 'Active'),
(23, 10, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', 2, '2018-09-23 22:38:20', '2018-09-23 22:38:20', 'Active'),
(24, 11, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', 2, '2018-09-23 22:38:21', '2018-09-23 22:38:21', 'Active'),
(25, 12, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '0.00', '0.00', 2, '2018-09-23 22:38:21', '2018-09-23 22:38:21', 'Active'),
(26, 13, 8, 1, 'First Year', 'SCHOLARSHIP PAYMENT', 'Payment', '8900.00', '0.00', 2, '2018-09-23 22:38:21', '2018-09-23 22:38:21', 'Active');

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
(10, 10, '8800.00', 'Active', '2018-09-19 15:28:29', '2018-09-22 21:42:16'),
(11, 11, '0.00', 'Active', '2018-09-19 15:32:24', '2018-09-19 15:32:24'),
(12, 12, '0.00', 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(13, 13, '0.00', 'Active', '2018-09-23 21:27:33', '2018-09-23 22:38:21');

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
-- Table structure for table `t_schedule`
--

CREATE TABLE `t_schedule` (
  `Schedule_ID` int(11) NOT NULL,
  `Schedule_ProfessorID` int(11) DEFAULT NULL,
  `Schedule_CurriculumItemID` int(11) NOT NULL,
  `Schedule_SectionID` int(11) DEFAULT NULL,
  `Schedule_ChildrenID` int(11) DEFAULT NULL,
  `Schedule_AcademicYearID` int(11) NOT NULL,
  `Schedule_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Schedule_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Schedule_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_schedule`
--

INSERT INTO `t_schedule` (`Schedule_ID`, `Schedule_ProfessorID`, `Schedule_CurriculumItemID`, `Schedule_SectionID`, `Schedule_ChildrenID`, `Schedule_AcademicYearID`, `Schedule_Display_Status`, `Schedule_Date_Added`, `Schedule_Date_Updated`) VALUES
(124, 11, 127, 6, NULL, 1, 'Active', '2018-09-19 15:16:15', '2018-09-19 15:16:15'),
(125, 17, 126, 6, NULL, 1, 'Active', '2018-09-19 15:17:07', '2018-09-19 15:17:07'),
(126, 8, 87, 6, NULL, 1, 'Active', '2018-09-19 15:17:35', '2018-09-19 15:17:35'),
(127, 9, 86, 6, NULL, 1, 'Active', '2018-09-19 15:18:24', '2018-09-19 15:18:24'),
(128, 16, 125, 6, NULL, 1, 'Active', '2018-09-19 15:19:11', '2018-09-19 15:19:11'),
(129, 12, 123, 6, NULL, 1, 'Active', '2018-09-19 15:20:12', '2018-09-19 15:20:12'),
(130, 11, 124, 6, NULL, 1, 'Active', '2018-09-19 15:20:54', '2018-09-19 15:20:54'),
(131, 10, 89, 6, 82, 1, 'Active', '2018-09-19 15:21:48', '2018-09-19 15:21:48'),
(132, 10, 89, 6, 83, 1, 'Active', '2018-09-19 15:22:18', '2018-09-19 15:22:18'),
(133, 10, 128, 6, NULL, 1, 'Active', '2018-09-19 15:24:30', '2018-09-19 15:24:30'),
(134, 8, 90, 6, NULL, 1, 'Active', '2018-09-19 19:32:57', '2018-09-19 19:32:57');

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
(1, 124, NULL, 'M', '13:30:00', '16:30:00', 'Inactive', '2018-09-19 15:16:15', '2018-09-19 15:16:53'),
(2, 124, 4, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-09-19 15:16:15', '2018-09-19 15:16:53'),
(3, 124, 4, 'M', '13:30:00', '16:30:00', 'Inactive', '2018-09-19 15:16:53', '2018-09-19 19:17:42'),
(4, 124, 4, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-09-19 15:16:53', '2018-09-19 19:17:42'),
(5, 125, NULL, 'T', '07:30:00', '10:30:00', 'Active', '2018-09-19 15:17:07', '2018-09-19 15:17:07'),
(6, 126, 8, 'T', '07:30:00', '10:30:00', 'Active', '2018-09-19 15:17:35', '2018-09-19 15:17:35'),
(7, 127, NULL, 'W', '17:00:00', '20:00:00', 'Active', '2018-09-19 15:18:24', '2018-09-19 15:18:24'),
(8, 128, 4, 'F', '10:30:00', '13:30:00', 'Active', '2018-09-19 15:19:11', '2018-09-19 15:19:11'),
(9, 129, 4, 'T', '07:30:00', '07:30:00', 'Active', '2018-09-19 15:20:12', '2018-09-19 15:20:12'),
(10, 130, 6, 'W', '15:00:00', '18:00:00', 'Active', '2018-09-19 15:20:54', '2018-09-19 15:20:54'),
(11, 131, 5, 'SU', '13:30:00', '04:30:00', 'Active', '2018-09-19 15:21:48', '2018-09-19 15:21:48'),
(12, 132, NULL, 'SU', '07:30:00', '10:30:00', 'Active', '2018-09-19 15:22:18', '2018-09-19 15:22:18'),
(13, 133, 5, 'TH', '11:30:00', '13:30:00', 'Active', '2018-09-19 15:24:30', '2018-09-19 15:24:30'),
(14, 124, 4, 'T', '13:30:00', '16:30:00', 'Active', '2018-09-19 19:17:42', '2018-09-19 19:17:42'),
(15, 124, 4, 'M', '07:30:00', '10:30:00', 'Active', '2018-09-19 19:17:42', '2018-09-19 19:17:42'),
(16, 134, 4, 'T', '07:30:00', '10:30:00', 'Active', '2018-09-19 19:32:57', '2018-09-19 19:32:57');

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
(1, 102, 9, '1.50', 'Active', '2018-09-19 23:19:37', '2018-09-19 23:19:37'),
(2, 114, 9, 'Not S', 'Active', '2018-09-19 23:19:37', '2018-09-19 23:19:37'),
(3, 126, 9, 'Not S', 'Active', '2018-09-19 23:19:38', '2018-09-19 23:19:38'),
(4, 104, 11, 'Not S', 'Active', '2018-09-19 23:22:51', '2018-09-19 23:22:51'),
(5, 116, 11, '1.00', 'Active', '2018-09-19 23:22:51', '2018-09-19 23:22:51'),
(6, 120, 11, 'Not S', 'Active', '2018-09-19 23:22:51', '2018-09-19 23:22:51'),
(7, 107, 17, '1.25', 'Active', '2018-09-20 15:32:50', '2018-09-20 15:32:50'),
(8, 111, 17, 'I', 'Active', '2018-09-20 15:32:50', '2018-09-20 15:32:50'),
(9, 123, 17, 'Not S', 'Active', '2018-09-20 15:32:50', '2018-09-20 15:32:50');

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
  `Student_Account_CourseID` int(11) NOT NULL,
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
(10, 22, '2018-00001-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-09-19 15:28:29', '2018-09-19 15:28:29'),
(11, 23, '2018-00002-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-09-19 15:32:23', '2018-09-19 15:32:23'),
(12, 24, '2018-00003-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(13, 25, '2018-00004-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-09-23 21:27:32', '2018-09-23 21:27:32');

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
(100, 75, 10, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:29', '2018-09-19 15:28:29'),
(101, 122, 10, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:29', '2018-09-19 15:28:29'),
(102, 67, 10, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:29', '2018-09-19 15:28:29'),
(103, 78, 10, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:30', '2018-09-19 15:28:30'),
(104, 121, 10, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:30', '2018-09-19 15:28:30'),
(105, 87, 10, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:30', '2018-09-19 15:28:30'),
(106, 66, 10, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:30', '2018-09-19 15:28:30'),
(107, 70, 10, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:30', '2018-09-19 15:28:30'),
(108, 82, 10, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:30', '2018-09-19 15:28:30'),
(109, 83, 10, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:28:30', '2018-09-19 15:28:30'),
(110, 66, 11, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:24', '2018-09-19 15:32:24'),
(111, 70, 11, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:24', '2018-09-19 15:32:24'),
(112, 75, 11, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:24', '2018-09-19 15:32:24'),
(113, 122, 11, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:24', '2018-09-19 15:32:24'),
(114, 67, 11, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:25', '2018-09-19 15:32:25'),
(115, 78, 11, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:25', '2018-09-19 15:32:25'),
(116, 121, 11, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:25', '2018-09-19 15:32:25'),
(117, 87, 11, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:25', '2018-09-19 15:32:25'),
(118, 82, 11, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:25', '2018-09-19 15:32:25'),
(119, 83, 11, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 15:32:25', '2018-09-19 15:32:25'),
(120, 121, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(121, 87, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(122, 66, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(123, 70, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(124, 75, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(125, 122, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(126, 67, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:50', '2018-09-19 19:24:50'),
(127, 78, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:51', '2018-09-19 19:24:51'),
(128, 82, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:51', '2018-09-19 19:24:51'),
(129, 83, 12, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-19 19:24:51', '2018-09-19 19:24:51'),
(130, 101, 10, 'false', 'First Year', 9, 1, NULL, 17, 'Active', '2018-09-19 19:33:11', '2018-09-19 19:33:11'),
(131, 76, 10, 'false', 'First Year', 9, 1, NULL, 17, 'Active', '2018-09-19 19:33:11', '2018-09-19 19:33:11'),
(132, 69, 10, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-09-19 19:33:11', '2018-09-19 19:33:11'),
(133, 134, 10, 'false', 'First Year', 9, 1, NULL, 17, 'Active', '2018-09-19 19:33:11', '2018-09-19 19:33:11'),
(134, 100, 10, 'false', 'First Year', 9, 1, NULL, 17, 'Active', '2018-09-19 19:33:11', '2018-09-19 19:33:11'),
(135, 68, 10, 'false', 'First Year', 9, 1, NULL, 17, 'Active', '2018-09-19 19:33:11', '2018-09-19 19:33:11'),
(136, 79, 10, 'false', 'First Year', 9, 1, NULL, 17, 'Active', '2018-09-19 19:33:11', '2018-09-19 19:33:11'),
(137, 71, 10, 'false', 'First Year', 9, 1, NULL, 17, 'Active', '2018-09-19 19:33:11', '2018-09-19 19:33:11'),
(138, 84, 10, 'false', 'First Year', 9, 1, NULL, 17, 'Active', '2018-09-19 19:33:11', '2018-09-19 19:33:11'),
(139, 85, 10, 'false', 'First Year', 9, 1, NULL, 17, 'Active', '2018-09-19 19:33:12', '2018-09-19 19:33:12'),
(140, 66, 10, 'true', 'First Year', 10, 1, 6, 17, 'Active', '2018-09-20 18:39:48', '2018-09-20 18:39:48'),
(141, 66, 12, 'true', 'First Year', 10, 1, 6, 17, 'Active', '2018-09-20 18:39:48', '2018-09-20 18:39:48'),
(142, 67, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:45', '2018-09-23 21:26:45'),
(143, 78, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:45', '2018-09-23 21:26:45'),
(144, 121, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:45', '2018-09-23 21:26:45'),
(145, 87, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:45', '2018-09-23 21:26:45'),
(146, 66, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:46', '2018-09-23 21:26:46'),
(147, 70, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:46', '2018-09-23 21:26:46'),
(148, 75, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:46', '2018-09-23 21:26:46'),
(149, 122, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:46', '2018-09-23 21:26:46'),
(150, 82, 12, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:46', '2018-09-23 21:26:46'),
(151, 83, 12, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:26:46', '2018-09-23 21:26:46'),
(152, 87, 13, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:33', '2018-09-23 21:27:33'),
(153, 66, 13, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:33', '2018-09-23 21:27:33'),
(154, 70, 13, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:33', '2018-09-23 21:27:33'),
(155, 75, 13, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:33', '2018-09-23 21:27:33'),
(156, 122, 13, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:33', '2018-09-23 21:27:33'),
(157, 67, 13, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:34', '2018-09-23 21:27:34'),
(158, 78, 13, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:34', '2018-09-23 21:27:34'),
(159, 121, 13, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:34', '2018-09-23 21:27:34'),
(160, 82, 13, 'true', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:34', '2018-09-23 21:27:34'),
(161, 83, 13, 'false', 'First Year', 8, 1, 6, 17, 'Active', '2018-09-23 21:27:34', '2018-09-23 21:27:34'),
(162, 69, 13, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-09-26 22:59:39', '2018-09-26 22:59:39'),
(163, 69, 11, 'true', 'First Year', 9, 1, 6, 17, 'Active', '2018-09-27 16:51:45', '2018-09-27 16:51:45');

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
(1, '2018-COMP 2013-00001-CM', 1, 2, 66, 8, 'Active', '2018-09-20 18:39:48', '2018-09-20 18:39:48');

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
(1, 1, NULL, '07:30:00', '10:30:00', 'T', '2018-09-20 18:39:48', '2018-09-20 18:39:48', 'Active');

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
(1, 1, 10, 'Active', '2018-09-20 18:39:48', '2018-09-20 18:39:48'),
(2, 1, 12, 'Active', '2018-09-20 18:39:48', '2018-09-20 18:39:48');

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
  MODIFY `Academic_Year_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `r_admin`
--
ALTER TABLE `r_admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_awards`
--
ALTER TABLE `r_awards`
  MODIFY `Awards_ID` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `Curriculum_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `r_curriculumitem`
--
ALTER TABLE `r_curriculumitem`
  MODIFY `CurriculumItem_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

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
-- AUTO_INCREMENT for table `r_faculty_degree`
--
ALTER TABLE `r_faculty_degree`
  MODIFY `Faculty_Degree_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `r_faculty_subject`
--
ALTER TABLE `r_faculty_subject`
  MODIFY `Faculty_Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
  MODIFY `Mandatory_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_prerequisite`
--
ALTER TABLE `r_prerequisite`
  MODIFY `Prerequisite_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_professor`
--
ALTER TABLE `r_professor`
  MODIFY `Professor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `r_registation_opening`
--
ALTER TABLE `r_registation_opening`
  MODIFY `Registation_Opening_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `Section_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `r_semester`
--
ALTER TABLE `r_semester`
  MODIFY `Semester_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `r_student_application`
--
ALTER TABLE `r_student_application`
  MODIFY `Student_Application_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `r_student_document`
--
ALTER TABLE `r_student_document`
  MODIFY `Student_Document_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `r_student_profile`
--
ALTER TABLE `r_student_profile`
  MODIFY `Student_Profile_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `r_subject`
--
ALTER TABLE `r_subject`
  MODIFY `Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

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
  MODIFY `User_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `t_assign_section_fee_item`
--
ALTER TABLE `t_assign_section_fee_item`
  MODIFY `Assign_Section_Fee_Item_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_breakdown_fee`
--
ALTER TABLE `t_breakdown_fee`
  MODIFY `Breakdown_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `Graduate_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_payable_history`
--
ALTER TABLE `t_payable_history`
  MODIFY `Payable_History_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `t_payment`
--
ALTER TABLE `t_payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `t_payment_history`
--
ALTER TABLE `t_payment_history`
  MODIFY `Payment_History_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_schedule`
--
ALTER TABLE `t_schedule`
  MODIFY `Schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `t_schedule_items`
--
ALTER TABLE `t_schedule_items`
  MODIFY `Schedule_Items_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `t_students_grade`
--
ALTER TABLE `t_students_grade`
  MODIFY `Students_Grade_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_student_account`
--
ALTER TABLE `t_student_account`
  MODIFY `Student_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `t_student_enrolled`
--
ALTER TABLE `t_student_enrolled`
  MODIFY `Student_Enrolled_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_student_taken_curriculum_subject`
--
ALTER TABLE `t_student_taken_curriculum_subject`
  MODIFY `Student_Taken_Curriculum_Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `t_summer_class`
--
ALTER TABLE `t_summer_class`
  MODIFY `Summer_Class_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_summer_class_schedule`
--
ALTER TABLE `t_summer_class_schedule`
  MODIFY `Summer_Class_Schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_summer_class_student`
--
ALTER TABLE `t_summer_class_student`
  MODIFY `Summer_Class_Student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
