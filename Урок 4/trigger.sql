CREATE TABLE `salary` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`wage` INT,
`bonus` INT,
`person_id` INT
);

CREATE TRIGGER `add_person` AFTER INSERT ON `employees`
FOR EACH ROW
INSERT INTO `salary` 
(`bonus`, `person_id`) VALUES 
(NEW.salary / 2, NEW.id);

INSERT INTO `employees` 
(`name`, `lastname`, `salary`, `department`) VALUES
('Тимур','Ровный','45000', 1),
('Антон','Горький','50000', 2);

SELECT * FROM `salary`;