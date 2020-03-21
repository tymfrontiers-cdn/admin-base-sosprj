-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2020 at 03:25 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `email_outbox`
--

DROP TABLE IF EXISTS `email_outbox`;
CREATE TABLE IF NOT EXISTS `email_outbox` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `priority` tinyint(4) NOT NULL DEFAULT 5,
  `qid` char(128) NOT NULL,
  `transport` char(25) NOT NULL COMMENT 'SMTP,API',
  `gateway` char(25) NOT NULL COMMENT 'MAILGUN,NATIVE',
  `domain` char(55) NOT NULL,
  `batch` char(128) NOT NULL,
  `has_attachment` tinyint(1) NOT NULL DEFAULT 0,
  `status` char(3) NOT NULL DEFAULT 'Q' COMMENT 'Q,D,S',
  `subject` char(95) NOT NULL,
  `msg_text` varchar(2048) NOT NULL,
  `msg_html` text NOT NULL,
  `sender` char(55) NOT NULL,
  `receiver` char(55) NOT NULL,
  `cc` varchar(512) NOT NULL,
  `bcc` varchar(512) NOT NULL,
  `headers` varchar(10240) DEFAULT NULL,
  `_created` datetime NOT NULL DEFAULT current_timestamp(),
  `_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_outbox_attachment`
--

DROP TABLE IF EXISTS `email_outbox_attachment`;
CREATE TABLE IF NOT EXISTS `email_outbox_attachment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ebatch` char(128) NOT NULL,
  `fid` int(11) NOT NULL,
  `_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
CREATE TABLE IF NOT EXISTS `event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` char(12) NOT NULL,
  `channel` char(95) NOT NULL,
  `title` char(128) NOT NULL,
  `info` text NOT NULL,
  `_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `otp_email`
--

DROP TABLE IF EXISTS `otp_email`;
CREATE TABLE IF NOT EXISTS `otp_email` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ref` char(32) NOT NULL,
  `user` char(72) NOT NULL,
  `code` char(32) NOT NULL,
  `qid` varchar(256) NOT NULL,
  `subject` char(72) NOT NULL,
  `message` text NOT NULL,
  `message_text` varchar(512) NOT NULL,
  `sender` char(128) NOT NULL,
  `receiver` char(128) NOT NULL,
  `expiry` datetime DEFAULT NULL,
  `_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` char(56) NOT NULL,
  `skey` char(26) NOT NULL,
  `sval` char(128) NOT NULL,
  `_updated` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
