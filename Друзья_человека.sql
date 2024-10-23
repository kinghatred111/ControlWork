-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Окт 23 2024 г., 06:01
-- Версия сервера: 9.1.0
-- Версия PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Друзья_человека`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Все_животные`
--

CREATE TABLE `Все_животные` (
  `id` int NOT NULL DEFAULT '0',
  `имя` varchar(50) DEFAULT NULL,
  `команда` varchar(50) DEFAULT NULL,
  `дата_рождения` date DEFAULT NULL,
  `источник` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Все_животные`
--

INSERT INTO `Все_животные` (`id`, `имя`, `команда`, `дата_рождения`, `источник`) VALUES
(1, 'Собака', 'Сидеть', '2022-01-01', 'Домашние'),
(2, 'Кошка', 'Лежать', '2021-05-15', 'Домашние'),
(3, 'Хомяк', 'Бегать', '2023-03-10', 'Домашние'),
(1, 'Лошадь', 'Тянуть', '2020-07-20', 'Вьючные'),
(3, 'Осел', 'Нести', '2022-02-14', 'Вьючные');

-- --------------------------------------------------------

--
-- Структура таблицы `Вьючные_животные`
--

CREATE TABLE `Вьючные_животные` (
  `id` int NOT NULL,
  `имя` varchar(50) DEFAULT NULL,
  `команда` varchar(50) DEFAULT NULL,
  `дата_рождения` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Вьючные_животные`
--

INSERT INTO `Вьючные_животные` (`id`, `имя`, `команда`, `дата_рождения`) VALUES
(1, 'Лошадь', 'Тянуть', '2020-07-20'),
(3, 'Осел', 'Нести', '2022-02-14');

-- --------------------------------------------------------

--
-- Структура таблицы `Домашние_животные`
--

CREATE TABLE `Домашние_животные` (
  `id` int NOT NULL,
  `имя` varchar(50) DEFAULT NULL,
  `команда` varchar(50) DEFAULT NULL,
  `дата_рождения` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Домашние_животные`
--

INSERT INTO `Домашние_животные` (`id`, `имя`, `команда`, `дата_рождения`) VALUES
(1, 'Собака', 'Сидеть', '2022-01-01'),
(2, 'Кошка', 'Лежать', '2021-05-15'),
(3, 'Хомяк', 'Бегать', '2023-03-10');

-- --------------------------------------------------------

--
-- Структура таблицы `Молодые_животные`
--

CREATE TABLE `Молодые_животные` (
  `id` int NOT NULL DEFAULT '0',
  `имя` varchar(50) DEFAULT NULL,
  `команда` varchar(50) DEFAULT NULL,
  `дата_рождения` date DEFAULT NULL,
  `возраст` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Молодые_животные`
--

INSERT INTO `Молодые_животные` (`id`, `имя`, `команда`, `дата_рождения`, `возраст`) VALUES
(3, 'Осел', 'Нести', '2022-02-14', 32),
(1, 'Собака', 'Сидеть', '2022-01-01', 33),
(2, 'Кошка', 'Лежать', '2021-05-15', 41),
(3, 'Хомяк', 'Бегать', '2023-03-10', 19);

-- --------------------------------------------------------

--
-- Структура таблицы `Объединенные_животные`
--

CREATE TABLE `Объединенные_животные` (
  `id` int NOT NULL DEFAULT '0',
  `имя` varchar(50) DEFAULT NULL,
  `команда` varchar(50) DEFAULT NULL,
  `дата_рождения` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Объединенные_животные`
--

INSERT INTO `Объединенные_животные` (`id`, `имя`, `команда`, `дата_рождения`) VALUES
(1, 'Лошадь', 'Тянуть', '2020-07-20'),
(3, 'Осел', 'Нести', '2022-02-14'),
(1, 'Собака', 'Сидеть', '2022-01-01'),
(2, 'Кошка', 'Лежать', '2021-05-15'),
(3, 'Хомяк', 'Бегать', '2023-03-10');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Вьючные_животные`
--
ALTER TABLE `Вьючные_животные`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Домашние_животные`
--
ALTER TABLE `Домашние_животные`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Вьючные_животные`
--
ALTER TABLE `Вьючные_животные`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Домашние_животные`
--
ALTER TABLE `Домашние_животные`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
