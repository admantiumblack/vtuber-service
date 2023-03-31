-- Adminer 4.8.1 MySQL 8.0.32 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `vtuber_db`;

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `channel_playlist`;
CREATE TABLE `channel_playlist` (
  `playlist_id` varchar(32) NOT NULL,
  `channel_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `playlist_type` varchar(10) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `channel_playlist_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `vtuber_platform` (`channel_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `channel_playlist` (`playlist_id`, `channel_id`, `playlist_type`) VALUES
('UUYz_5n-uDuChHtLo7My1HnQ',	'UCP0BspO_AMEe3aQqqpo89Dg',	'uploads')
ON DUPLICATE KEY UPDATE `playlist_id` = VALUES(`playlist_id`), `channel_id` = VALUES(`channel_id`), `playlist_type` = VALUES(`playlist_type`);

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `company` (`company_id`, `company_name`) VALUES
(1,	'hololive'),
(2,	'nijisanji'),
(3,	'indie'),
(4,	'prism project')
ON DUPLICATE KEY UPDATE `company_id` = VALUES(`company_id`), `company_name` = VALUES(`company_name`);

DROP TABLE IF EXISTS `stream_platform`;
CREATE TABLE `stream_platform` (
  `platform_id` int unsigned NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `stream_platform` (`platform_id`, `platform_name`) VALUES
(1,	'youtube')
ON DUPLICATE KEY UPDATE `platform_id` = VALUES(`platform_id`), `platform_name` = VALUES(`platform_name`);

DROP TABLE IF EXISTS `vtuber`;
CREATE TABLE `vtuber` (
  `vtuber_id` int unsigned NOT NULL AUTO_INCREMENT,
  `vtuber_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`vtuber_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

INSERT INTO `vtuber` (`vtuber_id`, `vtuber_name`) VALUES
(1,	'Moona Hoshinova'),
(2,	'Mika Melatika'),
(3,	'Hoshimachi Suisei'),
(4,	'Tokoyami Towa'),
(5,	'Mori Calliope'),
(6,	'Pavolia Reine'),
(7,	'Futakuchi Mana'),
(8,	'Enna Alouette'),
(9,	'Neuro-sama'),
(10,	'Aoi Tokimori')
ON DUPLICATE KEY UPDATE `vtuber_id` = VALUES(`vtuber_id`), `vtuber_name` = VALUES(`vtuber_name`);

DROP TABLE IF EXISTS `vtuber_company`;
CREATE TABLE `vtuber_company` (
  `vtuber_id` int unsigned NOT NULL,
  `company_id` int unsigned NOT NULL,
  `begin_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  PRIMARY KEY (`vtuber_id`,`end_date`,`company_id`),
  KEY `compay_id` (`company_id`),
  CONSTRAINT `vtuber_company_ibfk_4` FOREIGN KEY (`vtuber_id`) REFERENCES `vtuber` (`vtuber_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vtuber_company_ibfk_7` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `vtuber_company` (`vtuber_id`, `company_id`, `begin_date`, `end_date`) VALUES
(1,	1,	'2012-01-01 00:00:00',	'9999-12-31 00:00:00'),
(2,	2,	'2012-01-01 00:00:00',	'9999-12-31 00:00:00'),
(3,	1,	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
(4,	1,	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
(5,	1,	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
(6,	1,	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
(7,	3,	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
(8,	2,	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
(9,	3,	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
(10,	4,	'2023-03-31 15:41:28',	'9999-12-31 00:00:00')
ON DUPLICATE KEY UPDATE `vtuber_id` = VALUES(`vtuber_id`), `company_id` = VALUES(`company_id`), `begin_date` = VALUES(`begin_date`), `end_date` = VALUES(`end_date`);

DROP TABLE IF EXISTS `vtuber_platform`;
CREATE TABLE `vtuber_platform` (
  `channel_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `vtuber_id` int unsigned NOT NULL,
  `platform_id` int unsigned NOT NULL,
  `channel_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `begin_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  PRIMARY KEY (`channel_id`),
  KEY `vtuber_id` (`vtuber_id`),
  KEY `platform_id` (`platform_id`),
  CONSTRAINT `vtuber_platform_ibfk_4` FOREIGN KEY (`vtuber_id`) REFERENCES `vtuber` (`vtuber_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `vtuber_platform_ibfk_5` FOREIGN KEY (`platform_id`) REFERENCES `stream_platform` (`platform_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

INSERT INTO `vtuber_platform` (`channel_id`, `vtuber_id`, `platform_id`, `channel_name`, `begin_date`, `end_date`) VALUES
('UC1uv2Oq6kNxgATlCiez59hw',	4,	1,	'Towa Ch. 常闇トワ',	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
('UCahgMxSIQ2zIRrPKhM6Mjvg',	2,	1,	'Mika Melatika【NIJISANJI・にじさんじ】',	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
('UChgTyjG-pdNvxxhdsXfHQ5Q',	6,	1,	'Pavolia Reine Ch. hololive-ID',	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
('UCJFZiqLMntJufDCHc6bQixg',	3,	1,	'Suisei Channel',	'2012-01-01 00:00:00',	'9999-12-31 00:00:00'),
('UCL_qhgtOy0dy1Agp8vkySQg',	5,	1,	'Mori Calliope Ch. hololive-EN',	'2023-03-31 15:22:20',	'9999-12-31 00:00:00'),
('UCLHmLrj4pHHg3-iBJn_CqxA',	9,	1,	'Neuro-sama',	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
('UCP0BspO_AMEe3aQqqpo89Dg',	1,	1,	'Moona Hoshinova hololive-ID',	'2023-03-31 15:45:54',	'9999-12-31 00:00:00'),
('UCqGtqSn0NiOCottKpYwBc4w',	7,	1,	'Futakuchi Mana Ch. | 二口魔菜',	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
('UCR6qhsLpn62WVxCBK1dkLow',	8,	1,	'Enna Alouette【NIJISANJI EN】',	'2001-01-01 00:00:00',	'9999-12-31 00:00:00'),
('UCRWF6QSuklmwY3UJHyVTQ1w',	10,	1,	'Aoi Tokimori / 時守あおい [PRISM Project]',	'2001-01-01 00:00:00',	'9999-12-31 00:00:00')
ON DUPLICATE KEY UPDATE `channel_id` = VALUES(`channel_id`), `vtuber_id` = VALUES(`vtuber_id`), `platform_id` = VALUES(`platform_id`), `channel_name` = VALUES(`channel_name`), `begin_date` = VALUES(`begin_date`), `end_date` = VALUES(`end_date`);

DROP TABLE IF EXISTS `vtuber_spotify`;
CREATE TABLE `vtuber_spotify` (
  `vtuber_id` int unsigned NOT NULL,
  `spotify_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`vtuber_id`),
  CONSTRAINT `vtuber_spotify_ibfk_2` FOREIGN KEY (`vtuber_id`) REFERENCES `vtuber` (`vtuber_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `vtuber_spotify` (`vtuber_id`, `spotify_id`) VALUES
(1,	'2Iss9rGmxvoEfVigargjTH'),
(2,	''),
(3,	'726WiFmWkohzodUxK3XjHX'),
(4,	'0XZGQi9wNsE1z9L0AWhC82'),
(5,	'1PhE6rv0146ZTQosoPDjk8'),
(6,	'44udMKGBm7IJxh63aPv0cj'),
(7,	'6nhHInOnQSWKRxntTHBH29'),
(8,	'3mwHbYcjpkIntRQAmC8k2j'),
(9,	''),
(10,	'0xqe5pf6kDFg2IIyUQX08T')
ON DUPLICATE KEY UPDATE `vtuber_id` = VALUES(`vtuber_id`), `spotify_id` = VALUES(`spotify_id`);

-- 2023-03-31 15:50:06
