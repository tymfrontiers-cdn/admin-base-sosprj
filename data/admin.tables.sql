-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2020 at 03:13 AM
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
-- Table structure for table `path_access`
--

DROP TABLE IF EXISTS `path_access`;
CREATE TABLE IF NOT EXISTS `path_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` char(12) NOT NULL,
  `path_name` char(128) NOT NULL,
  `_author` char(12) NOT NULL,
  `_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `path_access`
--

INSERT INTO `path_access` (`id`, `user`, `path_name`, `_author`) VALUES
(1, 'DFOWNER', 'project-admin/', 'DFOWNER');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `_id` char(12) NOT NULL,
  `status` char(25) NOT NULL DEFAULT 'PENDING',
  `work_group` char(32) NOT NULL,
  `email` char(55) NOT NULL,
  `phone` char(16) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `name` char(32) NOT NULL,
  `surname` char(32) NOT NULL,
  `country_code` char(2) NOT NULL,
  `state_code` char(8) NOT NULL,
  `_author` char(12) NOT NULL,
  `_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`_id`, `status`, `work_group`, `email`, `phone`, `password`, `name`, `surname`, `country_code`, `state_code`, `_author`) VALUES
('DFOWNER', 'DISABLED', 'OWNER', 'dev@project.info', NULL, '$2y$10$ZGNkNjhkZDc3OTAwZDQ2Z.cOwfggpgrg3GFo/mzscbQf9im5Mf.yK', 'Default', 'Owner', 'NG', 'NGLAG', 'DFOWNER');

-- --------------------------------------------------------

--
-- Table structure for table `work_domain`
--

DROP TABLE IF EXISTS `work_domain`;
CREATE TABLE IF NOT EXISTS `work_domain` (
  `name` char(98) NOT NULL,
  `acronym` char(16) NOT NULL,
  `path` char(72) NOT NULL,
  `icon` char(72) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `acronym` (`acronym`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_domain`
--

INSERT INTO `work_domain` (`name`, `acronym`, `path`, `icon`, `description`) VALUES
('project-admin', 'ADM', '/admin', 'fas fa-cogs', 'Admin Web portal');

-- --------------------------------------------------------

--
-- Table structure for table `work_group`
--

DROP TABLE IF EXISTS `work_group`;
CREATE TABLE IF NOT EXISTS `work_group` (
  `name` char(32) NOT NULL,
  `rank` tinyint(2) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_group`
--

INSERT INTO `work_group` (`name`, `rank`) VALUES
('ADMIN', 6),
('ADVERTISER', 3),
('ANALYST', 2),
('DEVELOPER', 7),
('EDITOR', 5),
('GUEST', 0),
('MODERATOR', 4),
('OWNER', 14),
('SUPERADMIN', 8),
('USER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `work_path`
--

DROP TABLE IF EXISTS `work_path`;
CREATE TABLE IF NOT EXISTS `work_path` (
  `name` char(128) NOT NULL COMMENT 'domain/path',
  `domain` char(98) NOT NULL,
  `path` char(56) NOT NULL,
  `nav_visible` tinyint(1) NOT NULL DEFAULT 0,
  `access_rank` tinyint(2) NOT NULL,
  `access_rank_strict` tinyint(1) DEFAULT 0,
  `onclick` char(32) DEFAULT NULL,
  `classname` char(56) DEFAULT NULL,
  `title` char(56) NOT NULL,
  `icon` char(72) DEFAULT NULL,
  `sort` tinyint(3) UNSIGNED DEFAULT 0,
  `description` varchar(256) NOT NULL,
  `_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`name`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_path`
--

INSERT INTO `work_path` (`name`, `domain`, `path`, `nav_visible`, `access_rank`, `access_rank_strict`, `onclick`, `classname`, `title`, `icon`, `sort`, `description`) VALUES
('project-admin/', 'project-admin', '/', 0, 7, 0, NULL, NULL, 'Ultimate access', NULL, 0, 'Ultimate domain -path/access'),
('project-admin/dashboard', 'project-admin', '/dashboard', 1, 4, 0, '', '', 'Dashboard', '&lt;i class=&quot;fas fa-tachometer-alt&quot;&gt;&lt;/i&gt;', 0, 'Admin dashboard'),
('project-admin/path-access', 'project-admin', '/path-access', 0, 6, 0, NULL, NULL, '/Path-access', NULL, 0, 'Path access management grant'),
('project-admin/path-accesses', 'project-admin', '/path-accesses', 1, 6, 0, '', '', 'Path access', '&lt;i class=&quot;fas fa-universal-access&quot;&gt;&lt;/i&gt;', 4, 'Path access listing'),
('project-admin/sign-out', 'project-admin', '/sign-out', 1, 1, 1, '', '', 'Sign out', '&lt;i class=&quot;fas fa-sign-out-alt&quot;&gt;&lt;/i&gt;', 50, 'Link to sign out'),
('project-admin/user', 'project-admin', '/user', 0, 6, 0, NULL, NULL, '/User', NULL, 0, 'Path access for user management'),
('project-admin/users', 'project-admin', '/users', 1, 4, 0, '', '', 'Users', '&lt;i class=&quot;fas fa-users&quot;&gt;&lt;/i&gt;', 1, 'Admin user accounts'),
('project-admin/work-domain', 'project-admin', '/work-domain', 0, 6, 0, NULL, NULL, '/WorkDomain', NULL, 0, 'Work domain management access'),
('project-admin/work-domains', 'project-admin', '/work-domains', 1, 4, 0, '', '', 'Work domains', '&lt;i class=&quot;fas fa-globe&quot;&gt;&lt;/i&gt;', 2, 'Work domain list'),
('project-admin/work-path', 'project-admin', '/work-path', 0, 6, 0, NULL, NULL, '/Work-Path', NULL, 0, 'Work path manager access'),
('project-admin/work-paths', 'project-admin', '/work-paths', 1, 6, 0, '', '', 'Work paths', '&lt;i class=&quot;fas fa-folder-open&quot;&gt;&lt;/i&gt;', 3, 'List of work paths'),
('project-admin/setting', 'project-admin', '/setting', 0, 5, 0, NULL, NULL, '/Setting access', NULL, 0, 'Path access for settings'),
('project-admin/setting-option', 'project-admin', '/setting-option', 0, 7, 0, NULL, NULL, '/Setting option', NULL, 0, 'Access to manage setting options'),
('project-admin/setting-options', 'project-admin', '/setting-options', 1, 7, 0, '', '', 'Setting options', '&lt;i class=&quot;fas fa-cogs&quot;&gt;&lt;/i&gt;', 11, 'View setting options'),
('project-admin/settings', 'project-admin', '/settings', 1, 4, 0, NULL, NULL, 'Settings', '&lt;i class=&quot;fas fa-cog&quot;&gt;&lt;/i&gt;', 10, 'Settings list/options');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
