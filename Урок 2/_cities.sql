-- CREATE TABLE IF NOT EXISTS `_cities` (
-- `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- `country_id` INT NOT NULL,
-- `important` TINYINT(1) NOT NULL,
-- `region_id` INT NOT NULL,
-- `title` VARCHAR(150) NOT NULL
-- );

ALTER TABLE `city` RENAME TO `_cities`;
ALTER TABLE `_cities` DROP INDEX `city_name`;
ALTER TABLE `_cities` DROP INDEX `region`;
ALTER TABLE `_cities` DROP INDEX `district`;
ALTER TABLE `_cities` DROP COLUMN `district`;
ALTER TABLE `_cities` DROP COLUMN `population`;
ALTER TABLE `_cities` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `_cities` CHANGE `name` `title` VARCHAR(150) NOT NULL;
ALTER TABLE `_cities` ADD INDEX `title_ind`(`title`);
ALTER TABLE `_cities` CHANGE `region` `region_id` INT(11) NOT NULL AFTER `id`;
ALTER TABLE `_cities` ADD COLUMN `country_id` INT NOT NULL AFTER `id`;
ALTER TABLE `_cities` ADD COLUMN `important` TINYINT(1) NOT NULL AFTER `country_id`;

ALTER TABLE `_cities` ADD CONSTRAINT `fk_city_region_id` FOREIGN KEY (`region_id`)
REFERENCES `_regions`(`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;

UPDATE `_cities` SET `country_id` = '3' WHERE `_cities`.`id` = 3;
UPDATE `_cities` SET `country_id` = '3' WHERE `_cities`.`id` = 4;
UPDATE `_cities` SET `country_id` = '1' WHERE `_cities`.`id` = 5;
UPDATE `_cities` SET `country_id` = '1' WHERE `_cities`.`id` = 6;
UPDATE `_cities` SET `country_id` = '1' WHERE `_cities`.`id` = 7;
UPDATE `_cities` SET `country_id` = '1' WHERE `_cities`.`id` = 8;


ALTER TABLE `_cities` ADD CONSTRAINT `fk_city_country_id` FOREIGN KEY (`country_id`)
REFERENCES `_countries`(`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;