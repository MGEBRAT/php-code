-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 27 2024 г., 23:32
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `market`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Categories`
--

CREATE TABLE `Categories` (
  `id` int NOT NULL,
  `Category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Categories`
--

INSERT INTO `Categories` (`id`, `Category`) VALUES
(2, 'Для улица'),
(3, 'сухари'),
(4, 'хлеб'),
(5, 'печенья'),
(6, 'макароня'),
(8, 'мука'),
(9, 'сахар'),
(10, 'соль');

-- --------------------------------------------------------

--
-- Структура таблицы `chek`
--

CREATE TABLE `chek` (
  `date` date NOT NULL,
  `id_user` int NOT NULL,
  `number_check` int NOT NULL,
  `operation_check` int NOT NULL,
  `name_chek` varchar(50) NOT NULL,
  `inn` int NOT NULL,
  `kkm` int NOT NULL,
  `type_payment` varchar(50) NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `chek`
--

INSERT INTO `chek` (`date`, `id_user`, `number_check`, `operation_check`, `name_chek`, `inn`, `kkm`, `type_payment`, `id`) VALUES
('2024-05-01', 1, 1999, 2, 'цццццц', 214748364, 2147483641, 'карта', 1),
('2024-05-22', 2, 23142, 1, 'цццццц', 2147483642, 2147483641, 'карта', 2),
('2024-05-27', 1, 23143, 3, 'Чек', 123456, 123456, 'Наличка', 4),
('2024-05-27', 1, 23143, 3, 'Чек', 123456, 123456, 'Наличка', 5),
('2024-05-27', 7, 23144, 4, 'Чек', 123456, 123456, 'Наличка', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `Postavka`
--

CREATE TABLE `Postavka` (
  `id` int NOT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Postavka`
--

INSERT INTO `Postavka` (`id`, `name`) VALUES
(2, 'name nam'),
(4, 'name na');

-- --------------------------------------------------------

--
-- Структура таблицы `Privoz`
--

CREATE TABLE `Privoz` (
  `id` int NOT NULL,
  `Postavka_id` int DEFAULT NULL,
  `Product_id` int DEFAULT NULL,
  `ProductCount` int DEFAULT NULL,
  `PostavkaDate` date DEFAULT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Privoz`
--

INSERT INTO `Privoz` (`id`, `Postavka_id`, `Product_id`, `ProductCount`, `PostavkaDate`, `time`) VALUES
(2, 2, 12, 300, '2024-05-29', '02:02:02'),
(4, 2, 11, 40, '2024-03-02', '21:04:23');

-- --------------------------------------------------------

--
-- Структура таблицы `Products`
--

CREATE TABLE `Products` (
  `id` int NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `kolvo` int NOT NULL,
  `CategoryID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Products`
--

INSERT INTO `Products` (`id`, `ProductName`, `price`, `kolvo`, `CategoryID`) VALUES
(11, 'макарошкааа', 99, 102, 6),
(12, 'хлебушек', 20, 60, 4),
(13, 'печенюхаа', 10, 250, 5),
(20, 'мякишь', 222, 1342, 4),
(21, 'печа', 212, 16, 5),
(22, 'сахар соленый', 100, 200, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `Shopping`
--

CREATE TABLE `Shopping` (
  `id` int NOT NULL,
  `UserId` int DEFAULT NULL,
  `ProductId` int DEFAULT NULL,
  `kolvo` int NOT NULL,
  `priezd` tinyint(1) NOT NULL DEFAULT '0',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Shopping`
--

INSERT INTO `Shopping` (`id`, `UserId`, `ProductId`, `kolvo`, `priezd`, `address`, `time`) VALUES
(1, 1, 11, 10, 1, '', '00:00:00.000000'),
(2, 2, 12, 2, 1, '', '00:00:00.000000'),
(3, 1, 11, 1, 0, '1', '21:04:23.000000'),
(4, 1, 11, 2, 0, 'май хаус', '21:04:23.000000'),
(5, 5, 12, 2, 0, 'май хаус', '12:04:23.000000'),
(6, 5, 22, 10, 0, 'май хаус', '21:04:23.000000'),
(7, 5, 20, 11, 0, 'г волгоград хорошш', '21:04:23.000000'),
(8, 5, 21, 12, 0, 'май хаус', '12:04:23.000000'),
(9, 5, 11, 1, 0, 'г волгоград хорошш', '21:04:23.000000'),
(10, 5, 13, 6, 0, 'г волгоград хорошш', '21:04:23.000000'),
(11, 1, 12, 6, 0, 'г волгоград хорошш', '21:04:23.000000'),
(12, 1, 12, 6, 0, 'г волгоград хорошш', '21:04:23.000000'),
(13, 1, 20, 10, 0, 'ЦУ', '21:04:22.000000'),
(14, 1, 20, 10, 0, 'май хаус', '21:04:23.000000'),
(15, 1, 20, 10, 0, '2etrtg', '12:04:23.000000'),
(16, 1, 20, 10, 0, 'г волгоград хорошш', '12:04:23.000000'),
(17, 1, 13, 12, 0, 'славянестан', '21:04:23.000000'),
(18, 1, 20, 10, 0, 'г волгоград хорошш', '21:04:23.000000'),
(19, 1, 13, 12, 0, 'г волгоград хорошш', '21:04:23.000000'),
(20, 1, 12, 3, 0, 'май хаус', '12:04:23.000000'),
(21, 1, 12, 3, 0, 'май хаус', '12:04:23.000000'),
(22, 1, 12, 3, 0, 'май хаус', '21:04:23.000000'),
(23, 1, 12, 3, 0, 'г волгоград хорошш', '12:04:23.000000'),
(24, 1, 12, 3, 0, 'г волгоград хорошш', '12:04:23.000000'),
(25, 1, 12, 3, 0, 'май хаус', '21:04:23.000000'),
(26, 1, 12, 3, 0, 'г волгоград хорошш', '21:04:23.000000'),
(27, 1, 12, 3, 0, 'не уважаю ппх', '21:04:23.000000'),
(28, 1, 12, 3, 0, 'г волгоград хорошш', '21:04:23.000000'),
(29, 7, 12, 20, 0, 'домик на берегу моря', '12:04:23.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id`, `UserName`, `Email`, `password`) VALUES
(1, 'testUser1', 'test@main.ru', '23213'),
(2, 'testUser2', 'test@mail.ry', '123123123'),
(4, 'крутой чел', '123@gmail.com', '12345678'),
(5, 'oleg', 'olegaa@gmail.com', '111111111111111111111111'),
(6, 'oleg', '12322@gmail.com', '123123123'),
(7, '12313', 'olee@gmail.com', '123123'),
(9, 'oleg', 'olegaa@gmail.com', '222'),
(10, '23232', 'olegaa@gmail.com', '232'),
(11, 'gleeeeb', 'gleeb@gmail.com', '123'),
(12, 'olegы', '12322@gmail.com', 'й'),
(13, 'olegы', 'olegaa@gmail.com', '4'),
(14, 'olegы', 'olegaa@gmail.com', '4'),
(15, 'olegыwqe', 'olegaa@gmail.com', '2');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `chek`
--
ALTER TABLE `chek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chek_ibfk_1` (`id_user`);

--
-- Индексы таблицы `Postavka`
--
ALTER TABLE `Postavka`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Privoz`
--
ALTER TABLE `Privoz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Postavka_id` (`Postavka_id`),
  ADD KEY `Product_id` (`Product_id`);

--
-- Индексы таблицы `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Индексы таблицы `Shopping`
--
ALTER TABLE `Shopping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `chek`
--
ALTER TABLE `chek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `Postavka`
--
ALTER TABLE `Postavka`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Privoz`
--
ALTER TABLE `Privoz`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Products`
--
ALTER TABLE `Products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `Shopping`
--
ALTER TABLE `Shopping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `chek`
--
ALTER TABLE `chek`
  ADD CONSTRAINT `chek_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Shopping` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Privoz`
--
ALTER TABLE `Privoz`
  ADD CONSTRAINT `privoz_ibfk_1` FOREIGN KEY (`Postavka_id`) REFERENCES `Postavka` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `privoz_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `Products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Shopping`
--
ALTER TABLE `Shopping`
  ADD CONSTRAINT `shopping_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shopping_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
