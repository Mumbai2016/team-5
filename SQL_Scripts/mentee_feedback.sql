-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2016 at 04:48 AM
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
-- Table structure for table `mentee_feedback`
--

CREATE TABLE IF NOT EXISTS `mentee_feedback` (
`mentee_feedback_id` int(11) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `minutes` text NOT NULL,
  `interact` varchar(5) NOT NULL,
  `fruitful` varchar(5) NOT NULL,
  `interest` varchar(5) NOT NULL,
  `comfort` varchar(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mentee_feedback`
--

INSERT INTO `mentee_feedback` (`mentee_feedback_id`, `feedback`, `meeting_id`, `created_by`, `edited_by`, `created_at`, `updated_at`, `minutes`, `interact`, `fruitful`, `interest`, `comfort`) VALUES
(1, 'feedback', 25, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'minutes', 'inter', 'fruit', 'inter', 'comfo'),
(2, 'feedback', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'minutes', 'inter', 'fruit', 'inter', 'comfo'),
(3, 'feedback', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'minutes', 'inter', 'fruit', 'inter', 'comfo'),
(4, 'on', 25, 1, 1, '2016-07-23 20:31:58', '2016-07-23 20:31:58', 'dffwdd', 'n', 'y', 'y', 'y'),
(5, 'ooo', 25, 1, 1, '2016-07-23 23:11:25', '2016-07-23 23:11:25', 'ooo', 'n', 'y', 'y', 'y'),
(6, 'ooo', 25, 1, 1, '2016-07-23 23:13:29', '2016-07-23 23:13:29', 'ooo', 'n', 'y', 'y', 'y'),
(7, 'ooo', 25, 1, 1, '2016-07-23 23:13:56', '2016-07-23 23:13:56', 'ooo', 'n', 'y', 'y', 'y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mentee_feedback`
--
ALTER TABLE `mentee_feedback`
 ADD PRIMARY KEY (`mentee_feedback_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mentee_feedback`
--
ALTER TABLE `mentee_feedback`
MODIFY `mentee_feedback_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
