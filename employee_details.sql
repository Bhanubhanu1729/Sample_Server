-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 22, 2025 at 04:16 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_details`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `punch_in` time DEFAULT NULL,
  `punch_out` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `email`, `date`, `punch_in`, `punch_out`) VALUES
(1, NULL, '2025-04-17', '16:53:33', NULL),
(2, NULL, '2025-04-17', '16:54:12', NULL),
(3, NULL, '2025-04-21', '10:04:16', NULL),
(4, NULL, '2025-04-21', '16:14:06', NULL),
(5, NULL, '2025-04-21', '16:36:57', NULL),
(6, NULL, '2025-04-21', '16:37:33', NULL),
(7, NULL, '2025-04-21', '22:13:15', NULL),
(8, NULL, '2025-04-21', '22:21:29', NULL),
(9, NULL, '2025-04-21', NULL, '22:22:57'),
(10, NULL, '2025-04-21', '22:23:04', NULL),
(11, NULL, '2025-04-21', NULL, '22:23:06'),
(12, NULL, '2025-04-21', '22:29:20', NULL),
(13, NULL, '2025-04-21', '22:30:42', NULL),
(14, NULL, '2025-04-21', NULL, '22:30:48'),
(15, NULL, '2025-04-21', '22:33:07', NULL),
(16, NULL, '2025-04-21', '22:33:33', NULL),
(17, NULL, '2025-04-21', '22:39:46', NULL),
(18, NULL, '2025-04-21', '22:40:54', NULL),
(19, NULL, '2025-04-21', NULL, '22:41:01'),
(20, NULL, '2025-04-21', '22:42:59', NULL),
(21, NULL, '2025-04-21', '22:44:32', NULL),
(22, NULL, '2025-04-21', NULL, '22:44:33'),
(23, NULL, '2025-04-21', '22:45:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `middle` varchar(100) DEFAULT NULL,
  `last` varchar(100) DEFAULT NULL,
  `fatherName` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `aadhar` varchar(12) DEFAULT NULL,
  `pan` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `title`, `name`, `middle`, `last`, `fatherName`, `dob`, `age`, `gender`, `aadhar`, `pan`, `email`, `password`) VALUES
(4, 'Mr', 'Bhanu', 'Teja', 'pathapati_pathapati', 'srinivasarao', '2002-01-15', 22, 'Male', '123456789012', 'ABCDE1234F', 'bhanu@email.com', 'Bhanu@123'),
(5, 'mr', ' bhanu', 'teja', 'patahapa', 'sribafshs', '2025-04-02', 88, 'male', '789098768', 'bhsusui6', 'bhanaua@gmaial', 'Bhanu@123'),
(6, 'Ms', 'Preesha', 'Joy', 'Pathapati', 'john', '2020-11-18', 5, 'Female', '9632145870', 'VBj253G', 'gracy@gmail.com', 'gracy@123'),
(7, 'Mr', 'Venkat  ', 'swamy', 'pathapati', 'pothuraju', '1994-01-15', 31, 'Male', '7895621430', 'Bhan8972p', 'Venkat@gmail.com', 'Venkat@123'),
(8, 'Ms', 'joanna', 'gracy', 'joy', 'venkat', '2013-12-12', 12, 'Female', '2630145987', 'Bhghy75u', 'joanna@gmail.com', 'joy@123'),
(9, 'Mr', 'Bhanu', 'teja', 'Pathapati', 'srinu', '2002-07-15', 23, 'Male', '985752870381', 'BHA23U', 'bhanu@gmail.com', 'bhanu@123'),
(10, 'Mr', 'Venkat', 'Venakt', 'pathapati', 'pothuraju', '2023-02-02', 2, 'Male', '7893210456', 'BHa565', 'venkat@gmail.com', 'venkat@123'),
(11, 'Mr', 'bhanu', '', 'pathapati', 'srinu', '2002-07-15', 23, 'Male', '985752850326', 'ABCDE1234F', 'bhanu@gmail.com', 'bhanu@123');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
CREATE TABLE IF NOT EXISTS `leave_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `leave_type` varchar(100) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `reason` text,
  `status` varchar(20) DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `user_id`, `leave_type`, `from_date`, `to_date`, `reason`, `status`, `created_at`) VALUES
(1, 123, 'Sick Leave', '2025-04-10', '2025-04-12', 'Flu', 'on leave', '2025-04-12 09:20:23'),
(2, 456, 'Sick Leave', '2025-10-04', '2025-10-16', 'Personal', 'Pending', '2025-04-12 09:25:19'),
(3, 582, 'sick', '2025-04-15', '2025-04-16', 'health issues', 'Pending', '2025-04-12 19:27:14'),
(8, 689, 'Casual leave', '2025-04-15', '2025-04-19', 'i have personal work', 'Pending', '2025-04-14 10:10:57'),
(7, 0, '', '0000-00-00', '0000-00-00', '', 'Pending', '2025-04-14 09:35:44'),
(6, 214, 'festival', '2025-04-14', '2025-04-15', '', 'Pending', '2025-04-13 12:42:35'),
(9, 0, '', '0000-00-00', '0000-00-00', '', 'Pending', '2025-04-14 13:36:15'),
(10, 2345, 'Sick Leave', '2025-04-14', '2025-04-12', 'dddd', 'Pending', '2025-04-15 12:56:30'),
(11, 2345, '', '2025-04-14', '2025-04-12', 'dddd', 'Pending', '2025-04-15 12:57:12'),
(12, 89, 'Casual leave', '2025-04-17', '2025-04-18', 'jlkllkklkl', 'Pending', '2025-04-15 18:23:21'),
(13, 89, 'Casual leave', '2025-04-17', '2025-04-18', 'jlkllkklkl', 'Pending', '2025-04-15 18:25:47'),
(14, 90, 'Casual leave', '2025-04-16', '2025-04-16', 'jjj', 'Pending', '2025-04-15 18:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `objectives`
--

DROP TABLE IF EXISTS `objectives`;
CREATE TABLE IF NOT EXISTS `objectives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `objectives`
--

INSERT INTO `objectives` (`id`, `user_id`, `title`, `description`, `start_date`, `end_date`, `status`) VALUES
(1, 3455, 'Project', 'Complete the Project', '2025-04-08', '2025-04-21', 'In Progress'),
(2, 3455, 'Project', 'Complete the Project', '2025-04-08', '2025-04-21', 'In Progress'),
(3, 3455, 'Project', 'Complete the Project', '2025-04-08', '2025-04-21', 'In Progress'),
(4, 3455, 'Project', 'Complete the Project', '2025-04-08', '2025-04-21', 'In Progress'),
(5, 784, 'Employee Project', 'Very important project', '2025-04-07', '2025-04-21', 'In Progress'),
(6, 344, 'project', 'employee deatils maintenance system', '2025-04-17', '2025-04-18', 'Completed'),
(7, 532, 'Mini Project', 'maintenance the employess deatils ', '2025-04-17', '2025-04-22', 'In Progress'),
(8, 532, 'Mini Project', 'maintenance the employess deatils ', '2025-04-17', '2025-04-22', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `resignations`
--

DROP TABLE IF EXISTS `resignations`;
CREATE TABLE IF NOT EXISTS `resignations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `reason` text,
  `last_working_day` date DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `submitted_at` date DEFAULT NULL,
  `manager_comments` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `resignations`
--

INSERT INTO `resignations` (`id`, `employee_id`, `reason`, `last_working_day`, `status`, `submitted_at`, `manager_comments`) VALUES
(1, 532, 'i am getting new job ', '2025-04-16', 'Pending', '2025-04-15', NULL),
(2, 989, 'uoi', '0000-00-00', 'Pending', '2025-04-16', NULL),
(3, 101144, 'Ihave checked', '2025-05-16', 'Pending', '2025-04-16', NULL),
(4, 894, 'i got place in another office', '0000-00-00', 'Pending', '2025-04-17', NULL),
(5, 23445, 'dfsdfasdfdsfgdfgdsfgsdg', '2025-05-17', 'Pending', '2025-04-17', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
