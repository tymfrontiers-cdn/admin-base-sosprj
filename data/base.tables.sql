SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `{MYSQL_BASE_DB}`
--

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` char(56) NOT NULL,
  `skey` char(26) NOT NULL,
  `sval` char(128) NOT NULL,
  `_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

  --
  -- Table structure for table `setting_option`
  --

  DROP TABLE IF EXISTS `setting_option`;
  CREATE TABLE `setting_option` (
    `id` bigint(20) UNSIGNED NOT NULL,
    `name` char(28) NOT NULL,
    `domain` char(32) NOT NULL,
    `type` char(28) NOT NULL,
    `type_variant` varchar(512) DEFAULT NULL,
    `title` char(52) NOT NULL,
    `description` varchar(256) NOT NULL,
    `_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `setting_option`
  --
  ALTER TABLE `setting_option`
    ADD PRIMARY KEY (`id`),
    ADD KEY `name` (`name`);

  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `setting_option`
  --
  ALTER TABLE `setting_option`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
  COMMIT;
