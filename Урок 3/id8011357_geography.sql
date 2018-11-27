-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Ноя 27 2018 г., 12:41
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
-- База данных: `id8011357_geography`
--

-- --------------------------------------------------------

--
-- Структура таблицы `_cities`
--

CREATE TABLE `_cities` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `important` tinyint(1) NOT NULL,
  `region_id` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `_cities`
--

INSERT INTO `_cities` (`id`, `country_id`, `important`, `region_id`, `title`) VALUES
(3, 3, 0, 4, 'Успенка'),
(4, 3, 0, 4, 'Павлодар'),
(5, 1, 0, 1, 'Барнаул'),
(6, 1, 0, 2, 'Новосибирск'),
(7, 1, 0, 2, 'Убинское'),
(8, 1, 0, 2, 'Ермолаевка');

-- --------------------------------------------------------

--
-- Структура таблицы `_countries`
--

CREATE TABLE `_countries` (
  `id` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `_countries`
--

INSERT INTO `_countries` (`id`, `title`) VALUES
(3, 'Казахстан'),
(1, 'Россия');

-- --------------------------------------------------------

--
-- Структура таблицы `_regions`
--

CREATE TABLE `_regions` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `_regions`
--

INSERT INTO `_regions` (`id`, `country_id`, `title`) VALUES
(1, 1, 'Алтайский край'),
(2, 1, 'Новосибирская область'),
(3, 3, 'Карагандинская область'),
(4, 3, 'Павлодарская область');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `_cities`
--
ALTER TABLE `_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_ind` (`title`),
  ADD KEY `fk_city_region_id` (`region_id`),
  ADD KEY `fk_city_country_id` (`country_id`);

--
-- Индексы таблицы `_countries`
--
ALTER TABLE `_countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country_name` (`title`),
  ADD KEY `title_ind` (`title`);

--
-- Индексы таблицы `_regions`
--
ALTER TABLE `_regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_ind` (`title`),
  ADD KEY `fk_country_id` (`country_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `_cities`
--
ALTER TABLE `_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `_countries`
--
ALTER TABLE `_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `_regions`
--
ALTER TABLE `_regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `_cities`
--
ALTER TABLE `_cities`
  ADD CONSTRAINT `fk_city_country_id` FOREIGN KEY (`country_id`) REFERENCES `_countries` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_city_region_id` FOREIGN KEY (`region_id`) REFERENCES `_regions` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `_regions`
--
ALTER TABLE `_regions`
  ADD CONSTRAINT `fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `_countries` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
