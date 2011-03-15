




ALTER TABLE `_DATABASE_NAME_`.`Contact` 
ADD COLUMN `addressText` varchar(300) default NULL AFTER `title`;


UPDATE `_DATABASE_NAME_`.`Contact` SET addressText = CONCAT(state, ", ", country)
WHERE state <> '' AND country <> '';

UPDATE `_DATABASE_NAME_`.`Contact` SET addressText = CONCAT(state, country)
WHERE ((state <> '') OR (country <>'')) AND addressText IS NULL;


ALTER TABLE `_DATABASE_NAME_`.`Contact`
DROP COLUMN state,
DROP COLUMN country;



ALTER TABLE `_DATABASE_NAME_`.`User` 
ADD COLUMN `accountTabIndicator` int(1) unsigned default '0' AFTER `lastName`;


