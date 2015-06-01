ALTER TABLE `Contact` 
ADD COLUMN `addressText` varchar(300) default NULL AFTER `title`;

UPDATE `Contact` SET addressText = CONCAT(state, ", ", country)
WHERE state <> '' AND country <> '';

UPDATE `Contact` SET addressText = CONCAT(state, country)
WHERE ((state <> '') OR (country <>'')) AND addressText IS NULL;

ALTER TABLE `Contact`
DROP COLUMN state,
DROP COLUMN country;

ALTER TABLE `User` 
ADD COLUMN `accountTabIndicator` int(1) unsigned default '0' AFTER `lastName`;
