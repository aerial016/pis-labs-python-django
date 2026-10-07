PRAGMA foreign_keys = ON;
BEGIN;
INSERT INTO articles_article (title, text, created_date, author_id)
VALUES ('Архив статей', 'Представление archive получает статьи из базы данных и передаёт их шаблону. Страница показывает заголовок, автора, дату и сокращённый текст каждой статьи. Эта запись добавлена через SQLite после создания архива.', date('now'), 1);
COMMIT;
