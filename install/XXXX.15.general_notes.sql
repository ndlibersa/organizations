CREATE TABLE IF NOT EXISTS `OrganizationNote` (
  `organizationNoteID` int(11) NOT NULL AUTO_INCREMENT,
  `organizationID` int(11) DEFAULT NULL,
  `noteTypeID` int(11) DEFAULT NULL,
  `tabName` varchar(45) DEFAULT NULL,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateLoginID` varchar(45) DEFAULT NULL,
  `noteText` text,
  PRIMARY KEY (`organizationNoteID`),
  KEY `Index_organizationID` (`organizationID`),
  KEY `Index_noteTypeID` (`noteTypeID`),
  KEY `Index_All` (`organizationID`,`noteTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `NoteType` (
  `noteTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `shortName` varchar(200) DEFAULT NULL,
  PRIMARY KEY  (`noteTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

INSERT INTO `NoteType` (noteTypeID, shortName) values (1, 'General');
INSERT INTO `NoteType` (noteTypeID, shortName) values (2, 'Account Details');
INSERT INTO `NoteType` (noteTypeID, shortName) values (3, 'Licensing Details');
INSERT INTO `NoteType` (noteTypeID, shortName) values (4, 'Contact Details');
INSERT INTO `NoteType` (noteTypeID, shortName) values (5, 'Role Details');
INSERT INTO `NoteType` (noteTypeID, shortName) values (6, 'Initial Note');

-------------------------
--- Migrate existing notes into new table,
--- accounting for conversion from latin1 to utf8
---------------------------
INSERT INTO `OrganizationNote` (`organizationID`, `noteTypeID`, `noteText`)
    SELECT `organizationID`, 1, CONVERT(`noteText` USING BINARY) FROM `Organization` 
    WHERE `noteText` IS NOT NULL AND `noteText` <> '';

INSERT INTO `OrganizationNote` (`organizationID`, `noteTypeID`, `noteText`)
    SELECT `organizationID`, 2, CONVERT(`accountDetailText` USING BINARY) FROM `Organization`
    WHERE `accountDetailText` IS NOT NULL AND `accountDetailText` <> '';
