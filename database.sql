-- Adminer 4.8.1 MySQL 8.0.32 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `channel_playlist`;
CREATE TABLE `channel_playlist` (
  `playlist_id` varchar(32) NOT NULL,
  `channel_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `playlist_type` varchar(10) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `channel_playlist_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `vtuber_platform` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `channel_playlist` (`playlist_id`, `channel_id`, `playlist_type`) VALUES
('UUahgMxSIQ2zIRrPKhM6Mjvg',	'UCahgMxSIQ2zIRrPKhM6Mjvg',	'uploads'),
('UUYz_5n-uDuChHtLo7My1HnQ',	'UCYz_5n-uDuChHtLo7My1HnQ',	'uploads')
ON DUPLICATE KEY UPDATE `playlist_id` = VALUES(`playlist_id`), `channel_id` = VALUES(`channel_id`), `playlist_type` = VALUES(`playlist_type`);

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `company` (`company_id`, `company_name`) VALUES
(1,	'hololive'),
(2,	'nijisanji')
ON DUPLICATE KEY UPDATE `company_id` = VALUES(`company_id`), `company_name` = VALUES(`company_name`);

DROP TABLE IF EXISTS `stream_platform`;
CREATE TABLE `stream_platform` (
  `platform_id` int unsigned NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `stream_platform` (`platform_id`, `platform_name`) VALUES
(1,	'youtube')
ON DUPLICATE KEY UPDATE `platform_id` = VALUES(`platform_id`), `platform_name` = VALUES(`platform_name`);

DROP TABLE IF EXISTS `vtuber`;
CREATE TABLE `vtuber` (
  `vtuber_id` int unsigned NOT NULL AUTO_INCREMENT,
  `vtuber_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`vtuber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

INSERT INTO `vtuber` (`vtuber_id`, `vtuber_name`) VALUES
(1,	'Kureiji Ollie'),
(2,	'Mika Melatika')
ON DUPLICATE KEY UPDATE `vtuber_id` = VALUES(`vtuber_id`), `vtuber_name` = VALUES(`vtuber_name`);

DROP TABLE IF EXISTS `vtuber_company`;
CREATE TABLE `vtuber_company` (
  `vtuber_id` int unsigned NOT NULL,
  `company_id` int unsigned NOT NULL,
  `begin_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`vtuber_id`,`company_id`,`end_date`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `vtuber_company_ibfk_4` FOREIGN KEY (`vtuber_id`) REFERENCES `vtuber` (`vtuber_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vtuber_company_ibfk_5` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `vtuber_company` (`vtuber_id`, `company_id`, `begin_date`, `end_date`) VALUES
(1,	1,	'2012-01-01 00:00:00',	'9999-12-31 00:00:00'),
(2,	2,	'2012-01-01 00:00:00',	'9999-12-31 00:00:00')
ON DUPLICATE KEY UPDATE `vtuber_id` = VALUES(`vtuber_id`), `company_id` = VALUES(`company_id`), `begin_date` = VALUES(`begin_date`), `end_date` = VALUES(`end_date`);

DROP TABLE IF EXISTS `vtuber_platform`;
CREATE TABLE `vtuber_platform` (
  `channel_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `vtuber_id` int unsigned NOT NULL,
  `platform_id` int unsigned NOT NULL,
  `channel_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `begin_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`channel_id`),
  KEY `vtuber_id` (`vtuber_id`),
  KEY `platform_id` (`platform_id`),
  CONSTRAINT `vtuber_platform_ibfk_4` FOREIGN KEY (`vtuber_id`) REFERENCES `vtuber` (`vtuber_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vtuber_platform_ibfk_5` FOREIGN KEY (`platform_id`) REFERENCES `stream_platform` (`platform_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

INSERT INTO `vtuber_platform` (`channel_id`, `vtuber_id`, `platform_id`, `channel_name`, `begin_date`, `end_date`) VALUES
('UCahgMxSIQ2zIRrPKhM6Mjvg',	2,	1,	'Mika Melatika【NIJISANJI・にじさんじ】',	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
('UCYz_5n-uDuChHtLo7My1HnQ',	1,	1,	'Kureiji Ollie Ch. hololive-ID',	'2023-03-28 08:22:05',	'9999-12-31 00:00:00')
ON DUPLICATE KEY UPDATE `channel_id` = VALUES(`channel_id`), `vtuber_id` = VALUES(`vtuber_id`), `platform_id` = VALUES(`platform_id`), `channel_name` = VALUES(`channel_name`), `begin_date` = VALUES(`begin_date`), `end_date` = VALUES(`end_date`);

DROP TABLE IF EXISTS `vtuber_spotify`;
CREATE TABLE `vtuber_spotify` (
  `vtuber_id` int unsigned NOT NULL,
  `spotify_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`vtuber_id`),
  CONSTRAINT `vtuber_spotify_ibfk_2` FOREIGN KEY (`vtuber_id`) REFERENCES `vtuber` (`vtuber_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 2023-03-28 08:22:15
