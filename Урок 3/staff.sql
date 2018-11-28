-- База данных «Сотрудники»:

CREATE TABLE `id8011357_staff`.`employees` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`firstname` VARCHAR(25) NOT NULL , 
	`lastname` VARCHAR(25) NOT NULL , 
	`salary` INT NOT NULL , 
	`department` INT NOT NULL , 
	PRIMARY KEY (`id`)
	) ENGINE = InnoDB;

CREATE TABLE `id8011357_staff`.`departments` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`title` VARCHAR(50) NOT NULL , 
	PRIMARY KEY (`id`)
	) ENGINE = InnoDB;
ALTER TABLE `employees` CHANGE `department` `department` INT(11) NULL;

ALTER TABLE `employees` 
ADD CONSTRAINT `fk_emp_dep_id` FOREIGN KEY (`department`) REFERENCES `departments`(`id`) 
ON DELETE RESTRICT 
ON UPDATE CASCADE;

INSERT INTO `departments` (`title`)
VALUES 
('ЭТО'),
('ОА'),
('СО');

INSERT INTO `employees` (`firstname`, `lastname`, `salary`, `department`)
VALUES 
('Андрей','Семёнов','60000','1'),
('Семён','Андреев','45000',NULL),
('Владимир','Кочетов','65000','2'),
('Мария','Иванова','50000','3'),
('Василий','Иванов','50000','1'),
('Иван','Андреев','55000','3'),
('Иван','Васильев','60000','2');

-- Выбрать среднюю зарплату по отделам.

SELECT AVG(E.`salary`), D.`title` FROM `employees` E 
LEFT JOIN `departments` D 
ON (D.`id` = E.`department`) 
WHERE E.`department` IS NOT NULL 
GROUP BY `department`;

-- Выбрать максимальную зарплату у сотрудника.

SELECT CONCAT(`firstname`, ' ', `lastname`) AS 'ФИО', MAX(`salary`) FROM `employees`;

-- Удалить одного сотрудника, у которого максимальная зарплата.

-- DELETE FROM `employees` WHERE `salary` = (SELECT MAX(`salary`) FROM `employees`);
-- не работает

-- DELETE FROM `employees` WHERE `id` IS NOT NULL ORDER BY `salary`  DESC LIMIT 1;
DELETE FROM `employees`
WHERE `id` IS NOT NULL
AND `salary` = (SELECT * FROM (SELECT MAX(`salary`) FROM `employees` LIMIT 1) AS `temp1`);

-- Посчитать количество сотрудников во всех отделах.

SELECT D.`title` AS 'Отдел', COUNT(E.`id`) AS 'Кол-во сотрудников' FROM `employees` E 
LEFT JOIN `departments` D 
ON (D.`id` = E.`department`) 
WHERE E.`department` IS NOT NULL 
GROUP BY `department`;

-- Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.

SELECT D.`title` AS 'Отдел', COUNT(E.`id`) AS 'Кол-во сотрудников', SUM(E.`salary`) AS 'Фонд ЗП'
FROM `employees` E
LEFT JOIN `departments` D 
ON (D.`id` = E.`department`) 
WHERE E.`department` IS NOT NULL 
GROUP BY `department`;