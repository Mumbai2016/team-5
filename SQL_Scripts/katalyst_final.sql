-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2016 at 05:27 AM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `registeradmin`(IN `name1` varchar(200),IN `email1` varchar(250),IN `pass` varchar(150),IN `stat` int)
BEGIN
if stat=0 THEN
insert into admin(name,email,password) values(`name1`,email1,pass);
insert into user_detail(username,password,type,fkid,created_by,edited_by,created_date,edited_Date) values(email1,pass,'ADMIN',@@identity,1,1,NOW(),NOW());
ELSE
update admin set `name`=name1,email=email1,`password`=pass where aid=stat;
update user_detail set username=email1,`password`=pass where fkid=stat and type='ADMIN';
end IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registermentee`(IN `fname1` varchar(160),IN `sname1` varchar(160),IN `address1` varchar(160),IN `dob1` varchar(160),IN `income` decimal,IN `mob` varchar(12),IN `org` varchar(200),IN `emailid1` varchar(200),In passwd varchar(150),IN `stat` int)
BEGIN
	if stat=0 THEN
insert into mentee(fname,sname,dob,emailid,address,mobileno,annual_income,organization,created_by,edited_by,created_date,edited_date,passwrd) 
values(fname1,sname1,dob1,emailid1,address1,mob,income,org,1,1,NOW(),NOW(),passwd);
insert into user_detail(username,password,type,fkid,created_by,edited_by,created_date,edited_Date) values(emailid1,passwd,'mentee',@@identity,1,1,NOW(),NOW(),passwd);
ELSE
update mentee set fname=fname1,sname=sname1,dob=dob1,emailid=emailid1,address=address1,mobileno=mob where mentee_id=stat;
update user_detail set username=emailid1,`password`=passwd where fkid=stat and type='mentee';
end IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registermentor`(IN `fname1` varchar(50),IN `lname1` varchar(100),IN `mname1` varchar(100),IN `dob1` varchar(100),IN `emailid` varchar(200),IN `passwd` varchar(150),IN `address1` varchar(200),IN `mobileno` varchar(10),IN `workexp` decimal,IN `int_time` decimal,IN `stat` int,in comp varchar(100))
BEGIN
if stat=0 THEN
insert into mentor(fname,sname,mname,dob,email,password,address,mob,total_work_exp,time_investment,created_by,edited_by,created_date,edited_date,company) 
values(fname1,lname1,mname1,dob1,emailid,passwd,address1,mobileno,workexp,int_time,1,1,NOW(),NOW(),comp);
insert into user_detail(username,password,type,fkid,created_by,edited_by,created_date,edited_Date) values(emailid,passwd,'mentor',@@identity,1,1,NOW(),NOW());
ELSE
update mentor set fname=fname1,sname=lname1,mname=mname1,dob=dob1,email=emailid,password=passwd,address=address1,mob=mobileno,total_work_exp=workexp,time_investment=int_time where mentor_id=stat;
update user_detail set username=emailid,`password`=passwd where fkid=stat and type='mentor';
end IF;
END$$

DELIMITER ;

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
  `edited_date` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `stat` int(11) DEFAULT '1'
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
  `created_by` int(11) DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mentee`
--

CREATE TABLE IF NOT EXISTS `mentee` (
`mentee_id` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `annual_income` bigint(15) NOT NULL,
  `mobileno` varchar(10) DEFAULT NULL,
  `organization` varchar(200) DEFAULT NULL,
  `emailid` varchar(200) DEFAULT NULL,
  `passwrd` varchar(50) DEFAULT NULL,
  `created_by` varchar(40) NOT NULL,
  `edited_by` varchar(40) NOT NULL,
  `created_date` datetime NOT NULL,
  `edited_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentee_notification_accept`
--

CREATE TABLE IF NOT EXISTS `mentee_notification_accept` (
`meet_id` int(20) NOT NULL,
  `mentor_id` int(20) NOT NULL,
  `mentee_id` int(20) NOT NULL,
  `meet_date` date NOT NULL,
  `meet_time` time NOT NULL,
  `meet_place` varchar(50) NOT NULL,
  `accept` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE IF NOT EXISTS `mentor` (
  `fname` varchar(40) NOT NULL,
  `sname` varchar(40) NOT NULL,
  `mname` varchar(40) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
`mentor_id` int(5) NOT NULL,
  `address` varchar(40) NOT NULL,
  `mob` bigint(20) NOT NULL,
  `total_work_exp` decimal(5,0) NOT NULL,
  `time_investment` decimal(5,0) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `edited_by` varchar(40) NOT NULL,
  `created_date` date NOT NULL,
  `edited_date` date NOT NULL,
  `company` varchar(100) DEFAULT NULL
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rate` int(3) NOT NULL,
  `minutes` text NOT NULL,
  `interact` varchar(10) NOT NULL,
  `fruitful` varchar(5) NOT NULL,
  `interest` varchar(5) NOT NULL,
  `comfort` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `assign_mentor_mentee`
--
ALTER TABLE `assign_mentor_mentee`
 ADD PRIMARY KEY (`assign_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
 ADD PRIMARY KEY (`goals_id`);

--
-- Indexes for table `mentee`
--
ALTER TABLE `mentee`
 ADD PRIMARY KEY (`mentee_id`);

--
-- Indexes for table `mentee_notification_accept`
--
ALTER TABLE `mentee_notification_accept`
 ADD PRIMARY KEY (`meet_id`);

--
-- Indexes for table `mentor`
--
ALTER TABLE `mentor`
 ADD PRIMARY KEY (`mentor_id`);

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
-- AUTO_INCREMENT for table `assign_mentor_mentee`
--
ALTER TABLE `assign_mentor_mentee`
MODIFY `assign_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
MODIFY `goals_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mentee`
--
ALTER TABLE `mentee`
MODIFY `mentee_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mentee_notification_accept`
--
ALTER TABLE `mentee_notification_accept`
MODIFY `meet_id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mentor`
--
ALTER TABLE `mentor`
MODIFY `mentor_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
