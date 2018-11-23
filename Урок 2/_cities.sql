-- CREATE TABLE IF NOT EXISTS `_cities` (
-- `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- `country_id` INT NOT NULL,
-- `important` TINYINT(1) NOT NULL,
-- `region_id` INT NOT NULL,
-- `title` VARCHAR(150) NOT NULL
-- );

ALTER TABLE `city` RENAME TO `_cities`;

ALTER TABLE `_cities` ADD COLUMN `country_id` INT NOT NULL AFTER `id`;
ALTER TABLE `_cities` ADD COLUMN `important` TINYINT(1) NOT NULL AFTER `country_id`;
ALTER TABLE `_cities` CHANGE `region` `region_id`;
ALTER TABLE `_cities` CHANGE `name` `title` VARCHAR(150) AFTER `region_id`;
ALTER TABLE `_cities` DROP COLUMN `district`;
ALTER TABLE `_cities` DROP COLUMN `population`;
ALTER TABLE `_cities` ADD INDEX `title_ind`(`title`);


ALTER TABLE `_cities` ADD CONSTRAINT `fk_country_id` FOREIGN KEY (`country_id`)
REFERENCES `_countries`(`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE `_cities` ADD CONSTRAINT `fk_region_id` FOREIGN KEY (`region_id`)
REFERENCES `_regions`(`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;