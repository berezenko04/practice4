-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 27 2024 г., 14:28
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
-- База данных: `practice4`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` int NOT NULL,
  `question_id` int DEFAULT NULL,
  `answer` text,
  `answer_value` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer`, `answer_value`) VALUES
(1, 1, 'Скриптова мова загального призначення, особливо підходяща для веб-розробки.', 1),
(2, 1, 'Строго типізована мова програмування.', 0),
(3, 1, 'Мова розмітки гіпертексту.', 0),
(4, 1, 'Мова запитів до бази даних.', 0),
(5, 2, '$variable = значення;', 1),
(6, 2, 'variable: значення;', 0),
(7, 2, 'var variable = значення;', 0),
(8, 2, 'let variable = значення;', 0),
(9, 3, '.', 1),
(10, 3, '+', 0),
(11, 3, '&', 0),
(12, 3, '&&', 0),
(13, 4, 'date(\"Y-m-d H:i:s\")', 1),
(14, 4, 'getDate()', 0),
(15, 4, 'new Date()', 0),
(16, 4, 'datetime.now()', 0),
(17, 5, 'Масив, індексований рядками (іменами ключів).', 1),
(18, 5, 'Масив, індексований числами.', 0),
(19, 5, 'Масив, що містить тільки унікальні значення.', 0),
(20, 5, 'Масив, що зберігає тільки значення одного типу.', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question` text,
  `correct_answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `question`, `correct_answer`) VALUES
(1, 'Що таке PHP?', 'Скриптова мова загального призначення, особливо підходяща для веб-розробки.'),
(2, 'Як оголосити змінну в PHP?', '$variable = значення;'),
(3, 'Який оператор використовується для конкатенації рядків у PHP?', '.'),
(4, 'Як отримати поточну дату і час у PHP?', 'date(\"Y-m-d H:i:s\")'),
(5, 'Що таке асоціативний масив у PHP?', 'Масив, індексований рядками (іменами ключів).');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `email`) VALUES
(1, 'Roman', 'koffld@yahoo.com'),
(3, 'Romeo', 'koffld@yaqoo.com'),
(4, 'Roman', 'koffld@yahoo.com'),
(5, 'Roman', 'koffld@yahoo.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
