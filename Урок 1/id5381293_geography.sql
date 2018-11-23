-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 20 2018 г., 12:22
-- Версия сервера: 10.1.31-MariaDB
-- Версия PHP: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `id5381293_geography`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `region` int(11) NOT NULL,
  `district` int(11) DEFAULT NULL,
  `population` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `name`, `region`, `district`, `population`) VALUES
(3, 'Успенка', 4, 4, 3972),
(4, 'Павлодар', 4, NULL, 334697),
(5, 'Барнаул', 1, NULL, 632372),
(6, 'Новосибирск', 2, NULL, 1612833),
(7, 'Убинское', 2, 6, 5375),
(8, 'Ермолаевка', 2, 6, 408);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `capital` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `name`, `capital`) VALUES
(1, 'Россия', 'Москва'),
(3, 'Казахстан', 'Астана');

-- --------------------------------------------------------

--
-- Структура таблицы `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `region` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `district`
--

INSERT INTO `district` (`id`, `name`, `region`) VALUES
(1, 'Шетский район', 3),
(2, 'Улытауский район', 3),
(3, 'Павлодарский район', 4),
(4, 'Успенский район', 4),
(5, 'Чановский район', 2),
(6, 'Убинский район', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `region`
--

INSERT INTO `region` (`id`, `name`, `country`) VALUES
(1, 'Алтайский край', 1),
(2, 'Новосибирская область', 1),
(3, 'Карагандинская область', 3),
(4, 'Павлодарская область', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `city_name` (`name`),
  ADD KEY `region` (`region`),
  ADD KEY `district` (`district`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country_name` (`name`);

--
-- Индексы таблицы `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `district_name` (`name`),
  ADD KEY `region` (`region`);

--
-- Индексы таблицы `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `region_name` (`name`),
  ADD KEY `country` (`country`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`id`),
  ADD CONSTRAINT `city_ibfk_2` FOREIGN KEY (`district`) REFERENCES `district` (`id`);

--
-- Ограничения внешнего ключа таблицы `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`id`);

--
-- Ограничения внешнего ключа таблицы `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
