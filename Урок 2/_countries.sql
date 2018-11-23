-- CREATE TABLE IF NOT EXISTS `_countries` (
-- `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- `title` VARCHAR(150) NOT NULL
-- );

ALTER TABLE `country` RENAME TO `_countries`;
-- ALTER TABLE `_countries` ADD COLUMN `title` VARCHAR(150) AFTER `id`;
ALTER TABLE `_countries` CHANGE `name` `title` VARCHAR(150);
ALTER TABLE `_countries` DROP COLUMN `capital`;
ALTER TABLE `_countries` ADD INDEX `title_ind`(`title`);