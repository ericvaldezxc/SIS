-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2018 at 11:41 AM
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
-- Database: `sis_8`
--

-- --------------------------------------------------------

--
-- Table structure for table `r_academic_year`
--

CREATE TABLE `r_academic_year` (
  `Academic_Year_ID` int(11) NOT NULL,
  `Academic_Year_Code` varchar(100) NOT NULL,
  `Academic_Year_Description` varchar(100) NOT NULL,
  `Academic_Year_Active_Flag` enum('Present','Used','Not Used') NOT NULL DEFAULT 'Not Used',
  `Academic_Year_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Academic_Year_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Academic_Year_Date_Update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_academic_year`
--

INSERT INTO `r_academic_year` (`Academic_Year_ID`, `Academic_Year_Code`, `Academic_Year_Description`, `Academic_Year_Active_Flag`, `Academic_Year_Display_Status`, `Academic_Year_Date_Added`, `Academic_Year_Date_Update`) VALUES
(1, 'Nw8ZppgQPxdZ4/lI7MWohg==', 'WzMwG7yRvn3aAvKlxQNzNA==', 'Not Used', 'Active', '2018-08-02 04:10:43', '2018-08-02 04:10:43'),
(2, 'qEmiI5/0XZY1EFyZ3Pnk6w==', 'mcctP57D/WKwY5t8ETo/jg==', 'Present', 'Active', '2018-08-02 04:11:03', '2018-08-02 04:11:03'),
(3, '0fAtwElD4mZI0N+Nrsxb3g==', 'KrWaPpJ3me479gIH9Ul4WQ==', 'Not Used', 'Active', '2018-08-02 04:11:30', '2018-08-02 04:11:30'),
(4, 'ELaf4pXwa3mc3exdJrGzSQ==', '0WjdYtbrdVQWbuEaq4wf9Q==', 'Not Used', 'Active', '2018-08-02 04:11:30', '2018-08-02 04:11:30');

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
(2, 'J6kQ1Mh0VQAq2tI+gxodew==', 'Rq1HODXTbrTHi3O5M0Pf9PF2Jidi9EscWAdJ2tArgQVonvLTaDrlZ2j8dtSqtNc0', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Active', '2018-08-02 04:32:24', '2018-08-02 04:32:24'),
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
(1, 16, 1, 'Active', '2018-08-02 22:38:32', '2018-08-02 22:38:32'),
(2, 15, 1, 'Active', '2018-08-02 23:12:43', '2018-08-02 23:12:43'),
(3, 15, 2, 'Active', '2018-08-02 23:12:43', '2018-08-02 23:12:43'),
(4, 14, 1, 'Active', '2018-08-02 23:12:54', '2018-08-02 23:12:54'),
(5, 14, 2, 'Active', '2018-08-02 23:12:54', '2018-08-02 23:12:54');

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
(14, 'sFm1jYcG/rhj1tYVu0THFQ==', 'mI7uBb9KoW17jXbrQ1a4l2ZVBh9cL/atx8avm8zx3G4/TsN3i6rNm+vEN8qb7DVds3YgweAq00pHO6hgzin06A==', 4, 'Active', '2018-07-30 20:09:10', '2018-07-30 20:09:10'),
(15, 'lcppOKK5pTkV/cBXHxenhQ==', '1CNHUgnZQ/hU5noCCEAWT5AQaHSZE+y9drSFNbE0OF3F8SqiY1Lb+bbAIoB5L/sdJY925qDulfakKT/U6qaFxA==', 4, 'Active', '2018-07-30 20:09:35', '2018-07-30 20:09:35'),
(16, 'Fhnc0G5fgAN4Xx99LiZW+g==', 'y9UpwZH2EdSLJdKMurw8iQwpttrHRd0ZK0FiluUhMJEBcMJbGMWrx5eUQwpJj27F', 3, 'Active', '2018-08-02 22:38:32', '2018-08-02 22:38:32');

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
(1, 15, 2, '1', 'Active', '2018-08-02 04:19:45', '2018-08-02 04:19:45'),
(2, 14, 2, '1', 'Active', '2018-08-02 04:24:10', '2018-08-02 04:24:10');

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
(1, 1, 5, '150.00', 'Active', '2018-08-02 04:19:45', '2018-08-02 04:19:45'),
(2, 2, 11, '100.00', 'Active', '2018-08-02 04:24:10', '2018-08-02 04:24:10');

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
  `Curriculum_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Curriculum_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Curriculum_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_curriculum`
--

INSERT INTO `r_curriculum` (`Curriculum_ID`, `Curriculum_Code`, `Curriculum_SemesterID`, `Curriculum_CourseID`, `Curriculum_CurriculumYearID`, `Curriculum_YearLevel`, `Curriculum_Display_Status`, `Curriculum_Date_Added`, `Curriculum_Date_Updated`) VALUES
(51, 'Nls9Fxtg3xXjBh1CD8Lblg==', 8, 15, 1, 'First Year', 'Active', '2018-07-30 20:15:00', '2018-08-02 07:27:28'),
(52, 'y3nr8zTapSoNS89L2tWLUg==', 8, 14, 1, 'First Year', 'Active', '2018-08-01 17:24:00', '2018-08-02 07:27:32'),
(53, 'lLWRBMFTy99+qbJ5tIOnRg==', 8, 14, 1, 'Second Year', 'Active', '2018-08-02 07:40:34', '2018-08-02 07:40:34'),
(54, 'bdf7+NqYS4vyXQhKn+h7aQ==', 8, 16, 1, 'First Year', 'Active', '2018-08-08 20:06:35', '2018-08-08 20:06:35'),
(55, 'LtIAyXvIorDCteOIFZ2gUw==', 8, 15, 1, 'Third Year', 'Active', '2018-08-09 15:14:48', '2018-08-09 15:14:48');

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
(56, 51, 67, 'Active', '2018-07-30 20:15:00', '2018-07-30 20:15:00'),
(57, 51, 66, 'Active', '2018-07-30 20:15:00', '2018-07-30 20:15:00'),
(58, 51, 65, 'Active', '2018-07-30 20:15:00', '2018-07-30 20:15:00'),
(59, 51, 70, 'Active', '2018-07-30 20:15:01', '2018-07-30 20:15:01'),
(60, 51, 71, 'Active', '2018-07-30 20:15:01', '2018-07-30 20:15:01'),
(61, 51, 77, 'Active', '2018-07-30 20:15:01', '2018-07-30 20:15:01'),
(62, 51, 80, 'Active', '2018-07-30 20:15:01', '2018-07-30 20:15:01'),
(63, 52, 65, 'Active', '2018-08-01 17:24:00', '2018-08-07 23:11:41'),
(64, 52, 66, 'Inactive', '2018-08-01 17:24:00', '2018-08-02 07:41:03'),
(65, 52, 68, 'Inactive', '2018-08-01 17:24:00', '2018-08-02 07:41:03'),
(66, 52, 80, 'Active', '2018-08-01 17:24:00', '2018-08-07 23:11:41'),
(67, 52, 66, 'Inactive', '2018-08-02 07:32:21', '2018-08-02 07:41:03'),
(68, 52, 68, 'Inactive', '2018-08-02 07:32:21', '2018-08-02 07:41:03'),
(69, 52, 68, 'Active', '2018-08-02 07:37:40', '2018-08-07 23:11:41'),
(70, 53, 66, 'Active', '2018-08-02 07:40:34', '2018-08-02 07:40:34'),
(71, 54, 65, 'Active', '2018-08-08 20:06:35', '2018-08-08 20:06:35'),
(72, 54, 80, 'Active', '2018-08-08 20:06:35', '2018-08-08 20:06:35'),
(73, 55, 65, 'Active', '2018-08-09 15:14:49', '2018-08-09 15:14:49'),
(74, 55, 67, 'Active', '2018-08-09 15:14:49', '2018-08-09 15:14:49'),
(75, 55, 66, 'Active', '2018-08-09 15:14:49', '2018-08-09 15:14:49');

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
-- Table structure for table `r_documents`
--

CREATE TABLE `r_documents` (
  `Documents_ID` int(11) NOT NULL,
  `Documents_Description` varchar(200) NOT NULL,
  `Documents_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Documents_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Documents_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_documents`
--

INSERT INTO `r_documents` (`Documents_ID`, `Documents_Description`, `Documents_Display_Status`, `Documents_Date_Added`, `Documents_Date_Updated`) VALUES
(1, 'CGGHScsAWoVVbd9g4j72pg==', 'Active', '2018-08-09 22:36:20', '2018-08-09 22:36:20');

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
(1, 2, 4, '1100.00', 'Active', '2018-08-02 04:23:27', '2018-08-02 04:23:27');

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
(19, 68, 66, 'Active', '2018-07-30 19:14:31', '2018-07-30 19:14:31'),
(20, 79, 78, 'Active', '2018-07-30 19:18:29', '2018-07-30 19:18:29');

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
  `Professor_Description` varchar(100) NOT NULL,
  `Professor_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Professor_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Professor_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_professor`
--

INSERT INTO `r_professor` (`Professor_ID`, `Professor_Code`, `Professor_FirstName`, `Professor_MiddleName`, `Professor_LastName`, `Professor_Description`, `Professor_Display_Status`, `Professor_Date_Added`, `Professor_Date_Updated`) VALUES
(1, '2018-00001-CM', 'IyHA5934Cat+oyTi4Alz5Q==', 'uyRCromTlt0mM0JPmZSLCw==', 'jntF34oWQ6bpEHmTbinYSQ==', 'BMXl72aaFYuZksuLkWQP4A==', 'Active', '2018-08-05 15:14:00', '2018-08-05 15:14:00'),
(2, '2018-00002-CM', 'rttmvxqCxYnR4hOYMqItKw==', 'uyRCromTlt0mM0JPmZSLCw==', 'eAuM56FP3vgIitoOdDz0cw==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2018-08-05 15:14:19', '2018-08-05 15:14:19'),
(3, '2018-00003-CM', 'CdfnDk9W+bVcXlw1DAZZaA==', 'ko/Z6WxCJoE5bDx3gCeXUQ==', 'gq4Fgnt6Z83pR28+U/sPYg==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2018-08-05 15:14:38', '2018-08-05 15:14:38');

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
(1, 'edcmYZ6p60DmloUEjfaG/A==', 1, 'hMdMPkmW/+oEJdW8w4fqDw==', 'Active', '2018-08-05 15:53:11', '2018-08-05 15:53:11'),
(2, 'aTvCPjV+EyFfmG97T7yAFA==', 1, 'aTvCPjV+EyFfmG97T7yAFA==', 'Active', '2018-08-05 15:55:43', '2018-08-05 15:55:43');

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
(2, 'BBTE-NOVA 1-1', '1', 'First Year', 1, 14, 'Active', '2018-08-02 04:36:23', '2018-08-02 04:37:35'),
(3, 'BSIT-NOVA 1-1', '1', 'First Year', 1, 15, 'Active', '2018-08-02 04:37:47', '2018-08-02 04:37:47'),
(4, 'BSIT-NOVA 1-2', '2', 'First Year', 1, 15, 'Active', '2018-08-05 21:10:38', '2018-08-05 21:10:38'),
(5, 'DICT-NOVA 1-1', '1', 'First Year', 1, 16, 'Active', '2018-08-08 14:21:28', '2018-08-08 14:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `r_semester`
--

CREATE TABLE `r_semester` (
  `Semester_ID` int(11) NOT NULL,
  `Semester_Code` varchar(100) NOT NULL,
  `Semester_Description` varchar(100) NOT NULL,
  `Semester_Active_Flag` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive',
  `Semester_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Semester_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Semester_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_semester`
--

INSERT INTO `r_semester` (`Semester_ID`, `Semester_Code`, `Semester_Description`, `Semester_Active_Flag`, `Semester_Display_Status`, `Semester_Date_Added`, `Semester_Date_Updated`) VALUES
(8, 'JAf1Hlc/Gtb6XCm1y7MiAA==', 'P7I0qX/sDmywrwb6zWrZbg==', 'Active', 'Active', '2018-07-30 20:11:28', '2018-07-30 20:11:28'),
(9, '3w7k0lW7Bk1hW5/L8WHQkA==', '9+EqntrFg0c/CreWSDoTWw==', 'Inactive', 'Active', '2018-07-30 20:12:16', '2018-07-30 20:12:16'),
(10, 'rYpY2pWQC5nB+Z1mTYXlrg==', 'fmdICxI2e5LZ2HRD0TVLhQ==', 'Inactive', 'Active', '2018-07-30 20:12:16', '2018-07-30 20:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `r_student_profile`
--

CREATE TABLE `r_student_profile` (
  `Student_Profile_ID` int(11) NOT NULL,
  `Student_Profile_First_Name` varchar(100) NOT NULL,
  `Student_Profile_Middle_Name` varchar(100) NOT NULL,
  `Student_Profile_Last_Name` varchar(100) NOT NULL,
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

INSERT INTO `r_student_profile` (`Student_Profile_ID`, `Student_Profile_First_Name`, `Student_Profile_Middle_Name`, `Student_Profile_Last_Name`, `Student_Profile_Date_Of_Birth`, `Student_Profile_Place_Of_Birth`, `Student_Profile_Gender`, `Student_Profile_Civil_Status`, `Student_Profile_Address`, `Student_Profile_Contact_Number`, `Student_Profile_Email_Address`, `Student_Profile_Display_Status`, `Student_Profile_Date_Added`, `Student_Profile_Date_Updated`) VALUES
(5, '7uMs7QCme3AEz7+c549lrw==', 'uyRCromTlt0mM0JPmZSLCw==', 'Qn0vTZzB43GerTx3wO6ZSw==', '2000-12-12', 'Dyil7ixLUdpHXZWqUJB0AQ==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'W716bCIMVbeTdX+VGjsySA==', 'N6YpGoxF1+nn9aXKfl+dgg==', 'Active', '2018-08-01 17:24:40', '2018-08-01 17:24:40'),
(6, 'YEtxmhwpaUX5E9xNcmL0YA==', 'uyRCromTlt0mM0JPmZSLCw==', 'CK1ST42XWtXYwKep6B039Q==', '2000-12-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'ER6shEAgAt5EZ3ti3kIJrw==', 'z6vlQmQombznmocm13+g4+a9JFZfV+aEugZq+jIlZS0=', 'Active', '2018-08-02 08:50:35', '2018-08-02 08:50:35'),
(7, 'CmQUM544qewgkJKcqJHGlQ==', 'uyRCromTlt0mM0JPmZSLCw==', 'HrJhAf3vSKTmMmGisXMCJA==', '2012-12-12', 'Dyil7ixLUdpHXZWqUJB0AQ==', 'Male', 'Single', 'AVUpopW4iuVP/oE1dA2Zag==', 'GNONF2gszWQg6feB+EDudA==', 'Xk5N2KWfEKIMyM4RiNOrjxmXWFtF22HavIojScRoUvs=', 'Active', '2018-08-02 09:26:05', '2018-08-02 09:26:05'),
(8, '29e2NfjG5CwlQsFLxfk76w==', 'uyRCromTlt0mM0JPmZSLCw==', 'gNeiWcucqVMj7dnVtS+FYg==', '1999-03-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'D4GjavqtTbpcLNizs5ed6g==', 'f1AOXzGrTQVRZEq1XFhYOOW7Nh12c5SxpYEaeCv4SbM=', 'Active', '2018-08-02 21:14:37', '2018-08-02 21:14:37'),
(9, '2eGUKEjyyp8x9uAGzbn+Bg==', 'uyRCromTlt0mM0JPmZSLCw==', 'Blf0xM9tfsExd3StAYxeUg==', '2001-04-12', 'pY1W34jwsnkL83NPPAfETg==', 'Female', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'm98OUXoadWGug1qMZ+asfQ==', 'ryotAU36IFfdCOezOVzg2w==', 'Active', '2018-08-04 18:05:02', '2018-08-04 18:05:02'),
(10, 'W03BpCboKVpCgt+De54fJA==', 'uyRCromTlt0mM0JPmZSLCw==', 'pPYRS2ohXhf63ASC/YR86A==', '2000-02-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'Dyil7ixLUdpHXZWqUJB0AQ==', 'qwqt5XvxDD4JVKqkWzv0wA==', 'wPyXk7V2WPNKqR4gV2RhLyknAvR34Dv30OWz//cj0Eg=', 'Active', '2018-08-08 20:10:23', '2018-08-08 20:10:23');

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
  `Subject_Group` int(11) NOT NULL DEFAULT '0',
  `Subject_Credited_Units` int(11) NOT NULL DEFAULT '0',
  `Subject_Display_Stat` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Subject_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Subject_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_subject`
--

INSERT INTO `r_subject` (`Subject_ID`, `Subject_Code`, `Subject_Description`, `Subject_Lecture_Units`, `Subject_Laboratory_Units`, `Subject_Lecture_Hours`, `Subject_Laboratory_Hours`, `Subject_Tuition_Hours`, `Subject_Type`, `Subject_Group`, `Subject_Credited_Units`, `Subject_Display_Stat`, `Subject_Date_Added`, `Subject_Date_Updated`) VALUES
(65, '4LxDhvXMWqBMCFnVXJc8ZA==', 't5a7ymD9Jb37vRi8gnxDgMLcM8nX4DbkR3uUrw12bbQ=', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:11:50', '2018-07-30 19:11:50'),
(66, 'CeIl1Elz9hPJWNJOZ1xLtA==', 'KhB8qIyylgXxqOlL1n5QINZ438BPqqHO6Wr5ykZG6/vb5jlFH9WvDmOINZ+31Vghcb6AmD7S3X85Ji8l5lLV0Q==', 2, 1, 2, 3, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:12:15', '2018-08-02 06:03:11'),
(67, 'QUTN3cNHxr+i8vpKAl7g6w==', 'N9zSAZx9L+fS8U40tuoMiZpjVZIIRcbBi0j24QaeSRMsvWiRgec/qvjcUA3DJN6z', 2, 1, 2, 3, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:12:57', '2018-08-02 06:03:18'),
(68, '0QHU1UkMdZM9mX2pRNxHuQ==', 'itzqSddl8THd/ZNOAXbAEw==', 2, 1, 2, 3, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:14:31', '2018-08-02 06:03:14'),
(69, '22VkeEJJDPg4341vpxADJA==', '2C+tjiDifDw8KBiID2x38kCjhGOsI0nEAgZpj++EruxBcblKHax1QGYdsaOQ7KSz', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:15:04', '2018-07-30 19:15:04'),
(70, '6bPMKx4UE9Ydatalk582Zw==', 's1x/ZZx9PU9KKa1R1on5b8cdh2xXAXfV77CO9cBUK2MsRkN/CLS0vtZ3+CHoWjM2', 3, 0, 3, 0, 3, 'Academic', 0, 3, 'Active', '2018-07-30 19:15:34', '2018-07-30 19:15:34'),
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
(83, '2+c5lyP1MXPUk/mNdyJhVw==', 'p3Epn713d5L3HdKSxJQp/DePVoPRIxMjhVbSRQ6dhPKkTch5TdvrnBRwkurijCzr', 3, 0, 3, 0, 3, 'Non-Academic', 80, 3, 'Active', '2018-07-30 19:47:27', '2018-07-30 19:47:27');

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

--
-- Dumping data for table `r_subject_fee`
--

INSERT INTO `r_subject_fee` (`Subject_Fee_ID`, `Subject_Fee_AcademicYearID`, `Subject_Fee_SubjectID`, `Subject_Fee_Display_Status`, `Subject_Fee_Date_Added`, `Subject_Fee_Date_Updated`) VALUES
(1, 2, 80, 'Active', '2018-08-02 04:23:12', '2018-08-02 04:23:12');

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

--
-- Dumping data for table `r_subject_fee_items`
--

INSERT INTO `r_subject_fee_items` (`Subject_Fee_Items_ID`, `Subject_Fee_Items_SubjectFeeID`, `Subject_Fee_Items_FeeID`, `Subject_Fee_Items_Amount`, `Subject_Fee_Items_Display_Status`, `Subject_Fee_Items_Date_Added`, `Subject_Fee_Items_Date_Updated`) VALUES
(1, 1, 15, '120.00', 'Active', '2018-08-02 04:23:12', '2018-08-02 05:21:19'),
(2, 1, 5, '150.00', 'Inactive', '2018-08-02 04:23:52', '2018-08-02 05:21:18'),
(3, 1, 11, '100.00', 'Inactive', '2018-08-02 04:23:52', '2018-08-02 05:21:18');

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
(1, 'pHay1L+45QHi7eKcZH2+Mg==', '300.00', 'Active', '2018-08-02 04:12:09', '2018-08-02 04:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `r_user_account`
--

CREATE TABLE `r_user_account` (
  `User_Account_ID` int(11) NOT NULL,
  `User_Account_Reference` int(11) NOT NULL,
  `User_Account_Type` enum('Registrar','Student','Proffesor','Admin','Cashier') NOT NULL,
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
(4, 1, 'Cashier', 'mN4YjK/gxTX+IIx+gIBsFA==', 'mN4YjK/gxTX+IIx+gIBsFA==', 'Active', '2018-08-02 14:14:50', '2018-08-02 14:14:50');

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
(1, 5, '0.00', 'Active', '2018-08-02 09:25:30', '2018-08-02 09:25:30'),
(2, 6, '2900.00', 'Active', '2018-08-02 09:26:25', '2018-08-02 21:08:14'),
(3, 7, '7670.00', 'Active', '2018-08-04 16:44:15', '2018-08-04 16:44:15'),
(4, 8, '1520.00', 'Active', '2018-08-08 20:14:07', '2018-08-08 20:14:37');

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
  `Schedule_SectionID` int(11) NOT NULL,
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
(2, 1, 58, 3, NULL, 1, 'Active', '2018-08-05 16:21:39', '2018-08-11 01:11:39'),
(3, 2, 56, 3, NULL, 1, 'Active', '2018-08-05 20:29:59', '2018-08-11 01:11:39'),
(4, 2, 62, 3, 82, 1, 'Active', '2018-08-05 22:00:56', '2018-08-11 01:11:39'),
(5, 3, 57, 4, NULL, 1, 'Active', '2018-08-05 23:11:21', '2018-08-11 01:11:39'),
(6, 1, 59, 3, NULL, 1, 'Active', '2018-08-06 15:41:55', '2018-08-11 01:11:39'),
(7, 2, 61, 3, NULL, 1, 'Active', '2018-08-06 16:24:10', '2018-08-11 01:11:39'),
(8, NULL, 62, 3, 83, 1, 'Active', '2018-08-06 16:40:12', '2018-08-11 01:11:39'),
(9, 1, 56, 4, NULL, 1, 'Active', '2018-08-07 02:52:29', '2018-08-11 01:11:39'),
(10, 1, 57, 3, NULL, 1, 'Active', '2018-08-07 13:08:33', '2018-08-11 01:11:39'),
(11, 1, 63, 2, NULL, 1, 'Active', '2018-08-07 23:03:55', '2018-08-11 01:11:39'),
(12, 3, 66, 2, 82, 1, 'Active', '2018-08-08 01:18:02', '2018-08-11 01:11:39'),
(13, 1, 60, 3, NULL, 1, 'Active', '2018-08-08 20:18:11', '2018-08-11 01:11:39'),
(14, 1, 71, 5, NULL, 1, 'Active', '2018-08-10 22:37:42', '2018-08-11 01:11:39'),
(15, 2, 72, 5, 82, 1, 'Active', '2018-08-10 22:47:49', '2018-08-11 01:11:39'),
(16, 1, 61, 3, NULL, 2, 'Active', '2018-08-11 01:25:38', '2018-08-11 01:25:38');

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
(5, 2, 1, 'M', '16:31:44', '00:00:00', 'Inactive', '2018-08-05 16:26:35', '2018-08-11 00:21:57'),
(6, 2, NULL, 'M', '00:00:00', '00:00:00', 'Inactive', '2018-08-05 16:33:49', '2018-08-11 00:21:57'),
(7, 2, NULL, 'M', '07:30:00', '19:30:00', 'Inactive', '2018-08-06 15:34:00', '2018-08-11 00:21:57'),
(8, 6, NULL, 'M', '07:30:00', '10:30:00', 'Active', '2018-08-06 15:41:55', '2018-08-06 15:41:55'),
(9, 3, NULL, 'M', '07:30:00', '07:30:00', 'Active', '2018-08-06 17:53:12', '2018-08-06 17:53:12'),
(10, 7, NULL, 'F', '14:00:00', '17:00:00', 'Inactive', '2018-08-06 19:06:27', '2018-08-11 00:22:07'),
(11, 8, NULL, 'M', '08:30:00', '09:30:00', 'Inactive', '2018-08-06 19:22:12', '2018-08-11 00:36:51'),
(12, 8, 1, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-08-06 19:23:09', '2018-08-11 00:36:51'),
(13, 4, NULL, 'W', '07:30:00', '10:30:00', 'Active', '2018-08-06 19:23:38', '2018-08-06 21:11:26'),
(14, 9, 1, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-08-07 02:52:30', '2018-08-11 00:15:42'),
(15, 10, NULL, 'M', '07:30:00', '09:30:00', 'Active', '2018-08-07 13:08:33', '2018-08-07 13:08:33'),
(16, 11, NULL, 'M', '07:30:00', '10:30:00', 'Active', '2018-08-07 23:03:55', '2018-08-07 23:03:55'),
(17, 11, 1, 'T', '10:30:00', '13:30:00', 'Active', '2018-08-08 01:11:12', '2018-08-08 01:11:12'),
(18, 12, NULL, 'SU', '10:30:00', '13:30:00', 'Active', '2018-08-08 01:18:02', '2018-08-08 01:18:02'),
(19, 13, 1, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-08-08 20:18:11', '2018-08-11 00:33:38'),
(20, 13, NULL, 'M', '13:30:00', '16:30:00', 'Inactive', '2018-08-08 20:18:11', '2018-08-11 00:33:38'),
(21, 14, NULL, 'M', '07:30:00', '10:30:00', 'Active', '2018-08-10 22:37:42', '2018-08-10 22:37:42'),
(22, 15, 1, 'T', '07:30:00', '07:30:00', 'Active', '2018-08-10 22:47:49', '2018-08-10 22:47:49'),
(23, 2, NULL, 'M', '07:30:00', '19:30:00', 'Inactive', '2018-08-11 00:21:57', '2018-08-11 00:37:54'),
(24, 13, 1, 'M', '07:30:00', '10:30:00', 'Inactive', '2018-08-11 00:33:38', '2018-08-11 00:34:26'),
(25, 8, 1, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-08-11 00:33:48', '2018-08-11 00:36:51'),
(26, 8, 1, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-08-11 00:34:10', '2018-08-11 00:36:51'),
(27, 8, NULL, 'M', '08:30:00', '09:30:00', 'Active', '2018-08-11 00:36:51', '2018-08-11 00:36:51'),
(28, 2, 1, 'M', '07:30:00', '22:30:00', 'Inactive', '2018-08-11 00:37:54', '2018-08-11 00:38:08'),
(29, 2, 2, 'M', '07:30:00', '22:30:00', 'Active', '2018-08-11 00:38:08', '2018-08-11 00:38:08'),
(30, 7, 2, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-08-11 00:38:37', '2018-08-11 00:39:35'),
(31, 7, 1, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-08-11 00:39:35', '2018-08-11 00:39:43'),
(32, 7, 2, 'T', '07:30:00', '10:30:00', 'Active', '2018-08-11 00:39:43', '2018-08-11 00:39:43'),
(33, 16, 1, 'M', '07:30:00', '10:30:00', 'Active', '2018-08-11 01:25:38', '2018-08-11 01:25:38');

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
(4, 5, '2018-00001-NOVA-0', 'Regular', 'First Year', 14, 2, 1, 1, 'New Enrollee', 'Active', '2018-08-02 08:31:04', '2018-08-02 08:31:22'),
(5, 6, '2018-00002-NOVA-0', 'Regular', 'First Year', 15, 3, 1, 1, 'New Enrollee', 'Active', '2018-08-02 09:24:29', '2018-08-02 09:24:29'),
(6, 7, '2018-00003-NOVA-0', 'Regular', 'First Year', 14, 2, 1, 1, 'Transferee', 'Active', '2018-08-02 09:26:25', '2018-08-02 09:26:25'),
(7, 8, '2018-00004-NOVA-0', 'Regular', 'First Year', 15, 3, 1, 1, 'New Enrollee', 'Active', '2018-08-04 16:44:15', '2018-08-04 16:44:15'),
(8, 10, '2018-00005-NOVA-0', 'Regular', 'First Year', 16, 5, 1, 1, 'New Enrollee', 'Active', '2018-08-08 20:14:07', '2018-08-08 20:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `t_student_taken_curriculum_subject`
--

CREATE TABLE `t_student_taken_curriculum_subject` (
  `Student_Taken_Curriculum_Subject_ID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_SubjectID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_StudentAccountID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_Taken_Status` enum('true','false') NOT NULL,
  `Student_Taken_Curriculum_Subject_SemesterID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_AcademicIYearID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_SectionID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Student_Taken_Curriculum_Subject_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Student_Taken_Curriculum_Subject_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
-- Indexes for table `r_documents`
--
ALTER TABLE `r_documents`
  ADD PRIMARY KEY (`Documents_ID`);

--
-- Indexes for table `r_fee`
--
ALTER TABLE `r_fee`
  ADD PRIMARY KEY (`Fee_ID`);

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
-- Indexes for table `t_student_taken_curriculum_subject`
--
ALTER TABLE `t_student_taken_curriculum_subject`
  ADD PRIMARY KEY (`Student_Taken_Curriculum_Subject_ID`),
  ADD KEY `Student_Taken_Curriculum_Subject_SemesterID` (`Student_Taken_Curriculum_Subject_SemesterID`),
  ADD KEY `Student_Taken_Curriculum_Subject_AcademicIYearID` (`Student_Taken_Curriculum_Subject_AcademicIYearID`),
  ADD KEY `Student_Taken_Curriculum_Subject_SubjectID` (`Student_Taken_Curriculum_Subject_SubjectID`),
  ADD KEY `Student_Taken_Curriculum_Subject_StudentAccountID` (`Student_Taken_Curriculum_Subject_StudentAccountID`),
  ADD KEY `Student_Taken_Curriculum_Subject_SectionID` (`Student_Taken_Curriculum_Subject_SectionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `r_academic_year`
--
ALTER TABLE `r_academic_year`
  MODIFY `Academic_Year_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `Campus_Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `r_cashier`
--
ALTER TABLE `r_cashier`
  MODIFY `Cashier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_course`
--
ALTER TABLE `r_course`
  MODIFY `Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `r_course_fee`
--
ALTER TABLE `r_course_fee`
  MODIFY `Course_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_course_fee_items`
--
ALTER TABLE `r_course_fee_items`
  MODIFY `Course_Fee_Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_curriculum`
--
ALTER TABLE `r_curriculum`
  MODIFY `Curriculum_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `r_curriculumitem`
--
ALTER TABLE `r_curriculumitem`
  MODIFY `CurriculumItem_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `r_curriculumyear`
--
ALTER TABLE `r_curriculumyear`
  MODIFY `CurriculumYear_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_documents`
--
ALTER TABLE `r_documents`
  MODIFY `Documents_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_fee`
--
ALTER TABLE `r_fee`
  MODIFY `Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `r_mandatory_fee`
--
ALTER TABLE `r_mandatory_fee`
  MODIFY `Mandatory_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_prerequisite`
--
ALTER TABLE `r_prerequisite`
  MODIFY `Prerequisite_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `r_professor`
--
ALTER TABLE `r_professor`
  MODIFY `Professor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `r_registrar`
--
ALTER TABLE `r_registrar`
  MODIFY `Registrar_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_room`
--
ALTER TABLE `r_room`
  MODIFY `Room_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_section`
--
ALTER TABLE `r_section`
  MODIFY `Section_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `r_semester`
--
ALTER TABLE `r_semester`
  MODIFY `Semester_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `r_student_profile`
--
ALTER TABLE `r_student_profile`
  MODIFY `Student_Profile_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `r_subject`
--
ALTER TABLE `r_subject`
  MODIFY `Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `r_subject_fee`
--
ALTER TABLE `r_subject_fee`
  MODIFY `Subject_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_subject_fee_items`
--
ALTER TABLE `r_subject_fee_items`
  MODIFY `Subject_Fee_Items_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `r_tuition_fee`
--
ALTER TABLE `r_tuition_fee`
  MODIFY `Tuition_Fee_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_unit_fee`
--
ALTER TABLE `r_unit_fee`
  MODIFY `Unit_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_user_account`
--
ALTER TABLE `r_user_account`
  MODIFY `User_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_assign_section_fee_item`
--
ALTER TABLE `t_assign_section_fee_item`
  MODIFY `Assign_Section_Fee_Item_ID` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `t_payment`
--
ALTER TABLE `t_payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_payment_history`
--
ALTER TABLE `t_payment_history`
  MODIFY `Payment_History_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_schedule`
--
ALTER TABLE `t_schedule`
  MODIFY `Schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `t_schedule_items`
--
ALTER TABLE `t_schedule_items`
  MODIFY `Schedule_Items_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `t_student_account`
--
ALTER TABLE `t_student_account`
  MODIFY `Student_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_student_taken_curriculum_subject`
--
ALTER TABLE `t_student_taken_curriculum_subject`
  MODIFY `Student_Taken_Curriculum_Subject_ID` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `t_enrollment`
--
ALTER TABLE `t_enrollment`
  ADD CONSTRAINT `t_enrollment_ibfk_1` FOREIGN KEY (`Enrollment_Academic_Year_ID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_enrollment_ibfk_2` FOREIGN KEY (`Enrollment_Course_ID`) REFERENCES `r_course` (`Course_ID`),
  ADD CONSTRAINT `t_enrollment_ibfk_3` FOREIGN KEY (`Enrollment_Semester_ID`) REFERENCES `r_semester` (`Semester_ID`),
  ADD CONSTRAINT `t_enrollment_ibfk_4` FOREIGN KEY (`Enrollment_Assign_Section_Curriculum_ID`) REFERENCES `r_curriculum` (`Curriculum_ID`),
  ADD CONSTRAINT `t_enrollment_ibfk_5` FOREIGN KEY (`Enrollment_Student_Account_ID`) REFERENCES `t_student_account` (`Student_Account_ID`);

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
-- Constraints for table `t_student_account`
--
ALTER TABLE `t_student_account`
  ADD CONSTRAINT `t_student_account_ibfk_1` FOREIGN KEY (`Student_Account_Student_Profile_ID`) REFERENCES `r_student_profile` (`Student_Profile_ID`),
  ADD CONSTRAINT `t_student_account_ibfk_2` FOREIGN KEY (`Student_Account_CourseID`) REFERENCES `r_course` (`Course_ID`),
  ADD CONSTRAINT `t_student_account_ibfk_3` FOREIGN KEY (`Student_Account_SectionID`) REFERENCES `r_section` (`Section_ID`),
  ADD CONSTRAINT `t_student_account_ibfk_4` FOREIGN KEY (`Student_Account_CurriculumYearID`) REFERENCES `r_curriculumyear` (`CurriculumYear_ID`),
  ADD CONSTRAINT `t_student_account_ibfk_5` FOREIGN KEY (`Student_Account_CampusID`) REFERENCES `r_campus` (`Campus_ID`);

--
-- Constraints for table `t_student_taken_curriculum_subject`
--
ALTER TABLE `t_student_taken_curriculum_subject`
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_1` FOREIGN KEY (`Student_Taken_Curriculum_Subject_SemesterID`) REFERENCES `r_semester` (`Semester_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_2` FOREIGN KEY (`Student_Taken_Curriculum_Subject_AcademicIYearID`) REFERENCES `r_academic_year` (`Academic_Year_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_3` FOREIGN KEY (`Student_Taken_Curriculum_Subject_SubjectID`) REFERENCES `r_subject` (`Subject_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_4` FOREIGN KEY (`Student_Taken_Curriculum_Subject_StudentAccountID`) REFERENCES `t_student_account` (`Student_Account_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_5` FOREIGN KEY (`Student_Taken_Curriculum_Subject_SectionID`) REFERENCES `r_section` (`Section_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
