DROP FUNCTION IF EXISTS	`find_person`;

CREATE FUNCTION `find_person`(`first_name` CHAR(25), `last_name` CHAR(25))
RETURNS INT(11) DETERMINISTIC READS SQL DATA
RETURN (SELECT `id` FROM `employees` WHERE `firstname`=first_name AND `lastname`=last_name);

SELECT `salary` FROM `employees` WHERE `id` = (SELECT `find_person` ('Иван', 'Васильев'));