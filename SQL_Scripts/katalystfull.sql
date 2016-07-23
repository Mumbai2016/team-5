-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2016 at 04:48 PM
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
`aid` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
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
-- Table structure for table `feed_details`
--

CREATE TABLE IF NOT EXISTS `feed_details` (
`feed_details_id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `commented_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE IF NOT EXISTS `goals` (
`goals_id` int(11) NOT NULL,
  `goal` text NOT NULL,
  `mentee_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `mentor_id` int(11) NOT NULL,
  `created_by` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `edited_by` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE IF NOT EXISTS `meeting` (
  `meeting_id` int(11) NOT NULL,
  `mentor_id` int(11) NOT NULL,
  `mentee_id` int(11) NOT NULL,
  `meet_time` date NOT NULL,
  `status` int(11) NOT NULL,
  `meet_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `edited_at` date NOT NULL
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
-- Table structure for table `mentee_feedback`
--

CREATE TABLE IF NOT EXISTS `mentee_feedback` (
`mentee_feedback_id` int(11) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `edited_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
-- Table structure for table `mentor_feedback`
--

CREATE TABLE IF NOT EXISTS `mentor_feedback` (
`mentor_feedback_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsfeed`
--

CREATE TABLE IF NOT EXISTS `newsfeed` (
`newsfeed_id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `mentor_id` int(11) NOT NULL,
  `created_by` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `edited_by` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`user_id`, `username`, `password`, `type`, `fkid`, `created_by`, `edited_by`, `created_date`, `edited_date`) VALUES
(1, 'sudarshan', 'sudarshan', 'ADMIN', 1, '1', '1', '2016-07-23 14:20:17.000000', '2016-07-23 14:20:17.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `feed_details`
--
ALTER TABLE `feed_details`
 ADD PRIMARY KEY (`feed_details_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
 ADD PRIMARY KEY (`goals_id`);

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
 ADD PRIMARY KEY (`meeting_id`);

--
-- Indexes for table `mentee_feedback`
--
ALTER TABLE `mentee_feedback`
 ADD PRIMARY KEY (`mentee_feedback_id`);

--
-- Indexes for table `mentor`
--
ALTER TABLE `mentor`
 ADD PRIMARY KEY (`mentor_id`);

--
-- Indexes for table `mentor_feedback`
--
ALTER TABLE `mentor_feedback`
 ADD PRIMARY KEY (`mentor_feedback_id`);

--
-- Indexes for table `newsfeed`
--
ALTER TABLE `newsfeed`
 ADD PRIMARY KEY (`newsfeed_id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feed_details`
--
ALTER TABLE `feed_details`
MODIFY `feed_details_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
MODIFY `goals_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mentee_feedback`
--
ALTER TABLE `mentee_feedback`
MODIFY `mentee_feedback_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mentor`
--
ALTER TABLE `mentor`
MODIFY `mentor_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mentor_feedback`
--
ALTER TABLE `mentor_feedback`
MODIFY `mentor_feedback_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsfeed`
--
ALTER TABLE `newsfeed`
MODIFY `newsfeed_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
