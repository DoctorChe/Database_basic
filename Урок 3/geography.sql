SELECT `_cities`.`title`, `_regions`.`title`, `_countries`.`title` FROM `_cities`
LEFT JOIN (`_regions`, `_countries`)
ON( `_regions`.`id` = `_cities`.`region_id` and `_countries`.`id` = `_cities`.`country_id`);

SELECT `title` FROM `_cities`
WHERE `region_id` = (SELECT `id` FROM `_regions` WHERE `title` = 'Новосибирская область');