-- Количество сотрудников по отделам
CREATE VIEW `count_employees` AS
	SELECT D.`title` AS 'Отдел', COUNT(E.`id`) AS 'Кол-во сотрудников' FROM `employees` E 
	LEFT JOIN `departments` D 
	ON (D.`id` = E.`department`) 
	WHERE E.`department` IS NOT NULL 
	GROUP BY `department`;


-- Количество сотрудников и фонд ЗП по отделам
CREATE VIEW `ФЗП` AS
	SELECT D.`title` AS 'Отдел', COUNT(E.`id`) AS 'Кол-во сотрудников', SUM(E.`salary`) AS 'Фонд ЗП'
	FROM `employees` E
	LEFT JOIN `departments` D 
	ON (D.`id` = E.`department`) 
	WHERE E.`department` IS NOT NULL 
	GROUP BY `department`;

SELECT * FROM `count_employees`;
SELECT * FROM `ФЗП`;