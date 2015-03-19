ALTER TABLE  `IssueLog` ADD  `issueLogTypeId` INT NULL AFTER  `organizationID` ;
ALTER TABLE  `IssueLog` CHANGE  `issueDate`  `issueStartDate` DATE NULL DEFAULT NULL ;
ALTER TABLE  `IssueLog` ADD  `issueEndDate` DATE NULL AFTER  `issueStartDate` ;
CREATE INDEX `issueLogTypeId` ON `IssueLog` (`issueLogTypeId` ) ;

CREATE TABLE IF NOT EXISTS  `IssueLogType` (
  `issueLogTypeID` int(11) NOT NULL auto_increment,
  `shortName` varchar(50) default NULL,
  PRIMARY KEY  (`issueLogTypeID`),
  UNIQUE KEY `issueLogTypeID` (`issueLogTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;




