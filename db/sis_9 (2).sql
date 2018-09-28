-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2018 at 08:29 AM
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
-- Database: `sis_9`
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
(1, 'Nw8ZppgQPxdZ4/lI7MWohg==', 'WzMwG7yRvn3aAvKlxQNzNA==', 'Not Used', 'Active', '2018-08-02 04:10:43', '2018-08-21 13:48:41'),
(2, 'qEmiI5/0XZY1EFyZ3Pnk6w==', 'mcctP57D/WKwY5t8ETo/jg==', 'Present', 'Active', '2018-08-02 04:11:03', '2018-08-21 13:48:37'),
(3, '0fAtwElD4mZI0N+Nrsxb3g==', 'KrWaPpJ3me479gIH9Ul4WQ==', 'Used', 'Active', '2018-08-02 04:11:30', '2018-08-21 13:46:44'),
(4, 'ELaf4pXwa3mc3exdJrGzSQ==', '0WjdYtbrdVQWbuEaq4wf9Q==', 'Used', 'Active', '2018-08-02 04:11:30', '2018-08-21 13:46:49');

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
(7, 17, 2, 'Active', '2018-08-20 22:38:46', '2018-08-20 22:38:46');

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
(17, 'lcppOKK5pTkV/cBXHxenhQ==', 'jIfgeSiidraBf4ezTp/2WMf55jtPwW4j3EEdgsjTHiR+wJiEeBaozlbkxa1GAV+2', 4, 'Active', '2018-08-20 22:38:46', '2018-08-20 22:38:46');

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
  `Curriculum_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Curriculum_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Curriculum_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_curriculum`
--

INSERT INTO `r_curriculum` (`Curriculum_ID`, `Curriculum_Code`, `Curriculum_SemesterID`, `Curriculum_CourseID`, `Curriculum_CurriculumYearID`, `Curriculum_YearLevel`, `Curriculum_Display_Status`, `Curriculum_Date_Added`, `Curriculum_Date_Updated`) VALUES
(56, '+VLDRNNaeotxYY+AefAXXA==', 8, 17, 1, 'First Year', 'Active', '2018-08-20 22:48:58', '2018-08-20 22:48:58'),
(57, 'hhJ6I5M1+a8eUF6TdxtPyw==', 9, 17, 1, 'First Year', 'Active', '2018-08-21 20:49:49', '2018-08-21 20:49:49');

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
(76, 56, 65, 'Active', '2018-08-20 22:48:58', '2018-08-20 22:48:58'),
(77, 56, 68, 'Active', '2018-08-20 22:48:58', '2018-08-20 22:48:58'),
(78, 56, 66, 'Active', '2018-08-20 22:48:58', '2018-08-20 22:48:58'),
(79, 56, 80, 'Active', '2018-08-20 22:48:58', '2018-08-20 22:48:58'),
(80, 57, 69, 'Active', '2018-08-21 20:49:49', '2018-08-27 13:28:01'),
(81, 57, 73, 'Active', '2018-08-21 20:49:49', '2018-08-21 21:38:22'),
(82, 57, 81, 'Active', '2018-08-21 21:38:22', '2018-08-21 21:38:22');

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
  `Degree_Display_Status` enum('Active','Inactive') NOT NULL,
  `Degree_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Degree_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'CGGHScsAWoVVbd9g4j72pg==', 'Yes', 'Active', '2018-08-09 22:36:20', '2018-08-18 18:01:05'),
(2, 'b7G8uJrIXKF9pu/nvTub6Q==', 'No', 'Active', '2018-08-18 17:38:16', '2018-08-18 17:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `r_faculty_degree`
--

CREATE TABLE `r_faculty_degree` (
  `Faculty_Degree_ID` int(11) NOT NULL,
  `Faculty_Degree_ProfessorID` int(11) NOT NULL,
  `Faculty_Degree_DegreeID` int(11) NOT NULL,
  `Faculty_Degree_Display_Status` enum('Active','Inactive') NOT NULL,
  `Faculty_Degree_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Faculty_Degree_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 84, 83, 'Active', '2018-08-21 21:37:26', '2018-08-21 21:37:26'),
(2, 85, 82, 'Active', '2018-08-21 21:38:09', '2018-08-21 21:38:09'),
(3, 73, 66, 'Active', '2018-08-21 22:17:04', '2018-08-21 22:17:04');

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
(1, '2018-00001', 'IyHA5934Cat+oyTi4Alz5Q==', 'uyRCromTlt0mM0JPmZSLCw==', 'jntF34oWQ6bpEHmTbinYSQ==', 'BMXl72aaFYuZksuLkWQP4A==', 'Active', '2018-08-05 15:14:00', '2018-08-11 19:28:25'),
(2, '2018-00002', 'rttmvxqCxYnR4hOYMqItKw==', 'uyRCromTlt0mM0JPmZSLCw==', 'eAuM56FP3vgIitoOdDz0cw==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2018-08-05 15:14:19', '2018-08-11 19:29:11'),
(3, '2018-00003', 'CdfnDk9W+bVcXlw1DAZZaA==', 'ko/Z6WxCJoE5bDx3gCeXUQ==', 'gq4Fgnt6Z83pR28+U/sPYg==', 'uyRCromTlt0mM0JPmZSLCw==', 'Active', '2018-08-05 15:14:38', '2018-08-11 19:28:36');

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
(1, 17, 'First Year', 'Yes', 'Active', '2018-08-21 16:58:43', '2018-08-23 20:27:51'),
(2, 17, 'Second Year', 'No', 'Active', '2018-08-21 16:58:43', '2018-08-21 17:03:43'),
(3, 17, 'Third Year', 'No', 'Active', '2018-08-21 16:58:43', '2018-08-21 17:00:55'),
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
(2, 'aTvCPjV+EyFfmG97T7yAFA==', 2, 'aTvCPjV+EyFfmG97T7yAFA==', 'Active', '2018-08-05 15:55:43', '2018-08-20 23:53:19');

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
(8, 'BSIT-CM 1-2', '2', 'First Year', 2, 17, 'Active', '2018-08-23 02:33:03', '2018-08-23 02:33:03');

-- --------------------------------------------------------

--
-- Table structure for table `r_semester`
--

CREATE TABLE `r_semester` (
  `Semester_ID` int(11) NOT NULL,
  `Semester_Code` varchar(100) NOT NULL,
  `Semester_Description` varchar(100) NOT NULL,
  `Semester_Active_Flag` enum('Active','Inactive','To be Used') NOT NULL DEFAULT 'Inactive',
  `Semester_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Semester_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Semester_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_semester`
--

INSERT INTO `r_semester` (`Semester_ID`, `Semester_Code`, `Semester_Description`, `Semester_Active_Flag`, `Semester_Display_Status`, `Semester_Date_Added`, `Semester_Date_Updated`) VALUES
(8, 'JAf1Hlc/Gtb6XCm1y7MiAA==', 'P7I0qX/sDmywrwb6zWrZbg==', 'Inactive', 'Active', '2018-07-30 20:11:28', '2018-07-30 20:11:28'),
(9, '3w7k0lW7Bk1hW5/L8WHQkA==', '9+EqntrFg0c/CreWSDoTWw==', 'Active', 'Active', '2018-07-30 20:12:16', '2018-07-30 20:12:16'),
(10, 'rYpY2pWQC5nB+Z1mTYXlrg==', 'fmdICxI2e5LZ2HRD0TVLhQ==', 'Inactive', 'Active', '2018-07-30 20:12:16', '2018-07-30 20:12:16');

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
(7, 29, '2018-00001', 'Active', '2018-08-20 22:42:22', '2018-08-20 22:42:22'),
(8, 30, '2018-00002', 'Active', '2018-08-20 23:54:13', '2018-08-20 23:54:13'),
(9, 31, '2018-00003', 'Active', '2018-08-20 23:57:30', '2018-08-20 23:57:30'),
(10, 32, '2018-00004', 'Active', '2018-08-21 16:12:29', '2018-08-21 16:12:29'),
(11, 33, '2018-00005', 'Active', '2018-08-23 15:19:50', '2018-08-23 15:19:50'),
(12, 34, '2018-00006', 'Active', '2018-08-23 17:51:52', '2018-08-23 17:51:52'),
(13, 35, '2018-00007', 'Active', '2018-08-26 23:53:55', '2018-08-26 23:53:55'),
(14, 36, '2018-00008', 'Active', '2018-08-26 23:57:11', '2018-08-26 23:57:11'),
(15, 37, '2018-00009', 'Active', '2018-08-26 23:59:10', '2018-08-26 23:59:10'),
(16, 38, '2018-00010', 'Active', '2018-08-27 00:00:32', '2018-08-27 00:00:32'),
(17, 39, '2018-00011', 'Active', '2018-08-27 00:02:39', '2018-08-27 00:02:39'),
(18, 40, '2018-00012', 'Active', '2018-08-27 00:04:27', '2018-08-27 00:04:27');

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
(7, 7, 1, 'Active', '2018-08-20 22:42:36', '2018-08-20 22:42:36'),
(8, 8, 1, 'Active', '2018-08-20 23:54:43', '2018-08-20 23:54:43'),
(9, 9, 1, 'Active', '2018-08-20 23:57:36', '2018-08-20 23:57:36'),
(10, 10, 1, 'Active', '2018-08-21 16:12:40', '2018-08-21 16:12:40'),
(11, 11, 1, 'Active', '2018-08-23 15:20:01', '2018-08-23 15:20:01'),
(12, 12, 1, 'Active', '2018-08-23 17:52:04', '2018-08-23 17:52:04'),
(13, 13, 1, 'Active', '2018-08-26 23:54:03', '2018-08-26 23:54:03'),
(14, 14, 1, 'Active', '2018-08-26 23:57:16', '2018-08-26 23:57:16'),
(15, 15, 1, 'Active', '2018-08-26 23:59:17', '2018-08-26 23:59:17'),
(16, 16, 1, 'Active', '2018-08-27 00:00:39', '2018-08-27 00:00:39'),
(17, 17, 1, 'Active', '2018-08-27 00:02:43', '2018-08-27 00:02:43'),
(18, 18, 1, 'Active', '2018-08-27 00:04:32', '2018-08-27 00:04:32');

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
(29, 'YEtxmhwpaUX5E9xNcmL0YA==', 'uyRCromTlt0mM0JPmZSLCw==', 'CK1ST42XWtXYwKep6B039Q==', '1999-08-24', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'xwxB5M8zMGmDQi4AGzWxVQ==', 'gtm42XsMJuAEjvbzRDoWN2DrwN4rGqBmgFaD/sTWq6Q=', 'Active', '2018-08-20 22:42:21', '2018-08-20 22:42:21'),
(30, 'GTueMNAakIaMt4S2BaQ0cA==', 'uyRCromTlt0mM0JPmZSLCw==', 'irWy92C3JmBqJGdNMhO0dg==', '2000-12-12', 'e/SAHooLWR4JH8zUyKKmEA==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'm27wzOizSP+cbYhktoqEKg==', 'AVUpopW4iuVP/oE1dA2Zag==', 'Active', '2018-08-20 23:54:13', '2018-08-20 23:54:13'),
(31, '21lBuphKbku1HnzvLYNPhQ==', 'uyRCromTlt0mM0JPmZSLCw==', '8Mb5BVG/XlV5OhrEHO/ONA==', '1999-12-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'F0IYQIznZdqUwnN6U1loPg==', 'EAlGWlwQC5vLXIq4cneU6OvsNtYhOy5uncCHyKrsrlg=', 'Active', '2018-08-20 23:57:30', '2018-08-20 23:57:30'),
(32, 'zqKC6qFYCfUJPmGztvh5cA==', 'uyRCromTlt0mM0JPmZSLCw==', 'XXthFhXqVkEhKlD7i3Z7jw==', '1998-05-09', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'fE++VHltPuotNOU38H5xVw==', 'wxGaP4nJV0UhfHZV/OkL7w==', 'Active', '2018-08-21 16:12:29', '2018-08-21 16:12:29'),
(33, 'SNJdmFDk5x/2bI3S5y6Zsg==', 'uyRCromTlt0mM0JPmZSLCw==', 'bKaa1YUyT0p/e6bh8zd9Cw==', '2000-09-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'pQ3IZr7dDS7TlLiRi8LW9A==', 'RhgzfQTpVz8/ATjOQVkOHOx08V8XBP/aFCNtA2ZzETQ=', 'Active', '2018-08-23 15:19:50', '2018-08-23 15:19:50'),
(34, '+d7P8+btsKke7KRu9qW+wA==', 'uyRCromTlt0mM0JPmZSLCw==', 'EBjOY/3pVRSBB6m71I61Tw==', '2000-08-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'FkjusJaiDKPYOWgP3gDesQ==', 'OJk3qiBZ+OjoEbA0ACRmiQ==', 'Active', '2018-08-23 17:51:51', '2018-08-23 17:51:51'),
(35, 'cBL+dAEecwpN6W1TCVxb1g==', 'uyRCromTlt0mM0JPmZSLCw==', 'bp3lYpztvvqWIsaoLmfZ5Q==', '1998-04-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Female', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'AMgRpsMcLN9+eMV5NTlxdQ==', 'mfQY9u8Wij5zAFDJIovv6w==', 'Active', '2018-08-26 23:53:55', '2018-08-26 23:53:55'),
(36, '5OHJyuPmbzf+CDtxC//+tA==', 'uyRCromTlt0mM0JPmZSLCw==', 'BnasaOpnvLIDZdGDynnACQ==', '1989-05-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'xUHZ6TizAwPSaoJczQ7nyg==', 'efXNqMD8UCGDskGHYJSwSJ0wcgud7rCvsXyXroKlhes=', 'Active', '2018-08-26 23:57:10', '2018-08-26 23:57:10'),
(37, 'JeBcjzUxnZW9DQenMSyVOA==', 'uyRCromTlt0mM0JPmZSLCw==', 'gh9G8thCeYP+BePZM4PILA==', '1994-03-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'fXr/xsilqyjjqgG8HaSQnQ==', 'embzEBEyW+kwbDTSDt2ylA==', 'Active', '2018-08-26 23:59:10', '2018-08-26 23:59:10'),
(38, 'TYfYglfZbotUEdjH4rX58Q==', 'uyRCromTlt0mM0JPmZSLCw==', 'F3epfgAdoZ+yaYcruEpOtg==', '1998-04-23', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'eiPMXuLB5EX9HWjaJUoTfA==', 'lvOXprOgTyexwx5O5czaU6L830luqYbeKuCgsCzczKA=', 'Active', '2018-08-27 00:00:32', '2018-08-27 00:00:32'),
(39, 'esrDfXDnHdzn7tkzQ4yTKg==', 'uyRCromTlt0mM0JPmZSLCw==', 'jucU6WI+PBIYzeYrd8bwPQ==', '1995-05-09', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'kzrAqfn3MmsmeS05T9NkqA==', 'n13sIyMmSQHqil7RsmWEKi2y5tusqhk+V7bkXmkHzm0=', 'Active', '2018-08-27 00:02:39', '2018-08-27 00:02:39'),
(40, 'B9xxqq2rkHIopPKl9DDnjQ==', 'uyRCromTlt0mM0JPmZSLCw==', 'DhdU7DTRX5uSgr94xwjX+w==', '1990-03-12', 'LsNsz0O8wBf6lZVbYb4q3w==', 'Male', 'Single', 'LsNsz0O8wBf6lZVbYb4q3w==', 'oQ5mnmj8VTfe+kj0x5aXAA==', 'PzRTSyP3cyYOtHRi/6dfYpwuqbUvaOHuqHdV71ATj3M=', 'Active', '2018-08-27 00:04:27', '2018-08-27 00:04:27');

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
(83, '2+c5lyP1MXPUk/mNdyJhVw==', 'p3Epn713d5L3HdKSxJQp/DePVoPRIxMjhVbSRQ6dhPKkTch5TdvrnBRwkurijCzr', 3, 0, 3, 0, 3, 'Non-Academic', 80, 3, 'Active', '2018-07-30 19:47:27', '2018-07-30 19:47:27'),
(84, 'hq98mJdu/MoelVZfQR3LNw==', 'p3Epn713d5L3HdKSxJQp/DePVoPRIxMjhVbSRQ6dhPLLnP/XTE5W5ZzFY8736O8H', 2, 0, 3, 0, 3, 'Non-Academic', 81, 3, 'Active', '2018-08-21 21:37:26', '2018-08-21 21:37:26'),
(85, '0AyW1OoSyHoTO9M5yWR/nw==', 'Zus95WrUIt3kpPIKkDvsh06TdII2EHuPt3fHNYxiBQbKvwKInXX2jmINtoPKnQ/c', 3, 0, 3, 0, 3, 'Non-Academic', 81, 3, 'Active', '2018-08-21 21:38:09', '2018-08-21 21:38:09');

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
(1, 2, 84, 'Active', '2018-08-26 19:53:56', '2018-08-26 19:53:56');

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
(1, 1, 15, '150.00', 'Active', '2018-08-26 19:53:56', '2018-08-26 19:53:56'),
(2, 1, 13, '50.00', 'Active', '2018-08-26 20:01:45', '2018-08-26 20:01:45');

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
  `User_Account_Type` enum('Registrar','Student','Faculty','Admin','Cashier') NOT NULL,
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
(5, 1, 'Faculty', 'gu1lL4wf7RCapJENXiuyPQ==', 'gu1lL4wf7RCapJENXiuyPQ==', 'Active', '2018-08-11 19:24:33', '2018-08-11 19:29:33'),
(6, 17, 'Student', '2018-00014-NOVA-0', '2018-00014-NOVA-0', 'Active', '2018-08-20 16:11:04', '2018-08-20 16:11:04'),
(7, 18, 'Student', 'mtOfOpVuZ0Tq4fLY68PGEAnQHbGTDMudt0R0z2WkQxA=', 'mtOfOpVuZ0Tq4fLY68PGEAnQHbGTDMudt0R0z2WkQxA=', 'Active', '2018-08-20 16:13:16', '2018-08-20 16:13:16'),
(8, 19, 'Student', 'i1b15+PAJ+ZI8fUG7KhlvPnenRyEV0Ja30UZRaDJ5Sw=', 'i1b15+PAJ+ZI8fUG7KhlvPnenRyEV0Ja30UZRaDJ5Sw=', 'Active', '2018-08-20 22:15:10', '2018-08-20 22:15:10'),
(9, 20, 'Student', 'OdICL0b4JffaA+iN8N2KnQ==', 'OdICL0b4JffaA+iN8N2KnQ==', 'Active', '2018-08-20 22:49:25', '2018-08-20 22:49:25'),
(10, 21, 'Student', 'vUhkbStK1Suay8gSvPR1xA==', 'vUhkbStK1Suay8gSvPR1xA==', 'Active', '2018-08-20 23:54:55', '2018-08-20 23:54:55'),
(11, 22, 'Student', 'X25gHwy8AqQsBIyqq2JPAA==', 'X25gHwy8AqQsBIyqq2JPAA==', 'Active', '2018-08-20 23:57:50', '2018-08-20 23:57:50'),
(12, 23, 'Student', 'GXIl2xL3IN7MrFU908zj5w==', 'GXIl2xL3IN7MrFU908zj5w==', 'Active', '2018-08-23 15:19:15', '2018-08-23 15:19:15'),
(13, 24, 'Student', '0dU1vp1w0nguzDr36v8TaA==', '0dU1vp1w0nguzDr36v8TaA==', 'Active', '2018-08-23 15:21:09', '2018-08-23 15:21:09'),
(14, 25, 'Student', 'C3Xc+Fzy3hRF8TaEOUMU9g==', 'C3Xc+Fzy3hRF8TaEOUMU9g==', 'Active', '2018-08-26 23:53:07', '2018-08-26 23:53:07'),
(15, 26, 'Student', 'V6UgACuQm57ERMO502DN0Q==', 'V6UgACuQm57ERMO502DN0Q==', 'Active', '2018-08-26 23:54:20', '2018-08-26 23:54:20'),
(16, 27, 'Student', '7MT6gqkbVmaTOahbobNAIQ==', '7MT6gqkbVmaTOahbobNAIQ==', 'Active', '2018-08-26 23:57:39', '2018-08-26 23:57:39'),
(17, 28, 'Student', 'fYEycVG2/WAqB0IDjcPlDQ==', 'fYEycVG2/WAqB0IDjcPlDQ==', 'Active', '2018-08-26 23:59:30', '2018-08-26 23:59:30'),
(18, 29, 'Student', 'YmBajRLDeOLuQhQCcb8SXg==', 'YmBajRLDeOLuQhQCcb8SXg==', 'Active', '2018-08-27 00:00:56', '2018-08-27 00:00:56'),
(19, 30, 'Student', 'E/4mAgfiOt02DbLQWEBOAg==', 'E/4mAgfiOt02DbLQWEBOAg==', 'Active', '2018-08-27 00:03:00', '2018-08-27 00:03:00');

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
(16, 20, '4700.00', 'Active', '2018-08-20 22:49:25', '2018-08-20 22:49:25'),
(17, 21, '4700.00', 'Active', '2018-08-20 23:54:55', '2018-08-20 23:54:55'),
(18, 22, '4700.00', 'Active', '2018-08-20 23:57:50', '2018-08-20 23:57:50'),
(19, 23, '4700.00', 'Active', '2018-08-23 15:19:15', '2018-08-23 15:19:15'),
(20, 24, '4700.00', 'Active', '2018-08-23 15:21:09', '2018-08-23 15:21:09'),
(21, 25, '4800.00', 'Active', '2018-08-26 23:53:07', '2018-08-26 23:53:07'),
(22, 26, '4800.00', 'Active', '2018-08-26 23:54:20', '2018-08-26 23:54:20'),
(23, 27, '4800.00', 'Active', '2018-08-26 23:57:39', '2018-08-26 23:57:39'),
(24, 28, '4800.00', 'Active', '2018-08-26 23:59:30', '2018-08-26 23:59:30'),
(25, 29, '4800.00', 'Active', '2018-08-27 00:00:56', '2018-08-27 00:00:56'),
(26, 30, '4800.00', 'Active', '2018-08-27 00:03:00', '2018-08-27 00:03:00');

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
(24, 1, 78, 6, NULL, 2, 'Active', '2018-08-20 22:51:18', '2018-08-20 22:51:18'),
(25, 1, 77, 6, NULL, 2, 'Active', '2018-08-20 22:51:31', '2018-08-20 22:51:31'),
(26, 1, 76, 6, NULL, 2, 'Active', '2018-08-20 22:51:41', '2018-08-20 22:51:41'),
(27, 3, 79, 6, 82, 2, 'Active', '2018-08-20 22:51:50', '2018-08-20 22:51:50'),
(28, 3, 79, 6, 83, 2, 'Active', '2018-08-20 22:52:04', '2018-08-20 22:52:04'),
(29, 1, 81, 6, NULL, 2, 'Active', '2018-08-23 00:50:44', '2018-08-23 00:50:44'),
(30, 1, 80, 6, NULL, 2, 'Active', '2018-08-23 01:34:10', '2018-08-23 01:34:10'),
(31, 3, 80, 8, NULL, 2, 'Active', '2018-08-23 02:33:55', '2018-08-23 02:33:55'),
(32, 3, 82, 6, 84, 2, 'Active', '2018-08-26 14:32:07', '2018-08-26 14:32:07'),
(34, 2, 82, 8, 84, 2, 'Active', '2018-08-26 15:14:35', '2018-08-26 15:14:35');

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
(58, 24, NULL, 'M', '07:30:00', '10:30:00', 'Active', '2018-08-20 22:51:18', '2018-08-20 22:51:18'),
(59, 25, NULL, 'T', '07:30:00', '10:30:00', 'Inactive', '2018-08-20 22:51:31', '2018-08-23 01:34:10'),
(60, 26, NULL, 'W', '07:30:00', '10:30:00', 'Inactive', '2018-08-20 22:51:41', '2018-08-21 13:50:18'),
(61, 27, NULL, 'SU', '07:30:00', '10:30:00', 'Active', '2018-08-20 22:51:50', '2018-08-20 22:51:50'),
(62, 28, NULL, 'SU', '10:30:00', '14:00:00', 'Active', '2018-08-20 22:52:04', '2018-08-20 22:52:04'),
(63, 26, NULL, 'W', '07:30:00', '10:30:00', 'Active', '2018-08-21 13:50:19', '2018-08-21 13:50:19'),
(64, 26, NULL, 'TH', '14:00:00', '17:00:00', 'Active', '2018-08-21 13:50:19', '2018-08-21 13:50:19'),
(65, 29, NULL, 'M', '07:30:00', '07:30:00', 'Active', '2018-08-23 00:50:44', '2018-08-23 00:50:44'),
(66, 30, 1, 'W', '07:30:00', '10:30:00', 'Active', '2018-08-23 01:34:11', '2018-08-23 01:34:11'),
(67, 30, NULL, 'T', '07:30:00', '10:30:00', 'Active', '2018-08-23 01:34:11', '2018-08-23 01:34:11'),
(68, 31, 2, 'F', '14:00:00', '17:00:00', 'Active', '2018-08-23 02:33:55', '2018-08-23 02:33:55'),
(69, 32, 1, 'SU', '07:30:00', '10:30:00', 'Active', '2018-08-26 14:32:08', '2018-08-26 14:32:08'),
(72, 34, NULL, 'S', '07:30:00', '10:30:00', 'Active', '2018-08-26 15:14:35', '2018-08-26 15:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `t_students_grade`
--

CREATE TABLE `t_students_grade` (
  `Students_Grade_ID` int(11) NOT NULL,
  `Students_Grade_StudentTakenCurriculumSubjectID` int(11) NOT NULL,
  `Students_Grade_Grade` enum('1.00','1.25','1.50','1.75','2.00','2.25','2.50','2.75','3.00','5.00','I','Not S','D') NOT NULL,
  `Students_Grade_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Students_Grade_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Students_Grade_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_students_grade`
--

INSERT INTO `t_students_grade` (`Students_Grade_ID`, `Students_Grade_StudentTakenCurriculumSubjectID`, `Students_Grade_Grade`, `Students_Grade_Display_Status`, `Students_Grade_Date_Added`, `Students_Grade_Date_Updated`) VALUES
(11, 82, '1.75', 'Active', '2018-08-20 23:50:50', '2018-08-21 22:55:42'),
(12, 83, '1.50', 'Active', '2018-08-21 22:07:42', '2018-08-21 22:10:56');

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
(20, 29, '2018-00001-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-08-20 22:49:25', '2018-08-20 22:49:25'),
(21, 30, '2018-00002-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-08-20 23:54:55', '2018-08-20 23:54:55'),
(22, 31, '2018-00003-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-08-20 23:57:49', '2018-08-20 23:57:49'),
(23, 32, '2018-00004-CM-0', 'Regular', 'First Year', 17, 8, 2, 1, 'New Enrollee', 'Active', '2018-08-23 15:19:15', '2018-08-23 15:19:15'),
(24, 33, '2018-00005-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-08-23 15:21:08', '2018-08-23 15:21:08'),
(25, 34, '2018-00006-CM-0', 'Regular', 'First Year', 17, 8, 2, 1, 'New Enrollee', 'Active', '2018-08-26 23:53:07', '2018-08-26 23:53:07'),
(26, 35, '2018-00007-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-08-26 23:54:20', '2018-08-26 23:54:20'),
(27, 36, '2018-00008-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-08-26 23:57:39', '2018-08-26 23:57:39'),
(28, 37, '2018-00009-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-08-26 23:59:30', '2018-08-26 23:59:30'),
(29, 38, '2018-00010-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-08-27 00:00:56', '2018-08-27 00:00:56'),
(30, 39, '2018-00011-CM-0', 'Regular', 'First Year', 17, 6, 2, 1, 'New Enrollee', 'Active', '2018-08-27 00:03:00', '2018-08-27 00:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `t_student_taken_curriculum_subject`
--

CREATE TABLE `t_student_taken_curriculum_subject` (
  `Student_Taken_Curriculum_Subject_ID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_SubjectID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_StudentAccountID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_Taken_Status` enum('true','false') NOT NULL,
  `Student_Taken_Curriculum_Subject_YearLevel` enum('First Year','Second Year','Third Year','Fourth Year','Fifth Year') NOT NULL DEFAULT 'First Year',
  `Student_Taken_Curriculum_Subject_SemesterID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_AcademicIYearID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_SectionID` int(11) DEFAULT NULL,
  `Student_Taken_Curriculum_Subject_CourseID` int(11) NOT NULL,
  `Student_Taken_Curriculum_Subject_Display_Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `Student_Taken_Curriculum_Subject_Date_Added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Student_Taken_Curriculum_Subject_Date_Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_student_taken_curriculum_subject`
--

INSERT INTO `t_student_taken_curriculum_subject` (`Student_Taken_Curriculum_Subject_ID`, `Student_Taken_Curriculum_Subject_SubjectID`, `Student_Taken_Curriculum_Subject_StudentAccountID`, `Student_Taken_Curriculum_Subject_Taken_Status`, `Student_Taken_Curriculum_Subject_YearLevel`, `Student_Taken_Curriculum_Subject_SemesterID`, `Student_Taken_Curriculum_Subject_AcademicIYearID`, `Student_Taken_Curriculum_Subject_SectionID`, `Student_Taken_Curriculum_Subject_CourseID`, `Student_Taken_Curriculum_Subject_Display_Status`, `Student_Taken_Curriculum_Subject_Date_Added`, `Student_Taken_Curriculum_Subject_Date_Updated`) VALUES
(81, 68, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 22:49:26', '2018-08-20 22:49:26'),
(82, 66, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 22:49:26', '2018-08-20 22:49:26'),
(83, 83, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 22:49:26', '2018-08-21 22:10:25'),
(84, 82, 20, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 22:49:26', '2018-08-21 22:10:29'),
(85, 65, 20, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 22:49:26', '2018-08-20 22:49:26'),
(86, 65, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:54:55', '2018-08-20 23:54:55'),
(87, 66, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:54:55', '2018-08-20 23:54:55'),
(88, 82, 21, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:54:55', '2018-08-20 23:54:55'),
(89, 83, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:54:55', '2018-08-20 23:54:55'),
(90, 68, 21, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:54:55', '2018-08-20 23:54:55'),
(91, 65, 22, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:57:50', '2018-08-20 23:57:50'),
(92, 66, 22, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:57:50', '2018-08-20 23:57:50'),
(93, 82, 22, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:57:50', '2018-08-20 23:57:50'),
(94, 83, 22, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:57:50', '2018-08-20 23:57:50'),
(95, 68, 22, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-20 23:57:50', '2018-08-20 23:57:50'),
(96, 66, 23, 'true', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-23 15:19:15', '2018-08-23 15:19:15'),
(97, 82, 23, 'true', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-23 15:19:15', '2018-08-23 15:19:15'),
(98, 65, 23, 'true', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-23 15:19:15', '2018-08-23 15:19:15'),
(99, 83, 23, 'false', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-23 15:19:15', '2018-08-23 15:19:15'),
(100, 68, 23, 'true', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-23 15:19:15', '2018-08-23 15:19:15'),
(101, 83, 24, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-23 15:21:09', '2018-08-23 15:21:09'),
(102, 68, 24, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-23 15:21:09', '2018-08-23 15:21:09'),
(103, 82, 24, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-23 15:21:09', '2018-08-23 15:21:09'),
(104, 65, 24, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-23 15:21:09', '2018-08-23 15:21:09'),
(105, 66, 24, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-23 15:21:09', '2018-08-23 15:21:09'),
(106, 66, 25, 'true', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-26 23:53:07', '2018-08-26 23:53:07'),
(107, 65, 25, 'true', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-26 23:53:07', '2018-08-26 23:53:07'),
(108, 68, 25, 'true', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-26 23:53:07', '2018-08-26 23:53:07'),
(109, 83, 25, 'false', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-26 23:53:07', '2018-08-26 23:53:07'),
(110, 82, 25, 'true', 'First Year', 8, 2, 8, 17, 'Active', '2018-08-26 23:53:07', '2018-08-26 23:53:07'),
(111, 66, 26, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:54:20', '2018-08-26 23:54:20'),
(112, 82, 26, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:54:20', '2018-08-26 23:54:20'),
(113, 65, 26, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:54:20', '2018-08-26 23:54:20'),
(114, 68, 26, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:54:20', '2018-08-26 23:54:20'),
(115, 83, 26, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:54:20', '2018-08-26 23:54:20'),
(116, 66, 27, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:57:39', '2018-08-26 23:57:39'),
(117, 68, 27, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:57:39', '2018-08-26 23:57:39'),
(118, 65, 27, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:57:39', '2018-08-26 23:57:39'),
(119, 83, 27, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:57:39', '2018-08-26 23:57:39'),
(120, 82, 27, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:57:39', '2018-08-26 23:57:39'),
(121, 66, 28, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:59:30', '2018-08-26 23:59:30'),
(122, 65, 28, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:59:30', '2018-08-26 23:59:30'),
(123, 68, 28, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:59:30', '2018-08-26 23:59:30'),
(124, 83, 28, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:59:30', '2018-08-26 23:59:30'),
(125, 82, 28, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-26 23:59:30', '2018-08-26 23:59:30'),
(126, 65, 29, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:00:56', '2018-08-27 00:00:56'),
(127, 83, 29, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:00:56', '2018-08-27 00:00:56'),
(128, 68, 29, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:00:56', '2018-08-27 00:00:56'),
(129, 82, 29, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:00:56', '2018-08-27 00:00:56'),
(130, 66, 29, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:00:56', '2018-08-27 00:00:56'),
(131, 65, 30, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:03:00', '2018-08-27 00:03:00'),
(132, 68, 30, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:03:01', '2018-08-27 00:03:01'),
(133, 66, 30, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:03:01', '2018-08-27 00:03:01'),
(134, 82, 30, 'true', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:03:01', '2018-08-27 00:03:01'),
(135, 83, 30, 'false', 'First Year', 8, 2, 6, 17, 'Active', '2018-08-27 00:03:01', '2018-08-27 00:03:01'),
(136, 69, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-08-27 22:48:23', '2018-08-27 22:48:23'),
(137, 73, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-08-27 22:48:24', '2018-08-27 22:48:24'),
(138, 84, 20, 'true', 'First Year', 9, 2, 6, 17, 'Active', '2018-08-27 22:48:24', '2018-08-27 22:48:24');

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
  ADD PRIMARY KEY (`Faculty_Degree_ID`);

--
-- Indexes for table `r_faculty_subject`
--
ALTER TABLE `r_faculty_subject`
  ADD PRIMARY KEY (`Faculty_Subject_ID`);

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
-- Indexes for table `t_students_grade`
--
ALTER TABLE `t_students_grade`
  ADD PRIMARY KEY (`Students_Grade_ID`),
  ADD KEY `Students_Grade_StudentTakenCurriculumSubjectID` (`Students_Grade_StudentTakenCurriculumSubjectID`);

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
  ADD KEY `Student_Taken_Curriculum_Subject_SectionID` (`Student_Taken_Curriculum_Subject_SectionID`),
  ADD KEY `Student_Taken_Curriculum_Subject_CourseID` (`Student_Taken_Curriculum_Subject_CourseID`);

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
  MODIFY `Campus_Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `r_cashier`
--
ALTER TABLE `r_cashier`
  MODIFY `Cashier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_course`
--
ALTER TABLE `r_course`
  MODIFY `Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `Curriculum_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `r_curriculumitem`
--
ALTER TABLE `r_curriculumitem`
  MODIFY `CurriculumItem_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `r_curriculumyear`
--
ALTER TABLE `r_curriculumyear`
  MODIFY `CurriculumYear_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_degree`
--
ALTER TABLE `r_degree`
  MODIFY `Degree_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_documents`
--
ALTER TABLE `r_documents`
  MODIFY `Documents_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_faculty_degree`
--
ALTER TABLE `r_faculty_degree`
  MODIFY `Faculty_Degree_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_faculty_subject`
--
ALTER TABLE `r_faculty_subject`
  MODIFY `Faculty_Subject_ID` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `Prerequisite_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `r_professor`
--
ALTER TABLE `r_professor`
  MODIFY `Professor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `Room_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_section`
--
ALTER TABLE `r_section`
  MODIFY `Section_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `r_semester`
--
ALTER TABLE `r_semester`
  MODIFY `Semester_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `r_student_application`
--
ALTER TABLE `r_student_application`
  MODIFY `Student_Application_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `r_student_document`
--
ALTER TABLE `r_student_document`
  MODIFY `Student_Document_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `r_student_profile`
--
ALTER TABLE `r_student_profile`
  MODIFY `Student_Profile_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `r_subject`
--
ALTER TABLE `r_subject`
  MODIFY `Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `r_subject_fee`
--
ALTER TABLE `r_subject_fee`
  MODIFY `Subject_Fee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_subject_fee_items`
--
ALTER TABLE `r_subject_fee_items`
  MODIFY `Subject_Fee_Items_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `User_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `t_payment_history`
--
ALTER TABLE `t_payment_history`
  MODIFY `Payment_History_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_schedule`
--
ALTER TABLE `t_schedule`
  MODIFY `Schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `t_schedule_items`
--
ALTER TABLE `t_schedule_items`
  MODIFY `Schedule_Items_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `t_students_grade`
--
ALTER TABLE `t_students_grade`
  MODIFY `Students_Grade_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_student_account`
--
ALTER TABLE `t_student_account`
  MODIFY `Student_Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `t_student_taken_curriculum_subject`
--
ALTER TABLE `t_student_taken_curriculum_subject`
  MODIFY `Student_Taken_Curriculum_Subject_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

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
-- Constraints for table `t_students_grade`
--
ALTER TABLE `t_students_grade`
  ADD CONSTRAINT `t_students_grade_ibfk_1` FOREIGN KEY (`Students_Grade_StudentTakenCurriculumSubjectID`) REFERENCES `t_student_taken_curriculum_subject` (`Student_Taken_Curriculum_Subject_ID`);

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
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_5` FOREIGN KEY (`Student_Taken_Curriculum_Subject_SectionID`) REFERENCES `r_section` (`Section_ID`),
  ADD CONSTRAINT `t_student_taken_curriculum_subject_ibfk_6` FOREIGN KEY (`Student_Taken_Curriculum_Subject_CourseID`) REFERENCES `r_course` (`Course_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
