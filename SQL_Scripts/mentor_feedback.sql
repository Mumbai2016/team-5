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
-- Table structure for table `mentor_feedback`
--

CREATE TABLE IF NOT EXISTS `mentor_feedback` (
`mentor_feedback_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rate` int(3) NOT NULL,
  `minutes` text NOT NULL,
  `interact` varchar(10) NOT NULL,
  `fruitful` varchar(5) NOT NULL,
  `interest` varchar(5) NOT NULL,
  `comfort` varchar(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `mentor_feedback`
--

INSERT INTO `mentor_feedback` (`mentor_feedback_id`, `meeting_id`, `feedback`, `created_by`, `edited_by`, `created_at`, `updated_at`, `rate`, `minutes`, `interact`, `fruitful`, `interest`, `comfort`) VALUES
(22, 25, 'Student uninterested', 0, 0, '2016-07-23 18:14:55', '2016-07-23 18:14:55', 1, '', '', '', '', ''),
(23, 25, 'Student uninterested', 0, 0, '2016-07-23 18:32:27', '2016-07-23 18:32:27', 1, '', '', '', '', ''),
(24, 25, 'Student', 0, 0, '2016-07-23 18:33:01', '2016-07-23 18:33:01', 1, '', '', '', '', ''),
(25, 0, 'Pretty good\r\n', 0, 0, '2016-07-23 19:15:47', '2016-07-23 19:15:47', 1, '', '', '', '', ''),
(26, 0, 'Pretty good\r\n', 0, 0, '2016-07-23 19:18:09', '2016-07-23 19:18:09', 1, '', '', '', '', ''),
(27, 25, 'Good good', 0, 0, '2016-07-23 19:19:33', '2016-07-23 19:19:33', 2, '', '', '', '', ''),
(28, 25, 'Good good', 0, 0, '2016-07-23 19:20:29', '2016-07-23 19:20:29', 2, '', '', '', '', ''),
(29, 1, 'good', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'good', 'yes', 'fruit', 'y', 'ya'),
(30, 1, 'good', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'good', 'yes', 'fruit', 'y', 'ya'),
(31, 1, 'good', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'thaks', 'y', 'y', 'y', 'y'),
(32, 1, 'good', 1, 1, '2016-07-23 20:04:31', '2016-07-23 20:04:31', 2, 'thaks', 'y', 'y', 'y', 'y'),
(33, 1, 'good', 1, 1, '2016-07-23 20:04:33', '2016-07-23 20:04:33', 2, 'thaks', 'y', 'y', 'y', 'y'),
(34, 1, 'good', 1, 1, '2016-07-23 20:05:13', '2016-07-23 20:05:13', 1, 'affajaf', 'y', 'y', 'y', 'y'),
(35, 1, 'no', 1, 1, '2016-07-23 20:06:46', '2016-07-23 20:06:46', 2, 'good enugh', 'n', 'y', 'y', 'y'),
(36, 25, 'noafaf', 1, 1, '2016-07-23 20:08:07', '2016-07-23 20:08:07', 2, 'fafaffd', 'n', 'y', 'y', 'y'),
(37, 25, 'noafaf', 1, 1, '2016-07-23 20:27:40', '2016-07-23 20:27:40', 2, 'fafaffd', 'n', 'y', 'y', 'y'),
(38, 25, 'noafaf', 1, 1, '2016-07-23 20:27:50', '2016-07-23 20:27:50', 2, 'fafaffd', 'n', 'y', 'y', 'y'),
(39, 25, 'dg', 1, 1, '2016-07-23 20:29:07', '2016-07-23 20:29:07', 1, 'hdhd', 'y', 'y', 'y', 'y'),
(40, 25, 'eyahhh djbqkj', 1, 1, '2016-07-23 22:24:21', '2016-07-23 22:24:21', 2, 'lets se', 'y', 'y', 'y', 'n'),
(41, 25, 'eyahhh djbqkj', 1, 1, '2016-07-23 22:26:35', '2016-07-23 22:26:35', 2, 'lets se', 'y', 'y', 'y', 'n'),
(42, 25, '123', 1, 1, '2016-07-23 22:27:07', '2016-07-23 22:27:07', 5, '123', 'n', 'y', 'y', 'n'),
(43, 25, '123', 1, 1, '2016-07-23 22:27:41', '2016-07-23 22:27:41', 5, '123', 'n', 'y', 'y', 'n'),
(44, 25, 'ooo', 1, 1, '2016-07-23 23:09:13', '2016-07-23 23:09:13', 2, 'ooo', 'y', 'n', 'y', 'n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mentor_feedback`
--
ALTER TABLE `mentor_feedback`
 ADD PRIMARY KEY (`mentor_feedback_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mentor_feedback`
--
ALTER TABLE `mentor_feedback`
MODIFY `mentor_feedback_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
