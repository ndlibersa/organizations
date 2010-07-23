CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`Alias` (
  `aliasID` int(11) NOT NULL auto_increment,
  `organizationID` int(11) default NULL,
  `aliasTypeID` int(11) default NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY  (`aliasID`),
  UNIQUE KEY `aliasID` (`aliasID`),
  KEY `organizationID` (`organizationID`),
  KEY `aliasTypeID` (`aliasTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`AliasType` (
  `aliasTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`aliasTypeID`),
  UNIQUE KEY `aliasTypeID` (`aliasTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`Contact` (
  `contactID` int(11) NOT NULL auto_increment,
  `organizationID` int(11) NOT NULL,
  `lastUpdateDate` date default NULL,
  `name` varchar(150) default NULL,
  `title` varchar(150) default NULL,
  `state` varchar(50) default NULL,
  `country` varchar(100) default NULL,
  `phoneNumber` varchar(50) default NULL,
  `altPhoneNumber` varchar(50) default NULL,
  `faxNumber` varchar(50) default NULL,
  `emailAddress` varchar(100) default NULL,
  `archiveDate` date default NULL,
  `noteText` text,
  PRIMARY KEY  (`contactID`),
  UNIQUE KEY `contactID` (`contactID`),
  KEY `organizationID` (`organizationID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`ContactRole` (
  `contactRoleID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`contactRoleID`),
  UNIQUE KEY `contactRoleID` (`contactRoleID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`ContactRoleProfile` (
  `contactID` int(10) unsigned NOT NULL,
  `contactRoleID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`contactID`,`contactRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`Country` (
  `country` varchar(100) default NULL,
  `countryID` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`countryID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`ExternalLogin` (
  `externalLoginID` int(11) NOT NULL auto_increment,
  `organizationID` int(11) default NULL,
  `externalLoginTypeID` int(11) default NULL,
  `updateDate` date default NULL,
  `loginURL` varchar(150) default NULL,
  `emailAddress` varchar(150) default NULL,
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `noteText` text,
  PRIMARY KEY  (`externalLoginID`),
  UNIQUE KEY `externalLoginID` (`externalLoginID`),
  KEY `organizationID` (`organizationID`),
  KEY `externalLoginTypeID` (`externalLoginTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`ExternalLoginType` (
  `externalLoginTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`externalLoginTypeID`),
  UNIQUE KEY `externalLoginTypeID` (`externalLoginTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`IssueLog` (
  `issueLogID` int(11) NOT NULL auto_increment,
  `organizationID` int(11) default NULL,
  `updateDate` date default NULL,
  `updateLoginID` varchar(50) default NULL,
  `issueDate` date default NULL,
  `noteText` text,
  PRIMARY KEY  (`issueLogID`),
  UNIQUE KEY `issueLogID` (`issueLogID`),
  KEY `organizationID` (`organizationID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`Organization` (
  `organizationID` int(11) NOT NULL auto_increment,
  `createDate` date default NULL,
  `createLoginID` varchar(50) default NULL,
  `updateDate` date default NULL,
  `updateLoginID` varchar(50) default NULL,
  `name` varchar(150) default NULL,
  `companyURL` varchar(150) default NULL,
  `noteText` text,
  `accountDetailText` text,
  PRIMARY KEY  (`organizationID`),
  UNIQUE KEY `organizationID` (`organizationID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`OrganizationHierarchy` (
  `organizationID` int(11) NOT NULL,
  `parentOrganizationID` int(11) NOT NULL,
  PRIMARY KEY  (`organizationID`,`parentOrganizationID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`OrganizationRole` (
  `organizationRoleID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`organizationRoleID`),
  UNIQUE KEY `organizationRoleID` (`organizationRoleID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`OrganizationRoleProfile` (
  `organizationID` int(11) NOT NULL,
  `organizationRoleID` int(11) NOT NULL,
  PRIMARY KEY  (`organizationID`,`organizationRoleID`),
  KEY `organizationRoleID` (`organizationRoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`Privilege` (
  `privilegeID` int(10) unsigned NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  USING BTREE (`privilegeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`State` (
  `state` varchar(50) default NULL,
  `stateID` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`stateID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`User` (
  `loginID` varchar(50) NOT NULL,
  `privilegeID` int(11) default NULL,
  `firstName` varchar(50) default NULL,
  `lastName` varchar(50) default NULL,
  PRIMARY KEY  USING BTREE (`loginID`),
  KEY `roleID` USING BTREE (`privilegeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DELETE FROM `_DATABASE_NAME_`.Alias;
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (2, 3, 'IOP');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (3, 3, 'AIAA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (4, 3, 'APS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (5, 3, 'ASCE');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (6, 3, 'AIP');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (7, 3, 'SIAM');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (9, 3, 'CAS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (10, 3, 'RMA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (11, 3, 'ACI');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (12, 3, 'AACR');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (13, 3, 'IET');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (14, 3, 'AEA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (15, 3, 'AMS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (16, 3, 'AMA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (35, 2, 'Thomson Gale');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (18, 3, 'CSIC');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (19, 3, 'AMS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (20, 3, 'ALA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (21, 3, 'ASTM');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (22, 3, 'ARL');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (23, 3, 'ASLO');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (25, 3, 'APA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (26, 3, 'ACLS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (27, 3, 'AAAS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (265, 3, 'CEA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (141, 3, 'L/N');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (270, 3, 'CSA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (305, 3, 'ACM');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (306, 3, 'ACS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (318, 3, 'ANB');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (28, 1, 'Thomson ISI');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (53, 3, 'AccuNet');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (271, 3, 'AICPA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (311, 2, 'American Association on Mental Retardation');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (311, 3, 'AAMR');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (311, 3, 'AAIDD');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (46, 3, 'AFS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (32, 3, 'AGU');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (245, 3, 'APPI');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (244, 3, 'ASCB');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (242, 3, 'ASHS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (312, 3, 'ASM');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (314, 3, 'ASME');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (401, 3, 'WWP');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (236, 3, 'ASA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (224, 3, 'BE Press');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (180, 3, 'FASEB');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (177, 3, 'GSA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (163, 3, 'HCS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (134, 3, 'MBL');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (104, 3, 'RSC');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (96, 3, 'SEBM');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (95, 3, 'SGM');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (94, 3, 'SLB');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (93, 3, 'SfN');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (82, 3, 'TTP');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (61, 1, 'Institute of Electrical and Electronics Engineers');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (171, 3, 'AIC');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (276, 3, 'AAR');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (273, 3, 'ACA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (322, 3, 'AIMS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (214, 3, 'CCDC');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (362, 3, 'CIAO');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (363, 3, 'CNRI');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (366, 3, 'GSA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (368, 3, 'IPAP');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (371, 3, 'MLA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (372, 3, 'OSA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (380, 3, 'PS');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (257, 1, 'Atypon Link');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (383, 3, 'SAE');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (41, 1, 'Caliber');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (59, 3, 'CUP');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (193, 3, 'EUP');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (365, 1, 'Insight');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (386, 3, 'LEA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (372, 1, 'OpticsInfoBase');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (116, 1, 'POJ');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (113, 1, 'Sirius');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (255, 3, 'MIT');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (206, 3, 'CDP');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (317, 3, 'CRL');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (88, 1, 'Society of Photo-optical Instrumentation Engineers');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (279, 1, 'Simmons Market Research Bureau');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (404, 1, 'Society of Environmental Toxicology and Chemistry ');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (405, 1, 'oldenbourg-link');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (415, 1, 'Otto Harrassowitz');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (259, 2, 'Thomson RIA');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (28, 2, 'Thomson Scientific');
INSERT INTO `_DATABASE_NAME_`.Alias (organizationID, aliasTypeID, name) values (418, 3, 'HRAF');



DELETE FROM `_DATABASE_NAME_`.AliasType;
INSERT INTO `_DATABASE_NAME_`.AliasType (aliasTypeID, shortName) values (1, "Alternate Name");
INSERT INTO `_DATABASE_NAME_`.AliasType (aliasTypeID, shortName) values (2, "Name Change");
INSERT INTO `_DATABASE_NAME_`.AliasType (aliasTypeID, shortName) values (3, "Acronym");

DELETE FROM `_DATABASE_NAME_`.ContactRole;
INSERT INTO `_DATABASE_NAME_`.ContactRole (shortName) values ("Accounting");
INSERT INTO `_DATABASE_NAME_`.ContactRole (shortName) values ("Licensing");
INSERT INTO `_DATABASE_NAME_`.ContactRole (shortName) values ("Sales");
INSERT INTO `_DATABASE_NAME_`.ContactRole (shortName) values ("Support");
INSERT INTO `_DATABASE_NAME_`.ContactRole (shortName) values ("Training");

DELETE FROM `_DATABASE_NAME_`.Country;
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Afghanistan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Albania");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Algeria");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("American Samoa");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Andorra");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Angola");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Anguilla");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Antarctica");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Antigua and Barbuda");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Argentina");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Armenia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Aruba");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Ascension Island");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Australia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Austria");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Azerbaijan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Bahrain");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Bangladesh");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Barbados");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Belarus");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Belgium");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Belize");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Benin");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Bermuda");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Bhutan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Bolivia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Bosnia and Herzegowina");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Botswana");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Bouvet Island");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Brazil");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("British Indian Ocean Territory");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Brunei");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Bulgaria");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Burkina Faso");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Burundi");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Cambodia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Cameroon");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Canada");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Cape Verde");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Central African Republic");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Chad");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Channel Islands, Guernsey");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Channel Islands, Jersey");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Chile");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("China");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Christmas Island");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Cocos (Keeling) Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Colombia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Comoros");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Congo");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Congo, Democratic Republic of");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Cook Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Costa Rica");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Korea, Republic of");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Kuwait");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Kyrgyzstan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Laos");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Latvia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Lebanon");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Lesotho");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Liberia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Libyan Arab Jamahiriya");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Liechtenstein");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Lithuania");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Luxembourg");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Macao");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Macedonia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Madagascar");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Malawi");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Malaysia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Maldives");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Mali");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Malta");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Marshall Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Martinique");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Mauritania");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Mauritius");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Mayotte");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Mexico");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Micronesia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Moldova");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Monaco");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Mongolia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Montenegro");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Montserrat");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Morocco");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Mozambique");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Myanmar");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Namibia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Nauru");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Nepal");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Netherlands Antilles");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Netherlands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("New Caledonia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("New Zealand");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Nicaragua");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Niger");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Nigeria");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Niue");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Norfolk Island");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Northern Mariana Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Norway");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Oman");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Pakistan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Palau");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Panama");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Papua New Guinea");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Paraguay");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Peru");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Philippines");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Pitcairn");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Poland");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Portugal");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Puerto Rico");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Qatar");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Reunion");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Romania");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Russia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Russian Federation");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Rwanda");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Saint Kitts and Nevis");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Saint Lucia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Saint Vincent and the Grenadines");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Samoa");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("San Marino");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Sao Tome and Principe");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Saudi Arabia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Senegal");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Serbia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Seychelles");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Sierra Leone");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Singapore");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Slovakia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Slovenia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Solomon Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Somalia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("South Africa");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("South Georgia and the South Sandwich Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Sovjetunion");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Spain");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Sri Lanka");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("St. Helena");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("St. Pierre and Miquelon");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Sudan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Suriname");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Svalbard and Jan Mayen Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Swaziland");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Sweden");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Switzerland");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Syria");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Taiwan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Tajikistan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Tanzania");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Thailand");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("The Bahamas");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("The Cayman Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Togo");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Tokelau");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Tonga");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Trinidad and Tobago");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Tunisia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Turkey");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Turkmenistan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Turks and Caicos Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Tuvalu");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Uganda");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Ukraine");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("United Arab Emirates");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("United Kingdom");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("United States Minor Outlying Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("United States");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Uruguay");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Uzbekistan");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Vanuatu");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Vatican City State");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Venezuela");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Vietnam");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Virgin Islands (British)");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Virgin Islands (US)");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Wallis and Futuna Islands");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Western Sahara");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Yemen");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Yugoslavia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Zambia");
INSERT INTO `_DATABASE_NAME_`.Country (country) values ("Zimbabwe");


DELETE FROM `_DATABASE_NAME_`.ExternalLoginType;
INSERT INTO `_DATABASE_NAME_`.ExternalLoginType (shortName) values ("Admin");
INSERT INTO `_DATABASE_NAME_`.ExternalLoginType (shortName) values ("FTP");
INSERT INTO `_DATABASE_NAME_`.ExternalLoginType (shortName) values ("Other");
INSERT INTO `_DATABASE_NAME_`.ExternalLoginType (shortName) values ("Statistics");
INSERT INTO `_DATABASE_NAME_`.ExternalLoginType (shortName) values ("Support");


DELETE FROM `_DATABASE_NAME_`.Organization;
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (2, 'Institute of Physics', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (3, 'American Institute of Aeronautics and Astronautics', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (4, 'American Physical Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (5, 'American Society of Civil Engineers', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (6, 'American Insitute of Physics', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (7, 'Society for Industrial and Applied Mathematics', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (8, 'Competitive Media Reporting, LLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (9, 'Chemical Abstracts Service', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (10, 'Risk Management Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (11, 'American Concrete Institute', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (12, 'American Association for Cancer Research', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (13, 'Institution of Engineering and Technology', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (14, 'American Economic Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (15, 'American Mathematical Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (16, 'American Medical Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (18, 'Consejo Superior de Investigaciones Cientificas', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (19, 'American Meteorological Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (20, 'American Library Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (21, 'American Society for Testing and Materials', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (22, 'Association of Research Libraries', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (23, 'American Society of Limnology and Oceanography', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (24, 'Tablet Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (25, 'American Psychological Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (26, 'American Council of Learned Societies', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (27, 'American Association for the Advancement of Science', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (28, 'Thomson Healthcare and Science', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (29, 'Elsevier', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (30, 'JSTOR', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (31, 'SAGE Publications', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (32, 'American Geophysical Union', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (33, 'Annual Reviews', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (34, 'BioOne', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (35, 'Gale', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (36, 'Wiley', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (37, 'Oxford University Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (38, 'Springer', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (39, 'Taylor and Francis', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (40, 'Stanford University', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (41, 'University of California Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (42, 'EBSCO Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (43, 'Blackwell Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (44, 'Ovid', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (45, 'Project Muse', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (46, 'American Fisheries Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (47, 'Neilson Journals Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (48, 'GuideStar USA, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (49, 'Alexander Street Press, LLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (50, 'Informa Healthcare USA, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (51, 'ProQuest LLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (52, 'Accessible Archives Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (53, 'ACCU Weather Sales and Services, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (54, 'Adam Matthew Digital Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (55, 'Akademiai Kiado', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (56, 'World Trade Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (57, 'World Scientific', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (58, 'Walter de Gruyter', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (59, 'Cambridge University Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (60, 'GeoScienceWorld', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (61, 'IEEE', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (62, 'Yankelovich Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (63, 'Nature Publishing Group', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (64, 'Verlag der Zeitschrift fur Naturforschung ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (65, 'White Horse Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (66, 'Verlag C.H. Beck', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (67, 'Vault, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (68, 'Value Line, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (69, 'Vanderbilt University', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (70, 'Uniworld Business Publications, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (71, 'Universum USA', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (72, 'University of Wisconsin Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (73, 'University of Virginia Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (74, 'University of Toronto Press Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (75, 'University of Toronto', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (76, 'University of Pittsburgh', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (77, 'University of Illinois Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (78, 'University of Chicago Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (79, 'University of Barcelona', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (80, 'UCLA Chicano Studies Research Center Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (81, 'Transportation Research Board', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (82, 'Trans Tech Publications', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (83, 'Thomas Telford Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (84, 'Thesaurus Linguae Graecae', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (85, 'Tetrad Computer Applications Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (86, 'Swank Motion Pictures, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (87, 'Standard and Poor\'s', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (88, 'SPIE', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (89, 'European Society of Endocrinology', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (90, 'Society of Environmental Toxicology and Chemistry', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (91, 'Society of Antiquaries of Scotland', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (92, 'Society for Reproduction and Fertility', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (93, 'Society for Neuroscience', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (94, 'Society for Leukocyte Biology', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (95, 'Society for General Microbiology', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (96, 'Society for Experimental Biology and Medicine', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (97, 'Society for Endocrinology', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (98, 'Societe Mathematique de France', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (99, 'Social Explorer', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (404, 'SETAC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (101, 'Swiss Chemical Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (102, 'Scholarly Digital Editions', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (103, 'Royal Society of London', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (104, 'Royal Society of Chemistry', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (105, 'Roper Center for Public Opinion Research', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (106, 'Rockefeller University Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (107, 'Rivista di Studi italiani', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (108, 'Reuters Loan Pricing Corporation', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (109, 'Religious and Theological Abstracts, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (110, 'Psychoanalytic Electronic Publishing Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (111, 'Cornell University Library', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (112, 'Preservation Technologies LP', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (113, 'Portland Press Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (114, 'ITHAKA', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (115, 'Philosophy Documentation Center', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (116, 'Peeters Publishers', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (117, 'Paratext', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (118, 'Mathematical Sciences Publishers', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (119, 'Oxford Centre of Hebrew and Jewish Studies', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (120, 'NewsBank, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (121, 'Massachusetts Medical Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (122, 'Naxos Digital Services Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (123, 'National Research Council of Canada', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (124, 'National Gallery Company Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (125, 'National Academy of Sciences', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (126, 'Mintel International Group Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (127, 'Metropolitan Opera', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (128, 'M.E. Sharpe, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (129, 'Mergent, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (130, 'Mediamark Research and Intelligence, LLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (131, 'Mary Ann Liebert, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (132, 'MIT Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (133, 'MarketResearch.com, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (134, 'Marine Biological Laboratory', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (135, 'W.S. Maney and Son Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (136, 'Manchester University Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (137, 'Lord Music Reference Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (138, 'Liverpool University Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (139, 'Seminario Matematico of the University of Padua', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (140, 'Library of Congress, Cataloging Distribution Service', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (141, 'LexisNexis', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (142, 'Corporacion Latinobarometro', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (143, 'Landes Bioscience', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (144, 'Keesings Worldwide, LLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (145, 'Karger', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (146, 'John Benjamins Publishing Company', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (147, 'Irish Newspaper Archives Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (148, 'IPA Source, LLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (149, 'International Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (150, 'Intelligence Research Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (151, 'Intellect', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (152, 'InteLex', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (153, 'Institute of Mathematics of the Polish Academy of Sciences', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (154, 'Ingentaconnect', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (155, 'INFORMS', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (156, 'Information Resources, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (157, 'Indiana University Mathematics Journal', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (158, 'Incisive Media Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (159, 'Idea Group Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (160, 'IBISWorld USA', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (161, 'H.W. Wilson Company', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (162, 'University of Houston Department of Mathematics', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (163, 'Histochemical Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (164, 'Morningstar Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (165, 'Paradigm Publishers', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (166, 'HighWire Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (167, 'Heldref Publications', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (168, 'Haworth Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (417, 'Thomson Legal', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (170, 'IOS Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (171, 'Agricultural Institute of Canada', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (172, 'Allen Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (173, 'H1 Base, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (175, 'Global Science Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (176, 'Geographic Research, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (177, 'Genetics Society of America', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (178, 'Franz Steiner Verlag', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (179, 'Forrester Research, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (180, 'Federation of American Societies for Experimental Biology', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (181, 'Faulkner Information Services', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (182, 'ExLibris', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (183, 'Brill', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (184, 'Evolutionary Ecology Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (185, 'European Mathematical Society Publishing House', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (186, 'New York Review of Books', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (187, 'Dunstans Publishing Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (188, 'Equinox Publishing Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (189, 'Entomological Society of Canada', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (190, 'American Association of Immunologists, Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (191, 'Endocrine Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (192, 'EDP Sciences', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (193, 'Edinburgh University Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (194, 'Ecological Society of America', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (195, 'East View Information Services', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (196, 'Dun and Bradstreet Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (197, 'Duke University Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (198, 'Digital Distributed Community Archive', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (199, 'Albert C. Muller', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (200, 'Dialogue Foundation', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (201, 'Dialog', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (202, 'Current History, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (203, 'CSIRO Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (204, 'CQ Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (205, 'Japan Focus', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (206, 'Carbon Disclosure Project', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (207, 'University of Buckingham Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (208, 'Boopsie, INC.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (209, 'Company of Biologists Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (210, 'Chronicle of Higher Education', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (211, 'CCH Incorporated', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (212, 'CareerShift LLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (213, 'Canadian Mathematical Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (214, 'Cambridge Crystallographic Data Centre', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (215, 'CABI Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (216, 'Business Monitor International', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (217, 'Bureau of National Affairs, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (218, 'Bulletin of the Atomic Scientists', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (219, 'Brepols Publishers', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (220, 'R.R. Bowker', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (221, 'Botanical Society of America', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (222, 'BMJ Publishing Group Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (223, 'BioMed Central', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (224, 'Berkeley Electronic Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (225, 'Berghahn Books', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (226, 'Berg Publishers', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (227, 'Belser Wissenschaftlicher Dienst Ltd', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (228, 'Beilstein', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (229, 'Barkhuis Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (230, 'Augustine Institute', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (231, 'Asempa Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (232, 'ARTstor Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (233, 'Applied Probability Trust', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (234, 'Antiquity Publications Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (235, 'Ammons Scientific Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (236, 'American Statistical Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (237, 'American Society of Tropical Medicine and Hygiene', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (238, 'American Society of Plant Biologists', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (239, 'Teachers College Record', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (240, 'American Society of Agronomy', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (241, 'American Society for Nutrition', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (242, 'American Society for Horticultural Science', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (243, 'American Society for Clinical Investigation', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (244, 'American Society for Cell Biology', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (245, 'American Psychiatric Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (246, 'American Phytopathological Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (247, 'American Physiological Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (248, 'Encyclopaedia Britannica Online', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (249, 'Agricultural History Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (250, 'Begell House, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (251, 'Hans Zell Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (252, 'Alliance for Children and Families', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (253, 'Robert Blakemore', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (254, 'IVES Group, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (255, 'Massachusetts Institute of Technology', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (256, 'Marquis Who\'s Who LLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (257, 'Atypon Systems Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (258, 'Worldwatch Institute', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (259, 'Thomson Financial', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (260, 'Digital Heritage Publishing Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (261, 'U.S. Department of Commerce', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (262, 'Lipper Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (263, 'Chiniquy Collection', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (264, 'OCLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (265, 'Consumer Electronics Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (267, 'Institutional Shareholder Services Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (268, 'KLD Research and Analytics Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (269, 'BIGresearch LLC', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (270, 'Cambridge Scientific Abstracts', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (271, 'American Institute of Certified Public Accountants', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (272, 'Terra Scientific Publishing Company', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (273, 'American Counseling Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (274, 'Army Times Publishing Company', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (275, 'Librairie Droz', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (276, 'American Academy of Religion', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (277, 'Boyd Printing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (278, 'Canadian Association of African Studies', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (279, 'Experian Marketing Solutions, Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (280, 'Centro de Investigaciones Sociologicas', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (281, 'Chorus America', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (282, 'College Art Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (283, 'Human Kinetics Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (288, 'NERL', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (293, 'Colegio de Mexico', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (294, 'University of Iowa', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (295, 'Academy of the Hebrew Language', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (296, 'FamilyLink.com, Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (297, 'SISMEL - Edizioni del Galluzzo', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (301, 'Informaworld', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (302, 'ScienceDirect', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (304, 'China Data Center', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (305, 'Association for Computing Machinery', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (306, 'American Chemical Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (307, 'Design Research Publications', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (308, 'ABC-CLIO', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (311, 'American Association on Intellectual and Developmental Disabilities ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (310, 'American Antiquarian Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (312, 'American Society for Microbiology', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (314, 'American Society of Mechanical Engineers', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (315, 'Now Publishers, Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (316, 'Cabell Publishing Company, Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (317, 'Center for Research Libraries', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (318, 'American National Biography', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (321, 'Erudit ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (322, 'American Institute of Mathematical Sciences', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (324, 'American Sociological Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (325, 'Archaeological Institute of America', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (326, 'Bertrand Russell Research Centre', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (328, 'Cork University Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (329, 'College Publishing', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (330, 'Council for Learning Disabilities', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (331, 'International Society on Hypertension in Blacks (ISHIB)', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (332, 'Firenze University Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (333, 'History of Earth Sciences Society', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (334, 'History Today Ltd.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (335, 'Journal of Music', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (336, 'University of Nebraska at Omaha', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (337, 'Journal of Indo-European Studies', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (338, 'Library Binding Institute', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (339, 'McFarland & Co. Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (340, 'Lyrasis', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (341, 'Amigos Library Services', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (343, 'Fabrizio Serra Editore', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (344, 'Aux Amateurs', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (346, 'National Affairs, Inc', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (357, 'Society of Chemical Industry', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (347, 'New Criterion', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (348, 'Casa Editrice Leo S. Olschki s.r.l.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (349, 'Rhodes University, Department of Philosophy', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (350, 'Rocky Mountain Mathematics Consortium', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (352, 'Royal Irish Academy', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (353, 'Chadwyck-Healey', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (354, 'CSA illumina', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (355, 'New School for Social Research', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (356, 'Society of Biblical Literature', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (358, 'Stazione Zoologica Anton Dohrn', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (359, 'BioScientifica Ltd.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (360, 'CASALINI LIBRI', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (361, 'Institute of Organic Chemistry', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (362, 'Columbia International Affairs Online ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (363, 'Corporation for National Research Initiatives ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (364, 'Tilgher-Genova', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (365, 'Emerald Group Publishing Limited', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (366, 'Geological Society of America', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (367, 'Institute of Mathematical Statistics', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (368, 'Institute of Pure and Applied Physics', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (369, 'JSTAGE', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (370, 'Metapress', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (371, 'Modern Language Association', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (372, 'Optical Society of America', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (373, 'University of British Columbia', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (374, 'University of New Mexico', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (375, 'Vandenhoeck & Ruprecht', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (376, 'Verlag Mohr Siebeck GmbH & Co. KG', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (377, 'Palgrave Macmillan', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (378, 'Vittorio Klostermann', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (379, 'Project Euclid', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (380, 'Psychonomic Society ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (411, 'Cengage Learning', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (382, 'Infotrieve', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (383, 'Society of Automotive Engineers', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (384, 'Turpion Publications', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (385, 'ACM Digital Library', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (386, 'Lawrence Erlbaum Associates', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (387, 'Alphagraphics', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (388, 'Bellerophon Publications, Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (389, 'Boydell & Brewer Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (390, 'Carcanet Press', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (391, 'Feminist Studies', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (393, 'Dustbooks', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (394, 'Society for Applied Anthropology ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (395, 'United Nations Publications', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (396, 'Wharton Research Data Services', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (398, 'Human Development', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (399, 'infoUSA Marketing, Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (400, 'Bowker', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (402, 'Brown University', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (401, 'Women Writers Project', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (403, 'TNS Media Intelligence', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (405, 'Oldenbourg Wissenschaftsverlag ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (406, 'Dow Jones', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (412, 'Financial Information Inc. (FII)', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (408, 'Jackson Publishing and Distribution', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (409, 'Elsevier Engineering Information, Inc. ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (410, 'Eneclann Ltd.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (413, 'UCLA Latin American Institute', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (414, 'Harmonie Park Press ', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (415, 'Harrassowitz', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (416, 'Thomson Reuters', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (418, 'Human Relations Area Files, Inc.', now(), 'system');
INSERT INTO `_DATABASE_NAME_`.Organization (organizationID, name, createDate, createLoginID ) values (419, 'Society for Ethnomusicology', now(), 'system');

DELETE FROM `_DATABASE_NAME_`.OrganizationHierarchy;
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (28, 416);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (35, 411);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (43, 36);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (168, 39);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (259, 416);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (270, 51);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (301, 39);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (302, 29);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (353, 51);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (354, 270);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (370, 42);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (401, 402);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (406, 51);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (409, 29);
INSERT INTO `_DATABASE_NAME_`.OrganizationHierarchy (organizationID, parentOrganizationID) values (417, 416);



DELETE FROM `_DATABASE_NAME_`.OrganizationRole;
INSERT INTO `_DATABASE_NAME_`.OrganizationRole (shortName) values ("Consortia");
INSERT INTO `_DATABASE_NAME_`.OrganizationRole (shortName) values ("Library");
INSERT INTO `_DATABASE_NAME_`.OrganizationRole (shortName) values ("Platform");
INSERT INTO `_DATABASE_NAME_`.OrganizationRole (shortName) values ("Provider");
INSERT INTO `_DATABASE_NAME_`.OrganizationRole (shortName) values ("Publisher");
INSERT INTO `_DATABASE_NAME_`.OrganizationRole (shortName) values ("Vendor");

DELETE FROM `_DATABASE_NAME_`.Privilege;
INSERT INTO `_DATABASE_NAME_`.Privilege (privilegeID, shortName) values (1, "admin");
INSERT INTO `_DATABASE_NAME_`.Privilege (privilegeID, shortName) values (2, "add/edit");
INSERT INTO `_DATABASE_NAME_`.Privilege (privilegeID, shortName) values (3, "view only");

DELETE FROM `_DATABASE_NAME_`.State;
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Alabama");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Alaska");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("American Samoa");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Arizona");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Arkansas");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("California");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Colorado");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Connecticut");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Delaware");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("District of Columbia");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Florida");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Georgia");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Guam");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Hawaii");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Idaho");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Illinois");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Indiana");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Iowa");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Kansas");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Kentucky");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Louisiana");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Maine");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Maryland");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Massachusetts");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Michigan");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Minnesota");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Mississippi");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Missouri");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Montana");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Nebraska");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Nevada");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("New Hampshire");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("New Jersey");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("New Mexico");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("New York");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("North Carolina");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("North Dakota");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Northern Marianas Islands");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Ohio");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Oklahoma");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Oregon");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Pennsylvania");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Puerto Rico");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Rhode Island");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("South Carolina");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("South Dakota");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Tennessee");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Texas");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Utah");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Vermont");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Virgin Islands");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Virginia");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Washington");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("West Virginia");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Wisconsin");
INSERT INTO `_DATABASE_NAME_`.State (state) values ("Wyoming");


DELETE FROM `_DATABASE_NAME_`.Contact;
DELETE FROM `_DATABASE_NAME_`.ContactRoleProfile;
DELETE FROM `_DATABASE_NAME_`.ExternalLogin;
DELETE FROM `_DATABASE_NAME_`.IssueLog;
DELETE FROM `_DATABASE_NAME_`.OrganizationRoleProfile;