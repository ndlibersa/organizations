CREATE TABLE IF NOT EXISTS `Alias` (
  `aliasID` int(11) NOT NULL auto_increment,
  `organizationID` int(11) default NULL,
  `aliasTypeID` int(11) default NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY  (`aliasID`),
  UNIQUE KEY `aliasID` (`aliasID`),
  KEY `organizationID` (`organizationID`),
  KEY `aliasTypeID` (`aliasTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `AliasType` (
  `aliasTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`aliasTypeID`),
  UNIQUE KEY `aliasTypeID` (`aliasTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `Contact` (
  `contactID` int(11) NOT NULL auto_increment,
  `organizationID` int(11) NOT NULL,
  `lastUpdateDate` date default NULL,
  `name` varchar(150) default NULL,
  `title` varchar(150) default NULL,
  `addressText` varchar(300) default NULL,
  `phoneNumber` varchar(50) default NULL,
  `altPhoneNumber` varchar(50) default NULL,
  `faxNumber` varchar(50) default NULL,
  `emailAddress` varchar(100) default NULL,
  `archiveDate` date default NULL,
  `noteText` text,
  PRIMARY KEY  (`contactID`),
  UNIQUE KEY `contactID` (`contactID`),
  KEY `organizationID` (`organizationID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `ContactRole` (
  `contactRoleID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`contactRoleID`),
  UNIQUE KEY `contactRoleID` (`contactRoleID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `ContactRoleProfile` (
  `contactID` int(10) unsigned NOT NULL,
  `contactRoleID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`contactID`,`contactRoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `ExternalLogin` (
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `ExternalLoginType` (
  `externalLoginTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`externalLoginTypeID`),
  UNIQUE KEY `externalLoginTypeID` (`externalLoginTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `IssueLog` (
  `issueLogID` int(11) NOT NULL auto_increment,
  `organizationID` int(11) default NULL,
  `issueLogTypeID` int(11) default NULL,
  `updateDate` date default NULL,
  `updateLoginID` varchar(50) default NULL,
  `issueStartDate` date default NULL,
  `issueEndDate` date default NULL,
  `noteText` text,
  PRIMARY KEY  (`issueLogID`),
  UNIQUE KEY `issueLogID` (`issueLogID`),
  KEY `organizationID` (`organizationID`),
  KEY `issueLogTypeID` (`issueLogTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `IssueLogType` (
  `issueLogTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`issueLogTypeID`),
  UNIQUE KEY `issueLogTypeID` (`issueLogTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `Organization` (
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `OrganizationHierarchy` (
  `organizationID` int(11) NOT NULL,
  `parentOrganizationID` int(11) NOT NULL,
  PRIMARY KEY  (`organizationID`,`parentOrganizationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `OrganizationRole` (
  `organizationRoleID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`organizationRoleID`),
  UNIQUE KEY `organizationRoleID` (`organizationRoleID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `OrganizationRoleProfile` (
  `organizationID` int(11) NOT NULL,
  `organizationRoleID` int(11) NOT NULL,
  PRIMARY KEY  (`organizationID`,`organizationRoleID`),
  KEY `organizationRoleID` (`organizationRoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `Privilege` (
  `privilegeID` int(10) unsigned NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  USING BTREE (`privilegeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `User` (
  `loginID` varchar(50) NOT NULL,
  `privilegeID` int(11) default NULL,
  `firstName` varchar(50) default NULL,
  `lastName` varchar(50) default NULL,
  `accountTabIndicator` int(1) unsigned default '0',
  PRIMARY KEY  USING BTREE (`loginID`),
  KEY `roleID` USING BTREE (`privilegeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DELETE FROM Alias;
INSERT INTO Alias (organizationID, aliasTypeID, name) values (2, 3, 'IOP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (3, 3, 'AIAA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (4, 3, 'APS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (5, 3, 'ASCE');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (6, 3, 'AIP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (7, 3, 'SIAM');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (9, 3, 'CAS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (10, 3, 'RMA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (11, 3, 'ACI');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (12, 3, 'AACR');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (13, 3, 'IET');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (14, 3, 'AEA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (15, 3, 'AMS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (16, 3, 'AMA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (35, 2, 'Thomson Gale');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (18, 3, 'CSIC');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (19, 3, 'AMS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (20, 3, 'ALA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (21, 3, 'ASTM');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (22, 3, 'ARL');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (23, 3, 'ASLO');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (25, 3, 'APA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (26, 3, 'ACLS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (27, 3, 'AAAS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (265, 3, 'CEA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (141, 3, 'L/N');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (270, 3, 'CSA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (305, 3, 'ACM');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (306, 3, 'ACS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (8, 2, 'Competitive Media Reporting, LLC');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (28, 1, 'Thomson ISI');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (53, 3, 'AccuNet');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (271, 3, 'AICPA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (311, 2, 'American Association on Mental Retardation');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (311, 3, 'AAMR');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (311, 3, 'AAIDD');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (46, 3, 'AFS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (32, 3, 'AGU');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (245, 3, 'APPI');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (244, 3, 'ASCB');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (242, 3, 'ASHS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (312, 3, 'ASM');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (314, 3, 'ASME');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (401, 3, 'WWP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (236, 3, 'ASA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (224, 3, 'BE Press');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (180, 3, 'FASEB');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (177, 3, 'GSA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (163, 3, 'HCS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (134, 3, 'MBL');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (104, 3, 'RSC');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (96, 3, 'SEBM');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (95, 3, 'SGM');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (94, 3, 'SLB');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (93, 3, 'SfN');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (82, 3, 'TTP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (61, 1, 'Institute of Electrical and Electronics Engineers');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (171, 3, 'AIC');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (276, 3, 'AAR');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (273, 3, 'ACA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (322, 3, 'AIMS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (214, 3, 'CCDC');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (362, 3, 'CIAO');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (363, 3, 'CNRI');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (366, 3, 'GSA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (368, 3, 'IPAP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (371, 3, 'MLA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (372, 3, 'OSA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (380, 3, 'PS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (257, 1, 'Atypon Link');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (383, 3, 'SAE');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (41, 1, 'Caliber');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (59, 3, 'CUP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (193, 3, 'EUP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (365, 1, 'Insight');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (386, 3, 'LEA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (372, 1, 'OpticsInfoBase');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (116, 1, 'POJ');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (113, 1, 'Sirius');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (255, 3, 'MIT');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (206, 3, 'CDP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (317, 3, 'CRL');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (88, 1, 'Society of Photo-optical Instrumentation Engineers');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (279, 1, 'Simmons Market Research Bureau');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (404, 1, 'Society of Environmental Toxicology and Chemistry ');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (405, 1, 'oldenbourg-link');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (415, 1, 'Otto Harrassowitz');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (259, 2, 'Thomson RIA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (28, 2, 'Thomson Scientific');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (418, 3, 'HRAF');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (399, 1, 'ReferenceUSA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (254, 1, 'Audit Analytics');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (159, 2, 'Idea Group Inc');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (87, 3, 'S&P');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (422, 1, 'Morgan Stanley Capital International');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (420, 2, 'RiskMetrics Group');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (267, 3, 'ISS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (120, 3, 'Readex');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (425, 1, 'Center for the Advancement of the Research Methods and Analysis');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (305, 1, 'ACM Digital Library');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (426, 3, 'MCLS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (426, 2, 'MLC');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (426, 2, 'Michigan Library Consortia');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (426, 2, 'INCOLSA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (427, 3, 'PLoS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (400, 1, 'R.R. Bowker');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (429, 3, 'UNIDO');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (434, 3, 'BAS');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (35, 1, 'APG: Academic and Professional Group');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (44, 2, 'Silverplatter');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (44, 1, 'OvidSP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (122, 1, 'Naxos Digital Services Ltd');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (37, 3, 'OUP');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (475, 3, 'OECD');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (194, 3, 'ESA');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (173, 1, 'H1Base');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (28, 1, 'ISI');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (484, 1, 'Austrian Academy of Sciences Press');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (485, 3, 'ARM');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (485, 1, 'New World Records');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (490, 1, 'CDI Systems Ltd.');
INSERT INTO Alias (organizationID, aliasTypeID, name) values (399, 2, 'infogroup');




DELETE FROM AliasType;
INSERT INTO AliasType (aliasTypeID, shortName) values (1, "Alternate Name");
INSERT INTO AliasType (aliasTypeID, shortName) values (2, "Name Change");
INSERT INTO AliasType (aliasTypeID, shortName) values (3, "Acronym");

DELETE FROM ContactRole;
INSERT INTO ContactRole (shortName) values ("Accounting");
INSERT INTO ContactRole (shortName) values ("Licensing");
INSERT INTO ContactRole (shortName) values ("Sales");
INSERT INTO ContactRole (shortName) values ("Support");
INSERT INTO ContactRole (shortName) values ("Training");

DELETE FROM ExternalLoginType;
INSERT INTO ExternalLoginType (shortName) values ("Admin");
INSERT INTO ExternalLoginType (shortName) values ("FTP");
INSERT INTO ExternalLoginType (shortName) values ("Other");
INSERT INTO ExternalLoginType (shortName) values ("Statistics");
INSERT INTO ExternalLoginType (shortName) values ("Support");


DELETE FROM Organization;
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (2, 'Institute of Physics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (3, 'American Institute of Aeronautics and Astronautics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (4, 'American Physical Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (5, 'American Society of Civil Engineers', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (6, 'American Insitute of Physics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (7, 'Society for Industrial and Applied Mathematics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (8, 'TNS Media Intelligence', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (9, 'Chemical Abstracts Service', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (10, 'Risk Management Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (11, 'American Concrete Institute', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (12, 'American Association for Cancer Research', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (13, 'Institution of Engineering and Technology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (14, 'American Economic Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (15, 'American Mathematical Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (16, 'American Medical Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (18, 'Consejo Superior de Investigaciones Cientificas', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (19, 'American Meteorological Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (20, 'American Library Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (21, 'American Society for Testing and Materials', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (22, 'Association of Research Libraries', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (23, 'American Society of Limnology and Oceanography', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (24, 'Tablet Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (25, 'American Psychological Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (26, 'American Council of Learned Societies', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (27, 'American Association for the Advancement of Science', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (28, 'Thomson Healthcare and Science', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (29, 'Elsevier', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (30, 'JSTOR', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (31, 'SAGE Publications', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (32, 'American Geophysical Union', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (33, 'Annual Reviews', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (34, 'BioOne', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (35, 'Gale', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (36, 'Wiley', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (37, 'Oxford University Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (38, 'Springer', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (39, 'Taylor and Francis', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (40, 'Stanford University', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (41, 'University of California Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (42, 'EBSCO Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (43, 'Blackwell Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (44, 'Ovid', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (45, 'Project Muse', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (46, 'American Fisheries Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (47, 'Neilson Journals Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (48, 'GuideStar USA, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (49, 'Alexander Street Press, LLC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (50, 'Informa Healthcare USA, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (51, 'ProQuest LLC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (52, 'Accessible Archives Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (53, 'ACCU Weather Sales and Services, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (54, 'Adam Matthew Digital Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (55, 'Akademiai Kiado', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (56, 'World Trade Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (57, 'World Scientific', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (58, 'Walter de Gruyter', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (59, 'Cambridge University Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (60, 'GeoScienceWorld', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (61, 'IEEE', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (62, 'Yankelovich Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (63, 'Nature Publishing Group', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (64, 'Verlag der Zeitschrift fur Naturforschung ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (65, 'White Horse Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (66, 'Verlag C.H. Beck', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (67, 'Vault, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (68, 'Value Line, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (69, 'Vanderbilt University', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (70, 'Uniworld Business Publications, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (71, 'Universum USA', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (72, 'University of Wisconsin Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (73, 'University of Virginia Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (74, 'University of Toronto Press Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (75, 'University of Toronto', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (76, 'University of Pittsburgh', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (77, 'University of Illinois Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (78, 'University of Chicago Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (79, 'University of Barcelona', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (80, 'UCLA Chicano Studies Research Center Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (81, 'Transportation Research Board', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (82, 'Trans Tech Publications', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (83, 'Thomas Telford Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (84, 'Thesaurus Linguae Graecae', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (85, 'Tetrad Computer Applications Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (86, 'Swank Motion Pictures, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (87, 'Standard and Poors', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (88, 'SPIE', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (89, 'European Society of Endocrinology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (90, 'Society of Environmental Toxicology and Chemistry', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (91, 'Society of Antiquaries of Scotland', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (92, 'Society for Reproduction and Fertility', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (93, 'Society for Neuroscience', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (94, 'Society for Leukocyte Biology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (95, 'Society for General Microbiology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (96, 'Society for Experimental Biology and Medicine', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (97, 'Society for Endocrinology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (98, 'Societe Mathematique de France', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (99, 'Social Explorer', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (404, 'SETAC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (101, 'Swiss Chemical Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (102, 'Scholarly Digital Editions', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (103, 'Royal Society of London', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (104, 'Royal Society of Chemistry', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (105, 'Roper Center for Public Opinion Research', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (106, 'Rockefeller University Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (107, 'Rivista di Studi italiani', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (108, 'Reuters Loan Pricing Corporation', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (109, 'Religious and Theological Abstracts, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (110, 'Psychoanalytic Electronic Publishing Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (111, 'Cornell University Library', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (112, 'Preservation Technologies LP', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (113, 'Portland Press Limited', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (114, 'ITHAKA', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (115, 'Philosophy Documentation Center', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (116, 'Peeters Publishers', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (117, 'Paratext', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (118, 'Mathematical Sciences Publishers', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (119, 'Oxford Centre of Hebrew and Jewish Studies', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (120, 'NewsBank, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (121, 'Massachusetts Medical Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (122, 'Naxos of America, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (123, 'National Research Council of Canada', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (124, 'National Gallery Company Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (125, 'National Academy of Sciences', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (126, 'Mintel International Group Limited', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (127, 'Metropolitan Opera', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (128, 'M.E. Sharpe, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (129, 'Mergent, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (130, 'Mediamark Research and Intelligence, LLC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (131, 'Mary Ann Liebert, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (132, 'MIT Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (133, 'MarketResearch.com, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (134, 'Marine Biological Laboratory', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (135, 'W.S. Maney and Son Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (136, 'Manchester University Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (137, 'Lord Music Reference Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (138, 'Liverpool University Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (139, 'Seminario Matematico of the University of Padua', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (140, 'Library of Congress, Cataloging Distribution Service', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (141, 'LexisNexis', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (142, 'Corporacion Latinobarometro', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (143, 'Landes Bioscience', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (144, 'Keesings Worldwide, LLC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (145, 'Karger', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (146, 'John Benjamins Publishing Company', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (147, 'Irish Newspaper Archives Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (148, 'IPA Source, LLC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (149, 'International Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (150, 'Intelligence Research Limited', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (151, 'Intellect', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (152, 'InteLex', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (153, 'Institute of Mathematics of the Polish Academy of Sciences', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (154, 'Ingentaconnect', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (155, 'INFORMS', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (156, 'Information Resources, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (157, 'Indiana University Mathematics Journal', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (158, 'Incisive Media Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (159, 'IGI Global ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (160, 'IBISWorld USA', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (161, 'H.W. Wilson Company', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (162, 'University of Houston Department of Mathematics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (163, 'Histochemical Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (164, 'Morningstar Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (165, 'Paradigm Publishers', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (166, 'HighWire Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (167, 'Heldref Publications', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (168, 'Haworth Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (417, 'Thomson Legal', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (170, 'IOS Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (171, 'Agricultural Institute of Canada', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (172, 'Allen Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (173, 'H1 Base, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (175, 'Global Science Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (176, 'Geographic Research, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (177, 'Genetics Society of America', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (178, 'Franz Steiner Verlag', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (179, 'Forrester Research, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (180, 'Federation of American Societies for Experimental Biology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (181, 'Faulkner Information Services', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (182, 'ExLibris', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (183, 'Brill', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (184, 'Evolutionary Ecology Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (185, 'European Mathematical Society Publishing House', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (186, 'New York Review of Books', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (187, 'Dunstans Publishing Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (188, 'Equinox Publishing Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (189, 'Entomological Society of Canada', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (190, 'American Association of Immunologists, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (191, 'Endocrine Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (192, 'EDP Sciences', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (193, 'Edinburgh University Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (194, 'Ecological Society of America', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (195, 'East View Information Services', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (196, 'Dun and Bradstreet Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (197, 'Duke University Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (198, 'Digital Distributed Community Archive', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (199, 'Albert C. Muller', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (200, 'Dialogue Foundation', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (201, 'Dialog', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (202, 'Current History, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (203, 'CSIRO Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (204, 'CQ Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (205, 'Japan Focus', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (206, 'Carbon Disclosure Project', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (207, 'University of Buckingham Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (208, 'Boopsie, INC.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (209, 'Company of Biologists Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (210, 'Chronicle of Higher Education', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (211, 'CCH Incorporated', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (212, 'CareerShift LLC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (213, 'Canadian Mathematical Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (214, 'Cambridge Crystallographic Data Centre', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (215, 'CABI Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (216, 'Business Monitor International', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (217, 'Bureau of National Affairs, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (218, 'Bulletin of the Atomic Scientists', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (219, 'Brepols Publishers', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (221, 'Botanical Society of America', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (222, 'BMJ Publishing Group Limited', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (223, 'BioMed Central', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (224, 'Berkeley Electronic Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (225, 'Berghahn Books', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (226, 'Berg Publishers', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (227, 'Belser Wissenschaftlicher Dienst Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (228, 'Beilstein Information Systems, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (229, 'Barkhuis Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (230, 'Augustine Institute', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (231, 'Asempa Limited', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (232, 'ARTstor Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (233, 'Applied Probability Trust', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (234, 'Antiquity Publications Limited', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (235, 'Ammons Scientific Limited', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (236, 'American Statistical Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (237, 'American Society of Tropical Medicine and Hygiene', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (238, 'American Society of Plant Biologists', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (239, 'Teachers College Record', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (240, 'American Society of Agronomy', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (241, 'American Society for Nutrition', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (242, 'American Society for Horticultural Science', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (243, 'American Society for Clinical Investigation', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (244, 'American Society for Cell Biology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (245, 'American Psychiatric Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (246, 'American Phytopathological Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (247, 'American Physiological Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (248, 'Encyclopaedia Britannica Online', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (249, 'Agricultural History Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (250, 'Begell House, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (251, 'Hans Zell Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (252, 'Alliance for Children and Families', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (253, 'Robert Blakemore', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (254, 'IVES Group, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (255, 'Massachusetts Institute of Technology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (256, 'Marquis Who\'s Who LLC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (257, 'Atypon Systems Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (258, 'Worldwatch Institute', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (259, 'Thomson Financial', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (260, 'Digital Heritage Publishing Limited', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (261, 'U.S. Department of Commerce', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (262, 'Lipper Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (263, 'Chiniquy Collection', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (264, 'OCLC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (265, 'Consumer Electronics Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (267, 'Institutional Shareholder Services Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (268, 'KLD Research and Analytics Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (269, 'BIGresearch LLC', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (270, 'Cambridge Scientific Abstracts', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (271, 'American Institute of Certified Public Accountants', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (272, 'Terra Scientific Publishing Company', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (273, 'American Counseling Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (274, 'Army Times Publishing Company', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (275, 'Librairie Droz', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (276, 'American Academy of Religion', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (277, 'Boyd Printing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (278, 'Canadian Association of African Studies', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (279, 'Experian Marketing Solutions, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (280, 'Centro de Investigaciones Sociologicas', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (281, 'Chorus America', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (282, 'College Art Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (283, 'Human Kinetics Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (288, 'NERL', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (293, 'Colegio de Mexico', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (294, 'University of Iowa', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (295, 'Academy of the Hebrew Language', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (296, 'FamilyLink.com, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (297, 'SISMEL - Edizioni del Galluzzo', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (301, 'Informaworld', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (302, 'ScienceDirect', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (304, 'China Data Center', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (305, 'Association for Computing Machinery', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (306, 'American Chemical Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (307, 'Design Research Publications', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (308, 'ABC-CLIO', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (311, 'American Association on Intellectual and Developmental Disabilities ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (310, 'American Antiquarian Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (312, 'American Society for Microbiology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (314, 'American Society of Mechanical Engineers', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (315, 'Now Publishers, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (316, 'Cabell Publishing Company, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (317, 'Center for Research Libraries', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (444, 'Cold North Wind Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (321, 'Erudit ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (322, 'American Institute of Mathematical Sciences', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (324, 'American Sociological Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (325, 'Archaeological Institute of America', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (326, 'Bertrand Russell Research Centre', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (328, 'Cork University Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (329, 'College Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (330, 'Council for Learning Disabilities', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (331, 'International Society on Hypertension in Blacks (ISHIB)', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (332, 'Firenze University Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (333, 'History of Earth Sciences Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (334, 'History Today Ltd.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (335, 'Journal of Music', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (336, 'University of Nebraska at Omaha', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (337, 'Journal of Indo-European Studies', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (338, 'Library Binding Institute', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (339, 'McFarland & Co. Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (340, 'Lyrasis', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (341, 'Amigos Library Services', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (343, 'Fabrizio Serra Editore', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (344, 'Aux Amateurs', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (346, 'National Affairs, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (357, 'Society of Chemical Industry', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (347, 'New Criterion', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (348, 'Casa Editrice Leo S. Olschki s.r.l.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (349, 'Rhodes University, Department of Philosophy', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (350, 'Rocky Mountain Mathematics Consortium', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (352, 'Royal Irish Academy', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (353, 'Chadwyck-Healey', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (354, 'CSA illumina', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (355, 'New School for Social Research', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (356, 'Society of Biblical Literature', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (358, 'Stazione Zoologica Anton Dohrn', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (359, 'BioScientifica Ltd.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (360, 'CASALINI LIBRI', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (361, 'Institute of Organic Chemistry', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (362, 'Columbia International Affairs Online ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (363, 'Corporation for National Research Initiatives ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (364, 'Tilgher-Genova', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (365, 'Emerald Group Publishing Limited', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (366, 'Geological Society of America', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (367, 'Institute of Mathematical Statistics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (368, 'Institute of Pure and Applied Physics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (369, 'JSTAGE', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (370, 'Metapress', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (371, 'Modern Language Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (372, 'Optical Society of America', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (373, 'University of British Columbia', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (374, 'University of New Mexico', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (375, 'Vandenhoeck & Ruprecht', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (376, 'Verlag Mohr Siebeck GmbH & Co. KG', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (377, 'Palgrave Macmillan', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (378, 'Vittorio Klostermann', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (379, 'Project Euclid', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (380, 'Psychonomic Society ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (411, 'Cengage Learning', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (382, 'Infotrieve', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (383, 'Society of Automotive Engineers', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (384, 'Turpion Publications', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (426, 'Midwest Collaborative for Library Services', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (386, 'Lawrence Erlbaum Associates', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (387, 'Alphagraphics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (388, 'Bellerophon Publications, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (389, 'Boydell & Brewer Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (390, 'Carcanet Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (391, 'Feminist Studies', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (393, 'Dustbooks', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (394, 'Society for Applied Anthropology ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (395, 'United Nations Publications', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (396, 'Wharton Research Data Services', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (398, 'Human Development', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (399, 'infoUSA Marketing, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (400, 'Bowker', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (402, 'Brown University', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (401, 'Women Writers Project', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (445, 'Coutts', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (446, 'Numara Software, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (447, 'Trinity College Library Dublin', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (405, 'Oldenbourg Wissenschaftsverlag ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (406, 'Dow Jones', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (412, 'Financial Information Inc. (FII)', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (408, 'Jackson Publishing and Distribution', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (409, 'Elsevier Engineering Information, Inc. ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (410, 'Eneclann Ltd.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (413, 'UCLA Latin American Institute', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (414, 'Harmonie Park Press ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (415, 'Harrassowitz', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (416, 'Thomson Reuters', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (418, 'Human Relations Area Files, Inc. ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (432, 'Capital IQ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (419, 'Society for Ethnomusicology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (420, 'MSCI RiskMetrics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (421, 'Rapid Multimedia', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (422, 'MSCI Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (423, 'New England Journal of Medicine', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (424, 'NetLibrary', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (425, 'CARMA', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (427, 'Public Library of Science', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (428, 'Social Science Electronic Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (429, 'United Nations Industrial Develoipment Organization', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (430, 'University of Michigan Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (431, 'ORS Publishing, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (433, 'McGraw-Hill', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (434, 'Biblical Archaeology Society', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (435, 'GeoLytics, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (436, 'JoVE ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (437, 'ICEsoft Technologies, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (438, 'Films Media Group', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (439, 'Films on Demand', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (440, 'Connect Journals', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (441, 'Scuola Normale Superiore', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (442, 'Wolters Kluwer', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (448, 'Pier Professional', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (449, 'ABC News', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (450, 'University of Aberdeen ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (451, 'BullFrog Films, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (453, 'FirstSearch', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (455, 'History Cooperative ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (456, 'Omohundro Institute of Early American History and Culture', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (457, 'Arms Control Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (458, 'Heritage Archives', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (459, 'International Historic Films, Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (460, 'Euromonitor International ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (461, 'Safari Books Online', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (462, 'Mirabile', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (466, 'Publishing Technology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (463, 'SageWorks, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (464, 'Johns Hopkins Universtiy Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (465, 'Knovel ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (467, 'American Society of Nephrology', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (468, 'Water Envrionment Federation ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (469, 'Refworks', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (470, 'Cinemagician Productions', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (471, 'Algorithmics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (472, 'YBP Library Services ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (474, 'Maydream Inc.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (475, 'Organization for Economic Cooperation and Development', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (476, 'The Chronicle for Higher Education', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (477, 'Association for Research in Vision and Ophthalmologie (ARVO)', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (478, 'SRDS Media Solutions', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (479, 'Kantar Media', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (480, 'Peace & Justice Studies Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (481, 'Addison Publications Ltd.', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (482, 'Mutii-Science Publishing', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (483, 'ASM International', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (484, 'Verlag der Osterreichischen Akademie der Wissenschaften', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (485, 'Anthology of Recorded Music', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (486, 'Left Coast Press, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (487, 'Video Data Bank', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (488, 'Atlassian', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (489, 'medici.tv', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (490, 'Bar Ilan Research & Development Company Ltd', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (491, 'Primary Source Media', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (492, 'Ebrary', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (493, 'University of Michigan, Department of Mathematics', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (494, 'StataCorp LP ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (495, 'L\' Enseignement Mathematique  ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (496, 'Audio Engineering Society, Inc', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (497, 'LOCKSS', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (498, 'MUSEEC ', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (499, 'Mortgage Bankers Association', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (500, 'BibleWorks', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (501, 'National Library of Ireland', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (502, 'Scholars Press', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (503, 'Index to Jewish periodicals', NOW(), 'system');
INSERT INTO Organization (organizationID, name, createDate, createLoginID ) values (504, 'Cold Spring Harbor Laboratory Press', NOW(), 'system');



DELETE FROM OrganizationHierarchy;
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (28, 416);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (35, 411);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (43, 36);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (44, 442);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (87, 433);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (154, 466);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (168, 39);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (228, 29);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (259, 416);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (267, 422);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (270, 51);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (301, 39);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (302, 29);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (353, 51);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (354, 270);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (370, 42);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (401, 402);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (406, 51);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (409, 29);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (417, 416);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (420, 422);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (424, 42);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (432, 87);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (439, 438);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (453, 264);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (462, 297);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (469, 270);
INSERT INTO OrganizationHierarchy (organizationID, parentOrganizationID) values (478, 479);



DELETE FROM OrganizationRole;
INSERT INTO OrganizationRole (shortName) values ("Consortium");
INSERT INTO OrganizationRole (shortName) values ("Library");
INSERT INTO OrganizationRole (shortName) values ("Platform");
INSERT INTO OrganizationRole (shortName) values ("Provider");
INSERT INTO OrganizationRole (shortName) values ("Publisher");
INSERT INTO OrganizationRole (shortName) values ("Vendor");

DELETE FROM Privilege;
INSERT INTO Privilege (privilegeID, shortName) values (1, "admin");
INSERT INTO Privilege (privilegeID, shortName) values (2, "add/edit");
INSERT INTO Privilege (privilegeID, shortName) values (3, "view only");

DELETE FROM Contact;
DELETE FROM ContactRoleProfile;
DELETE FROM ExternalLogin;
DELETE FROM IssueLog;
DELETE FROM OrganizationRoleProfile;
