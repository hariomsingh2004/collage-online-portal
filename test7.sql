-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2020 at 05:45 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test7`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_no` varchar(10) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `credit` int(2) NOT NULL,
  `department_id` varchar(10) NOT NULL,
  `type` enum('practical','theory') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_no`, `course_name`, `credit`, `department_id`, `type`) VALUES
('DBMS-T', 'Database and Management Systems', 3, 'COMP', 'theory'),
('DLD-T', 'Digital Logic Design (Theory)', 4, 'COMP', 'theory');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_ID` varchar(50) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `hod` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_ID`, `department_name`, `hod`) VALUES
('COMP', 'Computer Department', 'VZA1967891'),
('MECH', 'Mechnical Department', 'YLP1966');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` varchar(10) NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `department_id` varchar(10) NOT NULL,
  `salary` int(10) NOT NULL,
  `year_of_joining` int(4) NOT NULL,
  `contact_number` int(50) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_name`, `department_id`, `salary`, `year_of_joining`, `contact_number`, `email_id`, `password`) VALUES
('PP12345678', 'Pravin Pawar', 'COMP', 4500000, 2008, 123454321, 'pawarpf.comp@coep.ac.in', 'pravinpravin'),
('VZA1967891', 'Vahida Attar', 'COMP', 35000000, 2006, 123432113, 'attarvz06.comp@coep.ac.in', 'vahidavahida'),
('YLP1966', 'Yashaswini LomtePatil', 'MECH', 45000, 2009, 1646564343, 'lomtepatilyl.mech@coep.ac.in', 'yashaswini');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade` varchar(2) NOT NULL,
  `pointer` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade`, `pointer`) VALUES
('AA', 10),
('AB', 9),
('BB', 8),
('BC', 7),
('CC', 6),
('CD', 5),
('DD', 4),
('DE', 3),
('EE', 2),
('EF', 1),
('FF', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sem-n_details`
--

CREATE TABLE `sem-n_details` (
  `course_no` varchar(10) NOT NULL,
  `sem_no` int(2) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `status` enum('pass','fail') NOT NULL,
  `mis` int(10) NOT NULL,
  `year` int(4) NOT NULL,
  `attempt_no` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sem-n_details`
--

INSERT INTO `sem-n_details` (`course_no`, `sem_no`, `grade`, `status`, `mis`, `year`, `attempt_no`) VALUES
('DBMS-T', 5, 'CD', 'pass', 1111803110, 2018, 1),
('DLD-T', 1, 'DD', 'pass', 1111803099, 2017, 1),
('DLD-T', 5, 'AB', 'pass', 1111803110, 2018, 1);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `sem_no` int(2) NOT NULL,
  `course_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`sem_no`, `course_no`) VALUES
(5, 'DBMS-T'),
(2, 'DLD-T');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `mis` int(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `department_Id` varchar(50) NOT NULL,
  `credit` int(5) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `year_of_joining` int(4) NOT NULL,
  `degree` enum('BTECH','MTECH','PHD','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`mis`, `first_name`, `last_name`, `password`, `department_Id`, `credit`, `middle_name`, `year_of_joining`, `degree`) VALUES
(1111803095, 'Tejas', 'Sakre', 'tejas', 'MECH', 143, 'Sunil', 2009, 'PHD'),
(1111803099, 'Chaitanya', 'Shinge', 'chaitanya', 'COMP', 123, 'Bharat', 2018, 'BTECH'),
(1111803110, 'Amey', 'Dhongade', 'ameyamey', 'COMP', 123, 'Makarand', 2018, 'BTECH');

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `first_name` varchar(50) NOT NULL,
  `midddle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` int(50) NOT NULL,
  `home_address` varchar(100) NOT NULL,
  `street_address` varchar(50) NOT NULL,
  `city_address` varchar(50) NOT NULL,
  `country_address` varchar(50) NOT NULL,
  `10th_marks` float NOT NULL,
  `12th_marks` float NOT NULL,
  `aadhar_no` int(12) NOT NULL,
  `10th_board` varchar(50) NOT NULL,
  `12th_board` varchar(50) NOT NULL,
  `10th_yop` int(4) NOT NULL,
  `12th_yop` int(4) NOT NULL,
  `religion` varchar(50) NOT NULL,
  `caste` varchar(50) NOT NULL,
  `mis` int(10) NOT NULL,
  `email_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`first_name`, `midddle_name`, `last_name`, `contact_number`, `home_address`, `street_address`, `city_address`, `country_address`, `10th_marks`, `12th_marks`, `aadhar_no`, `10th_board`, `12th_board`, `10th_yop`, `12th_yop`, `religion`, `caste`, `mis`, `email_id`) VALUES
('Amey', 'Makarand', 'Dhongade', 98989889, 'Karve Nagar', 'Appasaheb Kulkarni Path', 'Chandigarh1', 'India1', 95, 92, 123434, 'ICSE', 'CBSE', 2016, 2018, 'Hindu', 'Brahmin', 1111803110, 'dhongadeam18.comp@coep.ac.in');

-- --------------------------------------------------------

--
-- Table structure for table `teacher's_subject`
--

CREATE TABLE `teacher's_subject` (
  `faculty_id` varchar(10) NOT NULL,
  `course_no` varchar(10) NOT NULL,
  `sem_no` int(2) NOT NULL,
  `year` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher's_subject`
--

INSERT INTO `teacher's_subject` (`faculty_id`, `course_no`, `sem_no`, `year`) VALUES
('VZA1967891', 'DBMS-T', 5, 2018),
('VZA1967891', 'DLD-T', 2, 2017);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_no`),
  ADD UNIQUE KEY `course_name` (`course_name`),
  ADD KEY `dept_ref_1` (`department_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_ID`),
  ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`),
  ADD UNIQUE KEY `contact_number` (`contact_number`),
  ADD UNIQUE KEY `email_id` (`email_id`),
  ADD KEY `dept_ref_2` (`department_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade`);

--
-- Indexes for table `sem-n_details`
--
ALTER TABLE `sem-n_details`
  ADD PRIMARY KEY (`course_no`,`mis`,`year`),
  ADD KEY `miis_ref_2` (`mis`),
  ADD KEY `grade_ref_1` (`grade`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`course_no`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`mis`),
  ADD KEY `dept_ref_3` (`department_Id`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`mis`),
  ADD UNIQUE KEY `aadhar_no` (`aadhar_no`),
  ADD UNIQUE KEY `contact_number` (`contact_number`),
  ADD UNIQUE KEY `email_id` (`email_id`);

--
-- Indexes for table `teacher's_subject`
--
ALTER TABLE `teacher's_subject`
  ADD PRIMARY KEY (`faculty_id`,`course_no`,`year`),
  ADD KEY `course_ref_1` (`course_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `dept_ref_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `dept_ref_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sem-n_details`
--
ALTER TABLE `sem-n_details`
  ADD CONSTRAINT `course_ref_3` FOREIGN KEY (`course_no`) REFERENCES `courses` (`course_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grade_ref_1` FOREIGN KEY (`grade`) REFERENCES `grades` (`grade`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `miis_ref_2` FOREIGN KEY (`mis`) REFERENCES `student` (`mis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `course_ref_2` FOREIGN KEY (`course_no`) REFERENCES `courses` (`course_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `dept_ref_3` FOREIGN KEY (`department_Id`) REFERENCES `department` (`department_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_info`
--
ALTER TABLE `student_info`
  ADD CONSTRAINT `mis_ref_3` FOREIGN KEY (`mis`) REFERENCES `student` (`mis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher's_subject`
--
ALTER TABLE `teacher's_subject`
  ADD CONSTRAINT `course_ref_1` FOREIGN KEY (`course_no`) REFERENCES `courses` (`course_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fac_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
