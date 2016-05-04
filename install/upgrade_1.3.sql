ALTER TABLE  `IssueLog` ADD  `issueLogTypeID` INT NULL AFTER  `organizationID` ;
ALTER TABLE  `IssueLog` CHANGE  `issueDate`  `issueStartDate` DATE NULL DEFAULT NULL ;
ALTER TABLE  `IssueLog` ADD  `issueEndDate` DATE NULL AFTER  `issueStartDate` ;
CREATE INDEX `issueLogTypeId` ON `IssueLog` (`issueLogTypeID` ) ;

CREATE TABLE IF NOT EXISTS  `IssueLogType` (
  `issueLogTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`issueLogTypeID`),
  UNIQUE KEY `issueLogTypeID` (`issueLogTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


--ALTER DATABASE `_DATABASE_NAME_` CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `Alias` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `AliasType` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `Contact` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `ContactRole` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `ContactRoleProfile` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `ExternalLogin` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `ExternalLoginType` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `IssueLog` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `IssueLogType` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `Organization` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `OrganizationHierarchy` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `OrganizationRole` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `OrganizationRoleProfile` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `Privilege` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER TABLE `User` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
