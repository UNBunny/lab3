-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 11 2023 г., 21:22
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `users`
--

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'nikitakuharchuk07@gmail.com', 'pbkdf2:sha256:260000$k5AxjYZod4z3mNpO$9c0b631be66f13bd05c8fd1b7e25b7e400f6a79bf7214daa1ec990c414743d3b'),
(2, '12', 'pbkdf2:sha256:260000$dIJueoYCUU0F4kWS$4744db83610b47a5c452452e700312db8462150b9337893f7fc4b1546e330015'),
(3, 'sha256', 'pbkdf2:sha256:260000$B6ccyocZHHKFP2Xz$4ecc64f954fc25d76659269cedbeb51671bcef3af590545e371708cbc909145a'),
(4, '123321', 'pbkdf2:sha256:260000$55Z03zBM94wnBPaG$03b8ab379b8048f661871c5636e8cd38f37d69c826dc19b8d3cb4f698f3d414a'),
(9, '1', 'pbkdf2:sha256:260000$tzc9sfWwnQYBYFKx$71355f8335792b1591d2cecd3764890b53c18fc23825bd974da6cc6b95f5e57b'),
(10, 'a', 'pbkdf2:sha256:260000$wZHVkziwQkAAf7gl$4e3c3c4c9523e2544500f9099a334f355a3647b9065e7d97e1f9c609e6b29685'),
(11, 'q', 'pbkdf2:sha256:260000$mVAQmg0K1v7z4dCS$d205a2aa1ec73ecad92c2191295f909bcc4a0515692b51a6d227522d4b245661');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
