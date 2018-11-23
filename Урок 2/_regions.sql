-- CREATE TABLE IF NOT EXISTS `_regions` (
-- `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- `country_id` INT NOT NULL,
-- `title` VARCHAR(150) NOT NULL
-- );

ALTER TABLE `region` RENAME TO `_regions`;
ALTER TABLE `_regions` DROP FOREIGN KEY `_regions_ibfk_1`;
ALTER TABLE `_regions` DROP INDEX `country`;
ALTER TABLE `_regions` DROP INDEX `region_name`;
ALTER TABLE `_regions` CHANGE `country` `country_id` INT NOT NULL;
ALTER TABLE `_regions` CHANGE `name` `title` VARCHAR(150) NOT NULL AFTER `country_id`;
ALTER TABLE `_regions` ADD INDEX `title_ind`(`title`);
ALTER TABLE `_regions` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


ALTER TABLE `_regions` ADD CONSTRAINT `fk_country_id` FOREIGN KEY (`country_id`)
REFERENCES `_countries`(`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;