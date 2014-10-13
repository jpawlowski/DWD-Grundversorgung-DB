SET FOREIGN_KEY_CHECKS = 0;


# Dump of table dwd_dienststelle
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dwd_dienststelle` (
  `dienststelle_id` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dienststelle_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dienststelle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dwd_erscheinung
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dwd_erscheinung` (
  `erscheinung_id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `erscheinung_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`erscheinung_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dwd_hoehenstufe
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dwd_hoehenstufe` (
  `hoehenstufe_id` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hoehenstufe_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hoehenstufe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dwd_land
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dwd_land` (
  `land_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `land_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`land_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dwd_warngebiet
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dwd_warngebiet` (
  `warngebiet_id` smallint(3) NOT NULL AUTO_INCREMENT,
  `dwd_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `land_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `warngebiet_dwd_kennung` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `warngebiet_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dienststelle_id` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `warngebiet_kfz` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typ_id` tinyint(1) NOT NULL,
  `warngebiet_kreis_stadt_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `warngebiet_zusatz` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warngebiet_kurz` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `warngebiet_anmerkung` tinytext COLLATE utf8_unicode_ci,
  `warngebiet_cellID` smallint(5) unsigned DEFAULT NULL,
  `warngebiet_warnCellID` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`warngebiet_id`),
  UNIQUE KEY `dwd_kennung` (`warngebiet_dwd_kennung`,`typ_id`,`land_id`),
  KEY `dienststelle_id` (`dienststelle_id`),
  KEY `typ_id` (`typ_id`),
  KEY `land_id` (`land_id`),
  CONSTRAINT `dwd_warngebiet_ibfk_1` FOREIGN KEY (`typ_id`) REFERENCES `dwd_warngebiet_typ` (`typ_id`) ON UPDATE CASCADE,
  CONSTRAINT `dwd_warngebiet_ibfk_2` FOREIGN KEY (`land_id`) REFERENCES `dwd_land` (`land_id`) ON UPDATE CASCADE,
  CONSTRAINT `dwd_warngebiet_ibfk_3` FOREIGN KEY (`dienststelle_id`) REFERENCES `dwd_dienststelle` (`dienststelle_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dwd_warngebiet_typ
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dwd_warngebiet_typ` (
  `typ_id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `typ_bezeichnung` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dwd_warntyp
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dwd_warntyp` (
  `warntyp_id` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `erscheinung_id` tinyint(2) NOT NULL,
  `warntyp_ereignis` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `warntyp_anmerkung` tinytext COLLATE utf8_unicode_ci,
  `warntyp_schwelle` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`warntyp_id`),
  KEY `erscheinung_id` (`erscheinung_id`),
  CONSTRAINT `dwd_warntyp_ibfk_1` FOREIGN KEY (`erscheinung_id`) REFERENCES `dwd_erscheinung` (`erscheinung_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table dwd_warnart
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dwd_warnart` (
  `warnart_id` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `warnart_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`warnart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


SET FOREIGN_KEY_CHECKS = 1;
