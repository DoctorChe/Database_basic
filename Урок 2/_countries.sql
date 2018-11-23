-- CREATE TABLE IF NOT EXISTS `_countries` (
-- `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- `title` VARCHAR(150) NOT NULL
-- );

ALTER TABLE `country` RENAME TO `_countries`;
ALTER TABLE `_countries` CHANGE `name` `title` VARCHAR(150) NOT NULL;
ALTER TABLE `_countries` DROP COLUMN `capital`;
ALTER TABLE `_countries` ADD INDEX `title_ind`(`title`);
ALTER TABLE `_countries` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
