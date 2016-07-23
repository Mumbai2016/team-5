-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2016 at 03:25 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `katalyst`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `name` varchar(40) NOT NULL,
`aid` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `assign_mentor_mentee`
--

CREATE TABLE IF NOT EXISTS `assign_mentor_mentee` (
  `assign_id` int(5) NOT NULL,
  `mentor_id` int(5) NOT NULL,
  `mentee_id` int(5) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `edited_by` varchar(40) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `edited_date` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentee`
--

CREATE TABLE IF NOT EXISTS `mentee` (
  `mentee_id` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `dob` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `annual_income` bigint(15) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `edited_by` varchar(40) NOT NULL,
  `created_date` date NOT NULL,
  `edited_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentee_qualification`
--

CREATE TABLE IF NOT EXISTS `mentee_qualification` (
  `mentee_id` int(5) NOT NULL,
  `course` varchar(30) NOT NULL,
  `year` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `academic_year` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `current` int(6) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `edited_by` varchar(40) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `edited_date` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE IF NOT EXISTS `mentor` (
  `fname` varchar(40) NOT NULL,
  `sname` varchar(40) NOT NULL,
  `mname` varchar(40) NOT NULL,
  `dob` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
`mentor_id` int(5) NOT NULL,
  `address` varchar(40) NOT NULL,
  `mob` bigint(20) NOT NULL,
  `total_work_exp` int(5) NOT NULL,
  `time_investment` int(5) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `edited_by` varchar(40) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `edited_date` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE IF NOT EXISTS `user_detail` (
  `user_id` int(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `fkid` int(5) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `edited_by` varchar(40) NOT NULL,
  `created_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `edited_date` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `mentor`
--
ALTER TABLE `mentor`
 ADD PRIMARY KEY (`mentor_id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
 ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mentor`
--
ALTER TABLE `mentor`
MODIFY `mentor_id` int(5) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
