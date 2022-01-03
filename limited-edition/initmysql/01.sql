CREATE DATABASE IF NOT EXISTS `xqledgeradmindb`;

USE `xqledgeradmindb`;

CREATE TABLE IF NOT EXISTS `tenants` 
(
  `TenantID` tinyint(5) unsigned NOT NULL,
  `Name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Subscription` bigint unsigned NOT NULL DEFAULT 0,
  `Active` boolean NOT NULL DEFAULT true,
  PRIMARY KEY (`TenantID`),
  UNIQUE KEY `Uidx_tenantname` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `databases` (
  `DatabaseID` tinyint(5) unsigned NOT NULL,
  `Name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TenantID` tinyint(5) unsigned NOT NULL,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Creation` bigint(20) unsigned NOT NULL DEFAULT '0',
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`DatabaseID`),
  UNIQUE KEY `Uidx_dbname` (`Name`),
  KEY `FK_dbs_tenants` (`TenantID`),
  CONSTRAINT `FK_dbs_tenants` FOREIGN KEY (`TenantID`) REFERENCES `tenants` (`TenantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `collections` 
(
  `CollectionID` tinyint(5) unsigned NOT NULL,
  `Name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Creation` bigint unsigned NOT NULL DEFAULT 0,
  `DatabaseID` tinyint(5) unsigned NOT NULL,
  `Active` boolean NOT NULL DEFAULT true,
  PRIMARY KEY (`CollectionID`),
  UNIQUE KEY `Uidx_collectionname` (`Name`),
  CONSTRAINT `FK_cols_dbs` FOREIGN KEY (`DatabaseID`) REFERENCES `databases` (`DatabaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sessions` 
(
  `SessionID` tinyint(5) unsigned NOT NULL AUTO_INCREMENT,
  `User` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `StartTime` bigint unsigned NOT NULL DEFAULT 0,
  `EndTime` bigint unsigned NOT NULL DEFAULT 0,
  `Branch` varchsr(100) NOT NULL DEFAULT '',
  `CollectionID` tinyint(5) unsigned NOT NULL,
  PRIMARY KEY (`SessionID`),
  UNIQUE KEY `Uidx_username` (`User`),
  CONSTRAINT `FK_sessions_collections` FOREIGN KEY (`CollectionID`) REFERENCES `collections` (`CollectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO xqledgeradmindb.`tenants` (TenantID, Name, Description, Subscription, Active) VALUES(1, 'Tenant ONE', 'First tenant for testing', 1641035236, 1);
INSERT INTO xqledgeradmindb.`databases` (DatabaseID,Name,TenantID,Description,Creation,Active) VALUES (1,'DatabaseONE1',1,'First database for testing',1641035236,1);
INSERT INTO xqledgeradmindb.`collections` (CollectionID, Name, DatabaseID, Description, Creation, Active) VALUES(1, 'main', 1,'First collection for testing', 1641035236, 1);
