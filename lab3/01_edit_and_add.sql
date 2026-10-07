PRAGMA foreign_keys = ON;
BEGIN;
UPDATE articles_article
SET text = 'Python — язык программирования для создания приложений и обработки данных. В первой лабораторной работе выполнены запуск Hello world и фильтрация студентов по средней оценке. Текст этой статьи исправлен через SQLite.'
WHERE id = 1;
UPDATE articles_article
SET title = 'Создание web-страницы в Django'
WHERE id = 2;
INSERT INTO articles_article (title, text, created_date, author_id)
VALUES ('Работа с SQLite', 'SQLite хранит данные проекта в одном файле. Команды UPDATE исправляют существующие записи, а INSERT добавляет новые. Автор статьи должен существовать в таблице пользователей Django.', date('now'), 1);
COMMIT;
