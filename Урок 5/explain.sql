EXPLAIN `employees`;
EXPLAIN SELECT * FROM `employees` WHERE `salary` = (SELECT MIN(`salary`) FROM `employees`);
EXPLAIN SELECT COUNT(`id`) FROM `employees` WHERE `department` = 1;
