CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`Alias` (
  `aliasID` int(11) NOT NULL auto_increment,
  `organizationID` int(11) default NULL,
  `aliasTypeID` int(11) default NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY  (`aliasID`),
  UNIQUE KEY `aliasID` (`aliasID`),
  KEY `organizationID` (`organizationID`),
  KEY `aliasTypeID` (`aliasTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`AliasType` (
  `aliasTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`aliasTypeID`),
  UNIQUE KEY `aliasTypeID` (`aliasTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`Contact` (
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


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`ContactRole` (
  `contactRoleID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`contactRoleID`),
  UNIQUE KEY `contactRoleID` (`contactRoleID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`ContactRoleProfile` (
  `contactID` int(10) unsigned NOT NULL,
  `contactRoleID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`contactID`,`contactRoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`ExternalLoginType` (
  `externalLoginTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`externalLoginTypeID`),
  UNIQUE KEY `externalLoginTypeID` (`externalLoginTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`IssueLog` (
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

CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`IssueLogType` (
  `issueLogTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`issueLogTypeID`),
  UNIQUE KEY `issueLogTypeID` (`issueLogTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`OrganizationHierarchy` (
  `organizationID` int(11) NOT NULL,
  `parentOrganizationID` int(11) NOT NULL,
  PRIMARY KEY  (`organizationID`,`parentOrganizationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`OrganizationRole` (
  `organizationRoleID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`organizationRoleID`),
  UNIQUE KEY `organizationRoleID` (`organizationRoleID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`OrganizationRoleProfile` (
  `organizationID` int(11) NOT NULL,
  `organizationRoleID` int(11) NOT NULL,
  PRIMARY KEY  (`organizationID`,`organizationRoleID`),
  KEY `organizationRoleID` (`organizationRoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`Privilege` (
  `privilegeID` int(10) unsigned NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  USING BTREE (`privilegeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS  `_DATABASE_NAME_`.`User` (
  `loginID` varchar(50) NOT NULL,
  `privilegeID` int(11) default NULL,
  `firstName` varchar(50) default NULL,
  `lastName` varchar(50) default NULL,
  `accountTabIndicator` int(1) unsigned default '0',
  PRIMARY KEY  USING BTREE (`loginID`),
  KEY `roleID` USING BTREE (`privilegeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
